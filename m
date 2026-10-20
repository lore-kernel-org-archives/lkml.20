Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519662;
	b=U5SGc3PGYjO5mkZ9zCzUMCwUf955jFH0FZZI57g4MUOq5f006RPtYyv+AFxpEmLeTNlV
	 yG+5RjzqtBes0yayHmUdkdCUhrodytcsJR2wfipfmB5dckZWY0qnVf+bThRo3Q1OPG+Xg
	 yLo4JoEaLOWwH3/fbpgjAnetQc+DzckfPdSa50zpQlCmf4mx0iLNqqlNYwg2UBG3PK+8H
	 jSK0QaI1BCAgOJGjGH/4FJRvm/3FSYKS0akuu1afJQwv2XTzoDVoL02EH4FydT2LEnvaq
	 sDM8wYaV1s2tDm7gB74WPWcRTK6ndUPSGHFW+RUCBvPxNcQKmBaLfhb8QzrjbhwEKBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0Tzrx3HtUL23rsTyUgIMMsHFbitPGwqDqJbiS38hOu0=;
	b=S+ceYj3pRPB/PqyjywelsKo0MysEUyt2q4Ygg7GsLrGv8bImLKb/zoLoKLblZPls5gEg
	 Tb5P5VCzQqEsOlJmtZE7uIqMhJ5pku9Q3U9WFXyMl6E8jaGUJYIVIXN2+f4P81LBbTb02
	 +HSqYMUYUaZorpaq3v3BCBkp910MvH2bpnYl94+I8tOdKn+vOWgawEOdtVF4KSxwApI4S
	 wJmPLEEVeGUTjlBa0W0ALP2M1HT7vsb7vclQdm9PIgVPWDHRrJfYLoSMY1OQI4jlM++Y7
	 M5gb6z6xpZDDFEcPVwfS0Lu9L+JfQcVRBUAOddKylIA02zdaZLTZdxP3B5ZqKqYIH1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ptLZVHoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FED606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ptLZVHoR
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2acc1e170cso524992966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519660; cv=none;
        d=google.com; s=arc-20260327;
        b=n7b7WSixwTQ+8oMSJz5vNBefGkzbknOVhYJNwbeFMF4KDiO9W9hK8E3+RNXDI7CnLp
         ZLFrKXEhmzQ1+WLRFppP0t6iLLKI1/tjU7fh8e6UtsUj1871rHYR265X/udyrLR1uxqJ
         5Wk4YrR9gFT1XrX+7twCQ0iEwHDMALnKpped9J+w1dGBx7KTaxqmbs6T4Mo/V0/S64g6
         ka3zwDE4eTS3erc7geCVyeFRmZxwpCDdtkeidIQvdRUDayBdnbaCjjrEFHaaIsaSgB68
         nkC7JyCJCg/HcyLwnb1eZxXgNZ9UZ9iyWxTzcr0rYuBM13M6JueVSjQ5ZKky8G+6wE5s
         MbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Tzrx3HtUL23rsTyUgIMMsHFbitPGwqDqJbiS38hOu0=;
        fh=T7Y2xZ/uZM9528+xK1m+LUTpQwQ4tpH+KtDh3FJa9As=;
        b=K8Mo2dg/rz1zfl0wcF6AePCpG271Mn3ihHdGZ6RpkFbqnQ9xRTvbO2qkqgaFu/t9Ob
         maUtaRPkXrTcBWZWewCc166/eLkHq8UORfq9BqmSm+Nw35yRQdD2vU2qHtoNn8/FqV7r
         yzD6X3M4WN9n/3ocCPPJTa2nXZTWsxp/P3sW0nZVrQe/bF+xBKGd0ecp+I4LtY84Zv4d
         nyIVlwLYKZcAttom3eLBQHhltevt8aDA2J6+qgk73j2ZZgYDIcEtGBWsWwGohLWYsgFh
         3o5LzWUPYqBECkwwFDTjMifTujzyC8qrxfeiJo/uj+B3K/Tb2WshxbosJ/aOW1SeyS+e
         dzgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519660; x=1793124460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Tzrx3HtUL23rsTyUgIMMsHFbitPGwqDqJbiS38hOu0=;
        b=ptLZVHoR7Spye9IP13hbqkkr7whuOegOAok7weadVp6DdUqZfrp//7JQ9MOL2tcy9d
         mpkZKq9ouAlE/5hvUdsQcPCz2vQALsJq5GLBlxGn0cOkrq/jWVJbqAh0pW380ulvxfbF
         uTPeeP8RnzXY0jSjDPet6cDtHKNcbf79rA8AOzW85MMteeJqVy1XmPmWXtg+P1gzjJWC
         IXmcytSwhSEqyHshKrZ/3kCFBTrE6bfUSvCyJR2tjGFji8C0O7doih+arP6+xREjOoMR
         GDeHM7zTResTS+VoRo6QayxJ8jhx/CE162UN7u+4SbkfNC+6eNYpxKQuBzmV4MHr/9Xs
         iUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519660; x=1793124460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Tzrx3HtUL23rsTyUgIMMsHFbitPGwqDqJbiS38hOu0=;
        b=GE+s7LTfPIjI2UssBVLVbozM3FZuvFkooLSYslEhV1ri925h+oc5g9+eQG1oYxq8GK
         JotfQOX/s5DEBl++oQTDmN5SQR8Bt6FSGgHoGsj7XGm3nqt/nXmUKmghj2uNOsyteV1L
         nv9XqBSZxsy7Brm1chOFZAPoCIjq9nNpDYLoFTsWTXBQhk05NdBwcyIM3py9ub6s3pO0
         V4/5+U5H1BpslqfSyVIUWG14ouDTtkexHgzNYrBSRZMHcerEHoIqeHHzdXUsfrKgne/A
         w5Z4UO+/ImlKEKag0D1rLxbbvlS+u5j8Gh6AlRi4QFIrLFVGCAAbNxRwNMVtx2wDIOf9
         UA9g==
X-Forwarded-Encrypted: i=1; AKwUvBwa3Y0/4cynPe2N5x72RH9EtTt5CASHKI+tGCaknNps6XygAd/ywdJ1Fb/0XxEDJCcOGmdACI4jtE4raZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKuWLJB+GAu67a8sp33dA2C0co80YZ18uEyNdrKAEEpU9oKaNx
	yn8mdydRSoN2hi88YmkXDzXDqpkYa/NA504u0e/1yDOb1z8WFbxdy7QX8HHnfPhGFgUa7aysNvd
	MTtOGT8PKaA6I7A+bfLvYew6mGnxibK0=
X-Gm-Gg: AYBFou3QBYtXu2XIEjXlqtBfuwrUUVaX/4fgpteqgGuCwimdsAJdHms0HE2/aVKypBV
	POnu5nYOAPRfptMl+RUFAMftYs9gLmyGeg1Fxtm5LcslQkZvFS6KW55VAhlbUZVMj1J/d4Zwqmb
	xujyjoBjTtz519MQVN9COiXel0H2ueLXhNvdVq4hJKkmd8bfLfzm4TFWOK45IG7pi0mWRXVKuTx
	BiIxZP8DA6cLu9ENbkQksQ7q1p4DCSGOxPN2c+vJFiL/YAkwSpT0DsIkZHaC7SIGIAlz6Ub1/6S
	gIvr6pJ3HZ8Sz4YzZ/5w+C7ibeAr5fugLyqQiJkGitx8FkdRluDtF0nwOMQxhH3glTRXZDySPp5
	45qpw1tTLwuCH
X-Received: by 2002:a17:907:6e8e:b0:c2d:c800:d797 with SMTP id
 a640c23a62f3a-c46791a8928mr2454966b.6.1792519660356; Tue, 20 Oct 2026
 11:07:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
 <20261015184014.715dcdd3a25e18fd4df49e95@linux-foundation.org>
 <b2f925b6-93e6-4b44-bc18-c94a34b381eb@linux.dev> <CAMgjq7AGRP3B0UZ9-wJKtz8D-ayivhV0gn2WxsrJ1Q=Qm4TVWQ@mail.gmail.com>
 <20261015200023.49685b4cba9d514d1f3ac374@linux-foundation.org>
In-Reply-To: <20261015200023.49685b4cba9d514d1f3ac374@linux-foundation.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 21 Oct 2026 02:07:03 +0800
X-Gm-Features: AclHuK_l73Ef6oIxyE87Kio-1EMNhd6Jp_RBoiRkCRSdqCOvvr4CSbl5CnLxa98
Message-ID: <CAMgjq7D8Ek1yE+LUZKvvnOpiJ4WtY071Sysh685JTSeGAwK9KA@mail.gmail.com>
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-mm@kvack.org, 
	Jiayuan Chen <jiayuan.chen@shopee.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:00=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Fri, 16 Oct 2026 10:22:20 +0800 Kairui Song <ryncsn@gmail.com> wrote:
>
> > On Fri, Oct 16, 2026 at 10:16=E2=80=AFAM Jiayuan Chen <jiayuan.chen@lin=
ux.dev> wrote:
> > >
> > > Hi Andrew,
> > >
> > > On 10/16/26 9:40 AM, Andrew Morton wrote:
> > > > On Thu, 15 Oct 2026 14:05:27 +0800 Jiayuan Chen <jiayuan.chen@linux=
.dev> wrote:
> > > >
> > > [...]
> >
> > Hi all,
> >
> > > >
> > > > So CPU 0 writes to a folio it doesn't own: it may clear PG_readahea=
d and
> > > > takes the folio lock of someone else's page, before
> > > > folio_matches_swap_entry() finds out the folio is not ours.
> > > >
> > > > Recheck the slot after folio_try_get() and retry if it no longer ho=
lds
> > > > this folio.
> > > > Thanks.
> > > >
> > > > As always, when fixing a bug please fully describe the worst-case
> > > > userspace-visible runtime effects of that bug.
> > > >
> > > > I asked $LLM for this and was told
> > > >
> > > > : When the race occurs, a swap fault can acquire a reference to a
> > > > : physical page that has been freed and reused for an unrelated pur=
pose,
> > > > : potentially by another process.  The fault handler may then clear=
 that
> > > > : page's PG_readahead/PG_reclaim flag, wait on or acquire its folio=
 lock,
> > > > : and potentially attempt to remove it from an unrelated swap cache=
.
> > > > :
> > > > : These operations can interfere with unrelated workloads and may c=
ause
> > > > : unexpected stalls, impaired reclaim or writeback, and potentially
> > > > : system hangs.  The subsequent swap-entry validation normally prev=
ents
> > >
> > >
> > > I don't see a way to a system hang: the folio lock waiter is woken wh=
en
> > > the real owner unlocks, so the worst case is a stall. I suggest
> > > dropping "and potentially system hangs".
>
> Yes, I think it's assuming the other-owned folio never gets unlocked.
>
> > >
> > > Writeback itself is not affected, only the PG_reclaim hint on where t=
o
> > > put the folio after writeback. So "impaired reclaim or writeback" ->
> > > "impaired reclaim".
> > >
> > > So I'd suggest:
> > >
> > >    : When the race occurs, a swap fault can acquire a reference to a
> > >    : physical page that has been freed and reused for an unrelated pu=
rpose,
> > >    : potentially by another process.  The fault handler may then clea=
r that
> > >    : page's PG_readahead/PG_reclaim flag, wait on or acquire its foli=
o lock,
> > >    : and potentially attempt to remove it from an unrelated swap cach=
e.
> > >    :
> > >    : These operations can interfere with unrelated workloads and may =
cause
> > >    : unexpected stalls and impaired reclaim.  The subsequent swap-ent=
ry
> > >    : validation normally prevents the wrong folio from being mapped i=
nto
> >
> > It's documented that caller always double checks the folio so this
> > part is harmless from the aspect of data corruption or crash.
>
> OK, thanks, adjustment made.
>
> > > >> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap ca=
che and switch API")
> > > > Given the above, I suggest adding cc:stable.
> > > >
> > > > Do you and maintainers agree?
> > >
> > > Agreed for me.
> > >
> >
> > This is more like a optimization than a bug fix, but it's clean and
> > easy to follow, Cc'ing stable is fine to me.
>
> Was that an ack ;)
>

Right it looks good to me :D

Reviewed-by: Kairui Song <kasong@tencent.com>
