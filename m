Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE7D4AB3AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378830; cv=none; b=OavlXsppTVis0x/xn7Exriy4ka6GBZ0AtDOeY9EeY5STbLnuCiP3tWpbGdqxAIX4rQB1mZ0kC3I+kNti7ua5A28406Wc7XdpuB0ONLpVVBz81xmS+JmhpbfTmFbmhHdjwOXZXBKnW2lqEXVoAoywHPskXGZyxD/udNLVfsM1Sgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378830; c=relaxed/simple;
	bh=RhLVAJh+uMum/PtsHXFjeBWU17MBBlUHI447nD9sKy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbxUMDI+i/Q0wBLhABK13np65neL6eG61SYxVueDc1KGHS4jHyO2ANpxh5tqtFAY+u56mTjQfuW/S5XsINzjIpd0Tu/pYg36dtpv6EkLCMOS+WPwthJ0YAceYjwxd/CWpz60dOKiqWZqrmOsRXYbku28XfkL02zirP8xRXW5E9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGBDj4JV; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGBDj4JV"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-3a772511049so25233961fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791378820; x=1791983620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7raFCL+DaDHQ/Xzt3dKVl/XyqPmVrA37jhza1G8kvFU=;
        b=jGBDj4JVtGpl8TMFh1MEzDz41ipbKi0MpHpKRwf8c+ceCtivh3G7puJUnb4goryXgO
         tUr8owFOG78ddLVdBhCroFeFC3q/pz4stAMRiSTFtFH15km73i0s9bH48WQt9nMWL0tH
         2+tpcred9d1ogGDykFWbzw0X3ih7U+ZmOI1rJHXjIP9ouNvLxuJMr/OO+cSYzARwG+Jk
         tIlEKzOWaLZax2o1BqxVsUEhGl+apJGWduSIBfvi4w7mQcZ1YANu9dldstltn6FlvYro
         FiAhYePCKjx9E1k5odwLDQ8CX0pQThB7Ea9VNk3TEASGoHRIMg2jV0wzNxLISisz7W9d
         o0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378820; x=1791983620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7raFCL+DaDHQ/Xzt3dKVl/XyqPmVrA37jhza1G8kvFU=;
        b=tMuOazSoCd2HjTJb5eqZ2feUs2t+dXJgXTSmSVaO4uS6LB5/RR4+eIeNLCbjHqojgf
         FJmaPTAmFmWmKragmdAzwlLBmW75AIf62OLhgKpoAYk8xjnV/+bKkOAdczvb/wDcNSne
         fBBbsTOSMtDj+tGwDAX4MSqHXaVeRKZVQUhf/rEREd8Sp06LZOtASKB9oTnWzog4qsys
         NgqH48gorQl00IUdjcMijaxs69zoCO3q8LqGyfw8tHldkUU3WZUEs2IVLyiCVKFRrAmA
         CX3rJVify0vU2bduep8Zjgrb9aBa3q0lQVOMOLkq760bmJUBF/klADPoWeA9yVpsv+Dx
         zKtA==
X-Forwarded-Encrypted: i=1; AKwUvBzELWNlsM5ZRY1sA0Ipa52GZkgq3lqbonnh0iqr+qWYkgceBo6kFYYYopd9KUk8gi14af3NMkBL4yby5JA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5DcZUMpElTZ9DlwvjJcHwP4E0OclDzogJgN5a/7vpxlu40hje
	iddtSkkrYEB+mEUgjZyqY1zpM20MLlF3NI1MJfvSP4zhdwfJqKOFBUKhKw6Adaos
X-Gm-Gg: AYBFou2rcPx/gjmjUmTHHnMqBcsOJyzSIDgCsIRX17G58DaV9WufGWLCypFjk7wV0NM
	Z6ecC23SeY9HjzgAdGxBPLxfC6irwjjGYrmnRP2yxAFGMH4c0lHeweS0CVnq5oYFjCBHlZaFcCM
	iOPADQu0IWUv7Z3NVL2xbYNqpaLR/pydVIXcJdZdRESjiLXjA2UYpYWO+dHF68nyCQXgum6adc1
	WhRKsUkc8sHCdt+H3iTI6zlbwnCtJ3bmPeOth21xaKa3yd47lDhQ6QIckOuNV2yYHN3ocZaBQrf
	iNrBncfsG32hlyCEb3w5O0Avdrqw0NXJ/DO5vZnt2fKgW1iUqTtmPs2MuUVBV8GsFtrnpP9HSKu
	WbcfwNz459RYq3NY/nmoms0nyGs8mEVzSVkLpHdL5t8gcUBR+oWAlG3wD4rEkXElYArCrQVTuCr
	OpjTH/6KTL0lexEfafViy1EwQK237i7dNfe8qbXgFYCB53+zzQPcoNASA9W5GwgMSEU9NWKdWwZ
	x4YbGYAuqKcC3GS
X-Received: by 2002:a05:6512:4027:b0:5bc:c63f:7004 with SMTP id 2adb3069b0e04-5bcd072ddc7mr896476e87.48.1791378820139;
        Wed, 07 Oct 2026 06:13:40 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd309149asm21640e87.53.2026.10.07.06.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:13:39 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Ray Wu <ray.wu@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>
Subject: [PATCH 6.1] drm/amd/display: Fix out-of-bounds read in dp_get_eq_aux_rd_interval()
Date: Wed,  7 Oct 2026 16:13:33 +0300
Message-ID: <20261007131333.120389-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harry Wentland <harry.wentland@amd.com>

commit e8b4d37eba05141ee01794fc6b7f2da808cee83b upstream.

[Why & How]
The aux_rd_interval array in struct dc_lttpr_caps is declared with
MAX_REPEATER_CNT - 1 (7) elements, indexed 0..6. However, the offset
parameter passed to dp_get_eq_aux_rd_interval() can be as large as
MAX_REPEATER_CNT (8) when a sink reports 8 LTTPR repeaters via DPCD.
This leads to an out-of-bounds read of aux_rd_interval[7] when offset
is 8.

Fix this by growing aux_rd_interval to MAX_REPEATER_CNT elements to
accommodate the full range of valid repeater counts defined by the DP
spec.

Assisted-by: GitHub Copilot:Claude claude-4-opus
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit a55a458a8df37a65ffda5cf721d554a8f74f6b04)
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-53330

 drivers/gpu/drm/amd/display/dc/dc_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 6050a3469a57..579a38478d0f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -403,7 +403,7 @@ struct dc_lttpr_caps {
 	uint8_t max_ext_timeout;
 	union dp_main_link_channel_coding_lttpr_cap main_link_channel_coding;
 	union dp_128b_132b_supported_lttpr_link_rates supported_128b_132b_rates;
-	uint8_t aux_rd_interval[MAX_REPEATER_CNT - 1];
+	uint8_t aux_rd_interval[MAX_REPEATER_CNT];
 };
 
 struct dc_dongle_dfp_cap_ext {
-- 
2.53.0

