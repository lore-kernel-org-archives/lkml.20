Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA21A435531
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381570; cv=none; b=SBq5CkjbM8iDEve94sAW9Vr/O5zPctMmBfYmGX8VavTr5Xq9XXUlW/PjvwpVuvsCVFVwkaXX28NGfUVXbIf50RBnBEKkg/g6WQKmuFfdhLjX2jwNRNc5PlfH72AweOGNykJFbXYVjxf15vv4JTxmLYYGoiofhh9fAMNE3raTC5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381570; c=relaxed/simple;
	bh=tHP/A638kcr0qMuRXBNOkz9WE+3vDtkM24myYSHP7dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6MJ6xI2KTSh5f2VFwCJPt3u9PJ0fIirWCddQb5ffXqvj+LlONMg8EFrm8uvsIZGbG0wpLTRDRsMdDe2Fo4X17O6kEyGe6F6VDIgSyfARv2FSWyfoDX6aFgA241ZcPE7SeLDbzEicp1/anb0wz/H4VwSAMHd/GfnqnBjdIKc36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=X+4MD8Oz; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="X+4MD8Oz"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60d5so118052866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789381566; x=1789986366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5OoYDDuzC9zsWMD0q4qHxVpHU53i7SekDMuUVkLvTo=;
        b=X+4MD8Oz1hWWKY1Z/8LdXmCXXYthyWLv9Oc6uTMKa+rT4ykEpmXmHeLkdcGmezXoyv
         pLENUIzcdYyOg4pHi3cQf2iXZKoaJJ9B+NzKSmCTsyK6ApJ0coRPYQBYtQ4/23aVZoVb
         bIuPQPBGAzQuQao6YZ7rp713LDWPjZnwbfF/CqYLbwy4rdTroZFgd7dk/nqbpxD6a/OC
         yEioPubnqxplmy3adamToFPf35GoOKEYe8FsGJfKNfeG237RKRFyRP1ODb2s4GK6fz2n
         hJedrxBshao4m1Qg7OuHF+XsPMhHMIJ+5V6rs4UukEg1Go8s5qypjdmOvxKRSS9JYNJF
         KfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381566; x=1789986366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5OoYDDuzC9zsWMD0q4qHxVpHU53i7SekDMuUVkLvTo=;
        b=G/UtapH49JEvtYK5MmfLF9LC+6uaJ1BpJ3+XMyrMl4D04A+CVtm/hAMAsqroclOaly
         rdKtUEUeW2akoigs50b+z3UPRuxPA7uXuEUWS5aM07EsJQggxOur6ubmm05bRa88RH5i
         FD8ZFhMwGAuhTUvowc+Cliw59pvv3j8XdZgqTqGT/a/vrF2ysPprCaKTM7NsuJ6TkRLI
         3+p2HZ2mHk9CDARa1JnVTQZgfNkKCcj4Ka0SlZAn4KDkWd/QFGNDSQpUXvPk7TXMiBZd
         UQfcLuAqkAI2bmQzJ1F8pvw7K9bgkQRH+23ZFEGf79acYkIq7xkhqCC59CcZMx/itAF1
         bc2Q==
X-Forwarded-Encrypted: i=1; AKwUvByIqHcksA3ffFF0lujtVpXqVYY1U+Zf11gaH3mg9OhkvSp4SSoOlmP4IM9Dx/TTCrl8Sh1ddA1QZS0aO4o=@vger.kernel.org
X-Gm-Message-State: AFuF++lgVtVMqT+45KhW9xB00umjn1ZjKVlWRpVhlewV+5V0KBLfoOal
	r3frsDSGUnOWJ5455IjYBfzO67f9EHGslJzBVBE2pOlruoru/jkbGrnJ+mlVCI5j0DE=
X-Gm-Gg: AYBFou3jhaHVQ0Om/bIspCguRc3e66katPqjK9QBsvuiV/WWqodTRpFmMUpeLYGni6j
	k51rSY3rqyDm4yWO0EyY+tHQuJlVsPFNlzdQ7XIeV9s3Xb2DtPnBRc3F3nLadIfliMUICe6OPLA
	BRhCQXe59oXMnEu2dwNey6f4vyWutZ4S/PMV2QxyHkr5GaiBcoXjD/mJ8z7Y0rQGQ5JSuD44PBa
	V/GgMZm5OXRB8pL9rH0wDLiEb9D1svkyZLPIq7V33V55PcwKehPE6LNLmGS5H3iAKs5hElj6JuN
	QK4W8MiMkezIdyzEcqph2cI90045PcrVw6GTlNbCZdevGWQ+Djh41TrwiQeP619JZZ5UL6r9bd9
	uLBP7b7ah0BquZ4xWl+notyAZ39+d/HRSxaZLZFXpYeIQVE0T2YW527XVP8H5NyRO/pnp0/d2q3
	tx4TWRH1clALwohWnzFiE2HW4k4d7M+EtQHOmEH2Qd8z1w7ju0nPSnQUntqsP57Ri/yhhwPL3N2
	BlaDdve1axlfxIClyk6ahIPIWhwxau0inuxLtiAIc7rgBCZ7HskYL8n7w==
X-Received: by 2002:a17:907:1c1b:b0:c25:f7db:4beb with SMTP id a640c23a62f3a-c29b93bcef0mr129068066b.17.1789381566136;
        Mon, 14 Sep 2026 03:26:06 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm399985666b.28.2026.09.14.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:26:05 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 12:25:57 +0200
Subject: [PATCH v2 2/3] media: i2c: dw9719: Update DW9800K driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-dw9800k_cleanup-v2-2-6553273aaa33@fairphone.com>
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
In-Reply-To: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789381558; l=4038;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=tHP/A638kcr0qMuRXBNOkz9WE+3vDtkM24myYSHP7dw=;
 b=WZUHOUhlfSI4AgKuppoIbkRz1hQA4J8k2c3Y83Jm+ifrITZmA9sKerqvPJT+Fl0/Sow2Tx3v/
 0BLbezmEcWHCdhvicFbMXFBOgqURoQSYewVmQKc2Rz1ADFqQcnYyTDn
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The previous DW9800K driver code was created without access to a
datasheet for the part, now that we have one we can clean up some
misunderstandings and add some features for further expandability.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 71 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd67c044ef9005a0aac6a5d26ab939a90..982be59b9ee17a12e8c25ab790ccb8351454c91c 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -68,9 +68,18 @@
 #define DW9761_VCM_PRELOAD		CCI_REG8(8)
 #define DW9761_DEFAULT_VCM_PRELOAD	0x73
 
-#define DW9800K_DEFAULT_SAC		1
+#define DW9800K_ID			0xEB
+#define DW9800K_DEFAULT_SAC		3
 #define DW9800K_MODE_SAC_SHIFT		6
-#define DW9800K_DEFAULT_VCM_FREQ		0x10
+
+#define DW9800K_RESONANCE		CCI_REG8(7)
+
+#define DW9800K_DEFAULT_DIV		0x01
+#define DW9800K_DIV_SHIFT		6
+#define DW9800K_DIV_LOW_SHIFT		2
+
+#define DW9800K_DEFAULT_SACT		0x20
+
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
@@ -90,6 +99,8 @@ struct dw9719_device {
 	u32 mode_low_bits;
 	u32 sac_mode;
 	u32 vcm_freq;
+	u32 div;
+	u32 sac_time;
 
 	struct dw9719_v4l2_ctrls {
 		struct v4l2_ctrl_handler handler;
@@ -140,10 +151,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
 			goto props;
-		case DW9800K:
-			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
-			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
-			goto props;
 		default:
 			break;
 		}
@@ -165,6 +172,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9761_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
 			break;
+		case DW9800K_ID:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
+			dw9719->div = DW9800K_DEFAULT_DIV;
+			dw9719->sac_time = DW9800K_DEFAULT_SACT;
+			break;
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
@@ -185,14 +198,54 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		/* Optional indication of VCM prescale */
 		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
+
+		/* Optional indication of clock pre-scale select */
+		device_property_read_u32(dw9719->dev, "dongwoon,clock-presc",
+					 &dw9719->div);
+
+		/* Optional indication of SAC timing */
+		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
+					 &dw9719->sac_time);
 	}
 
 	switch (dw9719->model) {
 	case DW9800K:
-		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+		int ring, sac;
+
+		/*
+		 * Enable ringing for SAC3-SAC5
+		 *
+		 * sac_mode	reg	Mode
+		 * ===========================
+		 *	0	0X	Direct
+		 *	1	1X	LSC
+		 *	2	00	SAC2
+		 *	3	01	SAC3
+		 *	4	10	SAC4
+		 *	5	11	SAC5
+		 */
+		switch (dw9719->sac_mode) {
+		case 0:
+			ring = 0;
+			sac = 0;
+			break;
+		case 1:
+			ring = 0;
+			sac = 2;
+			break;
+		default:
+			ring = DW9719_ENABLE_RINGING;
+			sac = dw9719->sac_mode - 2;
+			break;
+		}
+		cci_write(dw9719->regmap, DW9719_CONTROL, ring, &ret);
+		/* DIV is 3 bits split over the bottom bit in reg 6 and the top 2 bits in reg 7 */
 		cci_write(dw9719->regmap, DW9719_MODE,
-			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
-		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+			  (sac << DW9800K_MODE_SAC_SHIFT) |
+			  (dw9719->div >> DW9800K_DIV_LOW_SHIFT), &ret);
+		cci_write(dw9719->regmap, DW9800K_RESONANCE,
+			  (dw9719->div << DW9800K_DIV_SHIFT) |
+			  dw9719->sac_time, &ret);
 		break;
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */

-- 
2.43.0

