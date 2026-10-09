Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0ED49B5A7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538517; cv=none; b=W2vLSOLVpXJZ9fJlyZvbW4JljXe6eLI6Yb0vzA6nDlojXKFShlS6EmuM+8shd+hMbzPIh3hXrST6epxTwYHZ1Q4ibCEWht1J2vaGxrDTHsD/4heYsYC4NJARmIhzFASS6rm/3JDCJLkW5vH1gywZUqZSbP/oDzNC7lam2HuPdb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538517; c=relaxed/simple;
	bh=/c8N48QbtXgR/eVlCX4e1X5WhhCM4Hemay3LC9ggKPk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsos3Suh6sFTTK56vMWu0wgOm8G+nyBU3VaIcfabcvfjqwxR3R40kZxg4R6LndPwW3VmVsUVf3+Lj5IIK8T6le4sLD58T5Olnax8L5A1u4+jOwE4pS+kD0D9ImobHnhH9HpNX9cdcRISawK+WD2bQm/bWVUaWCLzsOiMLKKiN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=IGkscjq0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="IGkscjq0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso22129875e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791538510; x=1792143310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJvujCG6Ef+ooO87W/Kfsk5ax+KDA0Y6he4rHd/9/6A=;
        b=IGkscjq05/VuTlEGylZ0tPumx/YjRJcVe+CMB584AsxZF7ioC1ojWkI+S9bDCmadGN
         3oHbrjxTnv7iiCyYtEoFv36uKFDLWC5Ks+aHaqgwKE7NMq8aNdlbkW7I9PVjdKAcJCO5
         ReK9hv9QVku9rm58f0EwKFMEbK8X2oAlDHPNkPF7vRDBmeGt6Zbh7J+XfO2eckYsPNaB
         9T8meJ1AHhfiYFU9krpj0FKQc14PKjPzu/LQZXmx4wEKBLh2H8DULILBuDmwiiqN1l7A
         Mty11O2KjiKdmio2QApQxZXaEabmYonTxMpNUx26my94LdaMV9AgwUYFMn3gZNcerf/O
         WdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538510; x=1792143310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJvujCG6Ef+ooO87W/Kfsk5ax+KDA0Y6he4rHd/9/6A=;
        b=lFSaYpRtVPcV1boJsCyJ4mm3g6VBFaNvYf0U6aFnuGB0qB5tjl1Xii3CvS/37UYgJD
         yx8CnO+lkC6o066Boc6MirkfnCkC3knB4B9gBNvGAZAwE40lKzIrj8MNacjeKLUV5k2M
         HtukcALgXO/j9rbHJ6rfrz/+zuW8F6fzX8DUUKoJ47JNPXhmF5n7fnnoui7RitAXw7Vb
         rcv//Yqf7r10hxryDaa5hHUFgmMop2psoUNSy2XlSlcllPpIEi/31T034jle8xHygtgF
         AVoLHSB9toHqB4iw7ZqgxMNgGflm+5MaCdv6qfqKUcMgi6D2R+i4b3tNUJr990i4soYt
         KRDw==
X-Forwarded-Encrypted: i=1; AKwUvBxIXkcKfbjm7P7OYBFKCiAnlI/0qzb4S5V73f1JG8k+yIRdFrStPgPqbD7fmo8aQ/7eZ9drVQ5+OlFUSU4=@vger.kernel.org
X-Gm-Message-State: AFuF++mBh5sE6h6fA9Ycr8S3MaTHuYqqKpO32eLapETQ+vlu/UCUBw36
	7fB/uU5b2NQuqTqQ82YdmfmoijaPOxzfxdfEUEgXLNs6Z9t3pL704n9nl5Ca1SR2cxw=
X-Gm-Gg: AYBFou1jDjBo+bEGbiqzbUGj0gvTsuLjIcR4KAMtwtr2VrLHFdyw3qbtqRM2rdogQMx
	qu5CmxPzuQ0Je6pD4dhy2Gx8YYpSgIe2gQUas8ykFa9Agk750zeTEDY38h89xuPfLHfboWCnuTW
	A6WRt+JmZbbdlCTL9uc1I1AxS21eFw5quiJWuOWxABLswQF+37b64HT3PRlpt29PEaDklEXq0Lz
	9JTTFQlh9L2fELBTyn9Xt2pkqAM12Hw0qVspjyv/nDIvP1y0fCVVy//rpjUyF9TqvVAooVXStYs
	ZwNYHw4qJ5BiP9ClAIjJwSf1WdyM53AdSupy3EaltAgvMBIsxvxfo3Z1q9ItDGsERC9DRudSMQ9
	HAVOd8HDDHFCfBPPjG13267dIOY3JQjLGQK+Tfw6Row33C/HBPyEy9LMY6m7Os3wju9Y6mZGsUM
	DdcTDq37HNv6XFyYYdj9G9XtmLQgv7Z2Hps0nSvp5HS3DANDJZtYuB/vM=
X-Received: by 2002:a05:600c:4f10:b0:4a0:d1f4:b1d1 with SMTP id 5b1f17b1804b1-4a18e4bff89mr26548565e9.24.1791538510535;
        Fri, 09 Oct 2026 02:35:10 -0700 (PDT)
Received: from localhost ([2a09:bac6:37a8:2696::3d8:4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1021sm43339765e9.10.2026.10.09.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:35:10 -0700 (PDT)
From: Matt Fleming <mfleming@cloudflare.com>
X-Google-Original-From: Matt Fleming <matt@readmodwrite.com>
Date: Fri, 9 Oct 2026 10:35:09 +0100
To: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Sairaj Kodilkar <sarunkod@amd.com>, Baoquan He <bhe@redhat.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH 0/2] iommu/amd: Fix device table setup in kdump kernels
Message-ID: <asi0gnLD2v2Ir5bX@matt-Precision-5490>
References: <20261002133143.3628181-1-matt@readmodwrite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002133143.3628181-1-matt@readmodwrite.com>

On Fri, Oct 02, 2026 at 02:31:41PM +0100, Matt Fleming wrote:
> From: Matt Fleming <mfleming@cloudflare.com>
> 
> An AMD kdump kernel booted with crashkernel=512M,high and
> crashkernel=0,low fails to allocate its device table because there's no
> memory below 4G. IOMMU init fails and, on our systems with an Intel
> E810 NIC, the ice driver's TX queues time out, so the dump never gets
> sent.
> 
> Since commit 38e5f33ee359 ("iommu/amd: Reuse device table for kdump"), a
> kdump kernel normally reuses the previous kernel's table. Patch 1
> programs the new table if reuse fails. Patch 2 drops GFP_DMA32 for
> kdump kernels. Normal kernels still allocate below 4G, because that's
> what the kdump kernel checks before reusing the table.
> 
> On an AMD EPYC system with an E810 NIC, the kdump kernel without these
> patches failed the order-9 GFP_DMA32 allocation and its TX queues timed
> out. With these patches, the kdump kernel reused the old device table
> and the dump was written over the network.
> 
> Matt Fleming (2):
>   iommu/amd: Program device table when kdump reuse fails
>   iommu/amd: Don't allocate kdump device table from DMA32
> 
>  drivers/iommu/amd/init.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)

Hey Joerg, 

I know it was Plumbers and ksummit this week, but have you had chance
to look at these two patches?

Thanks,
Matt
