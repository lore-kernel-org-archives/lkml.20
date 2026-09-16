Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B78A4FECD7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555078; cv=none; b=XmeKZIlTYDCg/tTJsO5d80XcGrLpJWGDLnPuRupfRSzfroy90o15y7t552upgYqm0hHtpmHm2bCzIZY/VA2M7o1z3onukQKjnb798Vb2tJU7/yfw50SpfDUbanFMvSdWqi2AEhfzviudjhURKItJUL7scVlNsUqj5HW7fI5vw8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555078; c=relaxed/simple;
	bh=D9FLIJZO8QSfHmJQ7HJ1vUHDWHscdlD8COtFiTPpb5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmY4H3drpvrz1p2zg9ImDz7mVhsTA42fGDLFKgtk7/s+DrYZn5Sj5m2B74wx7z1M/6RoQuhp8bX0JmEXnjl/tUIlJ85gbf6UuogmUCq8k/QJtzRj47th+sal91avI2h5knfqYqVBMyDM4e3yMLoKf5+jgzcMDraVqYhxhEdZ0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CKukPzsq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CKukPzsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789555059;
	bh=D9FLIJZO8QSfHmJQ7HJ1vUHDWHscdlD8COtFiTPpb5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CKukPzsqZFLhoiLDPwPA9YYkGO1+KUamch3lJpo6XwsbdDjPNBdj5kzrkzxa4vlZa
	 JbySdpvggr3o1DJLKa5wAcBZnDXAbWLhPYiEk9EsLQoZvJaXF6rA18VpXWn8+xWTKf
	 s/dkw24GqK/8lTLscTVSVlvIuZMl0qzqBiiyWZKsAQ8FHuAYbF0VjATEJKkOO38WN2
	 ETRK5CP1WFZ2RuGHVv4tEsiqzP42n32iIXfYeMJL7p4SvRPIytUR0Iy5ICgXPH2wMP
	 YIuHjUuRSvJdqYWvx1y5REgIdDfb1eYFirByg67LR+mQZzwaNHCwQYPlmAHQjPaVeD
	 VoDLj5YPWp0UA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC3D317E0420;
	Wed, 16 Sep 2026 12:37:38 +0200 (CEST)
Message-ID: <e7d5b410-8a0c-4add-b4c5-9e9573fa9c68@collabora.com>
Date: Wed, 16 Sep 2026 12:37:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: mtk-pmif: Add workaround for FSM lockup/error in
 read operation
To: sboyd@kernel.org
Cc: matthias.bgg@gmail.com, justin.yeh@mediatek.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 14:19, AngeloGioacchino Del Regno wrote:
> The SPMI PMIF in some SoCs like MT8196 is affected by a hardware
> issue that makes the first read operation on each SID to fail as
> the FSM locks up after sending the read command, and this happens
> at least in the following conditions:
>   - At boot, after bootloader handoff; and
>   - At every suspend->resume cycle.
> 
> This critical bug may produce unwanted issues in regulator drivers
> which may fail to set voltages, making the platform to end up in a
> undervoltage or, a bit more critically, an overvoltage condition,
> producing instability or ... worse.
> 
> In order to work around this issue, add a retry mechanism into the
> pmif_spmi_read_cmd() callback which will resend the read command
> up to 3 times in the following conditions:
>   - Software Interface returns an error; or
>   - Software Interface never gets in WFVLDCLR state.
> 
> As to avoid uselessly blocking for too much time, only during the
> read-retry loop, the maximum SWINF polling time for each trial is
> reduced to PMIF_TIMEOUT_US / 2: this was tested on multiple SoCs
> and seems to always be enough, as when any read succeeds it will
> always take less than 40ms.
> In any case, this is still allowing 1.5 times the previous maximum
> polling time, reaching a total maximum (for 3 retries) of 150ms.
> 
> Worst case testing that I performed saw a third retry only 3 times
> out of ~100 reboots.
> 
> Fixes: 1f5be2d7f743 ("spmi: mtk-pmif: Add support for MT8196 SPMI Controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This is a *fix*, and has been waiting for 2.5 months.

Can anyone please apply it?

Thanks,
Angelo

> ---
>   drivers/spmi/spmi-mtk-pmif.c | 38 +++++++++++++++++++++++++++---------
>   1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index 1048420b5afb..61c916edaec4 100644
> --- a/drivers/spmi/spmi-mtk-pmif.c
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -21,6 +21,7 @@
>   #define SWINF_WFVLDCLR	0x06
>   
>   #define GET_SWINF(x)	(((x) >> 1) & 0x7)
> +#define GET_SWINFERR(x) (((x) >> 18) & 0x1)
>   
>   #define PMIF_CMD_REG_0		0
>   #define PMIF_CMD_REG		1
> @@ -349,6 +350,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	struct pmif *arb = to_mtk_pmif(ctrl);
>   	struct ch_reg *inf_reg;
>   	int ret;
> +	u8 retry = 0;
>   	u32 data, cmd;
>   	unsigned long flags;
>   
> @@ -385,17 +387,35 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   		return ret;
>   	}
>   
> -	/* Send the command. */
>   	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
> -	pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
> +	do {
> +		/* Send the command. */
> +		pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
> +
> +		/*
> +		 * Wait for Software Interface FSM state to be WFVLDCLR or to
> +		 * return an error.
> +		 *
> +		 * If this is WFVLDCLR, read the data and clear the valid flag;
> +		 * If error or timeout, retry for a maximum of 3 times as a
> +		 * workaround for an hardware issue.
> +		 */
> +		ret = readl_poll_timeout_atomic(pbus->base + arb->data->regs[inf_reg->ch_sta],
> +						data,
> +						GET_SWINF(data) == SWINF_WFVLDCLR ||
> +						GET_SWINFERR(data),
> +						PMIF_DELAY_US, PMIF_TIMEOUT_US / 2);
> +		if (ret < 0)
> +			continue;
> +
> +		if (GET_SWINFERR(data)) {
> +			ret = -EIO;
> +			continue;
> +		}
> +
> +		break;
> +	} while (++retry < 3);
>   
> -	/*
> -	 * Wait for Software Interface FSM state to be WFVLDCLR,
> -	 * read the data and clear the valid flag.
> -	 */
> -	ret = readl_poll_timeout_atomic(pbus->base + arb->data->regs[inf_reg->ch_sta],
> -					data, GET_SWINF(data) == SWINF_WFVLDCLR,
> -					PMIF_DELAY_US, PMIF_TIMEOUT_US);
>   	if (ret < 0) {
>   		raw_spin_unlock_irqrestore(&pbus->lock, flags);
>   		dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");
