Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79F747AF5F;
	Tue,  1 Sep 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258558; cv=none; b=ZKwZp9R7qSGNcRBR/BISTqqpf+Tr5dL5M0TBznfCocLjzFpBSQbre+Mlf4uNkanYLKAJ5CUqmOjY476YBmAXVWcFI0lM3UCPJ83wIU4YkEDhUKiObXQaPmg6mHJFWlIu3W6Ge45Pl7lNmp1LMbvy9TLmJp/j2hEI6Ooo2vTj6zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258558; c=relaxed/simple;
	bh=2bwsVS73ftdNFM2Okf+JM1I40RefIS4dKh7P1t9yANY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOj/ZkiqM0JsEGuZH8EfMH3erj81cxy+3DISco8MwD++XpZcn3A8mtNEDajb/zuK7gjPThoavs6jDEYx/beqtvm/1nCiuHWaNlrC50XKqVyJpck+fZyWCo1FfiffMALRmeF000+AP5oC+AN/xKUhd+6sn9g0HqlFDM++8Fj0idI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=dRgEbPo3; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="dRgEbPo3"
Received: by chaosmail.tech (Postfix) id 2772C1CA013;
	Tue, 01 Sep 2026 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788258548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1ZT8E0+Pm5VDx4LcOMCqD5baN3Oe5eOsk0bsRrW/zs=;
	b=dRgEbPo3e++yE5N0mg2CXTOUgj40HjsSmEQ5oNo8Wi+yIblxdWd7udoLIYtUUEEeOUbrWJ
	rmo3PuiMrJiAiYXXI9KxmWli8vCDG7dWZQruTSni3bbKeq1tOX4+SQhGrgsD0JaEMRSkaJ
	WGq7gHGK9S1p8TrdUyo8wR7GTHTC7Gs=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 01 Sep 2026 12:29:03 +0200
Subject: [PATCH v9 4/6] spmi: apple: Implement remaining commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-t603x-spmi-v9-4-09e702e3b153@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
In-Reply-To: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788258545; l=6582;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=RH6K223nJdTsq2zsNyub+vrfUTvair8i/u/7LCuGT1E=;
 b=Tmt8ts5mjAcq19Wuptk3dZmywj2uzNQeFN7WRJX9W0A1Vih66V+kThPjSFHxTiVb/6VkAWYUY
 p4q7FzKbWD+B/EUyMa55jZ1FwElEKpA8YVPx+dY8W1C1xpVjyNkt9Gz
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Add support for zero write and power management commands.

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 116 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------
 1 file changed, 69 insertions(+), 47 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index b1c127cf5f44..9843dc871d6c 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -46,9 +46,9 @@ struct apple_spmi {
 	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
 			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
 
-static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 saddr, size_t len)
+static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
 {
-	return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);
+	return opc | sid << 8 | (u32)param << 16 | (1 << 15);
 }
 
 /* Wait for Rx FIFO to have something */
@@ -69,14 +69,13 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	return 0;
 }
 
-static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			 u16 saddr, u8 *buf, size_t len)
+static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u16 param,
+			const u8 *buf_wr, size_t len_wr, u8 *buf_rd, size_t len_rd)
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
-	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
+	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, param);
 	u32 reply, rsp;
-	size_t len_read = 0;
-	u8 i;
+	size_t i = 0, j;
 	int ret;
 
 	if (spmi->prev_fail) {
@@ -86,6 +85,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
+	while (i < len_wr) {
+		j = min_t(size_t, sizeof(spmi_cmd), len_wr - i);
+		spmi_cmd = 0;
+		memcpy(&spmi_cmd, buf_wr + i, j);
+		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+		i += j;
+	}
+
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
 		return ret;
@@ -93,7 +100,8 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
-	while (len_read < len) {
+	i = 0;
+	while (i < len_rd) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			spmi->prev_fail = true;
 			dev_err_ratelimited(&ctrl->dev,
@@ -101,11 +109,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 			return -EIO;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
-		i = 0;
-		while ((len_read < len) && (i < 4)) {
-			buf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
-			i += 1;
-		}
+		j = min_t(size_t, sizeof(spmi_cmd), len_rd - i);
+		memcpy(buf_rd + i, &rsp, j);
+		i += j;
 	}
 
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
@@ -113,54 +119,69 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		spmi->prev_fail = true;
 	}
 
-	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {
+	if (!len_rd && !FIELD_GET(SPMI_REPLY_ACK, reply)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
+	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len_rd) - 1)) {
 		dev_err(&ctrl->dev, "some frames failed parity check\n");
 		return -EIO;
 	}
 	return 0;
 }
 
-static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			  u16 saddr, const u8 *buf, size_t len)
+/* Send a raw command with 1..16 input data frames */
+static int spmi_raw_cmd_input(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 param, u8 *buf, size_t len)
 {
-	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
-	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
-	u32 reply;
-	size_t i = 0, j;
-	int ret;
-
-	if (spmi->prev_fail) {
-		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
-		spmi->prev_fail = false;
-	}
-
-	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+	return spmi_raw_cmd(ctrl, opc, sid, param, NULL, 0, buf, len);
+}
 
-	while (i < len) {
-		j = 0;
-		spmi_cmd = 0;
-		while ((j < 4) & (i < len))
-			spmi_cmd |= buf[i++] << (j++ * 8);
+/* Send a raw command with (optional) body and an input ACK */
+static int spmi_raw_cmd_ack(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			  u16 param, const u8 *buf, size_t len)
+{
+	return spmi_raw_cmd(ctrl, opc, sid, param, buf, len, NULL, 0);
+}
 
-		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 saddr, u8 *buf, size_t len)
+{
+	switch (opc) {
+	case SPMI_CMD_EXT_READ:
+	case SPMI_CMD_EXT_READL:
+		return spmi_raw_cmd_input(ctrl, opc | (len - 1), sid, saddr, buf, len);
+	case SPMI_CMD_READ:
+		return spmi_raw_cmd_input(ctrl, opc | saddr, sid, saddr, buf, len);
 	}
+	return -EINVAL;
+}
 
-	ret = apple_spmi_wait_rx_not_empty(ctrl);
-	if (ret)
-		return ret;
-
-	reply = readl(spmi->regs + SPMI_RSP_REG);
-
-	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
-		dev_warn(&ctrl->dev, "FIFO has extra data\n");
-		spmi->prev_fail = true;
+static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			  u16 saddr, const u8 *buf, size_t len)
+{
+	switch (opc) {
+	case SPMI_CMD_WRITE:
+		return spmi_raw_cmd_ack(ctrl, opc | saddr, sid, buf[0] << 8 | saddr, NULL, 0);
+	case SPMI_CMD_ZERO_WRITE:
+		return spmi_raw_cmd_ack(ctrl, opc | buf[0], sid, buf[0] << 8 | saddr, NULL, 0);
+	case SPMI_CMD_EXT_WRITE:
+	case SPMI_CMD_EXT_WRITEL:
+		return spmi_raw_cmd_ack(ctrl, opc | (len - 1), sid, saddr, buf, len);
 	}
+	return -EINVAL;
+}
 
-	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
-		dev_err(&ctrl->dev, "command not acknowledged\n");
-		return -EIO;
+static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
+{
+	switch (opc) {
+	case SPMI_CMD_RESET:
+	case SPMI_CMD_SLEEP:
+	case SPMI_CMD_SHUTDOWN:
+	case SPMI_CMD_WAKEUP:
+		return spmi_raw_cmd_ack(ctrl, opc, sid, 0, NULL, 0);
 	}
-	return 0;
+	return -EINVAL;
 }
 
 static int apple_spmi_probe(struct platform_device *pdev)
@@ -183,6 +204,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
+	ctrl->cmd = spmi_cmd;
 
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)

-- 
2.55.0

