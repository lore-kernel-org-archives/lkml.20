Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA83485505
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963158; cv=none; b=DbqHoiQa5sb8tNw4zZfEPGLdeMg30vf6P+y8dVqWzz4TZK6kfITIQ5xmp6beHcfO8KVNWGBZCiVxnrhIP7QfzZLTf3UCGecJRuyhv38YiEyWED5WxULKOjg3u2Q5uKT1EoZhYPWTqp/Bq8bYPOHVOxeU8cu3xxBY9hKvols5fUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963158; c=relaxed/simple;
	bh=gXTUPaPaUbRcRDR4kgF7IjQcPRSCFGK5KrDp39kJqnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVYqRDVcUddjvGjvhc81TTjEyMMXoj2bHPvRhUrAORstyOeB0MXJK7ScB9Np4+ieEpsTPNw6vZRmf6X4zQziXC/FjnKDuTjzEqHHhiv5TAqK+tEQv8o11VN+Zvi/k5HXQlA+r9fJUzc2Q4EorqLwU8DBp/q5PB/2naa9C1yeze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCRCI14h; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCRCI14h"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48deeadb3fdso86380f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963153; x=1792567953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQ9Vi8ze8lwdPqHYidKfxChexwTLWFdZyXa9tkQZSpQ=;
        b=qCRCI14hHIqMeDgp2NvcNbqKcoIn/KWRNvGWLH+nbRRA1Y6ACO/7f0FcvvxKo+fcEC
         vvOxkE6W0W0BZhv6U3D4knfif2iAHkySu7QGqkEoSqn7WsScK9pFGTPN8QxIxMYl+EHA
         pp7DBF8FigwPxC7Lx0zos7kdRft/XuBVavaxml8ClzSW3zxwCwSnLkVr8ZhUNXMwmcTr
         TsbnFV0D7CIXYefZ81u2Bv0fie0t9HTEN+AUkdRl5fmSv/KxwoGp4EqcdZzZzjfsfx/V
         lOR95I7zziIAvuJNLy80dQaGpFnjRGCIpTbzLsZbBxWfz/b8Cd3lThFJysdYTV2rUrrt
         5dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963153; x=1792567953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ9Vi8ze8lwdPqHYidKfxChexwTLWFdZyXa9tkQZSpQ=;
        b=zzL3tGBVRF0KQbQxh/RZFXV1yBXrx8bT3yuw9ay8uqupoPkjtrUzpVSGgKucodovwJ
         W9VRM8b53dxCRcpXzqtB0JcM8bxUhUQt1Fi59iefPbPAuNXYBgfEpUjm8V59YLKpYCbk
         nachVUpLU66EzL48c9jzqF/UJnMY39lNUpODPypHQCZL93NwxxXCkOeHFjEU0288b+gG
         8bpqskIyOTtCpOs/8kQU+2TdAY+W0PJu4R/CfRTAr60NIsNQkPfaHB3uXwhQMsY8HIXD
         YT6VAu+K2FkTDSR5KcTQS7BjgTy3FqAONXRpU2VxSlTqNSLc5QTzaeOQaiO+KoPipdAX
         Cyiw==
X-Forwarded-Encrypted: i=1; AKwUvBxiPQW/UjjVkQxs+FXzSxGGL1VjTy7TV6kKtvSEmdKc1k0EX/vWIIsLE9fraDqfWc1xZdFY8DG7L+CkaKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYICz4+5VeX1jJR69opF5OYZd4OZ4Hw672M4TOIrfM4CKYrziyOW
	aqB2+B3DtjhTTMLkkM0487RiLpmOIkAxf/ZYTUTnM0ZKOH3mPFojEhol
X-Gm-Gg: AYBFou0yEZAuw0YcLORPEB7hwOjSUbs3HDMhtuhLihrJ8UqSI5p5/pnH5ePrdJlGbGs
	jGbF9pMriFsEPI/wz5jvCO4MLhJdJUji3FukIhLaWL49K1jPDBQ1kvdJLdrbPAgbWkqv4iTwd6/
	v/TeEgnGciSlKXIBf3w6PLe0AXxkxotJlwbNG/s4rwIIOkA/tPA1SwPSk3YCUIuXRY10UHQiknf
	64t5qqg4CZ5xR2pEbzXtakfx7kf8Tb7t+o8kNZ6Cn2WTg7VM5OXx8ssXlafKWa0+0FcKL2726ef
	yZeWvk4ge9ecxob468pHnyh0wirCa6bEk6+1X/ez3QlvxkOjeJHo6Jg/w1DjUEWR6Up2gwjyKsC
	SjBtVME5HQlyQPKiZqfWO0J0cU4EeC5U3uhIudwRgWddCnseDQAn+kU5XVkW7yvykM3YQbqW2au
	YBzwc4+ZLh3WuZBtzw5TJGIf/WfvLNZY+8LOYv1qq/FeyicMOFs6JVUwaScct34X4vmJ4ESMzGn
	vRc40ty8+WALA==
X-Received: by 2002:a05:6000:2906:b0:48b:226:839 with SMTP id ffacd0b85a97d-48dbaaed220mr27241742f8f.14.1791963153131;
        Wed, 14 Oct 2026 00:32:33 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:9cb0:7d9f:2fd:3903])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967bf5sm9622415f8f.5.2026.10.14.00.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:32:32 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] drm/amd/pm: propagate errors when forcing SMU11 clock levels
Date: Wed, 14 Oct 2026 10:32:28 +0300
Message-ID: <20261014073228.2095339-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

navi10_force_clk_levels() and sienna_cichlid_force_clk_levels()
return success when a DPM frequency lookup or soft frequency range
update fails. smu_force_smuclk_levels() then records the requested
clock mask even though the operation failed.

Return the helper error from both callbacks instead to improve
observability. No obvious reason to clobber the return values here.

Fixes: db439ca21b81f ("drm/amd/powerplay: add function force_clk_levels for navi10")
Fixes: b455159c05313 ("drm/amdgpu/powerplay: add initial swSMU support for sienna_cichlid (v2)")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 6 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index f8ca5eb9adc6..2d05088619f6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -1439,15 +1439,15 @@ static int navi10_force_clk_levels(struct smu_context *smu,
 
 		ret = smu_v11_0_get_dpm_freq_by_index(smu, clk_type, soft_min_level, &min_freq);
 		if (ret)
-			return 0;
+			return ret;
 
 		ret = smu_v11_0_get_dpm_freq_by_index(smu, clk_type, soft_max_level, &max_freq);
 		if (ret)
-			return 0;
+			return ret;
 
 		ret = smu_v11_0_set_soft_freq_limited_range(smu, clk_type, min_freq, max_freq, false);
 		if (ret)
-			return 0;
+			return ret;
 		break;
 	case SMU_DCEFCLK:
 		dev_info(smu->adev->dev, "Setting DCEFCLK min/max dpm level is not supported!\n");
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index b42897e7c066..4ef3863fae1a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -1460,7 +1460,7 @@ static int sienna_cichlid_force_clk_levels(struct smu_context *smu,
 	}
 
 forec_level_out:
-	return 0;
+	return ret;
 }
 
 static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu)

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.43.0

