Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2244FDA42
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675350; cv=none; b=m0uoXvniqU3zfPoXDuGHoJ6dJ15tBTa/sioI17XiUlB9Z8TtK4Zi72/3WTARvxx1B5REZKAGEFWE98pgypK4if/4bqraQt2E3aJN4mRuFr1Bq1DAGeWOo56pjXlwoZDYg2IO8Uk9NYOgAFjc1yIXH5gIVAky6UKpK5k4VZ9sMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675350; c=relaxed/simple;
	bh=4mtz3F9XvkhZzi1HVdRKJIb48VIOMWlFxg7+FHKbMzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFu62onyeknb2ZLUb8fSOu/WRDHVQq/VSHshqwWJdgnaR0soZq8lCqu3T0CISjbFLa7apvfa+d3k89wsIRe3EhuudPuhTIr7/sGfCNF0fW7AcCcZ4cUdPnB5kvNQzsxMphpp9092G5oZN2IQq7MAYeJmxmxCwv2+LBqob83f0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsG3Ikxn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsG3Ikxn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so29649745e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675344; x=1791280144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzjWScFRE8+J0efyr1jf3tpnLnL6de369Jd4yW9gblM=;
        b=IsG3IkxnmspscEq/vGOvzKGaqAL0/P/zmEI8ysqzU9SL47ofyN7EeG7fQpZ8p/zgNI
         ClOOELnSpRrsl3KGyDt7tlDlpicpdEwV9CgiCH9smQB9yDU/jsAMtpEmVnP/TboL9WuY
         y2XmfZ8juIi4SmEDSYQLWM7utMjiZk20oUSFH5orbuqVB5JLn1KYdYFSE0VG5e6IjnDU
         hEaL4oVvNe7g9I9drfEvOz9XNWKYOGg2AIreQ/LJiR31XoskqrdcfVdfARlZR6DSzUX9
         NcZ5qJ6KyHNh4DUSZ7IGVZdguddMX1uVB1rlJcH3VU+wfWxFXVXvpMzHEe6DeV8facVi
         rjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675344; x=1791280144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzjWScFRE8+J0efyr1jf3tpnLnL6de369Jd4yW9gblM=;
        b=w/BC+TyidlLuzZYBhteWVeHlY6u7FfXQP/ZMH++g2fg3vjXg/V7ahZYGoZ+ZeWhugY
         uUxBjncrkJY5umSIFA+BsF4Qe/ANrh8LWsNm2Q0lrmU37H7+/XeRTZesl+f3xP7bMmrW
         P+AZYjoOda5L1D2qNI8+CCy+T3cihdBKT744QG1pLFXAudUdmRcpKCBOlY9QIPlSgP84
         EAJnd6STaburNbdzYjY2WwdalBBjcIBFUTtMDFayZCYZkizqiGkZ0m9wUzjVjq0uSOIT
         Ax9JoD/XkQwR0/jtGSdOHRTpeDnSAc5MYByROvS7bduG00gbAk0FPgAtZwY6o3NZ0b1d
         mvog==
X-Forwarded-Encrypted: i=1; AKwUvBw8eMpVPUDPY0e73gV3kCijHb5ZrTi2MeNdg2Cn2X9MlGiqosgw3k3JUe27ZM7bAOubYVQ0dnveTro4/Xc=@vger.kernel.org
X-Gm-Message-State: AFuF++kwvLFIPjJkwGmpVHkGCijB0W/jZFOLOHd4JecmmwMQTJ5N5wNI
	hrPOpl4FdjmCkqnV37vh8VABMDxXp0kzUr4wV/6GCvUEo9Q7pP4xQYln
X-Gm-Gg: AYBFou0g+QQMQlXtdy43Qo/kwOf28vC3NHmaaZ11Hlf7JVbsc0Y0xz1mA9AqYpiRFAn
	zVfN+v+QbqIU7N4nxaiPBMEQUO31daDJi+ONDDRmlRRnP999N2Hp8//NmhVtfrvhgXaao16o/Fn
	4ORApK15nRx6sBm3HYS+Prrqdyy5uKXlsiOi0secEGWajcmrN8B7PsIIy4IOC6zrmcxlHfMYEyX
	CsXaI6qlxBhWB8qCHuf8bDACo4N8I0HpiZhj0BXa7r4dG9gGuq9S9A3vk1LeSM+zFD+hf39APA6
	BOXdr7qXG+WcH62h6/CvoOvTC+U4zIvMJxLucuc+o0kNA7PLuCxlAcaqCiOk8diiWgp0DgYwfc8
	i9P3l14oWFefqkOkKdNISXoEX9I8wcqrHfTb3eCDNUTtfrhVkuYP+5Wf3bKT7o56BZMeuqxi8YQ
	xyaiWiVd+QmINBvGqsljGhsPoG2R8+JKR5m/v6XNyjUnQ2B4XOPrfwZhE2GIGY1/NgtyrOxwgPb
	ZH3
X-Received: by 2002:a05:600c:34d4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49fe66d1279mr239605565e9.10.1790675343795;
        Tue, 29 Sep 2026 02:49:03 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.113.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm89821455e9.9.2026.09.29.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:49:03 -0700 (PDT)
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
Subject: [PATCH v2 5/7] vfio/fsl-mc: keep logical vm_pgoff in MMIO region mmap
Date: Tue, 29 Sep 2026 12:48:46 +0300
Message-ID: <20260929094848.7439-6-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929094848.7439-1-suruurism@gmail.com>
References: <20260929094848.7439-1-suruurism@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_fsl_mc_mmap_mmio() overwrites vma->vm_pgoff with the physical
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
Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 5a6cd78dcc06a..15b05b8c0c908 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -369,9 +369,8 @@ static int vfio_fsl_mc_mmap_mmio(struct vfio_fsl_mc_region region,
 	if (!region_cacheable)
 		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
-	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
-
-	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+	return remap_pfn_range(vma, vma->vm_start,
+			       (region.addr >> PAGE_SHIFT) + pgoff,
 			       size, vma->vm_page_prot);
 }
 
-- 
2.53.0

