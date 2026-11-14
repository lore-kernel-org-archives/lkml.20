Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660732;
	b=rI0w+dKNKx9N4Fy5wCX3BTJ7JfXUrz22Na40w9qDf2XNiD8HaWyIwtDenvLyftxmLVlj
	 Mp34UEaDJYzYGXGXwqNY4GuqzOwVhbTbbZ3e3ZUWBDjadXkq1pT4yCMqZzPTNkSSKukcn
	 EWUy4EtxIQxni2vFVaNBTOUu+A7uR1+41+v4B9CpN4ApWvHFPhoVf6Uxeazb4mAgj8Xgt
	 0E1pjxhBdN6NnhB02UGzBo0KsvexvL0LZGOq5WfP3jvhyWZ6qNQ7eitgngepeVO3Q5bcq
	 +8EXJlLE+/ZA7eWJvSpl8lFXcIoD0NckTcWhPTfuz7okkmupDYuhDxdheQhSN8TlUbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660732;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=WG9EHJftuEjBNzyO00nEEHkcy+mVuKMIDSHBr22EzOc=;
	b=xoUIddqk9aD2jqZ1Cm0/ZP5SMaLsoLH9DLiOzyr3TFn6XVk2emEagSL3a16MANcFGTc9
	 hsx9olzQwir11Tu/1dSuE+caZcVJNw+FKPPmthOSbPmtuVCKGE6IULDUOwEvIb37XxeKL
	 MCecf1XgKN2lLPqf/vg5QzzpsDTyq6VA++P1NmaxNcn3zE6YWIDjAyyiWBeH27ihhiQXK
	 TN5G3WVES9N4z6cmX00lMkXYnCJFGTBtV6MdQfL657DDGZ4OLxJZgEf/C3/pbCJ/TaQ1u
	 YIX6jWM41cE0zkvr/fT2Tgq/pmE8HuBK8L02GXk+TGbrI3oEaDA2r54zLpsMNXHmoxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=hk3EWkh1;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=myKHBYpc;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D9D606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D9D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=hk3EWkh1;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=myKHBYpc
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EDCEA7A0139
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:52:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 14 Nov 2026 07:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794660728;
	 x=1794747128; bh=WG9EHJftuEjBNzyO00nEEHkcy+mVuKMIDSHBr22EzOc=; b=
	hk3EWkh1QBF+vz0DGiJsxlQP/zHQR7WaKlbqkUrW4MJ05on1LKt+BUwF39JNcZBp
	aGcFCwfSgSnK25D6Gv2p4ZUBh2oPBMRMpR5SOl7zRCLBF4UuABJ2VEDxAP8bi7yr
	d4PXcSka4AWscsTZEwAZXIndxp8+sTVuMlWeKV6K3RohqVwfy76eQoptaAK11T8U
	Wdv0q4kvbe/DMmYaR3hHWadcu6j0+Bj8iSKvKG/Wkj1ButC9wlHilzb6fSzOlu56
	0JsysLPmYPFKDQ5Gu4ImUWPqUCiue4lB0y3tBDgdOKcjgwaZIayK4XWMakQpU/TA
	fkcYq4mozLZyZFxqLrcztA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794660728; x=
	1794747128; bh=WG9EHJftuEjBNzyO00nEEHkcy+mVuKMIDSHBr22EzOc=; b=m
	yKHBYpcw+Lqoktn28h4R5S60K+OCdRCyuWLtH+/xKyh4vVXpA9WVfqfMeeNBj2md
	BPV9bpx8Rbz9u3qKsHhGBz2eNxDAMPIQ5XL9UK+2Kv+vfxbt5w08nWdpWvkHbb0+
	/rYnLSdNMZkVbs+zIz0mYBEC1aYMq8wOwH8xGUJWpUvGqfJWXtbSeoiyVnPBKpkW
	3VCdHQlO2Fc73sEZ6miYyAYAOeo1eCFeGb4rDyJs8g9+QfGHYxlX5SrDQgIounjQ
	YutyBXllqH2tJP5SwBakbkrOD31AdLagOVgX0UU8Q6ca4kVQRXDvahUCDx7rYTLC
	HxilUMWFBOkU3s3FjfwDg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794660728; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:J+KxOuU1rIDyevetjZZ0/QZg2iXtZVsFkHWu2Hmlof/OjiO
	x736z5Yit583uQawWkfBFySXV+iNLd23i4DEzzN2s44XSbBy5VUryzcIwEhfL0UA
	vo0idigObuwL5dbfe7VCi49yjTF0dQEzZ4EW87NCikDU6sXdtA1NdEk5q3zRcf5p
	tzHFOywOADPU89LIPhQ6+A8SPBdDhuwpQMAxUxr/WKudyJgSQaOmbyqZpo6eXTgj
	khdO3gbkyAwm735ioo+8D9dwIqleIP4iV8NFUx7xHZm2Hgeh92B82/uNZRs9DF55
	fDoq5B5QoydW30QAzC+nN9/GwqWu1WTJdXnc7KA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:fYOsLtrADVOJZJZrGIYoSBVs2pTcXwETYJV9JUYXOnw=:AnUOPMG/pAe5kbnfhObE1GaXNN84C/S8O1fTWm1AH9g=;
X-ME-Sender: <xms:d1n4ahrMJTSd8FNUFafp3Qr776yC7nhOkDdnqzbYk_NQoVrLxHGa8A>
    <xme:d1n4asbel3pOkHGkiX8tfX54sJtjt-sNgahbYZPQRbIQQDJeTBU97qKT-UchWtbM2
    eV-r6AyX_ElaFIwYM5LX36tc-l6E1H4wKARuJ0WWuKzvR5ALSrALABy>
X-ME-Received: <xmr:d1n4as7d9gFO1o-fszZGii2XDmRlNmzsZtxhiPllQhcvv_v5ogUIod4NM2FVBIOuorchAtLmBmnSmFklZb95oAlpkNUZVeQ>
X-ME-Proxy-Cause: dmFkZTFe9uWx24Rrl+vmyKIeP1whEGPtyBnwdnbwjcvnX6l71xv4sEgdTYs3vyHSzNW85a
    XKIXUWapZ8LvnopoLfuG2v2jaVlSaWdyMa/qp+YetmNifvEuQtE/5zDxUCi8J6/L7PpyZf
    fPtSLmzCy3BJgXlfinpqP/eoW5iRqnRF2h9PW02D5ddMl3CgSYk7IuWJNHGGGKwdVU/eIJ
    BlbHWKUacQSkfroT++gABi4YyNpn0a0ewwZ1HMJahwkrAJ5lFobwWXeLQoIY/b/5WI+IHI
    eLnLAjW9UhgZRPFqWWSTzUuYuwr4dvrZfKCnXdbvcchceAakLF+kzyrM+tw6kMQW9ICblG
    Nehy8a1pSZqZxrWmFUpxOcbLKMxaU88cwaXn6k/Zt5cJmKfIWpOf2RmUfTZXv3583kJcAh
    mHYjPXjlZwjuS3Qo6C5xgZzsbNuohTaptHh87T/yE0DKoWjlthljMfGiVbriwIM6gh6HmZ
    HGvgP5SuiE1N2xln3fKokueaDQEEmRnv1tDGmo5lEDD6erKKiMMmWVMQqpm4+h0VsMvoIs
    6jBO/g23e6/187iDLBYPpSPDBWBiza69I6wuM3DYD4hweGaV610KueBytaU2Ky6QFuyeDD
    W6PDawbKWS9MfIzUkB5Wg1MJpV5Al26zmSQADlaZILYhpUYie8B+Shz8k8+g
X-ME-Proxy: <xmx:d1n4avQbZiErYmueZ2jYUHgCP3hnsmzm_YD2CKbACPWcWieAKHwSkQ>
    <xmx:d1n4akvePe4wWogNs-fALlJhYjl4Hh1ASqhsox0MrlAWZy5TkoKjqA>
    <xmx:d1n4apa-KQHDvi3dPQbDzSoBlveXp4CmHbxMObKhGthJYE37l2ZlCw>
    <xmx:d1n4am_z7tvHQ2ir8-IbhboVUpMBgwKff5Bu1vmOokMCaQFtyVqG3A>
    <xmx:eFn4aqt50Nzw35Ogsya0fOAcEGOo5U_LbwhQpfNup0jUeQ8EBJ_0UKGy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 07:52:07 -0500 (EST)
Date: Sat, 14 Nov 2026 13:52:04 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: netdev-bot+sashiko@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	richardcochran@gmail.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, vadim.fedorenko@linux.dev,
	sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 1/3] dt-bindings: ptp:
 renesas,rcar-gen4-gptp: Add R-Car Gen4
Message-ID: <20261114125204.GA938627@ragnatech.se>
References: <20261110080727.2377040-2-niklas.soderlund+renesas@ragnatech.se>
 <179465146821.2199510.735416369980468650@kernel.org>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179465146821.2199510.735416369980468650@kernel.org>

On 2026-11-14 10:17:48 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 4
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new renesas,rcar-gen4-gptp binding describes the gPTP
>   timer as a standalone device.

That is correct, please read cover letter for reason.

> - [Low] The binding sets additionalProperties: false and has no
>   'interrupts' property, but the Gen4 gPTP IP appears to have status…
> - [Low] The commit message and the binding description (renesas,rcar-
>   gen4-gptp.yaml line 19) say that on R-Car S4 the timer is 'shared…
> - [Low] Not confirmed (baseline decision: false).
> - [Low] Not confirmed (baseline decision: false).
> 
> --
> 
> dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
> 
> This adds a DT binding for the R-Car Gen4 gPTP timer on S4, V4H and V4M.
> The timer is described as a standalone node with reg, clocks,
> power-domains and resets. The patch also adds a MAINTAINERS entry for the
> binding.
> 
> > diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> > new file mode 100644
> > index 0000000000000..3edd64d400387
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> > @@ -0,0 +1,64 @@
> 
> [ ... ]
> 
> > +description:
> > +  The R-Car Gen4 gPTP timer enables accurate synchronization of the clock in
> > +  the control system. The timer is system-wide and used by different Ethernet
> > +  devices on each Gen4 platform.
> > +
> > +    - On R-Car S4 it is shared between RSWITCH and RAVB.
> 
> [Severity: Low]
> Is the S4 part of this accurate? The tree doesn't seem to have an EtherAVB
> on S4:
> 
> - renesas,etheravb.yaml lists only r8a779a0, r8a779g0 and r8a779h0 under
>   renesas,etheravb-rcar-gen4. There is no renesas,etheravb-r8a779f0.
> - ravb_main.c has no S4 match.
> - r8a779f0.dtsi only has the renesas,r8a779f0-ether-switch node and no
>   etheravb node.
> 
> Also, "ptp: Add driver for R-Car Gen4" later in the series only mentions
> RSWITCH for S4.
> 
> The commit message makes the same claim:
> 
>   - On R-Car S4 it is shared between RSWITCH and RAVB.
> 
> > +    - On R-Car V4H it is shared between RTSN and RAVB.
> > +    - On R-Car V4M it is only used by RAVB.
> 
> [ ... ]
> 
> > +  resets:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - resets
> 
> [Severity: Low]
> This is a minor point. On V4H, the reset (and clock) here is the RTSN
> module reset 2723, which tsn0 also uses. On S4 it would be the RSWITCH
> module.
> 
> In the final series state this does not cause a conflict:
> 
> - ptp_rcar_gen4.c never calls any reset_control API.
> - rtsn and ptp_rcar_gen4 cannot be bound at the same time because of the
>   exclusive MMIO claim described below.
> 
> Once that register overlap is resolved and both drivers can bind,
> rtsn_reset() would pulse the shared line:
> 
> drivers/net/ethernet/renesas/rtsn.c:rtsn_reset() {
>     ...
> 	reset_control_reset(priv->reset);
>     ...
> }
> 
> Would that reset the timer that RAVB relies on?
> 
> "ptp: Add driver for R-Car Gen4" says the gPTP shares its clock and reset
> with RSWITCH or RTSN. Could the binding description say so too?
> 
> > +
> > +additionalProperties: false
> 
> [Severity: Low]
> The binding has additionalProperties: false and no interrupts property.
> How would the timer's interrupt outputs be described on this node?
> 
> On S4, r8a779f0.dtsi routes dedicated SPIs named "gptp0_status" and
> "gptp1_status" in the rswitch node. They might come from the gPTP block,
> though they could also be RSWITCH status aggregation. The tree alone
> doesn't make that clear.
> 
> A binding should describe the hardware fully, even where the driver doesn't
> use a resource. Should an optional interrupts property be added here?
> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a779g0-sysc.h>
> > +
> > +    ptp@e6449000 {
> > +            compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> > +            reg = <0xe6449000 0x500>;
> 
> [Severity: Medium]
> Isn't this the same register window that renesas,ethertsn.yaml already
> requires as the second reg entry of the RTSN node?
> 
> Documentation/devicetree/bindings/net/renesas,ethertsn.yaml:
>   reg-names:
>     items:
>       - const: tsnes
>       - const: gptp
> 
> r8a779g0.dtsi uses this window in tsn0:
> 
> 		tsn0: ethernet@e6460000 {
> 			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
> 			reg = <0 0xe6460000 0 0x7000>,
> 			      <0 0xe6449000 0 0x500>;
> 			reg-names = "tsnes", "gptp";
> 
> rtsn_probe() maps that region exclusively and registers its own PHC on it:
> 
> drivers/net/ethernet/renesas/rtsn.c:rtsn_probe() {
>     ...
> 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
>     ...
> 	ptpaddr = devm_ioremap_resource(&pdev->dev, res);
>     ...
> 	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev, ptpaddr);
>     ...
> }
> 
> Later in the series, "arm64: dts: renesas: r8a779g0: Add gPTP node" adds a
> ptp@e6449000 node with the same reg, clock and reset. In "ptp: Add driver
> for R-Car Gen4", ptp_rcar_gen4_probe() maps it with
> devm_platform_ioremap_resource(), which is also an exclusive request.
> 
> Take a V4H board with &tsn0 enabled, such as White Hawk Single. If it also
> enables &gptp so that RAVB can use ptp-timer = <&gptp>, won't whichever of
> rtsn and ptp_rcar_gen4 probes second fail with -EBUSY? That would lose
> either the TSN interface or the PTP clock that RAVB needs.
> 
> S4 has a similar overlap. The gPTP block sits at RSWITCH base +
> RSWITCH_GPTP_OFFSET_S4, inside the base region that renesas_eth_sw_probe()
> maps exclusively. A renesas,r8a779f0-gptp node written to this binding
> would overlap that region.
> 
> dtc doesn't check for reg overlap between non-sibling nodes, so this would
> only show up at runtime.
> 
> Is there a transition plan for the gptp reg entry in renesas,ethertsn.yaml
> and for the rswitch mapping, such as deprecating the ethertsn gptp reg?
> The commit message doesn't mention the overlap or the DT ABI impact.
> 
> > +            clocks = <&cpg CPG_MOD 2723>;
> > +            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +            resets = <&cpg 2723>;
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fe23913b1e432..085fedac38ef5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23822,6 +23822,12 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> >  F:	drivers/mtd/nand/raw/renesas-nand-controller.c
> >  
> > +RENESAS R-CAR GEN4 GPTP DRIVER
> > +M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > +L:	linux-renesas-soc@vger.kernel.org
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> 
> [Severity: Low]
> This is a minor note. At this point the "GPTP DRIVER" section lists only
> the binding, and nothing binds renesas,rcar-gen4-gptp yet.
> 
> Later in the series this is resolved. "ptp: Add driver for R-Car Gen4"
> adds F: drivers/ptp/ptp_rcar_gen4.c to this section, along with a platform
> driver that matches renesas,rcar-gen4-gptp. Putting the binding before the
> driver looks fine.
> 
> > +
> >  RENESAS R-CAR GYROADC DRIVER
> >  M:	Marek Vasut <marek.vasut+renesas@mailbox.org>
> >  L:	linux-iio@vger.kernel.org
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110080727.2377040-1-niklas.soderlund%2Brenesas%40ragnatech.se

-- 
Kind Regards,
Niklas Söderlund
