Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519A377A9E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271343; cv=none; b=kK9C1R9iVEzAN4cZjgbRwFMkIb02UeSLVsPmssDn3S2JiCpSdStUQjVASm1a57QZV4gKv5SMKqEa0f09eIyueuV+NIpKX2LSmlgMezrUShQ7FbqUpuuJvGMpMhOAomi+B+HSaseG6UofHAP+4cjSC2j/qskOKpNKammcCiXoCUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271343; c=relaxed/simple;
	bh=+d1BJyTkZE2mylxoDGmzUN/eWsKs7b+ZotplNwdeFAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ra61qlnQUkEWcJTtOjFTtXvySGLVwgYdmpQ1lfweehZYtZ6YWHm1fcsr/mH6knbkxh2STh9lmQ6++smGDvBRemh48Ya8d0WhcUFUG8Sxj32DfQ/NtiHfBtk7es8t7zfDjK+4RMnbdCGaU6BEMlETy+P5PYlU99TnQCkC/NaB/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnfVTWnq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnfVTWnq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6e954afbdso6266945ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271341; x=1788876141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJiqhKlCrTwwf/cJleA2B3ljUR61iwycQECqOoNxMUo=;
        b=dnfVTWnq1cdHIQdG1215diuS47XWPqEjIByPM9HoRhR/tC28N5E5rXzaldLyBSfT6K
         bZ5rLMLaC/XysD3tBHUXNCo77mBScGMeX+UTiGAXBWnYTzFrG+fci6GF4CZAqgLHcujC
         nMj9EUIIAJ1IdEkKcwCAX85GjyT7TS3/yS7jgX67F5TtDzJVbmi+Zh5XFD/5ED8kvo/R
         UKICSxivzST/2wDuK1l0Yk7+dR4m5t9yhXsyiJJvYR4kxdrzDOa5rxQLVNKZgxywYRRp
         dLrWXiwjCsIMz12lSi2rB4wP6SIjeHXwkrVU2AFRt3rCQUzS6VCQI1mgtPeW4FelbunK
         D8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271341; x=1788876141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJiqhKlCrTwwf/cJleA2B3ljUR61iwycQECqOoNxMUo=;
        b=SVPHqOw2HpWjW45tmw5bTHv39l7wsAoy4SlphZawJy8/Tkp67hmKIKZ84z0kaOTamI
         2VZyMT0CuCUqcVxEtFNB9YYoWG26nK18bwUA938XuIJXhOjf4cOGbNSpLmHf/8W+duK/
         0jiS5S3THUUemYkved8dKYZO1nf9gQsz141LsQGsmuENNrm/ignuJ2I78TmrVkXOGwdj
         rjzZpihlMqtVLixazeGRQJF+xnY6EL2uXqKEJkFCargBH3mSG7rIk8BDruT3lv21Zv4f
         gyGv67n7TtoRsbW+Cdj1myU5+TjLiot+wFCh7d/82M4OMLFglx6LpyCUVJstUFo+HPpX
         CDBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxvlktG2Bn7tPGyW3sRsqdkRHGQ/6cCgLKLotphiMoR59MGd//sSRnqvFvh4rcbBToA6DGAMXefL+WDWU=@vger.kernel.org
X-Gm-Message-State: AFuF++l6FsBXly0zmHEsdtlxXkL5mBz0qlUq6TBWv0KibuyGpA0223NY
	LYKSPYyVVbbqW8BZ0oOQVe79v6ws8RFiNlzEBVIZ+nL0TdcjOdQ4yNwl
X-Gm-Gg: AYBFou2qfn0ml8/OYgqB+9RLyx+x8KpTjWSvRchosjEEaoOKPNMonVbuenoMDLRftVf
	s/+Wctl70UZ2lpwJUDlw+qQvXOpd/yL4Z0mzrbdl3DtZfrE0Jg4WKiV50PkD5lXB38yNfQYS+Zf
	fToP3vr5DLI22F6PZ4W6XzOfho68YhuFXK4dTk4I+yNfnKd3KpWdfGlccYJbKM7WBL3hUqbdO6J
	wLasJ0EtplCpfVu6Q89OpR8yhVc91xOvLzFq0q5A2e5hC1g7xEuKXDn9b6pqdgdS3U7b4WXbqrU
	Phnj5AX0GRa0FngC2K5UXOxMdmSPV9s8iViERz1p/GSuc81+qBibwEuwpl3RuAD5StfFxNA0a8W
	GLWX6IluNzlt0ejo6ZU9x5+Bju9MO1r0D9ozF5TwZGtjcJTQrHOJ9mr2ZzLl/MhHZF/2EhM/Cxx
	VVs8m/IXE7GC856ThXBSFjQJuri0OtvTgr5e0Wq6/FRm+OfQGf3UrmIwsOBQ==
X-Received: by 2002:a17:903:2b07:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2d8d4defec6mr398333105ad.4.1788271341199;
        Tue, 01 Sep 2026 07:02:21 -0700 (PDT)
Received: from loontop ([163.61.5.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc0b3sm53833895ad.16.2026.09.01.07.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:02:15 -0700 (PDT)
From: Aarav Kumar <aarav.240604@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	ray.wu@amd.com,
	Aarav Kumar <aarav.240604@gmail.com>
Subject: [PATCH] drm/amd/display: use linear backlight curve on Linux
Date: Tue,  1 Sep 2026 19:31:55 +0530
Message-ID: <20260901140155.19129-1-aarav.240604@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power module currently uses a non-linear backlight curve for the
Linux backlight path. This results in incorrect brightness levels on
affected systems.

Use the linear backlight curve instead to preserve the existing
brightness-to-PWM mapping.

Tested on an AMD laptop with an eDP panel. The regression was
reproduced with commit 3c108046e1d6 ("drm/amd/display: Add power
module on Linux"), and the brightness behavior was restored with this
change.

Fixes: 3c108046e1d6 ("drm/amd/display: Add power module on Linux")
Link: https://gitlab.freedesktop.org/drm/amd/-/work_items/5723
Signed-off-by: Aarav Kumar <aarav.240604@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8d690468d..cd10a5d45 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1913,7 +1913,7 @@ static int amdgpu_dm_init_power_module(struct amdgpu_display_manager *dm)
 			!(amdgpu_dc_feature_mask & DC_DISABLE_FRACTIONAL_PWM_MASK);
 		init_data[i].use_custom_backlight_caps = false;
 		init_data[i].custom_backlight_caps_config_no = 0;
-		init_data[i].use_linear_backlight_curve = false;
+		init_data[i].use_linear_backlight_curve = true;
 		init_data[i].def_varibright_enable = 0;
 		init_data[i].varibright_level = 0;
 		/*
-- 
2.55.0

