Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD5C38A718
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018488; cv=none; b=cI/anCYXOlldk+PyKVUnbMo4TWv7h4AWsCyR8pUyXyGi6r+bPP/gtA2X/JG2OQ7F9NJqw4JpwRGTlMwqT+0l7QdZIj4jyQUeIZZa47JQB1NAvyL/l8dHErGdJbvQADHt2FZ91bX4JqBAQTXR4obNwLAUt66iPKTMngPtHszy78A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018488; c=relaxed/simple;
	bh=lQa68HSQB6MjEneq1xa13evrsdFLJRQ6nIBA9huGu2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5AkBLBxcXGq3Y9mny8+fSRxCa6+STJVmsRXxNMRZJaOlfDxaesovF+zT9gtHb96FhWvjbrIWvuWTTqYoJeyhSnEt5cpkula8nLe0+2hpBNNX8et06CHtUMcoYxmF5UxTgrLniN4HPLp58Ac7NbUoqmWBCjv9n0PA5I3be5E9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6GnvZOX; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6GnvZOX"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so91069166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791018484; x=1791623284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2g2VvdGotpSREZ6JBEKnuSUm+BHjQJ7dqfy+OdMa7ww=;
        b=B6GnvZOXDZVn2+mc24zj8awri0mS57OuUZdiXDG9/JtI6+sjq7gHTFPPCA+4n6Fs5X
         V9/o0q7eUYO3UNd6N4R8I+Nbtxd9rjEonrv9Q4c/mWCVOjOq3dAzvieoAK5rL0DsjDSt
         4P3euGVKltxWyNqJPalVUBPrYfOtIE9alrMTQQLiu4ljrIuA0sp0e2x7LuTusUdRR8PQ
         xbDz8w0ZE8cmT3kebQZcPzA5htC/ssbTVv/fR2w7M58zdj02cf9IAHxqW1x73X4oJNKt
         iOzpivS27GLC6Z8VkMQBD0pMTt0HlebPNWrKGdqFL0qAarnIcrN5wtvOhZtq2RCTiHYu
         n2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018484; x=1791623284;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2g2VvdGotpSREZ6JBEKnuSUm+BHjQJ7dqfy+OdMa7ww=;
        b=x+NYwxnLNT1gIJGHe4201W7im0slIRFr97eZBL/QqxvevvjVSwIPrdFy5ZoaOkpVWu
         s8BKSWCwSfFgebvAV6BtXBWvvs2vLRQxkqNA6fm7CskvoOublWxjN6cpkF/bMdsVrvJL
         3/d6yunTuuvu7qm96ddXFbqCfAd6ZjMEXKWasd+sVvpte+r5oHCsmnMnzmvYG9xyNuRS
         NW2BpCCq2b42RoZsasif6D3ncQJQ5x+r3nS8YG2Q3n6lFHTwJO/3E1a2Ev+rK3v3W4YW
         H1o3FHUYPhuM/ALmpLJmNbIwnXunQUmw+zObeGpsFde+kNM1GAApBAP+Q4m9PS/qKIn5
         8R6Q==
X-Forwarded-Encrypted: i=1; AKwUvByryz2bdRKFZc8632g4RGTKz3z4jsXg/RwXhhoiK2myXUgYwMI6DUMEXIiuXCg+7SzCZoXB/rPRwWZ13PA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2SILW5Hi+W30m6PmQ6l1+4Dy6H2HKGwLrru72VLGDfMFBwlty
	x87wwGYABLqF3risYGv5mGsg6H5SxW8oupVV1nAn+/m4xXW8tuzb6kagJZqIVvlp3ok=
X-Gm-Gg: AYBFou2DHCoU0iMZA7NClgM5xx82FB+Tc3kkEsy7yf/png7QiENJrpUsajGaqZ/y/xW
	xcCHWzRRZBb0XAmd0Xy0a9zbZbzhrZVHTsE+28w/wTQ6NQ7GwPdZzLJqOJS0bJlA7WaNH+O+6Co
	Y/r77HLTLaSorqSKd7vJB/ws6256LJh6lX00Q2wNgVtRUv0oMoxN6kGeIo5BmJowc5dGKPfi2Ii
	mJkMrUzXSdW52MRS5V0Z2X5fnCuqrdCa5IBpqf5mgZR6SkziIoaHXlitjgIljS2t0vm4VVBh8At
	A9U0ReKkIe+hnMzv+n0gn6TaT+HuVozD6Z4mP8fr3kuYNAUyltAjoBZbNc4MfvTMA0IeaAqP5WN
	9WpsxSysKfljOL80JOn5d85ANlVRoqxEsFxwYgdRiP0S+RQgfSUcYWCIZlkATYUj4mnBIuu9TF8
	ZKVTAP3Qd9dycg6lFSRcXwtOSveji5mdfY8jiF1PsMX5nihNOMP+7j8w0zwAlWwK3yrGsvKMEM2
	hrbNhMgvB8=
X-Received: by 2002:a17:907:3f1b:b0:c29:f5d8:9c70 with SMTP id a640c23a62f3a-c2e4adfa160mr448166766b.31.1791018484339;
        Sat, 03 Oct 2026 02:08:04 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e71d58da4sm46210666b.7.2026.10.03.02.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:08:03 -0700 (PDT)
Message-ID: <022c47c3-54b1-43a4-9161-1d0acb13b736@linaro.org>
Date: Sat, 3 Oct 2026 10:08:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2026 10:02, Hangxiang Ma wrote:
> The CSI2 PHY common status registers are not at a fixed offset from the
> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
> v2.4.0 parts differ.
> 
> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
> no-functional-change preparation for describing other SoC offsets.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98f9b..8cd331cfb4b3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -19,7 +19,8 @@
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
> +	((offset) + (common_status_offset) + 0x4 * (n))
>   
>   #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
>   
> @@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
>   	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 12));
>   	csi2phy->hw_version = tmp;
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 13));
>   	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 14));
>   	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 15));
>   	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
>   
>   	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
> @@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   		.init_seq = lane_regs_x1e80100,
>   		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>   		.common_regs_offset = 0x1000,
> +		.common_status_offset = 0xb0,
>   	},
>   	.supply_names = (const char **)x1e_supplies,
>   	.num_supplies = ARRAY_SIZE(x1e_supplies),
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 7e55ae007370..d6366f809e51 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
>   	const struct mipi_csi2phy_lane_regs *init_seq;
>   	const int lane_array_size;
>   	const u32 common_regs_offset;
> +	const u32 common_status_offset;
>   };
>   
>   struct mipi_csi2_genpd {
> 

Aren't you using the CSIPHY driver in drivers/phy now ?

So if phy stuff has to change then that change needs to go into drivers/phy

---
bod
