Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920679;
	b=uTexaVbO0ORdvIHYeH+M8nAQW6LpHfkOwV7k5aqYVpdYts5woPR/vrGVhJsJFFs1PKhx
	 hOovaSqUOJByHiGRZY9sg75FDss8n7huj2v5vuyD4yc4gVAMa+WfU89hCNZUbSuKCeqof
	 UV2Zk3WiA0CAkWeDNgEAaP1wLoEv0DUXGXg9fnvQWEVhrW/N+cyMHLZRIucVWkhNSf6kZ
	 kttNBUZA+unA45kbsqLBJgJ9Qs/EWTQIjSVlifRwv/66XCkVRqwmIHs5Ckza90jw+or4K
	 2rhy8dpzwZ31W3Gyx+HemRANPQQIZmetYiCPqMXDNxjJWt+hDPzfqBcTJdrsZgLZNdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920679;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=1mVJ+IOGvZs3+RW9SaqfOzie49O+ezTdrW272wWwJeI=;
	b=Xb/eWZMqZrd6dVxcRSIHRmFTHb6tXHrbNP4CdV0d5cmB/gvvNachiJPs5WoS7HoolcKG
	 iH1w1NsBTFqt87/BzTkXqvmF3BxJqIjvalCkBT5O/lLt0UUYI/Wwbkjk2V2nxVcK/4AB5
	 /4B/c1zvAmL//iUazeaXSQcMBMReiohTvDYMO4QJ8NmR+E+4n4hRcji/0ZmJXEcwxWQqi
	 hnJRrCwAiF4NhyTrBybpnrxEKDsfcFmH7nEWGt/VW9hMDoo3JftmoKNyEumOqI+zqSP53
	 qIFg0xmXW7iQa9rdSK1nII9uba1Dg5kR+lS/k3oBedZSGCfzAvRwYVw1hBB+zm9kzRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=VbhjxJqF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8079606A329;
	Tue, 17 Nov 2026 13:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8079606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=VbhjxJqF
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EF8DE205A36;
	Tue, 17 Nov 2026 14:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mVJ+IOGvZs3+RW9SaqfOzie49O+ezTdrW272wWwJeI=;
	b=VbhjxJqF3tBP20+4AIz4x4IqLigrnrktRbZfzx17lBK073CVeHbRbaif/7onfvnqo4dUzR
	kKx9vYxioKLURYqr27x9J4ZZv4tPuSvWpxRP1voPDPAzo+Uz05Zf9ZiKpdHqqMV0DAjs7K
	RJTP80kW8ROu/C9R9jN3P5SUot3QWkA08bMyW2vHRZhYra+m4gToOxquE1FI+HcLClyNEb
	QIgAwP1qHJMi5t/Qc3lyTROmjVIHg8+O+XcE7aXnJxR1dYzy2m2ykwGsIR/mLTEnHiDvkt
	xiQH4d4csXoEriLVOxce8WmtPcrCmlP+1KLtvfDfgMoI9gI9V7AjfGkjKwsUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mVJ+IOGvZs3+RW9SaqfOzie49O+ezTdrW272wWwJeI=;
	b=RvGMQVboS2UQnCQfvoFUciRlrD127ZGmirGjnVOXquq72Y9+0uWWFaVSllJWxR0Aa1x/oI
	wC9/D3PVhpW5zFPzxu9l456WanvKR5OChT/5x4j6rVXugy7DkDX144mXLxWwdbfvo7UrPF
	XOK71AGdNPw5Mw1DdvrGf2LkbfTzWeVAWNE8g9F6xD8Fluw3vkwB9jLdcScGUmnSIveVej
	p8fdzzSBez3bKdtX967EY46Su5kIAWqI2l2O9H9Zg9eKR4WNKEKlFBSMF5fUEOa509Lt1Z
	9PNjyMo+Qri7hNXoBvz+bLvS1PzVvTp113rHAKjksUb/2Y5sjFUlfsKp6vtS7g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920677; a=rsa-sha256;
	cv=none;
	b=DetY+6izSOzw5Au7wA4sVtzqFY15Vb6NSJrID3yPpz6Vvf8OviOy+HnXABXrdlOk3jxlsN
	y/mfZXtdzIW9VccH7BFCmVXbv8gjnI3B0rYFjQAbs1BtTwJ4FXVJBJZV9DqcAiIrTznsfc
	8aO6ME23YPPjEoi8ywTceODZ9hlNHhlIybokf2px3upUSo348XO5WM8LPoIVPklYaZ4jja
	30KV0z7dS41+orMx3zCBG/vTdeEBVtAnAACidMxt5AV07P35HqqJIKjc4ELXzJYbb7z8Z5
	nrAdk/aQGpf5elSPN9B8qKB37rTYp9oVVTm1Fx17aI0DzyycRf7J6LNz2hPQRQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <614eaf9d3529797eaa6825e3c2226c4e9cf34234.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] usb/phy: sunxi: Assert reset before deasserting on
 init
From: Philipp Zabel <p.zabel@pengutronix.de>
To: admin@roadbobek.com, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Vinod Koul	 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Date: Tue, 17 Nov 2026 14:04:36 +0100
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
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

On Di, 2026-11-17 at 13:00 +0000, Roadbobek via B4 Relay wrote:
> When a bootloader such as U-Boot (for example with
> CONFIG_USB_MUSB_HOST=3Dy) initializes USB host mode and boots Linux
> without stopping USB first, both the MUSB controller and USB0 PHY
> reset lines are already deasserted when Linux probes them.
>=20
> Because reset_control_deassert() alone is a no-op on an already
> deasserted reset line, stale hardware register state persists across
> boot. On Allwinner A33, MUSB stays wedged in a_wait_bcon with
> DevCtl=3D0x99, Power=3D0xf0, and a frozen Frame counter even across
> hot-unplug and replug.
>=20
> This two-patch series briefly asserts reset before deasserting it in
> both drivers so USB starts cleanly regardless of prior bootloader state:
>=20
> - Patch 1 asserts glue->rst in sunxi_musb_init().
> - Patch 2 asserts phy->reset in sun4i_usb_phy_init().

While you are at it, could you also replace the
devm_reset_control_get() calls with devm_reset_control_get_exclusive(),
to make it clear the driver requires exclusive access to assert the
resets?

regards
Philipp
