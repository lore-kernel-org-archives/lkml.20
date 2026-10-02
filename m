Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290134F93D9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958859; cv=none; b=RQL89s6hzwYeb7hesdAp3rjNfYE6l+wGNuFSuOig3w5mkKE8icTzbanYH9ebcts896q89CQwLtRLuSQkdkdybctTWJ44FCrM+Z9hYDyKGQF6XxejG7l+ipaCsbA0zHxkzbm+uDHAv4gvrHDgj4yOEpiN/HA+BGb7XGR3Qvu05V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958859; c=relaxed/simple;
	bh=VoN9LZYARNtj3K7W/qeZWGG2+FgDrivkgZiIN5ARaEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSEoLN2mvCMebcrUzr5nUwqAyUJRAJM0bIO8eZKpzHRTavLVp/PwSCSRCQQKpegwYYY/YSpji2rAiinwUMMBWXHeZRTefrNt1vqMwNdm6ikioeAEMnXecc44ltld7IenqiBJVJ/osxie7BBhShIFg5Avt4348wobEVkC1vlc+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiYTdiwM; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiYTdiwM"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso3886102b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958857; x=1791563657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7E5pOjdiR1yz0d6QZ9BdcaXjT8yEwjeuav+vuRWBi0=;
        b=eiYTdiwMVb4ztS0iN6qFKzFK4jer8xCchxdsPbGoxYWTofrhZrxaf8Odvdm6SGMRli
         y0z9tgfZrelgqxArIzOr04oyCUFX3b6PkxvIUIXUmVLVg1PxCLPAGN0FasLAOaVSCXyq
         whvwve34LwwPPG9OeYi+LWgN8tYK+QYWZE8j+st1mChH2HC9Uy/CigHz9+2mBXnjnwIK
         Huq3ic7zNW0V4Y1wanqFbvlrFHHWANvkDTO5hggPBQDiwK6KDetzYsaGxdXFiX3P1LsY
         qDemGor/pG2Lr/M05zea6J/xcac0jF5ojuuOp/G5IUNVaXJ8F8FfwppPidW7xruzJtSn
         FuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958857; x=1791563657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7E5pOjdiR1yz0d6QZ9BdcaXjT8yEwjeuav+vuRWBi0=;
        b=Kap3eprjciRc6NXD9rfdp9O6tNT2qUSvwUfqZHPx5UGJOC00ABOzymxHDQX3onIF36
         aplLZaQqb6+x6eMZfyEWmRwI/bH9eYTTy+6IArHepwm1viAHIeyDy0c0hRMN0f2G/FkT
         BGkYfOFQhkqj0Wb3F08Agnsq6YxPAP915zjHc4nYOyb9VIizIXzU9V/9lY/jukkUkL3C
         LNcrldY6CIwoeecuV453k5xmM8rqaeGKv8JSK5J1gkBaemmubksXOmNgW7LPkIHFE1tb
         BPWHlYcXun6b0+YkUGOWrdsE5UwSbiOqhxLr/ccp/6LVW3KXg0gkyQy4fNT3lU2u7zIb
         w4Bg==
X-Gm-Message-State: AFuF++lxcajks52MXDOGjAaXUPL5XPC/GvECsoD5JK0WAy6qWlmKH0G2
	ZcK7jXEezbS0omVN/WWr3nBJxU7pjVb+YXRuZE4auj3TtFQvNrEi0cijFhyjeGFy
X-Gm-Gg: AYBFou2I48UXqileBkV7Tg655EPvskuIGvc30hMTHfo0SFK6K1otj/aVLmvlpM54IVZ
	xNnV/VXFnvI9Nn8kUB9U/1dOvSBlgLXPMrn250FDkMVjc7eCdMBpws3P6jfWvMDANb77cwO+gKU
	zILDwLaoKrYQtaZgk5kxfaSqMUs5KPujKxJIXhuigMIsDm0U9x+8ro7f1KsjSCT97dDteaZ7cGl
	L60WZHXmValmXzH7SgOIZdsjCRuP+lnqNyafuDd9bh+RM5ntukWKuVmZEnJ3LR3+LKohh64hlGv
	fbJxdXQ4CsiPoaH37nI4j4esNHTGTgAKyiDxs8/q8UgTh/12hgLzg2SUSqxA15obuGC/o9S9nck
	i/tGIpF8MGOI7x9ew+QmzqEVOVSeVsfcWgefwFRjMgrO6o0D/EO5LSOS8CJbBFzn4aVld3816d0
	TMvovIAvsQ7rY2X+JdOpcdfNQQJYV4a22YxhQiFuURw46fFh20dCODOj4EIVm3/fvYmEup
X-Received: by 2002:a05:6a00:238b:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-88af4b47075mr3177893b3a.23.1790958857251;
        Fri, 02 Oct 2026 09:34:17 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:16 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 6/9] platform/x86: int3472: tps68470: use a common always-on VIO regulator init_data
Date: Fri,  2 Oct 2026 09:33:47 -0700
Message-ID: <20261002163350.1248431-7-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
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

Assisted-by: LLM
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

