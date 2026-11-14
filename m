Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794679073;
	b=CYlcXJQ9cCP2E8/t00aXx4shBGAm1FbV5ICm53cfCf4FdR1/Bn2jPGSRduuAYHq1eXKo
	 XR2t2+jhcFqmtq+1ZBQyFpzvMqu5iCh4dAUy86JM5WlXMNVZThNsE0TIXaEFSDRxQrODm
	 ytl0UGlqYDCJWY6CpFI8dP0MM1rPHKkoNCfuahh9r9Hz0AsMh3xpZJCn0166yh22BKKa9
	 2DohKWK89EizOlk+qAovYhX+NwIX3AzFJPeS6AgAfEJTtuTuFKMeWNCbkRiHSGUL31f8C
	 RhRr3jcOyjGbeSm6DTlv4I6avfZQzQVdh+wTOo6AEeQqS81YmD2PhyEFF0TMG6byLIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bylSQ/tfgEhydnCX+X6ude5kn1WgMfGriStlC3xv4iw=;
	b=V9MsaFmpIg8Qap5nfYF9Hd3I4Q0/Pv4CtagevRJHkaOJPzTu5/YQtPe7kAcg8gBdvvxi
	 Md0Co0MoDurUeDeKd355rsYbrSNUjS1s9GU7/eY9vfW+7L3Y43b0+NA+TTMFEfFNomuWF
	 RjiqL5gD6XrF2Qa5NmhC3nbHu26J/2+SLngFTTk0K3vOnbBw649j1kPQkAwQX4Kl8bV6R
	 MWqY5FuOM9M4lrDphiqST5Prop1EcoglX+NK5oPrHmSqMHm38RfksyAWplGwCziZ8Ha+H
	 8C45KfvfVjJL4TJPky/G/eC1Mpy6Jd8zHWDmEGr8upk5RmSeUDp4oObn2HiMh15oA2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNXyHTQu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8E7606A884
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF8E7606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNXyHTQu
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c468bd799ecso334610066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794679071; cv=none;
        d=google.com; s=arc-20260327;
        b=MYxcbF99fdSA8zkFc2RAw8zKwv4Cbj6JNT8Kj4FygOXZU2GgAQkhOwA5oAFfUI0+ed
         aSjJzyzn/Ev9ASUDNj6qZGItpV20PsBjv4IyOScVcsQqJd+qVXp0kk3eU3pC70PktGLS
         i8ftRAUaq7zIqbXHkRFuo9DbeAEg8fZnJ6vc+ehjLFKe7E4wyC52rwUbosJjkH22SG+X
         3/mMv6tvGmIY/xl/7GvrRMrYcJctng7G3+5Mz/WmmfcLLr+rZezh/8qyThoiS8E2o/eD
         rSOp3CuDKGVl7u8v9SyduNRNCEuyqw5TZnw658i7N8g7VUk+NEMv5aJVKOVOl72yGNci
         hp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bylSQ/tfgEhydnCX+X6ude5kn1WgMfGriStlC3xv4iw=;
        fh=0uCBO8OaMrZ9VvOgJzgNZwidAXrntiaEBCkud7AB5n4=;
        b=iRCLtU/hv6Bw8KVJv0Xu9YKTuOmhHmQOxpKWgAxLWBMdn3XrcCk1xX/FTYYm1olh+w
         vQzVAc4UfMhxJ9rRjVYqma1zh75KOc7XIhpJtFrZKogO/JZdEeXKBGELDXl7qLPyxiqi
         qYWm2jI/FGXDUldXglxarZgPDGWPJsdEeDUTUodK6UHC2017duo3U9OPb5S6Wv9dojor
         5kCjb5EmpUZLAV2H1vT1FSksZB6lTw2/atJ8tTFl53bGHzUKzf5NFFI68eQAa6Wb/yQG
         Ca1bCbkP22ivcdp7/gTyWYJW+P30e5E8duAZMIeeKtR9i7obqq5dhoZlUrEQyRbMaXrA
         96dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679071; x=1795283871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bylSQ/tfgEhydnCX+X6ude5kn1WgMfGriStlC3xv4iw=;
        b=aNXyHTQu0XVIPDtw2+6infeuTnYgsNRkhhJk+4G5vLn8JDnGxv0j1NnEKTcUuhgWdP
         z1QAyIAuUo5ANxptdASsos8FTW5PA2ZpwprXhGv7R/cNJ3xvoOJBQijq6TFCu89JFias
         wDdRaQNHvQnKJWCgBEwujSH5C1SJxpSVCT5295VRIaE2PTk795xw+5ZP2ALW1KSTHCwN
         e7y1q/RxAE/gDg0Xs/ELBHL6/O8ZMsvwbLFNPqeAgCKMcpzTkNpHFBsOOB80G3tVyjbI
         hvD1m8Hs5l3dU0ufNxVoB9SCFbLKprhh9aCzDjKnvP1r4v8ogUoOTcHso8Pgq8MXj+P2
         TEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679071; x=1795283871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bylSQ/tfgEhydnCX+X6ude5kn1WgMfGriStlC3xv4iw=;
        b=kqDVAQXIeTGSPePu5mftGfBY2+Gcb9EYT58SOcNsmJaZSN5tWh8O/j1Famk0wwPO73
         BHnAVPWWm2oSV4IQevEKzvcwcm/hCvI0DmbbxtQQ3H+fAWIet4fH8v3QqGB9uzoWTTrW
         o0NiNttfv5dY/rUF7mBD6D8a5MXmmYO9AkdRga0beSw9hm3RJWjhNlWexueubPu/L4AJ
         RLFonLz3z0Ig0OrV2HxoTrdNIkZvJio7lFQvSeRm8yeUIdbu/XTY9yHcyiTadd/9YPWr
         FsZdJJuJBbguKvCTz5KC03ggGzcYQon3GD8A85qNqHJvMjJuoE6igJ4KPSIhvHNv19Av
         ZDeA==
X-Forwarded-Encrypted: i=1; AL+hErHoyOA947rgalCo2PbLi4JWaq7ApOIbD6segNPd7Bj13wPDXdR1EVvCOOjUGDWLyfeL00tSQ9MGLXse6yY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dmfG8w6wigD89IQwJ/Vxyri1NQO20OC7l5Syt/5mn/uopymjv
	EO5+BofWSCwfU1JGZiVJsdVH9J7u2efDOPV7NhFGeh6+XxznBiAdYqs39/LuwKm4mwnn2wCuf8y
	Egj11LZpveOUdk/7JcbtMB6VOSLbUlSE=
X-Gm-Gg: AYBFou1p/Hf7tpUZximYj0O7u6IM65BANUCx6nW/gmGiDmG+jQWLhMltvIqv8VhRXLo
	0TLoHu7LdHJTgr9MlbWYrwsHHxWoQi7eSn0rzEJ6iWyXfUQxbs5g6+fCtfISsffLIUEyYbur2g5
	24McqVfk7/d8CJfmu06TJ09AgN62IKNbbhryxDs8KHCOFVju2k79kev7erLuos1JLtmp0gIeJC9
	v6gwvohWZoCceJWvBcrqcKkt/He75zECVWXqcC9C9Eed/Vs5oBZA0KLQJOHKefUoVeu8lBKu69h
	hVuCJqlHFI3dgpZbk4zZbKap8ZlsvoK442+pU6sI8mz5KiVfq0L79pSL8BMKjBsxhJQvqw5p2M+
	z/O4Wi7snpg2ihS5jXSxvKoN2kAE6agbx+4SoEPcYnA2DQnNe8HNSEX2nDUdSWW84ZDSzKEGKvI
	V01b9zbuT/gYfcEEDT
X-Received: by 2002:a17:907:d0a:b0:c2d:d408:5d9c with SMTP id
 a640c23a62f3a-c509684ba8emr445498366b.48.1794679070813; Sat, 14 Nov 2026
 09:57:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113185541.70203-1-baohua@kernel.org> <20261113185541.70203-11-baohua@kernel.org>
In-Reply-To: <20261113185541.70203-11-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 15 Nov 2026 01:57:12 +0800
X-Gm-Features: AclHuK9E1krSsTGkkXWgcbJbCojCN75Kmg6w82e28JfpuFnCTTb1-n0fzU9ZEEM
Message-ID: <CAMgjq7C1A2axrGiQzo2_9d6N9MQNP6Lg+ZqcHsac+qGvt8OL4A@mail.gmail.com>
Subject: Re: [PATCH v8 10/16] mm/mglru: Run aging when pages are rare outside
 the youngest gen
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kunwu.chan@gmail.com, liam@infradead.org, 
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, shakeel.butt@linux.dev, 
	surenb@google.com, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com, zhuhui@kylinos.cn, 
	sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:56=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> From: Gaofei Lyu <lyugaofei@xiaomi.com>
>
> Run aging when the total number of pages outside the youngest

Huge thanks for this!

I really like the imbalance detection idea, as skewed distributions
are very common in real workloads, and this significantly improves
accuracy.

A few trivial nits though:

>
> +static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_contro=
l *sc,
> +               int swappiness)
> +{
> +       unsigned long youngest[ANON_AND_FILE] =3D {0}, old[ANON_AND_FILE]=
 =3D {0};
> +       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +       DEFINE_MAX_SEQ(lruvec);
> +       DEFINE_MIN_SEQ(lruvec);
> +       int type;
> +
> +       if (sc->priority > DEF_PRIORITY / 2)
> +               return false;

We have been using "DEF_PRIORITY / 2" so many times in this series
maybe we can introduce a macro like "AGING_PRIORITY" for this later?
And is this condition too hard to trigger?

> +
> +       for_each_evictable_type(type, swappiness) {
> +               unsigned long seq;
> +
> +               youngest[type] =3D lruvec_gen_size(lrugen, type, max_seq)=
;
> +               for (seq =3D min_seq[type]; seq < max_seq; seq++)
> +                       old[type] +=3D lruvec_gen_size(lrugen, type, seq)=
;
> +       }
> +
> +       /* the vast majority of pages sit in the youngest gen */
> +       if (youngest[LRU_GEN_ANON] + youngest[LRU_GEN_FILE] >
> +           (old[LRU_GEN_ANON] + old[LRU_GEN_FILE]) * MAX_NR_GENS)
> +               return true;

We may increase MAX_NR_GENS aggressively in the future (e.g. 64 is
what I have in mind), will MIN_NR_GENS work here? Like what we had
before 798c0330c2ca.

Also counting only the youngest will cause it to drop to 0 very
frequently, as each aging starts with an empty youngest generation.
Perhaps we should look at the yougest MIN_NR_GENS gens (still just
like what we had in 798c0330c2ca).

> +
> +       /* Swappiness extremes: the corresponding type matters */
> +       if (swappiness =3D=3D MIN_SWAPPINESS + 1)
> +               return youngest[LRU_GEN_FILE] > old[LRU_GEN_FILE] * MAX_N=
R_GENS;
> +
> +       if (swappiness =3D=3D MAX_SWAPPINESS)
> +               return youngest[LRU_GEN_ANON] > old[LRU_GEN_ANON] * MAX_N=
R_GENS;

Maybe we can do a "round up / down" for swappiness so the two explicit
check can be unified, by reading the right type in the for loop above
directly?

Like doing this before the for_each_evictable_type:

    /* Round up or down corner swappiness, to balance the heavy biased
type better */
    if (swappiness =3D=3D MIN_SWAPPINESS + 1)
        swappiness =3D MIN_SWAPPINESS;
    else if (swappiness =3D=3D MAX_SWAPPINESS)
        swappiness =3D MAX_SWAPPINESS + 1;

> +
> +       return false;
> +}

And BTW I tested this with FG on top of this using zipf and the result
is even better than before:

IOPS (zipf 1.1, 40G workingset, 16G memcg, mmap access, 3 test runs
for each setup):
mainline: 2,215,641 IOPS
mainline with FG: 2,705,460 IOPS
after this series: 2,182,625 IOPS
after this series with FG: 2,772,968 IOPS

One thing I observed before is that when testing FG, if the generation
number is low, the accuracy drops by a lot since we are trying to
distribute the folios among gens by the frequenecy, so we have a
compressed frequency space. This patch addresses that well so the
performance gain should be larger now.
