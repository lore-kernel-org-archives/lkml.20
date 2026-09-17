Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FCB3EAC80;
	Thu, 17 Sep 2026 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632650; cv=none; b=JMF0fMSH2oeVcCOnU91OnLu84C0d1TwlF3eeMSNuzpFvIJPEeDfh2v7vV3qSjN+461He54tVcWPvG5dE62kQHR9YXAuDT8Sy0v9vRbPIIWKZy6KOAjrMKfaH/03RYlj2cYTuMbAMizoMGrMg8Zr8Zukpy4I8OZd37fJq45LMLIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632650; c=relaxed/simple;
	bh=/lueA+vcidEtOkFmFcGsSUec5x25wxqjlpXfsOGh7so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHX0Twi/PXN2Bz9lgs94NazFdQTtJZjsVWSSPvXd1XRpkEpWW/t0JXPwcKgPM4Nek3eEnbXStCQvsqfsF5vX2yZeuDHSVnAFD04zSX8cWnvQKbysk8UAq4GM2O99fWipZiDTzwG7dNYHcAThoHea7nZOW7LzVkAVHALo7TQbBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qJPg+/y3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qJPg+/y3"
Received: from [192.168.0.220] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 975FA324;
	Thu, 17 Sep 2026 10:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789632543;
	bh=/lueA+vcidEtOkFmFcGsSUec5x25wxqjlpXfsOGh7so=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJPg+/y3hJ+gpddZ2wRVVKBEnmuj7EzXMLzXnTKJBNYpPJUj3FIZHo0SyujnlmV4s
	 XZXUzt7dVgh8HkYwTKI0mF9ajI9ZhwLBaq6HhAF4opvyKgbw66PFeAksm2Fx6bEz7u
	 O89BY91DTQp6OijTlkUK+uiHA2su84OoXAr6ZKBQ=
Message-ID: <a6343116-618a-4616-a4e5-c04afc7d46da@ideasonboard.com>
Date: Thu, 17 Sep 2026 09:10:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: rkisp1-isp: Set correct data mode for YUV
 bypass
To: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
 <20260205103207.4020959-2-isaac.scott@ideasonboard.com>
Content-Language: en-GB
From: Alen Karnil <alen.karnil@ideasonboard.com>
Autocrypt: addr=alen.karnil@ideasonboard.com; keydata=
 xjMEafxhCxYJKwYBBAHaRw8BAQdAXswEEnvxYiHXb8Q8GsSAuaLuXqJFs3kmsMI7EWF9EuDN
 NUFsZW4gS2FybmlsIChXb3JrIElvQikgPGFsZW4ua2FybmlsQGlkZWFzb25ib2FyZC5jb20+
 wpkEExYKAEEWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCagGrrgIbAwUJBaOagAULCQgHAgIi
 AgYVCgkICwIEFgIDAQIeBwIXgAAKCRBRzoJ78NRPnkpDAP4kmtHsMfTtV6BC1z7GTb86BL2g
 9FC1EarGJDDzcafMGQEA6clsoXvRYjHPJexVebjmkI4bq1QM0X/L9Ffe0PfpdQbOOARp/GEL
 EgorBgEEAZdVAQUBAQdAsVoGZ4IK0EgJ8HU05PQKzK15jaCi/IEA/7Cw9ZzcBmwDAQgHwn4E
 GBYKACYWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCafxhCwIbDAUJBaOagAAKCRBRzoJ78NRP
 nqYcAP0eh3LahCDsfNa8zsiK+8QzeujWPKhc5zDcIqrDI6xufwD+Mu9e202It54rNZb8UWEy
 V5OzTEy0JlsQfO6DYWIORwI=
In-Reply-To: <20260205103207.4020959-2-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Taking over from Isaac but have some points to discuss.

On 05/02/2026 10:32, Isaac Scott wrote:
> The rkisp1 features a 'bypass' mode for RAW and YUV formats. This
> disables all ISP blocks, and makes the rkisp1 display input data from
> the MIPI CSI receiver at the output, unmodified.
> 
> To determine whether we can activate bypass, we can detect whether both
> the source and sink formats are YUV. If they are, we must configure the
> ISP to expect a YUV input, interpreting H/VSYNC signals as data
> enable / disable.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
> 
> Changelog since v1:
> - Removed in_bypass flag
> - Renamed the patch to better represent the functionality of the patch
> 
> ---
>   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2311672cedb1..21bfa0edbaf1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -240,7 +240,9 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>   		}
>   	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
>   		acq_mult = 2;
> -		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
> +		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
As Laurent states, this condition is always true, this will need to be 
reworked.
> +			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
Having tested this, DATA_MODE is correct, I am seeing a garbled image if 
using ITU601, definitely needs a comment if it goes against the 
documentation.

If we drop the earlier always true if statement, then the fix is to 
replace ITU601 selection with DATA_MODE, but there two paths that lead 
to ITU601 being selected, and I can only test one of them.

So the question is should both be replaced?
> +		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
>   			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
>   		} else {
>   			if (mbus_type == V4L2_MBUS_BT656)

-- 
Thanks,
Alen Karnil

