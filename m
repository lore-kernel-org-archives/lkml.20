Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D42F474252
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148852; cv=none; b=HiwJj6z+L0Sk2V7rY7pUzTspOUmRE+FCHJvOxUTbSd+a8XzGohGvT9Pgskq4WgY7EzFEn4/wAJombQipuyeisENo9mGbQ/sFf/bwRIHURsPYrthOuiyV1ipiKysXtD9innMV88MyubsUgYlOZvvtVG1IcyQtMJGmrGGAxWVwvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148852; c=relaxed/simple;
	bh=ZDcMunxd98cuO0F7FMu7fkkixoxvBN1tgMVTeIp/JyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUuiCakimjq7N2Ldy390HWW3DKF+u7I4GcrVXf2nL/FhYDTHXgIMNF0BrbcWIX2BozI5RxuH+EG9nOyC85VSuo3cx3UKZVdGjK9dF2KiONgSvW5S6AiS4K4PLKELEz9cg5FupVQPudHJJhD8r+2X42jKagzRKyHJ96DsFIzkbuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TEI93Gb2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TEI93Gb2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso321282f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792148847; x=1792753647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJqf2rITdCzziip2V1CcQ4gA2chUDN+IaUybbZl++MI=;
        b=TEI93Gb2ZyoBvpdGFTOblgsStFhAC3JSuO97n0HpNO3ASPk97RzKADz1fxDZMZjSwy
         oXajyXzKpXsvMoDo9X2smFfQDWnqOHsZcYB8BuNlD6AUonngN+ogpKKmhAbMq/gkA1e0
         kK5LUn2U/rnz3ItwL7QYKna+6PkvH+eSzBEL4D0WczrHs8jnA9Uwfk+qPbtBte7KH6lp
         9LvRkS1V0tzOjX3WHtj4pegDx4fDF+xo6axfPp5UjkvfCLriBAb39Fj9k1Zp7Xm43O2J
         S+Vwzaf9yLluE1ML4v9cY3hnj/T7mXw24h7+eZJZHr0rh7FHlitUBWOLwhFxo/3NYr+u
         UdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148847; x=1792753647;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJqf2rITdCzziip2V1CcQ4gA2chUDN+IaUybbZl++MI=;
        b=XQB+NUAmXECsHFdyHmTkQjmfeAFDObLdxghl3nPOZrSrM7hG2iAWKC4fKU15ZjgW/0
         5bbimAMmoHv74gqiwnVkCRGGs6kfbCd348iZuN7dSs6/U1bEzyTjSROhcmOrgAcOWEW6
         U4L7M0tdlmlax+fTuhr/20c7dFAgGYNSAXxzS61fEwce+TdSyF6MLYcX6MV9QcXDJeth
         A6B5hwVtKlAmvQGjr3cgROCMc+EubSGP5WXeCeLudjEJFhVkyAmTCbfndTjoeL6xY2Om
         2iRd3edPisD8AV77A+u0NrmpGzTiJ2Iwv5xIoygVyqV5Q8lL++ZlwAHhClw0KSihgOA0
         NIew==
X-Forwarded-Encrypted: i=1; AKwUvBwCbkRKn27F9drAJ6c+4914CK5AcAfy0VD6qUwBrp3FqR5U+WjxLpik8m0E8E23bly3pVMwI+HMmFje5to=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJxJr7PINV0dUJ+xEqV0j7gMbKiXOjWQzwSoW5R7/2jRT3e9g/
	wkS8Hk33dMvLI88MH+glJveXB6/XoHu2DIw8TD5+9KZG3CdkyBSwWF17rqt+dtmLmh0=
X-Gm-Gg: AYBFou3ijvKR8KDEXD1g36eJrZAeYrsjXae5wK1jQNKyGPg1zo9Dj8gmPGzotFzrXew
	uIJbEwIaMcKHQBrmO6RI7GCxlWfI5rJRCCFkk8fynGrPQlCuveyLPfS8Ps95RxPCR8CprMTx+V0
	605yt6xqXku4y1RfRs2TOht/2dkgmuPI+8ihGdcV94VBkpjElU8Tt7rWQiYBYucQEgeBtqvyR9w
	noXu7xDHlDlEjwExZTZXZlsWRoMx9QSo/b4Dtt4zPQ3siXrIiB6S8iIeTenwcHOQb9zI/C1bgMz
	eMwrCdwqQhLw/sYfW/OF3poJoK8d3sQvkuk6sd9Wf8j/GOsoqAaC77/JdyeSG96qpoqi2kLAYIh
	TH0LkZQzGOTXPP0qx+V4C6sj9kFEGcAPTzaPadsM+gW1v9KM/lnQVZHzUeiWKT7dtN78M8qOXGz
	0RpyD+KSI56nA2e5c0vvvcbaOA9qGc2FPs7IIaI5Oe0CbJzSzoOmpTP5b/tPoscZyoyIk78y247
	Ch9Fg0fgoQ=
X-Received: by 2002:a5d:6750:0:b0:48d:ed2e:6f3a with SMTP id ffacd0b85a97d-48dfacf53edmr4363835f8f.5.1792148847254;
        Fri, 16 Oct 2026 04:07:27 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm4468353f8f.47.2026.10.16.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:07:26 -0700 (PDT)
Message-ID: <27382104-14f0-4721-8d76-03fe9f2c1ba5@linaro.org>
Date: Fri, 16 Oct 2026 12:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/4] phy: qcom-mipi-csi2: Rename the D-PHY init
 sequence
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <0mIVMmu2iTCn5IeBYzGgIAH1kG2MFMNadT3axJ3D5fX-n2f-sXxmZeicphrhRwRt4YUTZBY-4uEATZz7IiQEGQ==@protonmail.internalid>
 <20261016-x1e-cphy-rfc-v2-3-377654253193@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-x1e-cphy-rfc-v2-3-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 11:57, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The init sequence and its size describe the D-PHY mode only. Call them
> dphy_init_seq and dphy_lane_array_size, so that a C-PHY sequence can sit
> next to them under matching names.
> 
> No functional change.
> 
> Suggested-by: Bryan O'Donoghue <bod@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 8 ++++----
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98..b2d4ec3e8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -246,8 +246,8 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
>   				     u8 settle_cnt)
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> -	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
> -	int i, array_size = regs->lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *r = regs->dphy_init_seq;
> +	int i, array_size = regs->dphy_lane_array_size;
>   	u32 val;
> 
>   	for (i = 0; i < array_size; i++, r++) {
> @@ -372,8 +372,8 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
>   const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>   	.reg_info = {
> -		.init_seq = lane_regs_x1e80100,
> -		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.dphy_init_seq = lane_regs_x1e80100,
> +		.dphy_lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>   		.common_regs_offset = 0x1000,
>   	},
>   	.supply_names = (const char **)x1e_supplies,
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 7e55ae007..0d6031a4d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -48,8 +48,8 @@ struct mipi_csi2phy_lane_regs {
>   };
> 
>   struct mipi_csi2phy_device_regs {
> -	const struct mipi_csi2phy_lane_regs *init_seq;
> -	const int lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *dphy_init_seq;
> +	const int dphy_lane_array_size;
>   	const u32 common_regs_offset;
>   };
> 
> 
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
