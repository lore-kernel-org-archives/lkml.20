Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557774;
	b=BIAugMmHGDx2mFlx0oboSMFYLAQoLIf5fhvKVumXNZpRWmcE1U/zOkrURidyMcqro+cm
	 4QBfNeuVJhIlPM4D101h9YWYaTJL//Z3QDVv28vqYcZlSi5XJdoufLNPSldG+4b8Xpia0
	 tYvlJvpabR9G4jPGDnJqEZbX9Mp2DGSfrar6Rs2wM2qL9gkzSDc0wLKtUiSW1nahe/Xro
	 1CBPaU8PutmonggClvWQBXiC5sRVH8poVidJYOO4IkeyHqEYf2eyPpGgad97ArpElmKrN
	 UWGzIUhAhs5NEahYmJQGXBOwMTvJvr3fMWpEvQy0oLSvNSeTVTQbd7vP3T4sgtyVEyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557774;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9U8aC1QAz9A7FHMAgGcgXCwjyuajaml/x5tjK2P7TO0=;
	b=nl9GeykJ4Pn+USoU/AY+r6UDk12a0FdZmJxBoiIaV93XpASfoyHpY3b846xgm5iR1tqj
	 a5dcE4d7tanKqKx+MvnY6oCognmtnkcNzL0x9NZ5pucePX3mBgQmakhmz1wuFFVEjLXxN
	 3TROUyI8gqKEHzRppQKRrVEeXJ25UT2Lo+z73+aJswmZByF3Z8butvbeMSJdwh+tchjHG
	 SzK96ila5xr1KgVgy48z7hXnE39kwEhqw0j/O7ZcS7XYZbW87T2v7LAVM6yF3B/LLrpc8
	 NCPftV1CnNWYiGlftmEXYA6v9f/BmQhetX95jC6wUHmh0hFcqE2zMhwNAL0tBeDBYQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XwAtRhqm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE3C606A321;
	Fri, 13 Nov 2026 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XwAtRhqm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A3B1F000C5;
	Fri, 13 Nov 2026 08:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794557773;
	bh=9U8aC1QAz9A7FHMAgGcgXCwjyuajaml/x5tjK2P7TO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XwAtRhqm/46Poatyah/AeXbWbrpA8kEStrR7ZmF0vhoAneIEHkWjyUbKFhsuvVQGO
	 uA1i0FIzugDj9yEgPM1jBfsOzFBZoj/jXdHzn84/47ly+mgTINgVVVCdtEBm3YkPR2
	 njK8peGsRM73X7LxKXV7ZSQbqNeXyvzE5rufDFNaxrjrC/x74OnibONarmnBRqiDzs
	 yjVawsxx5+Qom/pooTwLFSNZy97lwwEFRWdt70WALWEBcZflowqCiFq+Go8Lad0BiK
	 ZI5+DIZ3b7cG8OjhvA2xreCDYeG4EJkGKyhi9PUe8PWV+8HCLJjJEl0avMsYat+Kmu
	 VOqUoYi08rgcQ==
Date: Fri, 13 Nov 2026 09:16:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, heikki.krogerus@linux.intel.com, abel.vesa@oss.qualcomm.com, 
	abelvesa@kernel.org, wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org, 
	val@packett.cool, balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com, 
	effeffe99@gmail.com, prashanth.k@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: dwc3: qcom: Use the UTMI clock as PIPE clock
 in DisplayPort-only modes
Message-ID: <20261113-artificial-quixotic-firefly-84baef@quoll>
References: <20261112113838.506-1-26rote@gmail.com>
 <20261112113838.506-3-26rote@gmail.com>
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
In-Reply-To: <20261112113838.506-3-26rote@gmail.com>

On Thu, Nov 12, 2026 at 08:38:38PM +0900, Joonhoe Kim wrote:
> @@ -336,16 +346,19 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>  }
>  
> -static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> +static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
>  {
> -	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
>  	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
>  			  PIPE_UTMI_CLK_DIS);
>  
>  	usleep_range(100, 1000);
>  
> -	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> -			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
> +	if (utmi)
> +		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> +				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
> +	else
> +		dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> +				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
>  
>  	usleep_range(100, 1000);
>  
> @@ -353,6 +366,38 @@ static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
>  			  PIPE_UTMI_CLK_DIS);
>  }
>  
> +static bool dwc3_qcom_utmi_clk_selected(struct dwc3_qcom *qcom)
> +{
> +	return readl(qcom->qscratch_base + QSCRATCH_GENERAL_CFG) &
> +	       PIPE_UTMI_CLK_SEL;
> +}
> +
> +static void dwc3_qcom_update_pipe_clk(struct dwc3_qcom *qcom)
> +{
> +	lockdep_assert_held(&qcom->pipe_clk_lock);
> +
> +	if (qcom->mode_switch && !qcom->utmi_as_pipe_clk &&
> +	    qcom->dp_only != dwc3_qcom_utmi_clk_selected(qcom))
> +		dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
> +}
> +
> +static void dwc3_qcom_defer_mux(struct dwc3_qcom *qcom)
> +{
> +	guard(mutex)(&qcom->pipe_clk_lock);

Why aren't you using simple and most readable mutex lock/unlock? guard()
is not more readable.

> +	qcom->mux_deferred = true;
> +}
> +
> +static void dwc3_qcom_undefer_mux(struct dwc3_qcom *qcom)
> +{
> +	guard(mutex)(&qcom->pipe_clk_lock);

Here it makes sense, but other places, why?

> +
> +	if (qcom->is_suspended)
> +		return;
> +
> +	qcom->mux_deferred = false;
> +	dwc3_qcom_update_pipe_clk(qcom);
> +}
> +
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  {
>  	u32 val;
> @@ -413,7 +458,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  	 * clock ("failed to enable ep0out").
>  	 */
>  	if (qcom->utmi_as_pipe_clk)
> -		dwc3_qcom_select_utmi_clk(qcom);
> +		dwc3_qcom_select_utmi_clk(qcom, true);
> +
> +	scoped_guard(mutex, &qcom->pipe_clk_lock)
> +		dwc3_qcom_update_pipe_clk(qcom);
>  
>  	/* Clear existing events from PHY related to L2 in/out */
>  	for (i = 0; i < qcom->num_ports; i++) {
> @@ -446,6 +494,52 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int dwc3_qcom_mux_set(struct typec_mux_dev *mux,
> +			     struct typec_mux_state *state)
> +{
> +	struct dwc3_qcom *qcom = typec_mux_get_drvdata(mux);
> +	bool dp = state->mode >= TYPEC_STATE_MODAL && state->alt &&
> +		  state->alt->svid == USB_TYPEC_DP_SID;
> +
> +	guard(mutex)(&qcom->pipe_clk_lock);
> +
> +	if (state->mode == TYPEC_STATE_SAFE) {
> +		qcom->dp_active = false;
> +	} else if (dp) {
> +		if (state->mode == TYPEC_DP_STATE_C ||
> +		    state->mode == TYPEC_DP_STATE_E)
> +			qcom->dp_only = true;
> +		else if (!qcom->dp_active)
> +			qcom->dp_only = false;
> +		qcom->dp_active = true;
> +	} else if (!qcom->dp_active) {
> +		qcom->dp_only = false;
> +	}
> +
> +	if (!qcom->mux_deferred)
> +		dwc3_qcom_update_pipe_clk(qcom);
> +
> +	return 0;
> +}
> +
> +static int dwc3_qcom_mux_register(struct dwc3_qcom *qcom)
> +{
> +	struct typec_mux_desc desc = {};
> +
> +	if (!IS_ENABLED(CONFIG_TYPEC) ||
> +	    !device_property_present(qcom->dev, "mode-switch"))
> +		return 0;
> +
> +	desc.drvdata = qcom;
> +	desc.fwnode = dev_fwnode(qcom->dev);
> +	desc.set = dwc3_qcom_mux_set;
> +
> +	qcom->mode_switch = true;
> +	qcom->mux = typec_mux_register(qcom->dev, &desc);
> +
> +	return PTR_ERR_OR_ZERO(qcom->mux);
> +}
> +
>  static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
>  				 const char *name)
>  {
> @@ -625,7 +719,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	struct resource		res;
>  	struct resource		*r;
>  	int			ret;
> -	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
>  
>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
> @@ -688,11 +781,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	 * Disable pipe_clk requirement if specified. Used when dwc3
>  	 * operates without SSPHY and only HS/FS/LS modes are supported.
>  	 */
> -	ignore_pipe_clk = device_property_read_bool(dev,
> -				"qcom,select-utmi-as-pipe-clk");
> -	qcom->utmi_as_pipe_clk = ignore_pipe_clk;
> -	if (ignore_pipe_clk)
> -		dwc3_qcom_select_utmi_clk(qcom);
> +	qcom->utmi_as_pipe_clk =

You use some odd formatting, making this unreadable. That's one line,
eventually wrapped.

I don't get why you are changing these lines in the first place. Mixing
style changes and actual code changes make it difficult to spot the
differenec, but the code looks the same, no?

> +		device_property_read_bool(dev, "qcom,select-utmi-as-pipe-clk");
> +	if (qcom->utmi_as_pipe_clk)
> +		dwc3_qcom_select_utmi_clk(qcom, true);
>  
>  	qcom->mode = usb_get_dr_mode(dev);

Best regards,
Krzysztof

