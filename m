Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E2049CF43
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264171; cv=none; b=RUYc/UI5u6TvKuTLFc+/2I/4WvXr+nmNcp+ymzYF2RRtaADxqUj6kzTI8HR3VOoGI4OF4igGeEDWQF18J3Kb+MYD3eDPIiAgQPbHNqmyDzNSkkRIvVUFMAeCxDLTKBFFJZvDTn5qkiSPu8aiF9C6OI4VZoCbNxJojGdIAUe4Mcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264171; c=relaxed/simple;
	bh=55TP9TpiQqwLDSIs4VZOh0trxhBaVNjilG4ME32BM/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4nzap/+GSAuSb+Hoo28fnsjBSO7fxnXCV8CMPgml6s7wJoao97ozXhDSRH3g+JEDUlrcvEng26kjAvyo8uUKK5ah8Q8sBF+1A/2EhbzDrs4zGzQhhH9h4xWg2b9Y06osUajwsw1YtOg5M8udDOPSLE/U++1DTZEjtgEDpPeENk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN5mcnEh; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN5mcnEh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so1350956f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790264167; x=1790868967; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3avaLkGbJI7b3eQY9BMM4QIlSMsNqoKGq3lOV/zF1s=;
        b=ZN5mcnEhK2GZWwdmshH0l5yAasCs4DzVRB7hPevFPK6QVwfBQduCUki+9c92lx6LYl
         qzwrted29TCfUIWh6A7ZCyMJ0XPEgMPAEJYN1SlpPjycZ+k6vb8KGKlGCIDjtdDaDKJd
         FeF6udxIZjC9TULaVXKOGuuUwFfo6qiwbu1/yb0USP8ncEumuKyXZTUSwlhPQK8P2sqt
         EW8vYglhgLUpjxcRjowcHSou/CymSwHBeJC/VRg6cbu1UB8u23mTY1nm3gda4ZyhdZ0M
         r76hhZlPmvEOx3LOKUHkB8w1uxSRnWtMkfG5LCOPo74Gmd82r81fphoPnzCJVMcsW3UE
         J4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264167; x=1790868967;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3avaLkGbJI7b3eQY9BMM4QIlSMsNqoKGq3lOV/zF1s=;
        b=oxwwLmq0/Xb40DWt9W0Z+LT33d+DDurZuT7CQKl313hCcXssE3fV+qAuIyrSddb4+K
         bmFP+gjbAbFz3G0w1lYAjcdpGhOL7WPWLzJSPqEWaDIIjTAvu7Q+ib8w5MSriqkTf/eU
         gF1MKlBw5JcgLDGSsDMDa8196owk959HJ/i1xB+HKWk/A5bKW6TAx/VJrH5ORPWrqQZm
         Aw8m21wILKLzkR3ZU5n16Dv1o1dthoeTI6QU1Z0yxRXUIc8HfACWQS9wMmIcgPHMtieU
         qRargVK1tN0vu3tGMUya77bQ77v1sWoK7dnkF9Wbek/TX4vKwf5KZNjOiydEH7LeH/TG
         PCog==
X-Forwarded-Encrypted: i=1; AKwUvBy3OquN4Msc7WK54dac652Ln/7Rar2RHHJFrQ1GisTfCfpHRsdrm39AIn5r8/NEO91JOCGXo5LVnuPAFqU=@vger.kernel.org
X-Gm-Message-State: AFuF++k9vUjxqjbe81YHUtp7R5u0aIoijdrc5gGKKwe/9rq3G07AZqvB
	xE7CUsZJOfDP1NBo8MLncYWpuGPErEH/PSGNq+XDg83+JOUUU7tQp2DzN0I2zw==
X-Gm-Gg: AYBFou37mO+AJ5/+rly8xul7iEnG3NC72MphiAX15q/KwW9b6yIAPJbzA5nkmeD9hoq
	1JBlpzTMONSnrs4IHSPpIwVN/ZDsjd/QZTCp7xVx8ev97WIThtG0izAoiZuAf87/0OYh6ju8lGa
	euBUeM4+/N20MObXvcWkCj+O9761ONVnUF+Zxi6wS+Ga+enfYCm5JKXEJVoXPisLdeLtggA4kuq
	qpa+OMaj9jYB2cS6oBlh6yDxq123O0XaI0vCt5E4ekB1hTE8LxmETeLohcAO+k+9+pH3uztjjFA
	fGwl6ShkN0cxdzUf0VBva6HKKsP5wNgTR1pkmu3icgeVAGlhcw5WrU00PFrIq1bivNrgJ1Zp8Tl
	ZJwfp91vJbt5vb8XwHwe29Hz0mmOi6rkL7jq3TjsvroDTQnDgugBZjzolXxL8xrR5JcWOuf7BIf
	YyreTaDwAHbPHSM7RCdoTbLaiEArx80+X8/0c6Kjx0UsNWngLZZDwZ2kk7FQOH+ZFeDAckfsLBE
	IgNnucSHgAI9uH05i0w9gtWsRJl2N2boCE=
X-Received: by 2002:a05:6000:402a:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-48871670ccdmr5463936f8f.15.1790264167282;
        Thu, 24 Sep 2026 08:36:07 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848646dsm14308007f8f.10.2026.09.24.08.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:36:06 -0700 (PDT)
Date: Thu, 24 Sep 2026 18:36:05 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amdgpu: unmap GART dma pages before free
Message-ID: <arVDZbkfZbzfvKO4@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

amdgpu_gart_table_ram_alloc() maps the GART dma pages
and neither the error path nor amdgpu_gart_table_ram_free()
unmaps those pages before freeing them, which could leave
the device writing to freed memory.

Fix by unmapping the GART dma pages before freeing them.

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---

Changes in v2:
- Fixed a null dereference possibility based on review 
  from sashiko

Revisions:
- v1: https://lore.kernel.org/all/arKhDFCSoPDNYaxX@michalis-linux/

 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index c4c21dbbbdbf..116c646b86a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -209,6 +209,8 @@ int amdgpu_gart_table_ram_alloc(struct amdgpu_device *adev)
 error_resv:
 	amdgpu_bo_unreserve(bo);
 error:
+	dma_unmap_page(&adev->pdev->dev, dma_addr, adev->gart.table_size,
+		       DMA_BIDIRECTIONAL);
 	amdgpu_bo_unref(&bo);
 	if (sg) {
 		sg_free_table(sg);
@@ -240,6 +242,8 @@ void amdgpu_gart_table_ram_free(struct amdgpu_device *adev)
 		amdgpu_bo_unreserve(adev->gart.bo);
 	}
 	amdgpu_bo_unref(&adev->gart.bo);
+	dma_unmap_page(&adev->pdev->dev, sg_dma_address(sg->sgl), adev->gart.table_size,
+		       DMA_BIDIRECTIONAL);
 	sg_free_table(sg);
 	kfree(sg);
 	p = virt_to_page(adev->gart.ptr);
-- 
2.43.0

