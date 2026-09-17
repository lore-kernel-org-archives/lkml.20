Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700824A843C;
	Thu, 17 Sep 2026 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684561; cv=none; b=nfG2yjzEPuE/weAgZBxyqfjGUhn1Qv47CLBL9J0ryRaacnAF7SNMwExUJgF4nlw1PJU56/2n+Yfa4VIzoQPTTyTgMGPhjTIbihZ10kVgKyVyHQ/2MRi+cdUaUcxAQX6Plg/TbWA/7hkIIOVplSQXLRR5KVkgBUAlODvk72FqGXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684561; c=relaxed/simple;
	bh=sBbQPOjLwu9/R/Hsobet6JLCC9Z0TckvpZdLwfuu+44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQ5SfxiX6ilR5EOnljJPY/+Es+aKcZ6QRx/Ren6Mafxu2UDzTiwiNJ2nLi5ew00sSKMzMMuSK4NAJE15QtrxVfUFBm8sbDdIk3WrrNVNriV78yXTyNaeILwzy4BydzSGIsNo781uLBdznqVOgJ/R1ytlRkTDSQVOs+NnkURLr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3WKExBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3WKExBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC9D1F000FF;
	Thu, 17 Sep 2026 22:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684559;
	bh=mF76YpXDW/bw5iafoFKrdd8T0stY+u32kwdHPUYlLd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I3WKExBKh7BBPeC+V9bILBWdvF/QK7zPmyyxVdZXxNiv3JJRJqgKw5fuaFnYFD3C5
	 TmqeSlpINLl6ZPQisz0lJo9Ofoi7kLkzIBvxEH78zU6rSDeuY+1aT0uhPNXP5cN3Wa
	 mooXXQoGgpDsj6tXu83kJgSuXRG9DKHH8ksk25YU+B/5wvDnXFLRBHFOoAWHI+BfHy
	 OLr6EcEQJGOyRr/xuGNtTJapgjtPOxhYz51X+cgIqoOC30vVXC5Gw20QSwXw6Ac3qH
	 p5DmnMiDWfAQ0eS0vO1S3sMsD7BXTD4R7BqnFN6H087msW4sU8vh0tWNk9abYCyeD/
	 p5AcvmGG3O4uw==
Message-ID: <d4b07e0a-24f0-4857-b5db-0e74ffe537ed@kernel.org>
Date: Thu, 17 Sep 2026 23:35:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/10/26 6:52 PM, Viken Dadhaniya wrote:
> Switching a channel to a new frequency without first disabling the stream
> causes the channel to be re-enabled without a clean shutdown, leading to a
> crash on the DSP subsystem.
> 
> Implement qcom_slim_ngd_disable_stream() so clients can properly close a
> channel before switching to a new frequency.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rewrite commit description for clarity.
> - Fix initializers: use { 0 } instead of {0} and {0,}.
> - Use reverse christmas tree ordering for local variable declarations.
> - Replace open-coded shift/mask with FIELD_PREP() and GENMASK-based defines.
> - Add SLIM_MSG_HDR_LEN macro to replace magic number +4 in txn.rl assignments.
> - Fix dev_err format strings: add spaces after colons and commas.
> - Update enum slim_ch_control comment to kernel-doc format with @member tags.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 82 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/slimbus/slimbus.h       | 13 +++++++
>  2 files changed, 93 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 934c44c5bc1a..30d6ac52072b 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1,7 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
> -// Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
> -// Copyright (c) 2018, Linaro Limited
> +/*
> + * Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2018, Linaro Limited
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Why are you modifying this?

> + */
>  
> +#include <linux/bitfield.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> @@ -86,6 +90,10 @@
>  #define SLIM_ROOT_FREQ	24576000
>  #define LADDR_RETRY	5
>  
> +#define SLIM_CHAN_CTRL_CMD		GENMASK(7, 6)
> +#define SLIM_CHAN_CTRL_LADDR		GENMASK(4, 0)
> +#define SLIM_MSG_HDR_LEN		4
> +
>  /* Per spec.max 40 bytes per received message */
>  #define SLIM_MSGQ_BUF_LEN	40
>  #define QCOM_SLIM_NGD_DESC_NUM	32
> @@ -1085,6 +1093,75 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
>  	return ret;
>  }
>  
> +static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
> +{
> +	struct slim_device *sdev = rt->dev;
> +	struct slim_controller *ctrl = sdev->ctrl;
> +	struct slim_msg_txn txn = { 0 };
> +	struct slim_val_inf msg = { 0 };
> +	u8 wbuf[SLIM_MSGQ_BUF_LEN];
> +	u8 rbuf[SLIM_MSGQ_BUF_LEN];
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
> +	for (i = 0; i < rt->num_ports; i++) {
> +		struct slim_port *port = &rt->ports[i];
> +
> +		if (txn.msg->num_bytes == 0) {
> +			wbuf[txn.msg->num_bytes++] =
> +				FIELD_PREP(SLIM_CHAN_CTRL_CMD, SLIM_CH_REMOVE) |
> +				FIELD_PREP(SLIM_CHAN_CTRL_LADDR, sdev->laddr);
> +
> +			ret = slim_alloc_txn_tid(ctrl, &txn);
> +			if (ret) {
> +				dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
> +				return ret;
> +			}
> +			wbuf[txn.msg->num_bytes++] = txn.tid;
> +		}
> +		wbuf[txn.msg->num_bytes++] = port->ch.id;
> +	}
> +
> +	txn.mc = SLIM_USR_MC_CHAN_CTRL;
> +	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
> +			txn.mc, txn.mt, sdev->laddr, ret);
> +		return ret;
> +	}
> +
> +	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
> +	txn.msg->num_bytes = 2;
> +	wbuf[1] = sdev->laddr;
> +	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
> +
> +	ret = slim_alloc_txn_tid(ctrl, &txn);
> +	if (ret) {
> +		dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
> +		return ret;
> +	}
> +
> +	wbuf[0] = txn.tid;
> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
> +			txn.mc, txn.mt, sdev->laddr, ret);
> +	}
> +
> +	return ret;
> +}
> +
>  static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
>  				   struct slim_eaddr *ea, u8 *laddr)
>  {
> @@ -1624,6 +1701,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
>  	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
>  	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
> +	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
>  	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
>  	ctrl->ctrl.wakeup = NULL;
>  	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
> diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
> index 00a7f112574b..c1137e8aedf4 100644
> --- a/drivers/slimbus/slimbus.h
> +++ b/drivers/slimbus/slimbus.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (c) 2011-2017, The Linux Foundation
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
same here, why?
>   */
>  
>  #ifndef _DRIVERS_SLIMBUS_H
> @@ -316,6 +317,18 @@ enum slim_transport_protocol {
>  	SLIM_PROTO_EXT_HALF_DUP,
>  };
>  
> +/**
> + * enum slim_ch_control: Channel control.
> + * @SLIM_CH_ACTIVATE: Schedules channel or group of channels in the TDM frame.
> + * @SLIM_CH_SUSPEND: Keeps the TDM schedule but halts data transfer.
> + * @SLIM_CH_REMOVE: Drops the channel or group from the TDM frame.
> + */
> +enum slim_ch_control {
> +	SLIM_CH_ACTIVATE,
> +	SLIM_CH_SUSPEND,
> +	SLIM_CH_REMOVE,
> +};
> +
>  /**
>   * struct slim_stream_runtime  - SLIMbus stream runtime instance
>   *
> 
> ---
> base-commit: 415606a7be939835db9b0d6b711887586646346d
> change-id: 20260803-slim-disable-stream-support-43599401607f
> 
> Best regards,
> --  
> Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 

