Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C6463B91
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196110; cv=pass; b=rbHbUxB9uXBKZQEdRjNTKoTek/BVgDLYYr1vee9txAVyt+sBZr60nDvY+eJhOHlOtLHySaWV7YFQTY3gguJGSrCw8GrKBtLXXQBRxDbJzirNGq5ODCn2xXK5dbi93sXBIx0JVoY1korF9Ts/SMf26K+FvT2RZ0iegmoipnLw8xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196110; c=relaxed/simple;
	bh=Lo63KNDxHLfQPbHehQEJ2TckClhkCTu4ZWquj/U3zkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5MX7stXuBabRgO7THoie8l3JfwpzXo3wD9WGw/5Xkd27lwMQ2YPSMkZ6ZVMjQYoWl57K9QcDwiLgXgFKMw71ajo1eLy8CwRVl5cllp1oRtS2rA4+p1lG+bdTTq3I78l84lVpOf1/vUmF/MpuKPbyzxgZAN0CR7euEQjuo2M1A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK/8AOIN; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK/8AOIN"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso960416a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790196107; cv=none;
        d=google.com; s=arc-20260327;
        b=IvIc+EP+ouLyjqpPERzUaGOOI4W0MvL51GDt9LIvzKoZ4zLttgWeNiXb9oe9oOiQiR
         U1lFRfLi6mhdtAKIOuqtUr6cLF0wGLTEIvgDy/eQN5ePD4UnWWfTyBke5zNCzFUcWK/o
         DcImTvt32Xk1ZlkaVAaODeibVulGitibTQ2Ldre0BSuJBhmr5jTB4CNm8TxaNXPbyIvt
         daR/v0TAQ7Do+BZnhVygVzHjFTTfj1Z3vUPNyHv8GfEolG3fIPOVjJZOWGVwnrpR/QGW
         cWriLVE6XRyqA8OW/sJnbN/ZQnfPwFGHRFr0fDceY5fSaXJL509YmU0NYj+OZeK+7xCa
         2BtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Rk90bsYMJt5ZclNkQTVUd9tGxjSt+PKuql/N4zT35M=;
        fh=paQVdPCbhRh4JmQ/3iO5AaBTWneFhf5xdkK+7hG6Evs=;
        b=f1+FE30Dup6r2yZZWZvusTV06fv+eIMimO5qNhEPh/BeQNp5+VqtAWnNUU5U9Ov2Ug
         On+1afJ5QxJfnMLvWQPgs3OjrzfjIA+pn1n4/SMIo1h40xVTPOMLacD6w3yM+18MPmyi
         8SNB1TSLw/mddhMkqc1NkleXY/n6myLrco+evtpBbHa7IXi8t1pjBdFG86j4lmfFeeNZ
         W/JM7/AGWdoD1Yp5LB15IdDdK2dnqPCcXrnTEPmBu7RbKfkoe8b57/cgBjYk0AU+1/RK
         HxPExo5ZVvhq+ofJwluVhevQo6CYcsv9D2ugffhg8WL8lXjdmE6y6JhcD5LF4auaNsW+
         gbeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790196107; x=1790800907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Rk90bsYMJt5ZclNkQTVUd9tGxjSt+PKuql/N4zT35M=;
        b=KK/8AOINc0pNtu+Va64iP13bQU9eUYg3oIdIw8s5Ci2/hAZyKMasJbc21mcIBaMp2O
         tYDn71VCJne7qmvFIbkSfOQ/51qo95qR7NsgA5HBIJEriMBbIhIvxiFYZhsSfmlWhj2V
         Vfv2VUQ6HmCAmTfEMxlOFKZ0bIEGYG8HvdNWoulJmu00uqDqYcrm572G+Y1kXMLXCI0h
         BPAqhpskB+T7ptQ0nH2EPTVCCdJXsQTMQ37wOQ2jNVh6G5sfmAsa/Fa2/tNTWzhpdRDv
         DxsuWGzD2/LV+CqwV+Q4qRy8QHf9rlVGHeyYSkjCeO/gj+hk+AjLRzeXR28FKXo1+zSG
         4mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196107; x=1790800907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Rk90bsYMJt5ZclNkQTVUd9tGxjSt+PKuql/N4zT35M=;
        b=xpAkTXZekNV38T07kHVw39q9N9uU6nysucGFm0AAS62OZ0qO2JT8A4ktIAXWUSBFmd
         ip39yqiGRoKsCK3hsNWOh/S58i4tWfsGMUz6JCeJfzqj9eFh/vGL0/LteJlLYDHKAH3y
         G1RVfDfoByvn+e/mwB+J7fRC270l6l9etfwCrYa6Rdc/dRJWdw30uP4skZphfCtlhIP8
         DwfBWV4xtyu28eHakQcEpzl2c3U2Mzea619tf/efguRDpJEIf7hV8FiyY4okpWzNcrxj
         dFQwxXqwwvl133DH5bd8yC/s5ErI3NP0OiaRCxLsPx4UcMsb7dDG5xsDnCn4pF4NFgEl
         DeFQ==
X-Forwarded-Encrypted: i=1; AKwUvByGhD0lGpI20tofgHaFVVKHagsisxgv1nCuSBiH1uwxDyZpkw8B8+jV8EwvrES/w0/Sz7y5qI7b0A+zpFY=@vger.kernel.org
X-Gm-Message-State: AFuF++kF4sv4x0luh2EVG4FjF2t3r0b0ph0Hld53d9ILnzHxq3yHdOZw
	XxqbIAMFfCbPFUBsYbwwdJ15ggurUTrXTwx2is+jcqQwClP6xp1gp/mXU6hMDQ4slzOo20r9Du9
	yI3T8PPJTq9t8Ujy9HcnqFAVfPDsumAs=
X-Gm-Gg: AYBFou2zVTTNtbvusSuBrmitNIWSNeJqmzykaD+DTJzKTaGXeEfBJxu74Vzud8mGYfg
	sROUjxE6R0X+t/+apTRlDYMqKd6FS9lqNi9fQREDDvWsV8Zrk2nW9HP5nweGKb7SYMaEzlG9BGG
	1Q6dLAk+Orxbn3h/0Md8HmtaZz0gqRVezmVulfmOxvm/r9FQr1UYc5Hoy3JfLJQ77lmmfmDSAG8
	V03q0uON5e+zLgQWb8yHWuWDNw/zLbNiaOYqOCJe5IGFfMkLeyHbt+k+exDjrmqeMXY6Z0Krkhb
	1sg+M1yV/lRjdPKQK7T+xs4r6U4o34RvYWnVde1W5ks/tvPc66zlJoM95no3oGzuAGoW9cUhp9h
	/q4rH0ZActu/9zwWa2Ym3w0adpiQ+2WrSYXBwm4Tu
X-Received: by 2002:a05:6a20:d522:b0:3dd:f9ff:f88 with SMTP id
 adf61e73a8af0-3de0ea1cc41mr281016637.59.1790196106915; Wed, 23 Sep 2026
 13:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819144458.253967-1-joaofl@gmail.com> <2026092313-snare-goggles-ed1c@gregkh>
In-Reply-To: <2026092313-snare-goggles-ed1c@gregkh>
From: =?UTF-8?Q?Jo=C3=A3o_Loureiro?= <joaofl@gmail.com>
Date: Wed, 23 Sep 2026 22:41:09 +0200
X-Gm-Features: AcwNN1Vp4K1x9c17_VZLSp1YwuVUe8d-gHRrdZOHa6Ix1f3X9Cm2yhfxp6piCjw
Message-ID: <CAJMWnCiJsNXsEe9JWDGBzHBGiUToco31ysoHF_Loj-9=YMQ3GQ@mail.gmail.com>
Subject: Re: [PATCH] serial: fsl_lpuart: add support for GPIO-controlled modem lines
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Sherry Sun <sherry.sun@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Alexander Dahl <ada@thorsis.com>, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 02:53PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 19, 2026 at 04:44:53PM +0200, Jo=C3=A3o Loureiro wrote:
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -1301,6 +1301,7 @@ config SERIAL_FSL_LPUART
> >       tristate "Freescale lpuart serial port support"
> >       depends on HAS_DMA
> >       select SERIAL_CORE
> > +     select SERIAL_MCTRL_GPIO if GPIOLIB
>
> Why not depends?

Because SERIAL_MCTRL_GPIO is a hidden symbol.  It is declared as a bare
"tristate" with no prompt at the end of the same Kconfig file, so it can
only ever be enabled by a select.  With "depends on SERIAL_MCTRL_GPIO"
nothing could ever satisfy the dependency and SERIAL_FSL_LPUART would
become unselectable.

The dependency is also not a hard one.  serial_mctrl_gpio.h provides
no-op static inlines for the !CONFIG_GPIOLIB case, so fsl_lpuart still
builds and behaves exactly as before when GPIOLIB is off; the GPIO modem
lines are an optional extra rather than a requirement.  A depends would
silently drop LPUART from those configurations.

Finally, this is what every other user of the helpers does:
SERIAL_ATMEL, SERIAL_IMX, SERIAL_SH_SCI, SERIAL_STM32, SERIAL_MXS_AUART,
SERIAL_SA1100, SERIAL_CLPS711X and SERIAL_AR933X all spell it as
"select SERIAL_MCTRL_GPIO if GPIOLIB" in the same file, so this keeps
fsl_lpuart consistent with them.

Thanks,
Jo=C3=A3o
