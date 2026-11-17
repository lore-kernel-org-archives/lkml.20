Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794893225;
	b=0AfTzs6yz71qJhrqtI2DjEDPh7u8TAQ8eA8uyII7wHh69cojiNO2SWm2NFTD2hTUYqvu
	 njZc2Iufuws9l5xoexiY8XU1jegvUIy+wZL/2BKIQDEHOM3Vq/Z5g5rmlPpaLh1ANjGhn
	 5+AEUZnCDkNZ1zFudtJQFuFnFcLuBaKuwONAJxGlS5/NB9d8852yxHGJxC42Yttu8VCcG
	 PHD+OslepLZYHucfUaqiRZsEZDmCsBpxv3A2A8Y8I5uN8L4HpuHCakD1ucWYyV3XNzlkH
	 fo5H2sGPNG3lKU1VBxZxVE94GWi3vhm0btUnwy99I9XvCI9FIivsFNowB4MRKB4lXnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893225;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=boFeCftmVRRQF+PX8/aEDlWrKBeOnZHSxDS9c7xc2ig=;
	b=rjgN2h9PPFcFH1mwIJT3IMxIxwIhdtrhVT8CRARhQWCTSblLSWilfqVIGs57ELmjbbc4
	 u6bxwIGMdFTGw1RLrmYN70kT2boGIS2JubUADcOqQ0uwfCMDs/QdRL8HishA0sIq7yc0z
	 LD8fIFdnHlt/o0p3z2D+mkwqErejYSX3+Dy/R4rm7UO+z1Rl/0lgQub0nA5sgGHHfz5Ub
	 8gg2PfAmOMLc2tdgSydjbi90R6bg6PtJR6SKGoilxXamEmEdZkAMqyq2JbGJonJcc09WB
	 3/IwSFOdml/004/xgJHseJWiheDHH6o6ISVa470wW9qMB3WwmVgeOXv2lUmYjv++c6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CspiWh23;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAF606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EAF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CspiWh23
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8D41A20228C;
	Tue, 17 Nov 2026 06:27:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794893222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=boFeCftmVRRQF+PX8/aEDlWrKBeOnZHSxDS9c7xc2ig=;
	b=CspiWh23LLCSbE1UhSjdaj4DOSMreIJbWzH1opfIYpVlDiJFM2XFXWs42D5AAM5IwISPi6
	OAup75+V77f1poWcDdEekI8OVHu4j5iXh919JAWK/gj+iLh3c4zAsIxrhMXnTPotfwy2tD
	icP26wlassxRzunuB/tOjBuL2gE3nJQeeJaN6mG0o818hEtVDIfSq6CJXxz2uJefwRM/9l
	L0gRB02heYSIroh0u9DiZFzTquJaZdy6WCdu1tboPpvLT0lc6HZFt8IIcYnG+UuJMVdMdy
	BHTM8jNofjKJ6/3x6YJ/96/njfVnlcE4AgfNFntET5LH5sPFV1MlTZ1U5xAhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794893222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=boFeCftmVRRQF+PX8/aEDlWrKBeOnZHSxDS9c7xc2ig=;
	b=PvdFRLgwbyehE8W464Rfe2jQSd9mJCgN+L4+iL+PQtCZ9tpZV3TAEyXqsWs2iiOIc3kTEo
	Rs+EO+2HT3noPx5W2de7Hm+w63ox+wSVdXjqSvYKWGxEqzWb9kVlO9o+G834g0ozTv0XG/
	jS+D0EbsQrVq9pt94I5ac3JZCeCYCIinJp2gVehpDQIRBPIM5KSRluYNyxK3+e9BOlhQAf
	FyIFQJikKzZsRWhbApJvuaaqiT74jlOIemuUUNdfzFHLjIaOudk3eqRoMqCkRfJF90vzx7
	gzC75nT3uw9QlbJVWbsDFazQIHkC9ByMvJVTJ34q3k7GQQfLLPuO0WQXrmaKCw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794893222; a=rsa-sha256;
	cv=none;
	b=LNKVRxB2nPkMQjHEPRO6500KbyTEDGZqpRa4levZaOvfYaXlj3TBPoqneaHWNNqChhU+6T
	G0wpqoTh7IgYmP+2RzRTVkVT+QkfYnLefDJ/xl9yBYQo8R4DB2M/JNHB6d3KGBoJP76EwL
	S11BhNUFP4xoB/k5UIUb9LMjJvFpnsQcH4MSy0OA2Gh49K83wiMaybMcXeXpOpdGDAqS1N
	irXDO5CTX0GzzoLs/UkwSirGqpDIUTqCQxj6JseI85CF9oigdNIdRubXt48R2VvRD4f2+7
	q7wIQprFydhgk2y4xDPHzLDdabLSqN1bwGw5LBg7C+N8q11H3dGaPJwZflc/Zw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Tue, 17 Nov 2026 06:27:00 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: apw@canonical.com, joe@perches.com, akpm@linux-foundation.org, 
	dwaipayanray1@gmail.com, elver@google.com, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Subject: Re: [PATCH v2] checkpatch: Add context-analysis attributes
Message-ID: <20261117-daffy-unbreakable-wasp-faadc9-mkl@pengutronix.de>
References: <20261116172836.2254432-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="scchtmka63gwlbjw"
Content-Disposition: inline
In-Reply-To: <20261116172836.2254432-1-vdonnefort@google.com>


--scchtmka63gwlbjw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] checkpatch: Add context-analysis attributes
MIME-Version: 1.0

On 16.11.2026 17:28:36, Vincent Donnefort wrote:
> Checkpatch doesn't know about the context-analysis attributes and
> misparses annotated declarations (e.g. mistaking __guarded_by() fields
> for extern prototypes). Add them to the known attributes list with
> support for a single nested set of parentheses.
>
> Handle context-analysis attributes with parentheses like __attribute__
> in annotate_values() so unary '&' in their arguments is not mistaken for
> binary bitwise AND.
>
> Cc: Marco Elver <elver@google.com>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--scchtmka63gwlbjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavvlogAKCRDMOmT6rpmt
0kvMAQChsw8tkKx4W01Isda6bqcVcJmnL/7bFbQ3GPQs7ONBhQEAnvd7QmriyB2r
7FhvkMBnX4Zl52jz+u/6J//0oIFfJQg=
=hasR
-----END PGP SIGNATURE-----

--scchtmka63gwlbjw--
