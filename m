Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571541;
	b=Lc7qYb/X2xS5moRuUEnjH2gbn8un9aAbCZqxgr/KaDMERYQYeQ5MrbCbCl3aU0Bo9qXX
	 ennZvyUt6Enx9SmxfZgjmJv7d7Pg99G7aeSN3CuJa/MJ7pSYQov42BX8NrUh++i0t306+
	 I7OmuJCLoZo96cB5WaC/F+tOwj8+cNkoPdqsbKzeJnWkP6oQvUBYee3mezQTATQ/T93Iv
	 b06zlEwjyqjmAfNgl53tJn/F6I7Db7Dro9CMWrZ3D2wfqGS2MNTTKqZ4mVzVCynw6eLFC
	 sDBY0zD+eNY2EuXwyI7k1XTb7cbo3mMBZgrHkB1x5Uy+WB/xisMWVbzWr4aUSMiZrrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5ULIkKvwaWQI67UTt7sKZLeHrIi/qSx+LiDlZeAM51g=;
	b=WiwMqGrZHlbtTRnXwqnHUnK+Wpe44gE3eAsiVq6xxFnj+6ct9wsJl3ZcesccZoXlFtcQ
	 bbHJpkvFesqvKAOK8rYJgw9tBTbmtqwnjLTYkfm9h9Nu4ZJxqneXj4y02QyW2YpTN+HCm
	 zfUK/D+vr4SBN2u4NSO8oxIXwdYtWnfDXPklZ/ZEoS/adbfGRqbyeT9hnc7aG3a1Zc5Fe
	 HUE/NC5U6DdWRgR4IeSk838pc//0LnXClAMQiRGWQZeUbECtmO28cHxVZrSJF7wO2FfW1
	 SgQLLBAhQmZ/fMD6IocSEwzv7gL6XqlgH04fPr0vJaWcfcjV+VN1KVMbM8qibtjgvHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPSX9hAw;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB7C606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB7C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPSX9hAw
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso10337625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571534; x=1793176334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ULIkKvwaWQI67UTt7sKZLeHrIi/qSx+LiDlZeAM51g=;
        b=TPSX9hAw13viOJ51MNDDNRuYGgwsMMG9b9960TUVTwW0asT/XwBFzC7DJg5Y5Peabj
         91HTzrQvV1PI2hLa6O6T4lacbs1jgOGec6/feFrabTrNqTJYF/NV0UhIvenxKwlZR/bc
         Cd/LzWO04/dqXMClE3G52rDFlZJyVk/4ZiTsc80K1pqeGZJuKRuJwl6pRTqyd9UUl8VE
         XYOCxBx4ldHP0LQP8W1JW5HsP0IWezqoqy8Soyzu+UA68GZTmFR/EZhI56k779BrIZes
         Gtq2wXXS4V96IeLSGF+FLGizf0L8uih0qhYlTrMmhaVsAq/FH4qhxAOAlzrHyDoL9Vgi
         Emiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571534; x=1793176334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ULIkKvwaWQI67UTt7sKZLeHrIi/qSx+LiDlZeAM51g=;
        b=x7axdKWpMS+4lzXYxHvMiJ0V5Lk5Cu3+V307Yjk2Yp+xu/ja/4uqgkRVQVtC+oOKI0
         rCQ513x7qGiGBQygDjbQNtsENkW0KEVFuDgTvsG/PqZDMddopa6TBdTn/1xkio2SHczy
         dbZgywbCgcJtLCqNKeQSmIxeVf/1or+1HSaVMN1XsD4+4gHhC2n2w+iDG+IRDXFCQ0Ez
         FQaAfkyxpU9UAxvO6NK8bzwWfL0GArfQqmflJ0IfKqRqrQZnDPRpRIdU9od+18isB0H0
         +5snoQK0tPm7DcX94WeCk1Mm1TrgGRvUTyoZ0MaJznmzHSMa1xcsESrzA20Sn/p1yWr/
         0a3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxx3wBrlBBMegomzLeogM54a1uTJh2J3knIH3cNT2dSSmaKIgv1orgrl/NXnV/LXFxUYpspZux3Igg0EOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRzTwgWE3MZ8GHFz+iehcU+flLxaQX2x0vtunAj/IaRj5BIwxC
	1Zcp0lZX9ijQ7x1hEsL/TKefbonzsAhQr4pLjqJokutjekB8Hlt0mO6I
X-Gm-Gg: AYBFou0W4XkeGHfi8yGWO1p7iCpgKteOs7sl335VmAB6dPsr8fQU9cGFwm2VU6K98zV
	+rWvj+ptiEgIIFb6fE3SS7mtuRxYjK4vg6LRb6Y6hzyxQ7TswBW1nSSZ7DNlWRITu9Rga8J+fwP
	LaA0UGtVkguu81FM701AK8zx+/GJfuvE1Oxugt0MHPWKyN8QGMeZtUr08yy2DjfEraoPC1l6jPg
	64ZTQfcx5y1ZDAyt7ckPqzj1ToYOoDvR73Z6Qky909ZdAL7bo7vBl+T2740BRZ8j8ZzZUfsNz7a
	siBLU9kgz72unNMxuBzpbDeh1HVhzK54RzlrjUABPGeb6LP9b+gBumINTSjOz8jtwGiEFP+AC6s
	Vx5jvsUw70j393l/wz/4pRIeCOSToQ16BCly/ENnRpwl7C6GlEGuPPHeyrcFnsxa9FrohLHHqmu
	ZnxoVRrq23Ru0LN940104szUdGYVfFxhUpDudejc/LVxhpI+eJ0quvf/kCXVGxyWfVVQ7ZNjsBE
	GFdTy+EXckEYUes07MML5DsNziwYLE1dj4qRJXVBvsiuUbN7w+A2+pXBSL/4936Ndacq8+NHrOj
	0tI96cvyG8P448wDR2QjGic=
X-Received: by 2002:a05:600c:3103:b0:4a1:e57b:667e with SMTP id 5b1f17b1804b1-4a1fdb155bbmr27564805e9.4.1792571534212;
        Wed, 21 Oct 2026 01:32:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm36250145e9.4.2026.10.21.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:13 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
X-Google-Original-From: Biju Das <biju.das.jz@bp.renesas.com>
Date: Wed, 21 Oct 2026 09:32:04 +0100
Subject: [PATCH v6 4/4] can: rcar_canfd: Add support for Renesas RZ/G3L
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
Message-Id: <20261021-canfd_rzg3l-v6-4-b4abfdba8e70@bp.renesas.com>
References: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
In-Reply-To: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792571528; l=3895;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=y2Mps8bfpUVBsT29o/nYD2/x6wtmg90QtO5iKikQJVk=;
 b=pGiu93n+LR2RblBYw7xxK37coY3NAQuHm9DGkEpPyqRsS1oX8i1QBUJLlojT1xwxRTEM7VZwV
 H2x1d0EhllzDCy5iWSWi1jAj8brbokXqPhm+OV6TKoaELMOcyLEDmUF
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Add support for Renesas RZ/G3L CANFD IP. RZ/G3L has 3 channels and
11 interrupts, compared 2 channels and 8 interrupts on RZ/G3S.
RZ/G3L has 288 buffers compared to 192 buffers on RZ/G3S.

Like RZ/G3S, the controller supports only CAN-FD mode and update
the comments to note that Classical CAN mode is not available on
RZ/G3L either.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * Dropped the tags as there are new changes.
 * Documented Classical CAN mode is not available on RZ/G3L.
 * Added r9a08g046_hw_info to device data.
v3->v4:
 * Collected the tag.
v2->v3:
 * Fixed the typo 198->192 buffers in commit description.
 * Collected the tag.
v1->v2:
 * Updated commit description
 * Dropped RZ/G3S fallback
---
 drivers/net/can/rcar/rcar_canfd.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 86fa88ccf63b..0da2fefb047b 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -6,7 +6,7 @@
 
 /* The R-Car CAN FD controller can operate in either one of the below two modes
  *  - CAN FD only mode
- *  - Classical CAN (CAN 2.0) only mode (Except RZ/G3S)
+ *  - Classical CAN (CAN 2.0) only mode (Except RZ/G3{L,S})
  *
  * This driver puts the controller in CAN FD only mode by default. In this
  * mode, the controller acts as a CAN FD node that can also interoperate with
@@ -247,10 +247,10 @@
 #define RCANFD_CFFDCSTS_CFBRS		BIT(1)
 #define RCANFD_CFFDCSTS_CFESI		BIT(0)
 
-/* This controller supports either Classical CAN only mode(Except RZ/G3S) or
- * CAN FD only mode. These modes are supported in two separate set of register
- * maps & names. However, some of the register offsets are common for both
- * modes. Those offsets are listed below as Common registers.
+/* This controller supports either Classical CAN only mode(Except RZ/G3{L,S})
+ * or CAN FD only mode. These modes are supported in two separate set of
+ * register maps & names. However, some of the register offsets are common for
+ * both modes. Those offsets are listed below as Common registers.
  *
  * The CAN FD only mode specific registers & Classical CAN only mode specific
  * registers are listed separately. Their register names starts with
@@ -681,6 +681,26 @@ static const struct rcar_canfd_hw_info r9a08g045_hw_info = {
 	.fixed_canfd = 1,
 };
 
+static const struct rcar_canfd_hw_info r9a08g046_hw_info = {
+	.nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
+	.data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
+	.tdc_const = &rcar_canfd_gen4_tdc_const,
+	.regs = &rcar_gen4_regs,
+	.sh = &rcar_gen4_shift_data,
+	.rnc_field_width = 16,
+	.max_aflpn = 15,
+	.max_cftml = 31,
+	.max_channels = 3,
+	.postdiv = 2,
+	.shared_global_irqs = 0,
+	.multi_channel_irqs = 1,
+	.ch_interface_mode = 1,
+	.shared_can_regs = 1,
+	.external_clk = 1,
+	.fcan_pclk = 1,
+	.fixed_canfd = 1,
+};
+
 static const struct rcar_canfd_hw_info r9a09g047_hw_info = {
 	.nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
 	.data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
@@ -2404,6 +2424,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(rcar_canfd_pm_ops, rcar_canfd_suspend,
 static const __maybe_unused struct of_device_id rcar_canfd_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-canfd", .data = &rcar_gen4_hw_info },
 	{ .compatible = "renesas,r9a08g045-canfd", .data = &r9a08g045_hw_info },
+	{ .compatible = "renesas,r9a08g046-canfd", .data = &r9a08g046_hw_info },
 	{ .compatible = "renesas,r9a09g047-canfd", .data = &r9a09g047_hw_info },
 	{ .compatible = "renesas,r9a09g077-canfd", .data = &r9a09g077_hw_info },
 	{ .compatible = "renesas,rcar-gen3-canfd", .data = &rcar_gen3_hw_info },

-- 
2.43.0

