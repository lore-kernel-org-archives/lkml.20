Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006951A72C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919673; cv=none; b=KNaSXKThGlfCq861BESeRbBBE6xwNMjTjNNif8L37Rf0pPcM21X0l8B90j3msI0YvK8t5+DY1798xvJ8PoSVOEhQioFOP7/PlFLQZL0mt+thH19pgGT6pKkQ1TEp0AA0TtMVfdagYk5krUmTZuZd4N13tuU26kg3qUyD/On/u5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919673; c=relaxed/simple;
	bh=Ohen3rZxNLiKkHAShhfXOPV9gxWORaB2IXrMLIJXQqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2E/tHByg8v2RKe27FGyXWxYpqjt+agZ3GvrShgErzuVr4guPts0UEiLVkGeWWbWIRyAdQtRGi+fz9t/5FE3qqmWAg4XMXKijA2nNU803g5qbWlL8dRDs5LoKGOsP/SNcWzT952nic2SCaM0FzPr3vvZ/sS52KpKYWzBKcyzrb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J0EHjVJf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rqCTUPXW; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J0EHjVJf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rqCTUPXW"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1EA0C7A0176
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:27:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Tue, 13 Oct 2026 15:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791919670;
	 x=1792006070; bh=i71dCF7LLUU6ilX5suQf9vUjY12l6ztj7aDzxt9M6nE=; b=
	J0EHjVJfDSIu2zGY7bafGgHYWg/e+Hsa0RB1e2cYU4kEZUbrjUSQRwLa/1ets2UM
	KnxbiXzisNjFG9woMypsUG/AOhydhroHGLeDLSE6bFMRfmcL6pa+xcYAunYib0Ba
	+qSxtqT+Ppqvg9d8mNoQYS1LTdZ5pzvdbH2ldtO077AptpbiYy2LAyMLhCE+YvM/
	PU2T2O1I2efzuz0QGcjsHc2FW7dMajKTTrs/YhQD0zS5YrqgfBycit0umBFsrdJP
	Y+U7a7stpAMSLC2+9oFPrALBYR6MkC2NdSPkGjDoWh7S9y5psWjh4GPbhlPeXNpl
	j9O5eQtN/iRUoP/fLqcBvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791919670; x=
	1792006070; bh=i71dCF7LLUU6ilX5suQf9vUjY12l6ztj7aDzxt9M6nE=; b=r
	qCTUPXWekjqXYFJdrrqky2bMMDVS2ZRDS+VUO1rw9bGHkZFQR4qaME6R+z3V8hik
	D+Ts61bPVKfmkTvr6WWPoV5LHIrHI8DaE0yCpguo/FS9x4MoXyiCBciAOo45I/3t
	Eb/QppykYnTz8BbOBTs5i0WGXs/zoxKdXb21UR9zuwr60G6J5Qo0IMr2YDbHII+F
	caCykknEpCH/sD4TpgiHbjgU3DEeM8/kTNEypXzQQSv697oiFsIHavvg7b/UVE6C
	dFI67o6D8cfjpt9bPbsUbHkbytFg6O5Zt2D72EuitFF/epuClhIKrucxUETPlkGj
	J4mkZFO02TWHpb9IV5kCg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791919670; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:NfT2OrxHd1B5AFeJ20uJmmulISpfV43IrQND8r0Kt1Xujm/
	hClggYRxlSVGzX1Vw9W22Flk7r8dL12KMpTvAluoUB4P47EAiUNnqLB3UStENq6f
	9RvWYTxPJwQ70zH+fsNnJygB5+3As+UCJb2e28MVVAKY2siidtjRMWUCqcbtFoia
	EGS+6/MWlalwlvc/Z479sbDAnZixmlqXdBWmummwrQVoq48pZPcAWEmoK3smUaiq
	Mwfs9YAjFHwgNeDsqK00t50CigcCEpDc/e8dAkF+oYOfMruiq0sJ7xmVmOqmgOu6
	EWOI6MSNbwsynVHJ3dvYWhO6Wg18u6CvHiWKOpA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XMjd31xaX6qY7nO+Hz/DpmweUgB38HmSL0HBamkMtbY=:Ohen3rZxNLiKkHAShhfXOPV9gxWORaB2IXrMLIJXQqA=;
X-ME-Sender: <xms:NYbOapsN8Oh-hfF5TqiXtncIM8qN8pDtVgIjO9vpgoW1C4zRFZB2Lg>
    <xme:NYbOaqodxZGvrKYvqZOUSj7MUvSJM611_t-zkFKmTbBNp3JJi-mPCcQeCVarlVdtl
    XwRgbVi5Z-fX-oRzftBVpNXQneSHv0_tFBxsIFN-gGRUZ4awZitko0B>
X-ME-Received: <xmr:NYbOaoUfx3dnTUKMjHXHQEHFSMS650xFtnvfo_4y7plRIcUDgRy8R96Kuvv1vTHd_FtbAcK2oyZ_djPlLVnQe8OSbInFp8M>
X-ME-Proxy-Cause: dmFkZTF1XrOuzvjggCMf66xYGP0beiWESpbYzRHjMH8GlDixX3oUyYJed2yNJ5F/Qv7gNg
    0BduEPHe6mQsPSJwzkb9bbd0BbodiEo2FEQy/sEdzXE12oZGOZ2gZiIDkeaspvzTHEzAGz
    ZNjKmh45kOttg39ATECzMlsUiVDwrICXj+z3dMedHfKc68elVM+9qMC1A4oQC4rH7uaI8Q
    fCFjS90yKcBbzGLjvFeboP1My0ewzXBolI02yV73sZaQR4sbK9Wbw9/02I2quaekrRz4t8
    sENzLJ2lLrM2vtiVKCk3zj8Y7QA+AX5KqIm8+3qrz03hAtuCn0l1TfZdRHcDNJFCP6DTcH
    xaOgDFqwwYL696D/4TwQ100dILXl60Sgw6crtEyYlRmvRL0gbFef+S+TcemnBfS1N0q/FU
    sKcaO452mgL++ZNskIA/rO5wQTjf5QKcV2WVrsm89A52zDHMvFW9tUxRNhA4RVKTkSeOXN
    I5MUvP2EH5Xm+/kd7QSdvqEkSQ4R/P7JyGftnxV9gtAZsOEIL/Kop7V5QyS2B2ud1sny2b
    qeRlv0qV+3BumGfx6sfV8APp6ZL3LLD6LieF0RvIr8uyr3BTom8L5lHsJ83k2GxNo6duyE
    Bhp3lH1Bcqwm/UNIJnMJI89qWvRYknxybGolr2S6jepeAi8uoNCV7M0XvqWg
X-ME-Proxy: <xmx:NYbOaq1vLq0jK-1ulMKA1UVv8NMtkNOdaQ6kCOmR1p0YDWiehc-tag>
    <xmx:NYbOals-5WVS3ukfIVp33c7KDzoh-QuDzBfiwcyARks17PFwpO7Cmg>
    <xmx:NYbOaqUharW2EeeT1pqKAVMQZq_9Y0M-h2-oaVXpa21E55_E9TAytQ>
    <xmx:NYbOalysUYL50lWRVxjFy6aIxzSe2o1Jm-Y0BIcDimJTB0Hoo77igg>
    <xmx:NobOaj2Dp76wiwOUq3z5d5GVOfqXDkbYM8UTGHijIwQo4WFaBRUC6NO3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 15:27:49 -0400 (EDT)
Date: Tue, 13 Oct 2026 21:27:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: rcar-isp: release the core interrupt before
 destroying RPPX1
Message-ID: <20261013192743.GE1193379@fsdn.se>
References: <20261011214448.2043581-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261011214448.2043581-1-mhun512@gmail.com>

Hello Myeonghun,

Thanks for your work.

On 2026-10-11 17:44:48 -0400, Myeonghun Pak wrote:
> risp_core_irq() accesses the RPPX1 object before taking core->lock. The
> interrupt is device managed, whereas risp_core_remove() explicitly
> destroys RPPX1 before device-managed cleanup runs. Stopping the video
> queues does not join an interrupt handler that has already started.

core->lock is also managed by devm. Could you specify which resources 
are accessed incorrectly?

> 
> Release the core interrupt after stopping the I/O nodes and before
> unregistering the V4L2 device or destroying RPPX1. Request it only after
> RPPX1, the subdevice and the handler's locks have been initialized. This
> also keeps the interrupt out of probe error paths that free RPPX1.
> 
> Only treat -ENODEV as an absent optional core when core->base is NULL.
> Resource probe failures clear that pointer, whereas failures after resource
> setup leave it set. An IRQ request returning -ENODEV must therefore fail
> the parent probe after the core has unwound its resources, instead of
> allowing removal to destroy RPPX1 and put the VSP-X device again.

This is a different (potential) issue then the first and should be a 
separate patch.

> 
> This issue was found by static analysis.
> 
> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.
> 
>  drivers/media/platform/renesas/rcar-isp/core.c      | 13 +++++++++----
>  drivers/media/platform/renesas/rcar-isp/csisp.c     |  2 ++
>  drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 586a5adbedfa..6bf1dd650486 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -802,10 +802,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>  	if (ret < 0)
>  		return -ENODEV;
>  
> -	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
> -			       KBUILD_MODNAME, core);
> -	if (ret)
> -		return ret;
> +	core->irq = ret;
>  
>  	core->clk = devm_clk_get(&pdev->dev, "core");
>  	if (IS_ERR(core->clk))
> @@ -887,8 +884,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
>  	spin_lock_init(&core->lock);
>  	INIT_LIST_HEAD(&core->risp_jobs);
>  
> +	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
> +			       KBUILD_MODNAME, core);
> +	if (ret)
> +		goto err_destroy_mutex;
> +
>  	return 0;
>  
> +err_destroy_mutex:
> +	mutex_destroy(&core->io_lock);
>  err_unregister_v4l2:
>  	v4l2_device_unregister(&core->v4l2_dev);
>  err_destroy_rpp:
> @@ -908,6 +912,7 @@ void risp_core_remove(struct rcar_isp_core *core)
>  	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
>  		risp_core_io_destroy(&core->io[i]);
>  
> +	devm_free_irq(core->dev, core->irq, core);
>  	v4l2_device_unregister(&core->v4l2_dev);
>  
>  	mutex_destroy(&core->io_lock);
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 53ce47020d17..73bf7e42bad2 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -563,6 +563,8 @@ static int risp_probe(struct platform_device *pdev)
>  		isp->subdev.internal_ops = &risp_cs_internal_ops;
>  		break;
>  	case -ENODEV:
> +		if (isp->core.base)
> +			goto error_subdev;
>  		/* The device don't have an ISP core, that is OK. */
>  		ret = 0;
>  		break;
> diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
> index 627a762d6b19..70432cf4a88c 100644
> --- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
> +++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
> @@ -112,6 +112,7 @@ struct rcar_isp_vspx {
>   * @dev:	(OF) device
>   * @rppaddr:	Hardware address of the RPP ISP (from OF)
>   * @clk:	The clock for the ISP CORE
> + * @irq:	Interrupt for the ISP CORE
>   * @rstc:	The reset for the ISP Core
>   * @csrstc:	The reset for the ISP Channel Selector
>   *
> @@ -138,6 +139,7 @@ struct rcar_isp_core {
>  
>  	u32 rppaddr;
>  	struct clk *clk;
> +	int irq;
>  
>  	struct reset_control *rstc;
>  	struct reset_control *csrstc;

-- 
Kind Regards,
Niklas Söderlund
