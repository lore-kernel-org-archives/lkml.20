Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3312D3F54A4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184374; cv=none; b=syrPukXtBgMcXNeSM+2ZFNyCzKJRKpMY3D1sOtaN0MVqb8uMPHMw3D9QZqSX0xd0iufX6CbHjrve0YW4SasB8saiC0AfyMv9LyRt/6tTpDtlQu9hJCrk6uZ3dH2eTmnSCeUVniiHfz9NNe8pk+pqwpwMKFcFMP/r1s9Cs5lSHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184374; c=relaxed/simple;
	bh=Er9oqPBQrHuNy1LZ0kjHor+yXTWXjfbzxppCXP23G28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQ6KRvnr+fwniulQxXjHU61TlxjhCjV0oXGkysB4N3lkfJKVTOl2qMQ9fGtm68Ba6CXNpFN1UJWaBQmdXdFj5XJZoCaZXxuWFgTXqE99hhzjHlWzs7Z54LzBYFWJwkX+ozMLZK6pebcD/pV5XDN5VYbKMPX+lAbcRUgsymz/FTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sa+MAkcR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sa+MAkcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097121F000FF;
	Wed, 23 Sep 2026 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184372;
	bh=cvDimQIGm9Wi0MFjm/wmDxID/1HZ9OhjyTZKZb8d394=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Sa+MAkcRDi7dHjeQ9qWNOBoh0SmByAfKs7DTO//Q1vIm454chYgsMu0xJFLwrLgO8
	 cMzeaI46c+B5vAe/aJPseqhgZZryhdRQoMrTfFrBI/pbOztGP9aZva2OTMY3WeBE1U
	 o2nOSt/3qU+UUevxd5nDtpadTDWdCX7ynFm/SHsr629yxYxIhRE1qhKyNoKhnpeobF
	 XQ8WhnhafOk/hHP01DBR89GjBe37V/RXI7b1z4+6HQGnQIA00wmJlKNvFMEkr5WHwm
	 SvhFax5RJg5d5hAzlk1hVNFgxXJSrZm1vKw+nzzSVDfn97LuK+dQd1F4ysMe9/9D2+
	 psNq+wchIqd5A==
Message-ID: <e402fd5c-86bd-4666-8a96-6f0f5ea4bc38@kernel.org>
Date: Wed, 23 Sep 2026 12:26:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] firmware: stratix10-svc: add FCS crypto-service
 commands for Agilex 5
Content-Language: en-US
To: hang.suan.wang@altera.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com, tze.yee.ng@altera.com,
 chee.nouk.phoon@altera.com, genevieve.chan@altera.com,
 adrian.ho.yin.ng@altera.com
References: <cover.1790183372.git.hang.suan.wang@altera.com>
 <3ae33440d87e3bedca95048d7e798e5bab7871a0.1790183375.git.hang.suan.wang@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <3ae33440d87e3bedca95048d7e798e5bab7871a0.1790183375.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/26 12:23, hang.suan.wang@altera.com wrote:
> From: Hang Suan Wang <hang.suan.wang@altera.com>
> 
> The Agilex 5 Secure Device Manager (SDM 1.5) exposes an FPGA Crypto
> Service (FCS) over the existing SIP SMC mailbox: a session-based
> interface for crypto primitives such as SDOS (Secure Data Object
> Service) encrypt/decrypt. The service layer has no command to drive it
> yet.
> 
> Configure stratix10-svc about this interface so an in-kernel FCS client
> can use it:
> 
>    - add the client command codes COMMAND_FCS_CRYPTO_OPEN_SESSION,
>      COMMAND_FCS_CRYPTO_CLOSE_SESSION and COMMAND_FCS_SDOS_DATA_EXT (all
>      asynchronous)
> 
>    - add the matching asynchronous SIP SMC function IDs
>      (INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION,
>      INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION and
>      INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT) with their register-usage
>      documentation;
> 
>    - match "intel,agilex5-svc" and register a "stratix10-fcs" child
>      platform device, mirroring the existing RSU child, so an FCS client
>      driver can bind without a dedicated device-tree node;
> 
>    - dispatch the new commands in the asynchronous send and response
>      paths; for the SDOS data command, translate the source and
>      destination buffers (allocated from the service-layer gen_pool) to
>      physical addresses and pass them, together with the session/context
>      IDs and owner ID, to the SDM.
> 
> The transport is unchanged: Agilex 5 reuses the SIP SMC calling
> convention and async mailbox ABI the driver already implements, so no
> new transport mechanism is required.
> 
> The SDOS SMMU-remapped address slots currently carry the buffer
> physical addresses; SMMU remapping support is added in a follow-up
> series.
> 
> This is a prerequisite for the SoCFPGA FCS driver, the first in-tree
> consumer of these commands.
> 
> Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
> Reviewed-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>   drivers/firmware/stratix10-svc.c              | 59 +++++++++++++++--
>   include/linux/firmware/intel/stratix10-smc.h  | 64 +++++++++++++++++++
>   .../firmware/intel/stratix10-svc-client.h     | 16 +++++
>   3 files changed, 134 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index 07345efeef0c..8ead4a3c4a1b 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -46,6 +46,7 @@
>   
>   /* stratix10 service layer clients */
>   #define STRATIX10_RSU				"stratix10-rsu"
> +#define STRATIX10_FCS				"stratix10-fcs"
>   #define SOCFPGA_HWMON				"socfpga-hwmon"
>   
>   /* Maximum number of SDM client IDs. */
> @@ -106,10 +107,12 @@ struct stratix10_svc_chan;
>   /**
>    * struct stratix10_svc - svc private data
>    * @stratix10_svc_rsu: pointer to stratix10 RSU device
> + * @stratix10_svc_fcs: pointer to stratix10 FCS device
>    * @stratix10_svc_hwmon: pointer to stratix10 HWMON device
>    */
>   struct stratix10_svc {
>   	struct platform_device *stratix10_svc_rsu;
> +	struct platform_device *stratix10_svc_fcs;
>   	struct platform_device *stratix10_svc_hwmon;
>   };
>   
> @@ -1398,6 +1401,30 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
>   		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
>   
>   	switch (p_msg->command) {
> +	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
> +		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION;
> +		break;
> +	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
> +		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION;
> +		args.a2 = p_msg->arg[0];
> +		break;
> +	case COMMAND_FCS_SDOS_DATA_EXT:
> +		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT;
> +		args.a2 = p_msg->arg[0];
> +		args.a3 = p_msg->arg[1];
> +		args.a4 = p_msg->arg[2];
> +		/* payloads are allocated from the svc gen_pool; pass phys addr */
> +		args.a5 = gen_pool_virt_to_phys(ctrl->genpool,
> +						(unsigned long)p_msg->payload);
> +		args.a6 = p_msg->payload_length;
> +		args.a7 = gen_pool_virt_to_phys(ctrl->genpool,
> +						(unsigned long)p_msg->payload_output);

These calls to gen_pool_virt_to_phys() can fail.


> +		args.a8 = p_msg->payload_length_output;
> +		args.a9 = p_msg->arg[3];
> +		/* SMMU remapping is added later; pass phys addr for now */
> +		args.a10 = args.a5;
> +		args.a11 = args.a7;
> +		break;
>   	case COMMAND_RSU_GET_SPT_TABLE:
>   		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_SPT;
>   		break;
> @@ -1495,8 +1522,13 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
>   	data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
>   
>   	switch (p_msg->command) {
> +	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
>   	case COMMAND_RSU_NOTIFY:
>   		break;
> +	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
> +	case COMMAND_FCS_SDOS_DATA_EXT:
> +		data->kaddr1 = (void *)&handle->res.a2;
> +		break;
>   	case COMMAND_RSU_GET_SPT_TABLE:
>   		data->kaddr1 = (void *)&handle->res.a2;
>   		data->kaddr2 = (void *)&handle->res.a3;
> @@ -2004,6 +2036,7 @@ EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
>   static const struct of_device_id stratix10_svc_drv_match[] = {
>   	{.compatible = "intel,stratix10-svc"},
>   	{.compatible = "intel,agilex-svc"},
> +	{.compatible = "intel,agilex5-svc"},
>   	{},
>   };
>   
> @@ -2107,7 +2140,18 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
>   
>   	ret = platform_device_add(svc->stratix10_svc_rsu);
>   	if (ret)
> -		goto err_put_device;
> +		goto err_put_rsu;
> +
> +	svc->stratix10_svc_fcs = platform_device_alloc(STRATIX10_FCS, 0);
> +	if (!svc->stratix10_svc_fcs) {
> +		dev_err(dev, "failed to allocate %s device\n", STRATIX10_FCS);
> +		ret = -ENOMEM;
> +		goto err_unregister_rsu;
> +	}
> +
> +	ret = platform_device_add(svc->stratix10_svc_fcs);
> +	if (ret)
> +		goto err_put_fcs;
>   
>   	if (IS_ENABLED(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)) {
>   		svc->stratix10_svc_hwmon =
> @@ -2139,10 +2183,14 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
>   err_unregister_clients:
>   	if (svc->stratix10_svc_hwmon)
>   		platform_device_unregister(svc->stratix10_svc_hwmon);
> -	if (svc->stratix10_svc_rsu)
> -		platform_device_unregister(svc->stratix10_svc_rsu);
> +	platform_device_unregister(svc->stratix10_svc_fcs);
> +	goto err_unregister_rsu;
> +err_put_fcs:
> +	platform_device_put(svc->stratix10_svc_fcs);
> +err_unregister_rsu:
> +	platform_device_unregister(svc->stratix10_svc_rsu);
>   	goto err_free_fifos;
> -err_put_device:
> +err_put_rsu:
>   	platform_device_put(svc->stratix10_svc_rsu);
>   err_free_fifos:
>   	/* only remove from list if list_add_tail() was reached */
> @@ -2164,9 +2212,10 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
>   	struct stratix10_svc_controller *ctrl = platform_get_drvdata(pdev);
>   	struct stratix10_svc *svc = ctrl->svc;
>   
> -	platform_device_unregister(svc->stratix10_svc_rsu);
>   	if (svc->stratix10_svc_hwmon)
>   		platform_device_unregister(svc->stratix10_svc_hwmon);
> +	platform_device_unregister(svc->stratix10_svc_fcs);
> +	platform_device_unregister(svc->stratix10_svc_rsu);
>   
>   	stratix10_svc_async_exit(ctrl);
>   
> diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
> index 366309260121..75a39e7190af 100644
> --- a/include/linux/firmware/intel/stratix10-smc.h
> +++ b/include/linux/firmware/intel/stratix10-smc.h
> @@ -669,6 +669,70 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
>   #define INTEL_SIP_SMC_FCS_GET_PROVISION_DATA \
>   	INTEL_SIP_SMC_STD_CALL_VAL(INTEL_SIP_SMC_FUNCID_FCS_GET_PROVISION_DATA)
>   
> +/**
> + * Request INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
> + * Async call to perform encryption/decryption
> + *
> + * Call register usage:
> + * a0 INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
> + * a1 transaction job id
> + * a2 session ID
> + * a3 context ID
> + * a4 cryption operating mode (1 for encryption and 0 for decryption)
> + * a5 physical address of source
> + * a6 size of source
> + * a7 physical address of destination
> + * a8 size of destination
> + * a9 sdos ownership
> + * a10 smmu remapped address of source
> + * a11 smmu remapped address of destination
> + * a12-a17 not used
> + *
> + * Return status:
> + * a0 INTEL_SIP_SMC_STATUS_OK or INTEL_SIP_SMC_STATUS_ERROR
> + * a1-a17 not used
> + */
> +#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT (0x12F)
> +#define INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT \
> +	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT)
> +
> +/**
> + * Request INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION
> + * Async call to open and establish a crypto service session with firmware
> + *
> + * Call register usage:
> + * a0 INTEL_SIP_SMC_FCS_OPEN_CRYPTO_SERVICE_SESSION
> + * a1 transaction job id
> + * a2-a17 not used
> + *
> + * Return status:
> + * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
> + * or INTEL_SIP_SMC_STATUS_BUSY
> + * a1-a17 not used
> + */
> +#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION (0x13A)
> +#define INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION \
> +	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION)
> +
> +/**
> + * Request INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
> + * Async call to close a service session
> + *
> + * Call register usage:
> + * a0 INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
> + * a1 transaction job id
> + * a2 session ID
> + * a3-a17 not used
> + *
> + * Return status:
> + * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
> + * or INTEL_SIP_SMC_STATUS_BUSY
> + * a1-a17 not used
> + */
> +#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION (0x13B)
> +#define INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION \
> +	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION)
> +
>   /**
>    * Request INTEL_SIP_SMC_HWMON_READTEMP
>    * Sync call to request temperature
> diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
> index 9bb46c3cb0f8..ffc1ac7c9785 100644
> --- a/include/linux/firmware/intel/stratix10-svc-client.h
> +++ b/include/linux/firmware/intel/stratix10-svc-client.h
> @@ -7,6 +7,8 @@
>   #ifndef __STRATIX10_SVC_CLIENT_H
>   #define __STRATIX10_SVC_CLIENT_H
>   
> +#include <linux/types.h>

Shouldn't need this.

Dinh
