Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815076;
	b=sSeIha6GwRtRkHQT+ytephG3sMXPwD8C3u7rtwoKu7MWWRX1kmc9p5s8kwx/u6PyTxQw
	 ggZMCwEK65QZ2q9ynDjDIOEJKxYXxJ/M+6zGgzBcNRC6fkYGQWpQko+TcB77tkeNcLYxe
	 rVCeICipc5t25iuNpRIm5CaCCLb5pBjcPaNg0RlGztF07lazFHmzFJhVbXxzfRFL+6u73
	 lou9A11pkUGDvjbkMi5T4M4Aj539XdRYZu+A5e/RV10sJ9EWupZFptFbibfH0brIqq4zv
	 Ak5ZTcXbiTVZ3A0WH6Z+Ma2W88lV7SYEypD00E6dHP+HH/AiRVdPks7iP1TNSzaubjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Al6NZB4gmP1JmqmmdhYkvzPU5+LiqrhgjgjQTKaGngQ=;
	b=1epOf9dkxwEEpCujUuvJ9zPzobfM5//q6TPnSZKLVTWbcz7P0uf7kD1qS4JN+bsYj2mU
	 6pQf8aJH3qiU8pDtdF14MtaLsovDo2mXaFoNozhx9XffhcTzcKjpSW3bfcntEkZ/kPYuJ
	 56VguaA0fPrLJeWVkRoXC29fTxEZ+YlRzOYFFUj0tVB52UZ4k7hncC172W3RgC0I1NfkG
	 EQdvldV7v0ivF+3FaDtHb5a0ZGWq16sQn3fQ6aeBBjXSlxRirn31Eqluss4Sew4VS7/Ca
	 D2gxue8aHuKJfX06Qq+4kfg81XWqJjRxUoztR4XeSo0X8RAtWtmDwtOBILgrrr+HYdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgitmYSe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46B6070B27
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D46B6070B27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgitmYSe
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so10681945e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:57:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815075; cv=none;
        d=google.com; s=arc-20260327;
        b=SH2jFapUnMpS9mX6/BQJejkvuqtIQStLr3elvFCxpHVieEnbIRGnKGaM1huJhcbm2q
         R9bj2elNbh+LgvA3lJZDbSnPgHfN8EX5RVhdmPJgqstRmSD2n6Pcb5/k1OrvMigwUww/
         DK/WY5ySE1l0fMJxluBl2EC2j3+xT51NLm4PuDpxB7WFkjKVOu7mWLRQzhG1uIR2aD0L
         lWBcItwpf6cO6UbjZUTKvBD7/WHsouLWGca8lQX1KP8p+J84GS+4vYQ2yuG5zkEzFOpb
         ekiJTBFl06kCMsc2sTojobPnK80wF+J0g/T1zlw5hRn8YHskF3c9ztWQXxCe9R9nZXRm
         WssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Al6NZB4gmP1JmqmmdhYkvzPU5+LiqrhgjgjQTKaGngQ=;
        fh=sV9o1g6qNSwVht+6tNKI3O8ajQc/f9U1Y+b5KJWC8oA=;
        b=kFG7BnYXTOsAuwdKlfh45bJp2J1tqYfTBhiw4A5g9L5k4XCOSZKIePvL74wo09JiF1
         p+ApyUnGAUzGmlslKhV1J4Mc2Y/eP3LBVgjrJzG3/ERNr2Hm8W7jwsjdKtqsnIAfwYBQ
         w0d5vEFc4Mwdvw58p1H3J2/h+QURfqThQ3dBK9TYh5XAjKXuagwxRu8sguNbl0sKvLY4
         pLCAOAf3vgx8PUfG8XWXX76jpbejoT8XxizoC3YY4Co2uYZwFRZslq9zTHCjx8Ze9oe4
         BgyP/3rDTEcARq69Zxs3t02pgZ31P0gwBdHbCFiBK82Mt0eLVrcYRJzTKgJqjV5Kph2E
         HD0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815075; x=1794419875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Al6NZB4gmP1JmqmmdhYkvzPU5+LiqrhgjgjQTKaGngQ=;
        b=XgitmYSeDFFaBKqEFWUaiJI9+hiDrMhMHhZcLt7Mz3c/Ov+9TxVPUWEDWQcHplJzl/
         ekKi/myCHrIO6H7+NFwjPJo2Fv1cFDw5c/PUgZ4hf8h1RnPiU3p9c2u6FjPvGlwVx6eS
         rVoP+vbxgRUDwkjclRfpv4IrSgheAQZNw9AKtywD9BP7NXmkf7kIjjoRUXRu0L2Avp8o
         urdIAmU4KorR3DkCBviv9ssfEcDBcJS9J+aKKHGs4bakaCmK8PaGTVQGRvoMrzQwQVwK
         v94RhQkyMAvNc3zXrsDu1GhkVFiMAOgZPJwDzmVAuWDmVPF0s89GCE5UOXaO52vmaQuN
         S4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815075; x=1794419875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Al6NZB4gmP1JmqmmdhYkvzPU5+LiqrhgjgjQTKaGngQ=;
        b=ao8t2qfSEn1UdDykoWigNh4Q859IBLx46tfozfslxLQDqargsAY4WshraKPE8obVfC
         hZogygUSUnYfL/k9l10be8CU36ubY9nF/sPEAM5R7Ippg/YJWS/I+KqMBzVFQI6pnMlE
         pZsneJiyEIm5EuHnZAmOGyL0+LFy5LoE3y++QR5A8VVRIIW2zixdMdT4oweFxfsZnLWD
         /26hX1/2RXVnr5kU97jS0Jg4TPpEO/JzpjMfdX0xY1Fv+E4QV2JT/J+6uvdqCVf2UYwX
         Ds6qIs1hPsCJkbWVs1dvi+x47f/pa3z1KdCdnqvGDZa8l87RpmaGB0gIYuN2qY55U3Cw
         7H2A==
X-Forwarded-Encrypted: i=1; AKwUvBzofvcOMd80y0ZwUpqa+0gvT7tqEiNjPNTlRNG3dd/GHaXSzp0aJ1Se/B/aVc4oI26cYdYoS+J9kI4pAls=@vger.kernel.org
X-Gm-Message-State: APuU4Z96659cQGHgiklOFpAnhSyJQdpBPC5j/XiXGGxPydqLO6Uvu46X
	OdsSUVTymDRJ4CbSY13DL+40x8mAvIrLa7/Datte5SQfQ1QJDkETBw7H1WGSyKrt/pYahQb71GD
	b67q10StgLbNRdj1fh/dnYguC1cXF2Mc=
X-Gm-Gg: AYBFou0J92vPyF/lI1NCnCcJ/RYrDOdMKqPIPt1sfTcXemIpM0FTtN8AYtn+gIS/zD1
	5L56enSZXDdLnoxAr8fP7AnB2FK5Esw1uRWT7LXgVUBoJ0RqU+TIfMxXAjD2Pk1nOPCvhWANq46
	wya8OMHrK/DPhvJHsIG8um5140Qo+G3uYTfLCtUXlkZmZJMibXLIusc5D+cPUnFpfeI1RHGNaNw
	NwG/Goi2L3ETpHW7HFtUY4KrduMTMbphu4zjCKl4z/Y1QaSGvKy0BTCgpJvMUDVhM/C2/4GGoKf
	0X6/ugSsY39Nb0ps4gWiOq6B/fcfpTgqEsnAjdeV/r2x95Avf6TneJ+bzrBH4YEjeRx5vfOeaw4
	/AJJoDgkP8Zw+wzuoLoP6s32X7larYl5/I1thTZG2N7oj2frl5AlZGuG+cz66cPBHL93MfjsHtF
	DQQ61wZ13u7UfeuwV5x05Ug5NAhkMqxXBLwjodZsJBPjceAyt6dm+E
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6401 with SMTP id
 5b1f17b1804b1-4acaae665d8mr265138875e9.12.1793815074599; Wed, 04 Nov 2026
 09:57:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1786003779.git.xueyuan.chen@vivo.com> <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com> <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com> <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
In-Reply-To: <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 4 Nov 2026 10:57:43 -0700
X-Gm-Features: AclHuK_Jo2-e0XBl0SeJKjVGW4UNTrMrsSqvnyX3EFS-6wHyvSchpJgGvWFz9n4
Message-ID: <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
To: Chris Wiseman <chriswiseman@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:24=E2=80=AFPM Chris Wiseman <chriswiseman@google.c=
om> wrote:
>
> On (26/11/02 08:47), Sergey Senozhatsky wrote:
> > Adding Chris for visibility
>
> Thanks for looping me in, Sergey.
>
> I tested your CONFIG_ZSMALLOC_SHRINKER=3Dn patch in ARM64 QEMU (7.3.0+, 1=
6
> boots per arm) by fragmenting zram0, triggering a manual compaction pass
> at pressure onset via /sys/block/zram0/compact, driving ~240 MB of
> swap-outs under memory pressure, and running a post-swap manual
> compaction pass.
>
> Your theory holds up: with the shrinker enabled, the kernel compacted
> 2,218 pages (~9 MB) in the middle of the swap-out, only for incoming
> swap-outs to immediately reuse those pages.  With
> CONFIG_ZSMALLOC_SHRINKER=3Dn, mid-swap compaction dropped to 0 and zram
> pool memory was identical both during the swap-out (120.9 MB vs
> 121.0 MB) and after manual compaction (110.9 MB vs 111.2 MB).
>
> I also tested adding the unlocked zs_can_compact() pre-check in
> __zs_compact() on top of CONFIG_ZSMALLOC_SHRINKER=3Dn, which cuts each
> userspace /sys/block/zram0/compact scan from 97 us to 27 us:

Is this precheck basically checking if we can free at least one zspage
of the size class before proceeding? Yeah the number looks good -
let's add that, in parallel!

>
>                                   Shrinker ON   Shrinker OFF   Shrinker O=
FF + pre-check
>   -----------------------------------------------------------------------=
--------------
>   Pages compacted mid-swap              2,218              0             =
             0
>   zram mem_used_total (mid-swap)     121.0 MB       120.9 MB             =
      121.1 MB
>   zram mem_used_total (post-compact) 111.2 MB       110.9 MB             =
      111.1 MB
>   /sys/block/zram0/compact scan time    96 us          97 us             =
         27 us
>
> Representative /sys/block/zram0/mm_stat snapshots:
>
> BASE (CONFIG_ZSMALLOC_SHRINKER=3Dy)
>   pre_onset:         184553472  58747279   82350080  0   82374656  0     =
 0   0   0
>   onset_compact:     184553472  58747279   60456960  0   82374656  0   53=
45   0   0
>   after_swap_out:    334196736 107289761  120946688  0  120946688  0   75=
70  29  29
>   post_compact:      334749696 107472834  110907392  0  120946688  0  100=
16  29  29
>
> PATCHED (CONFIG_ZSMALLOC_SHRINKER=3Dn)
>   pre_onset:         184553472  58747279   82350080  0   82374656  0     =
 0   0   0
>   onset_compact:     184553472  58747279   60456960  0   82374656  0   53=
45   0   0
>   after_swap_out:    334372864 107347183  120922112  0  120922112  0   53=
45  29  29
>   post_compact:      334995456 107550158  111009792  0  120922112  0   77=
67  29  29


Ah ok hmm. Sounds like internal compaction isn't that helpful, i.e
zsmalloc already does a pretty decent job at packing objects that
there aren't a terrible amount of internal fragmentation in the first
place...?

Should we do CONFIG_ZSMALLOC_SHRINKER (default to N or to
CONFIG_ZSWAP) for now, and remove it in a couple of releases if users
in the wild do not complain?
