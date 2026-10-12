Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD2399340
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804131; cv=pass; b=P2V5MzcPuuX/V4Bdak2elTHDA8Ia4XWW3P2YVclZKw34mDmspBZAt5nH/7wqyUgRsgGHiM77TMNvo0BpzQzZBWDXQF1DytxFGW2RPq0sNPDaOU76Btp2y1Wd9nbPrCdrbNdFPgSUFXPn8OSjGiw4hoksrHfhBiyydWpFi5J2F9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804131; c=relaxed/simple;
	bh=ImImow3e+fihOWO7VmT8//WIECuyQ9MyP0HEjqwJ2y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDv8dCRHDe6bsf8uQ5eh59PY9odeER1ytPA9r9BmloKYnTgG7orboRfiBevk0DV9GUee+S7UpyYckYc/koi5MnT7qBcfJLG10V1+D29bK+5qmgq9n4uRAMMnaoNGm/I/7f/nO/GB6C0zSyOAthR8N8dLBBC1LEvjSuuK3F0j9e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+HnvCps; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+HnvCps"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc74881317bso63984a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791804130; cv=none;
        d=google.com; s=arc-20260327;
        b=VwD2mjrBq47jfOAZI07At6zxDJ5GWZRchevuQJz+yTvHkmzlPaeulqnMCxcOvDEHMR
         H9Ufz0xQdWDiqp55hjyIsLGJwxSWb+bCrVKS2lwuLmjA44cxD/+WX/PkilTXNbqJt9De
         dSbIYK4lymAuVcHLAdpKjVqlcS5e7f/xr9dAAQSbnAT36ix93+URam+lP9zUBLMBxAaD
         hVHo/3THyTKDHUC+fSHX30iUyRT53ZvPM2Xgtz3Kwp4I87FqzakYWRsRxqeZ+hdE77S1
         QAWLjKY6PrBbfp8/Agmmwhlsf4lMEKkrKBbmhnVjseWl33F0BQEd47c7YOMxepeZ9ic1
         OLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3niU6cqp7D6Vf8l66QKyYfhCi9eIbqKTTvZBBqGYZyk=;
        fh=RHR2ZitK2JH6X8Q5KC8CYQNriDkIyKJ3fzJW0eyUD0U=;
        b=rtkQ5SfNsosTxUQcDmlrvd+8/JpTUYRuxuSSOVFI8DfsL/Um0HRPpy5faVMzVO1saS
         1Rw5E58CK34KwCpzjzEJLgIfi4FQ5cC5H1BclFD6MNuJiN99VSPvZkrr3nAeUmb9hIq4
         xiUih0SN7+mEjXiVLt9A4MmPMkJG1/K0AFeGh8lhIJIGn6U6tJCZObvKaPafvpkbAycq
         DsIgYiwJjZYG97+l4iponEbO1Bknd3jTLGxgcluMr5FltkKvAi9PZfuecltIy0f9kGPV
         4G1iNzlN7o4DZ79BYMRIRSK3u4HQfGkk55pWNb4vvrNd2Bh2yK4Bn95ao1Ncxi1SHhhz
         zQ+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791804130; x=1792408930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3niU6cqp7D6Vf8l66QKyYfhCi9eIbqKTTvZBBqGYZyk=;
        b=F+HnvCpsEua9MuqAFyVw22du5Pid1X/pNWVfMszv250sQYOVqrLA8gtoeEtF8PM9RX
         /n6M07q1oyB3s4+fqPhZ+m+jrNoacOPlKtxM4m47fXZJqEXCqZulXG9btDlpd9KuO93c
         RKrJ8Nc3Q4knawmB2m/E/r5DM/tAwsVgcr8MTvPRqf/9CbvCeXB53P2vx+dx6Q2GOgnv
         cPsgpjtiXek4r6FZbLknHeiuHEs/xhRlseYtLsOSNbl5jpaPNZJ6E7PJRX7aVmNYVMsl
         a3ydeOiiJfgFJ4ZkJ7o4hm0scYavx8LVdgv0FPulvbHvfMhTNHee2tz1uhppgHHDiwWQ
         J34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804130; x=1792408930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3niU6cqp7D6Vf8l66QKyYfhCi9eIbqKTTvZBBqGYZyk=;
        b=vpd8cuNn8eASQEAW+p4q3CLntTZg6hyehF3VV7ibBb7a6gdwS7gxHc5bxbyaJVBuTv
         hyybIC9436kVDKXGv/TAwvL1zy2aPnXPaEw5I7i5OuSaWQfjcJcnDjhkn5zttz0C4i4b
         QnVjKGPmwFlFW1jdKzUtxCCabCOMLi1pqWuXLGs32cS4j671xG/m5gyIPq5Yx7iTLDG7
         MiAx3pF/gipZB7oRwKSuel7PlITyX6rUwYdLUnkdGibR5SQxSAQhNhlZl/Nj/NbkvM0+
         JGY/dvP2mMwSCeMw+ibSG5IZHXfUkUQkvqibnJ72nncg8gUKXv1/DIpGR6fYnxz2wjey
         6Rtw==
X-Forwarded-Encrypted: i=1; AKwUvBxBbgHo1MS7e1h2s4rWwh0o6yG1vLd1VJbJ0u+8xx6Cw/NI7gj/1AoGflkMAoxV3SjRso0vxwrfehKDeM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfwNjBna/1xtx/f/7zbtOttnH3h8u4h0aEzHUAU4ioKViCzhOl
	mdDY4Zk8IX/yERoPCIneF85vEZlzuU1PiBxJXrWUsPa+k5HliUroPlyL1Za/nsxqw6OzZG5Ycgs
	1bua8kZWYOQ0q/LQ50sdzIQ1+ksb/nRQ=
X-Gm-Gg: AYBFou0Y6Ei/qtCJbe0Y/usjCNY3MI0J1WB3g1RB6JinKmgK/m5bnCakinmpiFXT6TE
	w3EO2i+o7ijVzFjHf0jgqscqpge/Mu7WP99UdOPmeI21GEFt+71ufNpgPWHLwzcDdjDXNbi3tIL
	eI0CwI9Sd6QTO9mZWJIzJN8u/RPLQdh9Av/ozrWquby54P18oAjW4GTfCTYLXxhmtI2VfGb9O08
	QAGbebrcOlvhGq7fs16frTh9jE83xKdl7zprbD5gE0cwxUYMI8QkL2/XdVLDM2xgB4U9apZHiqR
	WsIkelwa8zkarYCgz3agFzVdywby0l50JG871V1eg4UcA6AFIhK2G833mPnWz0u2EMk+Sr79uFg
	4QYLefeRZ9T3w
X-Received: by 2002:a17:902:da4f:b0:2da:dd0a:99e0 with SMTP id
 d9443c01a7336-2e8428a2c77mr122171625ad.2.1791804129626; Mon, 12 Oct 2026
 04:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930090813.73901-1-q.h.hack.winter@gmail.com>
 <20260930090813.73901-2-q.h.hack.winter@gmail.com> <179110850671.434549.2584497019282941556@kernel.org>
 <1791424156.460.8ed76b88c7@gmail.com> <asySLDyakgLAKVdf@secunet.com>
 <CAH78Gvt0gUELPSeqf348P4-B8E7RH3L3PhFdgVdjfK=WKEpzdQ@mail.gmail.com> <asyytFvHJGf_KB_D@secunet.com>
In-Reply-To: <asyytFvHJGf_KB_D@secunet.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Mon, 12 Oct 2026 19:21:57 +0800
X-Gm-Features: AclHuK_rUMnN31SSB_KN6FhkpZSAxBkc67iXhJ2qmDZZxPegZYe3XhyfD991XX0
Message-ID: <CAH78GvuFZxvHWqpbBv3cOQAA-TqvjgS14vH-GsTF58wJ8_vLvA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] vti: fix tunnel device use-after-free across
 async crypto resumption
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Christian Hopps <chopps@labn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steffen,

Sounds good -- thanks for taking the patchset.  Ccing Chris on the IPTFS
part makes sense.  I'll follow the thread, and I'm happy to review it
if that helps.

Qihang

On Mon, Oct 12, 2026 at 6:13=E2=80=AFPM Steffen Klassert
<steffen.klassert@secunet.com> wrote:
>
> On Mon, Oct 12, 2026 at 05:07:43PM +0800, Qihang wrote:
> > Hi Steffen,
> >
> > Thanks a lot for the guidance, much appreciated.
> >
> > Your three points make sense. For IPTFS, the skbs freed without the
> > receive callback are the outer xfrm skbs, and it's only a handful of
> > places in xfrm_iptfs.c -- a small shared helper would be cleaner than
> > open-coding it at each site.  The two xfrm_input changes (set family
> > before the early drop, and hold the skb->dev reference unconditionally)
> > look straightforward too.
> >
> > Would you prefer to handle the IPTFS and xfrm_input fixes yourself
> > (Christian for IPTFS?), or should I send them as part of this series?
> > Either way is fine with me.
>
> I'll handle the full patchset, but Cc Chris on IPTFS.
