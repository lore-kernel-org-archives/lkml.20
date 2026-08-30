Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F6C632
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064104; cv=none; b=tNUwMR+VTE+Lmnijpc8YszcoYhxcbrlnc7mm2QYaLEO3CLMKUoPF3sH6JPtFcpdd7eC3+pIYPJ2wKnG+PzedG4sQSot8QeQ8QlYGJxYicmpnZVzaTCDjpMgS4Gzxsmi8Z8Ht+v+RSrjnMydhtPodCSBw7SOY4SNDt7Pa5cQhd1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064104; c=relaxed/simple;
	bh=YztifXJckWcAQZfGfl9Ic9fLzPEK4/BKQ/crc/bFkhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX1KE0Kjya4PaqNsJdGSyTxUkOnZdjAXOBrtFA46z34+rbF9lcdCRcplSwya8mFrsNsaeiUaOhpnzzOb6I5J8JXRTyzg/xa9PRu6CW+x/HywL+WHpWl4OQhawD2nd15mvFykflOmMsu27WRIxwNik+LC9PxU7BWvO9ZXZNWc23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBvdCKYg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBvdCKYg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFDA1F01564
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788064103;
	bh=kwhhqAKQey/9CCyH5sr0Bsi1+3+p1VFmtEf1p7MZ37I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bBvdCKYg0IVGZL/bbErUF4otBLnH80RZUI5S5H35G/ruYNuZVt246aCRd/XzhndjS
	 CnfwzC/ujmFcKGuulD44rczLEFaVYGZ2kpgXfj7kZMgQZIB+O8rBAuINmCrBrlJxT9
	 7k7e5LrCUq/XHJLaMfJC/60fCmTcd7USl7S1FfYHOPqCRhDqt6CoUhsIKfIh9CAlQu
	 qY+67a8n/GjjxNMnZ3jpjizOhH2IprpYLdNMeBBxFcwek/swn2sC+c4gBVcateDp3A
	 41U/DSpDovo1yxuZ9Jx2D5LmQP4BWRQbG6QoQXk2kTH6Ynk2zZXwM2z3oAEwPjGYiM
	 GS9keQjrxgJcA==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9390a2c8909so154450485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpctXCUza7n1U8vZ8a94iuQiK961tKpzftMwsIqVLvDkF5rMHvOJ2+usJ5DhVx2T+pJYd2+bGtTKEoAoCo=@vger.kernel.org
X-Gm-Message-State: AFuF++khnhT0GeKPuZ/p7ylmQeOGVEC7IiWSAaqmZzxsc1Pd6k/aFWe8
	m/K/bdr2Nm+26MVZGCj0MdADx+K9Y9gpEK3BQMehbo0P/zyiaoAd7SxDd1LUZAL8I5uRpEHRTY7
	QrQbRbnQ/i6mUcvxES1IA46BOhX4GF1c=
X-Received: by 2002:a05:620a:29d1:b0:939:1b82:47c4 with SMTP id
 af79cd13be357-9391b8249e0mr1079000085a.37.1788064102271; Sat, 29 Aug 2026
 21:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-4-baohua@kernel.org>
 <af26ac3d-30cb-47de-a295-6f9b4f2e2c32@linux.dev>
In-Reply-To: <af26ac3d-30cb-47de-a295-6f9b4f2e2c32@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 30 Aug 2026 12:28:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zTHhkBjzL-Q2N9kk6ggjYeKQOmkXBPofRyQno8QrE5LQ@mail.gmail.com>
X-Gm-Features: AcwNN1VbJ6v4Z40lv3fn5JDjk7Qgjnd1FigfVZYZsefYA5vPub56D-6w5qqkpCk
Message-ID: <CAGsJ_4zTHhkBjzL-Q2N9kk6ggjYeKQOmkXBPofRyQno8QrE5LQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
To: Ridong Chen <ridong.chen@linux.dev>
Cc: akpm@linux-foundation.org, lianux.mm@gmail.com, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, chenridong@xiaomi.com, 
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 10:44=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev=
> wrote:
[...]

> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3949,9 +3949,12 @@ static bool inc_min_seq(struct lruvec *lruvec, i=
nt type, int swappiness)
> >                       VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) !=3D z=
one, folio);
> >
> >                       new_gen =3D __folio_inc_gen(folio, old_gen, &gen_=
increased);
> > -                     list_move_tail(&folio->lru, &lrugen->folios[new_g=
en][type][zone]);
> > -                     if (gen_increased)
> > +                     if (gen_increased) {
> >                               delta +=3D nr_pages;
> > +                             list_move_tail(&folio->lru, &lrugen->foli=
os[new_gen][type][zone]);
>
> Nit.
> This is a bit confusing to me.
>
> When I read the code, I thought this implementation contradicts what the =
commit
> message says, which means I thought that we move the folios that have bee=
n
> promoted to the tail.
>
> > +                     } else {
>
> Maybe adding a comment would make it clearer, like:
>
> If gen_increased =3D=3D false, it means the folio has been promoted, so m=
ove it to
> the head.

Good idea. will do it in v3.

>
> > +                             list_move(&folio->lru, &lrugen->folios[ne=
w_gen][type][zone]);
> > +                     }
>
>
>
> >                       /* don't count the workingset being lazily promot=
ed */
> >                       if (refs + workingset !=3D BIT(LRU_REFS_WIDTH) + =
1) {
> >                               int tier =3D lru_tier_from_refs(refs, wor=
kingset);
>
> Overall, looks good to me.
>
> Reviewed-by: Ridong Chen <ridong.chen@linux.dev>

thanks!

Best Regards
Barry
