Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE7C49A3CB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993430; cv=none; b=GKWk+dzxcgpTslTANAy64Jrzvk4eAZYZ+f09FpOvjjuyAEIWaxoOsPBaMIPcngOt7/oo1bY4xytt9wQzIdCCa+KNq4KAnbclXAXoZajAs1WNP1VFIDpaAapnX5PUGOu4Xwb0hkmyGvf8ndcD93PwI0+XtJJ+t+7Au3RPLJNpoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993430; c=relaxed/simple;
	bh=BIXUR1k4TCtztN0bdRJqSgQN8mkGdqjNwSs9hVeWO2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Il+cV9akg7nCeqT7vpWNpTfBchj6jm7eMIUYvt+NQ/gOhsGHMFSEXbfHmm/hBvMgz1z6AwXib9vjSTC74OJUXppFC6f6t3ZRtftgOAT0f9hKhqqqdf1uPs1SBHhrX1/ZWpjJJ6dq4eMVftngmcjnN5zD+SKE1fcCG3iXfL4k+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwR68MuW; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwR68MuW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso5410904a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993427; x=1790598227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCdqlEsnXoPna4s4ma5cQkM3Ci8W1h/73sFhSd4uQE8=;
        b=kwR68MuWNifPf09vw+NNwsAErmy5MI9Sg7PzFSL3rTTnlhir9oMtZHBtKbJaB44Rck
         G6qgyZLtLsLSWHX5Py+jG9zA5whn31kjZ33Pejs/AZau+pAx7YbQ8bL9Kmwbi/6xIco/
         JRNmomF1IGlLAE+NIcan7IGyYv2T/zvKDoNV+qpWcoDwIzs1hRSIhphCHnNAbT0/Ysdh
         HxzZZlX98MIH28yndWSUclA/Cr8kRxR4VYy9G6dAJqlc1CMtfegsLBiuASHO1675nDZB
         dkMxnKwSiHyUa5PM9Ou0FBkPYxjY8rPpgJo8O87R1vVhfz/wCv6CULiTsseiRGaBPSwe
         WFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993427; x=1790598227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCdqlEsnXoPna4s4ma5cQkM3Ci8W1h/73sFhSd4uQE8=;
        b=Pbt5cPyZG/3m2kXiGe7P+gJ0ZLYKklnQBNpA2YcUHT3Rq2aF0j616woo7S4P36I1Td
         7zMyUd6xqFERo7WOQIsdwZFFiUvfUEe1AOVI5ZH1ds6DhVDH+1vaoL7BecpiGyHpbcL/
         RKSsE61+C62Ocnl0Hzni/cTB6fY0OstCdZd9T7YUqrC5OQzRep/Hz1N+KHRW8wY1iGfb
         NppWUGSY0K++8S3Apq0V0mzFFEE/Wsmf6kLix0JVyu3wvUqWOV9TpyVAXLM0AB9oG2Ns
         LifhhaF3BXKSjnZhjVz3BHSyzagEsA3BTABfnhUNAx4PQNgp8+51fK6V/3mqf4AyFF/+
         RcCw==
X-Forwarded-Encrypted: i=1; AKwUvBxtkD9Q67gvd6pePTzj1YSkUCWpTrRHNlVPwQj9Q2KJRWgTCj0m69Vu1ulbPQwIJDSZMkNG/j9qUTWDLIE=@vger.kernel.org
X-Gm-Message-State: AFuF++kfIliSjzJq/JA5hldjH47kbiFqlly4MVMmdzWyN44xLdc18w52
	R2okU20Q9RZj2YSdergxnzOEmD944Z+Tf4/hVXM4HO+Pyk4d/dg6dMWR
X-Gm-Gg: AYBFou3igFR6eXR30MHb3e7TMClJ85f61OoFq1KUW0sapRYZsHBGziaaZarFPFwk0jG
	HkWbCRtTlTYhLEgf8ODhKjkRMzZKDcpa0v38pUuI1jSZvMi+6qnme3mQFf5J6pJhzQL9PC6Zvns
	PPn5qe8Eksw6z8FS8/QCd3KqAdrK/wbZLOwtTsSdPRMfKTPn94N52clqZcoG+EN2E5Q1v/NdXpp
	2A2/+YQDIZNEZP96vVJ5FKMcyJbGU+/swYoK9bONMDsXZm1NuMzn61jQLrNzNeLmSSBLe6eLGQt
	llkrEOJlsnCzvFyp0rHhrxzlI9pRK6suUCcPswKs8io9LVU4GNkq5OwFHAVU2qES4FxNFcigSw6
	OR01s6IeSZWt5pTXv5UUklPk8zkYAaXNIhxwO2Ql8kM6FN1cZWr3zQhUwiggtRNJY4nntC69GYP
	plSWCuqwI5ETOz5O9ok1XK6pHNayrS+bAIPqqYCykgGWCaZlTq3XBs2ILsPbKdA0SPlHzkHz7oj
	Pd0hA==
X-Received: by 2002:a05:6402:1f11:b0:6a9:9894:e4b4 with SMTP id 4fb4d7f45d1cf-6aa5799f094mr8220567a12.34.1789993427184;
        Mon, 21 Sep 2026 05:23:47 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67b5eddcsm4228761a12.0.2026.09.21.05.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:23:46 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex@shazbot.org,
	eric.auger@redhat.com,
	smostafa@google.com,
	praan@google.com,
	ioana.ciornei@nxp.com,
	nipun.gupta@amd.com,
	nikhil.agarwal@amd.com
Subject: [PATCH 4/7] vfio/platform: keep logical vm_pgoff in MMIO region mmap
Date: Mon, 21 Sep 2026 15:23:31 +0300
Message-ID: <20260921122334.2099-5-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921122334.2099-1-suruurism@gmail.com>
References: <20260921122334.2099-1-suruurism@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_platform_mmap_mmio() overwrites vma->vm_pgoff with the physical
frame number of the MMIO region and passes it to remap_pfn_range().
The VMA is inserted into the device file's mapping->i_mmap interval
tree keyed by vm_pgoff, which VFIO expects to be the logical file
offset: the core links every device mmap to the device inode's
i_mapping precisely so that unmap_mapping_range() can revoke all
mappings associated with a device (see vfio_device_cdev_open()).

With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
coordinate space and unmap_mapping_range() cannot find the VMA,
leaving stale MMIO mappings behind any revocation attempt.  Keep
vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
the physical PFN to remap_pfn_range() explicitly.

This is defensive hygiene: none of vfio-platform, vfio/fsl-mc and
vfio/cdx call unmap_mapping_range() today, so no reachable
stale-mapping issue exists.  Keeping vm_pgoff logical preserves the
VFIO core contract for any future revocation path.

Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -561,6 +561,5 @@
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
-
-	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+	return remap_pfn_range(vma, vma->vm_start,
+			       (region.addr >> PAGE_SHIFT) + pgoff,
 			       req_len, vma->vm_page_prot);
 }
