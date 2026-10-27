Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139590;
	b=Pt10R1lTFXZeIfUGp0mNenzpIV3Ok9d3a7+dWW9GvvEtdY56YTeegjUxPDCtGV5Xd4HX
	 pZeIgtYrPNMMEDqHdNl3K1wOyMDTUOGS3LnzKtdzvIg+tP4zOliWsU/V0IvNWgzWS4U1X
	 bJMjE+TGVHJev0fAlEG/ZUTwGn2pEOZzByoaKq09xmgCkt/TBAvrzloUQAQDep5XLmpyZ
	 nbCf34n4p/c9lEUWUj8jaRl0LStY7Yl3OWAMUkjb4Rhk+FQ4OYwQMzDKvlrhoHv/xinlv
	 iPY4/o+ac7qNripXym7NPRExNHj1ni0jtnJaKWdMpI8Z4W6PrUhXuQVngkCZOSXggag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IRLDp0EVirBnKgldSRz7ToSM81j0nsSsdeqUHhLddpw=;
	b=L/2KQqv0AO6qXK3oiHn8xydfJsqa1AofO1vR4Av/4WUqu5YbxTrsYKofACLW4wtU4U2n
	 qfS0AaWDVcB7EWBi2dBALN+kn8srJ3y7Qkw0T57tv9x0iTc+w03y3gEAoX9nIRv0C136l
	 iOnE5PA73yzLsGeknyOUUTYYGYzTZzbQLO3KxA6FDeVxwTJk20RzDrc2z/pQ9rQBAk8Nu
	 SdIKZ7SKaRFIX7vAtsVkUoboIISqooQGUSeHsmPIh+aRxuaetYb1iBb8TgbCqcWOaHRQC
	 xgue8VVVkfzps0Ek9HSa6JWa9KUNFvq1eWsBNLN5YBhhUaK/gZkHMg7fi5c8JJowMUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EBtL6odW;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EFA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EBtL6odW
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9f6a16afcso11585ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139590; x=1793744390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRLDp0EVirBnKgldSRz7ToSM81j0nsSsdeqUHhLddpw=;
        b=EBtL6odWMCe+QCB93joyAdLE1zgBz6odJ1vA2JkGD0MMU8wvojnhHVDZsbnW42cvLm
         A0/x8O8w7vJlJYyrce7vVAI9nnOE0o94rdL9axowgl3P0EBe3DsQIz7ej95wxt3ayehm
         a2de3zDb+KP19diFct3Te1wtL+OJo53h+lSUEqlMu/iGduB4Yvcd24A0P6SrfN8fFZNw
         Z3tdSNJjLCtI6y+nClSwYoY/x6pZvZl0gFWd1k1pNng2lqNdBKjsH1JrBSsZm6yM7SJ0
         RBCig/HDk7g6tF+lgvuskAx9d4XQQe62lrbGrN7fhdLNkJPAGi+yxw5BJjs0w0kO2Bke
         3k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139590; x=1793744390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRLDp0EVirBnKgldSRz7ToSM81j0nsSsdeqUHhLddpw=;
        b=Evp1BSOTR9sE5mY+RYlXEiMWmt1Sqb6dIDYYpNbujLXpErr1pwZAoPnfuSKQ+Pugck
         lwawgFFOHJwTsdUSEo2XocGPIaxA4Skc0W78ox5Du8gvUQ4/PpDhEULd2uPadu9nghio
         dcfZA3riolsLxaoEEL+/h4CBX2mtE4yjv2mf6oaq69i2LKXyhKj84I9jDz7GObZ7gUYo
         fKO6/dAk7WBTW0jwNQdY4vrC27hOPPoT4IjZMCmoHqqmhJvfWC4rdlzHP5w5hgq4dpgR
         SRMuWb3rJna6deQjAtRfeMqjoGTiKxp5FioAvU8wZpOVX5UDbLGKLcX4hFtXXYHzUb9z
         STGg==
X-Forwarded-Encrypted: i=1; AKwUvBzoRQAK1qjLgYJAI9X57Zn4oSlOtthgCJTw6HJs+dSx0AQm+QNeS3a9XhVoQi8spO8TY9m9o+SfMTxYZIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlp6ru1Jw/UA1ozrgDoAFUsJ144kH7fApcSzc9CrXvDIjVBaYJ
	dx43fbW6Ip5mAr4Bq/SRAj5yZWsGFXU4Uk2CwAVp5uNiprNnDCTzY8a2vpRsW0qeLg==
X-Gm-Gg: AYBFou1MhEWt7T1OnOgcdAQWQRg3YPya///NWYerSlH87EbGj1Isda1M9e711xwcraz
	MciDECn2dJ4eePXA5H6OI1MxDmKgcvd+ipJg1T/zSRnDxFSo1NuwcOnkryvWYdBhpNfrZJt9n9x
	2llIjVGKge2XeJbh9/hN3idBMPv3Je+gcxqIYXpyjgJBOhmFogBQ5vo4YGYRG0dB1ONEgly+fEk
	xmIIu/93+WxSDkCpLPenVwNNvHmOjljtUzQaTHw+bfwHzCMqhtKAwQUou5Zv33SBVtiZrlzpxoE
	4kOUf6cXfEkibr11Gfb/cuufTFEpo1lVHirk6cVyMybw0K1LARwWlIo17G5G9NWnuQB/aLrilAa
	lXjfFyD/vso6er6HCfHjeBCBLQyYk4pOk6HmpYI2jbQkC+z625POaZN1vGSMxVuZHyXGMNdHoFH
	N+01WEyny0A5VdkRQ15GPlqyvqcD1Sy2/Gh5qBWwa74RdDt6O/Ao4kqm9qfbyFF+PU9p65xdVoi
	FrXf4Ka5dYsG8KVHgJrNDP51kSWMnyXdSDETFWsH+9BcpG8zh5mg7gCxua+2Uc8bsRqZ1/yDnEl
	C67QyrZswYb+Usc4x6A7+C/BonDUz+ygxrBjk0xYGjECV9aIfg==
X-Received: by 2002:a17:902:dac7:b0:2e9:8c2b:979f with SMTP id d9443c01a7336-2eb018f7c12mr1057445ad.8.1793139589374;
        Tue, 27 Oct 2026 15:19:49 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm152945a91.5.2026.10.27.15.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:19:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:19:43 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <auEf3eH6QoiM-f80@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
 <20261023134900.GB3977851@ziepe.ca>
 <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>
 <20261023142909.GG3977851@ziepe.ca>
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
In-Reply-To: <20261023142909.GG3977851@ziepe.ca>

On Fri, Oct 23, 2026 at 11:29:09AM -0300, Jason Gunthorpe wrote:
>On Fri, Oct 23, 2026 at 03:04:23PM +0100, Robin Murphy wrote:
>> On 23/10/2026 2:49 pm, Jason Gunthorpe wrote:
>> > On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
>> > > > @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>> > > >    		struct arm_smmu_cd target_cd;
>> > > >    		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
>> > > > -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
>> > > > -					&target_cd);
>> > > > +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
>> > > > +					  &target_cd);
>> > >
>> > > No, we cannot blindly do this for arbitrary ->attach_dev calls - the
>> > > majority of S1->S1 transitions are going to be moving back and forth between
>> > > the default domain and user domains, where there is zero expectation, let
>> > > alone guarantee, that the translations would be equivalent and thus not
>> > > liable to lead to TLB conflict aborts or amalgamation hell.
>> >
>> > Heh, yeah this probably only works properly with BBML2 or something so
>> > the temporary ASID doesn't explode.
>>
>> This is fundamental VMSA behaviour - see R_FVQCK in the Arm ARM. BBML only
>> applies to the one specific case of identical VA->PA translations with
>> identical attributes _only_ differing in the leaf level at which they are
>> described.

Thinking about this more, in case of a conflict, what is the expected
behaviour? Does it result in a DMA fault for the affected IOVA, or is it
a catastrophic event for the SMMU itself, affecting other devices and
the whole system?
>
>Sigh, I thought ARM got past that 'tlb conflicts catch fire'.
>
>So, yeah we need a flag that says "I pinky swear these are identical
>translations". And it has to be a kernel only flag since we can't let
>userspace trigger this.

Agreed, this should only be requestable through a kernel-only flag.
 From the live update side, we would set it only when replacing the
restored (preserved) domain with the new one, where the translations are
identical by construction, including the page sizes used.
>
>Jason

Thanks,
Sami
