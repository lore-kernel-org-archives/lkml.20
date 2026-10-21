Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792620030;
	b=xakpps1bfURes2lzbgu5C9FioNLdYuPI8U+pKVuxfTkjOyfimkJUcwR1Rr5txFhlTAg5
	 yT5qbqFkkJwMpAE1IKU4+a0PrPz16qBpduFvxFTofkRAtNejE5kW6v6feT5TcJi6AQ9vD
	 dEzecTAbsjGLClaXkNbfF1i2wnDdkEpKrycZd7aYve1lubHJPcQ/SvYaQHUWAJ2xauTb2
	 PUbI24bJUVTw8qwh8OsxOQntv7Zbd6u1Z0tMDRjHWX8TsdZc6PU8p9U5vyRo6d8riSdDN
	 8w+ij0BDHNcEexYZozTx4nh9QWXMKHkkbjrJAcxyGCJcLxgDWPYIR4TNE6aMHMEBLcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=;
	b=5ot7N5wJvsXYXpBtqsb3KHlsPo/OeMOCNHUq2MK3Zq1sBlpa30uUT3riwOGD3icXKcP7
	 1m/VcYZVDozCScD8sYwDyJEO5DCx9pt9MTTHSlwCT6X0O92SH3l4Tk+MTH1hO1WwgxXyg
	 dE3Y0VuFqXVppZCsiqkCZqWuPop+ciwfwbaZfcvlCL2xpNamCvvyssp4j/DfH4GZCW3h6
	 poHNaCtPlr6cY+3MBB33z82IwQNLa+tiH5VsweqmB8fkbslxOfx0uu0gxePi0gFoWUY1T
	 FnQpPAI7pdgKAaxxS9wAwhd0gKOSskTIJv+S63aVe4OPG2SbsDCmsBFh66Q70vdCFCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Uw85BMay;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746E5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746E5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Uw85BMay
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c423b145922so158039766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792620029; cv=none;
        d=google.com; s=arc-20260327;
        b=f0zAytw+24ekmdPPVqZP/EJC2Q1UjIkQuLDHDFuTNqKIl4rwz1eppwXiufuIXNAuSp
         ZPVfY2echFgIzayP8Jx3+yjI56VhGg18ya1AxMgm7ROAV8INWuQ5FzqyHYp+ViO2Zmp+
         xej3+6i0YJXC+yle3j7uJdHJL2Nzp6257hg0jxDtbtmY6RF+48P5dyTNN8AFiCfMlOam
         Eig67eymsHpzW9ElAqclwQvijFfEmLie0RZJnXSjGUhTH11c1azn2lFb7gCJV2KhNt2X
         LqzDguCihWwx6Xj51+eE+P8FZzwfjW6lKjZp4EKupoC49Kt+U6SfjKGnsEm0wHj0RQz/
         jHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=;
        fh=fmL5u+IkM3g5mYkNdbF+8nMhrub+Q613SxOR+9vpbGY=;
        b=Zh2EYpcALH8FXl4mU7jNpf9Pg1Q3K01orT4XokNMAr2uy9Yh9kEAAFtRqTSIiXxHqA
         iEUS5vZg2wKatq7ah7tdIEZ2u+dC7m2frpR+KAcbY/Xns3BFky0vAMcw8KRicXO7LARr
         GdlkbyMuXb9JW87oK5ef7PfAJKJrdZwM7Wp3FpQVndXiJQdad5LiVtVRBUl4JjeRpJU8
         WYiVCUsAyCreJyV/GQe2wtJvDibKzjopbVOtET18d+4FVNyDeP5/Zkl/POEhG+tU5tam
         0ZCdp+cGrj9jqIdaAmZQi4r/iDcjIInFhp5Dvg091X57ZUPrPcQaKswRm8cuWl0T6utv
         uV5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792620029; x=1793224829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=;
        b=Uw85BMaykG6umD/QN6/fu8TYaasDjSSqXD5wJlfZKuurYdFisJw90AZv4ZM0mg3WUT
         hjuxpl/Jyz6EmgEMUM5VZRm24ZVBTmXRl78cvjSs+D6dtbqsa3c0hmfV5UrZIihVWHzb
         yWExxjCIBGANm6MINFq1hb3dhLHMS1V2+Vz7NA26oL8I2Rea0ASGpLQXdm13nuYHMSvd
         //cpifJmUtlNg2H7RskofZ8NBXgBf/ReDUwxgog4a0U2oMeCKUcPzFikSTLXcyYxV+Tm
         B8qHZ9sDQ9U8gut8hsa91qTieOoGokoOMSfeEnIPIUcSunaEPm8HS8kimtGSTs8KwPur
         Havg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792620029; x=1793224829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zovsq29UQ2TeLumV7ABI3SWyvg5qGuaPKJLreulBem8=;
        b=oayrDp1IqHFzqncv907aIu9h8i1IYq32HJGthTMsn4PNOr3bRK50ShCxp9lChO8DvN
         tvWnLNHVe8N5eFPpA2sLnmOt17vZ2seqRzzX139RVyRgByShzR5OEvVugDzfAh21EDH1
         fpyEMzm9iKNI/2mm7u0sl5n3X64O9UnKNadGxFFq9I9tZ0Slh1dvQUFumHY96oz0Fyzy
         wnmh/kKZ5xJqMRCcOsTLHLywSftz50dnoRnNrrhfVFvfC+jm3DfCxQCkdlTO4K4h60Lv
         MLg5FYWftvK+gG6SvpVQMjOJjN4oBsdUslgwmKws8Ni4hl37TAgEyGG1/WR2bSWgjltf
         Y9Qg==
X-Forwarded-Encrypted: i=1; AKwUvByJWS0xsJ+TT2JihR+/kugpSvbVGnUJoJnQQSeVd9NHmjm0qElLf9xKBTYPbJpm6x/TtBc/g6OjpUMxYrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHpapDleEA2uVokU9FOvkgusLIKtHUBifreNs0pfJ3xwS0ilCa
	cpIYV7et80Urvz4rWzntFLPCZQEtyMV7hGMVLHXP1HwV7fRjCV8xSMA2mMzkY/oQNhz2OpemHmN
	Iy2xtUs9xUrhj/kjRj4KUP02k2K1ZThE8CsRCCm5n
X-Gm-Gg: AYBFou1ZDPga0WteYMXPEEqQMHVQEvJ3vEtWOj1OxFvkN6z3i9IvKM61fwr0rsDcxbR
	iFMp7VKweTcgWFIioWu8YRR6+8sO17bj5GAJJ3xFHask5Gy6ldkdYTUdAwzL4m42U2P4Hz49BXs
	zX+HmeaLNcMf3l1O8uP7jqFEVJThm5dHVhLbq/X6++3GHsIf53voFLGPHt6DtBOljAcRZ0Zvmw9
	A7od4fvsFgY921oi9aj20uCfA77HijUzifclTWd4OItZYiZPD5L5TBb1EeHPHqTvX3FPW/hh6hu
	hjsoXSdqQpIDNKATEFgnBqGNOh9oWt+J7QRyW6N6DcTnjrKBfV2IixP2MWIDndEQMAM0IyjsIDt
	rIja5aNnEK22RHGUB/qz71x7qNl/Inn54m+UQie+7szRRuzdraHWiRZqN1voMAs+dBvN9F8rNKq
	TJvHSvEj26LTkPQEqbYn1FA/FPX8YvLlvSlVeevK68PXNwg7r7TTIqOxFn/1O3mkPnaleAQx1b9
	qNSNeDA
X-Received: by 2002:a17:907:7208:b0:c31:7495:e57 with SMTP id
 a640c23a62f3a-c4679a0bcd0mr297358566b.44.1792620028316; Wed, 21 Oct 2026
 15:00:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com> <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
In-Reply-To: <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 21 Oct 2026 14:59:49 -0700
X-Gm-Features: AclHuK8yX8_UlxZwp8Wau4tISOxPTXz9_QA6ij9ZqSUUyry48bT72riHBjGZz-Q
Message-ID: <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com>
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:54=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> Hi James,
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > vmemmap_remap_range() can potentially leave the vmemmap in a partially
> > optimized state. In this case, a TLB flush should be done if the walk
> > caller asked for it, even if the optimization was not fully applied.
> >
> > A follow-up patch will more completely deal with partially-optimized
> > folios.
>
> Why are we dealing with partial optimization cases right from
> the start?
>
> I know that in patch 12, you try cmpxchg 16 times, and if it
> fails, it leads to the partial optimization state. What I want
> to ask is, why do we limit the maximum number of attempts? Is
> it because during testing you found that this kind of failure
> is very common? If we did not limit the number of attempts,
> was it because during testing you found that the scheduling
> latency caused here is very large? Or is this just defensive
> programming? In my view, scenarios with such intense
> concurrent access to these struct page structures should be
> very rare.

This was done defensively, yes. With 16 retries, I never hit this
without fault injection. (Perhaps I should try with no retries...)

> If your testing did not find any problems, my suggestion is
> not to set an upper limit on the number of cmpxchg attempts.
> This should be able to simplify the design of the initial
> version of the code to a certain extent. If we want to
> determine whether an upper limit should be added in the
> future, I think we can add timing monitoring in the arm64
> try_update_vmemmap_pte function and trigger a warning when
> the measured time exceeds a certain threshold. If someone
> reports this kind of warning to the community in the future,
> then I think we can improve it at that time.
>
> What do you think?

From userspace, you could use kpageflags or page_idle to continuously
access a single struct page over and over again. I think that's a
pretty good reason to have a bound. Also, the AF can be set even
without an architectural memory access (so a mispredicted branch can
still set AF, for example); that also makes me want to have a bound.

Catalin also said wanted a bound here. See the bottom of this reply at [1].

So I think we should leave it in. The extra complexity is pretty much
entirely in patch #4[2], and I don't think it's too large of a change.
I hope you agree. :)

[1] https://lore.kernel.org/linux-mm/aoRn3Fn1dhTdsk6d@arm.com/
[2] https://lore.kernel.org/linux-mm/20261003002123.505555-5-jthoughton@goo=
gle.com/
