Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314557;
	b=3o/H0YVOoAGv4/RvB054aXJgDiK0pNh5vkVyI3hCDAtKy6JE6wqdLpx78f2I77XC+kUN
	 +2khDkgHYuooS/XHWsFguMDCI4f1sg8k1ifqPRG9nB99VBzBUSSPjq3Gy/ribs4s8ewZj
	 jKzcmdpDOOPITtrC4tmm7FjmNyfRGRk94tyMpLCD+ztoiksDrQcYvwmAlV1b+66B9TZ1A
	 qutz6uv6WV/dz3Xmi8RyEmNXEru3CttjsmXzoBMAepdkG7SedDxa3Z6hAMXYiaAMB9yPm
	 4Q81oz2HrfRo2wWZ+ttKtShAdREWz7o6n5HG1EiKA4ygBCMnHXyiEcXeuxtqgUZtBfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
	b=mQwQy1m++S8u8r17RS9lLKYIFeulw5HvW9kSFCY5HgVG9SqX0/9ntsAid50MY1F4CYwA
	 ny4ftZxnWcE4pETR8XOy2mOPH9Gd8CtDOglda/gcF5bbKBTKGaq2xshKY31NNfOUfhjJl
	 9SF6MirFIWwHM4a0jN0VI+ZVRbeXwLe2iPd2ZK6Zj3JYTjalgtRJ6td6nTTZJVuCC2qB8
	 kE5R2hDbOfpw3mBQosdUy5r6q/QQ+apfpEToKRCKBLHXVH6qT2n4EX6F7aDn5h2mbG54q
	 ceueb3z7qAW2+YhItpapASjlXPozuPfFqs2NLkg+COwvutQ9FzT+7tQBmfL1MR45SyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8HjuQ88;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6053860A260C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6053860A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8HjuQ88
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e63ee7b4cso180717485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314555; cv=none;
        d=google.com; s=arc-20260327;
        b=aLAYjAnuK9HEYYWhZgbhF/wSfcTQu8VG/SpcVpiutV5TNaTqX+ZSZ+xZSxCsCqWDS8
         y2ofL7SBSLtqvwouNDWqywYU4aKqXlOj9vvXNW7qShA09IfOdvfA6ltS7ptFcsHZXM/r
         kkeNc34gw/P8XlJgdCwXz4TvjX+J0SqnreU/Z/esxCdW+qSiNv5e4V3Fn6thWxqh3YRI
         udFUHJHtR6Q2QvPKl8QVdCX3naxC8mHl+Z4hWA94UdnIn2PWqxVNLxp/MxaELbZmtl7w
         KHNpaFOGXjtkeuW6qP1AdtdfwKuHuk1Yr7JK0QA8a4wGDoDlW5x6rOcd7d8eKXnI/JYd
         UxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
        fh=29PxQuDOPeTDHYye3IzgTsqsAv2Kq6XMjlEpfgnboxc=;
        b=RGPGgRZbTPj5zWP9akQxijCHB3/A1z5RbFlQ4owBr5d0m4+PZVeOM5do4CJnI96Qb5
         BkFRz+AR0h3JrAKlps33b9Yd1+FGIa/CiRvnqI6g0B57K3/B7MXrVf/jsL7ohFZqc2Q4
         Ft4PfDADeCwDz7XpdNhGjlYiJTXrfB1nXnmZqE0YXmhmQt5VWjNBLqYssLDj/1ZfMNkJ
         ai+4tq7htvhnlrVsZwyf+K5LtCLSi2Dvu33YYsTcL1qczNh0XPqKESwY5AwbLHE7xUmS
         d4tXsyrtOTiJUiBaTQEVFG+S2nBk0ZgYpJ73YX65ANf4YFBCP9PEcCICZz5sM9FUgVzV
         p6ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314555; x=1794919355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
        b=o8HjuQ88fkTW5d1ZW/m8UUP7qUQpPD8kCVKzDtrOtYt3cOxdEj1WVqdHEHMv5/FY+0
         DQZbxgAWWXsAWPjlCqC/S73i5mccSSmnTpemGu80vpL9URa8Yc/U3g8r0rfWpG8dzxlf
         FnKNqE1XK2Ni8s7Taui8GPF6fvxIwIWzA67a5fBPaLlv+Fv+39UMgWlMXBY7lJA+dCCb
         or+YMvYajbh7ypqWpXF04JApiwgmR7iBnsmTnFu79RRd5RtfY6sx8ZWmVo+/Z/78vnKn
         LB5Y2DLceN+KGTHLkJi7gssFQ9MZcUWdJRyEQcIRDdl1BnTSuTjcXT7Npcrqn8AVQha4
         LfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314555; x=1794919355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
        b=uXMMhCUQ4Vhnlyq9/17SbzfDiDhoBIt+vnc67pLryQ03fAFz4Em3/piyedRD6hMy9J
         dzaiE2WcFlwx3hmkz38DnjQ5nJjBr/RM7eNSyXj+t3Opt/6wEnoCjnnM0J92P0jd/Odo
         3ItoNN3v+Jp4e8KubaB5X9bzydYHVCa/IHfOqJd6DdyJMCuBOJh+YT3IGq84NUp5/bAW
         6IfEgqKrDZfo10x/XCsj7XDCaVv/EEs2bEXAf/bsn0AFXLL6Jo77E6lCIr2yi6YNVuyI
         8QNIFWSMRDMyP2iTny9jGU2hOKCf07TDBDw8oJShgL0z/YZxf0XK2pZpdiRFnEeFw1JT
         BLog==
X-Forwarded-Encrypted: i=1; AL+hErGm8wqUca1y2iJg7I3rCV5DOl7sOcgGMaw65mXkcXeeQk72bHjvfFFIaa/ApcxdEWYpy4wbZAN1GCc+Ajo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ACJMwBVtSf+29lxSrl4h2z8xujuIvdOB8Q5JFRxj/RsBOePzh
	1Az5Dlz43IjKP3+IB0ia1BgtdK3mZn9epBgkk31mPmq8oGYdC/qcddY6zz1N2wPats6d6d2v0Ev
	qMUg21tJh8EYJFEBKOf2jYucrSEC+T6k=
X-Gm-Gg: AYBFou1b0ya93zofrEAyndSI/IO9j4tyhWosUTrwV1na2qI01XWZPvXgPeViAlyNRi6
	9nazspW7yOG3OXmlOYitOdVeRZwatKbTB/5Ebaax0vSfMChkYqftURCaNwt3jWZoQ4xLwUXMLFy
	x9202AYdoxlwQxn9/xOYFDAgOxkv697UOnPjq/hBaLzEqlyEmsHi/nnteNNzUXZG2+ZVLxQHSaI
	+6EFVqfZno+FxnVm4v40xGEx7LCNmZm4qE3E6q+iC2KvUP6U6NDWoTkJYcSfW4ZYhLpGnZyKYHA
	Wh6Pu2c31gkzvNpDI5kQYhGykvovDfhiqcYDgM1so+6s9MDium7ph3AlBlB/IAl1gqNbhRygSr4
	LJZOThSJoBwz6yU/S/DaThPomso/QZ8OKEPGPrOuvEGP7rqZUA1wLmlDlqDVXK+1cNQqVMgPoV4
	ED49TKccaxiKQmDPMHjR96
X-Received: by 2002:a05:620a:461f:b0:93e:c12c:f137 with SMTP id
 af79cd13be357-9479f368c54mr360445785a.82.1794314555301; Tue, 10 Nov 2026
 04:42:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261110094848eucas1p2577d7a3c60643a040e599dfa1bf97f08@eucas1p2.samsung.com>
 <20261110094830.2081847-1-m.szyprowski@samsung.com> <20261110094830.2081847-3-m.szyprowski@samsung.com>
In-Reply-To: <20261110094830.2081847-3-m.szyprowski@samsung.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 10 Nov 2026 04:42:23 -0800
X-Gm-Features: AclHuK-FeNynpA1_RJvncVNma0nOMx7dW4op-Ljg-ln5a78S2ORxIIsRcrITnr8
Message-ID: <CAMo8BfKENmH3rZU5jyCdVOBzRAQ+KBJmVyjEWG97XYxBNaZ=qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] xtensa: handle highmem pages in arch_dma_prep_coherent()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:48=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> arch_dma_prep_coherent() performs the cache maintenance on the address
> returned by page_address(). xtensa with CONFIG_HIGHMEM uses
> HASHED_PAGE_VIRTUAL, so page_address() returns NULL for a highmem page
> that is not kmapped, and the cache operation then works on the virtual
> range starting at 0 instead of the buffer, leaving any dirty cache lines
> of the buffer in place.
>
> Highmem pages do reach this function: dma_alloc_contiguous() can return
> a highmem CMA page, which dma_direct_alloc() handles by forcing the remap
> path and calling arch_dma_prep_coherent() on that page before creating
> the uncached mapping.
>
> Fix this by reusing do_cache_op(), which the arch_sync_dma_for_*() hooks
> already use and which maps highmem pages one page at a time with
> kmap_atomic(). For lowmem pages it does a single cache operation over
> the whole range, so the behaviour is unchanged there. A small wrapper
> is needed because __flush_invalidate_dcache_range() is a macro on cores
> with a write-through data cache.
>
> Fixes: 0f665b9e2a6d ("xtensa: use the generic uncached segment support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/xtensa/kernel/pci-dma.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
