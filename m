Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794545613;
	b=QvtbHReFC2omV/oBgthF3vQ2JZ4aZTdskKBoMKU3/P1CiLGw5fgMSaz5a1HzTHCAeVvj
	 g+bfIFlxeqwanx5H7UcbwnKeOxEd7we0ozTbzdO6HvO9K2p7V54HccVizV619Jk17uD7M
	 WJ0I/8vYkwr24y9Z3i0ROhjofl52cLqaTdCqZrIh5TiH4MPtHJqdisvIwO9PEB7lwNUB6
	 RBXoN1xfAo+ByGPno2K8m3LhoyFiYkFZ4QCiKNHXRM6Ti28t/JbSEECySuqIkXxOe/ZBt
	 PPtIuv3XZWe9ulb5mxpCE7A59AOzc3yI9+8kwWBVyuhboZ5ctMdSm4u4wsf0hqVeQ2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TmsYW8y06BWCma43KHEiaTuc/NzEe4vwcHmn/8BBudE=;
	b=g1xFdoIQ8Ci4LU+mUTjOVfPKAK0aD9z2wzUUQNmgiRTRDKNKyQR87Ec4wHbVucThyB7j
	 0VbYk+lM+MP5/So0W33J9V2x/sWOTrrUu/R5D6APnQ7ZJ6QruD61q5SRxT80EFaRqoYWa
	 /b63EdOgWeylxv4bLMDxWCEHT2LteIekoIP2B9CwIMQvUcKbOyoaHgNQej2JtA2FqQAnF
	 e0lU4dKw70peqQh8uCCJYoi49D6ivYEpKSYwZeCMk7Xv664u6DMeIIy90VV1el3eh/9Yl
	 WcY6kxs5mZC7eej+46ns9qOlr6bmiDZbPe6npdP1/i0e1Fu/9Wksqq19E9LMcmQGiKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZFlqX0j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0777A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZFlqX0j
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b32bbd39d5so4355257b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794545612; cv=none;
        d=google.com; s=arc-20260327;
        b=Ozhyy6vlvjHFTt2V/XoJ9tT5euB6VWUTQpywWGAHaLbFlU+AImFhQaRLM1EyfP2vMp
         ow0m1GM64j1DHs6I7ZAnQ8pK3PORyVzusOhel3UG7v5rG3m90LE14bsJUOEdVUNylvvT
         BrlyP2NHuCUIpWSe1PpHsdcU7OHb7rplv+sfNIZ7jCj9CDwSOA5MWfMU0bGAjd65FIfU
         gD0rGdBV2iqB3W/32yZYlAACslaK0rhxi4DJVw2dU8uylh0Yk/Gej1Klnd22flGZtoo1
         FVF1v05+MU9Emaas0QhEdTRQBiUACSyC8NEp7ZaJkHY9iS7Djm93vsg4ub+JS1iCX5SB
         XybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmsYW8y06BWCma43KHEiaTuc/NzEe4vwcHmn/8BBudE=;
        fh=hnhEqKcUTgyI1q36rCMoW0bv75h9rhs8s3qBHGOngMc=;
        b=HTTvbvqj+M/iYMnjsDDogP7ptr5mRZ9tn7kkmZLLLqGZHAK6gih6mXKIG3QiOH6YOh
         /HnYVTdHnGViFOXyxVip3jJ//1gq0BwDaWiEC0s2EcvvFrU87Ldhm3kkCI5Gzj59N3cs
         73TKqNXRrcEMEkL52YNleHnigMDue6MAZ6/FuHn7XoQwoEagLcMl/mOTjLBhU3eTD+v/
         HiaXuuWo42cJe8JFNzOZ4aX5BaLUSASwkbpv/czYI70EDKcdebW+nYbmDs+0ih6h436W
         0dwvhrCT1lk8BSskwqmwc+OMAS2GDYmJlXKoRiLG/aFXH+5zdxSqhYSHqealICDo0ZuN
         At7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794545612; x=1795150412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TmsYW8y06BWCma43KHEiaTuc/NzEe4vwcHmn/8BBudE=;
        b=DZFlqX0jXZtNTsf4USweI4i5GpqT5aZk53+XhLNZb6JeHrMxl8/ld5RMXEvkpd2/7D
         bi8bc/dg1Q7dSQAJYUIJDmuoCDos+C2K/ybNqVARuKsqqGfT4R3i5gK0uzaac8XEqwcL
         r97/jt73u6k7jOFqpXx1GC8pQLkgqASlNscxqS41cVyx0QhMjytWm03c57aM27svbH1l
         uagS4eE+FTVQLXj8L/Pz7jNUXuFIx9zf74Ix4+DqLIcqh1b6j+cYLNRl7eCYm94byL5p
         ndAVpxRIzqDKJp7as9x7aWZ1ufQxyv2lxqH4WRMBm38cdzP6CnfxJODjT5bdNnYBNbKV
         zwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545612; x=1795150412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmsYW8y06BWCma43KHEiaTuc/NzEe4vwcHmn/8BBudE=;
        b=SLEWfHgbNfGQClWDbESO2NJMeEgzXPoGu/6bM8YXW3gxNMK1CmeuBa5+ML8v5YWtyW
         ucT8ERfnwfj/mR89Z/JU952SSpEFBXXNnNz/XCEU6Tc62ascNIiydhqFYG1pFIQPcfGc
         1L7r6jVu+ExcOB8pBdR5JNX/kc8KPO+iyIrK6SOaDAu1k4p3HYTjoa4Q+OO/EkPok8en
         R51Ghi//YeAgCMIM2YSLN0OHTTPMqAjVZFp9HPW2ZU0Jd7w0HRbnGaKyGKdPn7xb9ieb
         Tyd/84YiAOKrsZBLa2PPiJt5AxQoDAiAOzUI1yU6rlHOEaoOpSr5wxa0IQMH2WJHNbVw
         Zh5g==
X-Forwarded-Encrypted: i=1; AL+hErF0NjqzesC4y5UwLBMg3vFfeSompbP7OI/uUHNGwhPrwY7oQobrCxmbNHT/Xg4uOfsPFJceECAJWJgYlHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SzNqhn8bxQt9Ypuj6SslYKLpwPKDUOMPqFYKHU2XKALCwFDd1
	PcfpeWUistcwwy8niSD4qD5Ea/21AdiUyTMK3c6GC58rJ8+grBlzX2Nap55jbfdmgRJqPlUHMWh
	mUw6oPv1oIZ3bnf0rvvadRPh1FzKZVv5Jn9lS
X-Gm-Gg: AYBFou2JGEYZVUSxcgRZP6lfPlox1txkcc2pZnstQL8lehSZapQHdiIoIwaaOK+g/PZ
	Cso8bCoS+P/S3c3xY27B5f5rpxMdVfQyblc97HmhjY1RVa5qbc/egHpMzvA4VPZoGzvcUYHVosQ
	8YrSytMZa4/EUFUjLx5I7+gt8Xh56iRgPVSrgf8k8cSCk5i13OD+fx85X5B9zrTqFF4sIm7o1Z0
	f/6kuOOiEzeM9BxnXkUjpjBA2nZdU/Anrc8YME7ZP82FT3z/Z6NLObYtKaZPaaKWw3bKZ7F00bt
	0u6IfCVu0hpxiVcn+775M+L+vbSqyB1aoLwrsLnr0GfUgqChxQgIkTSTro4kFF5BD3BAJIXBdzQ
	obTQzfHAWP7eMBa0vzAIeKOHEAQ+9LYhkq560hOf5hzquXQMdAvTbUrrIWk2Nbk0JcWpNFvjYws
	TZHitlhP9MwaE=
X-Received: by 2002:a05:690c:d8f:b0:8b0:cee8:53cf with SMTP id
 00721157ae682-8b4aa175ddemr13217227b3.3.1794545611957; Thu, 12 Nov 2026
 20:53:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112144636.840042-1-ekffu200098@gmail.com> <20261112181325.20cab0fae21fc368f0d8e5bf@linux-foundation.org>
In-Reply-To: <20261112181325.20cab0fae21fc368f0d8e5bf@linux-foundation.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 13 Nov 2026 13:53:20 +0900
X-Gm-Features: AclHuK-E7DeK4b445-t9XBc-TjmDORMoieG212zn-ZX1uMXAzB56N5ybwbDW_cw
Message-ID: <CABFDxMFRM8D9nwGDQJ-TsjrC65PRN-GJDTomHE=94XZbpZHXpw@mail.gmail.com>
Subject: Re: [PATCH] fault-inject: use a shared initialization helper for the
 random state
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 13=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 11:13,=
 Andrew Morton <akpm@linux-foundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Thu, 12 Nov 2026 23:46:34 +0900 Sang-Heon Jeon <ekffu200098@gmail.com>=
 wrote:
>
> > fault_rnd_state can be seeded from setup_fault_attr(),
> > fault_create_debugfs_attr() and fault_config_init(), and each of them
> > uses its own guard. Configuring fault injection in more than one way
> > leads to useless reseeding.
> >
> > To prevent this, use a shared initialization helper fault_random_init()
> > in all three places. So fault_rnd_state is seeded only once per boot.
>
> Thanks, that looks nice.
>
>
> Generally, fault-injection doesn't see to get used very much, and the
> huge number of AI-generated you-messed-up-error-handling reports we're
> receiving show the cost of that.

Considering boot cmdline broken period, I agree

> syskaller can use it and those people have shown some
> interesting/useful results from its use.

It is very useful to set up a test environment as well.

> I have a side-project going where I get the LLM to drive patch testing
> on a local test machine.  The AI looks at the patches, figures out test
> plans then controls their execution.  One of the many things I'm
> telling it do is to fault-inject every error path which the patchset(s)
> add.  It seems to do this quite well.  So I'm a big user of
> fault-injection now.
>
> I'm hoping that I can also make it use kcov: use coverage
> instrumentation to verify that all code which the patchset added or
> altered has been runtime testing.

Sounds really cool. I could be really helpful.

> But oh my, it's soooooooooo slooooooooooooow.  It does really
> impressive testing, but I need to make it run 10x faster :(
>

We will find a way as we always have. Let me know if there's anything
I can help with :)

Best regards,
Sang-Heon Jeon
