Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949353E313
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001064; cv=none; b=Ndi1Tkv5yqOJFsz2uTf98U35hw/OHms98JpfNmxZR5x2NL8ovgiA/qZap6TVGF+VyFM+LJYVPRFpwe1T7toRZSb6hRT3OiasRzDmTGIV5eInEgAoHlHd+yG4WCFDoHeAGfyJFic/2LutHi8Xq2v93ku935LahgNOKOaC6uQzZ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001064; c=relaxed/simple;
	bh=4ZfibqtjyVHs6vICgBrtNWhVZNaukgTijrvi4R5y9Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGH7albGYPzFmbJBguV4lhkrBu+Gj1M5PGf//c75E6EZxA3hHyFWlyOPCWMCIxPwAdruP5mvF44S3kstv9KNWbze6lYiT4Xd1VtpUJEnLVa8ZOo7MKjD8Ebz1h/V6Iy3YTnwGYltaONJjlLAmQcX2PceUVWukhQ365GZf2aBa4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=dqSna4Ob; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="dqSna4Ob"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8266c388b67so3757466a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1792001062; x=1792605862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sre2Q8d9osDFJ2pO/rFODA9M0mfR2oBhyc/Yo4XzZZQ=;
        b=dqSna4ObfE0OweD5yMSvF8FNwmzD6BnXgPiC+qXK8tHB9iOj693tqHvbFgHkD5PxFT
         GZ7LIZqs7P6en2S9uj3AbEmPqBArTLy2MXulzqPojQpm34B08r8cQx9e9DjBSeJY6xvu
         UsH3rUgiti9aCTfHRbUpi7woAKyOoe00OaVio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001062; x=1792605862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sre2Q8d9osDFJ2pO/rFODA9M0mfR2oBhyc/Yo4XzZZQ=;
        b=KqAL1ZXj1dJtnTmiTX9gt7ijNZu29HlZf9cBDOM03E/5EwUvoTMjRDPqcH+EzbIMt8
         U2xrwZwM3yQEUog3QMADdXbY3n3KrsSGoPq929oyMSqOiwKWbXQp3sOKlzo1Qp5fxmVW
         gxwQhxKPdbwHj/yBPOmMiC7c4EoLhf0l8pRhMD5bBFdkr52wN4SO3riHdO5ys8zKOK76
         Aa3a3B7QBRHRvt+BgRhluFNBkfZiHTmyrOCTxupCzRfjVvD9OHa0q3c62vKXa+Pypjss
         8itcpFzm37lpaQ9Lc7swxXOdZm/ZbTvSu+iyDEtV25oMQdMDCAvkymaKNjQBfrcSFbTn
         OQ4g==
X-Forwarded-Encrypted: i=1; AKwUvBxQ5GCpMwRlSzxLnhFsL7FDRRQeD8wFVc7OBnvxMh9S8GoJwOHWvbABxfz7k15oDaZtm1x1Quw+BE8Z3U8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpJxZcvy8HDS4cm9wr4ujDP7sfA+IhD50IgFUx66phm7XObdXL
	lws6xnQDWZX7ovaVmO7rHiN13/RnnadI17HlFyYFr6AJleTSRcemgDzGTqi6qbQVBvw=
X-Gm-Gg: AYBFou38zzoqLvff6xR2/jEaW/Vk6CrmxO3z+W90BXX9c+u0PrnJuWcMUw3bFhAs5u9
	JbukH7rMVCEB7nG+TQNFKq+ZkpbHXNmIyc9DCvD/9uI9FpwxkG5xgkCgJHWJFRwSXNpttEJGKru
	/OR9frQbEoj16Uq4l0O0Au5VT3B1rE73SJTh/x+hOVjCaiBWznQmH3rQUqTN9fZfEq/gAxTqtMI
	i5JbDwfLEdm/taddCRSCFDQvgQRPXVp1KcD/OTbaN3vBVxZVO07NBJZ8x0Y9hQUEK79ADKESJBq
	lFOLvIsahcpj8fyLClfo+OtwETspFjgalEUPrgBmbGG5/GUgs534hTr6I+6LAYcLg4IAyNWTgS8
	kH/l3CRx7T/NlRN585PqlpnNI3DZfNy2u/obebAzxFsl2OSHQhzYcoUaq6NVcr4zsYdPXG3a9dP
	LLThrH8xuuHG+esZu9HIlSZdnWhBENCu2kheJxntIx5pxxcPU8c8YU8FfdX3HwCZ5m/1P9kfD/j
	OQH1OMnnStaiMGWgTphockikSmrn4o9UHZs7Hg/0KV4mudFxANQrQ==
X-Received: by 2002:a05:6830:6f8f:b0:821:8e71:1bb5 with SMTP id 46e09a7af769-830963f4818mr16941700a34.14.1792001062029;
        Wed, 14 Oct 2026 11:04:22 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076dc3sm17027951a34.14.2026.10.14.11.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:04:21 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:04:17 -0700
From: Kyle Zeng <kylebot@openai.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	"Liam R. Howlett" <liam@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mm/userfaultfd: only allocate anon_vma in CoW mappings
Message-ID: <as_EIRMinCdl1zOx@com-75606>
References: <20261014-copy_hugetlb_page_range-v1-1-5b68e03fe7fe@kernel.org>
 <as99gyi-NUprRK6e@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as99gyi-NUprRK6e@gremlin>

On Wed, Oct 14, 2026 at 03:51:22PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Oct 14, 2026 at 01:53:11PM +0200, David Hildenbrand (Arm) wrote:
> > As uffd_lock_vma() is part of the same lookup machinery and
> > also contains a misleading VM_SHARED check, change that one as well
> > directly for consistency.
> 
> OK, I think that one isn't _strictly necessary_, but while we're there,
> worth doing too, clearly.
> 
> We should also go through and convert the remaining !VM_SHARED checks ->
> vma_is_cow_mapping() too if possible, but that's a follow up, obviously!
> 
> >
> > A follow-up cleanup will stop taking the hugetlb_vma_lock_read(src_vma)
> > lock in copy_hugetlb_page_range() entirely. Further, the usage of
> 
> Hmm really? Is it possible to do that without the hugetlb lock?
> 
> It'd be good in general if we could get rid of that lock as a whole :) but maybe
> dreaming.
> 
> > VM_SHARED in userfaultfd code should be cleaned up later to focus on
> > CoW vs. non-CoW mappings.
> 
> I think also anywhere else in the kernel where this is done. An audit on that in
> general would be useful!
> 
> >
> > Reported-by: Kyle Zeng <kylebot@openai.com>
> > Fixes: 867a43a34ff8a ("userfaultfd: use per-vma locks in userfaultfd operations")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> This LGTM, thanks for handling this!
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> --
> Cheers, Lorenzo

I ran the patch through my system and did not find any issues with this
patch. Thanks for addressing this!

Reviewed-by: Kyle Zeng <kylebot@openai.com>
