Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513441;
	b=1c+wMGvlT8bC81ONoyZZzHM3T83vxhq4kPoRrJcUQoUbWqATr5rDXMxuj/2+3DOvR6mK
	 RfoIJKOQ5wSBxCFbEF86zNGcEeecUXRWbXYK1b+17ICHKNyoMCCcF/LdrkyMpR0zsz1Pp
	 1yvbfXFUGzZ3/9jBuMNrVB5WrgnDa5c4r7icnFzSWTfgb7XcskkxBp3xftZvp3nEsxZyQ
	 xIjGyMk0Yp2uMpdbwxRJG1BQwFHxm0eXRUA2ZAZDw2HFvp1TD5WP3MJHCLzUifc/xERzn
	 s3Yh7daktePAa6RM7Z4iQYLTd4dO6pMY/krWB7W0GYRrW7V/TcD42JjSY+AGSKOvB1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q+1maoVYXsme0lgtuSeqWJeLS/nWjgJUmUKBjOiIOqU=;
	b=ZLEke6x/dJ9bwWNZPSVq5SshqLO1hc955L03E5MX45D0KTYYWxr07jMw1ryPkdeWtTRd
	 IGEUgittdBOpHqgf1DVIRUcHa0m3xrJCQWTqibDEKlBse3cDxrIBBAPW6YCWY2h6KT5s9
	 QS9oqwHcDGTLolzjGuyIcVPYyj1C71g1AZeKc8rfVHU5Y+fXPNO3MM7X9pdOeTCCVcc3m
	 B6eCTtbdNrr9Sl8a8WqzXRsMcw/Ppy/2haZxiQmEtkGV2l5vr9212F5B5PuccwJt7Ii2j
	 xvXLWr4avzVQ3cEzJaOCq5wdQam+NRtI8ujjk2EeSKrJu9yu51o+Ej3n3DmZBsA4Sgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3cE7ulL;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D506606A88B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D506606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3cE7ulL
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5365d26ccbdso2066441cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513440; x=1795118240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+1maoVYXsme0lgtuSeqWJeLS/nWjgJUmUKBjOiIOqU=;
        b=G3cE7ulLNr4Jgu83chYtqgfXpNsyyI81lhQZuA3nuJhrVpBMXInFGTYy1OdtZsWCFG
         21HOlo8+7naSJH4r9C453aCSzXYlWKYZlbktnXB46RS9b7qzkp9iDBmqLC5zNCzMGWP5
         8KiLhy/aRG3CKDa7tFYkQ+Fr5pRyFLmihyjgwqhGX/lT9w+mGf3PtRyVRsGG+xNTtXE8
         LtLkmBMqTC/573fvX2x5kbGa7tIkxTDq32PK44ofJvuhUfrCjjsK1jr+FL7xSYudT9g9
         FwvqF3YcdrzL9OsSgU88Pedr+YbDt3ob+qMMIEQbHo5aKcf4H7ZG+5qEhbJMFxQJCy9X
         pG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513440; x=1795118240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+1maoVYXsme0lgtuSeqWJeLS/nWjgJUmUKBjOiIOqU=;
        b=uOVAF1KPPFutUoJ7GEzcsAIuR6gj5TdP4Dw7hKaKS2Wn7M9FUt1NLqfoHzncMXrhgy
         CoTM2gts/POS+1ioweaOXKCpEIAXEabdEvyP24XKUkweBZ0A+hw87jIVWJdLGko+vyT8
         UiqGzknu7CDv1PwPQ+KzoS+urKhYHpMa8zjjtc8LHjWEwbKdhPxS18nGKvHc4Np9G0Go
         h8p7rjFwrLliYVSbXtLeG4AEmVBe6nVOMrkG7VkZNrGxULXwxHznfD6j6bHbahy/UJYo
         zRJc/0WYZ9zDab6WW0C1EIHhN0Ldsln/mFMj9ks2nmF8rf12NZ9tTR5FoCDqPPbTApCG
         PQ2A==
X-Forwarded-Encrypted: i=1; AL+hErGupuA1Uza10j2bEnqkLdOqeAOGTg3emfM41DDZi87cvq3NkzS746EqICfGvHDX94FzVKst8K8GHonHz3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a79uI5su+vGxwVRKaUkUlvtOVamcBErkXq1hVk0vbd3VwrcNW
	1dgOqGZsDP3eNFp3J47NAHYb6hjlmdtzAbnL+STIDpKleXAWy0u0/vcV
X-Gm-Gg: AYBFou1r5LzYchfRpOdPhMlxP0tWHimBEuQJRyWNGAC/v3ohFzhLM4QWKizS8yP1IaU
	zZeRxsvPgWK6mwolexmVSm7/+4Qz96YdK3TykL7OnBpXu/Q2IHVdXgnhPr3Vkap51iCOrC2T5fI
	of1bQxXb1haHczuHFY0IMd8ouKCWratGAyFJSnZ/4W20Wv2/BoueBYzRaguP87hnAVfXN8B4FKO
	JlU8C081uGNt/viktv+EMrjMva+6dkgjEpQyr7ygc5C9UemA3W1GBDb+y8LlQyMw4c8zdtLBt/B
	q2CThtBbtWNj1iVcoVgYTlZVOpGetrciTRdcvg6zjuLPY3a8jw4Fzlt4MwureZDCg1209i8GVFu
	OHSGr4GuqWmhx65RZElkESMWTkbz2mf7I9yfXwpQuzwf3Ny2UWdaLb4juJuFAvWbQ/dC3o6LJ5z
	Ya0Zj+gO9htuNc7RTnwn+MUfEm9os5LBNlbEcnRnyVDhOsOn5g1djrOCdMGk51WuHoUne04+jy3
	IjHAAQ4FBCkgWBzuBE/3ch4CcL+pl9WduH+yB+NlZXbe7Mt/0u0EA13W21T/XvMU1OVmBx6xEvQ
	K0oJRXLzbd02mM089yd8XIpHDrEc3lySu49/rqX/9nZfYOil11KWIMoJF2T8XQXUgrZHs3tqBOE
	=
X-Received: by 2002:ac8:5c92:0:b0:535:8607:d2e2 with SMTP id d75a77b69052e-55ac8b905f0mr8030011cf.56.1794513440241;
        Thu, 12 Nov 2026 11:57:20 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad034918fsm2504851cf.4.2026.11.12.11.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:57:19 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2 2/2] iommu/hyperv: Keep a new domain's page tables if it cannot be deleted
Date: Thu, 12 Nov 2026 14:57:00 -0500
Message-ID: <20261112195710.1417744-6-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112195710.1417744-4-oss.patchbox@gmail.com>
References: <20261112195710.1417744-4-oss.patchbox@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When hv_iommu_domain_alloc_paging() fails to configure a new device
domain, hv_create_configure_device_domain() deletes the domain again,
and the caller then frees the page tables with pt_iommu_deinit(). If
the delete fails as well, the hypervisor still has the domain, which
may already point at the page tables, and they are freed anyway.

Create and configure the domain in hv_iommu_domain_alloc_paging()
itself, and leak the page tables and the domain when the delete fails,
as hv_iommu_paging_domain_free() does.

Fixes: 2690d4156b51 ("iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest")
Reported-by: Jacob Pan <jacob.pan@linux.microsoft.com>
Closes: https://lore.kernel.org/all/20261105141427.00005946@linux.microsoft.com/
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/iommu/hyperv/hv-iommu-guest.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/hyperv/hv-iommu-guest.c b/drivers/iommu/hyperv/hv-iommu-guest.c
index aa1db9db1e97..ef486ffa0be4 100644
--- a/drivers/iommu/hyperv/hv-iommu-guest.c
+++ b/drivers/iommu/hyperv/hv-iommu-guest.c
@@ -540,10 +540,18 @@ static struct iommu_domain *hv_iommu_domain_alloc_paging(struct device *dev)
 	settings.page_table_root = pt_info.gcr3_pt;
 	settings.flags.first_stage_paging_mode = pt_info.levels == 5;
 
-	ret = hv_create_configure_device_domain(hv_domain, &settings);
+	ret = hv_create_device_domain(hv_domain);
 	if (ret)
 		goto err_pt_deinit;
 
+	ret = hv_configure_device_domain(hv_domain, &settings);
+	if (ret) {
+		/* See hv_iommu_paging_domain_free() */
+		if (hv_delete_device_domain(hv_domain))
+			return ERR_PTR(ret);
+		goto err_pt_deinit;
+	}
+
 	return &hv_domain->domain;
 
 err_pt_deinit:
-- 
2.43.0

