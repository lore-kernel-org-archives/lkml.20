Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796350;
	b=EesUJyl/jri68o83swGl6SFbxzUdzFdgcl910izJBFn//3afa+3vpHU3ITREKM0jJyI+
	 nqi4Whjq5HVU+lSTq3oGyIay6T7F5HjE7lurJAnbt5x6yzzBkQPk/GldhQhPQYJP5pCwr
	 byyjCN8cbYnhdYbSesd3lTt60nmuwF9jwtw07mbhHJX6Bn8kFUSK4/F+h5dRl+Xqb2t7h
	 6vPzQ1+SrGC4gxY/LlaQjgTtZ/O73S5X2Iwj2PUk/l1QrVcZAFfTvrJmw7FEeTEZ32MYy
	 VDqF7H8S7kIjWT8HuFrPLzToTl4lM955lv06IQML+8SJAyUb/7xs8dxFOSlxC2n26Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rrOsYLZJDf0TzEPP307WDbeBhrlf1yktibJyBkuCquY=;
	b=h45XP9CWLfkcYzP4EK1uXeRGLhWwVv9e9MNpKyKeLKrxMCKV3aryTkWJoGxUbSBdOxIN
	 Uw/Znn9FV4fZ2/zLmDp++hr/VJ4ZiaJLsD8j/E32sPbdbGZRpfSE9PnGQxG49OyW0cqq5
	 GmszEY+HEMMJ+TtxXA8uwIO8uj1tFxWPlei6dELl3Zlj32mO+rQ5ICPY5wIY52uj/iXn0
	 NLnd6V2LakQT7dao9M+uqLSJYlEZEuRrahIbYuqiCFUvXX4nro2A/pf507B6VuBb1I/N8
	 uJg+wJYE/BB1YyoQw3qupYrIMWE/rqm+9nX+/dMv7f9r/G3moE5tikfLLViCn5atHcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qicFxI3W;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2845606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2845606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qicFxI3W
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db33db4de9so20895ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792796349; x=1793401149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rrOsYLZJDf0TzEPP307WDbeBhrlf1yktibJyBkuCquY=;
        b=qicFxI3W+Gu/zKA8MsccW6wxbAjuN2w3o13AcU9RqhsfrpKTMPNyDJ6ETH39EtEu7X
         TIJInEUWeehncCZULVYzLDETNMCzsjLC6c8WERBxCA8Cx0KHic5Ky+NmeUTTx7pKq2bX
         FBA1XU6P8b19T7Z5HXnUgsSaKth4g0pgHNhIMw3uJcl1q2xWhQnGv0fZHAbHjqoZ3iKe
         xBGt85ZXxODCg7JEOsoRf0ULaRhwkw38+0/AROF4J7W86pvGMcUxjA2YrAtBZITNG0Xo
         c3oalgCSOjze2J33AiKsqHTIDnqM0x4GMIJAc6FR34U0fOBec4sXvH9BSSZcm4P2/KV0
         Gwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792796349; x=1793401149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrOsYLZJDf0TzEPP307WDbeBhrlf1yktibJyBkuCquY=;
        b=iYoe8QAY+wvmXwxIYA5mx+SN8n3278Q6HumRpKzDQjoLSLo2jGwMiIEtiHGDhYLI60
         K/ZT6FhQwtc3UC6d07mHT2nmHHhPkCNUUf1Cx+xtQtZk7C7h56qrhTVF4Vdhe7Wa9lZ1
         Y1Mrfz0kwZ8VQzUwoBZ4PRM6l9/WQluytkeLrM90s6Tge5kw4nAniMbxRiG8oygPAbUl
         pzUBfIFkRsV9fiUBU1awUS5HKpyc3SRCCrkuiXl0f+eMlhV0MK4QtIz1pHcQIeWxLIJL
         sdLlEXBqcc5niVw6n57TjAteOjHNEGRlbfjM/XCw0Ah6FVMBCL89S4wZMAGhN20sN5Hy
         wsZQ==
X-Forwarded-Encrypted: i=1; AKwUvByClu/r5X51gZXfGRE//QDoLEGFagMU4cQDHikdfBj2vLrLXCkMGpF5//0JoT9iQjJVwdBzTlDI4GwGpcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRh6gcP/1SLZ3kBxaa0hM4hf7GTJGKA9f+ApyceokoKrRF65ca
	8FlAMgZoVIZkVNbGZL3lbstaRXYS0IAA1xtiz6BIA9v/CjY1uuFX2QXQl52hztg2RQ==
X-Gm-Gg: AYBFou0xsUW1Rvu9zZt4vcbtqZsXg/01h3YxbaJUMnrATy9rIbchqQ30hoiyGEF43Wh
	9R6eXN9C04dMe9Sra+RN7eyVkRKxA5VpCfglomSht7eBzjZwQMItI6GZAbZXR2+5VGQHXBYrxYk
	QIJpDSyTyIMqTrlgFx2QC3/PEXwkEXjrGr1uwLfL/+pAVVnEpXf5Xkna9YKfHZsQt08EExbbnmV
	lopz9T76gR3QPnz/eU7GwSlGa/6YIu6YNPJdL6WBkdpWKuf95TogAfVv0ycRs1iqP9/l+ci+Ehw
	98If107nFUnPihIUnPW35Vc62+mMfdv1qjKuUxqqZbF4HcFfIwKx2/XEAMR1sNJhz7ZDHbrmMMR
	c8GbArDCoWu0YKA+qifQTiimMS/7jMXqeOW9ll2YHpRg3KYqBGeTW2NCk47fPRl50sH9yXM8pi/
	l2iTChXlGD4vpCiWIdcQy9a3qAkaTnz70PDxk0vpNu3Xye1uDWAtI244z+vDhO2+PfPPzrjYj+Q
	eoClhDFiyRRRum6Q4a5Fp0Qu7SXpOrjQE9c6YfdVKdV0mmhnrIqDsrReQpjLBrZQtvKchqr1dgi
	U8WOfW9TmJ42ry9V2nyLuuNQ4dJ20UUOdJscGDm452M9MjUg
X-Received: by 2002:a17:903:2c0d:b0:2dd:8958:f8d5 with SMTP id d9443c01a7336-2ea9d109b4bmr841245ad.6.1792796348553;
        Fri, 23 Oct 2026 15:59:08 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f09csm649587a91.7.2026.10.23.15.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:59:07 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:59:04 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
Message-ID: <atvmOnAEhVG3Vevk@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <40a2e1a2-138b-42bf-94ea-a42fda128c22@arm.com>
 <20261023134630.GA3977851@ziepe.ca>
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
In-Reply-To: <20261023134630.GA3977851@ziepe.ca>

On Fri, Oct 23, 2026 at 10:46:30AM -0300, Jason Gunthorpe wrote:
>On Fri, Oct 23, 2026 at 01:10:56PM +0100, Robin Murphy wrote:
>> On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
>> > This patch series adds support for replacing IOMMU domains with S1 page
>> > tables hitlessly, that is without disrupting the ongoing DMAs. This is
>> > one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
>> >
>> > S1 domains are programmed by CD entries in the CD table. During a new
>> > domain attach these are updated using arm_smmu_write_cd_entry(). Since
>> > ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
>> > considers it a non-hitless update and sets V=0. This means such an
>> > update is disruptive and would generate translation faults if there are
>> > ongoing DMAs.
>> >
>> > Replace the CD entries by using an unused temporary ASID in the
>> > following sequence to allow hitless replacement of CD entry,
>> >
>> > - Update the CD entry with temporary ASID.
>> > - Update the CD entry with the target TTB0.
>> > - Invalidate the temporary ASID.
>> > - Update the CD entry with target ASID.
>> > - Invalidate and release the temporary ASID.
>>
>> Why bother transitioning through a 3rd ASID? The old and new pagetables must
>> contain the same translations anyway, so why not just: switch ASID, switch
>> TTB, invalidate old ASID?
>
>The target ASID may be in use by another CD someplace else. Doing it
>without the temporary could contaminate it with wrong translations
>from the original TTB0.

+1
>
>From a driver perspective we don't know why the domain replace
>operation was triggered. iommufd can trigger it for domains that are
>not identical. Corrupting the target ASID when we don't know for sure
>what is happening is not safe.
>
>Obviously Samiullah's use case is hitless between the same translation
>so it doesn't need the extra ASID, but the driver can't know this.
>
>Samiullah please include this explanation in a comment..

I will add this in the next version.

Thanks,
Sami
>
>Jason
