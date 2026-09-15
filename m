Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD4837F315
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488123; cv=none; b=WShkgBHzbWnFfNXc/AxPZ1GRP5MMlnwx5szfEXGnehaGJcwuOKKn1kmORhqPs/HBH0izSrWTJf0k69OBvLtFT8fa9nft3/NkMU8XLKOu3xAW2XDBhM9kiMPYUH9g3XSUajfTqqeLqVh1wBJD3Wy/pClJ9ItAD5TbZAuKC+hE8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488123; c=relaxed/simple;
	bh=mUNbiH/i0pq2SU9Fqm0lSE65bqmXeWBBMRPMTKueFow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8GJJFWftzuz6YnqyzWJ7w0ywJFq5jmTsLZDaaevaagoufFPBr+2rfUvgcwIeGal4Pjkn7038FJj/f0LXVDvMmbPVFsp6X81RxNiqOf6sXREbD8CNmOEHFTcBkUj12sNhdH58gn/9WfZe6/ftoDJYh17idREpR42aaNPNJpWBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Z4iBeVFj; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Z4iBeVFj"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939ca12ab70so423486785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789488119; x=1790092919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHorUh9PUsMTcz7XlBSNxIJi9xL/FsLVONo19kBkoF8=;
        b=Z4iBeVFjq5MFXahJFl1OARurgjljxrnzJpntFb5llcucGaGjW5GTV3KBt+vR3xbAVl
         CZcCNQyCzExrLcGOdC/O6Eu5oRT5AF9VTSUKeIWc1jRGeylo5uJmxeyDRddnm5WKpjuE
         EktgA/gyyNbNTG5RAQcXKtn2zH6doXNlst9K8Q0/1EQt2MzZCxQb+At103+OEcGMgYTY
         AAeabVtuPefnJw2v9AUA7c0EYzgOIcGk3ZTG1ZLwSLtcZSemMQvsvpmKCGfdEkbkSvuu
         XeVi8648bnX7gsXO5Nbyo3yf2SKaZ2UDFAmki5UypACXXBXkfLU932+LKRYr7pkRUZ7c
         bjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488119; x=1790092919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHorUh9PUsMTcz7XlBSNxIJi9xL/FsLVONo19kBkoF8=;
        b=kv/XmzDmh3mF8CVxhf2hbriZhr71bWX9Ah7TMi2hZgYyQoof63twy1oFUw9FBb99Up
         nhnyhqUnprTgetJL8+DlfjTBWby2CHSTwnHFv6EZgZza3fo7Ohn0kN5uEPwgJgUCGEjO
         iiYSq063WGOGaEpbzCrNq2qxUdb7J8OR0NZSKtPBotpsdy34etTnR8/T5A5OIpOHVIGr
         QL1Woc9aD6zn5YZF1vMXThCXOKamkmeUME/jxN/FNThKYSs6Vf2BxBiJjj+3S/m8cJyk
         FA8q/CmFnH0P5l1rPmDHUBRy9Tyat7eaIxlAg4+iBlrDYXXKcksNeHWkegCthrnvLyPJ
         Pr5w==
X-Forwarded-Encrypted: i=1; AKwUvBw6cz/JH5xLrDmXdXbXZNsjQ38p0vNu8q7WVal1fbtx/Tf4AXiZY8pmiXA8m+vDzX/Gv9M2Jtu61AJqQwE=@vger.kernel.org
X-Gm-Message-State: AFuF++mwyQn+WPYA2NKcK2WLW2We11UEJGSmzDU5uf4iKLqS9uHVikmW
	pPAarlkm3lCk20Uk/q28Xg2RhugKngPG7jpsywyMZhoO7kR9Vd0b8sbs7YbAM1WNvhU=
X-Gm-Gg: AYBFou0kIbhGJBxS9IxUkdXc2xNfXatthFNoBbD37oV1wQIrTKet9RNyncnv3TofgTL
	WNo+zkW35s+HqC1vC+b4nm9pHWKZ19GzJluBZva3tCs+fJZp4IpZ1QCa4BbDgzliVx2QkPIIENh
	+bR0Yk3nhwiwCnvDZS0pp6s0e4LahAo5a/Q6r/FIoRresC2K5QB7PLwSmhAf+Y051BDHnVWZ0oX
	/dcpbnefwkFS/YcSyNNocwbRohQBndREMX2mYuhtG4m6VqJYYW/2AKUmV0A4LKZQcuOdkYzJ8hp
	5foo0q7z2NDKgj5sLmjUBCtVx5YszxLW/AwFLuEvV0lB7LfFaDG35/Z5aLo8l8ltIxdTLvgQf7N
	FwjxYpWAiTYfXIlP4LEAi1cR8BbBOgZk6v6KBCUZTHQtLBsiFUiLTUJa7LJoBS2UiNQAOxn5qPp
	R6RW48wwph3EycfjnRcKJ7aBMOzyYnF3yERCFsbTqDex19fdLuQ1lIarMVLsy+q2q7S8Hd45yN+
	yxmYRKm9diB7a6Q0ENoOi3LXjJdnREhXybFLAcFnmq50BL0/FrQdrs=
X-Received: by 2002:a05:620a:1994:b0:939:fbd5:af44 with SMTP id af79cd13be357-93a299fbf14mr1209615585a.32.1789488114441;
        Tue, 15 Sep 2026 09:01:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a0414809bsm956311385a.45.2026.09.15.09.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:01:53 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:01:51 -0400
From: Gregory Price <gourry@gourry.net>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Takahiro Itazuri <itazur@amazon.com>, 
	Sean Christopherson <seanjc@google.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Will Deacon <will@kernel.org>, rientjes@google.com, 
	Roy Patrick <patrick.roy@linux.dev>, Andy Lutomirski <luto@kernel.org>, 
	David Kaplan <david.kaplan@amd.com>, Thomas Gleixner <tglx@kernel.org>, 
	Patrick Bellasi <derkling@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Nikita Kalyazin <nikita.kalyazin@linux.dev>, Ackerley Tng <ackerleytng@google.com>, 
	Takahiro Itazuri <zulinx86@gmail.com>, cc-open-source@amazon.com
Subject: Re: [PATCH v3 03/26] mm: introduce AS_NO_DIRECT_MAP
Message-ID: <aqlpxa61SrzhWF1O@gourry-fedora-PF4VCD3F>
References: <CAO9r8zNJ3mSRf5YyRQYYW-eM2eiFvQMXW4Rh0cT=31jsKZpuSQ@mail.gmail.com>
 <20260903072625.62694-2-itazur@amazon.com>
 <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>

On Thu, Sep 03, 2026 at 07:06:02AM -0700, Yosry Ahmed wrote:
> > As far as I know, Brendan is no longer at Google.  I do not know whether
> > he plans to continue the ALLOC_UNMAPPED / mermap work, or whether someone
> > else at Google has taken it over.
> 
> I am currently working on a new version of the ALLOC_UNMAPPED series,
> I am hoping to send something out soon.
> 

Hi Yosry,

I've been trying to pull just the alloc_flags extensions (bulk and folio
allocator API extensions) out of this set and my private-node work.

I was taking another browse to make sure I didn't miss anything.
I just saw this, and noticed i should have probably been cc'ing you
here instead of Brendan:

https://lore.kernel.org/linux-mm/20260914155115.439742-1-gourry@gourry.net/

Do you have any concerns with me trying to pull this plumbing out ahead?
Trying my best not to cause annoying conflicts.

~Gregory

---

as an example, this series commit 20/26 reduces in size to the below if
the plumbing it pulled out ahead:


diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2e079fa3a729..bb43568bb468 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5192,7 +5192,16 @@ static __always_inline bool prepare_alloc_flags(gfp_t *gfp, unsigned int order,
                return false;

        *prepared_alloc_flags = alloc_flags;
-       *fastpath_alloc_flags = alloc_flags;
+
+       /*
+        * The caller may be atomic if it disallows direct reclaim or requests
+        * lockless allocation. Determine this before gfp_allowed_mask can clear
+        * __GFP_DIRECT_RECLAIM.
+        */
+       if ((alloc_flags & ALLOC_NOLOCK) ||
+           !(*gfp & __GFP_DIRECT_RECLAIM))
+               *prepared_alloc_flags |= ALLOC_NOBLOCK;
+       *fastpath_alloc_flags = *prepared_alloc_flags;

        if (alloc_flags & ALLOC_NOLOCK) {
                /* Certain other flags could be supported later if needed. */
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index b10f5422b6bc..863074319c2a 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -56,6 +56,7 @@
  * alloc_tag_sub_check().
  */
 #define ALLOC_NO_CODETAG       0x1000
+#define ALLOC_NOBLOCK         0x4000 /* Caller may be atomic */

 /* Flags that allow allocations below the min watermark. */
 #define ALLOC_RESERVES (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE|ALLOC_HIGHATOMIC|ALLOC_OOM)

