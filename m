Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837042264A3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042071; cv=none; b=SMEc41+UmJQeDs/GxBqFBVEXvLtX+RjMnhqiCcmQwLGwqmD44q2bz7lFsEoKdbosn2Y0mDkV9xSuWTZBm/J+5sREEZONwvrqrF9cCMEaOlNBYV9fxMwOOEsqsHunRqpf4K/g6qx6SdCWsB1YMuEqp8BevqzdfjSTh2lPDjv0k1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042071; c=relaxed/simple;
	bh=snnKOJNe4BYR9TTA68LXccoNtMP9wegNSvGiytmU0dM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBPr4NtqAYLFifbq/of8RvyB5AvnP2F9fDZIVQ3Eh03V8plNbfHVcUd1+AJG29CUQXMQYoURJaI41Ephdn7CUWBdYh53x7rqYU8LU4xt4lNkE/q92VF8AEGG4OTAlRZEZSKudNe6ffXzB4i2M5+t1oHcIMPKe+NH34+5Zzx0guI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owyRvgtN; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owyRvgtN"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso1308880e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042069; x=1790646869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cyk+VZJdV3suIAqf0J24P3aiMZPO/cLIo47aUCTTlQ=;
        b=owyRvgtNEBTJxRU2R/wcZxU/6Bvs7vbIOgNM7dMr396kScrVSYjSieZ+D5h2zKpBrQ
         UVL7hwnMckmzZklATZiA3XklVFkW9zmQEGAaFrkvKpJantXhwvV6aSsUbXl1A30Oz0Cd
         6WYZA4tYZaV5isS/8KF+X8UDpfU25hPDZJknktQzlIL+ypACPsGJVQD2pEn30FBH/M9Z
         4gzjlhm0FN0C8r1DsoV5tn7WcSBUNA8jWW/13l2MGecedgZS860h1R1G1PU9MCQ1+BZE
         VRQ3fhVfzRZqKtwURmhLB2W9r30CifoK7hYVEpqMqtoP6E4z35JuX+DOUkdx+oiKqoJG
         eGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042069; x=1790646869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cyk+VZJdV3suIAqf0J24P3aiMZPO/cLIo47aUCTTlQ=;
        b=sUXo7QNj2cgL9auZuIpuVnCVwlt5qYLLruvtY4PCpV4TrePsyQfKXNYK80GIZnOkdJ
         K76h8dZqowf8rsoGEi3ED/5rIigPysZISUpvQ/SyadtbCq/fJOLp/R2XypCABq74Kqo9
         F0tgeo3LTKYlNKSdm6B7n1E76IS1mbN0hrXv5TCnPMGrtQKtjNjAJ2P+vfJYs5pFWtA3
         TEYN45K6X89bnHaVTz9JxPPMIhHIgzZWFAjegqGLbpJQ7xHtLyDTonh/TooSidGQoEr2
         mJRlUDeSXJlCsFmD/6EJEXGTf8oX0ftEn8J3Y04ifB1I6fOZpSVskwgFA7izp5rZy3UV
         fVcg==
X-Forwarded-Encrypted: i=1; AKwUvByNvIkzqhxz45I+woAcyNpHsMTKKDIx0k6EX9wSv7YhQlG/JQpVr52eUWU5NyRMORKb9VaPM2uglpftel0=@vger.kernel.org
X-Gm-Message-State: AFuF++nihsnEzhC5TA9EUuopkG5dvbf5aFcfSjhyAq8b9h55c3YItNDb
	/rzxLhUCMi8lJHlZ9PREhzmd8s0deU15y1kK2zHq06uJzvVCkk+d9J8s
X-Gm-Gg: AYBFou2l7uzndqVir3Jw9A+JYyvnHmXON5p6GAPY0q03PsLqX6K5RziZeUSv8FZsdjz
	bSaQM467Fr68uFINnUIIspy4vjZQtGN9ef0tS2Y9QUbJipiE+Ue+aFvtgYCHZcgTg/4SGX9Nu9q
	PnmQ1JPDzA2uucS6Je/vbP535JR+FCOsU9jI0XktskMusWB5P+JUGCitvFtVMUr+vaj3DdSi9zm
	6c67VKK7qFdNpLunSRjZwZBq2K0NzTQmc8igwNBfywqNETjSLK8nZKch5tofjKzIyOH+hlekexC
	pV1ZuDaF0EZhYSiRyMrZjy8kh/KFPaXNU4UPdFJAreI2Y3ndLwaSh4hDwl2mIX3qCc0DcJ8kXZO
	xMztepT8XeX8JyMVmLW+LH7MfX3AXhdJ2QGTxKBJ+vrVLWrBJ7dtIm+gFovvJwfQQtSzPxaUlGQ
	uwvezRVPmvrHDrkxgXmFGx89pQKhSqgGi3dgW0L4lDBFennKI5ZDk6dv4Wv6QfM+lqciQFc5rX4
	eWQbfQuSIKuwAHwxkRNMpn2No1S/tWVTjuRZMKK
X-Received: by 2002:a05:6122:3281:b0:5bf:8955:a8ce with SMTP id 71dfb90a1353d-5c9b58fa150mr7030545e0c.1.1790042069444;
        Mon, 21 Sep 2026 18:54:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:5698:1029:f600:548c:a202:2a24:b2c2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9e7d09aa0sm314462e0c.10.2026.09.21.18.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:54:29 -0700 (PDT)
From: Willian Oliveira <williandossantosdeoliveira287@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Willian Oliveira <williandossantosdeoliveira287@gmail.com>
Subject: [PATCH] drm/amdgpu/gfx6: fix firmware leak on teardown
Date: Mon, 21 Sep 2026 22:54:10 -0300
Message-ID: <20260922015411.116292-1-williandossantosdeoliveira287@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware requested in gfx_v6_0_init_microcode() is not released
when the GFX block is torn down, leaking the firmware resources.

Add gfx_v6_0_free_microcode() and call it from gfx_v6_0_sw_fini()
to release the PFP, ME, CE and RLC firmware.

Signed-off-by: Willian Oliveira <williandossantosdeoliveira287@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 95e939363db6..a5553d181d97 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -322,6 +322,14 @@ static const u32 verde_rlc_save_restore_register_list[] =
 	0x00000000
 };
 
+static void gfx_v6_0_free_microcode(struct amdgpu_device *adev)
+{
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.ce_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+}
+
 static int gfx_v6_0_init_microcode(struct amdgpu_device *adev)
 {
 	const char *chip_name;
@@ -3254,6 +3262,7 @@ static int gfx_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 		amdgpu_ring_fini(&adev->gfx.compute_ring[i]);
 
 	amdgpu_gfx_rlc_fini(adev);
+	gfx_v6_0_free_microcode(adev);
 
 	return 0;
 }
-- 
2.47.3

