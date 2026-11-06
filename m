Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978184;
	b=fFRr2oEPtvG/M1o4rLsSNWFqI3HXc2fp0WwF9utmRnkjrek7n6zdnJze67UHJrdNzoII
	 RKRVaa743n2jgJmQHvwphjUkTp/0qYjXkpn4SDtiYgyN034NXj6hG1POT0m0DU39/OqCi
	 YEgER/XfHUB8EOn5W8SWd2hJ1bYncGWIopH6Co7R8uetar53NRGo7LpLzJiGi3FWkep4g
	 gCUirRPgFVIu0qFIYf8vIqfv7bOu59NYp5pZV9Di0FcUTKlUf/Z5y4ku343bXB5irgYEw
	 TTHs4sV1zrW0aUd+gqe0ZLCJ26eyL0RlS5BGWnzbB6r/d/GgO14jDXeJK6D1sJGTBbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZBDIYs4Y0It7dcl6v419n3JeAweftEEfsMmrD17e+80=;
	b=i4Ocn4QGbr7DB+/hMqnBbBsxFTt/TxTcjb0hyKrTZIAz3s0W1bevVYbwJb4q604X6WqY
	 XgtX9KdXRhHfDQJqRf0Id4lLBlMQnxVd3MfXejolIMqfQ8glyGYBU3qDVJaDWp2RKNtHG
	 81HcUvoHsoVpXrOCajZtPSiokZt65SwDJztJ1MIBqULVhYj3hyF7+Ue/I3i/p/JmOwgQ1
	 CZ935Eez/zjpsPHXluAef5AfxqKm9jIDBMP0k79ZIVc+IeVhZx3kVhtE7ELKfDkpkTjPE
	 BNApr3pF3dMJLLQKJgslgWTIxtNIxgdq5+h91lHw96Qd1lnbf/UDi1Bc6qW1CyMzUxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxo8erlB;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2822606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2822606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxo8erlB
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6665055e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978182; x=1794582982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBDIYs4Y0It7dcl6v419n3JeAweftEEfsMmrD17e+80=;
        b=kxo8erlBylITXb38m1wEtnfEDV3x/yMaJ29j0q0YIFU/H5cyQrsqLj5K598Wy9weJQ
         A0DJbc4I/TN86jX1fGLlvJLWjkhURO4cOxuuAKH3apDJBtQTlXy2Qz4bO1avMzj8VPOf
         uUL7kHWf2fTP9uFyfKLeCspQFLGH1ANd+tisjKG+IgGewKu52tBELtyTjX66BlA+4FBj
         P4ys4PblaKABcVgEPv+IeHdWFIE/o3yZ0zqeQutuhpbbrCAV3N1kpXvFMBUL6v6aa0dT
         P0STpQnsN0JpWBIWLbxZUipI6nyhf6kzfxKIr0c7XQ0L7LcBGKJ1P3t8gjHWzHgYrEm/
         QYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978182; x=1794582982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBDIYs4Y0It7dcl6v419n3JeAweftEEfsMmrD17e+80=;
        b=RoZvJI9wkcI/00kXYsvBSYrGnMdz9F4Y7R8pKTMBJTNFdhHzajUBNmwc7YI10TipaQ
         FthNLYh6dTNCJmvd74YJnR/T1OCABzEbVJtYBhfUcm+1nxu5LPKo2gCpzPcGXeP23G0Q
         +KyqdhNwqyG1jtZLt/RIAy/VBKm/99oeEkSpIbMvbgh64J85JlW8wlJvz8a9AlPg3TMY
         Y+uO/eupp2UYRV6/sx9WIAffUhlhdJcQ8U4CwxDwa45YbZ5m1zQrE3mw9NqR+moprW+1
         ycEgf2kqXgXAb+m/RLyarwt3gak8MccuubGv8fEEjTiRrHPEeB9fhkizO7J0fuOYCaxo
         Vf/w==
X-Forwarded-Encrypted: i=1; AKwUvBw8snqIcmI+wrTLdVa0K916/5gZPRTEg6qkqQJcqtf/zmrA+V1Y32cN0xvCA7Ic0jmpqYQAP2rbvqeq2bs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YKkHjU4kdWOS3tNSaQdWvQjLi8g7Wy7WfnfZzoJkh15yW0z3R
	IJiVMT//uF9zMPdRJtXKZcYXf50enUBJLEJ1wy9psXxCrQGkIuUFsIH+
X-Gm-Gg: AYBFou0FQ9PQ3XF+KcbrTMX8JsWZ+qBmU1LHiEttH2QQzeG5/ZpNJ23rF+N3tf3HBN2
	zugG/ZPY7wgQtXdcrsO3kjosk1YhqGXz91hnyZXsuQKnn/fVjMaN7yvh9+siQyB3JYQJrgNiPba
	nJCzvUYSsvXWcO9eyRBJgh1SHKRDz7KF/0D8u8UyaKIgMrbmXUqsBK3q4Fjt0/D76GvinRmddHD
	2X5HDnEhHAWF8WaBRVP7BGTV8sBgd/amrgsj062fcSfaecq8PkABEy+xqz2Yea0b1o9uGhTsog/
	VxGhu71I9Yzso/vQKZoODeTJX3SU3t3ncD8tE4RNE3rvYPqkSvEcbKoIRK/zXOztRX2NV5058G6
	/LkILY61HhEllFjk1KBHEJRLizoeCxII2dYgxOZtMJNSBJ7OTR0uzck9CXfkgXmuLlRXnOfCJkL
	sFtwphdeBL5lJ9snyli6oN0OBRYq12cpsUpbWjhb7J6QWVVwUX+8N68DnnEQ8dC+jeac2JzFXdp
	7AFY30wRpMYPWo5kSrs+X90tb5obDCr9TYeHs4MlSz3+CVCUqQzMAjzIJCAHQrJfCA+TFid0lNw
	l3nExD/NR2mXh3iR8Uu7Tn7lPMlnfG6ZUw8tg3HHOpqZLCCcgj5hGDyRe5dLE719N7GTawb4fqn
	fKlBqpOdbu8cL3byLJKdGIDRYBlp88sKPc2zoWyKYjmiRIdmhEzyx5hCvD2rn
X-Received: by 2002:a05:600c:8509:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4b6e091f195mr44253705e9.34.1793978182055;
        Fri, 06 Nov 2026 07:16:22 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm4124688f8f.47.2026.11.06.07.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:21 -0800 (PST)
Date: Fri, 6 Nov 2026 16:16:19 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	luan.r@variscite.com, alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 0/3] serial: Support driver-selected TTY wakeup
 defaults
Message-ID: <au3vQ7sSi6O3_hqv@Lord-Beerus.station>
References: <cover.1793719239.git.stefano.r@variscite.com>
 <au3diCrF5jPYH4Tu@hovoldconsulting.com>
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
In-Reply-To: <au3diCrF5jPYH4Tu@hovoldconsulting.com>

On Fri, Nov 06, 2026 at 03:00:40PM +0100, Johan Hovold wrote:
> On Tue, Nov 03, 2026 at 04:51:24PM +0100, Stefano Radaelli wrote:
> > The initial goal was to enable TTY wakeup by default on NXP LPUART ports
> > marked with wakeup-source, without requiring a userspace write. Instead
> > of keeping this entirely within fsl_lpuart, this series introduces a
> > common serial core mechanism that other UART drivers can also adopt.
> > 
> > The new tty_wakeup_default field in struct uart_port lets a driver request
> > wakeup to be enabled when its TTY device is registered. Each driver
> > decides whether to use it. This series adds wakeup-source to the LPUART
> > binding and makes fsl_lpuart the first user, setting the field from that
> > property. Other drivers retain their existing behavior, userspace can
> > still change power/wakeup, and serdev wakeup policy is unchanged.
> 
> This is a policy decision that should be left for userspace, not
> individual drivers. As documented in
> Documentation/driver-api/pm/devices.rst:
> 
> 	The initial value in the :file:`power/wakeup` file is "disabled"
> 	for the majority of devices; the major exceptions are power
> 	buttons, keyboards, and Ethernet adapters whose WoL
> 	(wake-on-LAN) feature has been set up with ethtool.
> 
> So no, this doesn't look like something we want. You should continue
> enabling wakeup from userspace on systems that need it instead.
> 
> Note that the "wakeup-source" devicetree attribute also describes
> capability, not policy:
> 
> 	Documentation/devicetree/bindings/power/wakeup-source.txt
> 
Hi Johan,

Understood, thanks for clarifying.
I incorrectly treated wakeup-source as a request to enable wakeup by default,
rather than as a capability description.
I will drop this series and keep wakeup enablement in userspace.

Thank you,
Best Regards,
Stefano
