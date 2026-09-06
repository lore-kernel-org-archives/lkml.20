Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C0E345751
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715357; cv=pass; b=Xv7PERn6BSlc6fWOZP65BXNMUNf0qpshF1Np/BgjulrBfua+9O0hsk9VmhSYio8AoCAYXvK6s47AznloSER7ixsxJhtTyoGYuM9vsZgiN9xsQUf4n8gjSRyvk86m59cBe8Swxrc+CKgoaQTyfB79FWeo04F5ii5MRO1wPihbbjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715357; c=relaxed/simple;
	bh=xlfHTmswkSpLXO/4f4jYBhuVejOLiGyJyM/ej83cLuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYHk0WogGvf32QVUyGP/FHdzhh9NiuZCXc/TP7SjsyTSUm2GepXqb9+4NwS+SN745GiGRnXr89FN8KRPWiyXuDLkZj2NJnJmFsGuey7DvLwm3vaBoJJGZfqHvnq9wNBtTjdA8CBOj6T8aq7r8E1aABgT18dyFJS7wrziWTxmwtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTvN/LN1; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTvN/LN1"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedf433a99so2775935a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715355; cv=none;
        d=google.com; s=arc-20260327;
        b=EnTjYeRoxuB6CEbn7TSgszrB7cUc67ZOQnWd/Xve7AFIb5/dSGoS7r5jHKfmjoGcE/
         vsJSK1MXZ9+mzfgA18Huq4OeHXqQsb+TqY6jHqltDBUpWx3yoaCCfT1NJl4jRnsq0dwX
         QFdm3yv0851OlSKtW+0xRCkmUXbJmJwAPw/EDepWjn2c2ECENtoMdq33LiG860XgO9Vs
         vAgJ6zYBosybj8q38tbmcYlx2G6grtf5eybNw4Ncd0EsQhKI4bxN/cGKUH2PtlBZQ+Nl
         06jKEpJoBHT7PMfebxbkZeDtcaRHYBkKoW+DPJgwo3xnJtcBrLjTh0134p9MJsa9L76P
         MyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        fh=GQxl0D/jyHEP1DNBNRMZVouOncX+Q+/E0MbXbR+vCXU=;
        b=YMwHugGxpAO5mnNEeZj7sSmivFncBKCjTG72/hDzs1DH1+5XlW1SN/5MYNbNLl3NC3
         Ml/OBmzpCM3tgyvTQMwjrqpumFSqwACnmsQHkH22ni8k9iSZr9oj7t42MWTO8LwVMeMS
         pX2ar8WPkQVux34KInXXtTpNnloVjCCvc/bX/huvJ2+zHjUrO0NBauq6N0RbGScZ2YA/
         dNRVYJV6AjpV1NusPkOFu4lvjlnpK0s6IMdqc+ciBEI5T6fsvi5s3BwkD0cgkq4EcS/X
         QZ6XIyYZTZdw7fKYVY2VtdUy7NJjvVgoviyDCPIAPgUd1+E8N/hRbI27cnTRfJCRkqBI
         Z2qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715355; x=1789320155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        b=DTvN/LN1EdaERFqCd/Pf18xk3C2W9zOejXGnr4Zon7F3zor5rZQ344+GQ1BawH8Yia
         oxrLD6jEEaJ3VX4H9A0LkI7AjDZUBT/QzS5oBGB1SLqzR9dFcpoQQwfqMFrTwPEZaB1P
         0m3rvOHTFdLh9lLU4yfbJxyweFX42h5JIcRnl9ozmPY9sAFcxuGYjAFBsARs2CATPDls
         EhZJEkWhdvjriIJ3fwyBDu21MkwGTZDYmGjDktjCV4tKkevbckt6Pii2RruUjekLWGsV
         lYM1DxyvWC7EKZK+Cm7hvHm3hx8cVCRAWMfHElaWUrYSGogaVhj9sxCmEemyKJdrhxYS
         hjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715355; x=1789320155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        b=RXBMedpHxWvvoEUZly+LNyjyznzuuHAep20hZcXK/mE8tJnc3fJbGR+Re06I3ZhE0z
         6ax+XsVNhynHl+OnseZ27p7DAynApVJOo2/WNJ4lDPAd5aArwV0f6eJRyFTvqMJwFCRD
         VRbM13HOEIo9AeVG57v/Jd9IMnJ5gllZQ4odBWRgP05XR6Teo8E8p6TupFW3/kGcWRCI
         Ljlxc4gifqXTtnr470FdDAqLPdc2RCvoCzJGzMKW65axvVzZ6aF7lN6yLnZaE2WzUeFo
         4/7Cctd2w29YPO1W1Xbf3xUTiww9n67sDJZ208h/EOFCPyCeNfJ4H+Rs6Sn6r7dY2UNQ
         wOYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1WEYlGUM00y+B+ihK7rglksWS1m8FtFHhEZU8qjkMG6nIWXGMCo+vaBpZNsb6m+2gFvWsIGBkYR4TSwA=@vger.kernel.org
X-Gm-Message-State: AFuF++kRiAmqTcucJLCGfix9sq3EcuwnHWzymFpvhimJxjyk66livxx1
	KN1Dxs4VYjiqNhImF9HVzvMY0scHCW7IFWsnIhlCTWneT1oprQaJNEXG1f08UwYC678hNKuL0p/
	lFHtPeXeXMiF+Uiog3/kN14YIa2Qa3TI=
X-Gm-Gg: AYBFou1YtuycyPMqSymTLq6MRCGC9Wmdw3LJ5/3nUSI5D1gJVp7UPDAiQ9ilz6YWnwo
	QdNy+DnZ5hCgqI6xhStKdcDVbSZKwYjXosETKKNSCkUiXh2udUgutP2p2W/nBpuvWYwZsU9QMUH
	R7Gl7FJkPxAo1Fy4VIUoxBHNLAaYfVDR0E9X25Now9u1BE7mXzUTmjgWf5PNlQaTAj/9MMS7tGp
	r06wrUiUojaSK3wzm2gq4ytFnqv7ln9Imuv35A4GP2sgDW37zKN6TQRrLOl7e0oiPkvy/RdjdoJ
	D2N3cRXVCgPX6mDkstc1LBseq5jf/mqWaZcAPgbqP2mfMvXdqhanqYbUMxJLqn74BypgG5i8Y+s
	7+w==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae50:97c6 with SMTP id
 adf61e73a8af0-3da3a154de6mr29258954637.19.1788715355297; Sun, 06 Sep 2026
 10:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
 <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
In-Reply-To: <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Sep 2026 20:22:23 +0300
X-Gm-Features: AcwNN1XDTtBNxGlzLOpLQ3w1y2Et6HgHVsvlBacLuEsWHZNblAyHEWGt7R_cBqA
Message-ID: <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 19 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 Sv=
yatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add support for multimedia top button row of ASUS Transformer's Mobile
> > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > default which suits average Linux use better and with pressing
> > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > Only Dock keyboard input events are tracked for AltGr pressing.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/input/keyboard/Kconfig                |  10 +
> >  drivers/input/keyboard/Makefile               |   1 +
> >  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++++
> >  3 files changed, 321 insertions(+)
> >  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
> >
>
> Hello Dmitry!
>
> May you please take a look? ATM only ACK on input patches left.
>
> Thank you!

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left. I
would like this patch set to move forward.

Thank you!
