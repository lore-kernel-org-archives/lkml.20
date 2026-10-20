Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490494;
	b=OYMAkjM7YOSehRVAXpIUZ0OgLZslXVQ63dxj2UiTypoe3XXabpwl9s1F/u64b6iXXU90
	 wChTgj8mfP7DMCPasxfMCdOvlOyfsWR8egbl7KoPXgfl1R4Vz5ZGCpZ0s91QaOyYLhJeU
	 bmE0v1rulp+6x6ALCUkml+QN6zNxTjQ9WgXaiGmszKMlXwxg6sl96iGEktA4Gjyqcmxgr
	 jzdH8aj8GSAW6WXBLECUhjdBup/ZrANNjDSOaZajR7nlp0kTkrUy7WBXpugJHV+O4RXW+
	 bE8YMtn61zLUIRcw/p9Rs7zcMUCmhulRNhYUi80SMNngEBwao6dj7QlVeTPnkLqbr2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0EBQ5zDoDvXhg9EZWNn3Z69o4Pu64kdEOghQ8cgTBOI=;
	b=gzOLHXlNLKGL3OoXCpOzEQivC2wTMgivfhjE9gTS1uzF3XQPxvWupLsYSa9QEhqTjGKZ
	 bc8O9wcE1VXviJGGqYhLog9fs/X2DLWAgJb1/s1fwOX9j6JWtDNWdstDT7d9n4egz+5oU
	 RFxjpVZgh+gpOGspbAd65dIDAo/KEod587qUNXSI+Fhl9hxRkQ6Y2DeCXGWpObhX1cg2p
	 R2SDDQNCPHI3hJreyhpfv71p3kWf5snF3lZzpqlpcmkD9ykCh9Y7EStwKYTf2YT1o2+fC
	 MfdZbO8Q8GACCaS3p4Bjzi+7eBlD3FdONx+AZ2MITn3pQcKFTQUE2VMdoHnGC3K/kSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i9MgAnUv;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8094606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8094606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i9MgAnUv
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso35296425e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792490492; x=1793095292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EBQ5zDoDvXhg9EZWNn3Z69o4Pu64kdEOghQ8cgTBOI=;
        b=i9MgAnUvlMAvsPPtg/rnJRujJfiLh77GJyjTrlzu0E8ELwo7HGd9EJH2o5PcpkMQa5
         HXZv/bO+5o6K+clkbQTAWDgyvBJJGRa4AXRTvAtPgyoZLTVJYjyLOxkbRdnpsilLzWPG
         nt/NOJ7ZII59jalWoCrkgO6eq3JiKCF//P9vcZjypkoCrU5IT3iz2MFTp99iPRJBPDHI
         k6ohkARiekfzl5GpcQ8Nwo0OPMRhcfOlkVeC493Yh2wppMmEsclPRLmIO0abHJBnjCQh
         3y/QxvWKwP+nOaKLdqB1gpoRn8Zn536gcELkHYEV5fUdKyBAwfQRsAHnHZaAmTvp8xbM
         0Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490492; x=1793095292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EBQ5zDoDvXhg9EZWNn3Z69o4Pu64kdEOghQ8cgTBOI=;
        b=hf5uIxC/bMaFrjpQs2xk1nTAXUZOzcL8fHLKYCmG1GphR6v82sBNlFC+gGdgFtYo7U
         j9ANCgS4m7FByJbKei5c6aOHKfgd47b3cgmfIGSrtPFjgMhrGFQgRomyO6k5Dbcr9Uai
         xfsFy9dudBeIzCPlGjgN2LSzUewjOA6fpFyMGcO788wmXP8/mSWovaIkPLuFsF+JsR9m
         EZ1mrhT7eP6JDfkWMqv6gZESRg8uvFLoODSokF//Phu5YTAvj7ut1z7ELruNGAIdkGcF
         roOdipyCEbx+nvz7Ac8ADqY5GsjPjU8gmFNqZpE/BNFWu16+qOvYEL9xHGZpK0UAwCqQ
         IqHw==
X-Forwarded-Encrypted: i=1; AKwUvBwCDee8hJIs1vL1tL/GxaU3QWCEJ9pBEA6hZ/dZNTrW4OgZzq16/ex/hMj69zGx/Y0VINjRvg+e7gq7jdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6LlSF9orucQ65TisFoUhxN80aiWJ9jWDZRSkVmjac/t18gG9P
	hqVeXVoMFWTrmWA1kPvAiY2YeqXUtg8DcK+BM4IZy6Xjnic1pKwHXrdb
X-Gm-Gg: AYBFou0BFlNdsPdNXED6Lqpyi7dUd2W8XFrxZM8C1ovIdp0GjpL+emejPQY4P050NfL
	TVnCE1Hq+Jb1wXqDDTkeYXTOENASF6nFDFena6PyMraCM7bRrrJxAFWCCWUo4yWwFgtu2Fp39lk
	EnXyaCAYrF9HMxEgqPvYUZHLzF2mNdInY1EqLNle3NN3kOpCo2Fa3asESIQrtTU9u1v83y+c14i
	PpeUv0CLsTzzGVRQDAZsMzU8w49hggzzwEdxK+ICuXowuYf26r1suvvDnZFKVso8HA353/a3AxO
	3VSExQuR9TrKmZA3lTWkDSWH93dJcz3zBimeyvJjWXKMDQOd2oVjVShr+H4Rzz/lRRgwdHcpmkH
	IVXxEZSTW1uIKPt0XGjz3vqAtRI30USgw5yMj5NXOcmj7E3te0N+W6d/7OnOlZtX1+zsIf9T6M8
	+iQ0FJ6K+nlIwPBBCEzjiTSVyAfqdx1os/jdPTS5juJvs+ifYBzHtNYmRsP9D/DevUz3LE8n6lc
	S60QUso1bQghkVxvySv1pSjqMwqxMK25PQ=
X-Received: by 2002:a05:600c:81c9:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1d7612994mr197564595e9.26.1792490491956;
        Tue, 20 Oct 2026 03:01:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb6d82sm55429065e9.5.2026.10.20.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:01:29 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:01:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Ian Rogers" <irogers@google.com>, "Marc Kleine-Budde"
 <mkl@pengutronix.de>, "Thomas Gleixner" <tglx@linutronix.de>, "Stefan
 Kerkmann" <s.kerkmann@pengutronix.de>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Helge Deller" <deller@gmx.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Arnaldo Carvalho de Melo" <acme@redhat.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric Biggers"
 <ebiggers@google.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261020110128.25d7e3e8@pumpkin>
In-Reply-To: <100aecfe-f3f6-4058-9f3b-1eb942f23253@app.fastmail.com>
References: <20251016205126.2882625-1-irogers@google.com>
	<20251016205126.2882625-3-irogers@google.com>
	<47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
	<20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
	<2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
	<CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
	<b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
	<CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
	<20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
	<CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
	<18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
	<20261020093604.286e072a@pumpkin>
	<100aecfe-f3f6-4058-9f3b-1eb942f23253@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 10:41:27 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Oct 20, 2026, at 10:36, David Laight wrote:
> >
> > Historically it has definitely done that.
> > And you can't 'cast away' the alignment implicit in a type.
> > The alignment can get tracked into an inlined function.
> > Plenty of crashes on sparc32 from that one.
> >
> > Any structure that might be misaligned in memory better be packed.
> >
> > But what is actually wrong with using byte access? eg:
> > u32 get_le32(u8 *p) { return p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24; }
> > On x86, arm64, ppc (etc) both gcc and clang generate a single memory read
> > (byteswapped if necessary).
> >
> > https://godbolt.org/z/d33hvesr8  
> 
> IIRC this is one of the versions we had in the past on some architectures,
> but the packed struct version ended up being better in some cases and
> never worse. It is possible that on new compilers are just as good with this
> version, and if someone can show that being true I think we can do
> that here as well.

I was only looking that is generated reasonable code on x86.
(Ok today, but I'm sure gcc didn't optimise it last time I looked, my
memory must be going.)

An alternative would be to use OPTIMIZER_HIDE_VAR() on the pointer with
a (partial) memory clobber and the packed struct version.
(You need the memory clobber after the write as well as before.)
That might add a register-register move (and so a spill).

David

> 
>       Arnd

