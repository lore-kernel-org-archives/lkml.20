Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B14582F6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754806; cv=none; b=ltrT4U8tn03bDEi81x5/oZtm0Cj3gr2ZhqCRYflxQ4SpXIj7WfcqlYZE5Y0kJ3+EJdeRvxs6nlcYDpYMB9HfvkygMC5l6Ki9l2bwPjbySRRScNqsCYg3Kg+G36pA1DtQARY6PgkUfUijnwzSnkOD0bDfZzDwXAERG8nIHzioMw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754806; c=relaxed/simple;
	bh=6DKatlxffhk1Ma2S0NPaHdERsrMNfgFOEbtCWhR/2HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZfFgl+eJ0JhGsuSeKSj29LMcvuE2B83vPBXyyFvfOXEZsDoTd7lulBZDj/kkY8eIyCxXeYkzTf6oJvi4iX/74RFe85O2CeBtlc/Yk7MMxaZGBhlvEHkOMx0Kn8A7BSwE/Rzv8UqSpizxfVC7x78D9J/yM5V+dwfREe36q0r7AoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjRZDD/h; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjRZDD/h"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso23345195e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754803; x=1791359603; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=;
        b=sjRZDD/hv6awRoJ1I8LMw5ZOcjx7ARAQAOBmSJR2APPmHVUImwbI0HW8EOnY1t+xBv
         PwpEa3QRlH3m4fjFF0JYQo4CZ1T+qtOyEltAo3S/RWLdA82/5zgrAT8RzL21fvcJ5gI4
         KL0Axtl2hVou0ltofDYkKVzMZkgOKkRS7KMEmURfvUR5QLvOVQQ6PGDaK/n/xtWz0uf7
         eSqwDi0Sh8Z8lb3ZU7H7Amv1ckowd9zVQBjvGoEGMDN1Xbic7tteT/8vquTfCBDqbQ/k
         rrk3VJyMFktreafSDrGg4Icm7r4FVkkt2Ww2h4fuLK8skxkvmQyYFm/MnvE5i7FU4r0c
         qg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754803; x=1791359603;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAVEwX1cbG2Scf8aznTJisEUwviOCJejkET+NM0/PLQ=;
        b=krb5bVUETrf1+AIqqUqTccYcYLtZj/wcr5OtFzqIweTybymLxIUQs2EP3qe6rW02cS
         mPNG4JEpNBXl239kE6DcFSReZEh6kahR/U1Z9R5ZFn6DULigxU8Ozk2KAUJejUMBZvS1
         mdumVx9K4GjkTR+iX4bAHfHXmlCa8ywvhsq7p71ZhY6/w5//mMC8IqaocU81wgTq+UFc
         c0ZGgb42c3jbPF00J03mRGpRno9l4Mcw8eEsoV2RU/1amo1vNaLcPBYdax1u4rvwVxnR
         lch7VhcNqhu1t3Sr4OGJciz3XbC5b+C/wXjGWt9+WK4IuGp7AI3x5UkrViT0kDeSfvfw
         WKUg==
X-Forwarded-Encrypted: i=1; AKwUvBwrCZmAYK/Ss2/PC1b/+UkWQpmuxVcajW3modwU4fqfq5QuJMN18Ggl6iV5eysqk6scWGF3XVAsoeiC+SA=@vger.kernel.org
X-Gm-Message-State: AFuF++lgPlasZkmcnePxi1j/XTYbDT/rTQS8xnLpLcSPD9KZo1aBdn8I
	EwFxTHWwDaRr5ppzCUQjBTC1wF+iFHTnKbGMyuTSuC+47fVR2fhYmu2S
X-Gm-Gg: AYBFou3LyVMA4ahSG5x2ZB9UCXFO4qx95bn0fU3vcv04ZoJqnLmjCJiQ1ET/KleE42X
	kh0jeufeclxNKFmG+r3qhU8Wu1lZ7VNbARk9zWQb5m21tKtUtA4iZEvGKqSzeIXsPUxValhhcTC
	6aW2AWI5x0lu4P5KL4IW47CJpmgmPogjaUyio2G9XT9ibuXF0rhoYLPIkuALNxxM2h3umdi99H9
	/WS2bXLuoo7CKGMQ1kikhlH0ZGq+D6+87R9P3ngZe8aMN938RXwBamUy/+oNbdipwScxzb4IlLg
	czJ14HZNh9j+/H3kGVGxCiPSWMJbiYc1UGcQGSErJqAy6tBjF1EcKmlNBmcJJ8Hbd9nqBgabgtb
	7Zkgf+Pk7l040+9K1rSYWd9/AmIodOsvEdfR0t8qgWr7XVohIlcjZ1kC8wQy3ucZDhsm/rH+pDX
	daT8tHUTgnQniCM0JIdhikUZ5Yi81viQ8Mr2+Zm9ma53TGkVkpLB80Z1+2FLOcSeFuO2+D2jAMW
	ikkXF1/QhVxaNNRL6Ak1/s1nAG/1hNy
X-Received: by 2002:a05:600c:6206:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a01b01b8c0mr8229045e9.19.1790754802651;
        Wed, 30 Sep 2026 00:53:22 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0175208e0sm32306225e9.7.2026.09.30.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:53:22 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject:
 Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <2026093046-scheme-fastball-59c4@gregkh>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <2026093046-scheme-fastball-59c4@gregkh>
Date: Wed, 30 Sep 2026 10:52:24 +0300
Message-ID: <179075474429.2320278.397112083512309038@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Wed, Sep 30, 2026 at 09:14:34AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 30, 2026 at 10:00:06AM +0300, Fil Dunsky via B4 Relay wrote:
> > The ports are named ttyCS so that the driver can coexist with the 8250
> > driver in multiplatform kernels, and PORT_GENERIC is used rather than
> > allocating a new port type.
>
> But even if you build a multi-platform kernel, only one of the uarts is
> going to be on the system, so why have a new name for it?  Can't you
> just use the "default" name instead?  If you do that, what happens?

I tried it on the board: multi_v7_defconfig with the driver renamed to
ttyS. The 8250 driver registers its runtime ports (ttyS0..ttyS4) even
though there is no 8250 on this SoC, so the probe fails:

  sysfs: cannot create duplicate filename '/class/tty/ttyS0'
  ...
  cs75xx-uart f0070110.serial: Cannot register tty device on line 0
  Warning: unable to open an initial console.

That is why I went with a separate name, like ttyAMA or ttymxc. If
there is a better way to share ttyS with 8250 I am happy to change it.

> > +/*
> > + * UART driver for the Cortina Systems CS75xx (Goldengate G2) SoCs
> > + *
> > + * Based on the Cortina Systems vendor driver.
> > + */
>
> No copyright info?

The vendor file (serial_cortina.c) carries no copyright notice, only the
GPL-2.0 statement and MODULE_AUTHOR("Cortina-Systems"). I will add mine
and name the vendor file as the origin in v2.

> > +static void cs75xx_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
> > +{
> > +}
>
> Why an empty function?  Can't you just leave it out?

The block has no modem control lines. serial_core calls ->set_mctrl()
without a NULL check (uart_update_mctrl() and others), so it has to
exist. I will add a comment saying so.

> > +static void cs75xx_uart_break_ctl(struct uart_port *port, int break_state)
> > +{
> > +}
>
> Same here.

That one is optional, I will drop it.

> > +static void cs75xx_uart_release_port(struct uart_port *port)
> > +{
> > +}
>
> This feels wrong.
>
> > +static int cs75xx_uart_request_port(struct uart_port *port)
> > +{
> > +     return 0;
> > +}
>
> As does this.

Both are optional and the resources are managed in probe, so I will
drop them in v2.

Thanks for the review,
Fil

