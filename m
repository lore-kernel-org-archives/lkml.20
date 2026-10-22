Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659016;
	b=gadvasP4YygMXqM/kKMFsUJFMVn/hhzQFo6yptoQgbomvZD19EEPhtNvzcQFaRfYI/0K
	 FrZovs+MEagz8Vygv3Jg5zvg9uTqZne8tp92QUK7+y3A/QxsbZHO9e2PUY4jIXueHnlwx
	 0w7lYkunBzfds46heIM6r2xVbZJ1R62PDOqBZc9d/Sp6Y46uD2oQwn/K6gfR1uDxyOBRU
	 s83I4YUHDcVIzmj2WH4z8zwl4GveJSPwN2xXN3m0e80rHeeJkx/r0A50DSTOdjuzpIKdx
	 5VM63mNfqnTy3XJeHCjFUhE9pWtjQ9/rVPNIqBGewRMoa/sFMCbYnXJhLoBYnFiX+Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Virus-Scanned;
	bh=YAcKsa+N22qMYtLETYzF0/wBbwZ/VrpjV+7wi9PY8jc=;
	b=cld++G6zh70M1JSJ9J63TpuawOQC0jA+Y1jssRY8sZgSl1D1N/LQw+d/OQFwb/Gw8/nx
	 6s873r0ZVFZ1mNVWFY/TdWb02FlSsDCapk6X2tuVer3ExFClkG0WSAOqAHiwqggcU2HFu
	 HnzsF4/M8njpSl24NRuAj7fjrt325abg7lXe4W3QQtgfquoe85dBjIYB4m6ufP/Wrzaq8
	 HG05z9IMiqmol0BsT1W1wMYavapGbehjROT0p1D2Y53UZ+5Smq8tdlC4NMTH226ub4BMX
	 NqRXnyVJEH4Y7Ed9UimQW2X5jXuByWpg4AaPOyCwkmW6DXpmUim1vaZ/ZUN/NwLscDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=Fjvp4tRY;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98951606A31A;
	Thu, 22 Oct 2026 08:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98951606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=Fjvp4tRY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YAcKsa+N22qMYtLETYzF0/wBbwZ/VrpjV+7wi9PY8jc=; b=Fjvp4tRYs+w2onr2DddcI/RLjM
	RM9Vkh66VbyHCLExBUIFMhI74h9LVKaDhmCmzUO3tuZL/wAVmNBSL89ficrYac6ppFtsgfRj0l+hU
	/mRwNe6vHvo1bzs/fdzI+ZxWZvu4S8yJyv0C2atQjvxYU9n8KX2VKTW7iMCrDAGwYapvIK4RspQEX
	7mE9YejleLQttF6qj7q1gcDByK11TgyihDPrbc518mGkLVJIVM4m0+wT6zp3vm65OtAAr8+yf/SRJ
	WBn8R63OjO9wRsdtm/hjReE0zFgmajM4n8dW+fVvIv5g1vl0sk+96FwPBm3emEMikgtWKu7CciAob
	hNS7aK1g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJoUx-000EsD-2E;
	Thu, 22 Oct 2026 10:50:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJoUx-000Pxn-0U;
	Thu, 22 Oct 2026 10:50:07 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
Subject:
 Re: [PATCH 2/2] arm64: dts: imx8qm-tqma8qm: Re-enable A72 cluster after
 ERR050104 workaround
Date: Thu, 22 Oct 2026 10:50:05 +0200
Message-ID: <16849484.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261022-8qm-v1-2-2a597cb3debd@nxp.com>
References:
 <20261022-8qm-v1-0-2a597cb3debd@nxp.com>
 <20261022-8qm-v1-2-2a597cb3debd@nxp.com>
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

thanks for the patch.

Am Donnerstag, 22. Oktober 2026, 03:50:02 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
> merged upstream (d44e08dab27d). The workaround addresses the incorrect
> wiring of upper address bits in the A53 subsystem that corrupts TLBI and
> IC maintenance operations between A53 and A72 clusters.
>=20
> Previously the A72 CPUs (cpu@100, cpu@101) and cpu-map were removed
> from the TQMa8QM DTSI with an explicit comment "Due to missing
> workaround for ERR050104". With the software workaround is in place,
> remove the workaround-comment block and restore the full SMP topology.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> index f0e398eb2aad7..8cd6e75eb87a9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> @@ -15,13 +15,6 @@ / {
>  	model =3D "TQ-Systems i.MX8QM TQMa8QM";
>  	compatible =3D "tq,imx8qm-tqma8qm", "fsl,imx8qm";
> =20
> -	/* Due to missing workaround for ERR050104 */
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -		/delete-node/ cpu@101;
> -	};
> -

While the patch itself is correct, it is not sufficient. Instead please
revert commit 5d20f1ccb3393 ("arm64: dts: imx8qm-tqma8qm-mba8x: Disable
Cortex-A72 cluster"). This will restore the thermal zone for cpu1-cluster.
This commit was created with the intention to be reverted, once the
errata has been dealt with.
With the revert:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks and best regards,
Alexander

>  	memory@80000000 {
>  		device_type =3D "memory";
>  		/*
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


