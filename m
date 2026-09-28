Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D51218592;
	Mon, 28 Sep 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584188; cv=none; b=S74P6HPRm+jiu+IG1INWkmolo0Laj0+vHYGGmru9L5R6rNMrayju0A5MDHpVS8pCxTIUbHqEvbn53Mzk6zhfYt9Q6yeZj7/4clnVbhzYYarj5tYLhoFqIG+lqZNWgHVEKneKbzNas+XqtkEvWRtRahqqYnecQgR92UtTMNsOobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584188; c=relaxed/simple;
	bh=KrlCLsEPy6i+Fn0tPrKLSS4HQF4I6tn0uGveEr/VM6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRUEG3I3wL8ySgIlPm146j5Vhy/lw+CJWljbxTHFV4F2WOQ/xhsiX6kidj+t1gcyy4GNqLsHXteDZOZmr8Kols/QS6Wh3KlcxAjJRoKFH9nU4+QMbtRkwhC51NkGvTouUdpC5wewUL/EMheqmcKLIsZUjq91evZ9QY4Da4BH3Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3c6Y2tD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3c6Y2tD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C1D1F000FF;
	Mon, 28 Sep 2026 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584186;
	bh=IZAP9Bay2IciXaBinquhfRw0Eu5bH+v9rrr+JMH5nno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O3c6Y2tDshehPW7DmHao4G983vFF10mlnFWO53Neh6vYVcG8Va3kHppgfQyiDnv4L
	 FbLRYfTcPrKg/6m1ylBpGsn8n6cWeLjVhqPG89UvGXHtTlXZHvZ92WAffsWMgeAmyn
	 OQ3UuCVhsq5UfYMTwPfy6E9BOBJQN5SO3SNKfADbxP8NHN1uHc6uqd2jJZBKXoxJ15
	 WztEK7OtYi7SPsLYODQbrc+m3G6txSicKkoo+LspB2ntbsQx79iUHxbClj6/PWAdOW
	 36sa60aBTNnC5nKgKMKlUYlIJarikgmNdmNzHlOJ0GaGNOuQnsQVghU5wxUbjc+wKZ
	 H5vrZx+W8sTDw==
Message-ID: <f268bd7e-48fa-4d5e-ae0a-165a857b6a9a@kernel.org>
Date: Mon, 28 Sep 2026 09:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: qcom: camss: vfe-17x: Fix write master
 selection for RDI lines
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ravi@ebytelogic.com
References: <20260928064336.272659-1-hitesh@ebytelogic.com>
 <2jpIk8J1d06yt8C04qiGPbBn1739XTQu_FPMJMROXkVbd83Z7e8j8P8fUMMLJITczKVtbLCLDgcAKBCPp1Nx_w==@protonmail.internalid>
 <20260928064336.272659-3-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260928064336.272659-3-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 07:43, Hitesh Patel wrote:
> On the gen2 VFE bus there is no crossbar between the RDI paths and
> the bus write masters: RDI n is served by write master n. The common
> vfe_get_output_v2() reflects this by mapping line->id to write master
> line->id, and every gen2 VFE except 17x uses it.
> 
> The 17x code kept its own vfe_get_output(), which reserves whichever
> write master is free first. That happens to be the right one as long
> as a single line streams and it is RDI0. As soon as two lines of the
> same VFE stream, for instance two virtual channels demultiplexed by
> the CSID to RDI0 and RDI1, the second line to start is given the
> write master of the other RDI. Both write masters are then programmed
> with the buffer address and frame size of the wrong line. The frames
> are truncated to the smaller of the two buffers and the SMMU faults
> on the larger one.
> 
> Use vfe_get_output_v2() on 17x like the other gen2 VFEs and drop the
> duplicate. This also removes an error path that released
> output->wm_idx[0] before it had been assigned.
> 
> The gen1 VFEs are not affected: they have a bus crossbar and any write
> master can serve any line, so vfe_reserve_wm() is correct there.
> 
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-17x.c | 41 +------------------
>   1 file changed, 1 insertion(+), 40 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index c011f64f63..62c2405359 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -382,45 +382,6 @@ static int vfe_halt(struct vfe_device *vfe)
>   	return 0;
>   }
> 
> -static int vfe_get_output(struct vfe_line *line)
> -{
> -	struct vfe_device *vfe = to_vfe(line);
> -	struct vfe_output *output;
> -	unsigned long flags;
> -	int wm_idx;
> -
> -	spin_lock_irqsave(&vfe->output_lock, flags);
> -
> -	output = &line->output;
> -	if (output->state > VFE_OUTPUT_RESERVED) {
> -		dev_err(vfe->camss->dev, "Output is running\n");
> -		goto error;
> -	}
> -
> -	output->wm_num = 1;
> -
> -	wm_idx = vfe_reserve_wm(vfe, line->id);
> -	if (wm_idx < 0) {
> -		dev_err(vfe->camss->dev, "Can not reserve wm\n");
> -		goto error_get_wm;
> -	}
> -	output->wm_idx[0] = wm_idx;
> -
> -	output->drop_update_idx = 0;
> -
> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
> -
> -	return 0;
> -
> -error_get_wm:
> -	vfe_release_wm(vfe, output->wm_idx[0]);
> -	output->state = VFE_OUTPUT_OFF;
> -error:
> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
> -
> -	return -EINVAL;
> -}
> -
>   /*
>    * vfe_enable - Enable streaming on VFE line
>    * @line: VFE line
> @@ -441,7 +402,7 @@ static int vfe_enable(struct vfe_line *line)
> 
>   	mutex_unlock(&vfe->stream_lock);
> 
> -	ret = vfe_get_output(line);
> +	ret = vfe_get_output_v2(line);
>   	if (ret < 0)
>   		goto error_get_output;
> 
> --
> 2.43.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
