Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794002282;
	b=VP6PJ2v8U9MLnCzu0bcbN4DkrfEJ5c8GhqS8MyR2MQ4oT30bYCL9Hm4wyf4Z0RRu3x8y
	 cjwaqP1307218gAeF4T58sDXnv/ye3z5UFNRO8xnj3OxhgeBPmxtmPHwxux6/c55TmNbL
	 QFbnqsxCzGUBa1bULREyuc6DZg0p33pQ9AmtZu4SI/fWY4gU5OAKFZcGi1GL95/4Y53Lt
	 C9IrUc2EYwt0Q0JJKOXCTcZGtPea2VeAallLlWR0ZSkQ0zPwl+n6a5ER/7HBnT04CypwH
	 yV45u2/AjPQsdLrw8Bq8+sjJ4YAdLAsQ5Ip+k0L/ftJwDXOXgDJxM3ETBY2BeFipDBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=p9h/Ukd1wGqS3Jj6SZCP8fOrVrMI4oj3R32GxtyAiLY=;
	b=CRG2h4hdmNhXKDCdRTQCrL17iVQbhmoUMlzHIjhhqIgn/W5UsiEG5E3VqG4fsznC/tc0
	 SW7SRgdy46Oj0jVdkZ6S1b55r7K35h2Yt0SaAuBHFolYyIU/KRP0mXWwKPke+q3GLz6nH
	 xYxv1wV5+MOOCLqCniRqZBkKEEQqeVigtVBc+GEhBCNvHHFG1biQqdMGFQBLiEOdJOlpH
	 2joS9ad8PfDt4yi6E8Ib4VlNdl6JsBI6Wp65Mhy7zK8A8B0EVOnQ2mt2BdBKA9YEYlRAP
	 PE5vKhxC+F6Uwen//XO/smlSUYyawzMuFuQc3Xi59fvzaSH8hByc3aaXbMZ+QCZKIgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=qfgOdVtZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AE2606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=qfgOdVtZ
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67c05273c38so1203490d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794002281; cv=none;
        d=google.com; s=arc-20260327;
        b=N4mjYjimJh9y4jTiLXCwEYLdAYu36Mati1whSFKFGO5ZBI7SZldDeyFja5qRBAmDER
         EVSzmDLtOD3UdklUHY8O5V1P6jXfXUoJtwPN31cRmZ+eaYjVlKmpzBu7DJ5lQF7Q3Fav
         +Onr+U5pQBrPpkng+fsGf22JEokonr3eHbPnWHFZM7I6CV1l/NzHPii5HJujnYwHR2Fi
         Ncn/cNiGdrxyhh6iRzyCZ/7r0hbroaMBPMOMZczxqvgO6O2qSidNZ7rWBqSyRJALJJiF
         VTMCE5RCbCctT2WzHCqL6HSW8tgCUqk84wM2GBauBSwDZ7+JKEb7FOxhL2CN1cU7HvG4
         Ef8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9h/Ukd1wGqS3Jj6SZCP8fOrVrMI4oj3R32GxtyAiLY=;
        fh=Ng2EoJHC2050rC0zGpAzUGgK7lS0uomsZTpp8fZdLYA=;
        b=dokbEyEYcHzybiPrDMKyviUE8aG2zLtW+Q9qZpoGr+ii0In/CuONedZp7YKnN42ojv
         BXnE3VRgFONqi6j56MJbc9b8C6DNVRu7Jt9067iHOOMXUdZkv+lmW/qGPrQEvya3fYYp
         1yZktR20vSXfpKeKF/8TVg18jE1608fu71Gng6NZ7y0WmDDw1GF4YjbtrwBI5gZ5ZMiB
         /psdmktLyh/gQIU9T86vDOrSz9AtGWqqI/MAO7BN9bpfSu2kZ8sB9qEGjhxOUrqvfWP7
         h75Yhz8PmdehPV7+UMuRZReQ1jJl+Xrl11JCOwqv64d9uoawZy1TXzI4ieMyZpyEKJ8t
         bO4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794002281; x=1794607081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9h/Ukd1wGqS3Jj6SZCP8fOrVrMI4oj3R32GxtyAiLY=;
        b=qfgOdVtZ8bDGP49htUylkhQo0l7zBOhN4Htx+1M37yxaSlvbMsiKWSwwGKid/nwo4v
         BdwfKlhXtLGnoD9SqaiFubuhzMldFDkYBe2AioLyUMH9/O/gEZFe2O8s/o1da0SelfFk
         M9IZoui7CqSA8aSSwx1CWoec3btNu+OKhv9Bo1Js/NIBPu0UgJehqWY0dA59Mw7Nd/1w
         xOx7N4cHc5i8q0FHPtQJJp+pg9x8smtX0aZRcd0anUEBWYuNMNEiQWY4URLzMx99LBsA
         ZE/Rw93CHxnpcoTNVGC+igd6xN1s3GOKXaRHIToZaYNj3uWve6jEBTNWKgjRmAODbTuh
         XOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002281; x=1794607081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9h/Ukd1wGqS3Jj6SZCP8fOrVrMI4oj3R32GxtyAiLY=;
        b=e+2PqyYPRkhUXkLsxunJAMRofOeE09e3Fe9tuXVdOt2wwt6IQ15jikQBh6FOQXEWz/
         XMVnS1XC0FVGHAOISLvUKla7ZgeOStC56pY8C9GXs19fJkurt/D7+gE3ztFFiCTn7Sv3
         qN11Pox4it3vbXyCR1tVUHP1Pd7KM5AHx/zvDdknv5J+MVRMD5IwJpeh+Wqz9zD1rhE/
         78bnzSBZtQZ93HHXM3P847mcaiPUOev2pYvVqmMzIRx2RKfMmfv/us2HlqoYKOJv3hFS
         c/1tQwTRlJZuw1uNBQKvZKDw1L9f21Ols3RRwkTsP11gFmiOuE4f9vrmtXLnUphcc6TF
         +PnA==
X-Gm-Message-State: APuU4Z8ttkhcwS/JBOBIpRA84po9S1JwZCa1kFCPh3hm45TVIk7v5ta/
	CDXLCEqf/bU/m7f/+npQ5u95/g27lACjvANtw/qrl3Mly6gelhEHdOLER6cFrMmkKvQlLsY+mZJ
	5WaBB2OhkpB0b1eYwVwylEgY1H06j7rUAVDYX
X-Gm-Gg: AYBFou01GtazTkEofgXIYfQSum6+26xnmt8SxlERS4GP8HyCJ8+Ok+uJQq1DSsYN3N7
	rpLIbSV6VyTZVHV6Lu/HgwHDRHQ71x0ijH5fXdy2hETyakBrJgR3Mbj5NzCZrVzN0cEg84lNQBE
	AssEkIhMOCJjGREMy8ZkoqhuGYzEvRs0Y8VkR6IOD2/spbyGFKZArou5BoPmkkIaIBpCQLO6w1G
	i4dA4zNN8qAJAYqBTVHDhO/GlkEL+0dQHW9I4ZwVJ0CKQB7Al56Xo+Nneq+UXeNSFuaVFKnDlDN
	oNqfWpEb2YQJyeDCgONJkM3PkHZ9NE09qqpM0fGww0jgh9yh51BW6OhgfUD1WbdpHOMWbPrdTDZ
	U6p9AS0Fs7Z07Xr8iPr4QEIDVo+80Gd3m4hXIwj4MLnQuhHAwhs4hndgn7YFSAAKcZUp8TA==
X-Received: by 2002:a05:690e:400a:b0:67c:1b89:b117 with SMTP id
 956f58d0204a3-67c1b89f7ecmr1837996d50.77.1794002280605; Fri, 06 Nov 2026
 13:58:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
 <20261106130010.340950-1-mike.looijmans@topic.nl> <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
In-Reply-To: <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 6 Nov 2026 22:57:50 +0100
X-Gm-Features: AclHuK9Td3Z0m_To34arQoLNhEm0d1ZdEWPqHTpL3aenk3lHydPYbHpktVqs638
Message-ID: <CAFBinCAaaovFc-Rvrm=U8Z6NG3HZKrQuM55C-xq9JYOhX6htug@mail.gmail.com>
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Nov 06, 2026 at 01:59:55PM +0100, Mike Looijmans wrote:
> > This reverts commit 6a7d11efd691 ("regulator: pwm-regulator: Calculate =
the
> > output voltage for disabled PWMs")
>
> Adding Martin who wrote that patch - please CC people if you're directly
> updating their patches.
IIRC get_maintainers.pl includes the author of the patch blamed by the
Fixes: tag (if there's one).

> >
> > A disabled PWM is not the same as "set to 0%". If the PWM is disabled,
> > this could also mean that its output pin is tristated for example.
How do we know if it's 0% or tri-stated (and what's the behavior if
it's tri-stated)?

> > If the PWM range is limited to something else than 0..100% this causes =
the
> > probe function to fail with messages like:
> >  dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
> >  pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to regis=
ter regulator pwm-regulator
> >  pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed =
with error -131
What board are you testing with? I'd like to see the .dts to get a
better understanding of where your board differs from mine.
I think Uwe (PWM maintainer) also previously mentioned that there's no
defined behavior for disabling a PWM and then reading it's state
again. I'll see if I can find his explanation and whether I can come
up with a patch that may help here.

> > The reason is that regulator_register() calls get_voltage(). The PWM is
> > disabled at this point, and then the validity check triggers.
> >
> > Anything that calls get_voltage() while the PWM is disabled would get a=
n
> > -ENOTRECOVERABLE return value for a pwm-regulator that doesn't allow 0%=
.
Why is the revert from your patch 2/2 not enough (it gets rid of
-ENOTRECOVERABLE)?
The problem with this specific revert (your patch 1/2) is that (from
memory) it will break these boards:
- arch/arm/boot/dts/amlogic/meson8b-ec100.dts
- arch/arm/boot/dts/amlogic/meson8b-mxq.dts
- arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
- arch/arm/boot/dts/amlogic/meson8m2-wetek-core.dts


Best regards,
Martin
