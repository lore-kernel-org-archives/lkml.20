Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999883;
	b=wlhQMx9Ml4BDJQ16MZD5F99KpGAgEIgLZJFZT0qrp2OrYLEgeVlaOG1aBizy1Jai8b07
	 Ov3jn6IRRtyOAEer5Xg3HsEWFRABLkOb0BulpqisCWpUWMyp+P8h+ORVVujawXby//JRP
	 gvv2oaKh5b8BZ2NOAXRG7eskgWOLb3C7MOJfW6ZJcaJItn7Ed9WxLmDtSCn+DaR30tJtv
	 UUqu48QkLMtYEH4sX5wojXquepLHj3iOkQS1rQZd7mcyNPP3IzzHteWuuQhCl6ryg55kz
	 gUp2Po4pwB18fZz6QBdVPE1MSXBv2GbBzUDzWGeI6nhNPRKMjlTKDjuznPD8ZONaAAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999883;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3k2gQfSx3BsVVF9yxHoO/WKzvaeGtbZNRBYzH/o7M2o=;
	b=Ve0IQy1Qz0IusfT8VZgBmiQRjuE9KHRM7QVvOBnG4zKf3xPDNJCNlm3zy1LFL5+wUVmM
	 ETsxAKtEU16zTEER1mpT9/8g02z3F6UTJJ9WM5T8kL2fYSAC19PKSnZNpFySH1PYhZA8d
	 O9EiiOgJbgBLBObajSwdB68XQv5ez5roGe2GQYdNMuRFjoTz/QWCrLdC28QgO8iGH8tRM
	 ssC5af5DDr4EsxmX2rO7Qbo9u7WNUIUOsCnUgk89nDFFk0nULwEBESPkL6F/OkR5W86sl
	 Ts6APEoVZ+OFjBgAg85tUIuMEAb2FMocobKu8B6gyQTzxfiOpy5cmxj4w2g6MXRhLJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=xPftORw7;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A211606A31B;
	Mon, 26 Oct 2026 07:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A211606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=xPftORw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=3k2gQfSx3BsVVF9yxHoO/WKzvaeGtbZNRBYzH/o7M2o=; t=1792999883; x=1794209483; 
	b=xPftORw7Wf57gPlwZKEQbrEdkbnBHATENc0ed3687dBlnRGCANqLnqTvwoIlqjrswgYm2B/UwV6
	a0f/SyX+CdlaEvLb7WAtAh6V8LYrcPpsXiaiL+di7zgkB3447Y2NGp5hkq44dXDXX+Jm9GD0YnG/z
	JqQDRPUAajp/uQ4JS1TIGLtYIUcaSul6G2TFrlds2TFpFXijJhOHHfeR6O14RPnWOXzjzv22IfEr8
	Vc720/CwOjRoNW9UlUErutu9XBPRH/MZezrrB124x5OEo1MV/LRk5/cd/uNIaeL76Y4KiNAc3vl/o
	+F9R9/st08nzpfitD7wBXHNv5VWx7Jd+DMbg==;
Date: Mon, 26 Oct 2026 08:30:58 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Message-ID: <20261026083058.04173f10@kemnade.info>
In-Reply-To: <20261026003918.155321-2-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-2-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:12 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
> Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
> always-on before the driver stops doing it.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
>  arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> index dc7ff108aa85..bd9c6c6fa117 100644
> --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> @@ -154,6 +154,7 @@ sy7636: pmic@62 {
>  		regulators {
>  			reg_epdpmic: vcom {
>  				regulator-name = "vcom";
> +				regulator-always-on;
>  			};
>  		};
>  	};
No, please not. That regulator is in practice used with a not yet upstreamed
driver for the EPDC on that platform used to deal with the current kernels
fp9931 / tps65185 drivers. So it is very welcome to have it not always turned
on.


> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> index ff9d50942884..6cf5603c0752 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
>  		regulators {
>  			reg_epdpmic: vcom {
>  				regulator-name = "vcom";
> +				regulator-always-on;
>  				regulator-boot-on;
>  			};
>  		};


Here the situation is a bit different. If I remember correctly, there
is some special EPD logic in userspace on top of some ordinary kernel
display driver. But thesse things are missing is devicetree?! But
that might need to learn to deal with regulator enabling/disabling.

Regulator always on is probably not desired here, either.

Regards,
Andreas
