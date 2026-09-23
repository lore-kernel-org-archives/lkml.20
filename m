Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8BB35E1AF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182570; cv=none; b=UZiEpXc/qqh18EXK3JESzWw/58C+pfk8Vxyo6ljCdwVc1DdtbofHDV8AtezXZwX24UfXVSrTWfOHTDunsIhRPIt6aDd5XzjlkBhP/3AFQFf8j+zkI/St/4it0qRlM9N2/KOq/Y62q+h0ymVLiGPhDzBDsLHs0XxHxKjjunr06Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182570; c=relaxed/simple;
	bh=6lokIIbRgQqoJSd4xebYCqEA8HJAy/wKbOQpg9NM8CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXc1WhKACGUmMgmMR11ttWDDRuPql7Do0Fii1nyS7E24Q4aJPx58sKmxekbSQaaAwOifjKPKLFWqHGmRDB43kHo0DsTzH3JnwqhCoQzR+s8lLHGweiHLVY3yKxG80zmXJnFcucMOD2VfZIr02gU2a95Qh6jsGwz7NXZcw5+S408=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bkk1Endm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bkk1Endm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7821F000FF;
	Wed, 23 Sep 2026 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790182568;
	bh=st37PG8bv43+Ahi0BznKR1eeHBKgme3mMb7vth0Hkdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Bkk1Endmqr0KQan28Cx/xcmkSJGYrh8gXPIBnRWC8Be5e/eKLKCXwPZSh4FJ1qI40
	 sU2Bqf5LbkbwFxq2z4yKNtTVzQvWxeaicGSfXW+4O4HkQkLCaJEoTQyJ1bJ+iUatWq
	 PMIw4FhKEyfOeXzpVlKV958yeWRlcj8XjtaQwVBGjha5rhfwo4UL1ItgjzMBfK9bz2
	 BWsayhv6y5AJhJOvilLPlw2k3WbcvppC7B1vVqQpyluap/q234tX2oLOQkL2dBWA0a
	 QUx8i7lot/f5pfGSHCd7aAMcAfMofZ0TZWJ7DBgyzOl25zNPloEXvuBXRl2Sl5bCMl
	 sqlPNY0HiRr9A==
Message-ID: <8f2a6acf-05d3-4463-92ae-d79f331ff4be@kernel.org>
Date: Wed, 23 Sep 2026 11:56:06 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: stratix10-svc: add FCS crypto-service
 commands for Agilex 5
To: hang.suan.wang@altera.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com, tze.yee.ng@altera.com,
 chee.nouk.phoon@altera.com, genevieve.chan@altera.com,
 adrian.ho.yin.ng@altera.com
References: <cover.1789448406.git.hang.suan.wang@altera.com>
 <7c566ebe4024ef5c827de37a26c950ce9c202769.1789448407.git.hang.suan.wang@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <7c566ebe4024ef5c827de37a26c950ce9c202769.1789448407.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hang Suan,

On 9/15/26 03:25, hang.suan.wang@altera.com wrote:
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

<snip>

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

I don't think you need the above include.


Dinh

