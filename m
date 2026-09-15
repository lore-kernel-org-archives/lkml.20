Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2086E4A4996
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461919; cv=none; b=El1nyKArP07m764Vz2la/seHv0uRNdO8lxuLNN0GZMN7a13XwDbHFxj8KNtcnvTA1GTvknMS7b9HKFR4j3jImhap4Esz2Y5mXh5BPC20UIyW3ExbtwzxJ4Ph5hJAQvDrk6SzGo4YAvZ/O/JTRi87xcnjuJ8NEysoCbjWTI0NtVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461919; c=relaxed/simple;
	bh=PEaLbwzOb+goHFxNAABOoR1EIpCElqjGmfdmvML+pNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/yAZtxu8VZ1Z5ReeuyLL9r8UpfZlOo0zytd25UYE39xnvAS2J1XTOAWsdB4gbxQbSb4tNwWM5CZmD71rtG1daEgGE1tqCF+1a7a6fU5AMUqf3+YvSTrsTcfIVZojcXcBTnN2UZfxSj8RHXNRe/UV5UneBZ67iWjkzVw6+65nNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYo+GaH0; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYo+GaH0"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c4so2979623b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461917; x=1790066717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/ckj+sOUQ60JwxbsOeTuwnrHwCCAW2BGcG7Qvw4jxg=;
        b=QYo+GaH0TNkXinamNHfXifdyeiKvHjS88dn9R6zyyVtlARsWjdBjm1ADWlcsCW8+9p
         LPk3efg8iTK11g97oiPk/TailQJ2wqIP5hehbl33Dz76ITHHB9CCKY4tGhjyoABnl7O+
         kWOQdaad8RtTpUd1qDw+9AWO8IORMrPZLmT0PbP5y6Mh4p4O08ZWUJ6/eXZlB5nfuX1K
         gqS2pNieCPY7S3BvWx3DS7AIXY/q7Aqn6k8dkYp77ceKJPw7OScMvpq6c+qA/ZBUpXtj
         vOXebjV18X2xpYsLNKFMewuTeWthXMWr6sHcxIXjqpIhaDeRn1wZVL3uJOXaV1IQxBRg
         644Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461917; x=1790066717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/ckj+sOUQ60JwxbsOeTuwnrHwCCAW2BGcG7Qvw4jxg=;
        b=q/lrCYccx3P0NGcqUsptIh+uW2RohPqwIB3jaCbGkTJNBYFtV3p+Hrxd6+g/L3+yYS
         i+2wLzxbWoc3z6uniFvGVUuItlSkUZSMpnee6j6Fe6QeIdR2uyTaGfgXlesqE5X4w4n2
         yoPYF9wS3vTlLCs9/4jL/HPEEasRLEqdaNmZu0feFeiCyN4l6u0T6FFeNSW2nhFjbyX4
         cUrnngblu1RAQH/7URkajMGObVl86QwG/OEJA0lDM3aQo+R/sjTaSuTMLyhYe4h6kpHw
         U5vH3QnsCy4sMWA2PUZZYiKwgBgC3B2RhLxyC4VhZCiZuOK30O4+lq6V+ppq2Ajxyw8p
         ArRA==
X-Forwarded-Encrypted: i=1; AKwUvBwqpe4z75tFUpENikPLMa0GUCDn7lh7LW4clwEvsjhGMA63+CleTudgPwtX4vKILNmY9eer8jwhZzVPyI0=@vger.kernel.org
X-Gm-Message-State: AFuF++kDCgi0jVblbGhvKwScrn6ShXX9WS2BzSsOMc3RyK00F/XGvsn7
	HLftIV7FgExMLsfQR2SZRRYsXOaylRMad7wbeGOhpHJyp1bi08n2ZPcA
X-Gm-Gg: AYBFou1GX404gHB1usuI5bk/+FNPlZ8KlqJW3xxiUixG5KO4AA6idAzazrBRNK67TJZ
	xJjkSVcr2nFwlrid7wx1a9oZPVaVNMJ+Zg6xvXG2niIRtBrxL5gU2DryAtYrTaIaLy6RZh5rUvj
	jfcl6VqNK0K09joVEJabAFKze4Rmb9x8Mm9G7YbKxd8PwX70Q1iQtnBbVWQf5zRxVtYScadetv6
	LB7KCyPS3ex6Ad+rJH0cYgmKm8BraliPfvgmPQEmFaop+gZm2Hrihc6Hfp6BzqtZJVfePBXyG1m
	9hpliZdnNVquyAWM/FM3KatgB03lz3pGzTki8cnDd+hDM5eYgtlMvfSPwGp5tHdHrMOeCZvonMU
	sNrFl+z8BwN5/zsXKpnP9KR+BMBBVzup0dBl38nkl9g+oZUSCHBcpHTHIIDeYKmf0RDxsuQH5DQ
	NreLxzZLht5Zp6JKJSl+xIn4rbY2C00/4wlU9Tc8ygooCxZFtZokGGrMFMNQ7yMkklhJqwFycOw
	OQr929cWybx/B7crIyFnM+G3A==
X-Received: by 2002:a05:6a21:1518:b0:3d0:88f5:f806 with SMTP id adf61e73a8af0-3db40521dc6mr13468678637.15.1789461917459;
        Tue, 15 Sep 2026 01:45:17 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:17 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 17/23] ALSA: lx6464es: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:18 +0530
Message-ID: <20260915084424.1007757-18-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/lx6464es/lx_core.c | 2 +-
 sound/pci/lx6464es/lx_defs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index 9909f1067871..ae265dd19333 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -364,7 +364,7 @@ int lx_dsp_get_mac(struct lx6464es *chip)
 	macmsb = lx_dsp_reg_read(chip, eReg_ADMACESMSB) & 0x00FFFFFF;
 	maclsb = lx_dsp_reg_read(chip, eReg_ADMACESLSB) & 0x00FFFFFF;
 
-	/* todo: endianess handling */
+	/* todo: endianness handling */
 	chip->mac_address[5] = ((u8 *)(&maclsb))[0];
 	chip->mac_address[4] = ((u8 *)(&maclsb))[1];
 	chip->mac_address[3] = ((u8 *)(&maclsb))[2];
diff --git a/sound/pci/lx6464es/lx_defs.h b/sound/pci/lx6464es/lx_defs.h
index eca5367ba561..89e433d3f7a2 100644
--- a/sound/pci/lx6464es/lx_defs.h
+++ b/sound/pci/lx6464es/lx_defs.h
@@ -315,7 +315,7 @@ enum stream_flags {
 #define ED_XILINX_ERROR                 (ED_RT | 0x07)
 #define ED_COBRANET_ITF_NOT_RESPONDING  (ED_RT | 0x08)
 
-/* Complete BOARD error code for the invaid standard object class */
+/* Complete BOARD error code for the invalid standard object class */
 #define EB_ISO          (ERROR_VALUE | E_SOURCE_BOARD | \
 			 E_CLASS_INVALID_STD_OBJECT)
 #define EB_INVALID_EFFECT               (EB_ISO | 0x00)
-- 
2.48.1

