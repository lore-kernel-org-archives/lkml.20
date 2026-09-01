Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E41E18FDDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265552; cv=none; b=F0eTRPJ0/hxZXpGjjROYShD4eMCEiyNmV6yD1NTc48qPj2MYBX31YFFWv02+noFMBLSHZf81P5YYAZTDF7JfzqoJflrZxtaj+CZEBc2KeqX5H2t4qJ8i9Hu/XieGey48BLg+Y5m80kc8gQxdMAVTQlf/nlyeG+Q4Zrys/w5oqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265552; c=relaxed/simple;
	bh=aOlIvd4RNUI7aMsUehMlOv0zAvYvJET7CTj58U6wqEc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKAX7jnEGqj7bzS349DxMR0qJ/pGXSrWtwyWy4T8iK4p9ouw4zhmWcMzXl9bQhDuQsmF0Zy3mavCQCFblQ7C7llX0u3nu5yFsQDKVwfVM2AL1VeFyYUZEzyjAT/fdldadGsZ8MPdxCCinI+mPvodj6w08tWkysRCk3zgyRBEznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZRmUkqp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZRmUkqp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e257a23aso2746718f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788265549; x=1788870349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yugDxsMXHLsA2bowceNkyRvTb2StYc5BO0q5qfDNzXg=;
        b=YZRmUkqp3AhSe+qjgaMAGMCFOGv/395H5CTl5uAsBQMG4AnEuPW52WMjIK4Po8Cbon
         EBHOt0ICnOY2yViisfda2ETEDYSzgkF0my62CqjYJpiPGdOUIN3wCmmAzUtFXW11eK2m
         JgC7WEi8O0NWpRvjJDz+tIuKrwAAbsVJes/IoBRXWwrt9p/krqYcJWMhfya6oYkqdvZv
         KuDIUzzQfIOoK9/5MiwrWFeTTFQAFeY4EjHRVYR+xms/kA/YBZ5FnazJ15+2cJQ5WncI
         jBt+VRs3/UZVsEbdjyaDIRgvOnbJEO7XofEXPN6e+u2YbpNxLSHUOqVu8VpAhVZGL+Su
         jO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265549; x=1788870349;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yugDxsMXHLsA2bowceNkyRvTb2StYc5BO0q5qfDNzXg=;
        b=NiYfeG0+LshUF00sdcJDOXXWyL0sEiJsFq/R2s74pQK/m+6XcGQq/VYwXL98D6r7x3
         AHMuUwzXeaFzA+0GAyY1DkPdJIcsQ99dMMBmlQMN7XEPDeMTAynliLDYYk6BCr4wprNX
         X6VvINyDHFrbzzIK/k1kv1U7n8Vs401hQS8+SbF9s7Gj9pRSuJYq6DXj0MnJmq2s6YO8
         fz7+iz6Qht9G9cTz4G4QT/d83xTMwPeK5Wb5gvnDSMXNDM67b9Cs4FYmUHO/haiC7c1Y
         RU2Q01hGSLx061jsuEijKRnb1uQKTrN/MFaq9C6sDr5PV8s/od5OEBJSE3wMuoRFjkCh
         LHwA==
X-Forwarded-Encrypted: i=1; AKwUvBzpfSeZtYhO1SYA38l4Bj0vhrJCYzsjn3CbMXl1zQHoNhSxPR15bNU9AgfKj4BLM0qb5GBO6hmZ1/jNvdU=@vger.kernel.org
X-Gm-Message-State: AFuF++lgUhcSAJwHBcO1OE4ZX+4IxRaQYn1Cmdz0VU5QvfMnAq9cKcQR
	ubi7Wlp1ZHI9A7znNEihv8qdYx3rTY1a06Rm7Rzqj2Dmg9Mvy0f3bbQv
X-Gm-Gg: AYBFou0Duv3HZJG5AUXR0zqNLobBerVqVRUR5xkW3QMFGDs8TFBZEfKN+ZdzWytJqKi
	crHTNqsLp3Q38E0HMkjuaP0h7xMdRKeIs2meuQrr2+cJoOOlmBjH04DeSkCawJKTJZJbYPJKgjL
	x822pR2Na8FDebm555W7GJBaxXLF7VygPJE1OXdv1cKYJfM5yWXebzBDAtbbEq83V02GXgb4Si7
	UtZ0OJGNiyJmod6y7dyPYleZn0SKRxsBrr63JNeYew3a5YCHn3A33ClpkB9fp25v5T7du1SMxZ4
	ILqNCMPR6zlK7H4eamlyt9hbymGlYJo/Uc/SIhHOC86Wcj9HcMdW4zkN37Vt6bJz/mlLWOAu3u5
	PUijRpUh3G1ZtrnWiHCkWXJO5iBIimenXjl2Ts7rKNtWYt84X2EsTAO5gB/R2XmQRphN1MkKqVM
	Up4JE6ROsFUuV7OqKvfI3bqs0wexb2B144z6DpYOhZbCH9jpC6rjxkLzQzao1PI/fjEe7CmAwxA
	WPW6UyZIJWDs9CIAtklZyiMbg==
X-Received: by 2002:a05:6000:4693:b0:482:f5f6:d253 with SMTP id ffacd0b85a97d-482f79b0528mr44729814f8f.12.1788265548816;
        Tue, 01 Sep 2026 05:25:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e70csm4375853f8f.36.2026.09.01.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:25:48 -0700 (PDT)
Date: Tue, 1 Sep 2026 13:25:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, John Stultz
 <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, Deepa Dinamani
 <deepa.kernel@gmail.com>, Cassio Neri <cassio.neri@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] time: Prevent time64_to_tm() day truncation on 32-bit
Message-ID: <20260901132545.3b58cd78@pumpkin>
In-Reply-To: <20260901110349-7fc309aa-0ed4-4bd9-a4af-71cc703fa054@linutronix.de>
References: <8d421725051450cecf0a7e6d2c514b6926df43b1.1788019619.git.kmehltretter@gmail.com>
	<20260901110349-7fc309aa-0ed4-4bd9-a4af-71cc703fa054@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sep 2026 11:14:45 +0200
Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> wrote:

> On Sat, Aug 29, 2026 at 06:12:12PM +0200, Karl Mehltretter wrote:
> > time64_to_tm() accepts a 64-bit seconds value, but stores the quotient =
in
> > long. On a 32-bit kernel the day count therefore wraps when it reaches
> > 2^31, even though the corresponding year remains representable in
> > struct tm.
> >=20
> > This is reachable when formatting externally supplied timestamps. For
> > example, NILFS recovery copies the little-endian 64-bit ss_create field
> > from an on-disk segment summary into time64_t. Its sysfs attributes then
> > print that value with %ptTs, whose formatter calls time64_to_tm(). A
> > corrupted image can consequently produce an architecture-dependent prin=
ted
> > date.
> >=20
> > Keep the day quotient in s64 while leaving the seconds-within-day remai=
nder
> > as long. Use div_s64_rem() for the weekday calculation so 32-bit builds=
 do
> > not require compiler runtime division helpers. Add a KUnit case at the
> > first positive day count outside signed 32-bit range. The baseline i386
> > kernel returns a negative year and wrong calendar fields; the fixed ker=
nel
> > returns the same result as x86_64.
> >=20
> > Fixes: e6c2682a1da3 ("time: Add time64_to_tm()") =20
>=20
> If this is supposed to be a fix which might get backported, the kunit
> test changes should probably be in a dedicated commit.
>=20
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com> =20
>=20
> Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>=20
> > ---
> > Review notes:
> >=20
> >   - On a test-only baseline, QEMU/i386 passed the existing case but fai=
led
> >     the wide-day case with tm_year=3D-5879541 and four other wrong fiel=
ds.
> >     Baseline x86_64 and fixed i386, x86_64 and lockdep x86_64 passed 2/=
2.
> >   - A direct s64 modulo emitted __moddi3 on i386 and __aeabi_ldivmod on=
 ARM
> >     with Clang 21. The submitted form uses div_s64_rem(); W=3D1 builds =
of
> >     both objects contain neither compiler-runtime reference.
> >   - The narrow type came from time_to_tm() in the Fixes commit. The 2021
> >     arithmetic rewrite kept it and tested only +/-80,000 years, below t=
he
> >     approximately 5.88-million-year 32-bit day boundary. =20
>=20
> We still have an overflow when year exceeds LONG_MAX on 32-bit.
> Not sure how relevant it is to handle years over 2 billion, however it
> is likely as relevant as years over 5.88 million.

By then the earth's rotation and orbit will have slowed enough that the
Gregorian correction that 3/4 centuries aren't leap years won't be enough
and the entire scheme will have to have changed.

The observant will also have realised that since December is 'month 10'
January is month 11 and February month 12.
So the year originally started in March, not even the 1st but on 'Lady day'
with is (IIRC) the 25th.
The UK tax year ended on Lady day until we switched from the Julian to
Gregorian calendar (to match most of Europe except Russia). The change 'los=
t'
10 days, but having a short tax year would cause too much grief - so the end
of the tax year was moved 10 days to April 5th keeping the year the same le=
ngth.
It has been there ever since.

David
=20

>=20
> >=20
> >  kernel/time/time_test.c | 16 ++++++++++++++++
> >  kernel/time/timeconv.c  |  6 ++++--
> >  2 files changed, 20 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
> > index 1b99180da2881..8b718767b3baf 100644
> > --- a/kernel/time/time_test.c
> > +++ b/kernel/time/time_test.c
> > @@ -87,8 +87,24 @@ static void time64_to_tm_test_date_range(struct kuni=
t *test)
> >  	}
> >  }
> > =20
> > +static void time64_to_tm_test_wide_day_count(struct kunit *test)
> > +{
> > +	/* 2^31 days: the first count that does not fit in a 32-bit long. */
> > +	time64_t timestamp =3D (1LL << 31) * 86400;
> > +	struct tm result;
> > +
> > +	time64_to_tm(timestamp, 0, &result);
> > +
> > +	KUNIT_EXPECT_EQ(test, result.tm_year, 5879680);
> > +	KUNIT_EXPECT_EQ(test, result.tm_mon, 6);
> > +	KUNIT_EXPECT_EQ(test, result.tm_mday, 12);
> > +	KUNIT_EXPECT_EQ(test, result.tm_yday, 193);
> > +	KUNIT_EXPECT_EQ(test, result.tm_wday, 6);
> > +}
> > +
> >  static struct kunit_case time_test_cases[] =3D {
> >  	KUNIT_CASE_SLOW(time64_to_tm_test_date_range),
> > +	KUNIT_CASE(time64_to_tm_test_wide_day_count),
> >  	{}
> >  };
> > =20
> > diff --git a/kernel/time/timeconv.c b/kernel/time/timeconv.c
> > index 59b922c826e77..292a855827b7a 100644
> > --- a/kernel/time/timeconv.c
> > +++ b/kernel/time/timeconv.c
> > @@ -49,7 +49,8 @@ void time64_to_tm(time64_t totalsecs, int offset, str=
uct tm *result)
> >  	u32 u32tmp, day_of_century, year_of_century, day_of_year, month, day;
> >  	u64 u64tmp, udays, century, year;
> >  	bool is_Jan_or_Feb, is_leap_year;
> > -	long days, rem;
> > +	s64 days;
> > +	long rem; =20
>=20
> This now breaks reverse christmas-tree order.
>=20
> Tiniest of nitpicks: The reverse christmas tree looks better with the
> 's64' line below the 'long' one.
>=20
> >  	int remainder;
> > =20
> >  	days =3D div_s64_rem(totalsecs, SECS_PER_DAY, &remainder);
> > @@ -70,7 +71,8 @@ void time64_to_tm(time64_t totalsecs, int offset, str=
uct tm *result)
> >  	result->tm_sec =3D rem % 60;
> > =20
> >  	/* January 1, 1970 was a Thursday. */
> > -	result->tm_wday =3D (4 + days) % 7;
> > +	div_s64_rem(days + 4, 7, &remainder);
> > +	result->tm_wday =3D remainder;
> >  	if (result->tm_wday < 0)
> >  		result->tm_wday +=3D 7;
> > =20
> >=20
> > base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
> > --=20
> > 2.53.0 =20
>=20

