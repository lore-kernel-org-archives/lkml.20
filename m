Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311318;
	b=m5D7QEMDboWD8OzaAtpBdvnTT3ubnhtLS4HCx+G3jw/doww2CvlPVMnQChji4k/EnUvb
	 i1e/H2Sq0ejRHjvRrNRN3oTv4eDV3SU2MBgkyFOKwL+Tqxa/yVvnzt1ZS3eVLDMPtlV4l
	 XHDIzIfm/yFviKB+ysFN1YNCA2EE5tiB2wXbXSsceVp+DdlUsR8wfDW2/Il4GqnlsjfrF
	 NtyQSN6nCJ8RQbmsBGRmo9NLRlx4v1GbUjaRfl7nsWyR+zO0A7rGsoTFoU/KmgYBafzxN
	 iL+QjKRxKBp6dl+1G6DNhTtOQb7fgxeqYuULlsXUDs5T/8jrs4ESLlS4f9g4eDFO6vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311318;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=tSZhKAIK1EHxD3XnyhYBftCRX2avMBVk9Fjkswdk57s=;
	b=5iqbsAvsnVg9Cq2rBtIChax81HGGhELUNm33lPBmbo/WZ9DKwrW/60WpwbGPguvxfc9V
	 E/ZZXMZsq4c3D/K0rg+1dZ3SCvxRV+Fi+BSqdxpZ8IhlVT2OlVk9ZM1ew8N3ATJaBK01c
	 A/A8cbq64LPKz+9tvTm5kyxAAVxCsM5skL9P7Ov3IHe74H3oeVNaXtqM57JFzIcVDa/ep
	 Wnh9JGpwvh2P8OI9W6g2dLfiUMH3PW3zwYZxDdY2s+5VXTjIMQry2vKzE8ATqHEdfn2oN
	 iNg2woDKMmfFIfDHzjYOHaVggAiZ4ezs/bFWQDR6HKHp16OG1DueYuJqkaXG9EQHFYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qqtOx6p6;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC332606A321;
	Tue, 10 Nov 2026 11:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC332606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qqtOx6p6
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D05D33D;
	Tue, 10 Nov 2026 12:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794311173;
	bh=tSZhKAIK1EHxD3XnyhYBftCRX2avMBVk9Fjkswdk57s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qqtOx6p60ZFA7kfVRbtUBadyGZVACGSAhtNYhMG70e/xaOTbs1fvT3czoHy4nzOub
	 rswa3AR9CdilC95o8FcHOvcnZBq7V55yydP3MsPFIO3VbbjkJcHCuIkgcQ2EJwbr+R
	 rga9Ct3Bo23RZBe8A6a2U96VtderXVHXSRuYobC0=
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
In-Reply-To: <20261110093954.GA129290@francesco-nb>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com> <20261110093954.GA129290@francesco-nb>
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Verdin iMX8M OV5640 camera overlays
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Francesco Dolcini <francesco@dolcini.it>
Date: Tue, 10 Nov 2026 11:48:33 +0000
Message-ID: <179431131331.194410.16578072822295578866@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Francesco Dolcini (2026-11-10 09:39:54)
> Hello all,
>=20
> On Thu, Oct 22, 2026 at 04:31:24PM +0200, Ernest Van Hoecke wrote:
> > Following feedback on the Verdin iMX8M Mini series, introduce a binding
> > for the connector's sideband GPIO nexus. Add connector mappings to the
> > carrier descriptions and stable labels for the SoM-specific CSI media
> > nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
> > and all three carrier boards.
> >=20
> > The binding intentionally covers only the connector's GPIO signals.
> > MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
> > existing bindings and are connected through stable labels in the Verdin
> > device trees.
>=20
> We have now an official page documenting this connector
>=20
> Link: https://developer.toradex.com/hardware/hardware-resources/periphera=
ls/toradex-camera-connector/
>=20
> Ernest: if there is a new patch series, I would mention it.
> Kieran: the danger note in the page is for you ;-)

Awesome. Lets hope the fire stays as imagery :D

I did get my 'camera dt-addon' compiling with Herve's DTC updates, but
there's still (probably quite a bit) more work to do yet before we could
have generic camera addons for connectors.

Looks promising though!

--
Kieran


>=20
> Francesco
>
