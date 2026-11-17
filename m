Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913897;
	b=dVF0haHd16PLzZUvqCzjjQTqJxYKExLKKn4TM3KinJiXlPfiSal5tj7X9qvGLliUQ7Kl
	 569AJkq2DNsy0e5vieJ8lG200KSdc1ovL/eeHqgtc3J9/E/3lvaAXbi0od+LZszHO0TKw
	 eKGyW+9FUypLwvC355MwGdT6BkgNj+4v67P38v1/YE5OBdBMqnfKXaDBtvAPGbB0rD4I2
	 0Pqd7QraskvHg4Rqd3TcbferjCU2ONNvbmwrobJ+yYg3ZW+h942NJRkx0JKR8Bqyz+2vU
	 GgA/koAiXtvt/Gdt+OhZSUOAlfnM+tXURwxQ06yNDQJx/eIc0MgnPOtufjzFCWOipUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913897;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=GpXetttHBWaEX1gZoCS411MAw0c/uX+R4RpgYZEjYDQ=;
	b=tnf6SUDbOSE/SYYG0nDrD6SHCagygR7ijjF3tH+ZWPe+ijBzYfaXjk2nhU+Mu5r/H9qe
	 mb2d7vebm9eE3mP1Uz+rE+w05C5hvrVv8eLarSH6h1/A8YKU6WBNwDhObRKdF3khUBSD3
	 YNeyx0KYH2cpBUnrpz/ZIpoCYJyjrqEIQQ/Jtzzz9QBSW5wgtqsWBwTNAH/MNJ9OQFlVu
	 5+RIFbWPpb51HvfifPIR1QkKLvbbiyIXcaNKucSZgCgKRqWZwkD1CDnd3crBWcdqxGaQY
	 ZydV0rhV9uKSWyLfBrps5KvcpwSQ4vXCZXL+x+FwyimpMB+ZW2RHpk5aHPWXsQYZXdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JJA5U4Bt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JJA5U4Bt
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C5D992003DE;
	Tue, 17 Nov 2026 12:11:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794913893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpXetttHBWaEX1gZoCS411MAw0c/uX+R4RpgYZEjYDQ=;
	b=JJA5U4Bt2AdQIm/Px8Bopx8PY+gH+JuhTABw1JCgB0yKmDg4Vp4ceZzvSo+U/qehg8aMmj
	3LNCT/SGziM12x9NoD0W2t/1d6W39NKygZ5G5ricCKZRfgF1NefzA/tfRUr2CCBrrIivo0
	ci+Hz8zyLX9b5IgJGIDFwfUKXtCVhmjPvKr0zI3xsaXchLTcKIvcVPVQmmp+l4sRpuKU0a
	29KzVz48jJZzznwTPUc8kbG+R6qc8NKGwz1HkUDqsye96EbiuJ9/jVlrEzN0ZArYSxsg44
	avhFiUwK+0rJSrYuRz35AVBGPqOAns1ejyUOiRhkBY0k18nn4aWcPReHg4pwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794913893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpXetttHBWaEX1gZoCS411MAw0c/uX+R4RpgYZEjYDQ=;
	b=VYs14bflwuhVhLFPcupUS6bY/Fsr2LzbVdRUO4+JFAVRyyX5/G5fxvjpOO+ICQyp01kSSh
	eT1dr96n/XyjALo+TP2dTkeD/y5yPbOpaJdlca/47/MNI/s4UC0R8KZRdKqTVe0GhfdV7R
	MqfA7SoXzXVO5dNcjIj3V7Azye1d7u2LuaykeRGRgq8IsU7zfnP9wmD6Fb6QXF5p6RQ9zE
	9o1gXZb0d0aHtwL2SZ/+wEfwPGby19o2Is97SHJpGVkzvYx1MhO05ek0/dHVR3vpwyeN0f
	x1FOjXg7ATEFZj/2ahVfEu+NDnfntwe3Be+BM37CxIL/s9LiJLs68+PVQAtSkg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794913893; a=rsa-sha256;
	cv=none;
	b=TUfJqVUqaemsWuBKUSrRn4GTJ0M3QBq9BuQdEOrCxKoa64c85B2q/gqaSWq9DW6cnv1M4y
	Z3PmdXfQ/uhKTPPkEkOU3Sd8B7Ir6Qf6XK2HwKOgNJSZ687KrU4YmZb6rKfCtYNtYIqlac
	ujHbaFVx78O1/Cke1KEGeeFak8OegnNxwsXeTHZmt9Fh19LUwRarxujpbWLERqoPX4GBoY
	PIycKKFbeUvBK7gZb4CROUdwa1ygals/ey5BBxk1JYH9lyzdWNvkMLIJmky6cuxGmWm3f5
	uoArUOhkYrz5jLKuFEfL6wunaWtTHxltrL/5q55Dhpn3j2/1nwuLtMOk5fyEjw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <7e6e10acc08d15d193e9af69eba54bb2d93aadbc.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: core: honour optional resets when the GPIO
 fallback returns -ENOENT
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yang Siyuan <hsyysy@163.com>
Cc: linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 12:11:33 +0100
In-Reply-To: <20261117110812.20371-1-hsyysy@163.com>
References: <20261117095503.14115-1-hsyysy@163.com>
	 <20261117110812.20371-1-hsyysy@163.com>
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

On Di, 2026-11-17 at 19:08 +0800, Yang Siyuan wrote:
> __fwnode_reset_control_get() honours RESET_CONTROL_FLAGS_BIT_OPTIONAL by
> returning NULL when the requested reset is not described in the device
> tree.  The reset-gpio fallback breaks this: when
> __reset_add_reset_gpio_device() fails with -ENOENT, the error is returned
> even for an optional reset.
>=20
> This is reachable on Allwinner SoCs, whose pinctrl uses three-cell GPIO
> specifiers.  The reset-gpio fallback only supports two cells, so it
> returns -ENOENT and a consumer asking for an optional reset fails to
> probe instead of falling back to its own GPIO handling.  mmc-pwrseq-simpl=
e
> on the Anbernic RG35XX family hits this: its wifi_pwrseq node has
> reset-gpios but no resets, so the SDIO WiFi adapter never probes.
>=20
> Return NULL only for -ENOENT when the reset was requested as optional.
> A reset that is described but cannot be used is still an error, so
> -EPROBE_DEFER and all other failures are propagated.
>=20
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
