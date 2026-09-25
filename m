Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782574FB9CE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371003; cv=none; b=PbcgjGgkf9DWaizBPM2zwIy2a3V2scOWFBcrSh/JBn223xj+D096YPEeG9szm3tCcsWUjYIW995NGb4DZmIrWIBMv1eBrOVq/ftKpWSNnSsUWofSNMJ5Qcb+2+iSp6jtJIa7x75rAeGAaTKhydB4FelYdxewHXLiL8j2KTm5PTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371003; c=relaxed/simple;
	bh=j1V0Ff0coyQcTLI3CpAzGM60yze7t0TzabVn96CgoWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZQtr3MVD+rHrgut2olptIVy+EsUSMsTAb+VQz9b/X3xUVHUBtaRBa9CI7zn8MNyisfbtoswiP6s8F19+V/btgsotMz3Nqp5Bw2j16RqQ460/tF/PI/5CbvveHSU1KcNe7b9p75y1kghoQx/BnjJoiZNEAD+b+mZ+fBwoZYJny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVseaeAv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVseaeAv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso9255e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371000; x=1790975800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqQR45PgbfT7V9sVuIzFCMVeJwigG0afJ6PK7q1+V8c=;
        b=JVseaeAvCU7+S7+GtG4TyNWiaHUXDehIIPzuwYKxNVmBWLtUI0b5b0OcN1tRGhwkDv
         xocwgR5dUYWSWegx5LX5mzcD/TYrAtJqpUGNzzin44otDaHjpIxiGAy7i7vJRt3sixJg
         mczb97m5B/qL+iun7Jh1CVKqEQCs2Ct115UeNMroA85cL5Egt349+SeNyCOldloSbiy2
         DB/Su2IS9BDjreMekI0VUWdWOo/IfPXRgO46sYLLAsDCn46rafVjyuLvo6iuOUjrLid0
         89vwSpFmsKIFQjPqYZsvR1DWdqU+qnET6bGt7NEyjjCGCvSk2vwWAd+LodZ8KaVRcQvO
         Ka+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371000; x=1790975800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HqQR45PgbfT7V9sVuIzFCMVeJwigG0afJ6PK7q1+V8c=;
        b=2I+lDZ27HKIW1ZdLFodT54Cyp8mUJpTOV/kDcRDT/aRCMi+du1oA/RBpb/AMnnu4Cb
         HsyzD4YGMLFag31YEXdV+8qMRspI2QpQ2+v6lpVN44RGT4jeRavIwpYRvPND50LD97ER
         ts2DJ5b4zqx5tLvBjsayUKnNNWJr4GqdIppvctuixGOhX8TERzg7tF/c4RntG5n4sqTR
         mKfChNBruJ6Jsq/NWqfyMmBj/pnFmV2NpJgH7DagVYDD7nCSNwstdO9lHJZPhTjhMAVj
         NryO92hOaUrxAeRPGdo4Y4pa5yCPHTfezJEExJUdDDmUK4FP4JZGafJR36qMzqIAXT7/
         UeIA==
X-Forwarded-Encrypted: i=1; AKwUvBzP36j0/8rKeseZ1RhoWYnAfbJ4uNE0usLD9Sc0A3s13yTT1SdNiJGC4e9Zzn6ahd/gLJB6ni9sEID9TL0=@vger.kernel.org
X-Gm-Message-State: AFuF++mmEV9FB1RJI3IEN3y0S4pAf6D2427j8bWyRDkgcvnkxckv2PHm
	BN1xVE7c5t1gvZx53bFgXx99n8fdo2J746hh6Neh5XRZMj6+FWt4tWfp
X-Gm-Gg: AYBFou3OdtGmWJML9cr9yowe65rMBotEh72u5RDh+9eOUA9wQ+61OEXOA3Yhz3oMehM
	YZi8nT9dTyTkbwAPOi5q+VfHznpXjRANElOnSPwoX3JpIQHlUSsotYxeZGE1FAIeQ3LwSMKZkoB
	CyoqeRRF+IHov4RPs037X0/pzP2aI10onn9H0SXTy34Vab7etvncDQSP6JCoKZpHfI9Nz86zL9T
	dWCtEsc5+EoLRIrt0r4p2c0vFre5Spom/GtGqBf5MofCWLMt3ts2DVpg7dCc++wB61k+6X4oVWE
	iZFW3JKbJjP2TW8EJoA0BG1YBkRZLYjrrkqbFvA/MxvuvY4w6cHLzqGj9nguanPXq8a4LBSckg4
	Mmxlir540AV71AqehjD4eqKkovvtqD5aMtqnQModFeOQFwOuiMaBhULUsOId6oq08B8b4mPpiEY
	ywJYuAz7/SPpC5hp1Jc6JgzQEhriY2pJYd7B5JSA4cAK8+dWmRbXkrrBIvFQ1U5DidMciNUHu1r
	vuCLjsUmQ==
X-Received: by 2002:a05:6000:290e:b0:487:27f9:837 with SMTP id ffacd0b85a97d-4887170f426mr13064121f8f.44.1790370999654;
        Fri, 25 Sep 2026 14:16:39 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm9271781f8f.13.2026.09.25.14.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:39 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH 1/3] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
Date: Fri, 25 Sep 2026 22:16:33 +0100
Message-ID: <20260925211635.1422516-2-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211635.1422516-1-amad3v@gmail.com>
References: <20260925211635.1422516-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
existing entry does not match it.

Use the Stellaris 16 Gen7 AMD feature set, but with the percentage charge
limit instead of the charging profiles: on this firmware the "balanced"
profile does not limit charging (the battery still charges to full),
whereas the ACPI _BST method reads EC_ADDR_CHARGE_CTRL (CGLM) and reports
the "charge limiting" state bit while it is set to 1-99. Setting
charge_control_end_threshold to 90 on a full battery switches the
reported status from "Full" to "Not charging", and charging stops at 90%.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index eeead0159..beba5a76a 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2787,6 +2787,19 @@ static struct uniwill_device_descriptor tux_featureset_4_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_USB_POWERSHARE,
 };
 
+static struct uniwill_device_descriptor pcs_recoil16_amd_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE,
+};
+
 static int phxtxx1_probe(struct uniwill_data *data)
 {
 	unsigned int value;
@@ -3268,6 +3281,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &tux_featureset_4_nvidia_descriptor,
 	},
+	{
+		.ident = "PCSpecialist Recoil 16 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
+		},
+		.driver_data = &pcs_recoil16_amd_descriptor,
+	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
 		.matches = {
-- 
2.55.0

