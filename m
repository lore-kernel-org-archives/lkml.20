Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794758006;
	b=kDupbHH4y0ITsem3J6uSDVqfMZUz4MRn/f5t9mw/hdtLZDl+vleyup7tMXyG+Ky+ikel
	 dLHtqddaMSaf1HS2s2Jn0hyEaYOsMw0rHdNOty46gRifLLUa78GsWWgmfzcM6llri1CoQ
	 ZwVTQj/G1DXf5JvbAEbMpPUznCL2MxZ1dEjUXYtzi34hNyzThl6Nsu/JOf7vxcsubo6wA
	 4M2qQKijlDBk9kAV9l5cenVONBS/2yw5MCn17fwB0pr1BzyEdOUh7Zff8tGjgOlRuzEPE
	 ZbZKnnv3yKX/rtv2e1Re2U/ByiG2n+HjstTD2NdmpOcPXg7WvLUAlkjutXreWiH6SmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B1npfqAT/e9nSAN2JlboNXLFbR8cB/EnEe7k+tEqTAo=;
	b=zTE6IeV1BH9a+pXBPlr1yK6pEdgkrRFtUFJzi12+PbYFmU4fOIDqVFvqUjpk76HH9ulx
	 szNpTN8h6Aahef8o5M7Gohp52kcfSELWuEDkFDkL7mbzcov90ImLbKQIB/5M1+aozcd+k
	 CTCF955P1bBZkIxDMUFGbu5F4kZ61WiJE5559o59fDdqtmkteo0POq+xCo3miw/vC+wFY
	 j3Itm6oSYSy6oCXoNzlO6Ip6hr7pUIfDUYFQXtlpnX+SYbeb0p7/+RUFIXdHVsO1+guH+
	 zAAwdcS4/x97RgIDPB2UnwN5ikQ3lBvq9tM7DCbF84k1kzQkOlznlKpzQT3uZmyAvkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAOPFYHE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA400606A883
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA400606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAOPFYHE
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a9f9473029so2726302b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794758005; cv=none;
        d=google.com; s=arc-20260327;
        b=aFMIlgCVLKmk5q9XGa5cZju1+GIKCn7ua4muyxlb77XtbZDz2LnfvWdsrfEQ/UnGMm
         ZXV38sjqM9RWQ1C93y4LkSbdu4R+4uDcXSgZsXa9dnmL0yDRRhBtqy8xZ6vlzrVr4ggK
         KD6xTgD63qbt8XeDaQ/U9OHnDAZ84wEe2a3L64cAAdylw8PB6DN25duxeFCv5As+v5q4
         11bSldoi2rOlFYhP/GCbrdAD/buck5zhH7+uGi7iTS/S6VQr572k5U/vO+WTvZ9YzOKH
         QH9I6K/WYy7gJwHTNFc55MFcJSC+4SEl40c5yv/mWZU3fRdqxFvCB1JfuJP9ub+gUQBZ
         zMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1npfqAT/e9nSAN2JlboNXLFbR8cB/EnEe7k+tEqTAo=;
        fh=x4M/+p4iOtMvxzOErI94jkOfAY+dE0PzQR6k38u26WM=;
        b=AC0w8RMxOk5uciSrs2Sod21sFJ2E//Pp+MhScyyhthi/Lfu0TtxZhSQk/mnLksTUVk
         mFJGPKmSyrLIt0r9i09ocLfq5cXCqRgRro/2Uu5a/KjmL6h2mCZAPI00U161iE6UNxZL
         UMZQdjxODYMtTKavn+yFyErHoYOO6Dhy9OZ69FBBWRhcj1soCzeN7Ct7UnMt05KPtadV
         Wkd7Pb/hBwYwM0gyNvGabOrExIyzgWL1/VYTB/X35BgW3SjcPuoHF0riY7TgUF5R6RC9
         OeOyjM50pnM6PSt+NfJgxyerMs8u1etNqO8zaSWjTouTVRvjMdT/Npiygioc6zweXbXC
         LFfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758005; x=1795362805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1npfqAT/e9nSAN2JlboNXLFbR8cB/EnEe7k+tEqTAo=;
        b=GAOPFYHEz0WDG93VXLN3WC0RIDi1rPl8Qmid+uxsFM1at9cBD16fS14qJC4r1GFb0+
         oykcbpHyxin6VN9/BxDuwdErQcKh6Ts0dL8T5THKDoXjB4W+3FGO6tqYtXo0GHermXFm
         wMrpuXw49HZEaAyYZ1D59lkx+vfl3F1vNi6GihWQoOh1ISifO6uIWnWS52yltLFAzd0c
         3f/OQSESMp3WTHw5zRnFz8pZrnRJ/XOeZ/Gv0MI/oULUmjV9k/ErxXZbBhWYpHwIdoad
         NR7pCtgePRoVgQzvqPz3KyAEWTBsKcLDWT4MMw10/ey8/MyCgYb+8dfd5UmCIWfSsN05
         t9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758005; x=1795362805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1npfqAT/e9nSAN2JlboNXLFbR8cB/EnEe7k+tEqTAo=;
        b=WlOyimcJM3DYLMVJiuYekdg6PMAtebQamAwskMTDx0LAArsxFgJR0v97EosU4l5LdD
         g1AVkhNgpm5MKoMlCn/FIe5yMT9mTgkNIC5YQVaWQRqPKpYdo6pbHcldYGzzN1h73xgF
         tRuP9D5TP/qarozM+W4827Ctge2HA2/TgYZBoixc4QU+PjlkE9jlCH/7axQ0dFdIs0HV
         KOeR+RND58PaBSl78Gu1NDOsaHe4cH1uq4IcBUXjbgtkp4hC/SoEaviFe2zVnGpIUeNH
         2e+GxlSOEi9DiaOqOwJEmHn4H0em/n3vofobcrd6Mxxt5NlCZqYW76KCrFHlM6n7P2T8
         2HjA==
X-Forwarded-Encrypted: i=1; AL+hErHPWZLcgmA0pTqXzzerdjt8LtYjsCRcaImPH1buJqF0GHEf4wmv7MPl5ZSFi9mn2K457p+oXIGk7LcbJ2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QYBuHiFpuy0rAH7SzHPFYPixTBu71xhfbPU5zyzQokJ9EJ4Qf
	0liDxPkaOcDirsn08jm7rUsMTq8i0syCM2TBEyJtwn9mA0JNwvkW8LGuCDE9OdSiEGhaF3YLP6T
	qtG2TZDGZu9pRlq5j6BZJf/UZn9GAOK8=
X-Gm-Gg: AYBFou0U/0hUWzam6walLVd4Aq+06eC1+8CXHtkTRmJd/I1nNfS2GDngQsOusmMwlh6
	5g8aegt+5ANlumXhOZNkt425+HuQCsfoNaGsuVR/P8DK3NNaXywyVej68T+NQywzlHA/XISQKdn
	ylS6m8LPqWtzSbcssSZAVrUfahoSxdJ4j1Izs+Slgd0Fm74w5M2bwDLoqpwq74nE2X3Ig6gqMCt
	1Q2Ly8gQAUhS8AjibjkLhdNcRjlPUywxw/l2c5/4OVEGg8aBwpkAu0yMiC4ZPzjIIxQb/+C8z/I
	cwhhGaj25ozJNLj/w4eeAG9aXHj3jtu98a1To8oJDDUPlzIoyyh+4wqbBYWf67XmN+8ALLy19zA
	YvIpJkPDOVa6yFukQxerc0AIoqeGPF31brTXRyAHpZZgJjq51+Se64NHMLpHLATF4/vjgyA==
X-Received: by 2002:a05:6a00:bc8c:b0:89f:ed19:f093 with SMTP id
 d2e1a72fcca58-8beb69751d7mr7240080b3a.34.1794758005062; Sun, 15 Nov 2026
 07:53:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114200803.23129-1-baohua@kernel.org> <20261114200803.23129-14-baohua@kernel.org>
In-Reply-To: <20261114200803.23129-14-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 15 Nov 2026 23:52:44 +0800
X-Gm-Features: AclHuK8Ub0sHjLEQvw3iGeIyjjo2EqcMqfHwipzzThFvw96dHCFYFu_0EpLJ-sU
Message-ID: <CAMgjq7Az+_q6=fBRH61_O1R+dcDci4k1g+wE17Q+Nv-36eFDSw@mail.gmail.com>
Subject: Re: [PATCH v9 13/16] mm/mglru: Reduce LRU lock contention by
 shrinking folio batches in inc_min_seq
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

On Sun, Nov 15, 2026 at 4:09=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> Reduce the number of folios moved from the oldest generation to the
> second-oldest generation in each batch. This shortens the time the
> lruvec lock is held, allowing concurrent LRU operations to make
> progress and significantly reducing LRU lock contention.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index c9e22a5cbb51..6cb905162cba 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3914,7 +3914,7 @@ static inline void flush_lru_batch(struct list_head=
 *head, struct list_head **ba
>  static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  {
>         int zone;
> -       int remaining =3D MAX_LRU_BATCH;
> +       int remaining =3D MIN_LRU_BATCH;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>         int hist =3D lru_hist_from_seq(lrugen->min_seq[type]);
>         int new_gen, old_gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
> --
> 2.39.3 (Apple Git-146)

Reviewed-by: Kairui Song <kasong@tencent.com>
