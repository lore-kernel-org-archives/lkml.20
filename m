Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593F470112;
	Fri, 25 Sep 2026 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.42.129.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325274; cv=none; b=o5S3LPSgdHH8gsWcIwjhGr6V+e5g/IzURbV9LwYriGw6/Esfo6qHvbAGqNEH3dsje5NPOkyQ0BlOXXkYyQqyvQMsEUD3obn0WclPp6dHJXgnHNtOfq9T0hRkPhV9BL0666/3/Tlj9C45aOupPLWXqYr/DwplzaxkAey2it2G0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325274; c=relaxed/simple;
	bh=w6ywcHMkyM8rtMeu9B48oh6riDbeDBqi7cfGO7Y+9mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAYzS5oma8eIrAMHRCjRgkPTcymDRKVeVzzKKSeaRusgO5yjCgSLaiiyoT5qU8dWjd2k1BiPP4lG2bY2RZBY9NVyjPlDJZs/SJ0fcDhDJNOLkfuNvSGmIVH5ozRArWC5H8kyWlpEfRrTvfP+UpBRyWozlHaXgmuQHTFN1qKKE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=N9/rNSfJ; arc=none smtp.client-ip=84.42.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="N9/rNSfJ"
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id E95E4534023E;
	Fri, 25 Sep 2026 10:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1790325270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8y8dG9e5KwfnZqSHWEwd/5CyUzoc4d2nDEOP4jvbfhA=;
	b=N9/rNSfJW9Yss5EOAUAoWqOw9wksNeWOKxhSSOvULKancJf3HgmLtRoDdphdGJ8NeQ07pw
	OM2nHQY8uS5UXVZjyksFXvBDcVruWmFOHkrVkeQ4VIYOFIpHrMuHujdAO/VJF+JpIpzUMe
	5+y4g2gtbhaRLF6k+YlJMXh5yYij8YY=
Message-ID: <f15ad2f9-dfde-4156-980a-bac9596b45bf@ixit.cz>
Date: Fri, 25 Sep 2026 10:34:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] slimbus: qcom-ngd-ctrl: Remove data channels on
 stream disable
To: Srinivas Kandagatla <srini@kernel.org>,
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
 <781fc756-bde6-4d83-a09c-19d4fd70e588@kernel.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <781fc756-bde6-4d83-a09c-19d4fd70e588@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2026 10:09, Srinivas Kandagatla wrote:
> On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> qcom_slim_ngd_xfer_msg() silently returns success for every core
>> reconfiguration message, so the generic channel removal done by
>> slim_stream_disable() never reaches the ADSP SLIMbus master. The
>> master therefore keeps the channels of a closed stream. When the next
>> stream defines the same channel numbers again, the WCD9340 capture
>> completes without any error but records only zeros; removing the
>> channels explicitly when the stream is disabled makes it work again.
>>
>> Implement the disable_stream controller op with the sequence the
>> downstream NGD driver sends for channel removal, CHAN_CTRL(REMOVE)
>> listing the stream's channels followed by RECONFIG_NOW. Like
>> downstream, treat -EREMOTEIO from the removal as success: it means the
>> controller is being restarted and the channels are gone anyway.
>>
>> Based on work done by Casey Tunturi.
>>
>> Assisted-by: Claude:claude-fable-5-1
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
> 
> there is an identical patch on the list,
> https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69

I was not aware, I'll try to look into it today and address the comments on the 
original one (and keep the credits as LLM likely "got heavily inspired there").

David

> 
> --srini
> 
> 
>>   drivers/slimbus/qcom-ngd-ctrl.c | 81 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
>> index eb0ccb31e9074..0a4859466c82d 100644
>> --- a/drivers/slimbus/qcom-ngd-ctrl.c
>> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
>> @@ -1081,16 +1081,96 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
>>   		slim_free_txn_tid(ctrl, &txn);
>>   		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
>>   				txn.mt);
>>   	}
>>   
>>   	return ret;
>>   }
>>   
>> +/* CHAN_CTRL operation, bits [7:6] of the first payload byte */
>> +#define SLIM_USR_CHAN_CTRL_REMOVE	2
>> +
>> +static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
>> +{
>> +	struct slim_device *sdev = rt->dev;
>> +	struct slim_controller *ctrl = sdev->ctrl;
>> +	struct slim_val_inf msg =  {0};
>> +	u8 wbuf[SLIM_MSGQ_BUF_LEN];
>> +	u8 rbuf[SLIM_MSGQ_BUF_LEN];
>> +	struct slim_msg_txn txn = {0,};
>> +	int i, ret;
>> +
>> +	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
>> +	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
>> +	txn.la = SLIM_LA_MGR;
>> +	txn.ec = 0;
>> +	txn.msg = &msg;
>> +	txn.msg->num_bytes = 0;
>> +	txn.msg->wbuf = wbuf;
>> +	txn.msg->rbuf = rbuf;
>> +
>> +	/*
>> +	 * The NGD drops the core reconfiguration messages that
>> +	 * slim_stream_disable() uses to remove channels, so ask the master
>> +	 * to remove them the way the downstream NGD driver does:
>> +	 * CHAN_CTRL(REMOVE) listing every channel, then RECONFIG_NOW.
>> +	 * Without this the master keeps the channels active and a later
>> +	 * DEF_ACT_CHAN with the same channel numbers is a no-op, so the
>> +	 * data path is never re-armed and a reopened stream moves no data.
>> +	 */
>> +	/* 5-bit client number, operation in bits [7:6] */
>> +	wbuf[txn.msg->num_bytes++] = (SLIM_USR_CHAN_CTRL_REMOVE << 6) |
>> +				     (sdev->laddr & 0x1f);
>> +
>> +	ret = slim_alloc_txn_tid(ctrl, &txn);
>> +	if (ret) {
>> +		dev_err(&sdev->dev, "Fail to allocate TID\n");
>> +		return ret;
>> +	}
>> +	wbuf[txn.msg->num_bytes++] = txn.tid;
>> +
>> +	for (i = 0; i < rt->num_ports; i++)
>> +		wbuf[txn.msg->num_bytes++] = rt->ports[i].ch.id;
>> +
>> +	txn.mc = SLIM_USR_MC_CHAN_CTRL;
>> +	txn.rl = txn.msg->num_bytes + 4;
>> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
>> +	if (ret) {
>> +		slim_free_txn_tid(ctrl, &txn);
>> +		/* Controller restarting, the channels are gone anyway */
>> +		if (ret == -EREMOTEIO)
>> +			return 0;
>> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
>> +				txn.mt);
>> +		return ret;
>> +	}
>> +
>> +	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
>> +	txn.msg->num_bytes = 2;
>> +	wbuf[1] = sdev->laddr;
>> +	txn.rl = txn.msg->num_bytes + 4;
>> +
>> +	ret = slim_alloc_txn_tid(ctrl, &txn);
>> +	if (ret) {
>> +		dev_err(ctrl->dev, "Fail to allocate TID\n");
>> +		return ret;
>> +	}
>> +
>> +	wbuf[0] = txn.tid;
>> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
>> +	if (ret) {
>> +		slim_free_txn_tid(ctrl, &txn);
>> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
>> +				txn.mt);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
>>   				   struct slim_eaddr *ea, u8 *laddr)
>>   {
>>   	struct slim_val_inf msg =  {0};
>>   	u8 failed_ea[6] = {0, 0, 0, 0, 0, 0};
>>   	struct slim_msg_txn txn;
>>   	u8 wbuf[10] = {0};
>>   	u8 rbuf[10] = {0};
>> @@ -1620,16 +1700,17 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>>   	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
>>   	ctrl->framer.superfreq =
>>   		ctrl->framer.rootfreq / SLIM_CL_PER_SUPERFRAME_DIV8;
>>   
>>   	ctrl->ctrl.a_framer = &ctrl->framer;
>>   	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
>>   	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
>>   	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
>> +	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
>>   	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
>>   	ctrl->ctrl.wakeup = NULL;
>>   	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
>>   
>>   	mutex_init(&ctrl->tx_lock);
>>   	mutex_init(&ctrl->ssr_lock);
>>   	spin_lock_init(&ctrl->tx_buf_lock);
>>   	init_completion(&ctrl->reconf);
>>
> 

