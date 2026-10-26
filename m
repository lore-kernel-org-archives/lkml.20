Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024568;
	b=m97OOZIQhg9FY99nI2LepNI+iP1KS4W+e0W1+pUC/P2BawXMp+OABQAdIRPNGuYeCiV6
	 T4XxSKlusx9EhNa0eNWNdI+9P7gHpMOlvjBAaQjqMt/60F1zsqZFHGM4Ua++t52IyaX0I
	 r5JPrapf6+2U0H6rd+Iqjn30iN1riyi0wb0URaSm50qt3sipApdoqdAhjE3h0gbVPAyR/
	 BgTm00233Y+wzcN2wuGlG87cICMip9m0i8qAEDzC+UyykRSSk0M80ywE9MP+b/oQEe/UO
	 wkjHrQcK2nM6Gt33TDm5/zHz7J1PMEW/AvLIIe1EHfgZDO2zvB7naV4PBhT79LfPREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024568;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=aKt6+bsKfLK53L2GaRA3WWqLfNzUo0lW3V0HdvcPXJI=;
	b=vALngDnebXvIJ+sXbz+ypYP5PExSvg6/xd6zfqYMFR6Z9noEhtobkmQVWFLph4S3H7O5
	 BhFxDOxr5x3e4TyPpDfTPBDhrma43E7sKdLDBl2388M4JkPsFG5X1QMTCC0xv1W2+ER5V
	 sPnJGFzvddkJuTiG9k1h5VqajBI6mgAV4GHpmIyJo4p73ixyFro8kMNurS3FDaLfQ0VsL
	 ECpQ3YWC+ePRhhBI2gtcpk0TVPqAkJJGx5h7XgsZ0mdoeq3ENGlpOeU2r7NFAm9JGu1ca
	 Xl/ubXJdBk1hs7ULOZbjObYtRzVIfztQK01lr2YgoFdllGcr4p6kZu2KC0RbwAFxhzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhmotoTd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89688606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhmotoTd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9813F1F01825;
	Mon, 26 Oct 2026 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793024568;
	bh=aKt6+bsKfLK53L2GaRA3WWqLfNzUo0lW3V0HdvcPXJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=JhmotoTdkwlq5uP+ikQwsrku1uYQ8w4CrgqDBBQGrnSQ8fncJUV6Sg905Qdo1IWoS
	 5RyHMQ7joXXGnvEG/1EEYSGiS+fLiKMyOC8UeUvJQZDWmT+oo0byF9GStp/mEVtj5E
	 ChnLqvVcXxkRNtJxnlqXq4hdQhEBH/HXm1MRVUSwBiRAhXMf5D/fnqlFHX2ADL6hI/
	 +qHBoI+zrEtXkaf6vly/J70BbMg6yeiklwe2d7rqLCbTkhql199+pp796ACDzhd/9v
	 B5ceaRbvY0LkNByK5/2141SWcFvqID77OmSGU2mRIkLCzh3iZzeWxIqW8xyeft5E08
	 jl44bha+xgC6g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: rppt@kernel.org,  pasha.tatashin@soleen.com,  pratyush@kernel.org,
  graf@amazon.com,  kexec@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kho: Skip zero-sized bootmem areas
In-Reply-To: <20261026131851.9942-1-cp0613@linux.alibaba.com> (Chen Pei's
	message of "Mon, 26 Oct 2026 21:18:51 +0800")
References: <20261026131851.9942-1-cp0613@linux.alibaba.com>
Date: Mon, 26 Oct 2026 15:22:45 +0100
Message-ID: <2vxzld7kpmmi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 26 2026, Chen Pei wrote:

> The lowmem and the global bootmem area are reserved unconditionally,
> while the per-node loop below already skips nodes whose size works out
> to 0. Either can legitimately be 0: the global size is the scaled total
> minus the lowmem one, so it is 0 whenever all measured reservations fit
> below ARCH_LOW_ADDRESS_LIMIT.
>
> Reserving 0 bytes still succeeds, so an area covering nothing gets
> recorded with a valid address. That is not neutral:
> kho_bootmem_overlap() reports an overlap for any request straddling
> that address, and memblock_alloc_hugetlb() aligns a request to its page
> size, so a 1G hugetlb allocation retries a free candidate on account of
> an area that holds nothing.
>
> A machine whose memory all starts at or above ARCH_LOW_ADDRESS_LIMIT
> hits the other side of the same code: the lowmem size is 0, the range
> below the limit is empty, the allocation fails and KHO is disabled
> although no lowmem area was needed.
>
> Skip a zero-sized area instead, as the per-node loop does. The
> descriptor count stays consistent, as kho_populate() derives it from
> the segment length that kho_fill_kimage() serialises.
>
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Do you see zero sized lowmem or global scratch in practice? If yes, how?
What's your setup?

Note that I already fixed this for per-node areas since those do end up
with no allocations with movable_node set [0].

[0] https://lore.kernel.org/kexec/20261014131547.259138-1-pratyush@kernel.org/

[...]

-- 
Regards,
Pratyush Yadav
