Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311269;
	b=BVAA7K5riQtrhJcdglyEV/kk/9b5ORqzlgHmO7RhH7Lbt6bzzxWcfAwGGg8fdyNzSdmt
	 rHBlkKQa7iQ7s5g7dcZKOMKx/wqHV5cUjgl2jBVdXsev538ArrHWd1r+ygPlSm+ARMYdq
	 Msl12QbNM6B3EuyLruzFhb0mNGkUsaKg2xtL7TkxmNFKA9OHQl/XfAK+WCY4j5Kqf5hTk
	 3aBhf3F8jaWf28rIAZTfC7RrX1V7YNQEiN5Q13r3Hu/xBbj0tVAia/shSHutLbn/dQYxj
	 +PThLeXjasz1s9ldKIo5m8FiElKNuaf8TM4gFMuWU873tQaMUZmFwPJqgondhaVLFxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i+Wj9No24ZIzSMb91s5eR7ARJ45VgEQSQYILDa8r2Ls=;
	b=0/vgXIZW8EyKwbvEak5RWDz4t/uJx4Mdp8k9/tTrxfSVhEROlZRGikdR+9AXCY2jnOQb
	 VmZMcIT/ZFmSgcn/QyVO1/VDk83dvo/8o7UEE0WyduQkOeTlQswQnJ1WVFw2qFiXYhxLD
	 4SDF8ydKeKHyLD/klK78aPkpVk8YmzBy/rHT1/lBrnRSLMkAIW7lwLDsAD2yPFqZ5C+YR
	 GJ3HcoyXfN0l3xbMWMTmj2f5dDqtAAJ1CRlL+yTQ84F5dwbOExSJjHoXoyydYaJV4tGfE
	 ne6RKdUHULAveBiLk0U3wIzMdaG2YYCUMbyCb9PwkwVkTPaa2acsRkBvnHhkjV2cVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k1eJoYKz;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7972606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7972606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k1eJoYKz
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so26155ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793311268; x=1793916068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+Wj9No24ZIzSMb91s5eR7ARJ45VgEQSQYILDa8r2Ls=;
        b=k1eJoYKzIXh1DdeuC+lIzguVMMOtZhzu5/GIvst1fFcjG92N19fD7h4lrgsQPWBFG4
         oYnnpxlRcTv+AqNBMm48jKU/wN894JsRuNxjxfW14FGhJUP4ab76rRbtSCyE39WdMAT+
         bMU/GmkT/PyGcBnwHlfOVihPJ9YoTH98C+L4Pq1kyOhr0Wd7NoOqAmCDtb0AspWHeNMJ
         uID+JjnU5xoICee0uRZZPvZ48WfFuTtxRVDxKBdAoMq1UVOWA2djEkw8rtTCdZUfuBZ2
         AQWuZkYf+qB80og00gQ2IMaVeeKYHzGKthlW/pGCN2f8iWqSJsk1XPEDNHCoFM60yxVS
         ABNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311268; x=1793916068;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+Wj9No24ZIzSMb91s5eR7ARJ45VgEQSQYILDa8r2Ls=;
        b=WhLKIjzR9Ng3S9dczc2v0kSQyx8523aUJqCEVjKwWF4ysWua/1Qmru7QOGoJzjLhBc
         VlZRFKGTMSWOr5lOFFNLSAdQTsa7VjaPtcvhMGJZaocJHc5Q5SlSo2FtraL2edfDH2So
         UKyUaeYmje9sjnxlL67rB3rKKj3kViWVFn6Nae25OQX6XFHqDgHLY+zQ9njvHHLNXe6L
         OecMBCt41ITvLUnr8aBFlxvmVdDIJD9ZEwg5kdptGrFdeQxjA8rtE55GGeDlfAVHcsxn
         NtR6KgwQW4xg/aNHNBXWmm21xtT4etbgPcBOj0RJFBj1+Jk9hzmlX8ojEZkZi/xZaZ+7
         QcpA==
X-Forwarded-Encrypted: i=1; AKwUvBxxxNlZNUf6ucCHPE/uuiFkNfVjcGl0DwTVC5X8Egs6gRRMFDPGf32Q1ackbExBNDFcMkv7GJfX0FThS3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE3LnoS0Ier47nkH2c/U8jo85Utf0MTl1ihmhhUAR0gecs4iWP
	d+Rv0Gm0dov6vUCncqaTQ+0LkVZ+huVFj0G/EvHf9RZx07gNG00ktXN7ZZIQgAFH/Q==
X-Gm-Gg: AYBFou1eK6u2o2GBDFQWZ+h8AqB+9/EkdvJ/8V39g0bHBsyqWm2vWXJ1ES9dN8zZe+W
	IqLNcgN5SSZ0bNfalTbzZm6pjF9Mo/C+P0BsNs2QCi1yemQZLgmvhfA+D1edklO6UmnM5oPhAgZ
	Q4T1aNDabgjKrowMTcexrDKVdkcOWRnEWqcgwTW9EzHXqCnw2ZetFsd8MuJNh+6L5fI8spN/i9v
	q2dVRyzsWkvfkRqDoO5xpBdklfx7ezMTasoUFOzeFE6Cm6IRey6/+9YwUP79wpeJiiOMYFOi/+s
	vDvmVm0UTfA0fkV5VWZwx2cT9dkTzcCn8m7exseIXtmKr86BwrHYUfUMCVOX2hEo5p/I1mgX63O
	nhmUdneBPtHVw9NerT/vzolt38xggS5jM3QWoQkNZlLimuEk3GLjmfZGu9D2CaJMK/XLux1iRdo
	PwQDdl0VEa0KIjyOGAbSoAO3iMd3JHQIiyDPI1Xk0UezRReNJeZfLGuHVCUCOCwG4EsWQuuDFta
	8EuM3eQARHCSQxiazNiMphCnXFOwPUEdAObKnU4ymggkJq8ZokaWRqBHDKuyYuo2v/ZKjf0KvdJ
	Oll/YqD1EYsGTPdoTTzrymtRXxpRJSmYes2p7B6DfoW6HJWLpffN4BoaTnsFDkQSb4ku1VkVYcr
	MCA0QYj1C0eoOCXvq5/8Rmw==
X-Received: by 2002:a17:902:d2ce:b0:2eb:188a:1c06 with SMTP id d9443c01a7336-2eb1ec12e12mr6703785ad.9.1793311267514;
        Thu, 29 Oct 2026 15:01:07 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3694c6aasm1096605ad.51.2026.10.29.15.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:00:36 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:00:32 +0000
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
Subject: Re: [PATCH v6 07/18] iommu/vt-d: Clear unpreserved context entries
 during shutdown
Message-ID: <auOtrI8lFrfwdkB3@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-8-skhawaja@google.com>
 <5e0be0cd-c2ae-4488-b95f-b04b8315a1ed@linux.intel.com>
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
In-Reply-To: <5e0be0cd-c2ae-4488-b95f-b04b8315a1ed@linux.intel.com>

On Thu, Oct 29, 2026 at 11:18:02AM +0800, Baolu Lu wrote:
>On 10/25/2026 10:19 AM, Samiullah Khawaja wrote:
>>During normal shutdown the iommu translation is disabled. Since the root
>>table is preserved during live update, it needs to be cleaned up and the
>>context entries of the unpreserved devices and root entries for the
>>unpreserved context tables need to be cleared.
>>
>>This is required because during kexec reboot and shutdown the devices do
>>not go through the release flow, so there might be stale entries in the
>>root table and context tables. Also note that new unpreserved context
>>tables for unpreserved devices might have been added after preservation,
>>so the root table entries for unpreserved context tables also need to
>>removed.
>>
>>Signed-off-by: Samiullah Khawaja<skhawaja@google.com>
>>---
>>  drivers/iommu/intel/iommu.c      |  15 +++-
>>  drivers/iommu/intel/iommu.h      |   5 ++
>>  drivers/iommu/intel/liveupdate.c | 134 +++++++++++++++++++++++++++++++
>>  3 files changed, 152 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>>index 14bd1ca4fbd5..23a1da351ddf 100644
>>--- a/drivers/iommu/intel/iommu.c
>>+++ b/drivers/iommu/intel/iommu.c
>>@@ -1967,6 +1967,14 @@ static int iommu_suspend(void *data)
>>  	iommu_flush_all();
>>+	/*
>>+	 * Note that IOMMU suspend doesn't affect live update. The state
>>+	 * preserved during live update is not released and remains valid during
>>+	 * suspend and reused during IOMMU resume.
>>+	 *
>>+	 * Also note deployment of suspend/resume and live updated use case
>>+	 * should be mostly mutually exclusive.
>>+	 */
>>  	for_each_active_iommu(iommu, drhd) {
>>  		iommu_disable_translation(iommu);
>>@@ -2512,8 +2520,11 @@ void intel_iommu_shutdown(void)
>>  		/* Disable PMRs explicitly here. */
>>  		iommu_disable_protect_mem_regions(iommu);
>>-		/* Make sure the IOMMUs are switched off */
>>-		iommu_disable_translation(iommu);
>>+		/* Make sure the IOMMUs are switched off if not preserved. */
>>+		if (iommu_preserved_state(&iommu->iommu))
>>+			clear_unpreserved_context_entries(iommu);
>>+		else
>>+			iommu_disable_translation(iommu);
>>  	}
>>  }
>
>When I revisit this, perhaps we have overlooked something.
>
>After intel_iommu_shutdown() in the previous kernel, the memory for the
>Invalidation Queue, the memory for the PRQ, and the interrupt vector for
>the DMAR fault are all freed. However, the hardware is still configured
>with those resources. This potentially results in use-after-free bugs.
>So my understanding is that while we can preserve the translation state
>in intel_iommu_shutdown(), QI, PRQ, and fault handling should be
>disabled and their resources should be released.

Agreed. I will disable QI and mask the fault and page request interrupts
for the preserved IOMMUs in the next revision.

For PRQ, there is no way to disable it at the IOMMU level while
translation is enabled. But PRE is already disabled for the devices on
the preserved IOMMU, so we should not get any page requests.

>
>In a normal kexec, DMA translation is disabled, thus all resources
>configured to the hardware are released. However, this is not the case
>for the live update scenario.
>
>Thanks,
>baolu

Thanks,
Sami
