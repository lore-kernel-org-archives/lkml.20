Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195947;
	b=0MPRfWiV/u9iwBs5uc/oh05qKRY+yUVFKVOHLJU3EvdzlzqFtwHIo3HXuScqc2H0noft
	 dcz1n6ACqKFlEF//XwgK8lTZUBuzrRmW+r9QeBVx/tOMTFz6FusZ+VCa7IiHZ9vWnwqdu
	 D9faGPBLqv5d1rFhDSgf2QVRxVmy8b72YJLFScMISC8mzTrd0C4c9mbroiBGwDd/w4Zkg
	 MGBtXxGUOHbMT324H8OKS1AICuZWAYaU62gQkMZvD8Fm1zQMcXVzoUAGFCa5/wNgMNDcE
	 3Yhkw+efGTW0T2yvbcmzNFn8aADIWQbFmgjsm9eZU/4+VEx0ixSvdJ63Po7AGHpYpGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MXtekahorzOsjNCbZ4FQcmlw+T18WgGmFphrz4/AcQA=;
	b=4/lzJpf+UvgBX5G5twBvzmDcYN9HRnx5zDzMd9IFlmwIC5dzedmCe2YL3QWsyRZWZwwJ
	 7m5TUYCXO6F1P1CKbz3tlKUsu79qd7TMjAwlf3VV7xhdSKy4uyyhlaI2d9ZixM218PPE/
	 RDWIPJixPOjS6KZo+5OO5GpsEgvjlAUSfWZYupLtOM3RfMI7tKZSs0w0sqmFqbUhTBxlW
	 QiVP8abEO8xp0ptucOxT2CLJPiauMQ1G/57n8t9b0hB3+xjuDpvkeC2Ua4bO2TH1BCrHj
	 ys467SDtLr4qBAmWpb1AOKoqnYU0GPJg42xVQai7XXaIJMQrwbguxjpK/eq/E0XY7zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2x3F5bm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF2D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2x3F5bm
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1791687a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793195945; cv=none;
        d=google.com; s=arc-20260327;
        b=mjnYJKISBjGeh/MW8K/npMWRfumyHfoycW9S5EUrpxrR3Mg6SSkz63fgQYyKHnNcMU
         grRfOUpDxZP0ALSFet7wdFq6/m8yFWAynQU806Ol8HIP+n36BHg7DHYnfuBtWWReYEEr
         GrW6tJQYEk2aSxaCFjq0vN4nNF6paZaE9hyurj2lpsN1AHfO3k1L61P4S/VTmuwWR5eI
         61SEMKmxjUSHR1KS2WihxjTtVjg21QkmF+kJoo+xncrjZNo1UjbrHzZWdgI1j51PV4Dl
         JJA5TmBwjf1MVa+ODWQO9JnjeFiFUb35HFPV4hzoZT2MyJRvstYVxcNCaVhKNnGmVkpd
         Musw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MXtekahorzOsjNCbZ4FQcmlw+T18WgGmFphrz4/AcQA=;
        fh=aabNxJ10tkYelJQLYS+SkjcbkVEicX83nxs4oIOkypE=;
        b=T5qYfsriFsjzld3VL1w+Yz78kpm9jNZTFCF5IajaclCfLyiY46jJBjEjNCo8/Hs9H4
         kYSYvb70T5V0Tbrw+z06eKVo13DLvzjHZpqNDRtR+x3Cq8KMqrG/CBGdgxCQw0sPiMOa
         dB15EgbluO26JuVankt5Fr3wogkd27durIC2CRgCJLMRt3pcM6VwCCIAFpihJRGprTpg
         g1eD5pQj6qUyDs1sjN299q5r/YSnQE11/KWt/3Y1jUEp55fO6z3e3baA34JdpdOjQyiX
         E+4ZpintYqn71nYqrXOltO/KlV+Mahr0rnSLy3dqKo6mabpUWmPi02/VnkMqeC2cGKAP
         fnxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195945; x=1793800745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXtekahorzOsjNCbZ4FQcmlw+T18WgGmFphrz4/AcQA=;
        b=E2x3F5bmjlFXk8JL/xOMxF/D5cbathHTbM0OWq3OzPKEa9bbYcNFPEcFDWq9AdhI54
         6VtevUa+KSDABfq6zjYkE4kDBtaj20gCOrSSadkmf4heMLU6QwcsijsIsYz4okz1SuuU
         bMm49Jn+onB5EyU6HGHVpIpks/lC6Ppx9lueJM1RvBgTkhJntvNCoD3rCoF3iblNoNIc
         GVwO7Ok5LNS2nhgn9xEaI4ELU+V0fJlW0vTZvUwpQpXCbeKkLGwas5yWxxRc1y1OAQSB
         iRgVT9SVJhogd+bquKFUrwtdboqPiByTXs9880HKfjv65OknPoPH3j15iU5Ovet7fTp7
         OUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195945; x=1793800745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXtekahorzOsjNCbZ4FQcmlw+T18WgGmFphrz4/AcQA=;
        b=nCpSaGJddKrH1WdLcrFyGLXUPanOejHpOnP4kSIo2QgWg6sa2rO2bDlRmK8I8/a0C7
         Fx/qcHy3XaBoPdZ4TbRiWz2C52KB7UQGODisyLrtEuwxKKoPIdEQMDyTLRJiC7WsDvnV
         wFwuxsSBtZEu9TkE0wina+3NTOgWOJf2ZVkXssIOkE9aVArrPkWgbNmf7Tk3efulBg7a
         SGTMrKCSl3Arrw6uy9cdQr7uVPruLYQygKp+23JwOlHU6oMmu0P+66OXW3WfyJceYT+n
         w5UYXepne5Vo0mxYEHubQbt+A8X23x7rvzqohUFC2UzGZthO6T/5DlxElyyRBRiYZIdZ
         EMjw==
X-Forwarded-Encrypted: i=1; AKwUvBzvycWOmbI7Ic93o+f/GdO0m3PWeMrl2CxSh3KX5vE7wgCmKMb1jzVd15PvZLVbITkBcu4gGcgy4c7thMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI21Lq5x8zVpIZGMUjYxeAy5E3tuDDGze3LWjYPYNW3en9y5jJ
	JkzOhx0QlA8Jak332xZmUF3hy+/huuvJHRknYM/RmXc1vQGwL4wNKolZA6BpLuL7Ccy6P3ErHHk
	hLdwh6WyHYC/cN4f5BhJ2l7Okvs5LQKU=
X-Gm-Gg: AYBFou0gZtDhY+gal/ilrz7efyCXaoT0iYQIdNg+d9ZTdZUJrjYUM+6yI/l+m4DMNim
	yY/59NFH5DFs+aiw8f9VxwHPxeRuNLfxFWbOEKIIhIqNw9VnVMswZ6XQAVGlJqlPbmtlTBpVrgS
	7MTqCit5iAESujCl/QE/yF3+GYjAcWk9f+JTMXSbU/ETCDCwvuqjUJwjvtnyV9Ole7RlhEaXDMF
	oTf8PCh0Vrsyte6JRlL7is5zUGkwz+ObedrIXCbugRA8jt7kAoKtS86vhFlNSPJDOigkKyeBXgE
	+peee/k0NbL7THameuMWu65NobyWUcLI1alVrKBQRnv4cerCG3wc4Py6V0ilhPbwUzlL1eVtsYs
	dpqIFahaiZyU2xFyJ3NzzeFMDss2ulIUt4PYfBrSCujSRXocRumd9wSZjZSI5oYjfGkkp7Q==
X-Received: by 2002:a17:907:d1a:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c49bdf32adfmr219095866b.29.1793195944905; Wed, 28 Oct 2026
 06:59:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fix-mglru-kswapd-age-v1-1-b1ffdec4ae52@tencent.com> <CAMgjq7CcSxNMx9UxVjjM=W11fhd8sh3PgkHKt2kvdah3fy6kXg@mail.gmail.com>
In-Reply-To: <CAMgjq7CcSxNMx9UxVjjM=W11fhd8sh3PgkHKt2kvdah3fy6kXg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 28 Oct 2026 21:58:28 +0800
X-Gm-Features: AclHuK8kNJugcrvL3BCcn11H0oNLCsIwQIynOZcysJvsIYXRWGdp-kejpft0XcE
Message-ID: <CAMgjq7CAnUh84ZC3iR73s=1iLGJX5HMj9QqL09tiJX51MX7-sA@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: skip oom killing for high order allocs in kswapd
To: bingfangguo@tencent.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Yu Zhao <yuzhao@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 9:56=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Oct 27, 2026 at 10:21=E2=80=AFAM Bingfang Guo via B4 Relay
> <devnull+bingfangguo.tencent.com@kernel.org> wrote:
> >
> > From: Bingfang Guo <bingfangguo@tencent.com>
> >
> > We observed that when MGLRU min_ttl is set and the system is highly
> > fragmented, high order allocations (e.g. order =3D=3D 9) will fail and =
wake
> > up kswapd. It can not make any progress, while pushing generations of
> > memcgs so that they all end up younger than min_ttl_ms, repeatedly
> > triggering the OOM killer in lru_gen_age_node(). Then the whole process
> > repeats until all processes are killed and the kernel panics.
> >
> > Fix this by skipping OOM killer invocations in lru_gen_age_node() for
> > sc->order > PAGE_ALLOC_COSTLY_ORDER, which is also what the normal
> > allocation path will do, to fail high order allocations without OOM
> > killing.
> >
> > =3D=3D=3D=3D Testing =3D=3D=3D=3D
> >
> > Tested on a VM with 6 cores and 6GiB of memory, HZ=3D1000, MGLRU enable=
d,
> > min_ttl_ms set to 1000, and a workload that fragments the memory then
> > allocates 2M pages.
> >
> > Without the patch, kswapd kills all processes and panics the system eve=
n
> > with plenty of memory available. With the patch, allocations fail but
> > the system remains stable.
> >
> > Fixes: 30d77b7eef019 ("mm/mglru: fix ineffective protection calculation=
")
> > Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>
> > ---
> >  mm/vmscan.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Thanks! Really nice catch.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 9959ca158ce83..b32777468ead8 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4407,6 +4407,12 @@ static void lru_gen_age_node(struct pglist_data =
*pgdat, struct scan_control *sc)
> >                         reclaimable =3D lruvec_is_reclaimable(lruvec, s=
c, min_ttl);
> >         } while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
> >
> > +       /*
> > +        * OOM killing won't help high order allocations. Skip and let =
them fail.
>
> A nit pick, OOM definately helps for high order allocations :-D, maybe
> something like, the OOM kill is to prevent thrashing whtn all memcgs
> are younger than min_ttl (and maybe merge with the comment & check
> below?), so OOM for fragmentation is definitely unwanted.
>
> > +        */
> > +       if (sc->order > PAGE_ALLOC_COSTLY_ORDER)
> > +               return;
> > +
> >         /*
> >          * The main goal is to OOM kill if every generation from all me=
mcgs is
> >          * younger than min_ttl. However, another possibility is all me=
mcgs are
>
> This patch is good to me on its own with a nit fix above.
>
> And checking commit 30d77b7eef019, you might need a Fixes: or maybe
> even bring the check back which was removed in that commit?

Oh I noticed it's already there, please ignore this one :P
