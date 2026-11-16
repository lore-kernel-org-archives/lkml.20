Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840326;
	b=HykL+UHJhyQVPGBxC7aYWssXGCU5PWWTqjdNSlMTyuYmn9VdiTCI2Lofr79DQWIoXFdR
	 kpSF1BLNOm2Od5C61gaGkvsGmCYJcRsUuQ0DNI8/ocUW33qrdn0PsIglAq7UNsh8b7w62
	 YSGam8i0abqCX+oP/pIpb8A6xDb/cvaYyAc+JErNyEUx9teNYenddhSeQOADE83NbSF+E
	 legiV+sLug8cdhlf/uIRjtT/DjsDaMl6pJX+ylHrgtPgHO5UeiBbisFvqhpGniDMLJZ0d
	 t8mWKIRLMEH/2lhD7jdJO4/iwzcvaEEXCOW2TxwExY7KuomM7oe1+EMFDgwugqp/nkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840326;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NpgdO5V2VXfvFZ4iWky74S1tzJusZ14GI+YNDwiHq7A=;
	b=MluGKNWs9L9T/qC0CeQV8P+IFj4Q/KMt2RqtzxA2Xat5Vgvic0DUal4WWLVeQDwYaH41
	 95GE5e/l/qMuEGRnP3fDzuf6zwYRHR2FHLrKIHlv6x3gFVQsAngCOxoAfpzeK4p6yvEsd
	 pidaCUI4WS5SG2RNFjYp7ibZyVEbxKnTW0f+tFgKaU0O/o5NyhDGuo3OBlh8k/Dlaaw/V
	 hN3TgaMZcBDcDmPaXkZkrk5X2n6tnvCa94LeJem/vwLjRZErof82CQSb5YjyCMWuJzXKL
	 jFug2p3ZEmgFJxr59EgCfxhWq2Ql+SGAWeym0I+PedBGdWLtRgjzZ+FKVCzyaq3G8Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=od1pyl6A;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC1606A32C;
	Mon, 16 Nov 2026 14:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BC1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=od1pyl6A
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7454F289;
	Mon, 16 Nov 2026 15:42:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794840176;
	bh=TvXjY5CWkYhsicZh9NquV+INu9hL23uQkpna6tR7bIc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=od1pyl6AJ/qKyibCzd8kXugSmhFLXyPzLJEuGdjubnt6yEHgL2xRRlz92aeKsey0X
	 kBXfOz5uMBuhOoQ+flDNUKLlTd+oZPweTP5/gFq6XV21kj+jhyD3dHxtac+86scHGR
	 wwXOjEMO9q1/Kv3lADt0sjwuGdWqJsTFKpiJNH8g=
Message-ID: <a7f7c29d-dfda-48ed-8790-2b86eaa1b909@ideasonboard.com>
Date: Mon, 16 Nov 2026 14:45:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v4L: core: ioctl: fix format description for
 V4L2_PIX_FMT_RAW_CRU20
To: Oliver Neukum <oneukum@suse.com>, mchehab@kernel.org,
 bryan.odonoghue@linaro.org, dan.scally+renesas@ideasonboard.com,
 niklas.soderlund+renesas@ragnatech.se, hverkuil+cisco@kernel.org,
 deepa.madivalara@oss.qualcomm.com, entropy1110@gmail.com,
 jai.luthra+renesas@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116143716.602898-1-oneukum@suse.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261116143716.602898-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oliver

On 16/11/2026 14:37, Oliver Neukum wrote:
> The description for the 20bit format says 14bit.
> Likely copy'n'paste. Change it to 20.
> 
> Fixes: 78584431e2ce ("media: v4l2: Add Renesas Camera Receiver Unit pixel formats")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---

Oops! Thanks for spotting that!

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae70735..fe9dac613e92 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1434,7 +1434,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>   	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
>   	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
>   	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> -	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
> +	case V4L2_PIX_FMT_RAW_CRU20:	descr = "20-bit Raw CRU Packed"; break;
>   	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
>   	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
>   	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;

