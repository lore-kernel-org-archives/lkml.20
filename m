Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF745C6E3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927751; cv=none; b=lqlzweocbmiJWg1x05U0wz3NiRGpjiybk/CZTz7rCJKS7KLmZlTTCXd9CeLHdFmhHJ2oFetdc2SQ3plcjlkbEdTmOLpegyXk+4w0/jk7Av8UkGvZeJjg6qYrg019krpU34aw1CzXmL59LaUNemsiP5RUQjqYUgLsGOQ5T4hzN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927751; c=relaxed/simple;
	bh=b7h8dV9oHVBHfBv6mxuKsP2hyM8HHn6hEleZHSArLSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHVGtgjYE+VIvllxM6hHbgCccQSHkhdsY3afsWQWcxYiLNlZ8MR5fLAIgNGglkQO2ybfQphvXsUqhDwKqYZQ5e+PoOZWXyFZ7AhfXCyBRk239wu0m48b8nNQxVcyrdXZ9RyUZxcBnSOca0+lCZ8gRIXD5KrUkw06bdvyrIZ+mN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KGLW+FtH; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KGLW+FtH"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92ea24a2dbfso91502085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787927748; x=1788532548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CA/dtHk3Ua/1jrmqIIittu4ca0gllo+cVF1m+itAJ8=;
        b=KGLW+FtHFCmEL1Q0DHBlm0YrT006KqKUUryK0+7PRGSPJcHg+eTCqJBsaQ58SognjR
         h3a+hV1krYsO3UxcsnmNhDIh6Plraus4y2eEmQJrHCVnI1BC6HDbqAFJPxbsurV1tm1s
         Cu0BvRZi0/vnSuG+PvGCSlkSiI36pj221OhquRPc3w71pI0ueAz2Wuodsh1oEqxyDSUI
         fYJ2M/fQef0SG53Kn0/LcAbK97sd7QkSYYINDYvkZ7mBAZCK3FEs9U/qUn/RdhBnElbF
         LHKSfEyHpJKc/oy8YTd4Rv4bJ6n0GmWPc1L37AsoGCui3bL1oDnxjgnfEwGFq1FwNxq9
         DkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927748; x=1788532548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CA/dtHk3Ua/1jrmqIIittu4ca0gllo+cVF1m+itAJ8=;
        b=skd+zOrzDuVIAbOR1MLH+ZNkSLr+9vXKPnBFwQ9AOGWTrT0cF22KwUeeo+pOjOBsof
         4ewxxRczWD1/0TvhPqM19CzMl7A1yqU5iHswv6oYIwjiUZ7fghJzrAuMfnT7is85bN5M
         W7wyMMt4e8abe1nuK+DEOTFPJZez2VpiDOn+uOFHBjq5t+cHi2dvfWqPJg7X89tZPj4J
         Y9UswEfSEfJiohAkeQMcc3gSqE4ljtLC2PSM8wgBIVF3ZsUzVIfaucM379TXZln/BtyW
         riXJQIQ4KdG+4yGgSvvs4yUJs3cB2JGvxENT1jKdJVoVi+durtoHNsTFNZiaTRYDpJYM
         Imhw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0n1c6pLBCJy2TzmVL2vZdu/yKBadAYDLdVVnrHsxUJ7Gf0Skr+bQhux+CE3tIawwHt3Ju9MWhTTFAyjU=@vger.kernel.org
X-Gm-Message-State: AFuF++kNkkKutplBKa9mZ1leCh//Q4yn/HioRn9z3YlI1Qz/f8TqHc2q
	OMUcHUoaEMPVyw6tjo+XDIqAP/e6u8bzAMrZ+8mKfFJoyXILuU47sTY3pfA3+rQS2fI=
X-Gm-Gg: AR+sD13DC3zYAaJSIq6I1G+2AV6FXVodmKS01IbFApKWpSzZ2QKkSXQO6tQz6+GhrLT
	eymAmiH9P7uDl+hba5xTd8cNF3th3Iu6mXh434JjGt201QrFollQMaCtGvlU5/DGGDDcgJcL2fN
	dfNR0s4lG2zzW8gPqrR96veekFudEWr3AwX4orm0mufYV9Q7k4tBlcjWrYFXJdxhKJzJhfuob9Z
	KIkbrAkPlHJxrjmC0Rbk9UXrs/ZE0nzK71j3fJmZNWO6S/DZ2B4qGJBKWiL2kHsa7oU4Q30MDWh
	0yEck+u1SU68SR7iM5pCEOUibcpfh+sAfLcSY2BvawfKP42EhN6hrclHYgkDDhuZ0vgN49RhlR5
	vBbrEGrI818BEFxo4MozZYU9if0+6ZOMqtNOy3Eb5ab5tir084H7A8aGZ+a+ftTCJ61Bud31v0Q
	jOHOQuuC8yjIC5Y1ZvFp2R9oh9ouatDqwXl0zZ/jNmeWOMeNtkr1Aa2IyIXJ68PWwYuQ9RMSxvo
	7ikghtrTQ6wE//iZy5alfzRcnpOdPBj6mNSMofXdgS/yQ==
X-Received: by 2002:a05:620a:a0a:b0:92e:6637:da8 with SMTP id af79cd13be357-939138ffc3dmr615678585a.28.1787927748313;
        Fri, 28 Aug 2026 07:35:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917014c56sm157064785a.10.2026.08.28.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:35:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wzxgI-0000000HRQV-3Jl4;
	Fri, 28 Aug 2026 11:35:46 -0300
Date: Fri, 28 Aug 2026 11:35:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Matlack <dmatlack@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pranjal Shrivastava <praan@google.com>,
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v4 12/18] iommu/vt-d: Handle reattach of the restored
 domain
Message-ID: <20260828143546.GC3769797@ziepe.ca>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <20260808022723.3893618-13-skhawaja@google.com>
 <5b920299-260b-4025-ac4f-e8f83beebf95@linux.intel.com>
 <apBso6So7UqwR3AX@google.com>
 <bb7052d7-51fa-42e0-9eb5-ba4743956688@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb7052d7-51fa-42e0-9eb5-ba4743956688@linux.intel.com>

On Fri, Aug 28, 2026 at 09:55:18AM +0800, Baolu Lu wrote:
> That looks reasonable to me. I have no concerns about keeping ATS
> enabled on preserved devices across kexec reboot, as long as the
> software state is synchronized in the new kernel.

The new kernel should issue an ATC flush when it changes away from the
inherented domain.

> By the way, is disabling ATS an option? 

No, many devices require ATS.

It is not that ATS and PRI are coupled, there are good reasons to do
ATS to pinned memory too.

PRI is a PITA, I continue to think PRI through the iommu was a
mistake. Devices that have device-specific PRI handling are fine
because that all lives in the VM. Devices relying on SMMU PRI
forwarding must also somehow not loose any PRI events across the kexec
and must ultimately inject all of them into the VM.

> The current design already requires disabling PCI/PRI during kexec,
> right? 

That is also not OK, but there certainly is a useful universe of VMs
that might pretend to use PRI but actually only use device specific
fault delivery.

So ignoring PRI for the moment is possibly OK. Someone using this
should understand what VM shapes thay are making and if that
limitation is OK.

Jason
