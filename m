Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389347;
	b=LgLFHt++Gl6UV3Pdbo9EorWd0gsjSv34l8sZysiJgN24Q4qYQ1pGjC25ueXwX3gWI1jU
	 HdQPpzXhctWa77LIfG+QmpnW18tUueHDWXX5wqcQB4IMRkg78/GbE1hTjByTaEPrLDIGe
	 zK56UHR8pqbQVm50LOM3A08LfAFjC1RMF/Ej757k+sgeauiXR8UPvbQlCq8nTLW71e5cf
	 sPyrCW+YedAXwfe1XuJEonSc1q3i4Adg/xYvsWGuwlHi7HSn+nRJzbysCcsvgyxhSUp6Q
	 q/O3ioDG591PZ7DK+NNoRrLb6o7+xI5c7LN27G8jld2hwOfFYdwcHGQnlcUTzTgZh/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vK8srcbyjFHPzlTR1mgLENgg8K+rOF0C+tBALqScXrA=;
	b=2j966xdLvX8EEoTIkOmbcEbu/46ihKk170yHSoB96XdmMhO329D5KKpX9ZJXoi3ZlA6X
	 KHm6YpMn38m4Bs7cS4XGaehh5VLwwp9xv2Jee5Ox0KUqtjIxCHTRpD78GkIlPge7dcVL6
	 K3AUQAubaBpIFBBOOxFGHGEehcykU8lwpUWegEBJUK/AeeJ47ZNn4UuwqV1wJtQl+Q/tY
	 p6lN9PC5tJvKpXmqBn+ZJTxs3w4R4jKr8RDDyEgYC4IXjORkb5O5tH9myVBv/cKv4CELr
	 wIfQnzIYodKIZ7lBqW1mJGKYygxVRAAyT84S44OL/DQjxDqAt6M6zXHioJDBGJsVfKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n+cR8LUT;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A806606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A806606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n+cR8LUT
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so11695ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793389347; x=1793994147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK8srcbyjFHPzlTR1mgLENgg8K+rOF0C+tBALqScXrA=;
        b=n+cR8LUTPsSYyEztW1Xd53zSgs2w5fEda/2TDsvkFHyDtU5r2EN1NbVU2uEfYkDMR0
         gYcVpLgx4PJ8WsOAix7AkB9wVd1t6sOBxNpuDXy6A2+UoFD/dxUQtSQ3kdh3Yea2F5el
         yf5U1o4qYS5E3eftNezUY6nejAsLwvjVaa8RXHRICCVR5A9iaxY6aUO0IbJKZvaPkChU
         VpeASB4YKj01XOkZ7airupCqXro5NF0YWdK029qG6gxFlFDr6/lz/eUq8PF/WNCCvcwQ
         jk9R94w6ZMQSznUdt7K0wpVjo/mtPPxxRDkcwM1l6pXHV/a2yx8DHFgP9U9dxDMsakI0
         NNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389347; x=1793994147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK8srcbyjFHPzlTR1mgLENgg8K+rOF0C+tBALqScXrA=;
        b=klij1drq94gYZEXs3l3cQTmaWnmd3Pl1ntThbQ0+mic4L6gv6iMDftQ0hBiGjCXco0
         /TDCisL64gxy9pQJmGOaqdw9QeLJf11EWoo06nnx9XfhgwXb1JRo0X1Sny+gcq0LDOhV
         pk+BGZGJDGxYAhN+//ZKG/v9UEs//t4xQFfBnIf5S+/lWSFTPhrbLty4H9KO8WW5Exj6
         SeTJYAQ5XNxiWtRAx87fU1tGSpXUB8UEf2v0e6jIZHgg/dOPkDlDT2Rxj99PbcxxC4yZ
         ppx+xuGhd3OeRXSi+cD2DjXqWXI1Q8AHyxsOonvRGDDG2go8uNvIpGPatK69C8/wfWkA
         r2QA==
X-Forwarded-Encrypted: i=1; AKwUvByVMQTJYP1Ydi/SkklAVXDP3mM/SwToLgyLrRyBVnICawZS2QYEzzQmOLXy7imCIr/fn0kIGCoxl+Zxz7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB3hFjAqfrUzSBhluOiOqouC0smo0bK+JbcF0WBFtU87zkx4GE
	PYBMAYTdliiorcgkNw7hw197/ooEHQ453538bKFsclpFZ/WWE2G3oBOQ2vsnwPXaPQ==
X-Gm-Gg: AYBFou3FJHVQoMsyyT9DTTvsS6TVID27ppjZoJfiI8YF91/UYxzDmtG32yWeX5xOqxV
	o9qZ8PAyhPApWl269DlQGbVQvRze3ghCRnAliBAuhEpg69tzFARbXjYpoZ94IiYrLT00j76yZe6
	5X9Yab9DYwCq/8jr17HBBp2Eoj0YfFwHh9AL7sPaoPFjAkdug/BkABhYS5fBbCWe9FfKc1QjRk3
	qEF4AImLD3cJgfS7ck+1g5zn8LKwX4dLsjeiXCBHYTxx3Pa9yDWw+knX3RiUI0mBPMBL/e3wJjI
	ZTwocNcJtnAjunDSN7yTx1AFlUsUWaUuulbg/1KpVT7ZFq6NFbz1F/4MYWClYFoT8UMgYxLPkMV
	yrLhNoMuRwKSF5YVmUT1nqSvl8fk7KZDbXRK2A7f/C+8gttUn4RF3IlUJ7QqSde4fyGlkScZtDV
	IbpktWkOUAcHD+cyyGtYiqOgphhHmT+3lUfGKx0X8uLfTg1epfgtKmhp2S4hMXVrirgpLABD8Z5
	f80sMw01tlCK4Q8GZ3EzWl34GCpwryUmaVr+hGWvlXng/QaG/O962398FT3JCH/wS5RLrceiY5P
	UBulKyotowIufHFvP8hm4fNGnpeEekgHJyI32vACUqIqY5gYqpTkiUVH2ch7LHvx+MSDfX1AdrS
	4IqB+XqcoL7l+ZUUi4iLqSZnPf3Y0NMcKZaOKZn3M4R4=
X-Received: by 2002:a17:903:19cb:b0:2e6:23e5:4934 with SMTP id d9443c01a7336-2eb1ec7beb1mr12096545ad.14.1793389346146;
        Fri, 30 Oct 2026 12:42:26 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052bb1sm12148735ad.1.2026.10.30.12.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:42:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:42:21 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Woodhouse <dwmw2@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Subject: Re: [PATCH v6 03/18] iommupt: Implement preserve/unpreserve/restore
 callbacks
Message-ID: <auTzCsfpkxOWRPHJ@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-4-skhawaja@google.com>
 <14cf71cd-35cd-45b1-a0fe-94d4a76e9e06@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <14cf71cd-35cd-45b1-a0fe-94d4a76e9e06@linux.intel.com>

On Fri, Oct 30, 2026 at 11:07:20AM +0800, Baolu Lu wrote:
>On 10/25/2026 10:19 AM, Samiullah Khawaja wrote:
>>Add iommupt ops for presevation, unpresevation and restoration of iommu
>
>... preservation, unpreservation ...

Will fix.
>
>>page tables for liveupdate. Use the existing page walker to preserve the
>>ioptdesc of the top_table and the lower tables.
>>
>>Preserve top_level, VASZ and FEAT Sign Extended to restore the domain in
>>the next kernel. On restore, the domain has only the preserved features
>>enabled and all the other features are zeroed. This is ok since the
>>restored domain is made immutable and can only be freed. A kunit test is
>>added to verify that the IOMMU domain free can be done with trimmed
>>features.
>>
>>Signed-off-by: Samiullah Khawaja<skhawaja@google.com>
>>---
>>  drivers/iommu/generic_pt/iommu_pt.h       | 155 ++++++++++++++++++++++
>>  drivers/iommu/generic_pt/kunit_iommu_pt.h |  30 +++++
>>  include/linux/generic_pt/iommu.h          |  30 +++++
>>  3 files changed, 215 insertions(+)
>
>This patch looks good to me,
>
>Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks for the review,
Sami
