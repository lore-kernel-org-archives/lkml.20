Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631768;
	b=ftpPtuM6Ix4h9vREvZ3ckDLtzAevG0o1n7X3ZfL4nHVCyLOfkz5clPOZLffbgpqObKOT
	 V9ZOWvUvyk0R5gZQdZFuQI68Ri/FPGfn8rOUXhbxYWoPlR76ZGKbHA/t1m39peGdcf6+a
	 uI51Zh+7GD9foWON4/eIcSlsjmQG5Tg2z1LIonFoo+1QQajRwPxsbsocO4AhAPFFXJliC
	 EMdpbaTngc95B/MFF3zqaEKLnpAw65aV6EnuOiUX/vLSsQR2CEZ3L/2Y5+KFD3SV6vUSc
	 0LW+nTo37CgV9LoQqgoZn/Dv9l3eSo2O0917VJREYB/cLyfkhEmNHHtcPEjMFDi7q/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HTYnB64kl/8K8S/l1jw09tVmV1tXPpdfAcVOVpBhqUg=;
	b=NeOHrQh44nbnDGpXqdemLiGPqw70JQyUQM3ynZVn6Otp7jX8KphfY4mrroVwXJVJzvfr
	 OlF4d5xyw2yTN6Zd54hwAVe0qgb/bnYD6iOh6JgPp2KgWUz765SuCkSsUwPxTrhFoORoz
	 nyuRpvkhIQ0PiUUB8qgMLKq62ABNiC2GbBBGE8POf2byBev81MHoIztUMGIRY/zjtP6m+
	 u0CrZ1laxuPlms8X6erK52lBHX5d1VlntkeBowxdsAojz6lVgEyIrfpiF3JWCduX7eGqt
	 +oiV+zmQy4fr8YINyZ9iy8Roqa7fQod+F2eSAfhY88iQWf3DrymqLFWdb5bWFl945Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CU8vNnaQ;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5C60A6F55
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB5C60A6F55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CU8vNnaQ
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd6b195dd0cso566129a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631767; x=1794236567; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HTYnB64kl/8K8S/l1jw09tVmV1tXPpdfAcVOVpBhqUg=;
        b=CU8vNnaQ7FB2rsUgsw7c8nQBRo+kS+tzdA74zWoTsEfwNd837yQgHqGyeZftT8KAlF
         BnsCaBWNpqjgFpzXfmElsYslUCKS/XSDof19TXb00LXJkLP5SGbCKHcaUN/R1qNTik7l
         vo3CUoscs4VzMT/efoClxxjUNDJ6X4GdjmUmA3H0gae1Pj3o0R3S5w6TJf10A5058qlN
         /q0z7PZVo3DWdiQ3HUZ+Wp8E/AREal5Mq/My9At9eGzdRDm9p1yFtsPKIwZz1DjKRfFC
         r6NxKZiJV5MT5aM6Lui+1vSR8rxguaNSjZBZl+rtWvxEa/kFtVNQFeO9z+iyizxzOLe1
         ntfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631767; x=1794236567;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HTYnB64kl/8K8S/l1jw09tVmV1tXPpdfAcVOVpBhqUg=;
        b=PkBYkg7a0ljz6Ay8EqZ5v/kkJ7cqWscww3hCFnVD/e2kDrelxMwcEn1kdogEkv7Z8V
         3nH5xPkX3z7xfwhAr05+kD7UIgs86JT6nGqB32m0/VtooMEfrTMBELgOkGRDa2c503A7
         Y8A1n8enhM7oqNtCQhXlNCg630JTdjrw3vu1CSYulamjvrYW0CcWy0GLMfSLXM7aYG0N
         zPz0GxPANVTwRl15qajvEYCsiti3tydgZmUA8IahLMEAHDrzGoHZ0pkZGz23tRO7XqrY
         YaP8jtIU44z3usO42h5+D08JW/vhZOEvQ3IWJJhTWD+vm3EBgPK2xDvyuILJMHWM3upy
         G9Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzK0evWd+bnVnOLB4rNtT1pt+oOfLoJfYgdZCY2ypcEwXHvfDC+HnjHqopkiKX7JmekictYoaWkdzS8AVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3W/8VT6XR96oBsNg8ZT7npQMvYNiFhwvGq1CjHbigGC31ww0j
	/+csszkhV1d6/8RZXKJYcX7+X2dzO6Td3l3rmQVy1Dx8oLSBm+559eeE
X-Gm-Gg: AYBFou0/eAACpkHKuHmiAsPIkPUOrv9s05DtapcK33NZFfJKMA0CVgZgsFxvzk5edqc
	76nn0L18qBY8b+4yocosMgpwrGcldn3SB9ri5+DL2ENTmJAhhiWgtLuG1BgjQok40ppL17jS5fS
	fCSa5XC62N4apJqNBGuOpVtYpQp0X2NEpATquYlbvAfDD/SuU6aVYSQ8zLBSH53ggaJlTmr/a6D
	pmVGNw226NFFGGt1JWXLjrpIlR4tTdCMdtAn0LgrZMyW0Ux07pYSWY4cIdO6RQDbqvsqVlBe4tG
	BZJS8kkIVvx+aVsE50IJUCZ6YSvXv1+ERE1rdrWvZPJF/Cq5WrNVkqmFg+2AFMuVX3E67z+o0/5
	s6d8QebqO9RNIFaiVLygQ3eDsqxo00umEeRYC28UgurTAUcW7hnwF9ARmHdRb2gfAOFBCRN2yxS
	IcmOFGte9HxjGtCrFSYwrqBc+BU0Rq1ddg2FYj/GCDpU7xG9gNduYPuFZo3ivB0efh0xVgTh2gw
	M6t2bMitVk/hd/U3lteOuC26vZRVWeg0fj4tgOsEbQf5DopUUO5mBF9n/fpYjXImA9DpD5mXA/5
	KpGUWxu1U5FMTgV4afKu1gi+Yi8YG2oLe+NfEQaGTKGTgJJdKDfWJPzZcc1euFJQ5LFpiTr7WQ0
	IcWj/ZHNOK90zrtTdChUq0XnFhFu1A1o2
X-Received: by 2002:a05:6a21:4994:b0:3e0:b71b:a8ec with SMTP id adf61e73a8af0-3e928c9f5e6mr7089810637.21.1793631767479;
        Mon, 02 Nov 2026 07:02:47 -0800 (PST)
Received: from [10.131.7.109] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09800dc1sm3490669a12.22.2026.11.02.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:02:46 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 03 Nov 2026 02:00:19 +1100
Subject: [PATCH] drm/amdkfd: reject foreign device pages in
 svm_range_dma_map_dev()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-kfd-svm-foreign-vram-20261103-v1-1-d6282053cad3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32MywrCMBBFf6XM2oGkpYr+irjIY9KO0lRmtAil/
 26i4NLlufdwVlASJoVTs4LQwspzLmB3DYTR5YGQY2FoTbu31nR4SxF1mTDNQjxkXMRN+HuPgcz
 B9J3pU4TSuAslfn3658uX9emvFB41Wg3vlNCLy2Gs0/98lWHb3r0d7Zm2AAAA
X-Change-ID: 20261103-kfd-svm-foreign-vram-20261103-9ce0705305fd
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

svm_range_dma_map_dev() converts every zone device page returned by
hmm_range_fault() to a VRAM address using prange->svm_bo, and
svm_range_get_pte_flags() takes the VRAM node from prange->svm_bo too.

The dev_private_owner passed to HMM is per device or XGMI hive, not per
process, so HMM can also return pages of another svm_bo. For example,
after fork() the child shares the parent's VRAM pages, and validating
the child's range returns them. If the child's range has no svm_bo,
prange->svm_bo is dereferenced as NULL. If its svm_bo is on another
device in the hive, the address is computed with that device's VRAM
base and pgmap range instead of the page's.

Fail the mapping with -EFAULT for zone device pages outside the pgmap
of the svm_bo device. Clear the entry before returning, because its old
DMA mapping, if any, has already been unmapped and must not be unmapped
again.

Fixes: 1d5dbfe6c06a ("drm/amdkfd: classify and map mixed svm range pages in GPU")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Found by source review. Compile-tested only (W=1, no new warnings);
not tested on AMD hardware, so the fork case has not been reproduced.

KFD SVM is being moved to drm_gpusvm, so this is only meant as a small
fix for existing kernels.
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ed5e3318877b..6e9b9dcaa136 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -181,7 +181,21 @@ svm_range_dma_map_dev(struct amdgpu_device *adev, struct svm_range *prange,
 
 		page = hmm_pfn_to_page(hmm_pfns[i]);
 		if (is_zone_device_page(page)) {
-			struct amdgpu_device *bo_adev = prange->svm_bo->node->adev;
+			struct amdgpu_device *bo_adev = prange->svm_bo ?
+				prange->svm_bo->node->adev : NULL;
+
+			/*
+			 * The pgmap owner is per device or XGMI hive, so HMM
+			 * may return a page of another svm_bo, e.g. one shared
+			 * with another process after fork(). The VRAM address
+			 * below and svm_range_get_pte_flags() assume the
+			 * svm_bo device.
+			 */
+			if (!bo_adev ||
+			    page_pgmap(page) != &bo_adev->kfd.pgmap) {
+				addr[i] = 0;
+				return -EFAULT;
+			}
 
 			addr[i] = (hmm_pfns[i] << PAGE_SHIFT) +
 				   bo_adev->vm_manager.vram_base_offset -

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-kfd-svm-foreign-vram-20261103-9ce0705305fd

