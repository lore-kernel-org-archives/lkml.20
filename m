Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E1651A742
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750400; cv=none; b=BmaYTG+o/J7wB0b3zAi6S6fFGBudRKwRVesF6Os2qg63o8CVz8kgJ2Yc6nn8qmDyQXz/slB2KMuFKFi1lVGZcaRBaj7umMuiJd5xKADYeu905eRrdxuBeBdN1ODvtRAxbLSdEpDLeMFdNQv89vRIe3PFKi8QNQv7gWLGXpuP6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750400; c=relaxed/simple;
	bh=QHr3HItRfGIiXW33vm4AJyjNNIRgLrxwO2wwjz3RPCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdoKsTa+9NwC2UVB73322rV8P+Om6ZNTmaB0EqGA53wUavNBv1DugCmrC8gfKEwQCWklDQX6v4SeqtqlJzJG2E+xEIhiyUlEknMvwWJFrILkw3NVeRVOJClFOPR9BfRILAWYUmDL2185dB0Cpp4CUa7esJDZy7Gt4nBSCd2PihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=U7vp+en0; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="U7vp+en0"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939ca12ab70so116476985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789750397; x=1790355197; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZHhNZflcpTf7gpMtfLnrd+b6TKn7wbbrgvwwdWjf0M=;
        b=U7vp+en0xBHHHVMOPfWIA21xFHJ0hvVIilacvNWFNRJ8MgODO/uRp+uEu3kFYELNZI
         bO+sM3kE3DPXYUKidivRR8gVSxH6vyAqBJ+va7kVfh5YyHoitPT1KXIyuUZf/l58tACn
         ik/bsjzkUc5ClTls8Cv+fsfh35252lxvMfdbxdT2VSquyTxx44uh0xNcruY3lYZtHEpX
         ll3IQDglg6utCqwTciSCoiATeaI75QxNEMhKVQiau/fjgIVOUKw3pyU/3rDmmvhS6NBl
         1mHDfTtd0nNoipNAlHs9Q52s+kqWd4sUdhvuimAcSXMIGzExKT8R0s7I4PYf0EMDpBPF
         BOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750397; x=1790355197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xZHhNZflcpTf7gpMtfLnrd+b6TKn7wbbrgvwwdWjf0M=;
        b=bOuY/G/STSS0vK2372csQbGFBAy3IOn+nBrax9Jy1PqQWplgJChfsphrkfYFy48BlF
         HE+SAwsVnvyyFtwDILr07jpzXrub4TuKXnRlI3lGQnmLNpWdugG9ThPvpP+vtHtp9LPv
         iETiQyqBrUAYNzpfkGrhN+lWSNyZf+Cnq97fZFSlj6GmSS2uB/ON/aE5Ef5KJkvkow6S
         1GwT0uGCG5YLAFPP7B5fEJ2tQMo5aFidXn0QOjGIxFunVbXEk+GeiyebqLGeM6fcmluM
         V7OCR7C4yjCSzSPbcx3polP1QaHe/oLsdJk+JwZW3vndent+NaoKvnkDrfh2pNPtZxkj
         GvPA==
X-Forwarded-Encrypted: i=1; AKwUvBxjMVcW6YwAFsZf/PPFu02gDQc1ybJuexXDke5uDnysOWjqq2fdOZ8LzZmwZtBVi94gr8mBESuqknPMgwU=@vger.kernel.org
X-Gm-Message-State: AFuF++nzFRvHZRe2nGiJiWn5UQTlo0iDpEFBHjiKZjl6x8wm7ElLZ/yz
	Zg5N0nmNMdRTEhKCYfh8XAxcI0hdyokgkz1euj+AWQqyv33FPbda4HNWx77TFpVT5tc=
X-Gm-Gg: AYBFou2FBsvrqTo+FhH141/XZPQbO4P1BqA7vp5ddTQbIY7l8Eyf4URfXub5ADhDVsi
	l70XgnmCNAjBI0Gx21xuo2PuxzX2fo2MUdl1AfMARsSB1PEBqPzzp7dfdwFa2RacRyxOOMyCnYq
	WYDB5BjPoeYc7S77VpIV9TUzAlsJO1DxPLgBoH0X4t7TWDx88Ne/SdNV9qon5XqGOQIHzrSkB4t
	Uuom26bY5nfMzbIi0qcTY72Ez4UE8SBVtwy7hQxPIrej/iNrcR8f7mw31xMKnfOqC+/SFhM6Eqv
	VyXe4P2SRP9b+FTcaSGAaZa8kqrI0KSBUJ5l9B1s8io3ZviV6+5LDDI3/37eJMLm94snO2AKqWS
	eGmM5e377BhbwQpHuPiqeUxP551WUIB6MUnN3aNB56/VWq7qi7Hr0uBZCgrDac6ppw938tFUT1I
	0ZG0EWcBMdDFWqc1WJGQhQOGXGpLPG+87MMyBX3Tr9f4u3utWch0CzBMVg2RyM+QakANLs8XRik
	GAilgyFQ4F10P6Ed9OG6Wyd3vxo9S1qvPXVzN99i5etBh3oTum+d6be
X-Received: by 2002:a05:620a:1a17:b0:939:ee44:36bf with SMTP id af79cd13be357-93bdc72000dmr495588285a.29.1789750396680;
        Fri, 18 Sep 2026 09:53:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a60f21sm68476d6.19.2026.09.18.09.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:53:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7bpr-00000001yyx-21Yo;
	Fri, 18 Sep 2026 13:53:15 -0300
Date: Fri, 18 Sep 2026 13:53:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260918165315.GF11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>

On Fri, Sep 18, 2026 at 05:39:55PM +0200, Christian König wrote:

> > Arch code can figure out how to do it. If some ARM configs only give
> > order 4 folios or whatever then dmabuf heap doesn't care.
> 
> The fundamental problem is that DMA allocations are highly
> architecture and device specific while Linux memory allocation APIs
> are generic.

This isn't a dma allocation, this is a memory allocation.

We made things so the CC shared folios are DMA mappable through the
DMA API. From the heap perspective the only difference is passing an
additional DMA_ATTR_CC_SHARED when DMA mapping the folio.

Jason
