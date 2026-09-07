Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A13659FB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755343; cv=none; b=V/fCnV/B2invX3Gbyk1fTnakkL62oFcUlxWOcLxah470h0dH5gqgilgUCHaskgpIGQqlZTslETqXfnLyFt2qm0aDUAYq8RR+Uy1PPVhycDHn6kR2LnGTY5YweTm5QoP6V7xjl1grLlaIm3QeLT9A1SZ2jVsfJtXm+du3C5Fxk34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755343; c=relaxed/simple;
	bh=meDyvuYIDlqkRGLh9pqjyzDv/sphKQKLJGuZna/WLQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgNKOQBl6svs2DT2mw35f7S26jW4ZLGURzY42WWOSSoPkoo0aLyFITYYMpK2TlwFs+l6Io3gLm1afTBZrJGL4NjgCk8GBJm4NaqoSFG6QMvh905WMe/UVgiXAfwBG6smiUOrugU31hywAej4naTmI6akXc33sd5TJDikenX9DXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Btqk/mt1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Btqk/mt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF141F00A3A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788755341;
	bh=zBifm/FraP57DTg4/mAb5WjQYonNACDntoRnYGfolsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Btqk/mt102Gfpyoh8C+KbcMJdhNnyG3O8+0w+hbIg+sEM7tF9L/a7ERWMyKPTeBEd
	 ERTHCmjKikWvXM4DO/yjxRzd3ZwB5un/ow9bL0rao0gBNWh+IidKm9qb/omW6sskCS
	 cg3ieSiJ0vG1HxIxpSKIEnvl4EjUQin4CSXuRHVe7nW4Kuenzclmf6a81Jh6TIvIZ2
	 ziI6f/Bst69buTgPTHqR9T7QHrDiHKRlKuM9GgBiWlgOiOrd378P0iYVX/XjazIQaZ
	 Aa0JKuOCoo0o5Oa4JCKrkc8oNGwbzOWI0RAw1eBFqYpTYPay80SwUoYq7oI8x+8T8l
	 ee3TmUSuraxag==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9103228ef53so36132916d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAIP1oCKEKJWrQuyyXaVGLsbmbh+BYY+gRfXUpV3fL9kH4FoMRPYAo8qELDPxBtttX+qQKrWzC1wUpnw0=@vger.kernel.org
X-Gm-Message-State: AFuF++meOVfcJQqk3s+ivCuFI0K0n5z6rt065W50TMKiOqEu52ztfiAr
	BlaS8cEKVu1NKBQycFdQVPvztRtbhPoCKE1GVcBxROD9/itdIPFQJztcC9h9RnpXwi79+Spmc2s
	LS+IOHQTioQinDKpeUaZWDfgE4+hXVfc=
X-Received: by 2002:a05:6214:311a:b0:90e:7fa0:2da0 with SMTP id
 6a1803df08f44-9103f0c2e81mr260933466d6.26.1788755341039; Sun, 06 Sep 2026
 21:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 7 Sep 2026 12:28:49 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xxZWomhtUmdz9f1x5wdeoTSTRfEudzufdBs_ykKM1HBA@mail.gmail.com>
X-Gm-Features: AcwNN1VL4WFRr5mGdNag0Khr2IvvJ2RI26gEndOePTGO-SF3Asc1L8j2bncfTpI
Message-ID: <CAGsJ_4xxZWomhtUmdz9f1x5wdeoTSTRfEudzufdBs_ykKM1HBA@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, 
	ljs@kernel.org, ridong.chen@linux.dev, hebaoquan@kylinos.cn, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 11:25=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted t=
o
> a new generation, LRU_REFS_FLAGS should be cleared so that the reference
> counter can start over.
>
> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
> set the PG_active flag if the rejected folio is planned to be put back to
> the oldest generation. That's fine.

I find the description a bit confusing. Yes, according to
`lru_gen_folio_seq()`, the folio would be put back into the oldest
generation. That's why we set the active bit to prevent this from
happening. So there is no case where the folio is intentionally put
back into the oldest generation.

>
> But for those that are not put back to the oldest generation (which can
> be treated as a promotion), we do not clear LRU_REFS_FLAGS, which can
> violate the promotion mechanism. This means the rejected folio enters the
> new generation with stale, inflated tier bits, which can inflate referenc=
e
> counts and distort eviction statistics for these rejected folios.

Maybe simply say that folios for which lru_gen_folio_seq()
returns something other than min_seq?

>
> Fix this by clearing LRU_REFS_FLAGS for rejected folios, and also do some
> measurement. On my 32-core Arm machine, with the memcg limit set to 3G,
> running 'make -j32' to build the kernel showed a small improvement in sys
> time when using either a zram or NVMe swap device (averaged over 2 runs w=
ith
> no significant variance).
>
> zram swap:
>                 w/o patch       w/ patch
> sys time:       1666.5s         1589.5s
>
> NVMe swap:
>                 w/o patch       w/patch
> sys time:       760s            741.5s
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/vmscan.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 40d3f1b48a74..42c0a09938ab 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5021,10 +5021,11 @@ static int evict_folios(unsigned long nr_to_scan,=
 struct lruvec *lruvec,
>                 }
>
>                 /* don't add rejected folios to the oldest generation */
> -               if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type]) {
> -                       folio_set_lru_refs(folio, 0);
> +               if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type])
>                         folio_set_active(folio);
> -               }
> +
> +               /* See the comments on LRU_REFS_FLAGS */
> +               folio_set_lru_refs(folio, 0);
>         }

The code change makes sense to me if we keep aging and always reclaim
only the oldest generation. However, if we go further in
`scan_folios()`=E2=80=94for example, continuing to scan after we have fewer
than two generations left=E2=80=94we might not be in that case anymore.

So far, the code looks correct to me.

BTW, Baolin, I wonder if you could find some time to test this
change on your arm64 system:
https://lore.kernel.org/linux-mm/20260901220430.79810-1-baohua@kernel.org/

It might have addressed one of your previous, similar concerns here.
On my x86 machine, I find that the change further reduces the
sys time from 3 minutes 40 seconds to 3 minutes 30 seconds.

Meanwhile, I will also run your patch on my x86 machine.

>
>         move_folios_to_lru(&list);
> --
> 2.47.3
>

Thanks
Barry
