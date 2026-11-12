Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442599;
	b=E2xVO2xLR1hsCfsrgzV+lrOaGZvyeu4Kq/mds38aOr9xlhhoJYDjmpzRnqXmit75hq4i
	 txY0AXsKr+6gIAgCVgqjWIfrCCUjrdffZZZ9plbn4nPJzP3Pd/glqzP6+A/5KVbuI4jyF
	 gPBn131dqAGDqwgVxzuce4gJnzwGB5gW1yIGjkFU8nrKJ7EK6CTKwCbf1m3D+5oeIOgrZ
	 gbzI782OMV9BsvhiP9ba1km76eDPt+61bz6DPqHU6MqyE3eOiCK2tma2ZbE0BsL90zg8x
	 GYseFiIz4RJzmOdQKcmN/zaHHP0O3zRPR7v7eFLvdl6pMTHkIo5lViWu/dPFqZKt5sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SFwg5Wnnu6Xe8mLPG0VsSJGBINJAyrjERL8cq1SoEgo=;
	b=Qu6vk5dL/L4ycBeWlRcfrlwZD+TAFRWL/gi3LStf9D0W2iJsdTt+zSFTa7dyctPc41w5
	 nHGrccXjp8UzGvsv18tzM0tCOkyBtG+l5qxLEMrFqhC1p+60v3iVFVihbT4uOAJySc/Pv
	 1RSEyhl7ssdI6sQBP6bMmFclMoooQ0iIFV7cpMOrfi8Wcp3R6Hdb+o0Kxaa3pvOslbhHm
	 1UF5O1qCCYrWc/meK1g92a4PCk3iPHe8dChqdoT0lzSuhMqMiwAW9WQlNhfRI+09r0ose
	 oQE6y4TKcHmDR52pYY0IsgiOwvlvAV8zGk1xgS6FTDvHMQO1HrZJzJNdg/ril8Po85Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XrgoidEh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602AC606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XrgoidEh
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-54492d8a988so53671cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442598; cv=none;
        d=google.com; s=arc-20260327;
        b=BB646qsaOIcw/xDyDiR8GPup4B8U/TrSABCHUqyzup4RpZqgUbq215KJSWG1xwsguW
         4BeBDu00GNjZKyp39ZSsAzKoLIC1EpYUj+7FlSUQaRs8/O1o0MAiemTsay/YlFBM8hQ0
         8YaS8Ssi5KnLqR8lhWSpUNcis5MyyRD9L1LfpiCYwggMbzP+9GAFOKKApY0sHcH/6rYB
         DFK9pbKQ8YAEE9hc3I4bsjxkyH9L+yh8wmBB7eSVd8b+zUUM4ZCYrqC6lLNWTfgiph0H
         kI5VtWS/z8XFvqy+3eTOZOxg+RYbjPtdZheLRqa74BoHQG+rg8l1Y/hDRuhqLyllNwzE
         qYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SFwg5Wnnu6Xe8mLPG0VsSJGBINJAyrjERL8cq1SoEgo=;
        fh=98jMpBOZ+cZbxED+Q7mPRBNKyANnMdXFUG3Ch50uzDw=;
        b=mTU0UltmBfY8Paefck+ewJi6VJFwoGfzqQxAOnO42cBI7qxwscwLLNq30WZQNbomHm
         +PXpNqe1AAp2M7FWxj0e35RPGYvrEZpZ4bY63feDeO6zYybtBogCu4hvKmeA3o0AKXRR
         uz0K+FCYdpsIXJDYFKaXxm7Dyfs6XaXsLZHp7tmgZi+TS+iUebdVIPtPYTIxSI9MJ6eF
         ZtlFY15Ytjhcaw56U0vihlEurAMUKw0sjAPczH2CKkhwaBphU0hZ11vwhjJ+LgJP84Sp
         73j+NS7wsu/vQ8uZd5XQoqH2Q5OBviWQzA10FOVeDIMgIpEqn84W6gGjd3qPJWrvWIx7
         Dn6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442598; x=1795047398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFwg5Wnnu6Xe8mLPG0VsSJGBINJAyrjERL8cq1SoEgo=;
        b=XrgoidEhyE2df5mc6HDsPHfsfnqUt0KrV95kCD3Bi7d+ukH6OSA2oKL3w33viyg3Np
         l36lD51MBr0DzqgcEwbSObNSRICmfTO/A5+3R9r1CuTzrVDwYd2uP8lqoWu6JVjRv9bU
         yOhXYkG0MAFUEYkKQjEGgbbEtb2aVK/5wx8mLd0cUGQEBwEq1mIYzeRTQRy4mcZwfi5X
         CiVxs4/VRy4kSANU5x/O5W/2oQV3GztXA84Q6ajrEy4hbxBpehHAJqZA+9wZiDev/jR+
         yCrSHxdpea075NSRU/VeUbp5xR6GDhKTTQhwjd/b7khZA2TC+GZKogwGt3qFgMfC6dnw
         lFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442598; x=1795047398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFwg5Wnnu6Xe8mLPG0VsSJGBINJAyrjERL8cq1SoEgo=;
        b=byfYGekQDz4E3TNXH6V5B127JMZslsXF24ewg4qLtSxfbgeJGmPdyId7E2/gMg6ThL
         dEZ2UZxyP8mxcbTLhRSc26GMO/RLvykyCMDfexYZcYEPkmj0kelLPH1kbKf6ES4bx6tA
         mb6AWRaQgZB9VQQFy1gZSWGLvSc7XiTxNcKp2HJ287ajqXMJ0dimdijNgtbMPJKkawPu
         PLJRLtnWELPg7X3k+eNPJQY9cTtEPP2rf+Vc82lIi90Ghpj/GmTiZu9EYy3mBdfL1M9B
         Ic9i6y5CUy59hhqawk/fQCd7sUKPYCPFROfr80/YjCMGj4Pghx5G0desidW81Cj1x6pl
         7gaQ==
X-Forwarded-Encrypted: i=1; AL+hErGFGCK//O+3X+o3GR9k84ERHXhkyE9OpiKUf5cWp3IRme86942tzfIgjNOyYTBOD1bu4bmYRMBSA6Fd61s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LZqnPk/Y7U/sewZm78SXnb8iGZGrE4FmOPjQ51oFHoqzTrvUm
	OpZ6CshVfAIQ20yDARXRCNoYB8nFsjTu/rnug+zhAahZc+D6+Vo8oqGH1JBpyELhie52zPRCmYp
	GILR8Cri0ECxpUTMMwJmNAwOsOkhRf23GCyrS/Vqc
X-Gm-Gg: AYBFou2xISrMxuUQlccc9pMp9TgJKu7H/BAVyhbfFQfy/tZYKXyHCJ8mlWPT+orKzp9
	7XO9/UNOQ/JLKmV98T7jsF59Grs0ykSEnkjefUdFk78lAX9dZZ75xt0V23aqVcjFOsD5/6KGHio
	SZ5k5Bvt2j5wGG/lsHiKYb96gUIB4yElteoG/0CF0leZnBzw6vsQrgoZVFk8Tib62lsN5n1RmzM
	snrxJUdGCftgDgaoAoqL+nrK1bngMnLhwWIkKad3l49amBTOlmjn3d1+zpQhHK/APZQcUbxyjv4
	F40B5yOVGxDQd22FvpZDb+f7pKlhCLIUJLv3y/LZcQzZWz/yryCr9TX1SXUyJ3fQE1bGtVv8RGO
	wbiZYV9JxgFv3/W54XlNtnY6L5YmUhLG4bR6wWNbUIkEzf+g9IFXYvwpaYVmckQEbIN1T5Wfgly
	XBsz7lPBHAdCPBoUudTmRIBOvv
X-Received: by 2002:a05:622a:191a:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-5596ded2f3emr7342891cf.3.1794442597663; Wed, 11 Nov 2026
 16:16:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-5-hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-5-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 00:16:26 +0000
X-Gm-Features: AclHuK9X_nBP4XE80Cus7A2PIJ2z-t5IzbqPy7J7kM6JfZcsfXvHNVWcxL1W9Bw
Message-ID: <CAJuCfpGMtHZSUhUra9rp5xGvD+L6reopCMb3qXgRSctQ7wnYFg@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] mm/vmalloc: BUG_ON() on an unaligned range in vmap_pages_range_noflush_walk()
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:24=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> The pte loop of vmap_pages_pte_range() maps whole pages and stops
> only when addr lands exactly on end.  An unaligned end lets addr
> jump over it and the loop keeps mapping into whatever follows the
> range.  An unaligned start maps the page below the range with its
> first pte.  That corruption is impossible to debug afterwards, so
> bug out on addr and end at the entry of
> vmap_pages_range_noflush_walk().
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 27f2674a5556..86fbb1d2b27a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -698,6 +698,8 @@ static int vmap_pages_range_noflush_walk(unsigned lon=
g addr, unsigned long end,
>         pgtbl_mod_mask mask =3D 0;
>
>         BUG_ON(addr >=3D end);
> +       BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));

Instead of BUG_ON() here can we error out early in this function's
callers (with or without a warning)? This is a static function with
only 2 callers. vmap_pages_range_batched() uses it in a loop but I
believe if we check the original address alignment then consequent
calls are guaranteed to have aligned addresses.

> +
>         pgd =3D pgd_offset_k(addr);
>         do {
>                 next =3D pgd_addr_end(addr, end);
> --
> 2.25.1
>
