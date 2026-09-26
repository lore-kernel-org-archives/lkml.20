Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD40217723
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790389237; cv=none; b=BfsmEUSC3wC6Y2Glr4C8NHG3S37IKixhmdkr8mh3jJ8gRvHTZS42KbzXvlCTCCRKj9pFgbPCCJOb7s1UeCtCVCsNuntLO+gVH9kJnyX1tKw2FcSdI2mDqefo0qOGOq6WrsZKwL9td8zPBrKmZxeDwXnOeU0MYE0DLNqZtHW1/6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790389237; c=relaxed/simple;
	bh=jg7+FemWVFBVpRrvIizD8nTkz/V6UqciTlpbBKfXenw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nEjr5ubcprIMqnwBRSCmQWd0iwXrZJAJ8m7wBu8eQw4mbQ/WbjG0C0A7kGVJgUbimU3BzQJSRHitJ8L72FLWzNdMQJmDAskU9xVNl4hbXFAsYNAFSG49oHqhUGTIySw5QbiSgPgY40zieGGFpSuYBjx0ghCjs6zIAjf/NC4ITQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHuDUt/Z; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHuDUt/Z"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2df9f8c6f09so949305ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790389235; x=1790994035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A35dxfOiF0vku1a8AiorVl5ekNNXinTf80Wsr1D60yQ=;
        b=EHuDUt/ZBWEjyfij3XI/E3UAqcKeMYA+ZocKWN/eC19pbXFhhxdZeV6cVVs0upGTZy
         jijebJbLJ3I2+CJilum1ZgEEW/ZQQdX7hdZuj8x5QN2ndU8Zzgy1jU9mIKlthqkR43M7
         usmzLItap8UseMSD7Lp08Swss2D35sKCNU6U/1DubELH8ok2IXRs7eK20K1v7ZWhVfoO
         oTSukA7SqvrwZLdEyeo8c5Jl5tRh+MlZsADvv0nMSw/VzJCIgj4uYwAZvsJrcRMJ4Zfr
         BPMD0agC6Y8lts+GfAVV4lptV93Dme6bbuo5dlY0d1d2SI6D5oyEautbw3n4WFlAE7kl
         vWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790389235; x=1790994035;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A35dxfOiF0vku1a8AiorVl5ekNNXinTf80Wsr1D60yQ=;
        b=s7qUh4kcVJzhFApZTZDTYWKFT0kT1tAKrMh7dHAk5kvd+P25daTgeZbtbc8aOPPudm
         rtU+PEkriwxTdLbhLAe+fY2zjguCAP2lPZvIzLHYa3WFQQv5ZhB0bJKltq9T5BRWfkWP
         OngSLtMHoqS5Yt2UwSdnFz6d95uCCBAcaUPL1K7R+JDd7KyF1dDzqVdrMNhp6dbiK6vE
         mplLJSE5TwFDbVnlOi+ICwZ9BLFSaP7C6JwgV8oJ+v2KnQuriRMfNawVdhnB1S1VrKVe
         Px3vmljYvp+MYyh/mv+OXMwdUrjUelFladFDnrugjg9A9qP+g+0OdcZMh/gVSldvLpqF
         77kg==
X-Forwarded-Encrypted: i=1; AKwUvBwxLPW1xnJxhiNVyWqs3pYUkIeUJjUg0h7/fUcPzmfLx2dxnHEl7OA710N7qF9zXPj3hewfOzi6DrC6yxE=@vger.kernel.org
X-Gm-Message-State: AFuF++n0C9zln79IOpdLCg9AfIy+zBB4k+OVAYnZ1TEJvlirWvKR9GQZ
	IKNumlMTfHL9/tfAGxX3Vw70XWIL/jChq0PJ9H6uJPmuaFJmlnlhFJTI
X-Gm-Gg: AYBFou3ew+D1HDCxoHjQUksD7e17MbMsl+Af5x63A5YTUdb7Bc33wC49I/8SrM94ET2
	Rapf1zVxiXCVoy99kuXyQbCSwxtmigMSZ2KOzWfV8RVxOEu1QB6GUqWsMVfuKM7rG1sF2+aMjyf
	dj8l37JSTdvagSzbaRwqXsIBI9VAcbmRIZs2N8pgzQoDbuhOmDkO+2e/XjiKDjgZuVwNDAq8BEv
	/ZDcPVS0G/LG0CbPb8bg2EqWDILVByIl53EiBBAa7B1f2ITZgQvxENyk/Zl4mhDVMKM/XZRJ5bI
	QRoWQDURGyiYIPH8wcMsY18lQbFmGit+/++vJOChIn6TIrfCUA1RgE1SOS27djyzCXnXqHmtSxJ
	xRMcbFFtms92YfBTERskPNF7V7OuUUmefeLgJf8eyvc/7DXn2+cFOKEmhZSgxF/E4EM5dh6DBkv
	YEmJ1JxU5/rG3W6xHV4SSetFWzWzhCPcyrkzkGSJGNWMJdjI8k13U8pXYTIR2GqtjBzyRkGhnHF
	RTrX901RpjUXw==
X-Received: by 2002:a17:902:c94c:b0:2db:2846:ce3c with SMTP id d9443c01a7336-2df8e59a4e9mr65359735ad.1.1790389235476;
        Fri, 25 Sep 2026 19:20:35 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbac49sm17687415ad.3.2026.09.25.19.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:20:34 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels"
Date: Sat, 26 Sep 2026 10:20:17 +0800
Message-ID: <20260926022026.10539-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 143755bdabaa96776c24f878014608e9cb44f930.

That commit fixed a dangling reference in the DMABUF_DEBUG default
and thereby enabled the option - and with it the page-stripping
sg_table wrapper that dma_buf_map_attachment() hands to importers -
on every kernel with DEBUG_KERNEL=y, i.e. virtually every distro
kernel.

drm/msm is broken by the wrapper.  Both of msm's map paths consume
sg->length and sg_phys() of the attachment sg_table:
msm_iommu_pagetable_map() for the per-process GPU pagetables, and
iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
zeroes sg->length and strips the page pointers, so mappings of
imported dma-bufs silently map nothing, and userspace observes
arm-smmu translation faults from UCHE, e.g. during hardware video
decode (clapper, chromium) on Adreno systems:

  gpu fault: ttbr0=000000088a889000 iova=000000010741c000 dir=READ
  type=TRANSLATION source=UCHE

Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
v7.3-rc4 bad, culprit 143755bdabaa9.

Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
either: those fields are only valid for sg_tables that msm has
dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
are not, so the conversion needs more work.  The msm maintainer has
therefore requested restoring the previous default for v7.3, to be
revisited once msm no longer consumes struct page and sg->length of
imported sg_tables.

Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liujianfeng1994@gmail.com/
Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4f078a326a41..7efc0f0d07126 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -43,7 +43,7 @@ config UDMABUF
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG_KERNEL
+	default y if DEBUG
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
---
base-commit: 93f51579e7df248780214094418f205253383cc5
branch: revert-dmabuf-debug-for-7.3

-- 
2.47.3

