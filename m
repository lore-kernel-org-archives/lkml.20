Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792734899;
	b=E8s/eJHfcUgrI8Vw2NakZ/REOHWXJS5djJ1xyVWdNKr7V0l4Cxp67TRYCO7adjBTEpyX
	 Nc/gAO9h9bfADZzx+RxaSqY6nnjECg70uliYvnPrk0UTEh+whbutE5JohHALYSEA00rDZ
	 9gjXP4Hp3JXCN7OzckMKkfDM248sInfUr6VXSITxQVrj6JxOZNiZlHDcjEELX2bpMuMiK
	 OVZN3ZgoDTk2PQDK2VEL8FtHeK9II7z2KSyMRLg78cOg1AtBJPiZCnUkVUOHG1kQxXj/r
	 zZfhrz9nXL94bKDbGB39heuIvlt/k2ve8SPPqbqi6LVMlAdlfiWhyjHWg+0ceuX8omQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792734899;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Virus-Scanned;
	bh=iGuLewHE4DgB3b0yCkKQ6+E+7LwsYzeCtRN/Tj5GI20=;
	b=2tgSLz/hO/OOFpbOohZyhqMtpWz3CPXc5RXf68KbD56TDr/KBW3Wa40raPQ56hAcbKMp
	 MU//4SdU2Hv5hZXy06/A4lUVX/PfaEjmLvhRV3i4fxyouYL8u75WOfy6k9tSrcVr1HHm1
	 bODZwy/ZeOzjiFS67a5/lEMX8+ke2W8o3nY0okNJ2I87IlvfkuKe31E1ki31FX5dzyrp9
	 6ZG31koqYR88GCWmPmhfRdA18R5/iCgUUtseB9a8pfwcFtdIkr5O8SjfdPpTJXwt4UBp9
	 1IqpiNWJcDRRelUBuwpqVrZvrygYlU85RQ340tAuRX1C3XWwYePwkHOlfAeC3IZhSaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=chN7L5kR;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDB3606A31A;
	Fri, 23 Oct 2026 05:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=chN7L5kR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iGuLewHE4DgB3b0yCkKQ6+E+7LwsYzeCtRN/Tj5GI20=; b=chN7L5kRYkPn6rpcuAsbRekVm3
	R9qd4xqn/8AEWZClWMq2ZCh2XK0r/d3eeHMOYIpaYFcx1bUwvb0fR2WEHWs8QWZyy4leMoYT99UhF
	qV4XeL7j9rnyEqjot2zk4ll8tOUB6luN+3PrNoNK8gx505idtX0+OyIYdv3CScJn6Af6JvAt85zxD
	aLfEjWobfE3rL6OguZwIU+q+n08KHGXjErSTm7zbmpN/0ZuUOShn4wC1dKM7R0EekcAtggZel7SRR
	PINNMVNG09D0KRz+bac1kJVblhELRfAIHSd1do+bwhrxIvBvmRUWCEds6jA6+Hq6nxvS6YS4mopdB
	/hTZ4/Tw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xK8Ew-000IXG-10;
	Fri, 23 Oct 2026 07:54:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xK8Ew-000J59-19;
	Fri, 23 Oct 2026 07:54:53 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject:
 Re: [PATCH v2 1/2] arm64: dts: imx8qm-mek: Re-enable A72 cluster after
 ERR050104 workaround
Date: Fri, 23 Oct 2026 07:54:52 +0200
Message-ID: <6424356.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261023-8qm-v2-1-a8812a888e3c@nxp.com>
References:
 <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
 <20261023-8qm-v2-1-a8812a888e3c@nxp.com>
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
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28161/Thu Oct 22 08:24:11 2026)

Hi Peng,

Am Freitag, 23. Oktober 2026, 04:56:59 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
> merged upstream (d44e08dab27d). The workaround addresses the incorrect
> wiring of upper address bits in the A53 subsystem that corrupts TLBI and
> IC maintenance operations between A53 and A72 clusters.
>=20
> Previously the A72 CPUs (cpu@100, cpu@101), the cpu-map, and the
> cpu1-thermal zone were removed from the MEK board DT to avoid incorrect
> cross-cluster coherency maintenance. With the software workaround in
> place, restore all deleted nodes and add A72_0/A72_1 to the PMIC thermal
> cooling-device map so both clusters are properly managed.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Maybe it's woth mentioning you are essentially also reverting commit
bce07345481cd ("arm64: dts: imx8qm-mek: delete A72 thermal zone").

But either way:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/bo=
ot/dts/freescale/imx8qm-mek.dts
> index 9e49ac377162b..d346958965026 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -17,16 +17,6 @@ chosen {
>  		stdout-path =3D &lpuart0;
>  	};
> =20
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -		/delete-node/ cpu@101;
> -	};
> -
> -	thermal-zones {
> -		/delete-node/ cpu1-thermal;
> -	};
> -
>  	memory@80000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x00000000 0x80000000 0 0x40000000>;
> @@ -995,7 +985,9 @@ map0 {
>  				cooling-device =3D <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>  						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>  						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  			};
>  		};
>  	};
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


