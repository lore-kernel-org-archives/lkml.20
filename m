Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808439;
	b=QsYqPsvoWwsulYXOwLgJ602NH6Q32vR/mTyIaOuP+QdFKbYrppnyW6sDnhRaCzdcqcJz
	 Agrd1rBRdqLb4dzfUrSTOqYhtVXdFbYMeUSeYLsFik2vDO1o4Bz9AKsOjRR4OUNLok4yD
	 7Vtg/9KZzR7y4umbIl5/g1nv3waELp4vDNUxY44UAvp7pglSBIltqPuJ56u2amtuAx1lT
	 PygsLKkYae4SAqnmEbNBMsbfjjgvRI6aZgOiurOvWzc4phaHyzX2jdq4l0VMlWLHLCp9a
	 29SzmAR+Q+7rFDVCfR88wucTxW9wEgjbHNr3Okv517/6YlqPVLomclgK1q06o2XsBmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808439;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=4QVFZPQEhNa9JWXaKDJ0FUgVe8TAGszF0r1b/86iBGk=;
	b=k6Vt1XD/YWmTFoykvX+YnjGZmeIz4Y0dGLz2cGpfaB1KdN32RgYuW81PeljiWWMDw0Rh
	 rjHlM5A8z6lNRigNungB6zyVi6itk5VFC/mA8dyMAAqK08sbOHz9tFj7tjZZNVdONwVd2
	 sJxFGzd5ClzPDuJfGdYErrTPIfJqOfOI0QSwA2xyhsqU6I1E6Rw32FnjIU6Szchdpc09P
	 OrzWCwFG0XFnWj68gOnvlXLlj2fS5fh2p4Tex6EsBhwmwtB2Wk6ns/Y+LWNEJ6bFUftZ/
	 j2mfLkLOIDxd4CrxyfATR7lw4Pe38LjizLbrqfiogDPbhZRhr6r/dhqrXVP4bXpa3Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=B86oXMqK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9841E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=B86oXMqK
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AF88620039D;
	Wed, 04 Nov 2026 17:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793808431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4QVFZPQEhNa9JWXaKDJ0FUgVe8TAGszF0r1b/86iBGk=;
	b=B86oXMqKc22QOdymVWH0/orpOsV3Hcaic+sukl7l8qlOAuGLZx6KSt3P5BpMWJpyS57oh1
	49AjLEcdvK8vpSIAr6olIuixDDTh5Md+iXwmMzaJe4yDobo2fVRWvcc0E9e0fJjosb8cv6
	0af99KgpdGgWi+6L0R5NITGn+o02JUTQJp/cm3loLcMk2OK8hTCHninebO1goTJRBFRGdJ
	Vcv+7fgsP95bbsFDjiY04HWYsseubvJ5mYC34gNTHzcZ0MjDQdPf+olThWP1dIWh2tClhv
	6zIXG4pIOvgFUplGKzRVtd2tbVpAnDmjFJ43cNTt5a3KalOfWL5MAIIHq4vv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793808431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4QVFZPQEhNa9JWXaKDJ0FUgVe8TAGszF0r1b/86iBGk=;
	b=Ck6/l6pXzBrGvG2b/yPNI4i5dMTenVJM+vkC/DUjSGdbP7iJMzfQlvice1fzcguBBTfG2B
	k8/ZlRhdICwmh+dRfI2A9dEZtb29I23+U5MRINj2oLA+hE0MCvKN4sW6o+zEaYNbJi6BEe
	Gp0z7LDAa8SteVgPArRwh9dlW2t9K6hHL8lriR9vdRthSUGxK8WH7f+1y/0Ne9XB8IZ9MA
	SolLF9WWvfsg0BXUPb11MUVT+sAEGk4p/krQrHTSWRxzP+ckqMbagl+YCoW/sbE6Lwn3VW
	ZGBqfMvuEzpRTJw54xxEkpITkNSjWPl9ZjrWHuuRiTPRmDchw37I6UqFjNp3iA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793808431; a=rsa-sha256;
	cv=none;
	b=QQpU8dZ2jg4dF8E9/UFl5rJxIMmyE7y+QkvFnyAratdheK7EN8DCAgseQnxF0lhpWSRzyc
	nukxE+ehjcOng/FpQlSJYIHfl3yY3X70y5Fu06HBxXHthH8nHmm/xMQLCSFtY5E/Y5pg4D
	PWjKZNcii9nBkASU8WIdpqlBiL1rf7u+9GGX8EnDKuSOu8cE87tLxCpTBaPKl+2tvLifDO
	h2eIrXIOkxRcxh253ByILFaUbqACddAjQ3ZceWXq87On8jjOdUA9XWjLuBijp/RfA1udEa
	zn9/tcYFKPdoT0XA2KWBLWY8wzut+C9FRwExJjPqGjf1pdgEcWpkr2R3yDNBEA==
Message-ID: <61a7bf3c6648fac5c43edb272c7e97415ea7aae3.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: Add KUnit test cases
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 17:07:11 +0100
In-Reply-To: <20261104160123.6784-1-tzungbi@kernel.org>
References: <20261104160123.6784-1-tzungbi@kernel.org>
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

On Do, 2026-11-05 at 00:01 +0800, Tzung-Bi Shih wrote:
> Since commit 9035073d0ef1 ("reset: convert reset core to using firmware
> nodes"), reset suppliers and consumers can be wired up using software
> nodes without requiring Device Tree or hardware devices.  Leverage this
> to add KUnit test cases for the reset controller framework.
>=20
> The test cases cover the following scenarios:
>=20
> - Basic: Verifies that a consumer can acquire a reset control via
>   fwnode and perform reset, assert, deassert, status, release, and
>   acquire operations.
> - Use After Unregister: Verifies that after the supplier unregisters
>   the reset_controller_dev while a consumer still holds a reset_control
>   handle, subsequent consumer operations fail safely with -ENODEV.
> - Concurrent Unregister: Verifies that unregistering the
>   reset_controller_dev concurrently with an in-flight reset operation
>   waits for the active operation to complete before returning.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
