Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AC7485519
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846501; cv=none; b=u4RY+uLN/CpKRnsuXg+Z3od5gxx3Chqn+UQsvSM+t/XopVji5UE/5QjF/UDU3xU7G9QdCfOd013dnTXBFSCjm6S5S83j70dBbjYRSqIdORLMYvUr44KhE2Cu4xvP/pou/4Rie4OO3adamvCsiMhOrWq5mrRaQyosCIS0Q0gBI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846501; c=relaxed/simple;
	bh=z3xqMp1MUI+DdpcryOxO1d3qlD/FUcrPFBehjuu5bQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srwvyDdCvIyw9CBSQ6YyjjBzM9AxEHszzDnxN259J2tlym5XCmtMmZR1MffyeLC2AHl5aPjIyyn3HifHrroEnudwkFTFPe+TdC9kJteB8GBFXv23T3QKLxBanfrV0ehQ6SCyHaepT4f6r/zar39CKRl7XgUHmQ9/ugjQyylesW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=H7p2Wuwe; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="H7p2Wuwe"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-853c947bfefso1090920b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787846496; x=1788451296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sryVqJwijt526l6++VdXSITZiFhPfcV5wF4kc67w4s=;
        b=H7p2WuweXCRxDgU+uRpGmKKl0ZVCFEJtDKal39tan6LK/lsw2qcpYHTVTVonGsfJwF
         V+bTAzIMkC+hUlWQTfkfOd2Cgx1fYg+BzCV99JndZVRISo76XVuRFrldtfRJ30H6NzXz
         DtgSmF3os2f7plpGLDcbLD5FAQrxT207RvBZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846496; x=1788451296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7sryVqJwijt526l6++VdXSITZiFhPfcV5wF4kc67w4s=;
        b=ADDHdsJI8bq3cGSn0IqKbIH6x0NbAbg+Afvr5Xocp4C7qK3hW1PzT+xCcetcu3z2l5
         fllgbC9qmCTeuTTe1tCCtskm7la5H49YBOWQskbai7/K0Vckt63/RqrsM/UmrwvTWtY/
         86mv+j+KIJvcsHu0gUT0H3KNgBQbHdeN+/+bqnqTxqn1LvzET3WJWcfry/S3oj3wk1+M
         OBG6etRUR12L/QSlctokw2ZcGvSU11Ekm9PyowYoWKKL/HJ6FIuxFC9R0oyUDheDMRz8
         TgRZlNvSSjtTJP4LmRrmlrxLqLWlDDnypm79gQRI89TbihcuicWjQHTyDEDedQI2O2Ea
         XisQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6JM28ExGLTqijEW+SD1QXmxLcc8KSnOYVz8/n6mILrBVFzWTE839DZ/pZRB16Z4fzCoDBvrLu5gvK7eI=@vger.kernel.org
X-Gm-Message-State: AFuF++nvYYfZ6E3cDZhgJpFd45sClKoIacMe8ktnTJ2GHlJ1PU93eQho
	57A/tJGuc0NVNpqtiJ2JPpMtEUq8C8JoWnzgMYiO8OurcEI3aPR4HvD4r4JCQxGQBkMjqq/EUc0
	weMIxOovzQw==
X-Gm-Gg: AR+sD12cZVFlUy8WVIle0/91WRdmsM5l3f64qJlKbebwRuHZnK5I+ERlzCUnWV1VElK
	X4L7kCtX5r6POOglHmekdp4NlcVhFnbex+0wUlGZPcQ07VO+gWKQaV6Sief1DzIJEkLDIfI4L1p
	MXy1Sgkw8IKQ/auGy7RykDEYDeSY/z4WSgbZjI2AI8gB+1rDfQtVXaNonM6s5u+iq8Q/fGGld6u
	k7stQ2D59taR56zlDvqLmR7UraZiryjdLAZRVv//rIdpL3Cmp5bF2Ba+SB6dQwl2uWWrAaqy75T
	CUfts6v04R82oc7p3WUBClnqvbTjm355Fc9VCu/f1WlSO5VGHJFKIq5mpzp98da0ExZLHlaCCaJ
	Etlh4Xsb5HNt6EXdgcOnPeNCKLqIlCEpwpMsVyeABqDDR68zicsxfZH86SDGKmuIefxMMMHzfkz
	ZdxASVmyz3KMEy+X0XnpqQY5r4PFvV6Kc7bEYqMWq5aJCoCFpFqagngJURxw==
X-Received: by 2002:a05:6a00:4fd0:b0:84b:9a69:156d with SMTP id d2e1a72fcca58-8562543f74cmr429998b3a.0.1787846494915;
        Thu, 27 Aug 2026 09:01:34 -0700 (PDT)
Received: from 1c1aead48890.. ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535a8bd941sm2178632b3a.18.2026.08.27.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:01:34 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Seongjun Hong <hsj0512@snu.ac.kr>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH] drm/radeon: fix double-free/UAF of ttm->sg on userptr pin failure
Date: Thu, 27 Aug 2026 16:01:22 +0000
Message-ID: <20260827160124.679309-1-hsj0512@snu.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827091532.340141F000E9@smtp.kernel.org>
References: <20260827091532.340141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If sg_alloc_table_from_pages() or dma_map_sgtable() fails inside
radeon_ttm_tt_pin_userptr(), the error path frees ttm->sg with
kfree(). But ttm->sg is not owned by this function - it is allocated
once in radeon_ttm_tt_populate() and is only supposed to be freed by
radeon_ttm_tt_unpopulate(), which persists across multiple bind/unbind
cycles of the same ttm_tt.

kfree()'ing it here without resetting ttm->sg to NULL leaves a
dangling pointer:

 - radeon_ttm_tt_unpopulate() will kfree() the same pointer again
   later, a double-free.

 - Anything that dereferences ttm->sg in the meantime (e.g. the
   "!ttm->sg || !ttm->sg->sgl" check in
   radeon_ttm_tt_unpin_userptr(), or a retried bind calling
   sg_alloc_table_from_pages(ttm->sg, ...) again) is a
   use-after-free.

Additionally, if sg_alloc_table_from_pages() succeeded but
dma_map_sgtable() failed, kfree() only frees the struct sg_table
header, not the sgl entries array it allocated internally, leaking
that allocation.

Use sg_free_table() instead, which releases only the sgl entries
this function allocated and leaves the ttm->sg header intact for
radeon_ttm_tt_unpopulate() to free later, matching the ownership the
normal (non-error) unpin path already assumes.

Fixes: f72a113a71ab ("drm/radeon: add userptr support v8")
Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 22fc35a0e8d8..cbc0339cf127 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -374,7 +374,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 	return 0;
 
 release_sg:
-	kfree(ttm->sg);
+	sg_free_table(ttm->sg);
 
 release_pages:
 	unpin_user_pages(ttm->pages, pinned);
-- 
2.43.0

