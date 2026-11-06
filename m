Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793968616;
	b=wPHLYzzw4haW0jkocwAXHYqqXjxXOn48bqMF5ez5wUXSrgV1lbvaw3w5oRl13q4t9hGO
	 850Aq28gDKAwcRCUEqYsYIixoVx/IQdjw8wbL/6MUB9cgDZS/1xKvWN569xCq8Z1OY+32
	 kYu9DhQvXi4jr6jYr/MTh3lwgNWBT3jSMW6Kve15Q5p0ZOanel3NvXR0yB6tekv3bO1N1
	 OPw+LQQTx9mA0KzDk10yFO43B+sfGLNiD82QEWTHgBheZk2r1EapvLk/LxXOZ2T8Fvdtk
	 2qjwi61K9Qw3WuvRID0KmSZenspbABDT2h7zrI+RZZXsq2Kjf0bjqg0eMrdVhb3ATeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968616;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=NidmzHz68mc/Fcdwi5jwG9oqQzz3k8pzMt+p0hi/rcc=;
	b=o6oyi57MvnT6waX8zKkyEAdxu14ZprcftC8IuaGPkMUy8FfC5hzNdKl+Owrs1gHqfwca
	 yLH1rbqQVeJcV1sT10Bq7Sn6usy8I+a1zUW9jr2yLoTRUfcYLe3I4kR0khSXxDvA8w49k
	 ZaGYHOGMA+P+t7tkVm1kIxtW0J/2VtMQ46CNzf5wN8zLQ/gstJjJMrSWFp4kExvDVbGbs
	 WDb7emcw1wudY79O+Oz4Z3NkTQYbYz+9E8aQysSClRqlEfxAl4mBv3dosmED3CZWHGG8n
	 2c9akziyzJ3p6tSb1ZtESocxlaoQX+AZ89QV+tdcFmiP7/NcGWvJEt2U26yc3P1qiUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gud4523E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96790606A326;
	Fri,  6 Nov 2026 12:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96790606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gud4523E
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0B7E120011E;
	Fri, 06 Nov 2026 13:36:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793968614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NidmzHz68mc/Fcdwi5jwG9oqQzz3k8pzMt+p0hi/rcc=;
	b=gud4523EVcuFSmcCXwTj+Wxe4po1mH47GTMCaoUJ9HNLrWULF5r0oa5JEI9BmTfl/EEE5f
	kYPki0z1sk+Dle8DRALKBa068I426qDB+6WGm2kKqGrmbtW1cxHQYUH6soQbwrBdO7e4Ro
	CDUpLsPSNp/RsBLFNJ3Md4oYBCBBDT53gK1jqW5ylPUwnjqanaid17xXmGHsZc6pT81OHs
	UBDGXqJ0Vrr9LGffgpHa/yu8fiqDnd6WIb11uH5RmHCzrCXr3YelwKVeoETQgA08WL302V
	mATmz0dXc2T9pxJJrP+9NkodyL29Ohe2OnSjSGbS15ScLcSlIvorfejwCmhEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793968614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NidmzHz68mc/Fcdwi5jwG9oqQzz3k8pzMt+p0hi/rcc=;
	b=Frj+CbBQ4aZKiE/lwG6U/0s/moyUeiEfTrTBkTAbk+zV7bmDv/t+l/cqJ1T5w3WsbDhL87
	+hE0lu40qjijK2NRIW+7bMwqYiKAKwMAmiCEoLlsaXHf4ob0/zeohEmucvdTM9KZnd8LFH
	1XgbNtzpzMp//8OTzW3Z5c6GS3qluLxrvInqtSy+TlDniaUhzpoA/JcPVYMahHmn6gSMqf
	MgJJchDfcB+3JK/MPO164SKs5x0iiwnO4b39rTkn/D70+QLDzkpKjdWR2AjOXZTl22/Oae
	k8YVPnl84YIr+Ybc45yFmn7Kf45TngT3KLRe5dXTKoNMrR25M77mj/B/xlzVJw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793968614; a=rsa-sha256;
	cv=none;
	b=U7rbTuYVs2wVPwXvVyxOH2D77727yNuCOGP1esf4xEFquI6Dhr686MkcHXI0KhPrrZz/jn
	jnnNBjzlw3Luvk4syoiaSLsW7zlQKDsVWp6R4/1Qw3O4WOrf2a3QHereWwxDW5zxG6iDat
	61DPWOeMfH0IdjyTYmfR4qOI2siqXee0ixLnJWXPEzJ3RztvSQYtHfZZF5CE/UQ2hgm2pi
	p+v7K/uhlUAu3R3hXN3q2kA/iQ0NLne1+b2mcYS7KfOYFuNK+L0JNUNYdpsPdEFKWNANSK
	paSjxFokFwRoq9ZJjCB9Yuy/b1ybZQ0jMPEtjN0bivjXfp3+KyKb6zXmv8dMkA==
Message-ID: <0ea54ed9b958b5b9b80dd0f3a6a4976ef1cdc495.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: Remove orphan bt1-ccu.h
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Date: Fri, 06 Nov 2026 13:36:53 +0100
In-Reply-To: <20261105143542.2716484-1-robh@kernel.org>
References: <20261105143542.2716484-1-robh@kernel.org>
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

On Do, 2026-11-05 at 08:35 -0600, Rob Herring (Arm) wrote:
> The Baikal-T1 platform was removed, but the reset/bt1-ccu.h include was
> missed. Remove it now.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
