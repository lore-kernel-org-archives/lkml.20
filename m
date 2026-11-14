Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660779;
	b=NrDtXH3d7Ix5a5IrJZqWE7BijhTE0UCFU2m9KT+vrCPtQYGMDG/3PFAldMLpPc7AD/jS
	 ArUkh41lSRzL6OMzu0GNvxjS//yT9FfanQF376rQZJsFjSYetOMlvFSQz8G43M01td1iK
	 NeDD/lt8w2taj7TotQDsSDbsIAfzKiDDXQUaKErpMvTTLYt2myFazXN84T+H3wML2aSUH
	 VmVBKgVX57j0sItHC/++G4oE4QwSuNppoO5fa7I/D5SD+U+xNdXtieqlHZpgkcgpaWiW+
	 Zq/DGEAt6R/5bfFYQOJR5JSWOh4806GMgFuV1y8H3w/9ki8K5ZM1En9NaMdtaCe4dfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660779;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=i9o//pEwTs5phHwrFtlVXfetBmeih0my6D0OWyrFcug=;
	b=Dqsc6lNB8zNOoKiRM981of/2lYMcKXb7D9H1MvBYhCCLIGTcsQdCTl5LyeDbVunV+YZg
	 eGEBeFOSLMurKDYIpvEpDWSc6B8McnwrOlpkZ+jmbTKEoSAQRAAmsL02RRXPqR9lAGKod
	 8FmGp9KtbgQe4zG7qiHUp6sF70mEczGJCn1UNYEkQA8Hb2nMNSvp2ZcFmAEd8yhMUtSZH
	 /oq5p8+T7YXGJlmHM8lj+EtNTpU3Cty+EoIBu9nkVSp8lZhyWQKVBvtBASkYG2V0t+LhU
	 sFaKwE1kWgGVBPFHDC7u0L5r72Qf8aZoW3IcvrbuV1MXAenrKTuHvIKFn+GT1/l6ZgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b="njlyJMe/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RH3Ut1A6;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14E606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB14E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=njlyJMe/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RH3Ut1A6
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6B03F7A0125
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:52:58 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 14 Nov 2026 07:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794660775;
	 x=1794747175; bh=i9o//pEwTs5phHwrFtlVXfetBmeih0my6D0OWyrFcug=; b=
	njlyJMe/5y13WFTMB1wFNwzJUWwk3mX5ouwopups6CVNTixZ+DFtVw03gZqq6sZ1
	6UMxmLrZUeCa6XAjc0eelE7FmsBwS3M8Bnmx8I5yuVKztx0IcF8mGTA69Boj8TLY
	1jbeZpSlFzIAr224jHWFults1ZEb0VXQHNSBBnAdudekHmVBIgpGPIA8Z70QnEK8
	wK8Qd/y8Eh7+MgREGJ+XdUQij46bQgBW+v6sNIyvWZGcME8Egvyev38SEFZ+rPYi
	P93GO6OwJRFLYQ9O0/gInEYFQ+xMu5ILLhj+U32PG+Eg3D2YgOM3XfffUixVrtGz
	8WrTQt91dsMmQDNgbPQcEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794660775; x=
	1794747175; bh=i9o//pEwTs5phHwrFtlVXfetBmeih0my6D0OWyrFcug=; b=R
	H3Ut1A6nWioDltyCcaX8ABCyI4v98hXcHM+i5Wo3R2L9p3e0AVGWrtyzUMpfwhLV
	43H5yD7v28lENppX+kcBEDeTsn+rfB8rBRmK832DrpBJs32mZ+E7g+aIRwDHlw+1
	M1lbftHVPKl6RRl3HTLhxsS/IJrX/jxhNmytcPFmSa+Qr/hzi81jPV2lmK74zckd
	LcZ7MiyYRpNECZr2sCgg2JQZSCfS0mzIDD5TZfRMemjT9l/lSVqFE0JDIEkcd9Oa
	Vqx0Z90OdSqdxKq1UJRr3YgJd/SpEZD6SnfFF2cMJ+bn0faVSU8Axhjv3YqtegCV
	h+RtklyKoBMQ7iGmoLw1w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794660775; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:AaIrluL7/NbpwEY0/I21smExR6V4+bKNloRwFtkYQ7ch5o1
	f0zTxvb4cUnCH9pe4l4/c3X5OX4Lgffeme57JzIUCNUE1DiNDOs0h6UlQ+hrmkyU
	9z/+9DHrKRAJNlw1k3rf/UHKuHK9rBWaCvRlvFlBeZDzJ3JaCMr5YjCgS7wm6WAA
	kGtJh1hnBv1dnR1uo3dlTDgYQjaOxEeCHBTay5av5qvALptgXFPBNGaDRtCXf3t4
	E1pU8CVBxItBS04TZ10hAI//KsBbBgBAKbFtRpvMAtvfWUIk7yHLkhzR5CfyWYto
	kLXox7swghydxSxH6t3rxe8KaFcgX/5bUfamuew==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:z09GMUVMcEqKnzy0IgZtXGDvK/tBmBErinWN+hWbYgw=:ru81f8ZCR9EHZIj3LJkASMq2kr/L/JnhVYPlywoF+S0=;
X-ME-Sender: <xms:p1n4agFsVJodRNYhtQJBXpub_ccEJlTFmgGHSH8JC5vAzBCgDAiJ-A>
    <xme:p1n4aiF-D5tu_dnshiXujXqBZe5ZuVsjnu5DT128Pdabvx3MDyJxkiSCiVs1zfLJe
    buNrgJjTNE7etP2yACBdbjv_sExM8itpBZILaAoIGa-XIUNqq58ydmJ>
X-ME-Received: <xmr:p1n4ao159R8cgEsFG5ZmcdFKhQ44WjpPzXONdvyFo0a3450eLjxZjMVLaA9U3NFl_EqFQ80iKC8CUf0gSzQ8se3yjDB4ZuQ>
X-ME-Proxy-Cause: dmFkZTFe9uWx24Rrl+vmyKIeP1whEGPtyBnwdnbwjcvnX6l71xv4sEgdTYs3vyHSzNW85a
    XKIXUWapZ8LvnopoLfuG2v2jaVlSaWdyMa/qp+YetmNifvEuQtE/5zDxUCi8J6/L7PpyZf
    fPtSLmzCy3BJgXlfinpqP/eoW5iRqnRF2h9PW02D5ddMl3CgSYk7IuWJNHGGGKwdVU/eIJ
    BlbHWKUacQSkfroT++gABi4YyNpn0a0ewwZ1HMJahwkrAJ5lFobwWXeLQoIY/b/5WI+IHI
    eLnLAjW9UhgZRPFqWWSTzUuYuwr4dvrZfKCnXdbvcchceAakLF+kzyrM+tw6kMQW9ICbtL
    lwnsRfdIvSFhGGIR6FKJ4RsPtB110tXVBNN24G3hBGFeOMALwzVHwJZmV/6Fk01PHX5vLx
    WBtAPZT+kTOeA/sv0DdD97fgFQInkkOLW8wdhylK423i4ixsz/khu6Ge9zEGIX3FPxXodY
    jSDnP/lEFVt/TVl6JBGQPjr8San3vPxxqcLfSwFAFj+kefVHGlxGYCvFbnA/aFjXU7dJNB
    c4mlcOzy/nodT+8V4/rNfotUh/C1E0wmcZd5IWsKUpbzFdyucebkSDTnIKLSByZ4QYhNoB
    Bm82JG1ndd4f5dM267IS1FkL0Dnjb9HiGEJbkkn0hQJTOBwuwOMWe8aYIQ/g
X-ME-Proxy: <xmx:p1n4akcG0NwvF2775JSvFKycCCg8-j36L2YDtbYRwQRMUQgnC6NKLA>
    <xmx:p1n4aqI1YeEeI8y9fP_msGM_5ZLLfhqrvlMEpR-eZWsqdu853sZmqA>
    <xmx:p1n4aqEY4j2RyhtDbskGH7k9IvF1-kGBSF8JEfU_F50ate8riwJOlg>
    <xmx:p1n4ah4sd-MqCAHu01ghfb-y7GXGVcjsPO_r5b29b76X-b4cEa5VHA>
    <xmx:p1n4auogryWoytAitzlz-gNYq8kmHgpcGd-hapb8dHUsDCOjev9seJmj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 07:52:54 -0500 (EST)
Date: Sat, 14 Nov 2026 13:52:53 +0100
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
Subject: Re: [PATCH net-next v8 2/3] ptp: Add driver for R-Car Gen4
Message-ID: <20261114125253.GB938627@ragnatech.se>
References: <20261110080727.2377040-3-niklas.soderlund+renesas@ragnatech.se>
 <179465146990.2199510.5608660826601726240@kernel.org>
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
In-Reply-To: <179465146990.2199510.5608660826601726240@kernel.org>

On 2026-11-14 10:17:49 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new drivers/ptp/ptp_rcar_gen4.c is a second, standalone
>   driver for a gPTP block that rtsn (V4H) and rswitch (S4) already map…

That is correct, please read cover letter.

> - [Medium] ptp_rcar_gen4_probe() calls pm_runtime_resume_and_get(dev) and
>   throws away the result.
> - [Low] ptp_rcar_gen4_probe() programs the increment and starts the timer
>   (iowrite32(1, PTPTMEC_REG), line 182) before ptp_clock_register().
> 
> --
> 
> ptp: Add driver for R-Car Gen4
> 
> This commit adds a standalone PTP clock driver for the gPTP timer found
> on R-Car Gen4 SoCs (S4, V4H and V4M). The timer is described as
> system-wide and shared by the Ethernet devices. On S4 and V4H it shares
> its clock and reset with RSWITCH or RTSN respectively.
> 
> > diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> > new file mode 100644
> > index 0000000000000..e82b6c5abc306
> > --- /dev/null
> > +++ b/drivers/ptp/ptp_rcar_gen4.c
> > @@ -0,0 +1,225 @@
> 
> [ ... ]
> 
> > +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> > +{
> > +	struct ptp_rcar_gen4_priv *priv;
> > +	struct device *dev = &pdev->dev;
> > +	unsigned long rate;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(priv->base))
> > +		return PTR_ERR(priv->base);
> 
> [Severity: Medium]
> How is this driver meant to coexist with the existing users of the same
> gPTP block on S4 and V4H?
> 
> On V4H, tsn0 in r8a779g0.dtsi already lists this register range as its
> "gptp" resource:
> 
> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:
> 	reg = <0 0xe6460000 0 0x7000>,
> 	      <0 0xe6449000 0 0x500>;
> 	reg-names = "tsnes", "gptp";
> 
> rtsn_probe() requests and maps that range:
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
> The binding example for this driver uses the same reg = <0xe6449000
> 0x500>, and so does the r8a779g0 gptp node added later in this series.
> devm_ioremap_resource() and devm_platform_ioremap_resource() both call
> request_mem_region().
> 
> If a board enables both nodes, wouldn't the second driver to probe fail
> with -EBUSY? That would lose either the TSN port or the new PHC. The
> later gptp node is added disabled, so no in-tree board hits this yet.
> 
> On S4, rswitch_probe() maps its whole register region and reaches the
> gPTP inside it:
> 
> drivers/net/ethernet/renesas/rswitch_main.c:rswitch_probe() {
>     ...
> 	priv->addr = devm_ioremap_resource(&pdev->dev, res);
>     ...
> 	priv->ptp_priv =
> 		rcar_gen4_ptp_alloc(pdev, priv->addr + RSWITCH_GPTP_OFFSET_S4);
>     ...
> }
> 
> An S4 gptp node looks like it would collide in the same way.
> 
> This driver is also very close to the existing
> drivers/net/ethernet/renesas/rcar_gen4_ptp.c, which rtsn and rswitch
> already use. Both have the same PTPTMEC, PTPTMDC, PTPTIVC0, PTPTOVC*
> and PTPGPTPTM* register map, and the same adjfine, gettime, settime
> and adjtime logic. The commit message doesn't mention that code, and
> neither consumer is converted.
> 
> The Kconfig help says the clock "can then be used by Gen4 Ethernet
> drivers". In-tree, only ravb consumes an external timer, through the
> "ptp-timer" phandle and ptp_clock_index_by_of_node(). rtsn and rswitch
> drive the block privately, so the shared-timer setup described in the
> commit message doesn't seem reachable on S4 and V4H.
> 
> Could the commit message say how the two implementations relate? Or
> should rtsn and rswitch be converted to use this PHC?
> 
> [ ... ]
> 
> > +	pm_runtime_enable(dev);
> > +	pm_runtime_resume_and_get(dev);
> 
> [Severity: Medium]
> Should the return value of pm_runtime_resume_and_get() be checked here?
> 
> pm_runtime_resume_and_get() calls pm_runtime_get_active(dev, 0), which
> drops the usage reference itself when the resume fails:
> 
> include/linux/pm_runtime.h:pm_runtime_get_active() {
> 	...
> 	ret = __pm_runtime_resume(dev, RPM_GET_PUT | rpmflags);
> 	if (ret < 0) {
> 		pm_runtime_put_noidle(dev);
> 		return ret;
> 	}
> 	...
> }
> 
> If the clock enable or power domain power-on fails, probe still writes
> PTPTIVC0 and PTPTMEC to a module that isn't clocked. It then registers
> a PHC whose gettime64, settime64, adjfine and adjtime callbacks access
> the same unpowered registers. Userspace can reach those callbacks
> through clock_gettime() and the PTP ioctls.
> 
> The ptp_clock_register() error path below and ptp_rcar_gen4_remove()
> both call pm_runtime_put_sync() for a reference that was never taken.
> That ends in rpm_drop_usage_count(), which warns "Runtime PM usage
> count underflow!" and returns -EINVAL.
> 
> The v6 changelog says pm_runtime_resume_and_get() was chosen on
> purpose. Was the usual check and bail-out after it left out by
> accident?
> 
> > +
> > +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
> > +	iowrite32(1, priv->base + PTPTMEC_REG);
> > +
> > +	priv->clock = ptp_clock_register(&priv->info, dev);
> > +	if (IS_ERR(priv->clock)) {
> > +		pm_runtime_put_sync(dev);
> > +		pm_runtime_disable(dev);
> > +		return PTR_ERR(priv->clock);
> > +	}
> 
> [Severity: Low]
> If ptp_clock_register() fails, does this leave the timer running?
> 
> The timer is started with iowrite32(1, priv->base + PTPTMEC_REG) before
> registration. This error path never writes PTPTMDC_REG, but
> ptp_rcar_gen4_remove() does:
> 
> 	iowrite32(1, priv->base + PTPTMDC_REG);
> 
> On S4 and V4H the module clock is shared with RSWITCH or RTSN.
> Dropping this device's runtime PM reference therefore may not gate
> the clock. The counter would keep running with this driver's increment
> and no software owner.
> 
> rcar_gen4_ptp_register() avoids this by setting PTPTMEC only after
> ptp_clock_register() succeeds. Could the same ordering be used here,
> or could PTPTMDC be written on this error path?
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110080727.2377040-1-niklas.soderlund%2Brenesas%40ragnatech.se

-- 
Kind Regards,
Niklas Söderlund
