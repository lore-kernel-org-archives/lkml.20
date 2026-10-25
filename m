Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792946918;
	b=HBBew9OHpE6tAIGNn+KZLNYKeUnDRurjplVX5AdWsadZgc+9o+Loo/3rtMmsZFTgy91D
	 sRRZ+DOdfs7qq//UR1qcdsv1/ySQ54xAUREUoCFcbgqSIjzT1OVAQzPFNb/ARaGDSw1js
	 VTLCTJbpA5niQKyZiF0AtitufVUtv8N5gA9+iq5ah5/N1b+QcFQjqt4V1v6HdiYcH64q3
	 y+cF7Mv7fAtUYFu6jnVBJsXWyfGNH8WyG2GZmhNTvrkTVXTeEtt1yV/NWau74KbeuqmIR
	 sUy+KbLYi+nCoYmenHcdmGPk/8hNyT1PXmKEY5lJlPnO30oFqw8ojuI08OQuDr3BWjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OQ5OjXs0aIahC9OVKlKWWMFSX1nU2p7OCig10Q5/wzk=;
	b=3o7KjZ94YCu7PBJGIpsKfwxJu7xZRNjsBxU9IwQBCfSUknuZiuBhsYGtq6Dp4wQ5SIrV
	 Dk/X+wLfMH4AGvjzdlba4pIiEmnoYZ6/YzUf9LyLlD8EUcc/Vq4mWXjGzOhnFnzhuRURd
	 UNzfH0xLGeeiVThZXVGqGigMStsAQmn6RJxdla4gFtx4F2bkXmNfdEESvCCeJXiv7qtqG
	 x7U49wg/PsZol6uTtyO3DnkKvN/GJrnsSeAlfgg0EaRnvArEMmvbeCwElDGhCgUj0CeWF
	 1GigdZYzjy0G7TJWM0qN2zr6+CrtXvU+L5FVJwCQ9xO3jfrxV0s2wXNimi+eSE5F50Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KYmnvVXK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A54606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KYmnvVXK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f036b17easo5967228eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792946917; cv=none;
        d=google.com; s=arc-20260327;
        b=Tgs4VqvY2Yy027srf9YyLvri3kt4E8kpRdHv155EKivtQ5U6kyrkae82TLDCprl4sY
         8Y/Q2o4qIUSuODCuVDCzwvyg6Xbgj1giRkzh+CI8JzVLwMKo/G4Nd8Yd//vYxiElm/ck
         2GprxYy0eOVqmyw1CqgbiHKNCysHDGZBtcM0IsHVQc+qCPbS3i/AdTEvyCeHM7oii+Tq
         PRnI7silJixVZ0ugjB7bpVez+v1erbVKa3mKvIjpQhv+CbhKBWatU1KZj5/NQodTv3Bz
         j49cEGsyCGWaMZxddDFEFOKfuqz7taHLCYEj6K9c42RbBLodiuzrlqsVNZqjukf9diol
         O/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQ5OjXs0aIahC9OVKlKWWMFSX1nU2p7OCig10Q5/wzk=;
        fh=lEnkQD7T+hmaCIUbkOsm9JO1yjnv+oOansVTi+esFrM=;
        b=QdrBaSA0dApzIX7B6Ghrr/wOsgr0tcvaunzOJDDtRiOeSR607DsdQWY8tWgyOPvmi4
         tpzG5tCUM89KkPaiekIyKnlaUSgTnCcqtB0KsNRR0QmbRU+WIiB63ex8N/mQVCTJxtrA
         1d5Uzoel795uIWQwRGHxCyF/F6q2GYxHHgA1/L8MBjipXjIvKKwoLCpJ3XQYBP4MRANC
         g9h1Ly1FxqxOuWFVWteMjCkHa98IMkm29geDjJVogIM1dqLVY3D70ZZo1aF7cbVoG9v8
         WLBzuVih5nHAQRFUMn7I/M7MC5jNekX3O7ATyi9gZlsEuSb9ThgsXOJsYqRqrIopnLdn
         yYrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792946917; x=1793551717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OQ5OjXs0aIahC9OVKlKWWMFSX1nU2p7OCig10Q5/wzk=;
        b=KYmnvVXKqmgzmzcYvgaBaE2o02vTlgFEhxL1z9bImYcjsrPqSwTb/uT4x98PWQ3Avz
         xmWPMeKQzEN55YHwCXqXnABiZx039OJtIL8+lt6hdomTYYNtNqizDQXSjWavfeHB4LJu
         dNI274UzUkEtefjRtU2EUFZLWxLV8VPxJgT7c+ARjxaBt6KjMYVAPfn8ub2Kd+fi/pKJ
         y1IJO9RgQlIwu/psiG2D1NnGKhd1julDHjPg0GejY/VoWMcUo2X9nER+AnjGuTq5jE34
         pnBaXMrW2nYwKZ09gRlN8+I87/aOlBTdynHQhDr3c3h6CLdyyyerNOEEOldanrfp7vos
         5fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946917; x=1793551717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQ5OjXs0aIahC9OVKlKWWMFSX1nU2p7OCig10Q5/wzk=;
        b=t+MvKud8Gl6zsz5X7ho/N0DkBsW7J8EV/1nxLoJ19AQKTVvswo/kELgIifN1NqFxSV
         OrFtXuNaoHCpc4dLa4Yc0kACXMF2z8Ky7DNKsdzCc0hndbHK3gqvZXidbOkb6AXDAhlf
         /d4UrJ2fshzJ1OF0nVJz1wrYxOynjBVVXmcxKhA4nvOSOCVjZUb12JSRv1eUbfswj32o
         v01sPyUbFwB7tvDRh6FA3T35zJ3JQDStIHBloIBUSiGSJvMovxx6rmYlvHULkHBh1+B4
         x4jipC8/qaUvQzdXZzuPLrN0065J1IvkaXVF7tjJzItdlPT+c1D4D3AIGN0Gqx07+k9o
         IdWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXDpOhgFoFI52lvXhanx4L+bEHnqxrAKxZYWsr+XVwdHw7yo6H5Sj0Er/dSgnfCAfEP85oIOGpvue4JRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt3CgH5PGQHFV7xn5eyNxiiJU38e4w40fcbxGhxZSre31FZDQK
	FCJTDX7Ut9gQqvRkmhxQLDoKS/JtdCoUKoxpXsve0H22aQtrzjucmXOYAQBJNFlsbV1s/Tde21g
	SRiXqaYZmq1YbnXTLpBFibPBYH7tHnnY=
X-Gm-Gg: AYBFou0dw5y3/j55bal8I38lQPBRKXW/86mAAYsyh27u0XER7/Ih94yKRtdsi7hoIQ0
	FKw0fmLnFyelIfY+gdg5Ori17jJMpXAXkpooRRfpI17yl5eL7JzGMU2pCVxhrOw/Kz15hNmwLrX
	J4PfWaumcEnwIRTkjOWWh0fll8bsm9BFeo3AIOOt0IcyTwhDpQu1uvrZpf+wtIqPMO3jV+1N/PF
	byvmrHHMfTLUJJVACeSsEmiQqFmaSmzqiLKiONRMqIhVPF2/5p/i0ZGRuuf6696e6GOcUMo9U+Z
	csGgLs3Ab6yp5aT1zCpdM3iF4p+j1lj8cpCL71yuOz9ElWHmiju0x1JNHDfs/MkjZFlwWYD8bMO
	rLJFYSJBx8Ine2faFNYye/BjAW5VB6NDfDrCPAFEbPXwYPjh4SjKfi11o01uycihu3UjQtfF7Df
	NVEOkEcJKPjj01JxeT7gQb1nrwyQ==
X-Received: by 2002:a05:693c:87dc:20b0:350:2a5c:56c with SMTP id
 5a478bee46e88-369e84b1873mr7142255eec.20.1792946917425; Sun, 25 Oct 2026
 09:48:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179287943591.17355.17353179557993329094@gmail.com>
 <at0vzdlVTF8XAzHj@strlen.de> <179288180870.24716.7833838593165388250@gmail.com>
 <at2V3g-B1Ko2x1iK@strlen.de>
In-Reply-To: <at2V3g-B1Ko2x1iK@strlen.de>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Sun, 25 Oct 2026 13:48:26 -0300
X-Gm-Features: AclHuK8nWBBaduAuSBl0zsyZnm0f5QTkQEz1Yhbnl-LnIzySkyTP_8D8glFnwKY
Message-ID: <CAOCBhwFsbHzRuxngYoG3DDOB_KgBL5c0aHvZEVh58Xkeu=h1oA@mail.gmail.com>
Subject: Re: [PATCH nf] netfilter: nft_set_pipapo: skip transaction elements
 during GC
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Phil Sutter <phil@nwl.cc>, Weiming Shi <bestswngs@gmail.com>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Florian,

You are right, and I was wrong. Sorry for the noise.

nft_set_elem_init() does stamp the expiration at parse time:

    nf_tables_api.c:6860
    nft_set_ext_timeout(ext)->expiration =3D get_jiffies_64() + expiration;

but I misread where the reference timestamp comes from. It is taken
in nf_tables_valid_genid(), before the first message of the batch is
processed, not in nf_tables_commit(). So expiration is always at least
tstamp + timeout, and the sync gc in pipapo_gc_scan() cannot see a
new element as expired, no matter how long the transaction takes.

The "empty set" I observed is explained by the elements simply timing
out after the commit (10ms timeout), and the dump skipping expired
elements. It was not the gc collecting inactive elements. The
comparison with 86b6471e690c was also wrong.

Please drop the patch. I'm withdrawing it.

Thanks for taking the time to check it.
Joas


Em dom., 25 de out. de 2026 =C3=A0s 02:38, Florian Westphal <fw@strlen.de> =
escreveu:
>
> Joas Antonio dos Santos <joasantonio108@gmail.com> wrote:
> > The catch is that the expiration isn't stamped at activation, it's
> > stamped when the element is allocated. nft_set_elem_init() does:
> >
> >       nft_set_ext_timeout(ext)->expiration =3D get_jiffies_64() + expir=
ation;
> >
> > and that happens back in the parse phase (nft_add_set_elem), while we'r=
e
> > still going through the batch. The element only goes active later, in
> > nf_tables_commit(), which is also where the gc tstamp is taken
> > (nft_net->tstamp =3D get_jiffies_64()).
>
>
> Can you name the line in the source code?
> I am not seeing it :-(
>
> > So the expiration is really parse_time + timeout, and the commit-time g=
c
> > scan checks it against commit_time. If you add a big batch of elements
> > with a short timeout, they get parsed one by one and the commit only
> > happens at the very end, so the ones parsed early in the batch have
> > already gone past their timeout by the time we reach the commit tstamp.
>
> Thats not supposed to cause a gc?
>
> All the sync gc functions are supposed to check against the reference
> timestamp taken at the beginning of the transaction start, in
> nf_tables_valid_genid().
>
> They are NOT supposed to check against wall clock time.
> Even if transaction takes 5 minutes: the sync gc step should
> NOT observe even a single timed out elemenent.
>
> They become stale only AFTER the sync gc step.
>
> tstamp is coming from nft_nat->tstamp, i.e. start of transaction.
> e->ext timestamp therefore should never be in the past compared
> to that reference time.
>
> 1751                 if (__nft_set_elem_expired(&e->ext, tstamp)) {
> 1752                         if (!nft_trans_gc_space(gc)) {
> 1753                                 gc =3D nft_trans_gc_alloc(set, 0, GF=
P_KERNEL);
> 1754                                 if (!gc)
>
> > I confirmed it on an unpatched 7.3-rc6 + KASAN: add 20000 elements with
> > "timeout 10ms" to an interval+timeout pipapo set (the parse alone takes
> > ~6s) and the set ends up basically empty. pipapo_gc_scan() collected th=
e
> > new, not-yet-activated elements during the same commit that added them.
>
> How? I'm not seeing it :-(
>
> > It's the same thing you already fixed for rbtree in 86b6471e690c, the
>
> I thought that was about false zap of rbtree end nodes which doesn't
> apply here :-(
>
> > races the grace period just like the rbtree case, but the precondition
> > (gc picking up the not-yet-active elements) reproduces every time.
>
> How?
>
> > If it'd help, I can respin v2 with the parse-time vs commit-time
> > expiration written out in the commit message, just let me know.
>
> Yes, please explain in detail how time can advance during transaction,
> because its supposedly impossible.



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
