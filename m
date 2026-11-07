Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083801;
	b=XZaBx1WHSIcAN5NUxbePYqqnPC8oHNsBPZwtKRJ5vSgx7l9xdoFM5wSD69Etx2RY+N/W
	 4ggPpW/BqCsquurGjNwGoxMR/bLBwjovK31CrvpUDNiTah36sxxr96c1qCI08o5cKxkKh
	 LbAFKZ/lYNiDoKjt7Fxrbzv6UGm0FZei+98AClwbL6T05wgt+ZAXieJ67Z6F6I6qRaAX9
	 gdkwL7sBI0TAEQXESqIIgH75BED28oiZWpFFIAM5QHcKhWhkJoT5T+iv2nBq/CGyOlziK
	 Z5elTlyoVgwxVRBZLv8u7iy6qJIncMh0Wj2Ix0UpqwVaMmpgDJ1VF7Igg5V9+Pdjm9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083801;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=FkFd7TKWgMjIsFNMGTPgFQ0StfWcI7jn1PY3vxfnCxs=;
	b=e+COVTjD1+PKUxgr+2yePBHykR/aL26rgbh1TFWkaE3Xq7eI8EBvvBc1oBbRrkN958Ic
	 jnZtFaMp3MncNR3RuDI1nFqbFVj4OvruYkKuieJRtMoIrxajhA+RezKmufxbhEwrWJzch
	 XWnUMIH+ejteyUZvhFdjjXrdaMpIkI2HAcoYlRW25Cabf8fzdf6NMCW9NzDS1NSFqk+J3
	 8JpVSWOELbnqA4ghZJCzxNNa4ahs7itYn8Zl59MC/omYcjo9ACJJnsy0gXPwYH1PbyyQW
	 cSshUpCe9vQUjvvsS/Qu3oc49gbul0dTPktzyHOEccs3XQMCvM2haDosXqqgX//F5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=vadHFqrl;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC3606A334;
	Sat,  7 Nov 2026 20:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEC3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=vadHFqrl
Received: by chaosmail.tech (Postfix) id A95891CA44E;
	Sat, 07 Nov 2026 20:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FkFd7TKWgMjIsFNMGTPgFQ0StfWcI7jn1PY3vxfnCxs=;
	b=vadHFqrlj20/vA/covwJiXICeoTEtjOI4b5pu1HUqdlSn6AA8We27FzRgdr+QxTZwZwec3
	1/uL6Oc1kKPf+qf+VNN8CfMB2lUYjZw103owVqccvAZG4UAA11E62SKrio2/6AZW2nMB/n
	IgjcTpKXF8Hc/EiwIF3vx8Qc6kNf/BQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 07 Nov 2026 21:36:26 +0100
Subject: [PATCH v11 4/6] spmi: apple: Implement remaining commands
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-t603x-spmi-v11-4-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
In-Reply-To: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=6501;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=WKJCpyMHFSp7rHljwGHUTr+S5V1bT3Q1Nv8Eh3I+1W8=;
 b=7vKqauIDMP3IybT7e0UZqfe5fpiiaWspubeD6Ip/VDotD28kCeyxnXVLApaH4Sr2N0BV6n15C
 U1fF44aLKLVCSZMI9vi6KwuntotLA7lh1G/5HCd87Z8ZfngS3qSky3e
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Add support for zero write and power management commands.

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 116 +++++++++++++++++++++--------------
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
2.56.0

