Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A95448D1E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753790; cv=none; b=C2NgShK1zp0bu+rWkr9Mutf2Xoz8Yw1WFk1HpFCMj0M4WFHSjXmDrBabDk84MvE1OhcvXygZ7VgbcoLYbVn0FbTl9x80whJWq3zH4UXDRMCVViFhhgdXshNQc2m10nC/+DjOXSrgKs1Enrd8AVD88AIVHFeWZA8a/3EvbQXW/HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753790; c=relaxed/simple;
	bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2yOWU6dL9OVk0m7h4zhOWGgukCKgooCPwl2z+aazLPPM+vVxifusXt530/6nuvXjMW84GLtx/MDH8QPh5o8h+es9+0JktFm5HfuI+G5gXyoLMkONsqb9PXvKSSBtgw5szzjuyHfxIK8YuhHmg6tOB7jfJLPtpNNlT5TTFkmB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyB06HAv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyB06HAv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so6120395e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753784; x=1790358584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=hyB06HAvLDt7dWss5SFDnpSt8Z718KO0FlmDbG5Aor6JOI4zaEy8Ui8x8XrqY+GNWh
         MIS+V/D+Rb7KM1P4+BYUcT3jpXPfESLn5QjbxqVle6A0jYObN6Xgj4b2w0xpbdUsFqPD
         9kDtZe/vnLRcmd7WQZiDZKJkVzZwef52ehBk5vFAcS+UtiNl2uxkNvUXF4AFYfutmx42
         pfZlWhAnlHagtiK+gyFzeyQF2v7LunhDFAxc8yUJyAFkSwa7eDs014pDBUuWd+OFaD3n
         W06t1++P2Khvlt7hzTDjwNwnckuMDjmuIAhh7ww82QZ5WuIq9pYL2n95M1MM2eWDL+pV
         NJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753784; x=1790358584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=k1xwAQsRizJoCxJChQG8TnkKqkvvaqXS+bgeqrOk0UKqWwDtQucevXHUjYI5cpWHQX
         nKg6BN7SsdCVhYnBFJR1mztfpi6UbbVHqPbZ8GN1sFJDC5lOYB9cqXZ2T7IhokWKBuWa
         R4zBr0a3N9nryYHGQe+lAuYZLdesUtmZYXo/PM0+YlyKl0nZwHfcIyeUC+vPuDLmD/JA
         vW0mLtx8GBL1mVC1hE3eTe8PrwTI/vrtozTzbkGe8uiP6tawRhzqKshd2vP+0xhAPp5I
         2da96sIz9uKnPUv6xVjt+MwtYtCWlQ+RArp7ioCfnD7CRUH8yf7zrTM5PMChMgca3lii
         +3VQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6Ubkr0F6ZtP/G5JYEnjKSk6Za79YjhyV/uxiujQuEzH+EXDFdnQ/i10gorvPLnqN9ziVNQCQ8ZnaorxY=@vger.kernel.org
X-Gm-Message-State: AFuF++mTx9QARWWgwSxfnXtz9VCkVRNYUU+Jb5yOCAOlFVNn2iSruV4x
	3c2lYJ+6gf6ZHMgQd8AY6/xh1rv2Ys85A5/bPJeHmULGiu4jKP1WefiD
X-Gm-Gg: AYBFou1Q8/grIKwKGQ1mMHerxglWDYKCQMErWJ0HOLDhsY4aiz2IvPmiE9gSarxPgoJ
	vmDs+gPzApuo5nzc0zMyuAi8oypigdlhUX9/0HjHiyn25xMxeOVVZ3EzyWnRIzEdzgF0jH0lZ4B
	Tnke7kig4OcFzRHnm22G3PGwGPHW2nOMngHOursk+aurqWi5wbnyllII81qyYYO6FZJdC4VcLey
	qRRQybTBa14wzUwiXWlADEjjnkw5m/lISzKqAhbgH621fa7iw4QUvx7cQNf3rfD/+mtjEMpCAf7
	Cg6jObGBUhpKJjwZUvRNPYpVnT9/g/FlyzmMgF/eQQ12ttcuanAuh56HwN3fFS4jJp08TzUSGE3
	fRjHi0chO+CJ2BXLjTLY9NytOa5PwuSekUBBwGiJYxfpwzczkJ46ZiVj6AEtj9mBJZJHABLZOBt
	ae4UVsJkMw4zHjSwaCkh+1vRtMenPbCtyDT1GQfiz5ymELTeXyUrGgWbf1SP77E8WSKgtlgOjw3
	ZMppCjQAresi/Jz309eQcngg1k/
X-Received: by 2002:a05:600c:8b61:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49fc574a635mr48839075e9.23.1789753784289;
        Fri, 18 Sep 2026 10:49:44 -0700 (PDT)
Received: from [192.168.1.7] ([185.69.144.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm9867425e9.9.2026.09.18.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:49:43 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Fri, 18 Sep 2026 18:49:31 +0100
Subject: [PATCH v2 3/3] platform/surface: aggregator_registry: Add
 performance profile and fan support for Surface Pro 11
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-surface-pro-11-aggregator-registry-fixes-v2-3-c4ed9335814a@gmail.com>
References: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
In-Reply-To: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789753778; l=918;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
 b=2m9ivocYiMCJ+kj7/8Mgm6+As4HChJGwre9bOebwxo/aMaE3pM3BpuIfOgc2BV537G6wz0JY8
 HQWwnJEXB3YBjUBOOr1IpdSONOHkEUhMuvEhrC8/c3MuZ3q4ASFml/3
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The EC on the Surface Pro 11 exposes the performance profile and fan
interfaces. Enable their associated drivers.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 2cb8278d98ea..061d4a567a06 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -410,7 +410,9 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hub_kip,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
+	&ssam_node_tmp_perf_profile_with_fan,
 	&ssam_node_tmp_sensors,
+	&ssam_node_fan_speed,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,

-- 
2.55.0

