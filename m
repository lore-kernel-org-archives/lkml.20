Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285050;
	b=ZMGzSzg7qvGuWz8M5GaRIkbm23CKk5EhXpwIOSqxQd3GDdn2qdTBJn+7C/RsS1L787eG
	 DHcTNKjjJdrn+XuJrCtNEebc0iDXsplWFgQh6yJL1kDCiYGJ5uR0JtvLev3L7Wz/tlCHV
	 0fjgXDYecx/JeqWOVapM2lP8AWvvit/LQU9k51WaxzahCqYmmTX3JyXvQfFs2Yt4CZpwf
	 7K4Hdo1UZJ3ohg2OBWbU2EgSjWKsl8yJkyMJ/BX79klgOxP8y4X/dc0i83t/1bCHBtNGT
	 HnsbHa4+Vw/WHqTDF/YgefRl3MrsqD8oi7I08B+sFzuVFFag+2GmJY9xziubfPwyvIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285050;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BvmHhBLGohXx75lnYm8/9/6SdurdyYB9PRQDupCTi6w=;
	b=mDuIw1wWvyIicBvPtIdZw3ZNixpu7fXjdfzHdv21IXLY2hu21ejVrMEASdqdfOW4uD9B
	 ZUqkWQl2qRRVgOlJUyNSd5gcgvXDcpsSDsdjTI6CfZsTmYQk9gYQZDfD/6HsdIK5F++xa
	 rI5XT73VJTR5VBz6Rtm3wy0RXfUNHT8pUpynGeFquQxeU1k+nZT1T/syVaCXCpeQPLjnX
	 704Aet7tKT+DTiz7ajpaytUrsC4+sLIF5efyo+3wZuNRgdhyTxLs1sDmJrufuAODifRZj
	 YvvIsZH0+wmPXqyhdYlTT6FuZs0fVNPP4O7RoL4gq3WhuU5ovzbZvQb+2uugrTh9p6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=jZjDJKKi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LVQmvr8S;
	arc=none smtp.remote-ip=202.12.124.141
Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=jZjDJKKi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LVQmvr8S
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 9B4E413020E1
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:44:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Oct 2026 10:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793285046; x=
	1793292246; bh=BvmHhBLGohXx75lnYm8/9/6SdurdyYB9PRQDupCTi6w=; b=j
	ZjDJKKiyga4Cevqxjtfso81DEsOTxV/uhlEAOFzmtz0CyW4mt46lOfePwuK0F3N0
	TiF8k+bZo7QIGO8xB2Ab5ONpyMrFsW5klrCKtgyCQqao6BXVHxD6g1mUZBt5dBht
	/fnH6X7Vcb1K8dfovVWQxPa1yCRacnVPh/2y/Jz4l+6dDsLYCReX6SQzU0afmjMX
	xvFkn3vQuuLO7imA8tnV5aqCXRiMPrCbPqKO3W03HjCXRpZKSYhiKyb0l+xEqc2z
	xGrzLRaCXvNj0Woo1AMWqEFIqN/eilGjXL9+QmtyB62N6ed+BBgy8S3qKVHLAAXN
	z9xj+A/rdOocUrGUs/bCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793285046; x=1793292246; bh=BvmHhBLGohXx75lnYm8/9/6SdurdyYB9PRQ
	DupCTi6w=; b=LVQmvr8SFga7nNClFP3wH1vEsVGgAvsneoKcKk7SXjpyslOEX57
	CtCBlAgOdRlcXcZ/utgBP51U4eH1VUNyWbSCn6U/SqJ7WZItM+APBbplZk8KkChm
	H9+LFSHN+dQ2hoaPKd83JmzCC+1lXcnp0Q2ywDaiSu2XBvSp9kq7p0MhAXSBuOVi
	izP7SfmavUVRqzvFsX5lNBVET/pbghF7/Uv2vmJ+Me2r8AcrKC931UgaCOgj0ZpR
	kPEqpw0n0xlXatREcDf7CJTjHAcpetn+tPLGRCFVeyb9x6dWi/qyP7WIaqE/xUK2
	tndO6wdvTsbEd3Ts4N0RgITBIAZ2KQ8Dn1A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793285046; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:hsFpN+JZSFVDMDe7hKZGW1BoWUljzsrCwi2LlJqv4oO886f
	LOdACmPyby4CgS3LasmAKkmKxqfXdksFcAAb1yvNDuQtpvk1hdZgi2ABa6LOLx2g
	+n68W/PjBmcclcrKUH+k305bPEuOxMQzygKwL+mFP4vEuRMmZl80FfkTr1pGaDCi
	X3jiXAGVnHkE2Lt02cjd6AJZUqy1jnb9idgS9bpbFOEDQcwAy3nLS1hm4hk0kE5P
	f0XG7I/QsRo1T69SbXblmK7Bkr96NDjzKNr13QpvACI/GWVAEoNdgSoMP3xKKOUw
	NMR1tC/+hZl9xwEaUDqByMjdMQqIJExq7WJrzow==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qCKTloRUxu+KzFqnD2XeGlknVMYHZ3cPjnHt18V9dN4=:U8YSMlkiRiLYOyy3PeK4a5B8iRE6kJknDcsnh416pZc=;
X-ME-Sender: <xms:tVvjameR_5bxMjbvLRCRYU_cngleFesyNtYxk59Zk_oUlnhzVr3Y9w>
    <xme:tVvjah4OxNeceIn2bqlFMWLEh10wqIOp2bMbquHAv3JZoObyK6uI5zZ2wtUmZoDDm
    9pWSaG1EBbHIJ2K3tZfwkYAQXoRxFZmsa-Z9vn15ZtDJ_qRZNhcj2I>
X-ME-Received: <xmr:tVvjaq-nzwdVWnypXv8i3BONQtkCdWnAxasEIxn6hiJ-vFT9yntSmwtg29Y>
X-ME-Proxy-Cause: dmFkZTEyzILTy3ijUhQELdRUt+dULQWXMH3d37b3A/IMbT+rH32qhbXyiYv5MAyrfFVj5W
    hCqZUSC0FonhS7bC0Z9vJlqcbgXK5cFT6hUow9tIeZmDIRtpk28jvxEzlw0iqRZRuVXHI2
    yiU+SqbbfrSAUIZe1Zk1rhyIilsT3cdQCjQZGjSDYvTQnFY1/2Ep5yrkcVFI7Kpv1EuYaF
    MdXJkm7F35XfAMKXrAFrML4219rvWN0j3+/iGdzK2tkT7rCHBfpEtQoaSyh6EK5lwC1zst
    Rg6wgKhxvJdPnQKPzN2Zu4nBKp1kLm+dHkMmj9CEo+MIaGrTiSy63JBd66Uh0gHpPYBzpC
    dKVMCaQ/JfsREN9ztml5nthTteEQgCPxpp/85NKFHUCVFJzYpcPyvCnEw2HKsYq2uUXY4m
    srEKKAI6pIefzGujDbBHLoUwqeRjS+X0fDx/Fvyl/5tQi7rCONZliERQRIlnyvZcfUa3pE
    ezvB676aYzp2AvddYQ7O0+gKiPqHb9GswxcPR3i8QON6DtPkgeMAroxNSZwdhX6SE9tE9a
    pH8/McdZfeZT3CW2IWpPjdhiDarcWX3cwXKxARu/yI29LKPl3nFTKj9mWzpsXO0vUOmJBg
    rAbTn3i18WU4mtza/ib1CH83Y95F3byPZ4W6BeYbOYo0zA825oXli4PrMLKg
X-ME-Proxy: <xmx:tVvjajyV1JREAYbfj9We_kHNxZy__oIxXMOBGtVhk8en1t8qT6qFwA>
    <xmx:tVvjapHPU_wspVl2XD_smnL4Q7COVEOUwdYR1eTIU7IPRVwRivCxLw>
    <xmx:tVvjauMluvSlj3DeieWqjjzq-JBjwFq0UsWDrL-AlCxq3BbZVH3ZSQ>
    <xmx:tVvjaocaaI_ncLkEghvAXxylzAyU4EShXDwh7oxxaNGbxYVtyJLp9w>
    <xmx:tlvjasmxmFIj6TvazUUDo0D1qK0YHdBIfVjZ_hEuUz0WDpeT7hP3AQbW>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 10:44:05 -0400 (EDT)
Date: Thu, 29 Oct 2026 14:44:04 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH v2] mm/sparse: simplify the vmemmap alignment check
Message-ID: <auNbTHXp4o_Dqww4@thinkstation>
References: <20261029134521.62146-1-kaitao.cheng@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029134521.62146-1-kaitao.cheng@linux.dev>

On Thu, Oct 29, 2026 at 09:45:21PM +0800, Kaitao Cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> sparse_init() is called only once during boot, and the vmemmap alignment
> check is outside any loop, so VM_WARN_ON_ONCE() provides no benefit over
> VM_WARN_ON() here.

Okay, that's true. But who cares. __init section will be freed anyway.
I don't see downside in current code.

> Use VM_WARN_ON() and fold compound_info_has_mask() into its condition,
> preserving short-circuit evaluation.

Why? It only got harder to read, no?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
