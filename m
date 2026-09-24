Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6082B4AE12F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272183; cv=none; b=pNpj0gvbHDvIhf3G+gUiLoJkbo/gdoCSunY3/i0aIaWndYQOWu9XtWt82FeNoDEGraDIulm3X886uJSy4cAkk+oU0F3BM2IPDS5EETjfh8x2D19HUGIK/BzEhzIFBGL2K2sdk5Adr1Jba2evVyOxAHDKSw1twu7/ofeCAPqx2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272183; c=relaxed/simple;
	bh=TDcsYHIaw35uYfkUp8SSuaUhuxl/3WHswj8+KRQh5cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g85RuH0F2g/tCJTWqT5BUAZ+idww5cVszVNAMvlmbVcOrwgDhYVFIsfSlFSEnbi0zjEr3FJn15m1ryse8OMXtWbxNYjTB2CSDAbyOPqIXAMwYQqMLjVvBp8pfS2QXVesdxOHahW3f/xvS3Lu6CZ5OVnUjvxImTwbejn6uxunqvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zlf8mI0R; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zlf8mI0R"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d8facae850so6875ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790272180; x=1790876980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dby+5gVayzal4X1RiSbAFD0yfNnYiqO5W3Aena5N53g=;
        b=Zlf8mI0RVEWhjCRNSxqD7FftQtAWlqF/rYHEybvC6e9OX+6+PZ2zeImHZUEkOmLXRT
         3M0qOUGPMrk2s2NnzrLf4APZC8XLsAzCCWDmIMmP+n4oB8vW0kqhqOuFWiC4C0h7K9oh
         tmFUsrr1/9v2EolGORuPJtznxUkVSsH4Mf2vuQSot6206TT4lh7qvt9jLTvs0yx6cMYu
         BE8HhE42H3VGBlFXlkYy7LisW0R6mjO6L6fZjK3Z3HP9d5gw2h/ISwVr7jI6ngHq8rGD
         /zL2puPiHlCKGn0zrLAjv7f2O73RZrQRNiN4FeqmQE2/bUZ5xHAnluFRaFEtctgs1eLK
         cPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272180; x=1790876980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dby+5gVayzal4X1RiSbAFD0yfNnYiqO5W3Aena5N53g=;
        b=tMeUTI67PinZuPgYFDd4aB33oDgafgP/LzDYHAtKR0efChmGakwcU9ZCvMCO9+PruN
         CaD+gvywZR9STVeMXj3rrTVVsN+mIXHOHWc+7cwhhMj+wP6Cbc95bCuZGhigO78aQkfE
         uLQY6e2GPVoK3UJjQ0sa/LPqLCa5AYGhO3BUmw8TH8VNX1AMUHaARmNZ9rRIg+UF1lSx
         Rtqz/2P34nBUVRKaV/aZRQz4RMF9l8nvJCOEdd4zcLgQiSr1Eldky02fgPo1PTAeHqp+
         XVPUsddcEvYDzVYAcMvGrn5gjFM6lag8ij4EL9PZKKQEm4+BcyyGecrUFP6vjwkXk+Y4
         8jbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpWxeeUPTMgbhSHV27AXUEcMA2c5XH8dQ8kaWGbkchJha1M2PUzby8SMth9yZR7k4hAbw0E1WGhQt+woM=@vger.kernel.org
X-Gm-Message-State: AFuF++miOwGG+3dqInfC3LEVzncGQwEwxwyjQtLi4y1NtotqNPjF/ygE
	2ItMgidjoeCPWcgu49fNxmCzndPynhG2UbZv2wPxHB7Zkwq0T/CTPt2TrGvnTBqT7A==
X-Gm-Gg: AYBFou2UvdcJjc74T6YhB9HogjHEtqmW9BFFGyvu4czR74pBs9niyI1a+odQp04dh+0
	kX8huNfXkpbwJ1gBTXxzilok7YLM2+gqsExUMJ7+qwaLNHxkssfymcoEQHfRlfd0r/vzG1jAuDl
	hQ5LoxPIvibsFm8myvPoJKkeYuO3OzFls8Wc1l6yVekBLEohUAiwDvxEARZ9UbwIdwR5mLB5hpT
	2UJllO4Cf2J4ms49cIUWHZnd054JgZodNHVMA/4i1xabYSxB94+lmLABG9M7PTi8ZeBL5KYYrfS
	UbPz+1YqEsRig63dvwBKCpLbgNmBnZiy75qfq9E0iij1fEJYMxTn5en4siJMIOq4YnmuaCufSgd
	D2klTYvDpFOXojHdcPg9D5xm5vRn5pACQ291uTDBGD53NYe+1Tj6VjUxrb129YXtI0x/Ulkne9A
	S8U0hVtA6Kl5jIvaJym3IvdRsQTyDKouE+2OLUfku4HYkeh03WfhSNTgV4vDJV923f6nxaaJNKA
	0FEeOCmjvvEfVx7SEGVN3mS+QrMnFiAvfTcyRHMtC2sZVcWJ+LT1nqt9B0zpHHHqc3dQg==
X-Received: by 2002:a17:903:1aee:b0:2dd:3a08:d47b with SMTP id d9443c01a7336-2df90f4fcbfmr274255ad.13.1790272179931;
        Thu, 24 Sep 2026 10:49:39 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b2235811sm595000a91.7.2026.09.24.10.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:49:39 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:49:35 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: John Starks <dev@jstarks.net>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, YiFei Zhu <zhuyifei@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>, John Starks <jostarks@microsoft.com>
Subject: Re: [PATCH v5 15/18] iommufd: Persist iommu hardware pagetables for
 live update
Message-ID: <arVYa_90j0oN1hnu@google.com>
References: <20260921004834.2601285-1-skhawaja@google.com>
 <20260921004834.2601285-16-skhawaja@google.com>
 <goxdwq6ny332pnrojvp4nuz2mliofd3yxd73fpjnbesq3e34fe@jq4d7v7rbwx3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <goxdwq6ny332pnrojvp4nuz2mliofd3yxd73fpjnbesq3e34fe@jq4d7v7rbwx3>

On Wed, Sep 23, 2026 at 04:59:30PM -0700, John Starks wrote:
>On Mon, Sep 21, 2026 at 12:48:31AM +0000, Samiullah Khawaja wrote:
>> From: YiFei Zhu <zhuyifei@google.com>
>> +
>> +		/*
>> +		 * When this memory file was mapped it should be sealed and seal
>> +		 * should be sealed. This means that since mapping was done the
>> +		 * memory file was not grown or shrink and the pages being used
>> +		 * until now remain pinned and preserved.
>> +		 */
>> +		if ((pages->seals & req_seals) != req_seals) {
>> +			ret = -EINVAL;
>> +			break;
>> +		}
>> +
>
>Is this sealing business sufficient? Even with the specified
>seals, user mode can still punch a hole in the memfd after it
>has been mapped. This will disassociate those pages from the memfd
>but leave them referenced by the HWPT.

Nice catch. Since punch hole doesn't change size, the shrink/grow seals
will not stop that from happening.

Once the memfd is preserved it is frozen, so punch hole is not allowed
after that. To catch the punch hole between map and iommufd preserve, we
need a truncate count on the memfd that can be checked here. Or we can
iterate through the iopt pages and verify that they are still associated
with the preserved memfd, similar to how memfd preserve already loops
through all the pages. I am inclined towards the iterative solution as
it handles all the future cases.

I will fix this in the next revision.

Thanks,
Sami
>
>Then, when the memfd gets preserved, the hole will be filled
>by a new set of pages, and only those pages that will be
>preserved across the kexec. The original set, unless I'm missing
>something, will be dangling in the HWPT, allowing attached
>devices to DMA to the wrong memory.
