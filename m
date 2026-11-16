Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794812913;
	b=w7aubUHPDoZ6Uc5+ri9ZCYzV1bb4IoM8rB15AsZfAdI4Svkv/rbYxkl3SZthzF0oi9po
	 ABjfRC7mFj3sJn44/A5twUZ/z7qi1NFrdoXT2warGYyDTWfb1Xedb72a8iLxyLu2IljO3
	 nPuaavdootg5TvEyKn3Qw3ZeoYr9hTiCpnW8Sq+ADeaiCTs9q5KlmYLn2TVp9DlNxfVKC
	 Cbxwr8/m5sHItZ6XRpX3H1oU0SaR/EgTO9t9AWG1JrF0XeaBUpI+B9CF7WkQmdoLder6E
	 fAK6CTvj4nmqdHHe3fK9Tyjpt3GtD9ozqLPrnRE+5DPMmMH+84VPDMr5Zi2849Hk0lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812913;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MiacfnaMPJRiamD9j7Q9tZD9+VM45fmbPYHfHzACMSw=;
	b=B883JcQ77pKQ0Gi5ZO+t42R6Rrt7m9MGOQiWbORYADsfsSBfcwgNnKt09BQ5kjxDNKg1
	 FF6yjk+xtExkFBPQvKfHmcR9Xa0Ntib6b2hc/L7KobzDCTolumcOPElFiQr0EdJo23Nik
	 ++GSN07xpZHPZXk1sgSz1mhuCZxSyvWBgZxPQu/b0seaoeO+TakDKo+IFAhKVlGl80Ysa
	 C18FoTZkVywbpwyMZl7gq4hg8IB2FqTA1sBSKANpEuPnTNmf3mX9AITZ3dS2HWeLM4dqv
	 m5NPexZFxDgsEzRlgvwLa2bJwvW6RkEBUwzWuOnx98Tf9WGBDe9d1lKya+M+tlzByKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fWYrLnqw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C423606A31C;
	Mon, 16 Nov 2026 07:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C423606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fWYrLnqw
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 39A65200F2F;
	Mon, 16 Nov 2026 08:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794812903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MiacfnaMPJRiamD9j7Q9tZD9+VM45fmbPYHfHzACMSw=;
	b=fWYrLnqwUCpjxBfnfgvV9PzKORJVmnhE5udLvkoSMMMhd0v73SLtD4ZRQ/Z0Trf+0qG72W
	FdMykCWfVFIXPmet43Ct1A7WLsVBp+v8MVAvKv5n/O8CDyuBqP6U59T3XycVjFA5gmT7hi
	upuVFlO6+gnGLC4ttt5hNIiMkbGuKPmLXmeKC7VS5KTqAJbA62H9vF3+S/OaPI5OkcJ43H
	+Vnc/2Xj/uQsRcnktBfnnoeV+gWcq6pJ9xmPy3jGsY1q/dYsZTQhlJtPfb5/dCDkUN0DPh
	NRgRp1bpqPj2rCzEDPEsc11gm9nrULdY6gTpAllF7jzgio6IcQ3hb57xnUb7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794812903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MiacfnaMPJRiamD9j7Q9tZD9+VM45fmbPYHfHzACMSw=;
	b=R9GM4t9lhTcS42Hi6uXLv6XP7qV+saOdhqtq6hTvIe39TFNIvUckzmA2hiOgWH0qe3P422
	046hJs7OKusRAhcTnhH9ab0ROXdmex+VM/WxxfxmJe+g2A/Ogp5rArX9rmfRFfLXXz/KTS
	t+fY/Lr7twEA0aDwpqsmC0eZrxCD7qmLufSn7QdFWdygxyCIx7LTCd+Qqss9ff/iMAQd2V
	FfIcbNALe7gUEa3JTglaQH092yMOVUkvFk9/cGGYr0mVuS7LcVFqWjlmwZlweP43rVT/wh
	DAxdRMYFDvSmNFUKzrZu+K3Dru7Yl22+F7mCuM0/FEd/SCZmvVSfgxBdGKsH6Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794812903; a=rsa-sha256;
	cv=none;
	b=PVU80Cq61LjPITdqRcGvG3c2Mmjn1J+3vdezUOk02Xx14FZY78PZY4DpdlRW3rKe6CrfXz
	ekrLzOO91Hrf404Q61mGjhaxNofwYIOcNAf8blha7e8WdrmYkGf74sd/Yi4PKDnn8F4gKV
	f4JXUX96yiDd8qdMp1oEe3VBgUzAxMCNXR6tAJuZSjfnuKo4GA8sRbSToW/rbmfbTYgels
	yrJbV2j3ul9mEX/Y6UNPqDI7/X46xlMPgeYkZg09i+CPxpY2KKjrGlxD4JQ4GJx7I73dzY
	3ULU/aUZZE2s1TQbCLV0N9fUrGMc+SrS70CfCEDrVmk46eazJCTbhid6xjOMLw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,  davem@davemloft.net,  kuba@kernel.org,
  pabeni@redhat.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  afd@ti.com,  andrew@lunn.ch,  hkallweit1@gmail.com,
  linux@armlinux.org.uk,  michal.simek@amd.com,  edumazet@kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: net: dp83867: add
 compatible and reference ethernet-phy.yaml
In-Reply-To: <179465553656.2199510.11430097651218280926@kernel.org>
References: <20261110-v7-2-topic-dp83867-v4-1-a268f83b1ec1@pengutronix.de>
	<179465553656.2199510.11430097651218280926@kernel.org>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Mon, 16 Nov 2026 08:08:21 +0100
Message-ID: <87fqx145ju.fsf@pengutronix.de>
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

On 2026-11-14 at 11:25 GMT, netdev-bot+sashiko@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] This patch adds `select: properties: compatible: contains:
>   const: ethernet-phy-id2000.a231` to=E2=80=A6
>=20
> --
>=20
> dt-bindings: net: dp83867: add compatible and reference ethernet-phy.yaml
>=20
> This patch adds a compatible for the DP83867 PHY ID, with an optional
> ethernet-phy-ieee802.3-c22 fallback. It also adds a select on the PHY ID,
> so dtschema now applies the binding to nodes. The $ref changes from
> ethernet-controller.yaml to ethernet-phy.yaml.
>=20
> > diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Do=
cumentation/devicetree/bindings/net/ti,dp83867.yaml
> > index 4bc1f98fd9fe5..2cd8311ece5e5 100644
> > --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> > +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> > @@ -8,7 +8,16 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: TI DP83867 ethernet PHY
> >=20=20
> >  allOf:
> > -  - $ref: ethernet-controller.yaml#
> > +  - $ref: ethernet-phy.yaml#
> > +
> > +# only the PHY ID, not every PHY with the c22 fallback
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: ethernet-phy-id2000.a231
> > +  required:
> > +    - compatible
>=20
> [Severity: Medium]
> With this select, the schema now applies to every in-tree node that has
> "ethernet-phy-id2000.a231". The binding still ends with:
>=20
>     unevaluatedProperties: false
>=20
> Several Xilinx ZynqMP devicetrees set #phy-cells on their DP83867 nodes.
> For example, arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts has:
>=20
>     phy0: ethernet-phy@21 {
>         #phy-cells =3D <1>;
>         compatible =3D "ethernet-phy-id2000.a231";
>=20
> The same pattern is in zynqmp-zcu102-revB.dts, zynqmp-zcu104-revA.dts,
> zynqmp-zcu104-revC.dts, zynqmp-zcu106-revA.dts, zynqmp-zcu111-revA.dts,
> zynqmp-sck-kv-g-revA.dtso and zynqmp-sck-kv-g-revB.dtso. It is also in
> zynqmp-sck-kr-g-revA.dtso and zynqmp-sck-kr-g-revB.dtso, with two PHYs
> in each.
>=20
> #phy-cells is not defined in ti,dp83867.yaml or in ethernet-phy.yaml. With
> this patch, will make dtbs_check report "Unevaluated properties are not
> allowed ('#phy-cells' was unexpected)" for all 12 of these nodes?
>=20
> The commit message says:
>=20
>     Reference
>     ethernet-phy.yaml instead, which also describes reset-gpios and the
>     other generic PHY properties existing devicetrees use.
>=20
> That doesn't seem to hold for #phy-cells.
>=20
> The later patches in the series keep the select and
> unevaluatedProperties: false. They don't change these DTS files either, so
> the mismatch is still there at the end of the series.
>=20
> Should the series either drop #phy-cells from the Xilinx devicetrees, or
> allow it in the schema? It looks bogus on an MDIO PHY that isn't a generic
> PHY provider.
>=20
> [ ... ]

This is fixed with the patch from

Message-Id: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutron=
ix.de>

which is already applied to the xilinx tree.


str

--=20
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
