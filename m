Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660951;
	b=brVlVFrjssKSKUwho3MPgwFghhCjlwCiPfaVNFPrPNf0UPP7KycEG/DnInEx+fpR25c6
	 wN3PYQjqi/fkgo9sWCJ3/pnxsq/Rpf08mod+3xaRJXaV6nSZDtFgWYjJdBK/y0aJs0ieQ
	 NSK+zACdmBjjseI6tuWn2H8Qufl0TPx5t4qJN3nxMtDGGS+4H5Pxwkx3OWp/ErD/CY1LA
	 K7Q2MW3Lf5b7xisuELeGU9KBH9DoLu0o6jNt0jp/MNmAeMy2HdEkw/EbBKGyEMnV0eqRk
	 htuJTrf+m6yFITGDIP3r1iqXYYqP8AbSpog9+FHmtWiEeLCNksL0r36dsSBPolIJDVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660951;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=vIuZzjSinRxDY+zCm2U1qFSdh7xsPJf789P0S8sw/Dc=;
	b=ej2rNgQgqCd7vHO29T40rjTuaM2RS/Ia9dbPmQCY+l8MshoZCWYSNT7066UpUEI32l1+
	 jsXgPImA/BWgDO0I5D3s4rtrUOZcGoBcjWD2QPAzo3F+ZX1BL73ESY+hM3BfFfJDkavn6
	 xnGSfGOlSrux8CO6xh0bk7Facg7I+Z+b0qSwz4+ADuQd9eOhdyH4joca3l7xJtGTdLLHm
	 aaKxXSmW+1ZthXWWuscL1kxltyYBkWnLHjgp6vJKdGItMsLwofHrCDNaR0qNNaWIk0xYE
	 KoHfGabI4etxuosduNCWh/7grxNOATCbM34L3O7SHWKTUrVHt1phj2Ntw4FSTkIXABg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=Feqs3f+C;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=57ED2Cub;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD18606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD18606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=Feqs3f+C;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=57ED2Cub
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4C36C7A0050
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:55:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 14 Nov 2026 07:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794660947;
	 x=1794747347; bh=vIuZzjSinRxDY+zCm2U1qFSdh7xsPJf789P0S8sw/Dc=; b=
	Feqs3f+C+Dt3q3nqYWakkuyPb5Qy1JAUzTCiYu9A9OLc8+IZ+Dfi7x+mO5nRlyET
	cADh42s+kF7ffuWBMFoHcZnXPcH9lRvgMIgHBv0aC2QG452WrJkvkw2RQRAWDivq
	WhxxluaytiUVAnw/Y6B/dPvrB1Zb8YG63Sb/joV5fTdCTx/VjqS0ukU92PQKoScr
	OCkOqIRRH1u8hgxGUBgazNJQNV/Gr0lXevpnNBfpJIaXq5ExxUbCEony0+Zv5mPB
	iLkK+fbri56uTpRWRrQLVsoY0o1cPCpW6/8mfosWM7uUQBMJ41LS2K1q9PeKQWzp
	X6vbqoHIKhA+IlTnQsooVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794660947; x=
	1794747347; bh=vIuZzjSinRxDY+zCm2U1qFSdh7xsPJf789P0S8sw/Dc=; b=5
	7ED2CubAqBDxg9hCmwM89B2B1ahThDiZYyyx+6+RmeQpxj1a5B1ZX6ADy9SrvWox
	StIQKc8Ab0G/lwyvwHHa6rHO7t9DXIIPNuQ4f7m7LGXm7Ci3q9QhvLLu7yv+iyIo
	4jbbmrBmo1xN22DVTd3uTP+faBWFzm++69pH2+cHp3yyDfDULRT0jjTxpw9E9e23
	9UEmcCDmj42vVP9cY8S0t9eoXZyYI3XCQEni5E65vnn49al87TDwR79lCSgE38ng
	982hcv5sbdFbE0sbBNXoOv0idByfdRUETire1rnw5uwpAWE69vwmWeIwpKPdWFAQ
	eGzB/0kyQXr7+GakyNWgg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794660947; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:rZo+YKwTpYoJZ7+ZBdchhxf+PqGLdYLbP4xR3K3k8i9Ciwr
	GLose0BD7Ky+c4ihteaijwBKLb/qAnPh3K8PIAZPB/+cTUTFHeMWaYs2PUcrEZD8
	xSmexAvN656K1FO+F2fW9ayFHBxkWBY+HNpG8quia0oe0+WuNuuZBFvWY+TKiOui
	FiqewvG+PWzU3xulwsbBcqhbCQOidIvvORmMBLWxhFF+dD4dIwy3cR+4+ZF4s0Qm
	UHLv7IpfU8HcfceVqkszLLNEyj5GLZpKBH7QD1nJf6CBgfOXvgUFfHVTrP9DrRxn
	+oI1k+MLuiTiARZ4KFin+LjVA/CS2c6ZLj8aFKg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:JX5FzESmgpUsESvHuc2ohLHpTPvUvYazjnwvs00wNko=:ND/8t9BGEC7w5414Fo46okQsCh2BXHBaLKxcjtf7YXk=;
X-ME-Sender: <xms:U1r4aogwuWRQFo3_KujnXDdOVeGd7Zr5SR0j3JpibiYKxNL64svLnw>
    <xme:U1r4apx1_I6EXLoYU0OwU_9Ln2kSZHyRzPxK39A5sBgyvBpeMbXfpl7Q59fJIeVGQ
    33S_7_IXTGEivUIprkNwFfWC61Y4u1QxymFvoJmRZ7MdKTmNb9NFgeo>
X-ME-Received: <xmr:U1r4auxal7G4bvekc9bGHLMOHLwW4bGBNZ5rkr0LCKlyPwnkHjBZaZfydm7h3hMJPPUw8JWR_bSkVtbQx0ThZoKx3sG2e9s>
X-ME-Proxy-Cause: dmFkZTEpt7PksyEXwjhHgpW1CBAo73QUZ4yNfyBBluBuK1XXwc+j76jocZP+MKKlueYKIf
    WE6OnyIWQrowLVdVNPijF9apwvZ751hPGJzEZh/8AQTjRCDPTnFwRZUJ8xKDrLpWGm3JRF
    40St8hs5B1BMkdR7DSYW2bu7eEJ+BHsHEJsTubk7eGYaCClnZwNkRi19POkodLHMqii07j
    hLIBvKb+bUaJVaKT+KVSjmtVeR6UiWbQu1gh3KM8h9PjcizbTXyynn4Ztjamveezz2Flbj
    mi2OSWIdYTYaeLILzSBHNfrTY7encU8uSOFxuOldtj+S0w+Qb0QctNauP2uRyfIloX5yp8
    2nbNH+fufhZJpJTfvn/3nUqWG6uPHW8lts+RL/sHB33YGFEJHWsLsT2bf9Yk/1ORwIwEFo
    Ice6rGUHI4deqNHmoxdUl1i6VLgcUsiA/uP9Amaq/diivAxtxQn2LT2098ZZLAUya1oOmY
    f4pQlLZvEthEoxlZKdh/kHXLuaXG1vfGs7za1+lzWr2fYFpoDZNwYP0vc8ziVklc6Mk1SK
    kiT5UdCv429viUW+Lc3v4oi4w+l21Y4sNiyJ7qLVK1gt+dQw0EDRAURLREnJY6CmCZjEEI
    YdQN68no5vHl0r0XrM/23pwYgqClqsfz4SnH1Ttk5IMVDNFOefne9777lPiQ
X-ME-Proxy: <xmx:U1r4arpVzHQlvAj3P4e_h_6W4hQuyW-PPb3YqPSdY0L4c98mYmHXxA>
    <xmx:U1r4aplbND9c7GTUhzC9h_LgY6XtGc8n10qbqqXKjkURJ2g7eF5iDw>
    <xmx:U1r4aswsmRYr4a4mi4BQe6REb-LMc8qCxwhf-EeR4K5RO9zoRRv3tw>
    <xmx:U1r4am1kLYfKPVQC_kEOCvYgS41lm_gegIIgZmIDEzbI9dHv83rq2A>
    <xmx:U1r4aqmdNXvfnaR7Mb257UcXqRq196Lx9-o-u4r_qccsEhLZan8c9pSA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 07:55:46 -0500 (EST)
Date: Sat, 14 Nov 2026 13:55:45 +0100
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
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Message-ID: <20261114125545.GC938627@ragnatech.se>
References: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
 <179465147165.2199510.7987717328787148087@kernel.org>
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
In-Reply-To: <179465147165.2199510.7987717328787148087@kernel.org>

On 2026-11-14 10:17:51 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new `gptp: ptp@e6449000` node in
>   arch/arm64/boot/dts/renesas/r8a779g0.dtsi uses `reg = <0 0xe6449000 0…

That is correct, please read cover letter.

> 
> --
> 
> arm64: dts: renesas: r8a779g0: Add gPTP node
> 
> This adds a gptp: ptp@e6449000 node to the R-Car V4H SoC dtsi. The commit
> message says the gPTP module is shared between the RAVB and RTSN Ethernet
> devices.
> 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > index 5284923b6cef7..f2d6696680db8 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		gptp: ptp@e6449000 {
> > +			compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> > +			reg = <0 0xe6449000 0 0x500>;
> > +			clocks = <&cpg CPG_MOD 2723>;
> > +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +			resets = <&cpg 2723>;
> > +			status = "disabled";
> > +		};
> > +
> >  		tsn0: ethernet@e6460000 {
> >  			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
> >  			reg = <0 0xe6460000 0 0x7000>,
> 
> [Severity: Medium]
> Can tsn0 and the new gptp node both be enabled on the same board?
> 
> The existing tsn0 node, which this patch does not change, already claims
> the same window as its second reg entry:
> 
> 	tsn0: ethernet@e6460000 {
> 		reg = <0 0xe6460000 0 0x7000>,
> 		      <0 0xe6449000 0 0x500>;
> 		reg-names = "tsnes", "gptp";
> 		...
> 		clocks = <&cpg CPG_MOD 2723>;
> 		resets = <&cpg 2723>;
> 
> rtsn_probe() in drivers/net/ethernet/renesas/rtsn.c maps that region
> exclusively and runs the timer itself:
> 
> 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
> 	...
> 	ptpaddr = devm_ioremap_resource(&pdev->dev, res);
> 	if (IS_ERR(ptpaddr)) {
> 		ret = PTR_ERR(ptpaddr);
> 		goto error_free;
> 	}
> 
> 	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev, ptpaddr);
> 
> ptp_rcar_gen4_probe() in drivers/ptp/ptp_rcar_gen4.c claims the same
> range:
> 
> 	priv->base = devm_platform_ioremap_resource(pdev, 0);
> 	if (IS_ERR(priv->base))
> 		return PTR_ERR(priv->base);
> 
> If a board sets both &tsn0 and &gptp to okay, the device that probes
> second should get -EBUSY from its request on 0xe6449000-0xe64494ff. When
> rtsn is the one that fails, the whole TSN Ethernet interface is lost,
> because a failed gptp mapping takes the error_free path in rtsn_probe().
> 
> The commit message says:
> 
>     The gPTP module is shared between the RAVB and RTSN Ethernet devices on
>     the SoC.
> 
> The new renesas,rcar-gen4-gptp.yaml binding also says "On R-Car V4H it is
> shared between RTSN and RAVB". However, renesas,ethertsn.yaml still
> requires the gptp reg entry on the TSN node. rtsn also has no ptp-timer
> phandle path. No DTS under arch/arm64/boot/dts/renesas/ references &gptp
> yet, so RAVB is not connected to this node either. RAVB uses the timer
> only through of_parse_phandle(..., "ptp-timer", 0).
> 
> Would it make sense to either move RTSN over to the shared node or
> document that the two nodes are mutually exclusive? Moving RTSN would mean
> dropping the gptp reg from tsn0 and from the ethertsn binding, and
> switching rtsn to a ptp-timer phandle.
> 
> A shared-node conversion would also need to handle reset 2723. rtsn takes
> it with the exclusive devm_reset_control_get() and pulses it in
> rtsn_reset(). That looks like it would wipe the timer setup, which
> ptp_rcar_gen4_probe() writes only once.
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110080727.2377040-1-niklas.soderlund%2Brenesas%40ragnatech.se

-- 
Kind Regards,
Niklas Söderlund
