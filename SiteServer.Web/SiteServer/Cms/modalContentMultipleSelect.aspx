<%@ Page Language="C#" Inherits="SiteServer.BackgroundPages.Cms.ModalContentMultipleSelect" %>
  <%@ Register TagPrefix="ctrl" Namespace="SiteServer.BackgroundPages.Controls" Assembly="SiteServer.BackgroundPages" %>
    <!DOCTYPE html>
    <html class="modalPage">

    <head>
      <meta charset="utf-8">
      <!--#include file="../inc/head.html"-->
      <script type="text/javascript">
        $(document).ready(function () {
          loopRows(document.getElementById('contents'), function (cur) {
            cur.onclick = chkSelect;
          });
          $(".popover-hover").popover({
            trigger: 'hover',
            html: true
          });
        });
      </script>
    </head>

    <body>
      <form runat="server">
        <ctrl:alerts runat="server" />

        <div class="form-horizontal">

          <div class="well well-small">
            <table class="table table-noborder">
              <tr>
                <td>
                  栏目：
                  <asp:DropDownList ID="DdlNodeId" AutoPostBack="true" OnSelectedIndexChanged="Search_OnClick" runat="server"></asp:DropDownList>
                  <asp:CheckBox ID="CbIsDuplicate" class="checkbox checkbox-primary" Text="包含重复标题" runat="server"></asp:CheckBox>
                </td>
              </tr>
              <tr>
                <td>
                  时间：从
                  <ctrl:DateTimeTextBox id="TbDateFrom" class="input-small" Columns="12" runat="server" /> &nbsp;到&nbsp;
                  <ctrl:DateTimeTextBox id="TbDateTo" class="input-small" Columns="12" runat="server" /> 目标：
                  <asp:DropDownList ID="DdlSearchType" class="input-small" runat="server"> </asp:DropDownList>
                  关键字：
                  <asp:TextBox id="TbKeyword" MaxLength="500" Size="37" runat="server" />
                  <asp:Button class="btn" OnClick="Search_OnClick" id="Search" text="搜 索" runat="server" />
                </td>
              </tr>
            </table>
          </div>

          <table id="contents" class="table table-bordered table-hover">
            <tr class="info thead">
              <td width="120">栏目</td>
              <td>标题(点击查看) </td>
              <td width="20"></td>
            </tr>
            <asp:Repeater ID="RptContents" runat="server">
              <itemtemplate>
                <tr>
                  <td>
                    <asp:Literal ID="ltlChannel" runat="server"></asp:Literal>
                  </td>
                  <td>
                    <asp:Literal ID="ltlTitle" runat="server"></asp:Literal>
                  </td>
                  <td class="center">
                    <asp:Literal ID="ltlSelect" runat="server"></asp:Literal>
                  </td>
                </tr>
              </itemtemplate>
            </asp:Repeater>
          </table>

          <ctrl:sqlPager id="SpContents" runat="server" class="table table-pager" />

          <hr />

          <div class="form-group m-b-0">
            <div class="col-xs-11 text-right">
              <asp:Button class="btn btn-primary m-l-10" text="确 定" runat="server" onClick="Submit_OnClick" />
              <button type="button" class="btn btn-default m-l-10" onclick="window.parent.layer.closeAll()">取 消</button>
            </div>
            <div class="col-xs-1"></div>
          </div>

        </div>

      </form>
    </body>

    </html>