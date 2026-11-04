Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811024;
	b=SE/ptHkXMVakCM4Ng902V/YoviJIu+iKb4NbijxGiSn5PDj+nEWp+u11nyV+d+ZaubBj
	 tKJqp2FZ77j7LlQD+o8EnsbaDml/CRfJ3ytoBmjS4FG1KAm5xVv5s9rbIYm2icJwrI6z7
	 AxkG+LbrQl5BmPGZSDx4seb9pp1xcoPm4gA0zuDJXERYj371jsp1+a4HLs8SOQ2J5dM5P
	 mJfE0teH38K9cBbbQIeGSyz/KVPMgNJYCfXOFBrrkUVcygrIzyMqy++Mq9tVLSdYQVp0p
	 DSQGgb832qPZJhRn1oLVbs/GKXO4HzTMN+uz0mQqvin1IO3csg/u4shREKAYrLxgeiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811024;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=RgMfHtQfX+v2Ee7n7QJ9yHGqz356fJRC9YMgowZV0Hc=;
	b=LlDkpDIla9Bu/DNIavQ6FQ7SFPWBJixiBnxv0itH041qFyh6bxfr4Yfw+ad/cWp1CZN+
	 57I3wiugQkht6Pkt+mwScz8eF5tuAjn7sPwFntl/QelpWdjX9XhAfnVzXTTTyomDWTDTU
	 r12knpz2sY0gAHZXobycSDSTS96cYQDkrV8ezf2gfFAvDQRcYSSWPlyUX0xSjwPgRSEuv
	 p9/VmjRnGxmpb9TWw4lkmp9m8nRUbS8ZAeQ3rB+xoZVWZPdri/i7Npm9TJGXfEUszVCKC
	 EaLVDGNmTvPzd7tVviTjnMYcOC2vnoGk5K1ngkH54oN0l2Qpi6ng3hd7e2Z1oPSCCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PkZdU3xL;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F86082BEF;
	Wed,  4 Nov 2026 16:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA2F86082BEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PkZdU3xL
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF5A4175;
	Wed,  4 Nov 2026 17:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793810883;
	bh=OKJRnRv1W357X1nFZqikOtPnYU0npjJNQOHsHy8nJzE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PkZdU3xLwbvoIPjM9WMZax2YEuaSJX0u+E1Sx4IzoksPwQ40pKVfje4W9cua4o1R6
	 7DbTW3QlLXOOStVtr4sU7X/9+b0xUEG64dX7vkkp87qDzedJRPMEDVgKj2BPBwZN/H
	 Fyi+bhLkuj3SZwauQkoBeVvN0g5s7msEQOlyNTFg=
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
In-Reply-To: <20261102211549.1011388-1-t-lannynd@ti.com>
References: <20261102211549.1011388-1-t-lannynd@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219 sensor node
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: b-brnich@ti.com, praneeth@ti.com, r-donadkar@ti.com, devarsht@ti.com, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Thorsten Lannynd <t-lannynd@ti.com>, linux-arm-kernel@lists.infradead.org
Date: Wed, 04 Nov 2026 16:50:18 +0000
Message-ID: <179381101896.194410.4650216012053782559@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Thorsten,


Quoting Thorsten Lannynd (2026-11-02 21:15:49)
> The IMX219 CSI2 expansion module is externally attached. Without the
> orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
> exposed and libcamera fails with:
>=20
>   ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
>   Mandatory V4L2 control 0x009a0922 not available
>=20
> Set orientation =3D <2> (V4L2_CAMERA_ORIENTATION_EXTERNAL) to fix this.
>=20
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 149c59c07182..829ed98345dd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso

#include <dt-bindings/media/video-interface-devices.h>

> @@ -72,6 +72,7 @@ ov5640: camera@10 {
>                                 VDDL-supply =3D <&reg_1p2v>;
> =20
>                                 reset-gpios =3D <&exp1 13 GPIO_ACTIVE_HIG=
H>;
> +                               orientation =3D <2>;

and then you can do:

				orientation =3D <MEDIA_ORIENTATION_EXTERNAL>;

--
Kieran


> =20
>                                 port {
>                                         csi2_cam0: endpoint {
> --=20
> 2.34.1
>
