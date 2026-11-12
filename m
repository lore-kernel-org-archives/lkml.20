Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794492424;
	b=SJrZDwq6C9I8HQu6eG25hKU8l255TWDQehqAhK00cln6YUgYHDqUGIyOw+lCAbdLSXc9
	 Lf9RA2LSGcZYs/dxSNc6RX9dzmqNrh7PsB2PK0EczIZ24x9CEYE7eKkf5gObn/EmH5y15
	 UVi9WQn56Tg0sYLZXMWRYHWO42RnH3fpYZ+eLOx3gBySn1dx6sdKNdK+oXEXPx9XjZdGw
	 EjVQAc6WR0kkM3D6G/6rHhIVhlbKVyb/9itWGioOd7CACnmG+CH7RV5gPks0GrSCdy+rD
	 5oAmwPYROy0NlJ5bxJ5Hh20exAeOJsi44AdGtKzWnHBBdxszTPHucBSuyxpZ5+0Tqcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492424;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=c2nV8waXvaFpo0M8AiTOHGTsxqmSzLegI12I30+rFUs=;
	b=068u9a4vNIju0/+FZb1Q9ZM0eOmoBZS3WmhoG9h1g8aQhjJqiNxHo3VpTPhFPkgQ1QpL
	 6HN3iNUty3PCoJCM8z9l6G2DSXKHhLp5jhJ2ikb+OsdD8+qFmU+GJJkpCICb8eAiNno/9
	 WfFCc+oiS//j3kJ6ZLTOxnMZLZl5reysRl7nyUxH4hOZuk6WBd7Ws9BR3HsvsNHF3ggQv
	 /hTsSePTmbAzIQYmxbc81W2xC6jLSH3FXVjyf6ynkE5KqQOzrRERyG+qkI8ij9pcPodSf
	 QuYpKCo7GitazdqZbw+bWLNJA17gBihjjpiu12PFqq8TSFzB3WTCaVnaWJtl47FT6Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kb9r2xBZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12F606A8AF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E12F606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kb9r2xBZ
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D3F0220227C;
	Thu, 12 Nov 2026 15:06:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794492410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2nV8waXvaFpo0M8AiTOHGTsxqmSzLegI12I30+rFUs=;
	b=Kb9r2xBZpFmAXEj92zia/ZMTBD/9lzUm5uhm+qGTj0Vj9TApd8xQBM/sOKMJhpxqx948Wj
	wmPVTkTPyiVuFEnzULWg5n1VkXlGbfhQiJcglO5vH+UYjYLLI+MyLrmnLh1d0ghuIIb0kV
	V9t8ypd6VLCA9+1THbf6aPfWJkMsvEL9ucYwa/N5/W4bdttdP3yUP7WJmQ+06Wry2SU5Y1
	JISYyxKzT8sCqhPN4JZsW44IR1uF+vUtLyT6KfzD/ocF9Xsz9ntgtfJOZIa8RYU99E/7Q0
	QDamfaDdqpL+oszgauPbwpyYK5ArFONSVlMEY8xnI1Qf6BGojJfWzwYtfpNfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794492410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2nV8waXvaFpo0M8AiTOHGTsxqmSzLegI12I30+rFUs=;
	b=f89lpDzW3LIYReOYcD0FHjU2VKlX4WNSRvCzDDeDxv7Dfm2Cz/YejUnWUmJuHWTndoY637
	1mhow7P3JCWWlsNI4h9Z2C94S93RIjnRguAKBr/gqzWttK06eMCyaYJYpWJI4OZlRObAap
	+hYhPWWGoJpkGYm8j2wBSLGBbnAtPZjuek1m1R4bzqYaZkfxahLnuUNTu/qpNKdKG5cAZt
	gJACagI4lYUqiDESaccOQiYmJoL5AwhNhHjd6K1zeP2irKhuo/iW/ldfhf8vsxCLXyTHYC
	3s0iShyY6bLlz8X52n5eYw24d0Lkf6ytunISa+hfv3KONUWfqA8d67Pi73StEg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794492410; a=rsa-sha256;
	cv=none;
	b=F350MHBF/AKuWlPOR9h+HHLOsvF3j0OhW6vkCCkVsncg/RP1iay56sPX5e0H0l+coSkPcW
	0hY+zvlYdyEhxK9zdZzmJCQL4HnsrkkufoP9muPFrAkgzdoUVf0sK+8V6MjnwAkGrbixtX
	Ty3tYNruVcz6uX4+20/Pcc20u0DzbO0yJEj333UmldJsthi3eGPegs5Vvj6lZlvBBOO95E
	4PEFrZUzlZSKRgHZNgEp0oIY2u6JvzHKfRN+sWZGf1chMclWtljwX/BNb+/KAzEn0qaT0o
	mTlBWnjTE3tzC+lKsDIx2CoE15PATg0Kp7lnEoKZPjlJmisRB5cqGMaw9Bgxdw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <311c2e8ebfb3a35decce587b5d424046d6581539.camel@pengutronix.de>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: add power sequencing
 dependency
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney@redhat.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Xuyang Dong
 <dongxuyang@eswincomputing.com>, Drew Fustini	 <fustini@kernel.org>, Junhui
 Liu <junhui.liu@pigmoral.tech>, Guodong Xu	 <guodong.xu@linux.dev>, Joakim
 Zhang <joakim.zhang@cixtech.com>, Anirudh Srinivasan
 <asrinivasan@oss.tenstorrent.com>, Sven Peter <sven@kernel.org>, 
 =?ISO-8859-1?Q?Beno=EEt?= Monin	 <benoit.monin@bootlin.com>, Robert Marko
 <robert.marko@sartura.hr>, 	linux-kernel@vger.kernel.org
Date: Thu, 12 Nov 2026 15:06:50 +0100
In-Reply-To: <20261112133210.3004176-1-arnd@kernel.org>
References: <20261112133210.3004176-1-arnd@kernel.org>
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

On Do, 2026-11-12 at 14:32 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The dependency on CONFIG_POWER_SEQUENCING is ignored when
> ARCH_RZG2L is enabled, and this can lead to a build failure
> when power sequencing is in a loadable module but the
> reset driver is built-in:
>=20
> drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function `rzg2l_usbphy_ctrl_s=
uspend':
> reset-rzg2l-usbphy-ctrl.c:(.text+0x21c): undefined reference to `pwrseq_d=
isable'
>=20
> Change the dependency to always depend on the power sequencing
> interface.
>=20
> Fixes: 5ca65d048910 ("reset: rzg2l-usbphy-ctrl: Add RZ/G3L support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
