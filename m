Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC76382F23
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469277; cv=none; b=RKZIyJgvgHx5PcCRbDsBAyaUxi4hKAbm887g3pqVgv0egmtEyAvsOCKlSWAdMvdDfm/EQCzz/kME8U/dQQ9gysKkK1ID7XlPOfF0aCnZkOrvJpjOM6LKWtP2PymtZrgHCOcyH/PS5cVxam+S7I7+BhxSPoO/lu+24CIGq5Nt5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469277; c=relaxed/simple;
	bh=JSc3hB5pLYdZH8UknDATBVIxmfDjkSlYj2vg/FKzkkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiB/1LeT9e5KFkfaNBqsBn9tJZycMcQNcsPaYGwXFJuWlfxHdJoyjTcPxmDlP2XU7PI7OzESLfTwjPpAyybz2w/j6rJX8QCkRUr13rfZ1w1LmVT6hVjJ+Fs0RLLHziWIdpAAwu3gGEUF9QGp/ZTJ6wqJ19nMqLoOGa6SPyB18yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tLrOJ3D8; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tLrOJ3D8"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca07so5215ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788469266; x=1789074066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8WxM8+POfE1P9m9JpepW1Kq4nxPF3SUoeDA/+jcOrg=;
        b=tLrOJ3D8Xf9pEXkzlFAA12n9KJmB8pQ12FPmDGiFN9+LvanFJBtmbd+u/ui9C0BB08
         H/eS4u8OGdcnCNN/QfcyEgqWJ47KCMFV8kGzFBi55Nr6UYEgWbD/YzMckJ1Usd6dfzbJ
         tBSlY+bLcA9+j3QFuQdnekE085ea0SYviVoQNYkWFuxcjVj70Za8PxMdTqi0SviZ8fKH
         u6rIUQgpq6dtFY/ohEv6CCIFO+eJFI2xSoFl1bkiBHtKCMo0Ch8BepeNZ2FLRvOoYl2n
         Q5X2gQBCTjVEAREjxNf5kp1Pq6uRoQuAEoMqpvxGzR+Sh/uDXB/dd0ms0HCBzc+INSLN
         v+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469266; x=1789074066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8WxM8+POfE1P9m9JpepW1Kq4nxPF3SUoeDA/+jcOrg=;
        b=ktKqdlX2mIo+Q7Pu016RhjZ3zqDVVyLP+U8FualplCZtdO/ru129iQ30s17Osd8Ovf
         N1M1pHMLkbNThZas7U68JcLaWIYlPWgoV1Rcjc+KVt2DFd1X7nZdEA9+Wz/Kxo71W5GU
         JdfY1BCw1e+1tud9Xou0hXyZtlqeHm7RJQu2++R+lyRnCsa8499h+QyMhhtJR838+3V1
         NJrZ855axnX7yvfCs6IsLbP4QCo5weADUczEdvpkbcw577BGXQWfDoA5aZNUgzA9Ym7j
         S5l5QQSq5dqe2+wExO7vS7iVTD4jTsayV6Y5oUa6mYmANi10WO75F0srrppeM9Dl8xg7
         Sx3w==
X-Forwarded-Encrypted: i=1; AKwUvBwL3xXQM3YgnFaRX0dwXGqu5d29c8NvPotoUP48E/UPUDY1JxExCf5Hojk9Rx9GH4TK4cGX7h3Z1lheeKM=@vger.kernel.org
X-Gm-Message-State: AFuF++kosaP6ELTzO6T+TswDMuYvTw+HwtXr83qJvx3opGiv5I75xmlS
	Ky9o/V2CsutTK3VCjWqSC2FPAyhLCeF/rRn6ZOEojMjrQGi8LRE915WWlt4MpQraXQ==
X-Gm-Gg: AYBFou1iRJ2e+nzAzn0BxrEbOrpF0juKg09HgsiHelwC0yAMgll3tBRKSrbRbR8Q/oj
	ZCIQxzi5wNztj60grunNMZCHOb9XBlk/LPqFGBQ0uGs6D+q55x94jXyLPo+SLmnb8NY2mwk1TAy
	LjIC6ctaskix8KxhA/RpfWJygle5bcpM2WkiDhwA++Tiy0L3af73kViiPRlsP2zLH/hakvMG0ss
	viTS6VOXDQ1IRKSrXpdzRXnb+4L2xIeC9b4NqQ1UuRYR3yCc5ZG/89GusK54P9X04zxV03a/ION
	AAjMmviKRTbbXAmXheTNEYZOiJH0Hmeh7HAPQqgBMDxuirMWANqu6gsVG9w5dt7ydbCMsgsipA6
	WYfypqZSduTg44JECTfkaf0yXMfQUHnjO1yCAQ6U0Nk+QYJe7AKY6bVPAV+9WCN6vL78isXFscL
	kweeC1ZFsdU1roFOcLZGvkMzapmMtobHXCcwhgy3L6H8Z2IjOBXCIP92YkUxsfc77BSjcbXZRUl
	4epFvxN1hspfmabYJnQM/l++SyqzudD7PvwaXg0Q00iYXpobANULreO9PJShZWFwNYd8Hkuj4DI
	yvfuf3E=
X-Received: by 2002:a17:903:287:b0:2bf:3579:cdaa with SMTP id d9443c01a7336-2db155f53d6mr1113975ad.10.1788469265229;
        Thu, 03 Sep 2026 14:01:05 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc454e22cb8sm100218a12.0.2026.09.03.14.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:01:04 -0700 (PDT)
Date: Thu, 3 Sep 2026 21:01:00 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>, dave.hansen@linux.intel.com,
	Liam.Howlett@oracle.com, ljs@kernel.org, david@redhat.com,
	willy@infradead.org, shakeel.butt@linux.dev, vbabka@kernel.org,
	jannh@google.com, arve@android.com, christian@brauner.io,
	tkjos@android.com, dsahern@kernel.org, davem@davemloft.net,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 0/5] mm: Unconditional per-VMA locks and cleanups
Message-ID: <apngDH-dLve0HvgG@google.com>
References: <20260813193433.3318288-1-surenb@google.com>
 <20260829185625.f5ee1b2931818843a78af88d@linux-foundation.org>
 <apVhzM2501wSiGGg@google.com>
 <aalhqe37szvcitr46c4fk6xcjtjjzm4zfm7ltrno2spipvq2q5@7svyjfbegb3s>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aalhqe37szvcitr46c4fk6xcjtjjzm4zfm7ltrno2spipvq2q5@7svyjfbegb3s>

On Thu, Sep 03, 2026 at 04:48:31PM -0400, Liam R. Howlett wrote:
> On 26/08/31 11:13AM, Alice Ryhl wrote:
> > On Sat, Aug 29, 2026 at 06:56:25PM -0700, Andrew Morton wrote:
> > > On Thu, 13 Aug 2026 12:34:28 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
> > > 
> > > > v2 version of this patchset [1] was written by Dave Hansen and per his
> > > > request, I'm taking over this series.
> > > > 
> > > > tl;dr: Make per-VMA locks available in all configs. Simplify some
> > > > of the per-VMA lock users now that they can rely on them being
> > > > always available.
> > > 
> > > It's been 2+ weeks so perhaps a refresh-and-remind would be helpful.
> > > 
> > > But it applies well enough and is adequately reviewed so I put it in
> > > there for testing, thanks.
> > > 
> > > AI review might have found a couple of pre-existing binder bugs:
> > > 
> > > 	https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@google.com
> > > 
> > > and a small rusty thing which you might wish to attend to.
> > 
> > The binder bug is not actually a bug. When using VM_MIXEDMAP and
> > vm_insert_page(), the vma takes a refcount on the page, so there is no
> > use-after-free even if free_page() is invoked without removing it from
> > the vma.
> > 
> > Adding an INVARIANT: comment to the Rust code SGTM.
> > 
> 
> I think you are correct about no UAF here, but the page isn't exactly
> pinned to the vma - which is what I thought you were saying when I first
> read your reply.  It's sort of misplaced in another vma by an mremap().
> 
> vm_insert_page() will increment the ref count, but if the vma is
> mremap()'ed with the same size vma (ie, not expanding), then move_vma()
> will relocate the pte and the old vma will be closed and set the
> binder's mapped = false without a change to alloc->vm_start.
> 
> Binder now thinks there is no mapping but the mapping has an address so
> it can't map anything new.  You could get around it by replacing the
> vma, but I don't think that leads to anything interesting.
> 
> So we still have a ref count that's okay, but now binder has an
> alloc->vm_start that's stale and a mapped = false which leaves binder in
> a bad state (one might say a bind).

Right, binder should really reject mremap(). And partial munmap() too.
The is no use case for them in binder and it only brings problems such
as the stale alloc->vm_start you mention.

I sent out fixes for these issues here:
https://lore.kernel.org/all/20260901205250.1638304-1-cmllamas@google.com/

I'll Cc you on the next round if needed. Thanks Liam.

--
Carlos Llamas
