Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794914174;
	b=pWEYg/y40IvZ1L/4T70z4w9CA4h7r3lGHL+qtPuLzGIbZpWMhtbnt8ZmDm5sz7V/pzCM
	 IbwOFm21v74P6eIczmhcszfCnjMskfTCe9thOaF9TmCMJ0xICrBq918Ox7wEIfxiiMG46
	 e+aRS7juNtoNAykzgdNXl5RR0FWRS7qae+hlf6lWeY6qw1Wu/dl1FCLTaJUmUUZNnTTtA
	 l4ebeMwsqWY06PhM5cxa3M+qkVr4B5VTUW59TRAFAJWvXFB0+565xkkEiIFrCO1wxVjss
	 JmwO2Bpf3g8Ivry9JXioCtTQv8w6ssUBSV9AoF63wChTuxy08yuv9CpkXwVp5HPsxCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914174;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=XQnFS6mscVdKFv/wz+t4a1SX3rV0MI1PwhYts/rkw90=;
	b=4T4ns/gf04MRHGXJOZBZDhTgLAfv2rmTdjOkob2OewagFN6N2WjS1VKRZ8M9Ow4DlySd
	 s2F2qU/Y8LPz9CJDSSSazUUs/ZEbEBAkc2YkUgxhapOyyISRln01F1pZH67vBlfLr8jEw
	 ssH2utc+/mm0scocAAYnXvNBcfIk+C8GIy2X398QjGaTUpmehP0eo91zXCQZf+m5D6mLC
	 ra0W5Ta8SFks6LZbMQiW3dfzIuDQvI5Hu/aMWzrlUA1WvuUI55rsSLGkgS9KyyKIu+7vD
	 XNY/wZ2JvhsBC7XdwIF8ipcI5Czgn3avaZrFZuhGx+vgabJRUA6HGC54YNuHa6FuEug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CdKUAUSm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE86606A329;
	Tue, 17 Nov 2026 11:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE86606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CdKUAUSm
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5541B205A36;
	Tue, 17 Nov 2026 12:16:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794914171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQnFS6mscVdKFv/wz+t4a1SX3rV0MI1PwhYts/rkw90=;
	b=CdKUAUSmNxTOw1IaS8HkYsFHYApXR2MbTnN9CaWpMge98xW7Xhk4tRWUoIe809vCH8W/vA
	lhOFxWoHaDqWxbIwyIUR9JXBZEIi6RmOyMP7GND3ri9nn3pjfZF/ExEgwTa/cUanOqofsi
	DMSFVMJ1NsgVrk3CQdNtnuHYgzuuzBPSdiSXW7RixhEhjwYg77XHUzCLI7AuGRTqkfGBqJ
	M3of13q14F/HsaY4dHT/CYY0l8mshMs8hhsHyfob0f9r8/EOdHwX8WyIvz51CzIKTTGRkr
	3aUlO6V+SPzt5G1X2ibXMsDLgL8DhTz6zJ6D+uefCpa147sDfDXboYKHLW1SPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794914171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQnFS6mscVdKFv/wz+t4a1SX3rV0MI1PwhYts/rkw90=;
	b=VuoCdtiWHF/TVQTK5bFCPkgt0usZdQQIy4NeWIAim68vBtdim/GftcIVzuqi0aM5G4Xne9
	FH6F2G7PONlPSiDHwx68TSN1vhGusZ8NGWUFS1FuJmitVyhI8C2LYiqPk2+7MUlTcXwwSx
	H8GtLV98Fz4xXwmLglatykTBdGBPzbw5PZDkAnhNf7UlkRpf8tee4RiwNLdH5xWrA0s5vz
	gaISL1ltvnvi+bDk7LOkOiOEOd7PYsmcIB86FE0Bv44P46AZ0IIdzByx5cm0pP4v7GUc1D
	M0rrCuJw+CGQtH+SnSz0aRfP/ihQw7NRksLL0vhE6KzTjhnhkK4cUIeZi61x7g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794914171; a=rsa-sha256;
	cv=none;
	b=ShLCdOaaDAHp9Ny3fQv46zv7amkzhGI0d/7pDk+yUCi7wu1uYScHzRSO2NFhbjudbZBC9x
	/LMRpu0moBV3OjV7WCpIsTyPsjvDFQrB6gHbASBbmVS9XxVLbZhU/EJBXX/qNL30Ua7dsm
	IzA30O4rYMOslvgOKepb/dVHKIenRUlh93eu8uhffLR/NNKOSuQ1hQMCuInnqsxsIfsg1G
	lfCq7Vbp0PNXBPBmUAQJm/cCnFWseJ+5Whtn8yAnaSjOMMPDOjw6gDSQY9g9aiacbu8ss0
	WZQO6VgQgCxSukM5M2SeR6v0AWl4Tyh7w92CmCl9l1O+s8Ij5Ket9EZZs+W8+Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <33d3c07740e4702da3a1831415de906e940a0ae6.camel@pengutronix.de>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Permit disabling
 POWER_SEQUENCING again
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann
 <arnd@arndb.de>,  Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 12:16:11 +0100
In-Reply-To: <0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be>
References: 
	<0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be>
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

On Di, 2026-11-17 at 12:13 +0100, Geert Uytterhoeven wrote:
> The power sequencing part is optional, and only needed on RZ/G3L
> (SYSC_R9A08G046 selects POWER_SEQUENCING).  Users of other members in
> the RZ/G2L family may want to enable this driver built-in, while keeping
> POWER_SEQUENCING disabled.
>=20
> Fixes: eac3b292a26e2210 ("reset: rzg2l-usbphy-ctrl: add power sequencing =
dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
