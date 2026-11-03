Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703568;
	b=x0pVf9mSROZE2rOlnQSSzvrx2K6YKMcA9TbabE6B7NF3VVYPOHxdQ8jhBvUudi4ozaq3
	 E6dhsauiRS68v7nBImpPHHz/RlGeSqfeO6SInBqtXWnHxnqW+AHrYVXmd4eE14BbKg21C
	 Ye/kCeFZquiCiafewnpcyV5uJ/YlWZtfvgFdpv2Q0b1ZBISsO3dcxZION8NHca7xaPjdR
	 XO0/jxxDyWCT3WpXu3XixxfJ8tqruD1ueLTzeGa0XV2WbsiVJk82TDZZgsUL9RBEVyovM
	 pkHX/ZKDFhPKdhsVRE3ZPAlhCp7mbdlnj6LL99z8e6EnGc0f3GvaDOk3Wz4YTJg3QYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703568;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=6b2TVz5RBdMTmkdnd0+DdIVBECbziA2iv145pJZ1Voo=;
	b=bKbak+Iro2/95fYnpTCnC/nHIVelIq2mOCsI/DMmCT1q313oexnsNa5wn1fojnQ5LaTY
	 7SKebRriFOWCrt8zbW78WBWPihFeXovvmhhcKiJ8EF7OYwMAHB0+dHZhXXZpZ9DtDQbnG
	 x7YNjgFzI4L3Ajno94yYJNolG0rSSP2jY//5JjUPV2jCLxxmt3zryAoVzAyDvpMiKCF69
	 PTLTad9c78pLqK6WKvz44LXs+fvqc+SqilKhvFYJro9riK9rzEULoHapl3Mm1jyohg38a
	 +JceCP3BfrB01rV/ZUIOee8ztBtujFqaHOI+mHoJSc9EzRRAUpF9YqycO++DjiDO7kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZCZJ+fI7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C3606FACB;
	Tue,  3 Nov 2026 10:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 486C3606FACB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ZCZJ+fI7
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 771D220103C;
	Tue, 03 Nov 2026 11:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b2TVz5RBdMTmkdnd0+DdIVBECbziA2iv145pJZ1Voo=;
	b=ZCZJ+fI7f/VO1TopNf3JRW/u2mE25GBHZNgWHLCWWQwyRf2LAChiJOhS3IL3abLErXZw/t
	sEqoW8lgtIN9JgPX0B9bwWEDYA1omA3HC+x3qoQBHtPXPaBcK+HnY6Hbu4BY3kXmZW3/D5
	79D1lDTlDVDudWBJThk+6kgcIoN+5dQ0EWM6w4xnTQOEitxCiz902XouEDZU7LgBqwhqxE
	05NZz+jTpG9xi6IwF+NQfmg4rurtmOFBEK0xbnXrWX3w3iZ50HyYK0Cu6djRUf+sun4Yiw
	NzbVvXoDXpF7q7ABo2YCvYk50o3tPZ5WGEwPkLO2KSJKsPUCRYB11k0LUtAsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b2TVz5RBdMTmkdnd0+DdIVBECbziA2iv145pJZ1Voo=;
	b=Aa+CYFkVPNRTO2wPfmTA19Uryvuya293TvNsuXefwpnDtChb/3qiuxYezASP/lnRmUgA9O
	9UMLAWmOPrrZneaiR+ZU5Yjo4Z724IxclK7n6vXPi8W3rOIHSwcOhCb6XyFf6UwQp1iOBB
	vbQRHCPhogjlC2+2WC1k9i+dPNGk5wN3zx0iRPVJuS3dc9W6aCPEugFN17EVEqccO92NHX
	+CreZkd7UQU+t1nOHws+hPNnmeARK9FD/MWtGjDY1N6zhkQ3w2tn9/i2i+FwV/ECzViBAO
	eCDhctfk8EipdHIknkCr026moY3eRvAXPlnsbVzWcDM1r0Np/GMh3H9VJoOU7g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793703565; a=rsa-sha256;
	cv=none;
	b=GrDTaT9qYC7XXPLYVBFmUIbVppj0VVtTIuWcxsIv6OlbI9KmoP0b/56JR6QTbHJ5DaABkY
	1y7w4z+qhdNiUmIxWkUIv7oe1pJTDVqlnqkZRm0VDV6Xabdfo0iT4WvBIecutBwp4qQNY4
	LhwE6K9ikmmb8S/feQ6I5Xp6Z8SghNX3J83bwGsmLulGkowJlBfrdVQ3dbJdCLJRGbf1G0
	ui/+YOcf0gbcPIxWHsG7fOf6WYmz1MTAUsAH1cxwwW6Yuf2Lxnj0u7MU5KH/ZVEyIlzxB5
	k1AmxMYzqnMytdFV44ZXX0402vI7n3X+n6+1f2E+1b/q2ZAyUyJ4NuHJhvNT1w==
Message-ID: <3b2e95430efce4822b232f5ba4a5007574de216d.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa
	 <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 03 Nov 2026 11:59:25 +0100
In-Reply-To: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
References: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
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

On Sa, 2026-10-03 at 22:50 +0200, Sven Peter wrote:
> Hi,
>=20
> The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
> reset inside the power manager that has to be deasserted before their
> co-processor can be booted. On t8103 and t8112 each port comes with a
> dedicated register page while t600x and t602x use a single register
> with one request bit per port shared by all ports of a die in the
> middle of the PMGR MMIO region.
>=20
> [...]

Partially applied to reset/test, thanks!

[1/3] dt-bindings: reset: Add Apple SoC CIO reset
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D5b428d8ecf10
[2/3] reset: Add Apple SoC CIO reset driver
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D6547df06b982

regards
Philipp
