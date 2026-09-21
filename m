Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134583ADBA5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986809; cv=none; b=IVU0y3W+Yyurnf7CocCLeNZ3vyjrwvIVDc8/LRSbiC7SY0dei6o5W5P4O31d+YXeKNL+el2fXeKPRSmqvCFu11lKEXV09bZfjOzTdLnGnVN/AtjsFcSirZsjglKLE77jL4THkOBeKZ5CYCuuUowkFDbqv80fhJ3SNnwoFj+JkFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986809; c=relaxed/simple;
	bh=vAqYnvLkKIWlQwQLLe9/d73/xtPVyLjg+aHrIsasr+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyWBef4kvvfH64sEKlxzGzuPEfV00Nv/yhdMH9C7tdGgsv1T3fYaxoFb99O/MPnFobh2GUyRNWyyHIKI5RXk5L2HP2R+gIM+zPuqtbeAxe3Dhna2LtQM17V54tIpwgxAUYKrroYMLrw2D+3U+xYrU4DUzmUctgwDeWciUFA5iEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHS66SOs; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHS66SOs"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso3037601a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986807; x=1790591607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOJu4MS3w9MQaaK/54wLQUMKD8EsXJhG30omKcb0Cl4=;
        b=iHS66SOsMQ2Qu36qffkUlw1wbS1eQyg4hqNnLpzwMBWv2ZNnOlAoo+HWeTDXwbQSpZ
         InfsBf39I6WBMSjjzyrdyC4rLw/A/EsHLDU+gHrnU2ef7iVV/HSsvY5ZgT1+wy8DKNTW
         e6FESBj+6tmow+0txylVlTfuXrNhGlB5MGAJyZLWKT6lEvKBh7BRqMI0Ytgr1NEgOmRQ
         ajJirAjdycEDQ1vMM4B/CFb3hwgc/ics/OJFqfa3Evq30cgB+oUg0qvQYQNS9YGJnpfB
         dxLyaZcntdbEdqmYNaOuCRi9xlX8SP3DIMS1YgWEdvxILlt+pdxSbD/x4ZKPGSt14R/j
         espw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986807; x=1790591607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOJu4MS3w9MQaaK/54wLQUMKD8EsXJhG30omKcb0Cl4=;
        b=IR/xsjtUd0bZvdWFHsAKJCh24saD93GPiarqSrc0+qCQcvtxiFWUBpK4+hNTYuNmlC
         msCd+EGqr1OQTfri54RodVUOHjL7gXkLSAGkh0tSMZcZyultFpeFRb2JJcX8KE5yeIVI
         nmxysoG+em2ECpRXdP4x3zxH3aM2vYY3ct7W5LUInozfrG0z5XeIhi5C+CGwEz1dPJOb
         szj5yBIHYqhnjLiApsBJevt4TfrDEO1Dr9Y2FClXNr1eIJSix872WAs3stz3cvKRFIHs
         ZabfrtYvh5Umotv97mVheXeZm+gUusOWhSMKWuCdnAv1QVi82fYVETCsts1bgTTDV2Zz
         3AOg==
X-Forwarded-Encrypted: i=1; AKwUvBxZZ+0xln0b3NlO1bzeesvGgs5lu8sLuDTN1A5WmWMNQ4B+tVuAb3r6WJZ7awh473s+D8i+lol9g6ftPag=@vger.kernel.org
X-Gm-Message-State: AFuF++ndlFCVN1n9wfQJye0fpoI5OfC5dXkzyNEBh2mDYNj9GpXIZLl0
	gN6tJ+F2Af8xu9TMGGZirNq3iaWYX2AE6ZNso9REZTbW1OHLfEDVszht
X-Gm-Gg: AYBFou3FgU2EtcARjslc1qc8fhyHMLmbF3UIQd0HC1VJoVx9yJOQt48mPLNxifBLDwX
	5Rr5h+bYhsKcIplWYkrNjIpCSK6MwpCPggaZF5WPXNqMBbl524dOUXfRcqNxOc04YOMuBzAtF9K
	tZw3mzGiy591d/kSTFaU1O0pN+5gGUrwZd29UdbiDFfiMOGjuWLhffSFkyTwkm0LhLwpD3bRGvE
	s5LkHv/9BBr0QLAr/shHqM2EXqMQ3XhVd1Xj4E+cuhKKZjn0daNOuvJpG4qvrFVd1j7Nn/H+HVD
	c0V+IpwsAxpkPpeWhOoKL1VA6MJCVVqnd9ZuylQiUMsAQvReTr2GQIEUlZX7hKTJOC+2QhR2NxW
	cWV47mJOkbI/Hs9wOgNu/7BkqSWKNVZKEA3dr+hKTg05YyTwOB6L8UdTKyRi+Vuyg1DeWTMmE8K
	qMjMix1MYOi2Dc3qUMkhDbgA+jMaTLtUVbVHUkC9dJ1fj07DUFQQntBg==
X-Received: by 2002:a17:90b:1b03:b0:39d:f254:4173 with SMTP id 98e67ed59e1d1-39e54ea5e89mr16601552a91.21.1789986807374;
        Mon, 21 Sep 2026 03:33:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a023e44854sm4994658a91.4.2026.09.21.03.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:33:26 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ce Sun <cesun102@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Brady Norander <bradynorander@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix ACP MFD device leak on init failure
Date: Mon, 21 Sep 2026 18:33:18 +0800
Message-ID: <20260921103318.353216-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acp_hw_init() registers ACP child devices with mfd_add_devices() before
attaching them to the ACP power domain and initializing the hardware.

If attaching a child to the power domain fails, or if the ACP reset or
clock enable operation times out, the failure path frees only the
source cell, resource, and platform-data allocations. The child
platform devices already registered by mfd_add_devices() remain
registered and are never released.

Remove the children from the power domain and unregister the MFD
devices on failures that occur after mfd_add_devices() succeeds. Keep
mfd_add_devices() failures on the existing cleanup path since the MFD
core already rolls back partially registered children itself.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 25030321ba28 ("drm/amd: add pm domain for ACP IP sub blocks")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 9014678d75ab..be4d00ac96b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -318,7 +318,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 		r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
 					  acp_genpd_add_device);
 		if (r)
-			goto failure;
+			goto failure_remove_mfd;
 		break;
 	}
 	default:
@@ -443,7 +443,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 		r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
 					  acp_genpd_add_device);
 		if (r)
-			goto failure;
+			goto failure_remove_mfd;
 	}
 
 	/* Assert Soft reset of ACP */
@@ -461,7 +461,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 		if (--count == 0) {
 			dev_err(&adev->pdev->dev, "Failed to reset ACP\n");
 			r = -ETIMEDOUT;
-			goto failure;
+			goto failure_remove_mfd;
 		}
 		udelay(100);
 	}
@@ -479,7 +479,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 		if (--count == 0) {
 			dev_err(&adev->pdev->dev, "Failed to reset ACP\n");
 			r = -ETIMEDOUT;
-			goto failure;
+			goto failure_remove_mfd;
 		}
 		udelay(100);
 	}
@@ -489,6 +489,11 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 	cgs_write_register(adev->acp.cgs_device, mmACP_SOFT_RESET, val);
 	return 0;
 
+failure_remove_mfd:
+	device_for_each_child(adev->acp.parent, NULL,
+			      acp_genpd_remove_device);
+	mfd_remove_devices(adev->acp.parent);
+
 failure:
 	kfree(adev->acp.i2s_pdata);
 	kfree(adev->acp.acp_res);
-- 
2.43.0

