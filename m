Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBD3C09E5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791604334; cv=none; b=Od6cuIK0glEsXjALZBjoppL5RBfZN3FWATSYKWt7f+UMAMEbsJk7PjC8wCwZRvZv9ApN3EUgtI5eti6BhzRkmxt8zWyKrt4lTSNiYcmn6RvKTeQ44uZQiFiMldl4XPltt8kspbK2cJCdoVk4V0r5BqdZjkZNwVY5SNaI8ZX6SEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791604334; c=relaxed/simple;
	bh=jo+m5QPbXOnlnB8tGHO6prCzJEnQFY+C7tx75MS9hs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfTkRrXYldDpwYCTgxajBZLvHh7u+a0Z+YIOJIQkuOSSqyN6cZFfpnfwxYdFxUobJpFw+khv7gFFzAqQFfq37FM3Q7mrKiyu+G45gNBmSbvQYqNs7jPVX96sjFfd7QeTAlvCSJI7j+rGMXMOgXr8SoLKScrnNuQSGS1rRfHcslA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7H8a61v; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7H8a61v"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8623790f8so11755ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791604332; x=1792209132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PXHGGMNi+PHZe4WIVQ3ba08+1EpF9/N6ei9tB8/+nY=;
        b=o7H8a61vl34FJxoNkGnwbwpG5kAYHSyKk+BUwLK/i/nRESL4+qbr64gduofP7YvtAr
         h0cbHlp3AmJGy/wQ7QbedAUO6fIEBjltYQFGYi8Z/ITrgxqayPWcdILFecOjwJMIags8
         BUVViYJok5BmQS/deVcysnwIbFQ+Q+KnWdHTWdtI86DMM4CHWEmkZdch9Boq0wXVMiDA
         PsMMC2l9qwnNwlYthLDQ02DZXK8RFDevXBIz86jqIP8WH/asFk94SUrUiixf9/oYIUYU
         kUyGxgHtzHj265ZOLdIYwOeKhv//sJEuAavVf/azCFe28TBFdkz/Ye8ugWk9FCAWgVyJ
         uqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791604332; x=1792209132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PXHGGMNi+PHZe4WIVQ3ba08+1EpF9/N6ei9tB8/+nY=;
        b=M/G7aSI03IEsGNdd7glLu8HdlabXe03QBK+QJZdvroR731lnb65xRJL41kcBgIR+p5
         QgcWdCdWG5CQAseeIIfz23QnK4AVSS2Irte1vOh94pN8h8AaA5x83UAeANlRiGdJ4wh/
         w1wMPG8mG2vgBbddHe3AtejbOLIMFlBUTe/G415zQfTOkLyI24djLaJcJcW3l/j6pFPy
         9dO8zYcBEv2KQtru0ES2O79ZaD+hBdPMpBi3jRu67AR2AdQPRNpC3TPdso5pI2RKVGDQ
         jev8ZxqvTpJ7Casq1vUz7rA3yXz1DjOWSnYlH2WEzIHGQened+38v/V3ZoCDOcFajtGQ
         xqYA==
X-Forwarded-Encrypted: i=1; AKwUvBwhNO8eUCKxnNYeoiOCMJHGp0g6yATqiINsNS4Qh2UnBEJt7lW1nNTqmjnaikWgGKjSGV97lg1F7/hox+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu/4A2UFBV7FsfcMT3HDLd4XV9JzRbn9KSOhspWiCqfkVCEHcQ
	nFwxq0dfD2Yx1fY1xvZJhMSLgaKYTtJ0jN6iXutUAX0KnyerWWldJdFjiJLBbkIciA==
X-Gm-Gg: AYBFou3S4RcpNBa2ccs7eZzy3YVV5g2qUYbdbJKNpxhqVfVC8YGoIAoYHUNNCm3v0my
	5JOybUiOTewzd3Cx79gZ306NlGXffq8SK05CcgBzjxyO8STiQWdllsRCPrSTEJV3WbMzRWTqnwZ
	XkOehwxu+mmFIcIMb/BhGSwZ3IQfgQxateq2/bzDwfvuKQoUXhdpZh8KIUVd4AQqCwVvcxU3/zi
	tTEbfbCDnevLuq+k4Ns27ySsDo5l+psd9C3+3nqLDeLn/pXgwjxmVcqlB84B/4aHAlP1M2vfxsj
	EI06PDx0TArttb+F/T2i5GVqDh8v1b5v92oqBsNx6V7IMcvXur0l526wwHzLHjOlwslDGLcYvHe
	2kJY/c7zZ5hzzftUIQ2qoxYhcKH/fFmZSvgEBg09XVLbXMZ/AR+2dChbUqjy/aHesDfrB/8YlWC
	CM4ZmUV2xWYKRYrA/vBRHOQoFyOVklkk1t3lerEtunHdkjIbkC9gX2uyD6q7HERXWbTuustjOo8
	3dizYhNbzXTZYsVAiIet6WKrffdOrdo3QtzKxzM5T9/j3qOdeRue5Nfk4Yg2VQjX/o=
X-Received: by 2002:a17:903:2341:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2e87e33677emr541325ad.15.1791604331811;
        Fri, 09 Oct 2026 20:52:11 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm17105135ad.15.2026.10.09.20.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:52:09 -0700 (PDT)
Date: Sat, 10 Oct 2026 03:52:07 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, YiFei Zhu <zhuyifei@google.com>, 
	Pranjal Shrivastava <praan@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v5 14/18] iommufd: Implement ioctl to mark HWPT for
 preservation
Message-ID: <asm2T6WZxXhPfRUr@google.com>
References: <20260921004834.2601285-1-skhawaja@google.com>
 <20260921004834.2601285-15-skhawaja@google.com>
 <asao3APyx7fkL1TN@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <asao3APyx7fkL1TN@nvidia.com>

On Wed, Oct 07, 2026 at 01:17:32PM -0700, Nicolin Chen wrote:
>On Mon, Sep 21, 2026 at 12:48:30AM +0000, Samiullah Khawaja wrote:
>> +int iommufd_hwpt_liveupdate_mark_preserve(struct iommufd_ucmd *ucmd)
>> +{
>> +	struct iommu_hwpt_liveupdate_mark_preserve *cmd = ucmd->cmd;
>> +	struct iommufd_hwpt_paging *hwpt_target;
>> +	struct iommufd_hwpt_paging *hwpt_paging;
>
>I'd move hwpt_paging inside xa_for_each_marked() and rename it to
>"hwpt_marked". Then, hwpt_target can be simply "hwpt".

Agreed. Will update.
>
>> +
>> +/**
>> + * struct iommu_hwpt_liveupdate_mark_preserve - ioctl(IOMMU_HWPT_LIVEUPDATE_MARK_PRESERVE)
>> + * @size: sizeof(struct iommu_hwpt_liveupdate_mark_preserve)
>> + * @hwpt_id: Iommufd object ID of the target HWPT
>
>HW pagetable ID to preserve for liveupdate

Will update
>
>Nicolin

Thanks,
Sami
