Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793695393;
	b=QaNufCSjygr1T3JlBTYM29Ry+ovmYAa95aO96SH2UGGaBON5m8TxTw4FgB5B3Elzi/DQ
	 Iwo1p4Av3EqeX3v6Wz7EOGcen9l0ECcMyxJIf1bXQgGoY18L+vITfyRMisR7yh6s2U0xL
	 R8pFnwMPbeolz8JW7FQAmrMQT02Wa4VvbtUfcsqFOm4TKU1jZjjZpWeVmG+YflQBcZGwy
	 2En7ig229AcJ/EKoMw4jBW8xbasDT1vzC9WdLqf8Gnm4IUJTCTsWhBraWG0pi/xZghEJP
	 XbOw+G3Md4kckwguf6GIfKb3Rf6D4Th+Lp+7PvdJViE8MCfxLi/uzNfehvEWGUpxAWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695393;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=ldn8Uwg6bIM1pXx42AqleDz0qwEhH4Gry8sXUgnKs6o=;
	b=pMl+7sI06B64irs8Yc/TqerIQaVoWRqZ34WPbKlnoZXd9PSD0e+HNmbrwJzEYG40kAlh
	 3+GwKb4U/ul1OoozIDH/wSlQvIPNkiHEoqf36r7UnuhCzkmpighKMU4+dbzVCcW7+BF/x
	 dT/sqIek68UYNkt2xbfY3C19BSrQvgndxp9Jwq310ARlXQVlH9kEs6zvTVU677v2BVloR
	 dtFxCG/1eDqMclUuRlk0/RflkKHx892IVYtcJMEnOVN5b1Lmxf3UKmpNiRn83QLTU0T5F
	 veVNkTDwJRavtXmrnKYbl3toEnGEPFXTkd5GmmKInWRhVEtOZ+UEVkE1Affb48b3HVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kck2UP0Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A67C606A95E;
	Tue,  3 Nov 2026 08:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A67C606A95E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kck2UP0Q
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 55CC12008B9;
	Tue, 03 Nov 2026 09:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldn8Uwg6bIM1pXx42AqleDz0qwEhH4Gry8sXUgnKs6o=;
	b=Kck2UP0QjPeBD+dXF2Jmn193MsuLvVO7FP7b/g5B1P/ObxtBifpJ1sSRm/iCx7CWCcTWSa
	Chj0vkDcub1MJUasXIOKI8WxN6XHQxizt+E7EYVY/prE07p4ssus50V66Shkso25DXjbhh
	oRv5YG7DHRLO6SxI89M1HuTLIqv1ettxLwOPgWVErl0+tUNN1EZNrb0zwHaeqU+6aKLMTk
	BHfKkWVUKYymQmAzNnKEVQ96xgOynrHWMFpjr1UFG/Emj1yjqJHlG8NJCV7CIQUyi3TCR1
	quzEqgEM6PZzo914SEptmqvDvbdArVUBVSbdxjAB+pWaucQJH2eE34z9oshutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldn8Uwg6bIM1pXx42AqleDz0qwEhH4Gry8sXUgnKs6o=;
	b=I1cGpfUEClaIOygpZTETCF7+eSpVpI0odhnZdCCMV7ICqkMFP3EwolT8HNfF3vJgaxqdrO
	RU2+uJnrwDZhXqlwkDDWQWQ2CsA6EDO+QGb1SnJ1kP9pD9+LRBHzREa871JjdpfPwCXujz
	wkP4S1j+3TaOmpUp551r9pQQnC4s6ieuDO22dwGX4L1sEpQjBNC1QAr1nVZdJR36PgnTLO
	z4roXxOUBWv2gkwV0kBtyy5ip26ypAr6yWHIxke/GKQvemVeIc0WmyaidTEqmiXjqL3ftk
	yqr/xmdK/vtTjUwNerI7bilfphluj+9hhdUguq59f4uu0C+8PmCKVbXpjlfTmA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793695389; a=rsa-sha256;
	cv=none;
	b=Qd5lw6fGwGDLiZqtNAFsg+uAqFjyk16IKa0DeuAXRInKqEou/lGpsk3vz2dNlCscxLhaBv
	1LXADaF9n98nvDDqLdG5BplF5gwozT+iVMXOuKnKXsCI1HJSdNL5BCOp+MX2ll04+FY9mV
	tIiipahdAl7LmJTxmxQK9bXbnXonQ0pNjw2/o16hZzatjFPRE+l5acUnEWgT1EVua8K/mr
	Yo3y41cBycH3mHA1DB7FHxOE2VYh+u1TlxhjsZK6OZKgp/A8uDOuBaepAmonTmd3uFmUv5
	wRUssR/6V7EutLYmQ9SO/XmgIINcGFAUuCxAp/K4DDCkwnOFyl0JmZF44AMdMg==
Message-ID: <81dcaef70174ea7746bbc5a31777770717c14357.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/3] usb: cdns3: Add CIX Sky1 glue driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hongliang Yang =?UTF-8?Q?=28=E6=9D=A8=E5=AE=8F=E4=BA=AE=29?=	
 <hongliang.yang@cixtech.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Peter Chen <peter.chen@kernel.org>, Pawel
 Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,  Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,  Gary Yang
 =?UTF-8?Q?=28=E6=9D=A8=E6=96=B0=E4=BC=9F=29?=	 <Gary.Yang@cixtech.com>,
 Fugang Duan =?UTF-8?Q?=28=E6=AE=B5=E5=AF=8C=E5=88=9A=29?=	
 <fugang.duan@cixtech.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, cix-kernel-upstream
	 <cix-kernel-upstream@cixtech.com>
Date: Tue, 03 Nov 2026 09:43:09 +0100
In-Reply-To: <20261103074929.1971195-3-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
	 <20261103074929.1971195-3-hongliang.yang@cixtech.com>
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

On Di, 2026-11-03 at 07:49 +0000, Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=
=AE) wrote:
> Add a glue layer driver for the Cadence USBSSP controller integrated
> in the CIX Sky1 SoC. The driver manages the controller clocks,
> resets, and the mode strap controls located in the Sky1 S5 system
> controller. The per-controller glue registers, the AXI bus attribute
> configuration register and the controller status register, are mapped
> directly through the reg property of the glue node.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
> v4 -> v5:
> - No changes.
>  drivers/usb/cdns3/Kconfig      |  13 +
>  drivers/usb/cdns3/Makefile     |   1 +
>  drivers/usb/cdns3/cdnsp-sky1.c | 716 +++++++++++++++++++++++++++++++++
>  drivers/usb/cdns3/cdnsp-sky1.h | 128 ++++++
>  4 files changed, 858 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h
>=20
[...]
> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 000000000000..1f7870289a35
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> @@ -0,0 +1,716 @@
[...]
> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
[...]
> +       data->reset =3D devm_reset_control_get_exclusive(&pdev->dev, "cor=
e");
> +       if (IS_ERR(data->reset)) {
> +               ret =3D PTR_ERR(data->reset);
> +               dev_err(dev, "get reset error:%d\n", ret);
> +               return ret;

		return dev_err_probe(dev, PTR_ERR(data->reset),
"...");

> +       }
> +       data->preset =3D devm_reset_control_get_exclusive(&pdev->dev, "ap=
b");
> +       if (IS_ERR(data->preset)) {
> +               ret =3D PTR_ERR(data->preset);
> +               dev_err(dev, "get reset error:%d\n", ret);
> +               return ret;

Same as above.

regards
Philipp
