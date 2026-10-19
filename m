Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442097;
	b=1Rh0rFtV5oI126vGKmbvOQX9TU8qtsESBvEFFNq0f5pOaiHKLhy6c/OPhzAxw7ruWoZv
	 KsE/Y5N3aOEGugvYpQKpLlQdh4oXSCaQGH6+Mb+TtPwzhsMRjwEaAuoUf9hKjGLfEXlFO
	 UN71HvVvI4tZ5tIBLJOK9E6QT+ktKoGxv7A67t5zjX/zwcPRu+zGGfCN11MxJSpXDd6+x
	 oNJdiWqQEYX5TrWzE8QyqsNbvejO2ST5m/S6hZLWv+VoMcIWfNLApnkznrBObR+ZXGvyd
	 quJlugKJnwNhDux5Khv5+7a1XnRZy3l+/dKFEvc1clFJy532oqn4F8LeV5Z7UB4u8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442097;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=aolHtKyHViu0zwbE45UYogroG29+h0ZC1Ve4vIwtrPI=;
	b=ie5i5qKhkUeMjP7KfDqlSyOB9bM/bSvhUqyEWyIPSi7hJmLqI/sFAXQi/pHH77N9lsrd
	 tds7i7gK/S9FUGEIOlYpD4x1a8/idzmlkEealCKUo456nAxlrsZto/a/2uo3bfajaaImh
	 Gk2Ujy4hsJu80oFgx+nERz2rTZOc85iUXEo7r9EoYmY4AGc+6z4uN4K1iwtPdYe9zgvWl
	 Ve/m+SXONRoLCqos0+fcmqZcDdsnL0ojkjVdd+FOsng4BQgHwOT+T1QDSDQwFC3mOgJ9L
	 Dp+2deoxEvqu7r7huQ3RpUGrU546fmP6MrKAHZrNHCuBzqvNF9E8zzmyumD2jOavfFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GOuzsqdm;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E7606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E25E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GOuzsqdm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D21DC5CD5C;
	Mon, 19 Oct 2026 20:35:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDC0B60582;
	Mon, 19 Oct 2026 20:34:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F34C10328C22;
	Mon, 19 Oct 2026 22:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792442093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=aolHtKyHViu0zwbE45UYogroG29+h0ZC1Ve4vIwtrPI=;
	b=GOuzsqdmMYeYWjsBZJqgR6mZVUlRjbeM13GG9uTKJBi2GgxJdvbvqhmhSemI8IbzyoLpCw
	feBkfQeic/lh/DngNATUaHLv2N+GwvG4wKCL7JLQ12hCezG/z0l1SeLs2oNDnUtv5G3ezF
	hMgMYmfNbdSs6QSYQ8zpm22/z4tpbw8o6LOWFH7VDbCFkUjBRne8wSvr2tUoIln3gDtB4s
	yB4v+MJxLFPqKdDAngQJD6PfoJUcoFLe0hHwmxho87uSD3YNrAQ4TKRlprn6sTtRc90MfJ
	rbFt9gp97cZczPRMaz8eJLHY4MCKEQZU9+cBIzjhNAuwvN6GqwjIGQGKWAvDOQ==
Date: Mon, 19 Oct 2026 22:34:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fredrik M Olsson <fredriol@axis.com>
Cc: Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH v3] rtc: ds1307: Add driver for Epson RX8901CE
Message-ID: <202610192034497aeb0da5@mail.local>
References: <20260629-ds1307-rx8901-add-v3-1-302dc3cbb71e@axis.com>
 <f3fd611b-920f-4539-8edb-ecb173f715b0@axis.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3fd611b-920f-4539-8edb-ecb173f715b0@axis.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 16/10/2026 09:41:14+0200, Fredrik M Olsson wrote:
> On 6/29/26 17:13, Fredrik M Olsson wrote:
> > Adds support for:
> > - Reading and writing time to/from the RTC.
> > - Changing Backup Switch Mode (BSM) to DISABLED/DIRECT/LEVEL using the
> >    RTC_PARAM_SET ioctl.
> > - Optionally enabling battery charging.
> > - Reading the battery voltage low status using the RTC_VL_READ ioctl
> >    (only supported in LEVEL BSM), which also reports invalid time
> >    information if the VLF flag is set.
> > 
> > Signed-off-by: Fredrik M Olsson<fredrik.m.olsson@axis.com>
> > ---
> > Add basic support for the Epson RX8901CE RTC.
> > Datasheet:https://download.epsondevice.com/td/pdf/app/RX8901CE_en.pdf
> > 
> > Also includes a bug fix for an issue with reading the weekday from the
> > RTC which affects both the existing rx8130 and this rx8901 driver.
> > ---
> > Changes in v3:
> > - Clear CHGEN when trickle battery charging is disabled.
> > - Link to v2:https://lore.kernel.org/r/20260520-ds1307-rx8901-add-v2-0-
> > e069ea32e1db@axis.com
> > 
> > Changes in v2:
> > - Squashed the Voltage Low status patch into the driver patch
> > - Switch from dev_err to dev_dbg
> > - Implement Backup Switch Mode (BSM) ioctl instead of hard coding
> >    switching mode.
> > - Change the prototype for the do_trickle_setup function pointer in
> >    order to make it possible to propagate error codes from the added
> >    PWSW_CFG register read operation. This read operation is added so not
> >    to override previously set register fields.
> > - Link to v1:https://lore.kernel.org/r/20251219-ds1307-rx8901-add-v1-0-
> > b13f346ebe93@axis.com
> 
> [...]
> 
> Friendly ping.

This was dropped from the queue because kbuild reported warnings and
smatch issues on the patch.

Also, I feel like this should actually be a separate driver instead of
growing ds1307 larger than it already is.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
