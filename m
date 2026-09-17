Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C6288C81;
	Thu, 17 Sep 2026 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682641; cv=none; b=l2zv8qDPNCuNb8SLPx1TNUcPugZkXOj15UVHTDPqPTZu2dZ8XbVzJ9em4HnoupqQ5KLEe90TXEk0/NSJcpkImS6h94oCEe4HDyIXm8TXr3kAZcM5oLJ3wk8eeltI8FCu6Oa0EUY4HWvlmEh0kw77NMSwaeAs/A1Iljw6K7wPdVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682641; c=relaxed/simple;
	bh=+acyoO/Sm0oW+sjQqxr/lwYy2zzILy9saF3iRuLfWL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkgpO4ew4ybhGWvuGkKdyirryVYZ57FHbE8Jx+SuKdDCMtX3IcEJtPX4/ffwCSY10PwSZtpk7eIH7/shJY73zhwUDhbXDLUHCHkugfbcRbNQNyvxo537YO8OeapO4eiIRM82UER1+ZzguaJnkXU3N+rrXpbqv7fHodkOlcJi5wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+IUBAyg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+IUBAyg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D9A1F000FF;
	Thu, 17 Sep 2026 22:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789682639;
	bh=3ZnPI/pZBajtlmoi7wQjoRLtm+ZmrDFEaUzea0ERXKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=e+IUBAygT0FQi5N3XTjqKtQty/LVBN8PVMje7ZM4JzNsYGCzrb/ljj213e9DsAsuz
	 /LyfMH8iSLIcm9RmCnGxAPzj7K1cBA1YZ900dOpbCSLLDoIJHbTvc3pE1bJkKeowHR
	 P46IlOcsYNaCjQW0Omtq0r7dAo4Uwz0cY7qmqX8BIb/nAFhvKlCUfw3ojrdJdQmTQ1
	 jdqmlj37g10mYjY+p8QQvBNYCYF8MH7HhGQn7vTmA6DoKGEH/dZj9j8ACuHKmQfnu/
	 tyrDgH61Mf/x6udJBTsDDA+lTYeIxmwY7hhEywUTXBYurNi8BADz6ziSJRaHCXa4WJ
	 3So1+F7O5Smcw==
Message-ID: <6c1c602f-2b6d-40f6-8cd4-617239554b15@kernel.org>
Date: Thu, 17 Sep 2026 23:03:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Release the TX descriptor on
 error paths
To: Babanpreet Singh <bbnpreetsingh@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260820035203.7-1-bbnpreetsingh@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260820035203.7-1-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/20/26 4:52 AM, Babanpreet Singh wrote:
> qcom_slim_ngd_xfer_msg() leaks the claimed TX descriptor on two error
> paths; QCOM_SLIM_NGD_DESC_NUM such failures fill the ring for good and
> every later transfer fails with -ENOMEM. Give the descriptor back.

>
Are you hitting this on a real target or is this something done from
static analysis?

How was this test verified?

> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Fixes: 52490169cddf ("slimbus: ngd: add stream support")Missing Stable tag.
> Assisted-by: claude-opus-5
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 3071e46d03bea..697811b2c1e97 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -546,6 +546,25 @@ static u32 *qcom_slim_ngd_tx_msg_get(struct qcom_slim_ngd_ctrl *ctrl, int len,
>  	return desc->base;
>  }
>  
> +/*
> + * Give back a descriptor obtained from qcom_slim_ngd_tx_msg_get() that will
> + * not be submitted to the DMA engine.
> + *
> + * The ring is accounted by count rather than by index: tx_tail counts the
> + * descriptors handed out and tx_head the ones the controller is finished
> + * with, and qcom_slim_ngd_tx_msg_dma_cb() is the only other place that
> + * advances tx_head. A descriptor that is never posted therefore has to
> + * advance it here, or the ring loses that slot for good.
> + */
> +static void qcom_slim_ngd_tx_msg_put(struct qcom_slim_ngd_ctrl *ctrl)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ctrl->tx_buf_lock, flags);
> +	ctrl->tx_head = (ctrl->tx_head + 1) % QCOM_SLIM_NGD_DESC_NUM;
> +	spin_unlock_irqrestore(&ctrl->tx_buf_lock, flags);
> +}

> +
>  static void qcom_slim_ngd_tx_msg_dma_cb(void *args)
>  {
>  	struct qcom_slim_ngd_dma_desc *desc = args;
> @@ -848,6 +867,7 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
>  		ret = slim_alloc_txn_tid(sctrl, txn);
>  		if (ret) {
>  			dev_err(ctrl->dev, "Unable to allocate TID\n");
> +			qcom_slim_ngd_tx_msg_put(ctrl);
>  			return ret;
>  		}
>  
> @@ -887,6 +907,7 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
>  	mutex_lock(&ctrl->tx_lock);
>  	ret = qcom_slim_ngd_tx_msg_post(ctrl, pbuf, txn->rl);
>  	if (ret) {
> +		qcom_slim_ngd_tx_msg_put(ctrl);
>  		mutex_unlock(&ctrl->tx_lock);
>  		return ret;
>  	}

