Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083800;
	b=Tpfc/JhoaKOSn/KRRhUMz9eu92KploQqU7lMQAdMxy9WNnHoHaS+fop0VWNgQCDSpFDF
	 krhafgTYH8A0IDtyNwBaX6eAnb8Jzd13NMmgRIeiysptaLDBLSSNw+n7wSW995K+CVULT
	 k7UJQpDqlnZN5j/HRm9DwBgU8O5ptWBzkXVC9yscs4KwEgcDzTR8iI0snApBJ0xldM7hO
	 DCGqRiyXUek+jCPg002kh7GOsZx6Z4hokcCJC7H/OCHgCBAFJNGUFZ7itFMq/ctKQpGIw
	 7frzPdXwH1siHDbFvxv8Xzzjwjkbx8ejAiy+erX1gmsZCLh8A6eaqCOBh9y3iQiL2gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083800;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=pmVpqXBh0EQReQpzMkQij7yQ7M/157eNKQELdj9xlpw=;
	b=qKjzHD17PkSmDJND/WyQ+pH8jBykdwaAcVjdJSujXpqwWNYE3bNv3jHQZF1V8Qj3P3fj
	 pCIvx3FRt92HMz/bcyK6DxAGiLmn05/mXnkJO6Q8bD51GdprmoPSaBTgz4kRSTGiNsoJe
	 JtGc9xy/sf3RNGJ/sHQZ5toS5xErfTDEnm4/hpxRa/3D2Ryll7DPcIdMwgL3ZZIEz8poB
	 WiWHZBcA4nI5FmYQ0MpHgdoXFgt2FyNcHqOQUrY02v6eQ9Eu7B3K836WvYqhMNWT75GHB
	 HchhUa4dOp8jNs4m8p8rck8+1+SIL+6/Vyqf12+xk5RhCFJ+2mXaew7ireI86CEC4bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=kzuo46wT;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56587606A32E;
	Sat,  7 Nov 2026 20:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56587606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=kzuo46wT
Received: by chaosmail.tech (Postfix) id E10A41CA434;
	Sat, 07 Nov 2026 20:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmVpqXBh0EQReQpzMkQij7yQ7M/157eNKQELdj9xlpw=;
	b=kzuo46wTs6fxKAjlaKDOrrX5E7nURvnOnSO1bHBurkvM/9coeyXoUZnxVYV0gF+YVNNZLn
	OqXpsQt8RA6ZEa2Gc546NCfdwzigqPiKOpp8fbHRgd6hvY0AY72GXr5TAFeJBtI5MgEKEA
	tr+uAR9z8qUceILdklL6ba3rjfj1Gis=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 07 Nov 2026 21:36:25 +0100
Subject: [PATCH v11 3/6] spmi: apple: check transaction status
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
Message-Id: <20261107-t603x-spmi-v11-3-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
In-Reply-To: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=2846;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=TOu0Tnyr3yHEtxYKkCkDEHBXiZZ2HGJnyVFvoFjIBVI=;
 b=Maygj4r6AmqD8LmjQer82FG2YhScRq86EX2JAgHuqwjJQhJrkPgZhFuj4z9fF4ecqNLnTpJ2W
 4tEONRba0dYDhIRtJVwjXNwqwkkXM5Y/jwHS2MGASs73UlNHHXsvv/x
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for parity errors and missing command ACKs.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 15721cb41d5c..b1c127cf5f44 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -11,6 +11,8 @@
  *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -23,6 +25,12 @@
 #define SPMI_RSP_REG 0x8
 #define SPMI_ACT_REG 0xa4
 
+/* SPMI_RSP_REG reply word */
+#define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
+#define SPMI_REPLY_ACK BIT(15)
+#define SPMI_REPLY_SLAVE_ID GENMASK(14, 8)
+#define SPMI_REPLY_CMD GENMASK(7, 0)
+
 #define SPMI_ACT_FIFO_FLUSH BIT(0)
 #define SPMI_RX_FIFO_EMPTY BIT(24)
 
@@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
-	u32 rsp;
+	u32 reply, rsp;
 	size_t len_read = 0;
 	u8 i;
 	int ret;
@@ -82,8 +90,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard SPMI reply status */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
@@ -106,6 +113,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		spmi->prev_fail = true;
 	}
 
+	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {
+		dev_err(&ctrl->dev, "some frames failed parity check\n");
+		return -EIO;
+	}
 	return 0;
 }
 
@@ -114,6 +125,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
+	u32 reply;
 	size_t i = 0, j;
 	int ret;
 
@@ -137,14 +149,17 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 		spmi->prev_fail = true;
 	}
 
+	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
 	return 0;
 }
 

-- 
2.56.0

