Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793467400;
	b=3nEAfy4A1rIdjrUZ83MWKN/zdiSTfEYlYJcdv27VVDOnjOPPabhZKpwToRF7KNgSiiit
	 pkBqvjVWOYplEMX1f/HmFVIvnncJ/TCbBXmSQmtUZDigzUyL8AYSu+pRO5jEuemapUAw2
	 w4AuMB8pAHYIVPBHIF2M3toZIjqEGliR3X6+eJ5VSU4I4AeUQJ90G/CNxfimQWPTuko5e
	 S833ybQlf93/jIigTPBlozTcRL0hIy8ZLj6EJlAdnY1Vqis9LKOmq/uK2l1x/8cxFCBkn
	 Rjuw1rVu1evHDYiF+qSG0iDsVY/ULIz0rR58oPVOA7mFyENhuOB1yACiXzCEPmyIeBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793467400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=A1b33ZVTzx0TaLrZ9DBFPPcv9iR1/Ri05N+1BlbpIlA=;
	b=c0yZ0tCPZ1IYdi+Zp663Gw2wzWNYrXrbFBQKRlVqI8Mm/c23sWLADzMnv52UyRzIA+24
	 JYv2eDsXW1rPCTdKguf8M5eXjWZ9JHMW9io02o7c904V5z3ks9PPcGcgYBVcUBhnY00MQ
	 8GLVIkUaJHiJB/qPbGFcTceI44lnZaIASjqszqv8T8AkMkexuoT1dVCtlm4GYdplHGtGw
	 Hqdk0csS/qFGk7JHapI1fB+/DnGyLwNkvMO812o1KQZG/fbMEjhSBv/b9zmXaVOPUfz5Y
	 u5C52ZDuf0DjxYq1zx2iRI6bXfrnriTjQNI8bG7P0yS9gBeVwSvAFSJpVy8LRvSkSSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YUewY4e0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C40E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YUewY4e0
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6774639a8a4so1294314d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793467399; cv=none;
        d=google.com; s=arc-20260327;
        b=qcURcM9DJ1TAvSgJCvrUH3BLjoEwS2w7pZMrASsIN1Fwoxtebg7I+nHgMZt4/tBOmy
         PoSY+96uJ9VVvA1ZZ2h56kcBg65GFp4M2Yf0XinM+RIkkrfKPnFNdFk+xvZRFBTeJldc
         Xy1rAVlQd5kdo1sVRU+7CfLiMcczPBtKZyeFGftcaaKGSFcmVVRgIvmJZzluWKP7Wmgw
         Zwo6CVIqf2Q0do5jxis3tkUxc+qjjgQR1WUWHjA2UmEWy/wJLZpV0ODuNYnHOVdNPjgC
         tcKBtMy5uBh2s87Ejk+KpO2UL3Xr1FrQRZg3XzeaakKv6lSJukNRx5dmm5yNFmtAhWEM
         7gxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1b33ZVTzx0TaLrZ9DBFPPcv9iR1/Ri05N+1BlbpIlA=;
        fh=qfYaqRD3MQEXvLeXcZrUPS4dwjbsg2pvwaTepIBjOew=;
        b=ql/pK+uC7iDIKhPWq8BnFHUe8JGQFSPv60Ti8T3s1aapOb93T1bnRJdb2kLj9y2sZx
         O6YqcAKXdT9AsvGYJMJq96ruDF/UObrriG/yb7oI7487zUgJRuvbHhe8xNMUGltaU7UO
         ZbkZenmp/ek1EvXoZsEC5G9p21GEaAT9ZAFXOo9V0JqI/CvkQwOgCQWEJ1BtPWzW5t12
         Ucwhb5DUriwhIme1ib/wFZZBmuJPDiekXZ2ULOZds/AHZkXTaVIqMUk6mHBvMJanvIKI
         zBQNYIjcFfU1izcRPrV9dQjBb80h1Yz+2UCD69Mlw2w+ZcXxL9gyq4LGPDqTBPvL+Rdm
         z7WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793467399; x=1794072199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A1b33ZVTzx0TaLrZ9DBFPPcv9iR1/Ri05N+1BlbpIlA=;
        b=YUewY4e0Qg0Rp7kR3KGNUiVeh76yMG1j5TudZFun81QSfG2XXN/Y8/0AQ9X2nNlGs2
         amfuuxX7v82VU2tfMDe9st4x/fQFbFkomRwsRXo+Pmt1DQ2aTMlSETrFlVHoaQP2iOZ8
         QtrUZZkAlEXx4sThuQP6JMnurv5/Sw59n0m4A9OjqMduI41rTHybzBzrmcNFOOzFgMym
         3w51ULYFeWPlh2GKYgGt4BvqCIuU9GdzvDO4pgW48gT9boPXvbk38U+/1i9AaNK4ih1G
         MS3DfnNf/Amb7WzSfO9HCS6zTNfpQky1OrcKRz7ScGsuoXV4Rbycog2Jo82OabhkK5am
         EJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793467399; x=1794072199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1b33ZVTzx0TaLrZ9DBFPPcv9iR1/Ri05N+1BlbpIlA=;
        b=rgsFmqSDdV0r0wS3aEd1tstv/N5OB92mCiD83GlZSedZZdyMME8U5mj1Errv0h/7GJ
         jpMfvc3uQxDyYvVtEiBxrLaK5pyGPyFzG1oFUB25fUXhniF5JMBVCpF+yQUxtrUFywmX
         zQGjeKzOib9zCOvVM744wLZyhZZBN+Xqcgeuay6EYkqDjVOFK6xJnxGeHCC391/OLQIV
         6qLYkCpxAIHFoM1aWQkrkKuHzanfMWxNlA+fpfnXiH8gkkoQ32Yxfmg9NStbngteCK7D
         3SZ710nuHoDkSMXxrk9XrkViq2wYrV6NSeGovA699QbkBezyMunhA4DvmSC2EuFGwJfh
         RA3w==
X-Forwarded-Encrypted: i=1; AKwUvBw8Wg5nVz2APmR2iN8ww6TjZ3TTvQQYYEVrBVFWph7lDt6sKC0KpZSyoOk9iGNmygRrfbER1cX+xr7QtvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1CfaMeTMjFIqjmWEMq7UGvHq6CxQ3RJxDu0daOEcfciVG52sV
	uKtgl7CsCjqOAFDfi84za8I0pZvd8SPCow/pqXvkrlKk3UrWQazHHjtOgOnyEMCIg4krVcO7rpW
	ZRMz/cgpA9aZY/522V3zdMF/pzQr5lWA=
X-Gm-Gg: AYBFou3bkH1EApRFi/bSO5WqFJTwwfuqHmBI0B1QCLJFFtB1pScSzGyGBkdUb0I9foa
	WL+xDHUhHsFdZd01wdzE7YZC4Jkhz49BVp8zcOPNPi3wS7CKeQ9hONuSM0PD/FDu/TIRFp9oHOJ
	xoh2xO6qXZl/qEPE5oLX0s0kLLi6naevhMGc6HcTIEF601Y4CtVHuDKCh2ulGEgDcXxcQ8gqfhN
	1yQ4mLVjWcGevcOt7BkEsYDfyN8Vb5DAAsZaopLC9CmYO7AYUNzpsqxRthbZT/uwtBhFMCO4clB
	GNRX7BYIESINOOGnhCO9hIe3BUqrf/VAGW0QkhRWRG+ks4j0xsgbqQB/TgB7ka3dAjfWOSo4kHc
	LyxJKI5wCGrpRSAD13zopujcIR0dMB/7TZL9DnHbRhaAaXHvHSXE26YT9Tyrj9iu+k9oAow==
X-Received: by 2002:a05:690e:e8a:b0:679:a3bc:c23f with SMTP id
 956f58d0204a3-67ba4f6d59dmr2990826d50.39.1793467398729; Sat, 31 Oct 2026
 10:23:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_C2E4FE9B7C0A05615861782611715EAA9C0A@qq.com>
 <tencent_7A270291DDE5CD89DAFFE8A745D094D5BD06@qq.com> <20261030134342.GA36226@shredder>
In-Reply-To: <20261030134342.GA36226@shredder>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sat, 31 Oct 2026 11:22:00 -0600
X-Gm-Features: AclHuK9DfpxrKQqMD1cAzl0D1-pn8G11KNdTNUdh2ruOzlesG9RpA1W1wo4hWEQ
Message-ID: <CAMMLpeRrZ_femp9zvB9wfrdJ+whOh_o91gQmG1nhxJ8PPXCoqg@mail.gmail.com>
Subject: Re: [PATCH net v3] ipv6: reject wrapped temporary address preferred lifetimes
To: Ido Schimmel <idosch@nvidia.com>
Cc: Yingjie Wang <1075151112@qq.com>, netdev@vger.kernel.org, dsahern@kernel.org, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:43=E2=80=AFAM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Fri, Oct 30, 2026 at 03:30:56PM +0800, Yingjie Wang wrote:
> > ipv6_create_tempaddr() raises a temporary address's preferred lifetime =
to
> > regen_advance + age + 1 when the configured lifetime is too short. The
> > result is stored in a u32, while regen_advance and age are unsigned lon=
g.
> > If the sum wraps or is truncated, the stored lifetime can still be less
> > than or equal to regen_advance + age.
> >
> > addrconf_verify_rtnl() then sees the new address as due for regeneratio=
n
> > and creates another one. Temporary addresses are not limited by
> > max_addresses since commit 4b08a8f1bd8c ("ipv6: remove max_addresses
> > check from ipv6_create_tempaddr"), so this can cause unbounded address
> > growth. With dad_transmits set to -1, a baseline kernel reached 2859
> > loopback addresses in two seconds.
> >
> > After storing the adjusted lifetime, verify that it is still greater th=
an
> > regen_advance + age. Reject the new address if the check fails.
> >
> > On an x86-64 KASAN kernel, the normal configuration created three IPv6
> > addresses. The negative dad_transmits, positive multiplication overflow=
,
> > and large retransmission-time cases each left only the loopback and pub=
lic
> > addresses. An i386 defconfig and an x86-64 allmodconfig both built
> > addrconf.o with W=3D1.
> >
> > Fixes: f4bcbf360ac8 ("net: ipv6/addrconf: clamp preferred_lft to the mi=
nimum required")
> > Cc: stable@vger.kernel.org
> > Suggested-by: Ido Schimmel <idosch@nvidia.com>
> > Link: https://lore.kernel.org/netdev/20261029175827.GA1411453@shredder/
> > Signed-off-by: Yingjie Wang <1075151112@qq.com>
>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Reviewed-by: Alex Henrie <alexhenrie24@gmail.com>
