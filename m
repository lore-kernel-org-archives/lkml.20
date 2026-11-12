Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794476472;
	b=T5mlYKllEWNeFM6EJpOPsNq0x6t899uvbkthefyTAGHy0nVdamFZ/Yhdm2+tqTtRrwXr
	 7DakC7kyHgRDGGhlkzrvfzxLenI+Bcqaa1TWp2VRqhhWT8hjWG4EAoVBbD0QtpsDOutaw
	 rjeYi1sOdWRoA23NO3HkSuTRgeDjc/wpjOCU/nxSPW8d1F7BbLpo14XggZGoGlhAgUb4H
	 RI2zs7CoCVg8TMW4Y09ITsK+IKpK351AtRdPvPTBY87cVdO7QebQ1PtpnOFitkock8PG9
	 JxTKCAQEIBSry2j9+OZKRkVt3GPXTDm9d/X2m8F/K8OEPuGFPXivITteBQPI2EkRZXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476472;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=yISozrj+A0wzmBkiiJY/l46C1xVtCcnva6CW5NcMTdc=;
	b=5gOlbvOSvAx/BDjJeqyD244OqQQuBhZyknwDpcohecncAomxoYJ/A2CpCKOMWQRR5BVh
	 UcP53u5T1jcdT/Aa5BNjLJlcLehsr8qqBaSZBB2hC5Xr83G86NFkPHlfKZWj6wB8LsiNz
	 fEwvIlWqVIzT7TIihXi6H+bMp41h2Qt/mwSnvhOH49kxUF40Rm8zn6eZSitdX28uF5bpJ
	 iE0Fdb/0DlvUnJqDJ2IQ+mr5GNlPnjNoPHH23jdKhJWBt+g2CljzyWAWH7WD8lkdQ8Kyp
	 UFAYzi/Q9VcUkOHjz4+JpcTXC8vSNJF/LHhs0bR5EX7dmKrmY9kP/4/JUOQK2guYuDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NwsLTIFD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65DF606A880;
	Thu, 12 Nov 2026 09:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65DF606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NwsLTIFD
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C2DF02004B4;
	Thu, 12 Nov 2026 10:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794476469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yISozrj+A0wzmBkiiJY/l46C1xVtCcnva6CW5NcMTdc=;
	b=NwsLTIFDUeGQVvRTMLltEWNbkWvAqrfObrOFGN+YB04qsdCPtXasemQqoa0OytLhi32yPb
	vgYEIjjP9yfYeftU0iNCCI7FQTXF67BBA7NI3uUNBx6q7H7Ig9Bf2idEnbI4zgjWy8Y0QJ
	WG3nRK9CvbsAntCiO8nSKTEC5pHjKRl2x0oRBNEdJQh2/wrDecw3HJU52xs3XNZlAgPtPn
	wyy6V9hUqdbkeayO/sBkiSjZNbXi73SpiV9aGa8FvlWA2yIjIzoR3Ajx9NAJqVqY07zEMv
	t0fZ/O+VtT919VBf9oSnqRp+qpPw18vrNS4kkw4R97Trpsn2+VdG9M6uJf7TfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794476469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yISozrj+A0wzmBkiiJY/l46C1xVtCcnva6CW5NcMTdc=;
	b=B78BM9Xq5P5Z4ujzs8tSkYDqZreQ2KhzdTLPslZRgkbBfqiqMTeFBlmgZSThRy5o7HPqh2
	kwts64W9yAMqSkd7UZ/Zhl5nXC2txVjXtOmrm84Kpha6lmkkm6cGlCUjzK3QBWvCQ8jt8u
	+gj3CQg5VNjedi2Nhvz+3rAG4ixINt4r9OuCqBLUespGH05lWr0yrmT963afivu4IWcDM9
	l1LzBWRTYzUnpG2ly1AlLCFY2MhIa90/DV6Ki83ep9dzdBARhCqnLrg1V+Q1My4UDWlqQ2
	SK0Jhr2X4ABgHgfM2S4mxs5zz+LdL1A0eWwCqU3kzFvEcSqLmNJCdF9NZPfcvQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794476469; a=rsa-sha256;
	cv=none;
	b=V82bDT0XT/6whKCweLVsLjge9FUsw2jQdsb28W32LsTcpDCmyJhRyZP7ChSEZATWTo812Y
	+hn6KJ82hJpzoQgoFi02ozGk3EqtUPZY291DHaktJWvCM2K4xQJMT91+iQNldr0Gmptdve
	bGX2eHDh3ZpAYn/pkAjmRbZ5zYX1xUVQIiM31lLtSePuERiycs6Vfm76I3e0LtQT/LkyEL
	zrDvKQGG54JFkW9ZGbjIHWkh8ptQ7cO8Iys3Vnv5hckYQa3lK4P1iqBxdwIyyUpwHhGLtV
	a1EmU6ukboR1QV7DqAuAOiQbi3JpqTrjazGOB4Hv/yjzCvJ2rAlNWLiOAlPUMQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <1e434e5ab047b503e02e9ed9f3eb0aeb173d5602.camel@pengutronix.de>
Subject: Re: [PATCH v16 0/3] reset: realtek: Add RTD1625 reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, cylee12@realtek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com
Date: Thu, 12 Nov 2026 10:41:09 +0100
In-Reply-To: <20261112053128.561149-1-eleanor.lin@realtek.com>
References: <20261112053128.561149-1-eleanor.lin@realtek.com>
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

On Do, 2026-11-12 at 13:31 +0800, Yu-Chun Lin wrote:
> Hi all,
>=20
> This series adds reset controller support for the Realtek RTD1625 SoC.
>=20
> Since the reset and clock controllers share the same register space, they
> are now decoupled via the Auxiliary Bus framework. This allows the reset
> drivers to be submitted as a separate series.
>=20
> [...]

Applied to reset/next, thanks!

[1/3] dt-bindings: reset: Add Realtek RTD1625 reset IDs
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D3b8e9b3eebd5
[2/3] reset: Add Realtek basic reset support
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D9d125752e1a1
[3/3] reset: realtek: Add RTD1625 reset controller driver
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D2716aec8c63a

regards
Philipp
