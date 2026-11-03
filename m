Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703959;
	b=uQJhORlOFvi9PrQQTc+mP1FSZPHXaaLB7N86ZHWq04d+f+yDt81APyfeDjoVY5Yr5V30
	 1RBbIk+tSvodnkwlPK2CDln1Hl1BRS8LNPrwanePPbOJavV2PT79e8ylfKA8l810cp9qb
	 XZ+NDWmpwizw9gGXKsEVuOXGWSohXHYyxTnJ2TU5tshStqPTbED9MhMlXGWWCrfxJM0i+
	 Wo3Kyats2ZgqE19AACA3cysdNXskcTYB3UUGQL4p03b/Uv5f0eQSUvOeL1OHD+21wPGiy
	 8MXQImCn7LtOYHU5ygAJkTfYaiFTpvW4IpJRZJJG7QumztioXhjqezRGU6xwfYjpEQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703959;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=E6xFmup/yEIZ1IuqulqlA5h3vJoc+lm2TD8ofRNf4dQ=;
	b=IhY2pq1XyuGWnekLQWjyVD2u9BMJBmF4TOQaBwvdB/+1yfTW4DE2IPMiGYty0Jj+OXQZ
	 IX/fRkzNEES7DQ1QwtXB/OcO1TkaAFowbxjybAGGGMmfDERouCUqQRpQz0sp957jnsGAC
	 fd8BYw70o7HJZCar4QFQ2x2u/FuGVJiruZmLX6kYSPFpesOcZl858MHQLpPl1oZUv83D4
	 okU/BkVrudFnBBkKpV89yhxVgtOp8F/hoTAKHrUGkp95/MjZSwVlKASxnlbh+kauta3t0
	 uiChr8TvxLCEHp14hOsqZgPkavGt4SeXLMRYd1DZvE3xkeIvfq3e7OIn/50WSDTpfYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f0ilioRu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1410606C594;
	Tue,  3 Nov 2026 11:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1410606C594
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f0ilioRu
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3D7BF2000E3;
	Tue, 03 Nov 2026 12:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6xFmup/yEIZ1IuqulqlA5h3vJoc+lm2TD8ofRNf4dQ=;
	b=f0ilioRuHsoTFeMVBSTMzFjf0TrYX3nbs/cQMUGevP+JAdNnlcAKATNX+1pbZT/wO1DUzr
	h/yqoyfsY/U45pqr/DiAgCyoKNJHKMp8wi//MmJxQNvXEWHHNusvwbO2SZ0Dax/R9Am4mB
	35B7Xmzg3uFXGKoHtKwykMTePNKV9Vj9/9iYVVeURPGeZVRYRlYgUcXUXohERSJoY5V7LR
	a/2004Ny9V9o2kDz9NvA1HNXSguJj2LLNJp6uIcaI6cPhZGVoF49FPLYkV5PG1Fv4wsBsu
	XelurssC/5E/f75Gw3XfZHAO1Pu9e/a2/nqhneEZXze6RAirTuv4xJnSDswAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6xFmup/yEIZ1IuqulqlA5h3vJoc+lm2TD8ofRNf4dQ=;
	b=ClsgWvFEBdQYxawQOm6oE3Q3WKpAXx8s00g8y/lkwVgJlAoPdnPC+YNbygs27zNmiYysRF
	X7JFUBuW4uOidF1dPkeI9vpoAir3hz0UI/YICsIekCm+qEepyUsoMiRmFdJgZJ+rQUldt3
	q7HkyvB8GPkYTKsnZZq/gKiiU5xgan20R8ZzZH9SqMVEGZSWk9rNQMtd2oUQ4a58tZQZfG
	9Aj6dLOB40g96murxDZEjCBbb5OfeTiZeU2mf5abm293lSh5eutDFBmvWWrenqQ54iUp95
	GvrJxuE0LoGh5p/x80L7ic6mCXhQssC6et+ZT8noePxISzTXiwnk2+A455w9Xw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793703957; a=rsa-sha256;
	cv=none;
	b=H7HEh51TVoJsiKXPx5iNOrI8dZoM90QPqccOfGB7E+kTEiDzbzfeYcdbDSpENdGLMOQw4u
	zc0HIU+HVExel7HT4rKhd4gM4woEW0d7bUJE1ul7X0pXEapTUMExTkDCD28lhUOTXcLkay
	KCOtJQ+Wuubz9c3SZcNMSQPvUEpJLEWPpWFstWnRvp8tfjIYRVD5b/03ox+5zVT81nG5ML
	EyxC79BE79h+k6nY3xn/m5MEVtgP/+a9d6Rt7jtPSc6TaXuJWmL6Mwk5QPg96EV+qdfA1o
	elDR+KEhe+XQiN3VjP/yvrMSugiCUWLu4arXcQqgcVZRPQV3409AxokRx+lbxA==
Message-ID: <9e0d2e4a1f551d2e016975b146b8303508a7a1fe.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] reset: rzv2h-usb2phy: Add suspend/resume support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Peter
 Rosin	 <peda@lysator.liu.se>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>,  Alvin =?UTF-8?Q?=C5=A0ipraga?=	
 <alvin.sipraga@analog.com>, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 12:05:57 +0100
In-Reply-To: <da95bad94c99855b960b3566c07671f8c15d5dea.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
	 <da95bad94c99855b960b3566c07671f8c15d5dea.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
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

On Do, 2026-10-08 at 09:44 +0200, Tommaso Merciai wrote:
> The RZ/V2H(P) USB2PHY reset driver is also used on the RZ/G3E SoC,
> where deep sleep turns off power to the USB2PHY block.
> Part of the initialization sequence written at probe time is cleared,
> leaving the PHY unprepared to receive assert and deassert requests.
>=20
> Add suspend/resume support to assert the reset on suspend, and to
> deassert it and rewrite the initialization sequence on resume.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Can I apply this independently from patch 2?

regards
Philipp
