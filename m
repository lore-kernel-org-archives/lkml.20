Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318083;
	b=ZoaxVQqHblYviXV3F+Qr0aUdFSwKUU54vIlXDtIIz/N0eFYXB2qjVoXWyQU/szaH6h/Z
	 5Zf7dgzezlBs0h6I9izXHLas+/2hAjRpo9TL7ZVxJYRyVTOlUVKS+ohXkRbDb+fkJvhfv
	 y5s51892OMaQqMEj+laAUtfQ0+tcgC9DxCPcupljp0B9eQW6R7UppahYYyhwDLJTlCdJQ
	 XjSOhWSWhjV5pi9GiP5iSzBVet+abm0cC+2hqyAbxUZ4IJ0itxfZkbZXpQo8kELTKWeOi
	 1dBSkgWaJF+BfqgcqK2tqM8Lwy6Em9j6biY8y6bxbQWZvr1e1btB2h0yPjF7KW2M4aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6tBk3fV1ajINvotJenztWjVRGM1U3hU6xKj+PJFM2C0=;
	b=XCENr4/FQZmiz+E7NYsP5wI0upu1RQ3qHKTtcBQQ86onvC5wZ0k4zDvTqso0bk5O2KwH
	 awew8uBXXWUHt70WGGgL3SKEXbajzc9q5lqiMtA18LbpZ4+8aVeBzIP4RCT7teG1coHbR
	 /t03RD60lAFpjjU2M+wBp9YwvCeo8b0M+7fddRnGvvOH0R3zRipulMbXS/q5/Z2g/Ir07
	 8sfpQg91TTuzYo9LXa+vr7LQPi74VrqdJxWLYXlTMy6XmF1wjv13h12TM/CtdkFbnqFke
	 HH2/IfVJYjozs39rw5ArqeHmNxHX46aekRUDfWMbv1+eKNXv7+blqNuMh7wWdgsTTWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAENorEK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194C7606A751
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194C7606A751
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAENorEK
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67bf27f179aso2035205d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:41:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794318082; cv=none;
        d=google.com; s=arc-20260327;
        b=cr5FpzpXjDIoEPTVVoS1227cpKcazTpK/XhUZO4098CvxvqVZqtYNgF6SiIqU0iEry
         sdn97iFNO9Xs1RrkVIhMvpwjXzLaVCP4/SSBMV8ZwuGj6x6fjzxk3OJUmyHSAuwJSQ4L
         2HUBuNLLX4++bs/It5VU9OCtBRmCsXI+a2MVUwT1RoSjMgSdbqHuYlc6SdT/wwUIx2Qm
         C3KrpKoASjRzH3LZifKNMOULChARATb44DUfaySig0svYWF+iF7xGRGEprYyFgl3lEVw
         x/MGZSMePgsXoJmbnfUGwRCv7tNWhWpX8K502M3EJgmYljRxUBQaMHwu/ZP4+eE9gEFD
         gkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6tBk3fV1ajINvotJenztWjVRGM1U3hU6xKj+PJFM2C0=;
        fh=oXy3rOFTCOrpWbcJQEBYzijghR+pvhxzbhHfYT0ad48=;
        b=AjMT62HK8HlCxJwH2sWx0jlJmU+FlgNJNzNw8PT2emj6RBkKJMYQzBP3JWzgJgjRbL
         0dW3h+eOUahGGkFgUx4RpVgOOQgVogBdVzZUmGorce4OVrCKJ+Hr/RMj1eTwHUR5uzK9
         6l8eHxLZjvbJiIU9CJ+itnVXKuK100m+8nZ6uFG7pjBg2VQdfB9X+3BdA7g/t1sUr0Rf
         AZPlf6epZvHwNn8ut8OwiL0YQKfhCkylWwDIg8pt1THSwa02nd+HnciQd1+SV1mfeKJl
         crAEhSs2qkCAlTy/9zDzURKRzdQDgBIVZEjZZu58LfM9mRIdBRWOkj4jOEW2CAIZ13gX
         Plxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318082; x=1794922882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6tBk3fV1ajINvotJenztWjVRGM1U3hU6xKj+PJFM2C0=;
        b=eAENorEK2LJSfNoQwshqLObJn05EXaFNrm+tSI7s65b8qucdpggqKbT9VtU63+kp98
         EvE4ox/YZRjTPXdRoHRfZKwpjGtVUwSM06C9qryj6BIjf+ea/2YcEo+IwTnLsmhckwsd
         qatoJ9Sgkp0agg1OHs27lQHZVGS/J57SvmA+JomyUrP7AOCrvyNHEc4G63vu6/A0O1jJ
         qx//Im3XgXYlxlaBH2fTl6atjmd7pl9CUeKr1YHqRf3tKprvu2YZKj6ZFCCvAIAfZApE
         qiwoHintYD6hpFibbkMnxCPU+7gm9OhRz0imda90qXvlCDlYMgQdDexrsB9yeXsuvUQu
         dKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318082; x=1794922882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tBk3fV1ajINvotJenztWjVRGM1U3hU6xKj+PJFM2C0=;
        b=Yp8sN8Phi1OxkWbsotPYs2fp9NK2M0rvF7Z+mtaLGBrIOQ64o8E+LMhhKoWBhkRM1P
         ny7oEQCgUj6vZtpVOmbVIz8ywVCveNAub6vhsmgzWWCvBhcJtqRrXceARSPk1ATcOIP5
         7QVAgUTgE0CWKVECYerjvdCNZmkpFkKxe07T7e6ViFj4fKZNw7EcqKpbiWNvMtTRm9Bp
         VoO8FuFIC3DaasiUhJxP1/6RyHQXGpMr3+ynutCuW134NgyV8xfnGAL1kqzUMFamvWF9
         R4DxGeUaOydEIenlYPGmgq1p48gHvtJLQoXTNXaaELco7jFKXnvgtbaoUsR3PKkQNI+r
         AmTw==
X-Forwarded-Encrypted: i=1; AL+hErEW3lxa/qgCoDe+QjrGVEeH1oMYvpA9qF1Dl+mfFBi9YPJJ91zVqJSnixigTDHaWDSrcQU/+rtBXN0AzZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5zDF2SyEiqstxB5c1Dr0EKMUhFbNfc1BZ8g2swZB/Tdu5XmRX
	qhAhbeajyYg7pQALUnurej+mN6hPf3hA7SIa/3/HfPjl4nZP2o+n90a4TZEW74NBneoeLbr/fca
	OwVhHTiUVhMR/NAMx6V9Qvv1Pyy2A5xM=
X-Gm-Gg: AYBFou131bWWnSjyEWrh28D2/tqDGOYdMRxJ9FxNzgf5WI77f4OJwZFaDwFo1iCNhYP
	BlWBUbBzqvREEtT35tKrI9dv7Lu+HSOvwI8V7hL6hQ365AAqRKwVtrRka/guJwTJF0ZkKAbDw95
	xo5dxkIPtyNkulGAsbdOoG71WHDRptAhElp/MWfCvNLUyTKLjvpQ1W59kMI6UtWgLS4bn/qCB1e
	RRkx+WyOsA9rocLfu3uOb17hnWZ/zpMHPZlTYTt4bn7KUJqt7931R6Ugz5GUnEbJGqwLjXAYmsx
	ib5POmTNL34aTjRMQN04s4OvvrgkjOa2XphPDo4p3PCBDhGr0UPht/ccIHQHrtmRsy15T057Xmq
	kDqUNGg9wRzbdKgLqlg2YH4FkWnNrdoe9SD8VQf4YWkWgpzDvk02CGfMzAlpSFcBORak=
X-Received: by 2002:a05:690e:4803:b0:67b:e431:4a0 with SMTP id
 956f58d0204a3-67c5674f7e0mr833246d50.52.1794318081887; Tue, 10 Nov 2026
 05:41:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104144753.2266231-1-ekffu200098@gmail.com> <avMdQuXxfqMCBbBA@thinkstation>
In-Reply-To: <avMdQuXxfqMCBbBA@thinkstation>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 10 Nov 2026 22:41:10 +0900
X-Gm-Features: AclHuK9r5g8a50g69OltVtd5PYl6bmln-x3U9YjttRRW4R25gSMvB0TudlcOIuY
Message-ID: <CABFDxMHZxHHdMc8a_DAS8yp_yT_BoNeCkRq4JPEKcgj0JcPYTg@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: remove outdated comment in create_kmalloc_caches()
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Hao Li <hao.li@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 10:37,=
 Harry Yoo <harry@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 04, 2026 at 11:47:51PM +0900, Sang-Heon Jeon wrote:
> > Since commit 16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h")
> > removed SLAB, no kmalloc cache is created before create_kmalloc_caches(=
).
> >
> > So remove the outdated comment.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  mm/slab_common.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index e66c0778ee98..c4a386f0dd90 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -1029,9 +1029,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_typ=
e type)
> >  }
> >
> >  /*
> > - * Create the kmalloc array. Some of the regular kmalloc arrays
> > - * may already have been created because they were needed to
> > - * enable allocations for slab creation.
> > + * Create the kmalloc array.
> >   */
>
> LGTM, but maybe let's just drop the comment?
> The name "create_kmalloc_caches" already covers
> "Create the kmalloc array"

I don't have a strong opinion. I'll address it in v2.

> >  void __init create_kmalloc_caches(void)
> >  {
> >
> > base-commit: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
> > --
> > 2.43.0
> >
>
> --
> Cheers,
> Harry / Hyeonggon
