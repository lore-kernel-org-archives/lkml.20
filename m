Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808BD4EFFD4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563560; cv=none; b=je9393mibRybTVFWXwL0jg9qNWRy9gtGDGfEXbbWC0q26HNS0w4rowptj+s6XugmKmSRZjgqJ3EfhI4P/4WukK/ZZ0RGSnXwgL+k8rs3P3eaCvxMNkXNuFEJkmZ5lkLCc/xjNfRpe6V+1cdfjbr+ATbzKLRaC5F4XargShTY6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563560; c=relaxed/simple;
	bh=07yf6xBRrUXFeq5vbgPfsiIGYgZGyZxl3GUx7RyhdKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG7lgNAYQ/lMz7sBh66PuWNJIKiQARsb184hCx1Jn7iH08+t0s5eIBIpQH5DBFOCGKLHpjnAsZfFF34oyrs6xZlGrVBjEKE0zLzV/xsXnwn416V0/SBTVKn1w/vangL+YcH6JGhAu9Qebx/Ma36p/DDWoZ3QCk8K9w1yuDlcgwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EBP18Dwa; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EBP18Dwa"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e55db58cfso593017785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791563556; x=1792168356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/TRD6BwLaJ/NfMLCCm5dSOuj3VkkC7kRDobdLq+Uh4=;
        b=EBP18DwabsAmk/ldPqkZs5ttP4ZXj2zfsqssMvZL2UZ+8gbjGU1+AXzQJaSO1Fx8do
         Tet0BEfQtbUcaOug7UP3mMhPUXHricqcTX1wsym/eIfnuPw/xyDWwAA4AGY3ltsRW6gN
         kxUBzKo9mD+TPVikA9PUwFjEqLDwqrxyll6ggOWZn3RVQctdZq3/+Fr3tCEz4E2UctOO
         d1L/jAKQyEG+xdZqr0wWzAGJkhstAs9djgfSdPyYdJD3h4b4cE/xFqJlcco82d5HIMbk
         /LlBs5Tzxk0B6a65p9pbjZxWiK0F0FYKh9LclAN52wpwgRY8CILzo1DiY7KsXx9OPnlm
         mEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563556; x=1792168356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/TRD6BwLaJ/NfMLCCm5dSOuj3VkkC7kRDobdLq+Uh4=;
        b=BwZ68y7KWwaLrVcv3+5o2+P8lEVYhybSYgWEy6+KchAR1mTB4Jpi1j2xxuwd5tibjN
         Pbamj9+L6tLTV0cNzyHTRE5nkmCtZyESu9IKYWDiwpoIXARSLGLM+tM8uJniu95skL5/
         vaLJQPJUJq8zJeTOObKoLHfgzVRnKv74O2zix1U6uzYyDBuPlez4vPFyTRm23fmw1PYm
         YHrB3F4CtQ683TgaCiMnNywnGizAYHStK8aTetmrsViDJVACuwNAclBkVKk4ulmgZcuR
         wdxNbC4h5Op8qkglUcXBP3XT8HCOrTDhQViFRjLTsZpLUVsbWP6SfU0F7tEzfcAs/4AT
         se2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlVylBA7WIGKKjiQomDAulzvQ67Swp8gn/b5ES+sL01t/IlTjTJld/Obgpwp1MDngUKN63Q3j9joAjkdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mM7Gshe/aaX2ALjiS3qEsQlU1h/TjeasvM16q/Vl+kIMS0svC8
	/kyQscoObSw8TNkE0CLUkdGUnYv4DnHP6k1nqaN+matdtqzWVMTP4wIXraidNKgBA2c=
X-Gm-Gg: AYBFou24js1qV0jNCOx0sGCoAAJPDD9TwrN4/NNICx6MLPvBdkJ5FJM0bcTvY3ls9BZ
	XZR4iuIqEmjQxlEmub9Kfpa8q/bAEWrVmtdqTJ7843Poo9xjELvIQF7o2yZ7vjxpJ+ZC5bTv5Bh
	MAu65BETChfLql5rPqxDYBzEqjmNsf8cDa64C04cv2EoQF3uUVOC5OiMOoPo9pyGVHbQqROf3Sf
	zb4gbkCjjc1/URs7ufc2INUTeMBA1OmsnKD5blpgpncVkFlk2KLOALjyQ/AHJ0CXiIv5Oor41L6
	0lJxRKjq3mpK8JUfOZotdPdyLnxnjAi1pBxOOilzqnEic+YZ3xWxWDLa5EUyY1XiDFXtHXP+06B
	u0JqAifRCRakuPOXe1sgP42IZ6jPoNc576SjS54yUSgBJSpXKSnyYQayGFj///mBYSY+uoQ4Qb0
	9A22wSuGX+AUuU5TAZHuwf2qovrl0LGuvMiAOwWTX7jQLvCzPMD+9tWn7EcXp4WjZ7ODCX389cV
	lMR7DWJtFwwa2M3Y5n+qm5VJBqg2IY7Av+JeRir1TDpXg7kRlAyPzGv
X-Received: by 2002:a05:620a:4456:b0:93b:be6d:4f3e with SMTP id af79cd13be357-93ebd1b7386mr410267085a.25.1791563555872;
        Fri, 09 Oct 2026 09:32:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98906c3sm225037585a.26.2026.10.09.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:32:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xFDWK-00000000Kpb-0HpH;
	Fri, 09 Oct 2026 13:32:32 -0300
Date: Fri, 9 Oct 2026 13:32:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Daniel Mentz <danielmentz@google.com>,
	Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20261009163232.GB14213@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
 <20260924225340.GC16465@ziepe.ca>
 <7ab6eab6-ec6e-47dc-b387-eb380e2e365c@oss.qualcomm.com>
 <52ba8a64-2d3d-4c3f-ae8f-54ab4f0f164d@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ba8a64-2d3d-4c3f-ae8f-54ab4f0f164d@arm.com>

On Fri, Oct 09, 2026 at 04:37:08PM +0100, Robin Murphy wrote:

> range size being unmapped, so even if the total gathered size exceeds a
> single command, we still wouldn't split it _within_ any single one of those
> ranges, only at a boundary between two unrelated ones.

The question revolves on when the iopgtable path flushes gathers.

If the gather only holds a single page size and always starts aligned
to that size then the RIL splitting algorithm won't cause an issue.

It isn't a question of allowing CONTs to be split, it is about when
consecutive unmaps can merge into a single gather. iommupt is very
general here so it can create gathers with mixed up page sizes and
trigger the problem.

For iopgtable we have several layers of logic splitting and flushing
things. I keep forgetting about this bit in iommu_iotlb_gather_add_page():

	/*
	 * If the new page is disjoint from the current range or is mapped at
	 * a different granularity, then sync the TLB so that the gather
	 * structure can be rewritten.
	 */
	if ((gather->pgsize && gather->pgsize != size) ||

I didn't try to do a full analysis that it really is enough for this
series, but if size here is the PTE size including the CONT effect
then it seems like it could be OK. The gather has to be aligned and
has to have a single CONT size within it.

My original reply was mostly to be taken as 'RIL alone isn't enough',
meaning write an explanation someplace why it is safe under the
current system. The commit messages for the SVA and my later fixup for
iommupt explain the general concept and problem..

Regards,
Jason
