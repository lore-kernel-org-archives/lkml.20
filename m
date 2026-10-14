Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8004A8FE3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971780; cv=pass; b=PxcVRPFH+T4/4il3L3HQVUU9wSPAtidSHp5IFMXmEuQIOmDRCClGvUivTl8Qd/R3BmVjj4fYZ2cQE+aujrdL26fwRITve+wcTa5K/aRGiUqZ3j/XbL6Uvspf4C3y5YHTa9jg9PBPsHAspwdF0d8ZQXGecgte+iuglF61phRq4+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971780; c=relaxed/simple;
	bh=ZPg3IVURet1hbZoryf1JRpqlHNpUVFH6kLrlECLl2SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhTKUPVqEo6Te4JqbYLR5HfconTqsdy64iht1GUOOc5DbU9hERJv3aN7srQKetBIVTwp4A5LlARUA/MIBEMJuECg+rj8Vw6IGdRrWVLHIRbzYFFoLZDUs08NzvqUg0qdqv4Ee6EyoJJkvO722AZli8cTcuKUCS1qvZ23mp94cQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2mmc9BF; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2mmc9BF"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba41ea31ccso4423448e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971776; cv=none;
        d=google.com; s=arc-20260327;
        b=gefiDGHa1sVQlWaWfky+kB/s1eqfFZ3Fm2iUQDKO5aAwQarO0hYC5ftz5D2MSBJmde
         FDXzSaUWOFRT0y06Gsr8jfOL2zhA+vOJRYW+4H5YhCa5E7XvrnL8dK87w4KNEaWIwsSu
         Hr30Gu5f2gLiGEEqZ4zKleaKH4KS7hWFWhAq8GVjkEukzNvlGd0ZHYe1ittI5NsKn3Hq
         PB1lGZS4VbohL0/ROAMZDTjyZ7rAtznl4T6wsCFA2MKM1aUh6kfBLPX03xOOCXf7pzd9
         tls9sxxXT/xmUcChxUrSlzRgTXgbhI+sHlo5yAVzpV/kHplPq2GiU/XQYdFZJs+FWRMv
         kUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ga/xxKIasDCJixgw10gLPhVlkRHWXaXqkLdNz27TQ6M=;
        fh=Z4avcyP9dqYQy8bn1AUqcwC+5aQXL/w2BAqkGQAskDQ=;
        b=BwaUs0KmsNejdwIN9ufXxtSnR3aKsLRei0x9p1T57T2CferxPYo6o8MB2lggw7Ije9
         h7PgNIcbVuWsj4VEbftnPehcP91YI4QsBIzneCgtDGDS3eBN59giiKz5Jf92vKlEqLFv
         V0d9exlF6pzLpbfoV0sgx+tg202JUrE/25VEcy9CFOXiubYEnlcBmI+auquI/5608DIE
         Ure1gWtn32M9LWkyJLLNw5GJjLIDdK3cOIPeHghIyzXS3KSH6xLMNJ8Dl9IvkcOsi/Uq
         ukEusKZrw1PahbdaD5fRXOxyGEcDRtQA4fvJ596U1Xt+C9Vh+LLJaK2gIpj9Q56xoNpx
         WN+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791971776; x=1792576576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ga/xxKIasDCJixgw10gLPhVlkRHWXaXqkLdNz27TQ6M=;
        b=h2mmc9BFuXYofgciMzn2WNk6QMC/HV57UsdodCpacrDQs7hqx7xq+wdoIjAZy+PAkM
         3RRfIMDJqRJCMxKMC0f9xLH2WW7kS/XRUekxfZljDLCWEFjCUD07iBgdqJTLqj2UW6iZ
         Zu68Bo58orOBJLvcqOLe0DYFMNZjgObFs3SRegTSjOJUxMoWWvMMZteDPQIUQDhQL0ai
         mHywsImbKmDXLrDGd+ITn65d7OdbAkqrpEK1rcXLIosJm3gXcVL3o2jc3aHe4f8xOxNf
         JVZWEsJ4ZwXJahZRZG5ghF7AQTH9hpB6K6GqSnycx/yz5dDYwT7KNcPqYsRvtaDYwQO9
         LJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971776; x=1792576576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ga/xxKIasDCJixgw10gLPhVlkRHWXaXqkLdNz27TQ6M=;
        b=i3zY4e6eiGkMMWvL3jmuLE3equWkcA+uYKSYszE45me3pZ/nmH2LzAvsLYGq49nZ9S
         b0A64TxhJ2Wx5TQv3Wt2kPbskY2TFRt068ijIPHo7YB/Aq0dsOBotSkvNXmlCQkqKukP
         WxSwE0VYCeonElDxhfXgTG61Ph7FoGoG09CKWE6kwxFs13raS0F2GvdetyYyNEyBRFjX
         UdMPzJR/xyO58KvIjJW6VKLoLFSTWQLo8gH3lKo/DMr1FuscCejCn69k/7ufnFHZrUYL
         SvW5CPihQIuOIWh0zhIqy0qslCdPOzIdwBzpX5oCE1153xqvI0HlXKQskk2ECfph043f
         Pnbw==
X-Forwarded-Encrypted: i=1; AKwUvBzBu6ZnFBAcucQfLAaiE4JoCLz1DvVzExoPRdbvpR/nIaUgz1CtR4IdJYMtZLlLUDaYo1o2Z1d07DzvJ3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjHUYTi1XauvlwF/w4ffSXUF/o8gWWc0wrTq2qAXjrakAFbEMZ
	BsPYHgklPxgZGA35+SX0m6UTKmC536v1UCqT7bzwuj34zyhTaMB7WkHmicTJvf8eN/jQ6GOiaDZ
	SSac3UL+ylUktuhObFwRlbFqta+bvew4GMwRS
X-Gm-Gg: AYBFou1kqg8UftyzZ6SINFCreExOrRxmn9NcEP393s1MaXFLE35IcYHf2r8tmi7i34h
	wmCfA0He/vTsTRBTC2JmzJUDe3u8EEh2ujF/GO3a5QIN3gIhKeOCeaIpf/KbYbcknpwEV4NwxoP
	8dZj4I7PfZW3CQYdwbMbIteO2dicRy2WPPEdEk/uIfxKKI9lcScKIOe1Wf2fbKYRl8Rseh54Tbn
	7lOAMHX7kzY32Pps4UyU9OAnzvGuiUoolU2H5GhxPKSqdC2McRerVwPv+j2XVG6vIx8zgdx6dJP
	fBs1U6riZI3AugaRbiNjpdYle0ljFGNK3eSNLWeTftcvYbHuULFxddYRFbfgJXMfwtMqAAoIlJ0
	UOxytJiMqm/IDACEy3D36R2NNGHC9E6m1CkQMHUunDX/ABQ5lbJ2Muqk=
X-Received: by 2002:a05:6512:308b:b0:5bc:b962:cdea with SMTP id
 2adb3069b0e04-5bcde5aab48mr6105374e87.42.1791971775882; Wed, 14 Oct 2026
 02:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
 <20261013112124.1878296-7-paulius.zaleckas@gmail.com> <as5jYcTlEuOzD6go@ashevche-desk.local>
In-Reply-To: <as5jYcTlEuOzD6go@ashevche-desk.local>
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 14 Oct 2026 12:56:03 +0300
X-Gm-Features: AclHuK_CjFljdIg_AVdVw6UFxSvgyvGJDZnWdujDm8845cPvxJXAakyDfZo58g8
Message-ID: <CAPiS6wBzomvTOm3axxO7sWCxoJg0ijZOXpj_F+NNT7Woz4Loww@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] iio: pressure: dps310: add Zilltek ZTS8032 support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rupesh Majhi <zoone.rupert@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:59=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> >   * https://www.infineon.com/dgdl/?fileId=3D5546d462576f34750157750826c=
42242
> >   *
> > + * The Zilltek ZTS8032 is register compatible, with two more pressure
> > + * calibration coefficients (c31, c40) and temperature calibrated agai=
nst
> > + * the internal sensor.
>
> Any datasheet link?

Sorry, AFAIK there is no public datasheet.
If you need, maybe I can make some screenshot of relevant info from it
just for you.
Thanks for the review!
