Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876995;
	b=4PUdT9pUoqY2ddmflKB71IBefVUQeXUqAwpQn2BXrRCEEK9eaht83kGuY68IUqfCYn1g
	 YUxU2hLe7JpdXlU03Q9PkztCvGLelha7kYchNaUOt6SYwZwEFPeP5x/7tLyQUgIRCld8O
	 SvckjV0G5oHvVP64fbAqCU4a5z3h8PMbwHo3u77aJ6DjiMb9AjswQgbnleiie0DVdnl1J
	 ZElTybWxy1Oaik4hEul0u5jTZJp2NEkSA2IgIg+lKxDio6qQ7rkVvTxp9+qqIblU8FAAL
	 b50xtEGpRXEbZfLC8bsZkI6A07VuRT4pYLbLFJ4lBMcmL4/MJjpTpnh/2a0iw9gN4vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876995;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=4UHIrg6NGC+slns24nqTvKAXnWRFIxoZbfAVKA0TEKg=;
	b=Axpc8X6eEkBYk6x80vAoxerh+EZoNxD/awYWoCTkLJlhQ3+OFDH+UqMdDx3Seu5ykDOm
	 46OBtTCmnVISHTUyYXcBEv5wdpyysIZn0EytclBcFx8Ji2SGmdgLj97WFxh/3unLxtRkP
	 xL3X4Jfi9mqKIFWFNWIMqJ/ZgKyWXd9H1nPzbBQfeiXb0HbXmZ/O8mTEeozFuclzUImav
	 rHYxaF4W3rRAl3ad8HpnrVl7/Pze/Z2fMUpV3WFJhf7aDqylDMiQU1KXv7lHJX7KUuYV8
	 QPIj0TWTm5URHaKQ3JI9nbLVSGlcN1A/AWaGom80yPwKT9YotHOaSum+d97UMwHNTbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MWxIkkSj;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5BD606A328;
	Thu,  5 Nov 2026 11:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5BD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MWxIkkSj
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FEBB9A4;
	Thu,  5 Nov 2026 12:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793876853;
	bh=J9ImKc88GPgcB6D7fshmTuDUSz38NIgF+cMaexxCR2o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MWxIkkSjjIwpyc93MNB1pO7/3tDrI4qxEC8+GcwjHJrYAGSD/d0epfzzEdb/Ogt1G
	 bnR0V9blnX8/zn87XrkCQIxFcglHmBVBb+FE6phFYB4BDGO87ReEWYiJBQNZSXtwZR
	 2V7dvJFxOKQvTWJxEPfWX7NCZal4Bea44ZjIV728=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105033224.2880607-1-t-lannynd@ti.com>
References: <20261105033224.2880607-1-t-lannynd@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219 sensor node
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: b-brnich@ti.com, praneeth@ti.com, r-donadkar@ti.com, devarsht@ti.com, kieran.bingham@ideasonboard.com, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Thorsten Lannynd <t-lannynd@ti.com>, linux-arm-kernel@lists.infradead.org
Date: Thu, 05 Nov 2026 16:39:46 +0530
Message-ID: <179387698667.10051.17862177968667264461@freya>
User-Agent: alot/0.13.dev199+g9722e8483

Hi Thorsten,

Thank you for the patch.

Quoting Thorsten Lannynd (2026-11-05 09:02:24)
> The IMX219 CSI2 expansion module is externally attached. Without the
> orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
> exposed and libcamera fails with:
>=20
>   ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
>   Mandatory V4L2 control 0x009a0922 not available
>=20
> Set orientation =3D <MEDIA_ORIENTATION_EXTERNAL> to fix this.
>=20
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> ---
> v2:
>   - Use MEDIA_ORIENTATION_EXTERNAL instead of <2> (Kieran Bingham)
>   - Add #include <dt-bindings/media/video-interface-devices.h>
>=20
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 149c59c07182..70c2a197f1dd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> @@ -8,6 +8,7 @@
>  /plugin/;
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interface-devices.h>
> =20
>  &{/} {
>         clk_imx219_fixed: imx219-xclk {
> @@ -72,6 +73,7 @@ ov5640: camera@10 {
>                                 VDDL-supply =3D <&reg_1p2v>;
> =20
>                                 reset-gpios =3D <&exp1 13 GPIO_ACTIVE_HIG=
H>;
> +                               orientation =3D <MEDIA_ORIENTATION_EXTERN=
AL>;
> =20
>                                 port {
>                                         csi2_cam0: endpoint {
> --=20
> 2.34.1
>
