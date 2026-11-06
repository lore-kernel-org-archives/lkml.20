Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794001543;
	b=KNo/iCiuOBRxEWvFcBqKg0TGWf+tI5/EDKqgkQZTHk17DDBjIViKbYaiC2YlGSkC3B2J
	 Iinc49AHINjDn7z2MIqntDq9i9E6SPYG3xbnBl5dMX6/7ym1gaFbaC1Gl9zw1OjsVlZ6q
	 mfipbPWnYIAOSJ6wC+66lxc78tzl9mCUY4QPBhRmVIbluTuO1ISlt7cSmGrTiOpZYEVTH
	 R6fPq27XeMjuIIvDShNTxCQtDKA+TaUs1DFOJVddSTsXXziUkBC6cSysU8QlW1MhmtzdS
	 cuV7D5Gt5ZHlro4HbESC2doCVeUVG3HceZKXhbLI0twHARN0Ba46Pq+tAB+OuiQeujg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dzuwwfgS6TcLAvEBE1++RIfmgJzGGyqXdcAh98Sd13o=;
	b=VuC+cQm2nEyUgEaS4g3GWahOVAcfjEUFdDViNNfZWhC1o43G6ZyKJCRNAQMFcgy9lRAu
	 HKsf+5/lVhtvVUWBnoI31TGcrhHnlD/JRgu6BTjcipLw23t3yY7CkwXb9i20uPWm/o2pX
	 AvHlLbdMJVGiM0XU/oWaaqlLpjEKGszFWbypTXoAWW+7oSuxIErxurMUjQ6wdLk0GTKHz
	 GQ1vnRnp4xtQo90Cqytm0sUzrwNGs/0/Usj7Yy0aNF760xtly59GtGfHVKyUgEmvvXRvu
	 hpOA6vs/Hwo0/gEbpFIRUc2L3El2UzNQGAut6YITITZy+ZK69BQdFNyT2zPX7W47KgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=qYmiRLYM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D31A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=qYmiRLYM
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67990a45e02so1209775d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794001542; cv=none;
        d=google.com; s=arc-20260327;
        b=RM9K4zFZSUrn9mm+yBZG5x4/UsUTUPpSYgzYRCzIPYtwQIWdsvKcj7j/Ce0PuphVFo
         GEzYcup7lJ1X9e3V4R4ti3LY5cqjaIldg7Gi2MOlBg/YaT4tXtx1KRD8FIsU3JbjaJD1
         ugpuCesnGTJTNdm6gEg7pIqvTYmrPZrbPzUmFq26tMSICI0hDgrBXRuscpP8+hQuHvZV
         9GMktst+L2ys1MR8SFzOvzocH7+6efYx8nF4fD3iyNvZLmKcOPMv4Hz9i7mKOo0a29fH
         IxfZ0jX7Wc6gO6iQrj5+3I0zj3P6dAbAl1KqnK3ad284lsZ22XdTIr970vVF+FNDrPfN
         MY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzuwwfgS6TcLAvEBE1++RIfmgJzGGyqXdcAh98Sd13o=;
        fh=FzCD7HjpI4s9s1dTH0M/VFzDshr0hHwpePfqFBiSz2M=;
        b=b/V0/1uPtVr4y8cRqmO3i7nRhlmvxf6xxwZ+gVj1mkVTsQTFVlcRjDaZsqN5Bu2kdQ
         I8Y6Kdw5/Fzy0LATJ5eaP9WFeprt0+s7/jHIcIr+huHE3SH8dWfi+JUfggl6HaYOreUa
         1qoOJSAMeTGDVYr54zwWvpeuZ9nvANhsMkU1nrphtMBrTwzwR+SeGTB2GTEGsU96dVHS
         sRHRckPH53/mKRjIi1Hbgh3n/XVu5uFVdUA87J5TAY/DHTjtabfDWVVb/Ntu7YXKpWAV
         UwUGwmDB8iCtB+42B/BOjiFr1+eC74yGKZ+8Wdu2Mt1qDpOgH0ah3X+iakUDuzLQXBRW
         cioA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794001542; x=1794606342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzuwwfgS6TcLAvEBE1++RIfmgJzGGyqXdcAh98Sd13o=;
        b=qYmiRLYMaEH3km7EvRFCE30jwkK64M8WgJJ6HxdNx1TQ3+QthT+wioK00tdqj59ycS
         GWAkdp5XyPdCD8PE5oJWExTAYcEkIFoF/jPGW2fDv9sDNsb9G87xVm7N3aVI68t71T6O
         xO/0UE+qDiOFsGjhhCj4yKo6JKfsAzb72sobDc4Fy0iAizNrdAfNJ/NPuXbP25RtXKsq
         ftD3DXcqMd8a0VD+6YOTdK1zqwKqoUBjsayfK2GeJPADaqV5G4r2DMH9pK116dei3q3B
         czADuHqfuSdv7juZHhm/aHpoIaKAbooyrOdSK5dhY7ihe7SlQgzm/U934WaKiUtaPwqb
         Ndgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794001542; x=1794606342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzuwwfgS6TcLAvEBE1++RIfmgJzGGyqXdcAh98Sd13o=;
        b=Ynl7/0G/cmDdNEebLXhskLSsRYBBjqk7WCgSmShLq2xn1Nz7Ys1YU80WZ5gOWehjm4
         TD96x0XQeNvx5GfQpKXXDBWzuoNX/wFLCay4HylICKJmUlwK+aqZe5VATbe9OxJ5epFT
         PH7kAZDx5ihtmyRECglNmlaTIjB2iDF0DPvgWi+6tSqqz0669GkbNJIZ1KmOFcl7SEkl
         0vqF/UKydjv4UrOK0+f1m1FacGzXa1Pmrq2kN1MEVfAVCxjcKMDoYGDVxX/sLKwaAG7m
         QDB8VtUiHl096fThbjyK1p+X/ekg6lcCog6vuUwWkZVgol7ydG29gJsg4vytulxbZ5OB
         LcHw==
X-Forwarded-Encrypted: i=1; AL+hErGZdUZBOFZVmznXhU1tz+jbeHnnl6jDmrwfmIvc2fkd+xUEY/P7uVv6uItov564jwPYe1GiWf3Uis9Tq1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J12U/c4n+qFV7bn3SNlben8UMfXwV/nOoSho0pb7I1Ij3txd5
	U3SuPPOzJ62cwIbyeRccM7qq5S+udyVYzuhcwCwgpYIODQ5OxJ2d3B+/vsiDujpxX8B+uyrjP0S
	ECzEjnMnv255MT4gzAGJd565tMu1cNzQ=
X-Gm-Gg: AYBFou0iFBxp4dIgd/GdnzsRqRW5Th0gKMP62BEJCqux1DMaZhBUv2zN8d+LFJogeHC
	zKz590Y+xZilQlNxmuvSvo7l05zc1iSk9EnG0HaGe5ptaH4XH0SwSwT+2KakWZtC4QA3YZEQ6aj
	mOU6tBth47rmqurjIEfzTjP4icuLI512Wi8PjqefgMEQOahfLhgKXQ4J+pYPIATzRBS2duyGJia
	K5gblgBzf+L3AoewVfb7X9W0aJwxERfQwmKj+8xE6X2nK96JyVYaD48KDjVLQ/N5BP3Oql63h+8
	g3hqsDQLMJ083puYxxU712REQakuiYbrrcrVQp/dDV59Uus+d5O1dIjrH6DI6OkoST7FYo1Z1HG
	Vpe4aVtI7GjPpvTjBg4R3JpvukbVCk6ZUVKz6FTlouYVMqNNXluf3BF+5BxOxH5eg7OpllA==
X-Received: by 2002:a53:b192:0:b0:67c:f37:109a with SMTP id
 956f58d0204a3-67c145cb6b0mr1746286d50.83.1794001542485; Fri, 06 Nov 2026
 13:45:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6954786b-65e0-4206-a0c4-60cd251dbec9@emailsignatures365.codetwo.com>
 <20261106130010.340950-2-mike.looijmans@topic.nl> <27e5c94a-acf2-4e32-92df-e3de124e0bc6@sirena.org.uk>
In-Reply-To: <27e5c94a-acf2-4e32-92df-e3de124e0bc6@sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 6 Nov 2026 22:45:31 +0100
X-Gm-Features: AclHuK_xnWO9aWUEaLJ0yqxJBQtPHxZZh8_5gdSI3LoMg1FuW6M0OnJWZBAFdTQ
Message-ID: <CAFBinCCN+P0YRvOP9pwmxVXGv-MGyuZn_45nCZ-7ko8Ko3v+-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] regulator: pwm-regulator: Revert "Add validity checks
 in continuous .get_voltage"
To: Mark Brown <broonie@kernel.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:46=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Nov 06, 2026 at 01:59:56PM +0100, Mike Looijmans wrote:
> > This reverts commit c92688cac239 ("regulator: pwm-regulator: Add validi=
ty
> > checks in continuous .get_voltage").
>
> And again...  please don't try to sneak changes past people :/
Thank you for looping me in, Mark!

> > The core, and in particular the machine_constraints_voltage() method,
> > expects the regulator to report what the current setting is, even if th=
at
> > is outside the allowed range. The core will then bring the voltage into
> > that range. It cannot do that if the regulator refuses to return its
> > setting, and causes probe() to fail for a pwm-regulator when it has
> > restrictions to the PWM range with messages like:
> >   dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
> >   pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to regi=
ster
> >     regulator pwm-regulator
> >   pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed
> >     with error -131
> >
> > Besides that, regulator_get_voltage() is not supposed to return any
> > state information, as is mentioned in the API documentation.
according to include/linux/regulator/driver.h:
 * @get_voltage: Return the currently configured voltage for the regulator;
 *                   return -ENOTRECOVERABLE if regulator can't be read at
 *                   bootup and hasn't been set yet.

Can you please specify which API documentation you are referring to?

I believe back when this change was authored it didn't make a
difference on my board (but made sense based on review feedback).
So I'm not against reverting as long as we have a proper explanation
why the original patch is incorrect.


Best regards,
Martin
