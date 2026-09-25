Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F55361970;
	Fri, 25 Sep 2026 08:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323749; cv=none; b=l9vgSJ32P6BoBYeLepRqgLcTPVlnGHm9a4+vP71yodK1rL5wf4SL3gkFGCVxKIz68VBrgJjuYW+DF/uSnILuLyoUy88e43tflH+3wvzJH4kWt/Yv6bMBf7DJwqNbhgLqDyEFT/Uu9qFHr0aAefXl/XmqSVdiB2jnbNvTb797sB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323749; c=relaxed/simple;
	bh=092kdswL89OZkclAFFx3dIusFmffoIwm3JYzgRQlOuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/2Mx+X7vxE2zNaRKXIV2m+3tcEHviNlxPSOrgZcrqJL6YPFhchZ/eutH2jLzXo5LzhFv8AQsk+ssclmg/qlpjinUAO9UrPTtNInmWAWZWQOZORqDGKzixCyhTxsa4A5mFetY2tQGCnFAFVobT3uruMeNYkkhqL+STKhNpp0UPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqaAWzNF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqaAWzNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB501F000FF;
	Fri, 25 Sep 2026 08:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790323747;
	bh=ewQAU9rskd/QPx5441u1yZskQkKCIsuhbcv782zkYYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iqaAWzNF42rfZ2perDnY+hxINAmoFnageL4TksZlGgD/IUmM8JA+d+4+TtYsafTNx
	 CcHo3xi+6GVMfEaRIyrcPsfe3AlAYTHL0Dyy+s4B/C9nt6ZbBGiYeXcwC2arC7SHuY
	 E/ijsBeQ0T6Y7mZcgMkmQ2q7lr2g5+X5S/nKik2ZQvlA7qHb2AQ3YJNY/vffmkHRlC
	 Gmy6CsmGSY0+8n2fwuIIMZ+RjnMUyqx/Tk6NefhAilikrcNri9OOtVSbwmDIQNkGFz
	 SfsqEOUHNrznUdUxT3UDqDL7y2ICPYhqI8qKy68/5c4C5ZbC/H736nttM7Jo3vLorK
	 aGED8+5ttOumw==
Message-ID: <781fc756-bde6-4d83-a09c-19d4fd70e588@kernel.org>
Date: Fri, 25 Sep 2026 09:09:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] slimbus: qcom-ngd-ctrl: Remove data channels on
 stream disable
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 David Rhodes <drhodes@opensource.cirrus.com>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-7-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260924-pixel3-audio-v4-7-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> qcom_slim_ngd_xfer_msg() silently returns success for every core
> reconfiguration message, so the generic channel removal done by
> slim_stream_disable() never reaches the ADSP SLIMbus master. The
> master therefore keeps the channels of a closed stream. When the next
> stream defines the same channel numbers again, the WCD9340 capture
> completes without any error but records only zeros; removing the
> channels explicitly when the stream is disabled makes it work again.
> 
> Implement the disable_stream controller op with the sequence the
> downstream NGD driver sends for channel removal, CHAN_CTRL(REMOVE)
> listing the stream's channels followed by RECONFIG_NOW. Like
> downstream, treat -EREMOTEIO from the removal as success: it means the
> controller is being restarted and the channels are gone anyway.
> 
> Based on work done by Casey Tunturi.
> 
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

there is an identical patch on the list,
https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69

--srini


>  drivers/slimbus/qcom-ngd-ctrl.c | 81 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index eb0ccb31e9074..0a4859466c82d 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1081,16 +1081,96 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
>  		slim_free_txn_tid(ctrl, &txn);
>  		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
>  				txn.mt);
>  	}
>  
>  	return ret;
>  }
>  
> +/* CHAN_CTRL operation, bits [7:6] of the first payload byte */
> +#define SLIM_USR_CHAN_CTRL_REMOVE	2
> +
> +static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
> +{
> +	struct slim_device *sdev = rt->dev;
> +	struct slim_controller *ctrl = sdev->ctrl;
> +	struct slim_val_inf msg =  {0};
> +	u8 wbuf[SLIM_MSGQ_BUF_LEN];
> +	u8 rbuf[SLIM_MSGQ_BUF_LEN];
> +	struct slim_msg_txn txn = {0,};
> +	int i, ret;
> +
> +	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
> +	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
> +	txn.la = SLIM_LA_MGR;
> +	txn.ec = 0;
> +	txn.msg = &msg;
> +	txn.msg->num_bytes = 0;
> +	txn.msg->wbuf = wbuf;
> +	txn.msg->rbuf = rbuf;
> +
> +	/*
> +	 * The NGD drops the core reconfiguration messages that
> +	 * slim_stream_disable() uses to remove channels, so ask the master
> +	 * to remove them the way the downstream NGD driver does:
> +	 * CHAN_CTRL(REMOVE) listing every channel, then RECONFIG_NOW.
> +	 * Without this the master keeps the channels active and a later
> +	 * DEF_ACT_CHAN with the same channel numbers is a no-op, so the
> +	 * data path is never re-armed and a reopened stream moves no data.
> +	 */
> +	/* 5-bit client number, operation in bits [7:6] */
> +	wbuf[txn.msg->num_bytes++] = (SLIM_USR_CHAN_CTRL_REMOVE << 6) |
> +				     (sdev->laddr & 0x1f);
> +
> +	ret = slim_alloc_txn_tid(ctrl, &txn);
> +	if (ret) {
> +		dev_err(&sdev->dev, "Fail to allocate TID\n");
> +		return ret;
> +	}
> +	wbuf[txn.msg->num_bytes++] = txn.tid;
> +
> +	for (i = 0; i < rt->num_ports; i++)
> +		wbuf[txn.msg->num_bytes++] = rt->ports[i].ch.id;
> +
> +	txn.mc = SLIM_USR_MC_CHAN_CTRL;
> +	txn.rl = txn.msg->num_bytes + 4;
> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		/* Controller restarting, the channels are gone anyway */
> +		if (ret == -EREMOTEIO)
> +			return 0;
> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
> +				txn.mt);
> +		return ret;
> +	}
> +
> +	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
> +	txn.msg->num_bytes = 2;
> +	wbuf[1] = sdev->laddr;
> +	txn.rl = txn.msg->num_bytes + 4;
> +
> +	ret = slim_alloc_txn_tid(ctrl, &txn);
> +	if (ret) {
> +		dev_err(ctrl->dev, "Fail to allocate TID\n");
> +		return ret;
> +	}
> +
> +	wbuf[0] = txn.tid;
> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
> +				txn.mt);
> +	}
> +
> +	return ret;
> +}
> +
>  static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
>  				   struct slim_eaddr *ea, u8 *laddr)
>  {
>  	struct slim_val_inf msg =  {0};
>  	u8 failed_ea[6] = {0, 0, 0, 0, 0, 0};
>  	struct slim_msg_txn txn;
>  	u8 wbuf[10] = {0};
>  	u8 rbuf[10] = {0};
> @@ -1620,16 +1700,17 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
>  	ctrl->framer.superfreq =
>  		ctrl->framer.rootfreq / SLIM_CL_PER_SUPERFRAME_DIV8;
>  
>  	ctrl->ctrl.a_framer = &ctrl->framer;
>  	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
>  	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
>  	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
> +	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
>  	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
>  	ctrl->ctrl.wakeup = NULL;
>  	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
>  
>  	mutex_init(&ctrl->tx_lock);
>  	mutex_init(&ctrl->ssr_lock);
>  	spin_lock_init(&ctrl->tx_buf_lock);
>  	init_completion(&ctrl->reconf);
> 

