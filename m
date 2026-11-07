Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060059;
	b=zqG9LLf4xdo5CfX3TnivyQTy8yFH7X6mXrCffYc+IcaWnaiYFusg4/t08Jg1i64Aa4/i
	 V0Ko0w/5j+NCalu+S2F7NpiMf8ruvclmwZLcHLfy1iQMFdvQP2DhttMMBBT8jiGA2rB/s
	 q4Hut7J5lPUfiYpHeJ4QIOhw6NtMejdEWyCC9RFOrcw7HzgUu9KGuN8yJeRu7bTPyBGI6
	 z2/oCIf0HMbAqJ0nVEHL7Rhs73gbp88iE2JAEUEjFDMQsOnJmL1mBAz/q16V9VxikEbU2
	 tD+637sxd35tzr+ipkzuVXrHazrOfNqxSjX9rpWir7PsIhkbHzXXgYM1ePGpyydFCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060059;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=P3/ZtZc9uaQGFY2ihIoiddTSKQLXeow2WIExumNjyWU=;
	b=RiUncCkHi9Y7v4aVtiwO+fCnTeWV13WCqkf1YOk+v+kP3RQlLqt7fCjK1ksMJqyJPmez
	 rDo/OhPRyCi2tfvrZxCUDC2C1n2fAKsXeZYQyG9M+pj4kiERv4m7kId/AU9LPRcGzbN/h
	 norwN5PuQj+EcHRBIWFOee5fBFtTvLxXs8sJFGzOsZIbl47oOIr4Tn0JawezXCsk0g4si
	 MelvhVjgibpu0nqdwjmPeby3siiMCUjXTk9WEtLKH7qHi3WMOVnhvWglPTfXe5bF4AVS9
	 rxm5ZHpLN+fS45vc17ickqlzwRi6eKQv/VjmbnKf1C3+QSEZkUQQuyCDK6f2o02QvMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b="kFb/dtKx";
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082EC606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=kFb/dtKx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794060055; x=1794319255;
	bh=P3/ZtZc9uaQGFY2ihIoiddTSKQLXeow2WIExumNjyWU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kFb/dtKx0W21Hwap+7+8lga1HqsD4gxpdPl50pcvQ9e3S9KwwoYRPhb+Qrjm/49s7
	 7v9iGvxAW1p6TPLAUNDvDrRdgxAZHAoHpDMTfczNMAWo36XQCGKYb49v5VAkfu9y1c
	 gWdcVMQK+fAd0PlZgH/c7L6TxTYZvl+M4FVDX/qLL+Gr19LCcIqcK7zEBFxxu6MRxC
	 XATdPMFns2C+Oc9Fs+aTx5LUI0iDzaPlXsjviuVz1G+qfHrO8iIcPQigRxdD4d4d15
	 1jGpyBtntJOIQx7cMcbGAV266k+totjlYOv+551esKm92NBCxSd7lN8+5I5HPaELud
	 6sVHHm5qnQ/1Q==
Date: Sat, 07 Nov 2026 14:00:47 +0000
To: i@udp0.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: serial: mediatek,uart: Add MT6833
Message-ID: <joJnuIX4efIyYGdLotFbhAL7aSeQCOCIdfbE2p1dI3CIEHZuJ6cLh_xF34joTacjhgeBgBC_5AQfceHf9sCsdCStHhTeJSujzY7UNuVADps=@protonmail.com>
In-Reply-To: <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com> <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 68a5641e2b162357b5d491fe81981b1fa2444ff5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, November 7th, 2026 at 2:22 PM, Rui Cao via B4 Relay <devnull+i=
.udp0.com@kernel.org> wrote:

> From: Rui Cao <i@udp0.com>
>=20
> Add MediaTek's MT6833 (Dimensity 700). Its UARTs are MT6577-compatible:
> MediaTek's MT6833 device tree gives them "mediatek,mt6577-uart" alone.
>=20
> Signed-off-by: Rui Cao <i@udp0.com>

Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml =
b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> index 5bd8a8853ae..8fb793c3408 100644
> --- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> @@ -34,6 +34,7 @@ properties:
>                - mediatek,mt6779-uart
>                - mediatek,mt6795-uart
>                - mediatek,mt6797-uart
> +              - mediatek,mt6833-uart
>                - mediatek,mt6893-uart
>                - mediatek,mt7622-uart
>                - mediatek,mt7623-uart
>=20
> --
> Git-157)
>=20
>=20
>=20
>
