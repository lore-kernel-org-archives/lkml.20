Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E877E29E10B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915801; cv=none; b=GbkE62MpyAqxknPzT2Tpm+jy7/Y14sRN+RgMVcAOCefr6QxpHvXr6conKYtlV5om37LEkjGtdqqBfl2oXFqliH5uI+p99yYX+LvWNiLQqlv2ICK2q9RFs3FWNjlkbMN6Br3qkjIa6S8FdmSwB09tug+Lw/pFUfB5zEnaouCN930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915801; c=relaxed/simple;
	bh=7ST86KOxx2FCjwOZZT20Nlohz10oiV4iiL0VRbEgSog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z+pOui7elI4gRxai5vySRTcnQ6jg7EUGXY/IDDRW4ctrCZR9zPrLh1kLAnkuRpkP4J3WulKjYt0sJhB8RZt4sLPpkegn5spb6M7zxfy2yKr7kXK6LJFywB4HobHhkuU6kJUnET0LITt5vIGPQIKCQaHZ0b22Xu1jO44KZzVgYu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KuPj7gu0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KuPj7gu0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 41EC11A1896;
	Fri, 28 Aug 2026 11:16:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E57E60537;
	Fri, 28 Aug 2026 11:16:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADC5511C78131;
	Fri, 28 Aug 2026 13:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787915792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JqCrFGGm5J7f5kHtiiyfF3IVbiHO0Bhhe0e1xz4ZMJ4=;
	b=KuPj7gu09Slu8xSV1fhBDNmnzpvBy6oyRgliGMqiV9HPHGtJf5Nka8TLsz6ivSdurNVoGS
	7PGa4QC8gU+T5P9OBgDtczqcR1Zon1/KccQ8jN0gJ1k7LWgjDVhMEyizzqbKZ43k+IWAYi
	uaUQ+wNG3WfOu38QEDwwpzsz1fSSARAfR8k45JVnGuoxM6Slkmfe5VjiWBxUQTIHiqdLBr
	6ir2/p3gfYbJiDtuK/QxXJSG0A7N7mz5aj1xFCFN3bIJYF/6ooadvt7ww3UYhOrgrXf1Ql
	wql0kwhDRkyU41hjeJARO2aq79LcNhWxNJi19/9XGo+Ax6HBCC2DM+QNkCCRYw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Jason Cooper
 <jason@lakedaemon.net>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 38x
In-Reply-To: <20260823235652.77997-1-rosenp@gmail.com>
References: <20260823235652.77997-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 13:16:27 +0200
Message-ID: <87se3ypkac.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Rosen Penev <rosenp@gmail.com> writes:

> The marvell,armada-380-sdhci binding requires clock-names, but the
> Armada 38x SDHCI node only carries an unnamed clock reference.
> Add the missing clock name so the node passes schema validation.
>
> Fixes: 6eccc52b448e ("ARM: mvebu: enable the SDHCI interface on Armada 38=
5")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Fix already applied with ARM: dts: marvell: add missing SDHCI clock-names

> ---
>  arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-38x.dtsi
> index 1155bee20523..598022645dd2 100644
> --- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
> @@ -627,6 +627,7 @@ sdhci: mmc@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";
>  				mrvl,clk-delay-cycles =3D <0x1F>;
>  				status =3D "disabled";
>  			};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
