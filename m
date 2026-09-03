Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308FA471CE0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427779; cv=none; b=Vh5m4H3TwhLbXdpJMJA548xLL3aFLUFe6hP3phL4WKOWqsNUKRXPKSjZ99mJu4XaE+7/6Cp86PL1o5GUxL1zQ8YtTuNhi+Db5DNS9AwVsdkoykRUweTQdlzO4TOWb9qzjOjksoSI9dywfX9K++M5VBKO1On+AGfgLed2pDIoeEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427779; c=relaxed/simple;
	bh=97tOsgvmm7X1epfGoYPiV/SmrI1Y4zgVj/hv/un0+0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jM2ymu5R5biVR0+XAZn5TTi9xAZsjVG3oIkMdhZRoz7P4AL+ZacbG4UySGWg9YcTsHY8q7X7X6Nb4o/yo/x/SEDWyxse1Zk18tQxNPNEQef+7/uvFt3a3b+xj4gj6p8jijkeuJ1E5rKOKU3ZrX349ahQ4ZlmLTA6uVD0j0CNCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFaHxRuO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFaHxRuO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49954b88fffso16413885e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788427776; x=1789032576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxgMPMXFY5ML7LzmKL13A6JFIKTjcrgE7JC1G5UiQIg=;
        b=sFaHxRuOuHkqCOOwEGBJxH/ZNQOy6ZeN2CEsl65SdBzyhK6CUIBqfGs34W1jPCnM3j
         zBKCTzq7A8/Q5uEjK0YvHSAq9uMaxMeKCjyDcl8a0WRAuX8j17jZfHxaEwleNUOFSzqN
         onCEtYtCgBtgLEul+CF9HAMj/tVHgQnFDQbPsjHM1BDlxr/Sx8faWF+BlgaA/bJyXwSM
         J4aohh5YdXkbXHwi7l3SrVcSFOnWhL0pM3bPKVG7SJp6ymREmFYY4e9/rvu/nZIsIpge
         zrwaaDvyRZojM8bIEnfVHZnvpe8SkAtUoeh8r1YqahMS8bE+jBDJAQcouJeMu/3kg0VY
         ijhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427776; x=1789032576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxgMPMXFY5ML7LzmKL13A6JFIKTjcrgE7JC1G5UiQIg=;
        b=tXKz/7zS/uiDwQsfx8ZbehAk9UkDoWH695HS8M+x89KmB8JESu3hoE7LC7ULoL0wcc
         IN4/lPtEpkCdPtL59Nmw0vCoOTb05954nm9yTyGXg8GHv4RqDibYV0rQfelExwyGRInv
         9jIabyEJiHDkMQehFc6uC3apyuwSDOvUjyEpgkc0Xd2tZ0ZaCJxX5cWnnS4s0KAg6WvX
         s2QbT6F2jVhbLnvmSjE83tkeEgzGo/rnN3tTgb0oqmx2fuZUblqSBaConDT+7qBPdY4T
         xdGAZKcjHfVSKcBEHkxS8faOR8vSjnlfGRruLMoLAb0c4H+I7fZNoXvJHKhRN3vqjRyo
         QjZw==
X-Forwarded-Encrypted: i=1; AKwUvByb8RoFnSJzg7IEecZSnoGqM+rsUbLFPXtgfu5MT2R+kjCLXg5bO4V/ci5OSl+fspj9j5eFcfttbZxJqVU=@vger.kernel.org
X-Gm-Message-State: AFuF++kT/dQd5Ud3VUEaNo+niCQtvJyfpLekxnx8Sdqd1oYPtxzMsPhE
	l6QHA0d6OEUIST0v1gGVi0OXqn/j36cDN3IRChIqmDFqxkitS6e4cPUZ
X-Gm-Gg: AYBFou0hliHjpwiV1H0g0h2RTtJBumdt62Zxv409gZ+msx++xWtAU/xbCE72QHEKy5y
	DgonYhzKA/dvGYIwdiinSx+k+Tr4shFjzbnB8HOPbgxk9s6HC9zuvIlMNwOD3CBDzsPOTcMs0Lh
	xN1i+wK4DMMVClnFlJ9nHWLzdS8L0HPwStMj5yELex2cQB/BH/Tc0enzOB7Kwo4BRXkDl7GyjZm
	WntdpspGlzdOJ2u6vWs3pdyWPdsKaBqzoePRnashWhMo2t0BFHh0RQ6Re6zxHYtagWloeM/QhzR
	5PXHXORvXQ8uEaK7imgWbMo8zmlSgOeskHV4XssMizrWNEfWXhMl+q5Jpe7AUplRpnZzu4paJTh
	6xxkCL8IDiNeV5Npm/UqTEl1moiVp3IM0pAYgp2jHhYXzGMzwu6ucqA8dWux0VZJfQjqzvZKWXU
	7yDtL5wWqw85htBCaYNa+GC6y5BRZ/heFmGd04Tb+WRSsdljv3a0BVbnkzqjakcUEwj5s=
X-Received: by 2002:a05:600c:8705:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ce57ec7efmr197647145e9.2.1788427775572;
        Thu, 03 Sep 2026 02:29:35 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.114.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm60133625e9.4.2026.09.03.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:29:35 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH] vfio/cdx: keep logical vm_pgoff in MMIO region mmap
Date: Thu,  3 Sep 2026 12:29:32 +0300
Message-ID: <20260903092932.526-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_cdx_mmap_mmio() overwrites vma->vm_pgoff with the physical frame
number of the MMIO region and passes it to io_remap_pfn_range().  The
VMA is inserted into the device file's mapping->i_mmap interval tree
keyed by vm_pgoff, which VFIO expects to be the logical file offset:
the core links every device mmap to the device inode's i_mapping
precisely so that unmap_mapping_range() can revoke all mappings
associated with a device (see vfio_device_cdev_open()).

With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
coordinate space and unmap_mapping_range() cannot find the VMA,
leaving stale MMIO mappings behind any revocation attempt.  Keep
vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
the physical PFN to io_remap_pfn_range() explicitly.

Fixes: 234489ac56130 ("vfio/cdx: add support for CDX bus")
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>

---
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -257,6 +257,6 @@
-	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
 	vma->vm_page_prot = pgprot_device(vma->vm_page_prot);

-	return io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+	return io_remap_pfn_range(vma, vma->vm_start,
+				  (region.addr >> PAGE_SHIFT) + pgoff,
 				  size, vma->vm_page_prot);
 }
