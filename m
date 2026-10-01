Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC339488D97;
	Thu,  1 Oct 2026 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886933; cv=none; b=Tzjx1p5PkdVw/1bNylkjbzz6Wz1sBdxsAr1u6xn8cEngHuY6QQtuf36NpX92fKJ1FSYOjtYKDXwLdN2WqwWopNGmUg8GT1LZ4NINHhmqJaJGFdBhUcCw7pt7sxr8IeZUMIEGQJQ+CQsK3VXkjrkoC2auZoecGWHLALiJAmj/ZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886933; c=relaxed/simple;
	bh=6OqlLgbwT3A+zqyYXf5DfSfc4ts3mlhzwvgwzdupCBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mf2S80xkIPwsWihGkpuy2HOvwU0SSF6XWGYVsGiia7f6CKiz/aBHBnuqcNKLyc2P4xefzyUlqM42vIMIKLhc64F7FE0LFTko/CaYxEfM1AJbg1wxfEMh6kYxPCQlgTxZAAgQDTo0xTlgLxqqYJLPYdHPgOHG/TFOoZ6G9btRmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=d+MWTNfI; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="d+MWTNfI"
Received: by chaosmail.tech (Postfix) id CEF2A1C8DE2;
	Thu, 01 Oct 2026 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1790886423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoxLjw+FaEv6UBa2auRBgAVGOoEFVhZL0a0SozhjcLw=;
	b=d+MWTNfIKo8GefYq0Bvxb62IzB+/BeUxL+vCZ/C24u12eMVRTaejPzAgZZLNmmHSdXyIWC
	fhLQsrm0pRpyYZE1XpFnl88lJFatKA9dykYhxEknxYR2tUD0JZok1sHE7/sPxktvmRoZgT
	nd87dWWMaOi6Gj/zFP5yNtd69rP1F0Q=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 01 Oct 2026 22:26:57 +0200
Subject: [PATCH v10 2/6] spmi: apple: Validate FIFO state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-t603x-spmi-v10-2-ff815c66c73f@chaosmail.tech>
References: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
In-Reply-To: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790886421; l=3000;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=D9GL2Z01e0tzF0XHDaJ4oJIv+24UCKbgdDmyLz2zBJU=;
 b=RvIjH00Ek0X/H7h2YVz1+9eGgsoApPVw35WjZybP+yOXvTpvmCZ5XgOGpCnTXYuFnRQ5JBGQ7
 zWQoM+TdvqzBd5wdf61ZI7nm406xhi8JDDDj23CCEFScbAQKIhmV0Yw
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for data before reading the body of a reply, and check for
end of data afterwards.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..15721cb41d5c 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -21,7 +21,9 @@
 #define SPMI_STATUS_REG 0
 #define SPMI_CMD_REG 0x4
 #define SPMI_RSP_REG 0x8
+#define SPMI_ACT_REG 0xa4
 
+#define SPMI_ACT_FIFO_FLUSH BIT(0)
 #define SPMI_RX_FIFO_EMPTY BIT(24)
 
 #define REG_POLL_INTERVAL_US 10000
@@ -29,6 +31,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	bool prev_fail;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -49,6 +52,7 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 
 	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
 	if (ret) {
+		spmi->prev_fail = true;
 		dev_err(&ctrl->dev,
 			"failed to wait for RX FIFO not empty\n");
 		return ret;
@@ -67,6 +71,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	u8 i;
 	int ret;
 
+	if (spmi->prev_fail) {
+		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
+		spmi->prev_fail = false;
+	}
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
@@ -78,6 +87,12 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			spmi->prev_fail = true;
+			dev_err_ratelimited(&ctrl->dev,
+					    "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +101,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+		spmi->prev_fail = true;
+	}
+
 	return 0;
 }
 
@@ -97,6 +117,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	if (spmi->prev_fail) {
+		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
+		spmi->prev_fail = false;
+	}
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -115,6 +140,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+		spmi->prev_fail = true;
+	}
+
 	return 0;
 }
 

-- 
2.55.0

