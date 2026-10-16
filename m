Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B218466B04
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141790; cv=none; b=uHJF6EdFiur2c16rfiRUD/0IrfkoXWpKPCHA3eH66ZS5MKcp4Xa4Hhum/x3BJdSoWhN+PUMnTxGyuRRyoZWa+Q5lvMl0dXRKxpVH70MalhJk7ATxQhEDk2VwhNkKiUAHIjIzOFTCpXq0VRhP4ZSrhpFZo91iBPhovp75SYbbW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141790; c=relaxed/simple;
	bh=ZrmwossZjTd29Ih+lCgZKFXmIOi4LDpBYUvzQdJYM1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xrred0NuRqsu6YkvnG4whuMgoaz3rymxttyDG3S59/opfnqJeAijCrvNWSN0dM4Dp0zV0caNs4YiSqoFqSHDDZO8K99qSBHio6rA5yYQFKtw8AjkakstaN2ktuFj435r1PhxXnD3dHZwgAbWRJrnF9pAFwHPiNDWBOMSOrhOB1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2wXoia2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2wXoia2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so5115141a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141787; x=1792746587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0DxMtdmaykVRK9lF7eAJZ0u00iNP9YbBzASFb6ienQ=;
        b=S2wXoia2lrImRlDKixjLGE1Dc2iKverQBNUM1G6ld3fRQlIRdXbm6HcIUDI3pL1qTJ
         IsYY/xR8fghawJsJZ0xXLnGxudhxUa+BUL3ayKrlfXMYSAsLDb0eO799VBUEda6efx/8
         u0KKOL6gG56QkXSdcwQX+yu/wbvSYTUAtrj+SIDFgoUykAzPg46LNoUx/rAEW+7hVzNs
         qdziKgfn6B2jKwHdw7Hhco/7HljTZka6n9NqPtgYieJzAJLnc8nAEhY9I9z0hjFz+OvJ
         wSU8Os4/2SWQwQL/jBdTM111Ym7nZiBC+Jykn3+8CRIhG9hOlGUH69k1lXVC7K1aGrdk
         RPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141787; x=1792746587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0DxMtdmaykVRK9lF7eAJZ0u00iNP9YbBzASFb6ienQ=;
        b=WLAr5A5ONda6O+ppN9VqubiFbESphe+eeRXvMW535rkvNR+rHpXReStMV9+Fxod2ZR
         Nb8eYX9E/J3jCRbmdrxKvbDa4DuFpiFzcFvZTaKU4E56d67lc5Yp5iGq7pJc8SwulwCd
         nSjooHONU8ZSdfbUIFZKNChFQ3+rPHycN80kKXQnPOgR8onxexghgprMcBp2dDakFGfq
         LwgL9jhT9rsKk50zYRd8ZHVZNsPTDWyjzuztDC/LIBrXTQsZ2iU5GaiLHPlC0LBG9+xW
         F6WTFb8bk33GKm/DUTZuhfdBpZ8EdlKokRMCyAgU3sHA5A9hEBR+k3izFA1YiDvCt4QZ
         FYVA==
X-Forwarded-Encrypted: i=1; AKwUvBw9+bKRJJoarXcGUjQx3m9onxC8SjX1TOjv+Xiz2zD1Caeo6WuwGet4AxU4ZHy/mdOakYvybyig+aip9Yc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH7FH75DyVUsxtg4YnN491fu63b2L6Il2v5NbtcDnyF5+PnqpC
	E4FDGWiIrGfLffRAmHrbgoEYSAnj7RkQylt/ZwdIDAwHy8EQbNUqUARR
X-Gm-Gg: AYBFou0/akagALuUdbUGSc6q3zIrq28R46mi2t0s8wgD3RAMoPn+MQPvsauU8rK2+HG
	/kgmYOJ8bHpPhbsho1dwoxmowAKa/RBULBSPoAo7Epx1g0RSjcpNSmIGy4s+Ms/RblkSGseaxr8
	LsphxgxOZ04fyl+6eQ0BK77uGOjHyy7guCLVq6lv7umG67/vloOfbgIUyBtEAj+w6BpZQ2sHN3J
	tKl+FW2r9iNgMnaoEY2KOuB2wzgrPVhHZCrGcQj3QmpCoZmlVEjSjLEM65oGCkcZcaK6Vs9X9jx
	Ppvz8MvvqLxw8yo0kfEFlC07TrYvV4BNjAO9+sAvE7CNIEnzugRepvoWfFQwnU5XTgvMcgsrI0w
	1+A5ldk5RNdqAUnKgBQlrtBXl74JmtMLlgEuL00ehoUvx+VsyVJU34RAuntU8h14WRk4ZYI2n+m
	oFDb4gYsInqGg058xLhaAzHAXrbHSeOME8Z0tk8UShB0gebJJwh7ORS75VnYP1gD5q180=
X-Received: by 2002:a17:90b:3c4b:b0:3ac:ba49:2fed with SMTP id 98e67ed59e1d1-3acba4932b4mr2594734a91.58.1792141786759;
        Fri, 16 Oct 2026 02:09:46 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1981sm3269097a91.2.2026.10.16.02.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:09:46 -0700 (PDT)
From: wyibo6109@gmail.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>,
	David Heidelberg <david@ixit.cz>
Subject: [PATCH 2/2] media: i2c: dw9719: Add DW9714VA support
Date: Fri, 16 Oct 2026 04:09:30 -0500
Message-ID: <20261016090930.947830-2-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016090930.947830-1-wyibo6109@gmail.com>
References: <20261016090930.947830-1-wyibo6109@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

The dongwoon,dw9714va compatible names the DW9714V revision found on
the OnePlus Pad 4 ("iceland") rear camera module.  DW9714VA is a
coined name, not an official part number; the revision shares its
IC INFO id (0xFE) with the other DW9714V revisions.

The part answers the DW9719 register interface in its register-mapped
("advanced") mode: the chip responds to register-addressed transfers,
IC INFO returns manufacturer 0xF / model 0xE (0xFE), and the reset
value of the VCM_FREQ register (0x60) matches the DW9719/DW9800
prescaler-in-[7:6] / SACT-in-[5:0] layout.  The SAC mode field in
MODE is shifted by 6, like on the DW9800K.

Both the register layout and the power-on behaviour differ from the
currently available DW9714V datasheet (Rev. 0.03G).  The datasheet
documents an advanced mode with SAC_MODE in [3:0] of SAC_CFG and
separate PRESC (0x07, [1:0], reset 0x03) and SACT (0x08, [6:0],
reset 0x7F) registers, and a power-on into the normal (direct DAC)
mode that enters the advanced mode only through an explicit
0xED 0xAB command sequence.  The observed part follows the DW9719
layout instead and is in the advanced mode at the first host
access; given the revision variance it gets its own coined
compatible, dongwoon,dw9714va.

Operation was verified on the device by sweeping the focus position
across the full range while observing the lens: the motion is
smooth with no ringing noise, so SAC works through the DW9800K
write path.

Detect the chip through INFO and drive it through the DW9800K write
path.

The SAC parameters are module-specific: they have to match the
mechanical resonance (tVIB) of the lens module. For the iceland rear
module they were recovered from the vendor module firmware
(com.qti.sensormodule.icelandmain.bin, which embeds the actuator init
on this CamX generation): MODE 0x80 (SAC mode field 2) and FREQ 0x79
(prescaler 1, SACT 0x39). They were verified on hardware by register
readback (CONTROL 0x02, MODE 0x80, FREQ 0x79) and a three-frame
capture at focus position 450 with no I2C errors. No such data
exists for any other module with this part, so the driver carries no
DW9714VA-specific defaults: it starts from the family defaults and
boards are expected to provide the tuning through the existing
dongwoon,sac-mode and dongwoon,vcm-prescale DT properties.

The datasheet-conformant DW9714V and DW9714A in normal (direct DAC)
mode are covered by the dw9714 driver; a series documenting them in
the dongwoon,dw9714 binding by David Heidelberg is in flight:

https://lore.kernel.org/linux-media/20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz/

Tested on the OnePlus Pad 4 (iceland) rear camera module on a
v7.2-based downstream tree.

Tested-by: Yibo Wang <wyibo6109@gmail.com>
Cc: David Heidelberg <david@ixit.cz>
Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 drivers/media/i2c/dw9719.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd..2afe37361 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -45,6 +45,15 @@
 #define DW9719_INFO			CCI_REG8(0)
 #define DW9719_ID			0xF1
 #define DW9761_ID			0xF4
+/*
+ * DW9714V family id, shared by the revisions.  The DW9714VA model
+ * names the revision found on the OnePlus Pad 4 (iceland) camera
+ * modules, always in its register-mapped ("advanced") mode: IC INFO
+ * reads manufacturer 0xF / model 0xE and the CONTROL/VCM/STATUS/MODE/
+ * FREQ registers follow the DW9719 layout, not the layout the DW9714V
+ * datasheet documents for its advanced mode.
+ */
+#define DW9714V_ID			0xFE
 
 #define DW9719_CONTROL			CCI_REG8(2)
 #define DW9719_STANDBY			0x00
@@ -75,6 +84,7 @@
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
 enum dw9719_model {
+	DW9714VA,
 	DW9718S,
 	DW9719,
 	DW9761,
@@ -153,6 +163,16 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			return ret;
 
 		switch (val) {
+		case DW9714V_ID:
+			dw9719->model = DW9714VA;
+			/*
+			 * No SAC tuning data exists for DW9714VA modules in
+			 * general; start from the family defaults and let DT
+			 * provide the module-specific values.
+			 */
+			dw9719->sac_mode = DW9719_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
+			break;
 		case DW9719_ID:
 			dw9719->model = DW9719;
 			dw9719->mode_low_bits = 0x00;
@@ -188,6 +208,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	}
 
 	switch (dw9719->model) {
+	case DW9714VA:
 	case DW9800K:
 		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
 		cci_write(dw9719->regmap, DW9719_MODE,
@@ -440,6 +461,7 @@ static void dw9719_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dw9719_id_table[] = {
+	{ .name = "dw9714va", .driver_data = (kernel_ulong_t)DW9714VA },
 	{ .name = "dw9718s", .driver_data = (kernel_ulong_t)DW9718S },
 	{ .name = "dw9719", .driver_data = (kernel_ulong_t)DW9719 },
 	{ .name = "dw9761", .driver_data = (kernel_ulong_t)DW9761 },
@@ -449,6 +471,7 @@ static const struct i2c_device_id dw9719_id_table[] = {
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
 
 static const struct of_device_id dw9719_of_table[] = {
+	{ .compatible = "dongwoon,dw9714va", .data = (const void *)DW9714VA },
 	{ .compatible = "dongwoon,dw9718s", .data = (const void *)DW9718S },
 	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
 	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
-- 
2.53.0

