Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192105;
	b=ymjfQGEW/ptjr+SCDFhBUkridqPqEgf61cS8wrp5fKiaDBdoHVp1EodzeimAouOSHGBn
	 jjABjGYlwdsV+uFBr5lh8fJ0/1izGqsYph9PMfFCs4Gbz4H4aCDJBA/EYLJP/K4YYuJ7c
	 Towg7+tPmdkqvv2PLegC8P8AE3wIrnZaxbc9NzubiQfDSHMLk6+mDadjURKLJ4/s5tJAg
	 6Jx45/Osb2czjbZIwQSEFNiqK6MDntK8d8FZ1TbFu/z+SXUhf6/Prp/IhdipvET+KkMoT
	 ZKq/Z2U4xP57N+8CFTRqoRHu3h2YnsMlX30Q3zUStGTojAQOGihBgmkLtqIn3YgFxkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192105;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=OjFjDEv6r6cygeke1RGOx0xnQni07udazDvq2kGmw6Q=;
	b=S6PHHeU0JC+U7hSUIrYZVtFCVpvAkjRAy/03C6lHPMLryg5sxftxOnSTT5fL4669EaeH
	 ixmcyzpR6wE79MZZoZZcYGT+qyNBMsk4y/6K5kP1FQGDjKEn9cOBmqgnA18r8Zh0YUnVT
	 gN8ToeFG8+xGSQKYDnX77fW6Qzqx6RNVd1/h2l5XrbnBf3xmPZe+2DL8n0JylDrn7i0bf
	 YRdLY1DGGOdHULZvb4kvFL0Tj4unoJ3XPihnKChdKl+yEAPr0bwDSFsczq4zofTF4xeXy
	 0TMuaaZqEYOpdtPtpHDq3Se4livEDeaknNCE+kUpmVmUuXcV+NcFIPklvw7fqDIxeuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DAcUw3xM;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C5606A326;
	Mon,  9 Nov 2026 02:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DAcUw3xM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794192096;
	bh=OjFjDEv6r6cygeke1RGOx0xnQni07udazDvq2kGmw6Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DAcUw3xMa4qeJC1vFRGVhhYj1tSb0WLQ9EQbRR5f/o0vdPPNqQcoYpE6ZxBhUNULY
	 5KF9zDQuoC3MtcxEayVxCfq1VRXVOQ0KjPMcz8+YhPW6Imo/0M8F4XV3irgDTvme+1
	 7rvC/x+hNTHcp27znFou+cqgG8H67smYgDZjU78Ru8Iwh+p66c9XP47tn7yTyJLsXG
	 Xfj1g+3owQrm6MHyrwM/9BvS7f1oqMQ/HtM7BsvyDNyNvcoxe8+rPZWIhzmwxhVxGH
	 H0qrLlvfZTgwu+4d1D/eAOv63vQNgL8gqIilCnN5c3r0j72WQrOlk+p+QZ3HxO/sUf
	 xHvau8a+rWNoQ==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F2FBE64952;
	Mon,  9 Nov 2026 10:41:32 +0800 (AWST)
Message-ID: <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and
 GPIO line names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	 <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 09 Nov 2026 13:11:31 +1030
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 11:08 +0800, Kyle Hsieh wrote:
> This series is a follow-up to the Ventura2 devicetree.
>=20
> Patch 1 describes the three LTC2305 ADCs fitted on Ventura2 and exposes
> the valve voltages read by the bus 3 ADCs through iio-hwmon.
>=20
> The LTC2305 ADCs use their internal 4.096V reference, so no vref-supply
> is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
> ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
> dtbs_check reports a missing vref-supply for the LTC2305 nodes.

Can you provide a link to this patch? I am yet to find it on lore.

>=20
> Patch 2 names the presence detect GPIO of the optional COM Express
> module so userspace can determine whether the module is present.
>=20
> Patch 3 names the reset GPIOs of the three USB-to-UART bridges so
> userspace can reset the bridges.

This isn't so much a summary as something self-evident from looking at
the contained patches.

In my opinion what you write here should identify broad patterns across
the patch series (perhaps how you've grouped the patches and why, if
necessary) and not rehash the commit messages.

Andrew
