Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A293B71DC;
	Wed,  7 Oct 2026 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362770; cv=none; b=GAtbTYJ8gdvTwIEm8txMomtmBMlwEwuuGF2JEpXb/3oaP2b2EMz4h1N+ebTZJI/kuvdrQDhdKUel2GPqd0Tww7kc5q9nQh83BtWlgLrlZbpE4AxenxuL8LU2viKEeZMhrtqM2f5CaaVFsKARIJiP2ODCczImx6f1FM5tw2I3Ruo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362770; c=relaxed/simple;
	bh=+VFL9bSekiaWM35AEU7AKiVq3S1x1X1FSLLULGKhFEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mz/15RxEtRNs366qUSFwOMYbZgljav8QlR7aCxLU18wZNzTc/C/dneP6359SOA9gAybTy3nQ1XepeAU0ALUz1ZGHcPtuLWkYVMeLund64KiGsOzYblJZresFYAg/asj7nRI1fpM8Cuu0EHwLdiYfkwKPpZsi4lNmfXdIlKKcePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaRs8/p5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaRs8/p5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0A11F0089B;
	Wed,  7 Oct 2026 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791362768;
	bh=RI8Z1/Le7EgVeUn2h6SorrHSYpKj5Zr0h3s/hxwai2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FaRs8/p5xCUTB5xJ5s9sdco5dYPR03kWuv8tn0w0/mLfk4k44+xw9Th3Ud91AkoZn
	 Mvib7lcj570t/8RoP7q/gD/Wq1yCrefCGVFEIoSG4sDMfwTHDlNvxw3i37O2xIXYT7
	 Vfrwn16Qt1jStNI8vPa7MQB0c/YcNhExjea8Mr6ciFjHoMbAOzQfDcc1fCpJn01p6Y
	 3uNRKLCVPat5M8FwuUj14zNdsXCyvphn9vqEzZvwEy2+l+SI35Q0Cm+18F79dY66kz
	 Xk2Qkla4Vxn4hYtwzlO3oaqsU1OrUYGd9y44IDYVmszplImnD/5OtA59910vPWf2It
	 oXGWauN8DmCpg==
Message-ID: <f23861e4-c2b5-49cc-b263-61bae88c6db8@kernel.org>
Date: Wed, 7 Oct 2026 10:46:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/74] media: qcom: camss: csid: Configure the stream on
 every s_stream
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss <rfoss@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <ekTHk3-yxwpMYFqVfXb2RMPIZJDNHu-Uz_nOfRQq7gQ1Pi7vGHdR3wWJYiPB-Y6_NWBQIo0p2hEpc06rPSRL0Q==@protonmail.internalid>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-15-ed985aefd611@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-15-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2026 19:13, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> csid_set_stream() only calls configure_stream() when need_vc_update is
> set, and need_vc_update is only set at power on and on a CSID link
> change. Stopping and restarting a stream while the pipeline stays
> powered, as userspace does when it keeps the video node open across
> STREAMOFF and STREAMON, therefore breaks the CSID in two ways:
> 
> - STREAMOFF does not stop the CSID: the paths it enabled keep running
>    after the VFE has stopped.
> - The following STREAMON does not configure the CSID: a format set
>    between the two streams is never programmed, and the CSID runs with
>    the previous stream's configuration.
> 
> need_vc_update was added so that several video nodes streaming through
> one CSID would configure it only once. Its counterpart in
> video_stop_streaming() was removed by commit 25f18cb1b673 ("media: qcom:
> camss: Remove use_count guard in stop_streaming"). Drop the rest of it and
> configure the stream on every s_stream.
> 
> Fixes: 3c4ed72a16bc ("media: camss: sm8250: Virtual channels for CSID")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 9 +--------
>   drivers/media/platform/qcom/camss/camss-csid.h | 1 -
>   2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 48459b46a981b..645e02ad6b9b1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -721,8 +721,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   			return ret;
>   		}
> 
> -		csid->phy.need_vc_update = true;
> -
>   		enable_irq(csid->irq);
> 
>   		ret = csid->res->hw_ops->reset(csid);
> @@ -777,10 +775,7 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>   			return -ENOLINK;
>   	}
> 
> -	if (csid->phy.need_vc_update) {
> -		csid->res->hw_ops->configure_stream(csid, enable);
> -		csid->phy.need_vc_update = false;
> -	}
> +	csid->res->hw_ops->configure_stream(csid, enable);
> 
>   	return 0;
>   }
> @@ -1306,8 +1301,6 @@ static int csid_link_setup(struct media_entity *entity,
>   		else
>   			csid->phy.en_vc &= ~BIT(local->index - 1);
> 
> -		csid->phy.need_vc_update = true;
> -
>   		dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
>   			__func__, csid->phy.en_vc);
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac8..53f43ae7b9327 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -69,7 +69,6 @@ struct csid_phy_config {
>   	u8 lane_cnt;
>   	u32 lane_assign;
>   	u32 en_vc;
> -	u8 need_vc_update;
>   };
> 
>   struct csid_device;
> 
> --
> 2.55.0
> 

This patch should come way earlier in the series.

---
bod
