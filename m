Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873566;
	b=wilzinZgaZLoB594fkYsbzBPsmmjGWEJU0bsJS2dNvVdE7KLWysGExKk2q1BMjTjcm7b
	 3jpGRK6GxiVf8MiqIAqyufS4PkrYIEFPnUf4VVjj2cu8NTd1EqWk+eXSEiat3W525jI80
	 cPh/u4KMZA10BLG6JSy/6hoVYLU+Xmk5VrTBiHJCGMlPBqfV0wHpr+t8OND+fhM5LBBaP
	 PU1jzHnN2etyybwOs51LiDOKFNHWFB4J3+c2cxsyPl9fvgyEA1VJ8UnlJ1kI1nQhK5g4R
	 Icpj0VVBw5BEI7kJM3fiK4vARkfEljyjdyDoP8gnT9rlQsZzrA2XIbBpiTlSA7uGtVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873566;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=NOF5QOMavsiAnWtFGJ6Jf9A10hmMS77Tff+wL/xSXu8=;
	b=v36qowawfKRThMXGsJX/Qst99TCi3JoDr7GdsLytc9AestHEAsKFalPAGVaF0KVG+y7+
	 XDCdqTIzvhlmZz2E7tjSzxRfYZ57/VwFpuFcp/7/+gkrERYpmIZp4VtU8ONk+IC9q+pn8
	 RILM0FMfgaffxToyiYa/qX2Xpx/N+aD/EQkBgHjFnNNFlwdbgOmotWVNm6ZjQIj+xQ7Vh
	 YsTvzFLUJnPf696IxodBMnOe7aZ/n5XofX3s0POGet7TZBpcPLk+Mb4kS0Xn/+fq3+QQ5
	 EUdotW53ycYkWtNPKS3vJfowsETdc4lJGD8XUJqwfXZVqgEU5usdvtp4UawRZiGlnWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=TjQdIb1l;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4630606D814;
	Thu,  5 Nov 2026 10:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4630606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=TjQdIb1l
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24D5433D;
	Thu,  5 Nov 2026 11:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793873425;
	bh=GDs6YCbVDxVScqZZAT353arDeziqS2XASVgUdwgJvtI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TjQdIb1lGXuJGu2gow2cLgH9JAWEeq+cuvu2zKL4PQULlTotjt2xbDIjnfBfw4hlB
	 lOJUFOfKaHyJcr9NQDZF3Rxjh+bi72VECj9NSPqObx64SQuN8GIBd2TAlSIONDTE20
	 cL8cBnUksNxep76n/jnevwUomc9NEEZN0dTSHoQA=
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
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: b-brnich@ti.com, praneeth@ti.com, r-donadkar@ti.com, devarsht@ti.com, jai.luthra@ideasonboard.com, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Thorsten Lannynd <t-lannynd@ti.com>, linux-arm-kernel@lists.infradead.org
Date: Thu, 05 Nov 2026 10:12:40 +0000
Message-ID: <179387356065.194410.14555444564110226308@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Thorsten Lannynd (2026-11-05 03:32:24)
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

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

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
