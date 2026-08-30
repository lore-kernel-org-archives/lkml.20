Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CFE3B2FFD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095983; cv=none; b=ECslD/gDJgwGOZqKFeD5bbgVBMTPxdq/6MTQ7Jiua5XfauIQ7v/D+vFIQ7Emi/sAe7qwPhjeCDvxg5MibE6OjwDmT+1vyoununL5QlowqmrzExu+cDUVeP+VQx+V56H5eZOhBlCRd05lJQUkJFOfnouRwV3JwaX+uZpOGws9JSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095983; c=relaxed/simple;
	bh=ZP/TZT6XUCo1CuVlCSwGCRjiDK+auNAPCkIgkSlcLiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC69J2jEtd4ike9GSHtvxxxZO1lsh4u11JfuXLgtLEZ3kyfdKfvfAT/RPWo6mQ9uFgTGRhC0g2MI8d2PX26H3qLaGzbPyWI5aw9sNTh4voLP3kAEQGOJ3bNidNR8fs1mOBfCYdkBgNgyN85TcvDWoVM7LVqNR04DtLIesF6fnpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANHZnKIw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANHZnKIw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2110873a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788095981; x=1788700781; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uiqs0BCvjorNclyNFkKLNj8TJ4SrTKmwWchdlF5iZdw=;
        b=ANHZnKIwwYE4HhlsdK/fvrWlNZmF8NLua6K0yDNNchdR5zImhYaqSB402TefMqVti9
         4TEWZBD4O++U+FXBTLcUFrqvqZPR5aplQRlGBI35ubiUqUQUm0wtrLRPOqHyQjoKS7Ys
         ZO75lA8kVKU8PL8QrE8Z9tHkKSv+ERSA/RaTdkLs8JnjOTbBDXpIFfO9Pg78K6TzdB0l
         Rmqtxqoq8VyY9Ss3F9Ir1kj/IOBdMU86EA+DA2SP23GYrJCNGc/nWnCpK0mVZg2KNNzQ
         KtDIBU+fx95iZ+j+zK5CRXDFnowdrDmlNEZ1vSZuj364T+e+T33uGUJj9t040A7tOVFn
         b0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095981; x=1788700781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uiqs0BCvjorNclyNFkKLNj8TJ4SrTKmwWchdlF5iZdw=;
        b=ESyUGBIu1zSyfX2T7sP/QfR8DkCRf2CITi9vUeSIZWWuHdGH4j6giB6hu1LGruyf8I
         9xWvALmgb2DtZNN9mdKyjWBtBN0qWpzm2HFGU3xf64zgvio/iCBV1h0S4+CU8GfOBP9x
         +3XfBkGcB9QEmh3kJc0fvoJHBK5GafM+3ThVsOU2TQ6luM+3LcANAY5zdQQSsZISWyL3
         kvBIUUp7cAaiWHGlBtTWSCZsSJgAePtuY02glR77GZy7C6QM1tu3lplRqWKlSF3xD+Vq
         NTLnPCRqy1hRHVO/IzQ7JFpOtU09LbdKBemclIoLoSaBZ2Pg8IDm6Kb160AMJlWKaTAj
         pWBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmxeYn8TYbKd/7Aa3RDKfD2i9EnPWn5u0jZzdrqA/cSrfr3GmeJfnHi59Nn8Sb8TZ7OsSHT8xbW2ZxFTg=@vger.kernel.org
X-Gm-Message-State: AFuF++k2mgD3ePOiJPP0wnmNCwgDScykuixeZ6bYRPryEQ52jUbZGmT1
	iy/pEInpyKmc0KbILROveQw14Bh/e9uIIwM7Ww2FGvSdNT/B9JTvQJka
X-Gm-Gg: AYBFou1IjNKwdVo8Fh+FtFBDZMR5fcQTJdF7lwimdQDMZQmQlMkBMxF1zMfitjmv8Wd
	EbJRB8pfzgZkfSD6khRNBLWimQ1MILeZZaoTazrtXR1DUV80/L5cc05BzKNZcee+6EpxFF3cxAS
	1j9tITHMc7tsbEUz3ZjfweOcZPU2zl76b9B/1q1bFqXj7gdUTkA6X+LJS8N4x5MWlb9b5SYoClu
	fb713uwWcrIsDu7Kdc6XQ01MrlQelV7NjQ4raM0Kk/OxH7+5NAooP1W9PFU/c9s/fLysqROVUTS
	DBeNWsmf+bidbrs6Yq2Eq10+8Z83L5+D9tsQvxTBSf3BYo1hukfDU5jG39xyrxPvW4HrgRIR8d/
	Th2utsg7MhrZCVDJOsAAe5nclhtF6a0E8i1MczLwfLf5EJKT7/XgTg+AOhaEf88DjYVunzk3y/F
	jiglxowsGlmygcD4eFjgr+Mjf+RvA2suTY0BOTVKmb5z1YtBaCBFw54aFyAXrqCM7bpiurrguH5
	0S9AK0oR0JpwsBbjfpxvzGs
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr9877078a91.2.1788095981307;
        Sun, 30 Aug 2026 06:19:41 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a2f5187fsm3023979a91.1.2026.08.30.06.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 06:19:40 -0700 (PDT)
Date: Sun, 30 Aug 2026 21:19:32 +0800
From: Kairui Song <ryncsn@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>
Subject: Re: [PATCH v3 15/18] mm/huge_memory: lift order-0 restriction for
 swapcache split
Message-ID: <apQs7U5eveKKtPxX@KASONG-MC4>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-15-9b43f5163238@tencent.com>
 <ba386e23-1b05-4897-98b0-ced78df6dc25@kernel.org>
 <CAMgjq7Dg5pf_MR=C_KqixYmyfXyD3UpKoR_6aO=aBpZsY4yJEA@mail.gmail.com>
 <79aaca61-4e4d-4f1c-9492-41b00bf6ff04@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79aaca61-4e4d-4f1c-9492-41b00bf6ff04@kernel.org>

On Thu, Aug 27, 2026 at 10:22:56PM +0800, David Hildenbrand (Arm) wrote:
> On 8/27/26 19:48, Kairui Song wrote:
> > On Fri, Aug 28, 2026 at 12:51 AM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> >>> From: Kairui Song <kasong@tencent.com>
> >>>
> >>> The restriction that swapcache folios can only be uniformly split to
> >>> order 0 dates back to when the swap cache was managed via address_space
> >>> mapping (swap_address_space).  The old split loop only created order-0
> >>> sub-folios with a fixed stride, so non-uniform split and non-zero order
> >>> were rightfully blocked.
> >>>
> >>> After the swap cache switched to swap table under a cluster lock,
> >>> __swap_cache_replace_folio already gained the ability to replace any
> >>> number of entries for any sub-folio size in one cluster, and the old
> >>> swap_address_space locking and limit was removed. The restriction
> >>> became obsolete but persisted through multiple refactorings.
> >>>
> >>> Drop it now: swapcache folios can be split to any supported order with
> >>> either uniform or non-uniform split, except order-1 which is not
> >>> supported for anon folios. Mappingless swap cache folios could be either
> >>> anon or shmem, so for now we just simply forbid order-1 for all swapcache.
> >>>
> >>> Acked-by: Zi Yan <ziy@nvidia.com>
> >>> Signed-off-by: Kairui Song <kasong@tencent.com>
> >>> ---
> >>
> >> In contrast to the other cleanup patches, this patch changes behavior.
> >>
> >> I would suggest to send all cleanups first, and send this out separately, such
> >> that it gets proper attention and doesn't get buried in a sequence of
> >> harmlessly-looking cleanups :)
> > 
> > No problem, send this later then :)
> 
> On second thought, the
> 
> "mm/huge_memory: allow splitting mappingless swap cache folios"
> 
> is already such a change. And I guess only having both these behavior-changing
> things separated from the cleanups might be harder, right?

It seems actually not hard to drop these two, and keep mostly of the cleanup,
will send a V4 as pure cleanup and tiny fixes. And without these two change
it actually looks cleaner, and shorter to review. Swap cache support can done
seperately later.
