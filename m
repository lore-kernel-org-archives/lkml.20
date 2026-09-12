Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79020ED
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225439; cv=none; b=BAHptrbZqGJApIz+vEMz9kfju/LXNeyGiX1mtN74Cov0KZVXGGGVvWpwTYzv9dOnpA+DHqLuk9+knKrIZWdSE1ljqGkAqIveCwX+nrvjS/zoAzTapYoXmSFi/Vx4eBZF/XAAX1rUS4EV2RuP68MgH2rmhJnto4a7MqgxVnggZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225439; c=relaxed/simple;
	bh=4BtzjXbv8TXFdy0rBId0wD7zpu+rk1xUtAGVvFyK3/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksNlEp1Wwxj3MNQSoazQynToPhZyvat6bjuFdaRTLb4jH0zPXjhfD81RJZ9m0t19uSmyVWRdwPKx+/TzUARXDiXkn2HFBzchx67zYVDQwEecaB80HozbMPOHos01vm0ELsY0s/CH/hLvssMdH2TAYE+aoXx2HDIMPLu1dofEu/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cquISq0k; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cquISq0k"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49e63568bfbso14582295e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789225436; x=1789830236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W/ljStNwe21EAHMT5pfp7bjQZDrUvNzZwLlTRaNK94Q=;
        b=cquISq0kIPECTT1wbeNIdRkb2cbZG8esKDmaIfo1v5dUuf2lT0PJE7aZs/Ew3JUTIJ
         rCL6kxRgVRPCpm4ZB7VODDYrF0Vn3JJuzm5OoGxRgvBlViOpUH+DfdnplWhwkBEKGe0V
         dRbb8V7MRQsOYbK0wRWLgmRzfZ4htu/oEELPrTZL6Gsq+fm8SWRZyL1hy5US+UQRh/73
         +y8Y3Pp5hfqueem8vH/peByWQFzPW7GWoLjwDFgYNtuUML1iWSsmJ8EPXGlkBzKtdGiT
         50FAVdRsS49c/JQl2ZmLFzHRWxLJl5NajOzRgohz1EO6Q2yurDieFVkKvzVhQj+s/7X7
         12qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225436; x=1789830236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/ljStNwe21EAHMT5pfp7bjQZDrUvNzZwLlTRaNK94Q=;
        b=J0gDYnRvG1X24tLhuvN2WuR8D/HZbyZLFErbq8MhX33qrdgq0YGGxdF3TG2GzvVQZT
         o12OZbBQwIc9nP3+QoMANGMQ9NljsoMh9zQpCXdxKQEc5wxw19PV8khyiqGmYERYQcfG
         FnXDiqjkzFmLVpoSOZIR76CeNgW5CbR9TgS7Y9R4q2KvOfalOwxXZlBJXuy2KY6JRGdU
         XsDZ/Cb8d+W+6QMsAYO4DrJsehjzVCNhrbdha4eNOTDNlS/aNyX3TOOZ+bchSyA1UbMs
         vNIfpRbdyXZcA3XOrf/teqPcibLigEpKhqeK/Q7/ZNPB5CvQFKetjPsNxz83Jt2Zt9cU
         Nj8Q==
X-Forwarded-Encrypted: i=1; AKwUvByEAOTJ6JB4RRv6AcwgRHeZToiJTce5eDqJeJlA7x9e/8i/GmolITcFot4DVOeI0isYIQnOGBmal23hCVU=@vger.kernel.org
X-Gm-Message-State: AFuF++nHbyjg6msG+80mHay983Tss5GS8OHXDc81IZJZmgoFmMhe0WKs
	c5lBIn3A0VZzvW0Rn41PGUrivGCfu2srnGdQJJz8Y4ULaqwS48VUGy2R
X-Gm-Gg: AYBFou3bzPHXPZ/tiYImGQNTxleyYwj5YnR9W4TLqdmAC+e3ecnKfskCEUBSu/5A+Jo
	QkenDbfdsUXSV8nv08paiJg2QGUbuFDyPJ8UKo8jLHfeulil5SAgRJYK7VFi6Y38BW8ISD8VdFF
	6OU6TmndMsB9Kei8w2XvcZB3IocCCmJEO69sadz7KtAgRDpLNK7KMvZhiqXLIyok3kW3Uvkxacv
	a/xKNhTskOb2CYbjiru+9VODNb8lMDCX4u8LesQm1vcEGINdynY9uxdoar08KivvnP9rm9irgfU
	6yDTW2O82Vs13hczH7tk34M1renJ510HHerVVVXwlTLXljr1/FI1VW3vExPNn5NGy51lE/4DOTh
	cPnlAKAKg0ctBBuLffV2E8o/H8lgg2XlhMjDr+Is/KzU8j0SjZaoO2o2cPs1/394ctUd3mpCf3H
	+rSxfyDQ2TjDIgcf/yr0kgl/iMfGYGqN8dR+vZ74Ed30vXidJtSXFCF9+wQ1sT7duJimA9r9O8b
	jUb8g==
X-Received: by 2002:a05:600c:3b8c:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49e73d379e4mr9568925e9.0.1789225435447;
        Sat, 12 Sep 2026 08:03:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm69964935e9.3.2026.09.12.08.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:03:54 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:03:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Asad Kamal <asad.kamal@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Likun Gao <Likun.Gao@amd.com>,
	Sonny Jiang <sonny.jiang@amd.com>,
	Gabriel Almeida <gabrielsousa230@gmail.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/amdgpu: Remove redundant mode2 restore check
Message-ID: <94ccd0e0f47be9ec1985cbc786093c01d7693aa5.1789224159.git.error27@gmail.com>
References: <cover.1789224159.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789224159.git.error27@gmail.com>

The "r" variable is checked twice.  We already know it is zero/success
at this point so there is no need to check again.  Delete the redundant
check and pull the code in a tab.

Fixes: 208e5d4b3f1e2 ("drm/amd/amdgpu: Add soc_v1_0 reset handler")
Assisted-by: Codex:GPT-5
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
In retrospect, I probably could have deleted these tabs without AI help.

 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc_v1_0.c b/drivers/gpu/drm/amd/amdgpu/soc_v1_0.c
index 757da0a30fdc..39a748e38e9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc_v1_0.c
@@ -729,19 +729,16 @@ soc_v1_0_mode2_restore_hwcontext(struct amdgpu_reset_control *reset_ctl,
 
 		amdgpu_ras_resume(tmp_adev);
 
-		if (!r) {
-			amdgpu_set_init_level(tmp_adev,
-					      AMDGPU_INIT_LEVEL_DEFAULT);
-			amdgpu_irq_gpu_reset_resume_helper(tmp_adev);
+		amdgpu_set_init_level(tmp_adev, AMDGPU_INIT_LEVEL_DEFAULT);
+		amdgpu_irq_gpu_reset_resume_helper(tmp_adev);
 
-			r = amdgpu_ib_ring_tests(tmp_adev);
-			if (r) {
-				dev_err(tmp_adev->dev,
-					"ib ring test failed (%d).\n", r);
-				r = -EAGAIN;
-				tmp_adev->asic_reset_res = r;
-				goto end;
-			}
+		r = amdgpu_ib_ring_tests(tmp_adev);
+		if (r) {
+			dev_err(tmp_adev->dev,
+				"ib ring test failed (%d).\n", r);
+			r = -EAGAIN;
+			tmp_adev->asic_reset_res = r;
+			goto end;
 		}
 	}
 
-- 
2.53.0

