Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA464B5155
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192492; cv=none; b=CgVxT/lp7mxCqUuw6+LjWwQHpP/9osBXTR506+qMrkYzrBM0EsfSvbYAf+zR4tAdNFGeztjzp3vqkE6jFeS8m9TrEA3IPnPomj88pFn6KnpXHpeWU35KJNgKkv/eOfvBphaSA3+KflpUqrkVlzwpxclcE+0MsSQzBjtRYKRxaq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192492; c=relaxed/simple;
	bh=JaYYc/MebRQQvnPhb6g6B2V4uIViyu5GZFRD0yqRn88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbusTmrQqhs0XPH7asrPSz6KPVm+gzkHz3MssEh5l/bgN7eS8jDG9hSg1uKS5QhThvIfkMh+n/75boAX5MZr+VX1fFu7ptqYm3OpUHUPaJtoCOVu+g7EfXyaDIR61kTaz7hGTcpoh+w8/YRkLiNnvHvUkSCGwfoPrjJOR+FqVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkafsuVk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkafsuVk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso36782695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192489; x=1788797289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxKjjaswIqYpJP4gFTjG5f76wpVmS82nrOI8R56lUWA=;
        b=SkafsuVkNSzoPTrPEbZBTik6d1rsqaDqezKWcHYQt8qQmTLt198mzJD86cjFG5xNgF
         B5l6S3+hcq+nHtlk5stBks7gIBQ0B3r374UOfs3sayaf9ReTyAN10HA8V4sueOt2vZKE
         TUpVn5aeQM4K1LeoUE12wASGTMaJgFB+FdYSKca2Vkf2SVhxDUNNIC+yW/OSLqpH59sE
         b3bU5o18kl8eVMxiHNZT2GgwzCe/0BvZhumoYpSDqHB2wl6rGGaAYdFme2fTC6WU1E3F
         dLXYQlNwtyjaiVlWbcFB3Z/Gusj7qx3xFOtg0Qy4krknPpKGfEAXSgLO2nnbOjWcWns1
         TeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192489; x=1788797289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxKjjaswIqYpJP4gFTjG5f76wpVmS82nrOI8R56lUWA=;
        b=oDQty5X7r3Mpo/hgZ3tqfq8Lj+RxHWv2Jsp0YviF4hNUQl6aBZiw8ovET9Eq5v4zF4
         VZjilj9DoF6oEGkXOTlk8r77Z3EYpvS/VwKl5yzt0M7REX0wk0f3TnV0l6+VjJeFnu67
         9FcB+dLXJEM+7DHLhmBrgl+DbEb/8lz6tWLvV2oCwGG8cOWG56bB3a5op/DhcKeLBjbO
         TkOCWqLBYa/kRTo+Zp/VqHKKK0xgL2EPafSQZY2WnM8THfFNmz+A9x6UqD6oIiy915XA
         9qkxCDy5Wz/ASY4Ge7rVWirEzvoIqyziKfoc01xF7G8y9OFfVrCZJ2aOf4LtMMezp1Bj
         /UgQ==
X-Gm-Message-State: AFuF++n9KRsuWX1AXGba9TC6+eegqSa6vctzgEK4zQncTc+3cCR7/vDn
	noZEzAJNBnmiyGb7EIk2adH+ELrngrnAz70jGg5yqrNfKDbSYJQDMHCWieTitrDTT0Vm0g==
X-Gm-Gg: AR+sD102TbiOXMOiWZWimXsFifs7TahXj3hgrEsOEC/vvosSTBZSEf/9egqe0gWp4GF
	tWfcT+4EpjPtnkYmY1s1Kxg06ZNoxsLOiEJ/zD8Cvf51yMMijQ9uyoUvKlZVkF0A7H9bD0/huXW
	gCbHg6sJ2BkGeAqLWAZ6W26cmHwusV5n/w7wYIJKQr8XvfeJTGg1/Xyp12EA00z5vKDVYL+xE2t
	HaoW1P3ZKjx6GPJkcHx0qVDiQIfqt0SRLvKZ5YZM6LdjGPucQ29K8EYPUKA8eiL0df6jj6JVxfV
	YhD1jYveqiRaf5CWxz+1I49JKcp6eETFv4iDoSvp0BgXJ/ohHCTiBQFl+ZMBGH+4IAHs5p92FSp
	RFCcu+8y8hGEBz3t+P25+8jXPkYiPl70SO+ao7K3W+nF0T0T/64tcMGnA8dhgnBBq53nBce8Gh2
	sMPtHOUF9iD3aVakBb3GnndLH+ewVbYB8gYZSHuUmY2DeDBdVHoOPib0fW3vGtsLzzads=
X-Received: by 2002:a05:600c:1c0a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49b91c1dd3fmr440541835e9.1.1788192488967;
        Mon, 31 Aug 2026 09:08:08 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:08 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 5/8] platform/x86: int3472: tps68470: use a common always-on VIO regulator init_data
Date: Mon, 31 Aug 2026 18:07:51 +0200
Message-ID: <20260831160754.9857-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The surface_go and intel_nvl board data define byte-identical VIO
regulator init_data (1.8006 V, apply_uV, always_on). Replace both with a
single shared common_tps68470_vio_reg_init_data so new boards with the
same requirement can reuse it instead of duplicating the definition.

No functional change.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c53542465..c2ec802fc 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -75,8 +75,12 @@ static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data =
 	.consumer_supplies = int347a_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
+/*
+ * Common always-on VIO regulator init_data. Its voltage must match VSIO;
+ * boards using the TPS68470 I2C pass-through that need this exact setting
+ * can share this instead of defining their own.
+ */
+static const struct regulator_init_data common_tps68470_vio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
 		.max_uV = 1800600,
@@ -123,7 +127,7 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
 		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
 		[TPS68470_ANA]  = &surface_go_tps68470_ana_reg_init_data,
 		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
-		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
 		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
 		[TPS68470_AUX1] = &surface_go_tps68470_aux1_reg_init_data,
 		[TPS68470_AUX2] = &surface_go_tps68470_aux2_reg_init_data,
@@ -339,15 +343,6 @@ static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
 	.consumer_supplies = ovti13b1_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
-	.constraints = {
-		.min_uV = 1800600,
-		.max_uV = 1800600,
-		.apply_uV = true,
-		.always_on = true,
-	},
-};
 static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
@@ -364,7 +359,7 @@ static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata =
 		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
 		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
 		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
-		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
 		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
 	},
 };
-- 
2.53.0

