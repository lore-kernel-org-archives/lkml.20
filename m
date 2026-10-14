Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834AA42049E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959582; cv=none; b=rnUeIdGNz3CnoDie2Tm2pSMNPut1lczyVjeWj7pbM0Qv/JG48J+WAaloY2/IDDqaY+2LdLuX3cVpoF14rfFxgCJUd+UtvmukIi1QaEhSvJeNQkp9QPjv6RGJxvaxOgFWG0chqXsNc2jlBFvKZrtWSv2P4xDPgcKZSP6mQjBHivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959582; c=relaxed/simple;
	bh=hVW+USzSBzAzqEAR4Q3BT5OZl5nI+OxHGOBnkcNEMt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVgL58mOP/TD7LTapa5zrgDtzVm3WvsZUCMmZCjzf/lgOUj9Z+upwU1Gzm3KSoqkGKxAdYrFjHa0cbP/G4z+R3KqSV2/wj16Qg9vjtTaUU7kAAWn8QeT6qTyiFCNFFJV1m322Zuq/j4TqrzGeAT15WogMjU4nTQhkI7P3IhSRFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVlD0eak; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVlD0eak"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3305084a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959572; x=1792564372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqnHfSSLyz6asBS72kYmaKKBcl1WGQlYY9Lj8Sk1fu0=;
        b=CVlD0eak55T6foYgkesQzE0Wt4zTzlZAZj4O8VR2Qfz5yBY5vm732Fej0kXbiCjMtd
         rT2jW8ejaxepFDK8m/hEJtOJkEwlqgfReT8NJtDgZrqol4AJ9jRQUATMB14k/wZ+N4EM
         sp6VKWKiAltGw4xeTE4TUg5eX01Wt/cpPLQm1Fr92D0TqyWbyxNnqWrk4HdJ07tjvj5V
         0z82M2NDviX3EXFADNm5l1wN073qKl0eDiCSkZA2qqqYkqLzgL4x1Yd4sdem2bDE9WT0
         cCpBbWkmdPzmtdYF98WEECp2OocD248WIgibua7fG74cDv34ON4244xpPshdrQIhQxG9
         nQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959572; x=1792564372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqnHfSSLyz6asBS72kYmaKKBcl1WGQlYY9Lj8Sk1fu0=;
        b=rsrFqh+nVvrlqh6DnnXZhsOQ+EssFyEy7DQFK69NVMPQZpNsON+Os3zD9rXSOFJRYR
         qeVOPwoM/+x9UZGdvlj+gQxIqs+gnJxYZpyM8336QcZHGZYixBz9i/K1Ve+0gHNlWIRV
         qoM5Ii6zQNYnDd6k5zRZMluQrEVOy8iiBoMx+gBISfOu3aMyjKrN+vEa1rpVsdVdojPf
         uK31bwgl3F4RrQGUUmXOnLBghnXQQ12GNoWcMjHoMPJp7/o9cHNq3MeVsOsmfhED0OED
         YmFdp4OeNa9A6m80e5nlfe7sPGbx57UdDmfyj+BQ63gqrP2GntR5hmlMPFoA16bHe6TE
         8NKg==
X-Forwarded-Encrypted: i=1; AKwUvBzSgyEEORGlKS87q/C9BcEakYQFDt2jh2/j3r6+GDaohc617nJkD6x94IfMZ2LeAwhdYnl7K8zRL8EWg70=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjfCzeI+k6jjqaaCOJFvzZMoqwv9tA3dvx9ZjcGwn1mn7oWSb8
	m+RdZxgVTudDyHGjiWkXOUOnQF3Px355GFIhLc8RVXW1C65PP7X3QxaP
X-Gm-Gg: AYBFou20nBTbONRnHay6x57VPqgeOlXP+2NGtKaMylGMCRml3/Og9MNbjYGoWhY0vHc
	hvH+xWnWczKqRwHJ0sPhKT/YREfBN4w4uQPzfs+qNWM6c2cosFPvcr7PclOcfbvCTB+24Kxxuk9
	ik4SE2sGx2s2p87CmqJT/bAz9CUk8wSE3Md8e5pVA+Yxz+ry6qab6tonw5a4XJbAd0tIQ//xdfg
	bmKTMwq1blJSnYQEQdoe+wpUheY1+CWc6OpaOm7gfgO4WlAsO3WT0ktsj6KDnjChf0HbLYXgePg
	/nu3tS2ASkcTAc752sYwzZJL3immXyoBCCC3u/4ryzb1n+/e9M0umOg59UxS63BhQtRGNf0Ivpc
	+RteaKOy+PGJn32n1gEsgGTdOA3M5Xy2dWgFhd+RSBUMKe+ViOp8ouu582KSgNTmEJFdSqQrWgd
	FfUBrg073ueZnWKgoe12Mtsz2o0umOiBmJ4wdN4yFU+F1elz0lAPLLBGviT8XORI9dQF4Cjm4dh
	e3PfEoWVbT91rFAn0hUYmNPArMytl+a+EHrQoESUmZy1Dy93kOZQdmiCu7uW5l3Q5UYJv7UMQM1
	q63Lo7WWcA==
X-Received: by 2002:a17:90b:3e87:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ac36c7c3bemr3209970a91.28.1791959571559;
        Tue, 13 Oct 2026 23:32:51 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:50 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] ASoC: codecs: wm8990: Fix definition of LOMIX AINLMUX Bypass Volume control
Date: Wed, 14 Oct 2026 15:32:29 +0900
Message-ID: <87b3bfa7711b61d89c21044d02fb3242dd934385.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LOMIX AINLMUX bypass volume (LLBLOVOL) is at bits 2:0 of Output
Mixer5, not at bits 5:3, which hold the AINRMUX bypass volume
(LRBLOVOL).

Fixes: f10485e79882 ("[ALSA] ASoC: Add WM8990 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index a3843094866b..5674d97fcd84 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -112,7 +112,7 @@ SOC_SINGLE_TLV("LOMIX RIN3 Bypass Volume", WM8990_OUTPUT_MIXER5,
 SOC_SINGLE_TLV("LOMIX AINRMUX Bypass Volume", WM8990_OUTPUT_MIXER5,
 	WM8990_LRBLOVOL_SHIFT, WM8990_LRBLOVOL_MASK, 1, out_mix_tlv),
 SOC_SINGLE_TLV("LOMIX AINLMUX Bypass Volume", WM8990_OUTPUT_MIXER5,
-	WM8990_LRBLOVOL_SHIFT, WM8990_LRBLOVOL_MASK, 1, out_mix_tlv),
+	WM8990_LLBLOVOL_SHIFT, WM8990_LLBLOVOL_MASK, 1, out_mix_tlv),
 
 /* ROMIX */
 SOC_SINGLE_TLV("ROMIX RIN3 Bypass Volume", WM8990_OUTPUT_MIXER4,
-- 
2.43.0

