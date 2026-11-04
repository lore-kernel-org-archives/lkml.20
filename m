Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803277;
	b=LQhdl2LHPEX0wkJTnFi5IkzJ8T1W5QBUPj81+HLelVOExHOQAcO68w4qg974+7/wW/xA
	 TscTQgVAdvkLhdVbEywF4jT0fiEyzh5eqyBBb4IGU1L9MrkO+6M96Zs/57pVHix6xjuBW
	 6dTV2WP38tCm8gT7QjrIehWvWuRa9tQmGfhvKywEzyj/piaLtGsO6aOshEGd/Efl1jH/I
	 gPZ+rorfGolOGQ/IKJrEMFgfdxXTUb3kp+YZh2Sia64FOYpUQx64J4ug4YRqTRvxAGzVs
	 aVHkUO0ZDf5n7PZreiUKMawZfFyEOLc0TnwZnT8esM/k4WjtDDg1DHM9d2sMI4gaYCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=rSZAK9NmnDM1rECR+UKs+1THSvEe21uePbgMyS7RFuQ=;
	b=faTGH+ebdT+S2plpfW2CwriSL4mBGOeI8/tpI0gSyFk4+CCG6WTfqPksBcxIJYqxV44o
	 fRl88gQXWtQORY2erkNu1MLSD+PxZAczvQ5905GsdTunxSDS8jeeJNaqPxPr2OrbFF66t
	 fnNo33T/XL1Fy1gz0KlzWPEetNAO18cJheyRmi9ePmD+o97QpJ4fl4tSqnNM12u18G0nF
	 +2aCpdzZvSgjdU11SedYuj2kseUFpfSBmfHL99hwc9AKCMwJb4e3kbNZVqUxRM6U8J9zI
	 DPhL6yEL0eYCmabaJ5M5QtX59+iEl2k2n9mqIym2soCFxgSDTXI1ahtBNo7hSHed2uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YE/AgrTU";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00672606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00672606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YE/AgrTU
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05b210703so459702b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793803276; x=1794408076; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSZAK9NmnDM1rECR+UKs+1THSvEe21uePbgMyS7RFuQ=;
        b=YE/AgrTUfqMTobpDoNRIRlkX2TJ9KiqZq1Yc8/u4kUWjTvi4BbIvYfDpEHAwbXM/9k
         4ha0QDd0M8aJWuvczzS1kQ5ewmagQTCS2T7Q+0i+ORTeBWZ1zL/AqI7wm+L97kVXpstq
         No3ZWY3FAG/yTYpbcL/hX5hPwm58piOR5IH9dCmUBsCjAEUxAj1BEcIn2KKKNY4wBsfc
         KXSsK9iD225+GBj6c03EEMK2JGakdcRFEAoOXaizVjaWK8ISAVbpH9FfhRpQ29+ZqGoY
         R+I+JunmlbRCH9IFfupFTT7kgb0qwDQvhMN+kEHJ1ViwKtdLWy+MLL+V+BijfcF4VecP
         WyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803276; x=1794408076;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSZAK9NmnDM1rECR+UKs+1THSvEe21uePbgMyS7RFuQ=;
        b=qUdFmeo4BbN21XJPciSltYN10yCchxJNqk/D3z1IQ1BmI3FrMGiy2g2gqInHGWuViO
         ya1BzLd4UIdOxjONUYEO1jK2/nNzPCHoUi7GewMKZS/82EMNc3GHTU6Uw2R2Cy7ttz/7
         r1NbbIo+QmgxrumWSsQTIrY34ISs9pZY4QEri0UZBdF9dwLlI8vGRoxvKICFY3lek6hh
         MW61d2JG2HSbv1aOgHX9tnWv64/qzHELrIbSqB43GJxN3yTCbBcedJmkT27ZV4Sx1Snv
         lJ92aeqSAHwtEnNqTH0ya6b2xSGBecOYyidHUki48EzKjmXXoJvRF4Uk+fatVqs1F8TB
         H9OQ==
X-Forwarded-Encrypted: i=1; AKwUvBykqKA7OcGoQlw8UB3070p6FmgKc40wAuJ9sGWfUZyebpEczLrwLPh2ZYP9LrScdaRISf0g42rKM3xsez8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QeXblOiPkBLmrRB8igif49Y5YSoL9UvEyyAxWhEijMcTKtX2+
	er3B38jm507ArSC31pRlkjD6BkLIEwCC5LuTC6lTQFnNAaVd1D0Mzs/z
X-Gm-Gg: AYBFou2Vzn7FtcRYiO4lXMgnhonI9KhAd6/m2f3oipJsfwsWeKk/W32lnfkEuF6IM2a
	BvDKdJR6inw0DKIgzlTvVDkCchjuP+CcqezMMz2LxMz+M8naVGwJz2TCkbjuJ/oAxKSCUujclFI
	amjuGM0YrgfXPslEYdlGsRQ+4F/XWjexZYRJo6/PL+Ory48+6w9HdaX4zmfXAcHoOCSa58Scrr7
	7HDKSMggYu2ciwErAO5l6iv7cj1ShJEeXC2elS+s2vDDRMdwIlfE3AKmifRDuncv5FR95/GL1D/
	2IR/u0jysvgx6t9hxvAMS3T3SYbVV534gmKlQC66Q7JLDucpERDS6xR9MvrQ05wRyoITUhRvIno
	zDN5DE4/GrbonbWEwIBEoj6YqTCfDZFYhume+KtzbcU0BADwVb1+b51ZTiDlfvhOPqB8toxMI0R
	Af3OOgiFPC8LI5xQpJGT0ReWTGYFo8gb84QtbvfMwOcyV/3/PXdFr3F6+brzpXYHHuNI3XQ+oXB
	aq1G8jNIt0zlVTgEjF+ytBjwCW4qu1QBhk4btqlb4Du5dRDUOXwdn8=
X-Received: by 2002:a05:6a00:4148:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8a9ba7039admr14010835b3a.2.1793803275461;
        Wed, 04 Nov 2026 06:41:15 -0800 (PST)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe0dc0sm1107862b3a.1.2026.11.04.06.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:41:14 -0800 (PST)
Message-ID: <6aeb440a.36144473.14076b.5da3@mx.google.com>
Date: Wed, 04 Nov 2026 06:41:14 -0800 (PST)
From: Liang Haowen <nbg2974@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Griffin Kroah-Hartman <griffin@kroah.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: asus-aura-scsi: add CONFIG_SCSI_DH dependency
In-Reply-To: <20261104142415.676757-1-arnd@kernel.org>
References: <20261104142415.676757-1-arnd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 4 Nov 2026, Arnd Bergmann wrote:

> Without the device handler support, the driver fails to link:
>
> ERROR: modpost: drivers/leds/rgb/leds-asus-aura-scsi.ko: symbol 'scsi_regis=
ter_device_handler' undefined!
>
> Add a Kconfig dependency to only show the symbol if it can
> be enabled.

Correct, the handler registration lives under SCSI_DH, so the driver
cannot link without it. My Kconfig entry missed the dependency.

Acked-by: Liang Haowen <nbg2974@gmail.com>
