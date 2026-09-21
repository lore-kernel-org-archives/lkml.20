Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9833C7DEB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993063; cv=none; b=hITIFYs/rZu4NJsbVqq9b1MAzUiEXDFrCFLSDGVucEwisBzt9NmGztQTbd4iP6Uuc8/xQRv0aUMJvB3nwpiKwouAuik6nhIRocEhhcChe7SmRIvQj9ugWv+0k2tPuiKlH5dKpIChiKBSezpS5ayHsNEwnNlbNJja8Sm6BTVWYVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993063; c=relaxed/simple;
	bh=FiL7WiwJYKtgbYN0zFXCgciqh0a5CtLpGXjxvHa6q3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxTtB6LcIur7dDZSu6JbYyX4FRv3JcFs2mP4Myh8QF8AjqP0Mfo+ycL+edUxmXyhJD/cm7kVEm2pG0iBGpuaMl1bFPLFonB5w+YAAF/iuGVV8rHRozk6fg68X81Q3TgrySw8OaZNUws/APi6AjTDct8Zc/IMi+1x/ySEFjcDU2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nyd0sqgi; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nyd0sqgi"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939656ff6d9so324414485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789993060; x=1790597860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3UJ+jJG/fm0G4nquu0DTAR8wl/181muiJC8crp8lPM=;
        b=nyd0sqgiYtN335wYUXMoAE4YBew2VJA6NSs7KrYI4P7VF4wS44d0jWRUstSKSNZv89
         DosYhKkoMub8g+iSYHUnqfJVYrWb2+nI8kLv807JuY4LAgI/9DsbyD3dk7155hLS648Q
         YdUhoaeUsd3Xq45sMQu9xZRuHyckNqaNoU6of31+bigcSrz4yh0GT+CAQo4iul8nAzcx
         QqvSGgsPUVKhEmSXpu+sqiPuKvORHUbpk8/2KvRWFyS8f/igwBNnmK+M70joTgkT/qkc
         3VMAXwa1BHykBndiexftq4DLIZMooi25OBcYkaR3Ba/q6A0EHlsrKMuazHJnSdfnVHSY
         8cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993060; x=1790597860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w3UJ+jJG/fm0G4nquu0DTAR8wl/181muiJC8crp8lPM=;
        b=Ax5Y7Ndqfov3o8T+gjrMirjzz6ktRQ1s40fPCwSsOTiG86dKzFWpl2/fvIPkx7S3Z/
         IjQsOlWSqZQ4lI3tuGh3teBL7wq2yxNtCW3veRE16rPU5pBMkXuYvk/5fTu0MNp1oiIv
         jvzTLtVRcbb7+soUT5l+dVQzLAZ8a+VKV635w2HcWZHOBj/Qtjl0KvxEdIL04k52XzQH
         GVZJ/BmVx8Sv0GkOl1n/loiSW01jufxWlpDrsnRZro7qTJxSX4M0Ks239V+IPmeE7Hjg
         3a5vkRpt4+Jk/IXZnd0OYdckiaXiBtZ6wNL+p2CLLZ3Xo51hxReagBgW+THhjQUCNJ2E
         ZWSw==
X-Forwarded-Encrypted: i=1; AKwUvBwdEoqgQdaNMrIRZf5+xMWA/w7+Mp49KVDlbpOjSm22kLc7KH2ztk5YI0Z2qKYCv6LhumSQSlPozWtge8U=@vger.kernel.org
X-Gm-Message-State: AFuF++m5y2c20V5EM92URnLAlPeXYV5O+1GQceiJlwkcnQ5aEFSAmvrW
	HL17Vxr+yd1zedzIITGcZD1lbGrVduNwM16EFKNPWdh5kCC73PngJlztfzhY0p5PmRg=
X-Gm-Gg: AYBFou1an0xUfac/6nQfKdqtL9kumkzbsPFanRNHQxkRxrd4Xf37SHSSz3idjPrTriB
	608A/nodhKe284rwfRmPibakz6Dt2J8cXBeyEkeEpZAJ3OAxRxzlE3HIh0odv0RJsOIdgbL1Wpo
	3FM7IeJfkryVRqeANTCS6VCWLs7ZSpcRiLN+fCyPYaBeOHW16SC9W09u/CkpKzUSxwwSWOx4teC
	Jb5eGf1tGXrob5gmS28kKboN4SOq5nyYC+J/rXN5IXBdBR8KaJDiHJN64hj9cRYeF6K8hV+gtoO
	98wu+dgrN+b6JR6WhUseDMIF3WFXbzfUDxZNJo6DQJArNEpQHu6ABI7LALlMfFyEdfYO9mp5z5k
	igIuGpzRRihq9UL8mSznKD0az2Rk6IjTS0IN8Awj2eKhO3zDiiOjjD04PAYFqC1qftWDoQpWIfH
	iTWsjvCGpLlMLzKjPOnDubP4leZKKZiPADhefnHP3R/6hJZjRXQtH+0KuwFO9oSSD5OrLkKSkYs
	r0MS60roS3FqZBwlJs2QnEG+4FIYXn9ykqK2pjeNis8mNPK1blZ3BIuR4iC32O+D8w=
X-Received: by 2002:a05:620a:440d:b0:93b:e6d3:3149 with SMTP id af79cd13be357-93c15ec31camr28407885a.53.1789993060138;
        Mon, 21 Sep 2026 05:17:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedac21c7sm633945285a.22.2026.09.21.05.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:17:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8cxn-00000006Foq-0Pwg;
	Mon, 21 Sep 2026 09:17:39 -0300
Date: Mon, 21 Sep 2026 09:17:39 -0300
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
Message-ID: <20260921121739.GM11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>

On Mon, Sep 21, 2026 at 02:05:50PM +0200, Christian König wrote:
> On 9/21/26 13:51, Jason Gunthorpe wrote:
> > On Mon, Sep 21, 2026 at 11:07:17AM +0200, Christian König wrote:
> >> On 9/18/26 18:53, Jason Gunthorpe wrote:
> >>> On Fri, Sep 18, 2026 at 05:39:55PM +0200, Christian König wrote:
> >>>
> >>>>> Arch code can figure out how to do it. If some ARM configs only give
> >>>>> order 4 folios or whatever then dmabuf heap doesn't care.
> >>>>
> >>>> The fundamental problem is that DMA allocations are highly
> >>>> architecture and device specific while Linux memory allocation APIs
> >>>> are generic.
> >>>
> >>> This isn't a dma allocation, this is a memory allocation.
> >>
> >> No, I mean this is a DMA-buf heaps allocation. It is a DMA
> >> allocation, we just don't know for which device.
> > 
> > So? How is it any different from the existing alloc pages?
> 
> That you need to specify that this is for DMA without encryption.

It is not for "DMA without encryption". It creates shared pages in a
CC guest which *every* guest device can DMA from.

> >> That userspace provides this cc_shared flag is a NO-GO to begin
> >> with.
> > 
> > What do you mean? We discussed this with the heap maintainers and we
> > all agreed this was a kind of heap just like any of the other kinds of
> > heaps that userspace can request.
> > 
> > It is *exactly* the "special allocation requirements" you are talking
> > about above.
> 
> I only see a fraction of the patch set (because no DMA-buf
> maintainer was CCed) and to me it looked like the cc_shared flag was
> added as an additional parameter to the allocation and not a
> separate heap created.

?

It was merged months ago, and you were CC'd:

https://lore.kernel.org/all/20260325192352.437608-1-jiri@resnulli.us/

It follows the design the dma heaps maintiners guided to create a new
named heap:

+	exp_info.name = "system_cc_shared";
+	exp_info.priv = &system_heap_cc_shared_priv;

Along side the normal heap:

 	exp_info.name = "system";

It is identical to "system" except the pages are "CC shared" meaning
the hypervisor and every DMA device can access them.

This series is just adjusting the rules around how
set_memory_decrypted() works. It isn't changing any uAPI or adding
anything new to dmabuf heaps.

Yes, it ends up as a flag in the internal code flow, that is just how
it got coded..

Jason
