Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F15C4078FA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273940; cv=none; b=Ttk4LLr8T37dBoi/3CUcxcgfgezpPg28g0KKpRJ+6cAzqUesEqJ1PbcnHfy6n1XuRTzNT2vrPxRnOxL4d1AL0RZT80DwomHNeYniRInuc8F+uJt0MoTnZB5B6JuBeSp3/XqPuO4e+7SO7qm+Zuazzd3J03tP6ZEeWrPH2EnKwjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273940; c=relaxed/simple;
	bh=fKQMBvYKulAxw8GGhm1+J27XYbV4eVyJyPhTEapLLdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkAWhLl3Td41CvunJqmiOFtC6+0Gg7dG+V1MDdahTVDzjL51JztSfkofb4PTLpXEz3aFQZrQ57e6Ya/dlS/3YCl//xphsWIziTmuwrxFeYGyBJnkHH3ZaOEAd3M2JRTGXYNT4cFcF4uE0R85Cy/5I0/bvxt7S5AY1hov/R3slAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1nd2NDD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1nd2NDD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843750de83so616355f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788273932; x=1788878732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMkyp7j0GDArFH/6epwRcq8HmCIf0xcPQczhEQvkqh8=;
        b=j1nd2NDD5G+EDFnxRLLslgTT6tozRSJrPs+fgr6AEj711o1cn1ZxkSLi/wcWUc2tag
         QF98F/5x/0olme4i9+loNs3J2QNhJBBJuooGGwIasWnRqX67EedM+YkSRP5KoHUKNezm
         /CFPqGmnDBEyYHCTc3/oo0uIFqx9+2o11PZDzwX0ztBxYf0XPP6jDOfJMpGJ/1h1YrE8
         QQvkIjcX2/8Wg51eEepGeUAdM7jPvfuvSoB1hT1pFkUXJQ7h9YhTfWTyoGd080naV7dr
         8Kz1IymcTaRzQjc45kmJQUW/PYgF7qIw1JxQYnRj5Fp5MIDaNl5BB3ViVJPyp6amuqH4
         QtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273932; x=1788878732;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cMkyp7j0GDArFH/6epwRcq8HmCIf0xcPQczhEQvkqh8=;
        b=rwVYcKcKp3jBMznTOXm+Ph7SkGS7uZUGFjcveoBT3AMSJ115M0DzHq/uzXypF5bSTH
         TKNrHXJ0nhjRoQmMmhYRNF2znXbtu8cGtTheWNdqXXtKpTwPpoLhmQOWC9JUlsiJ0sTo
         DsfTkvnDGZNA7Zx3udin/y1vcpdarTfuM/Pg40wY2C8Ak18SsTqXb2gKlExvgCeT2tWV
         +XoYjEdFeScTp16OL9blpLJLxqYa1WmN0I6LR98BtGt/FKZEtr7Zxf334Cr5SU6i6rOA
         Kz8ZbKkP25eIgZIxTR4wvXcKEultrhL7t167ms/BEs50VIjPVsL1Ug2iBkXMX08kBNau
         ZpkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiVr0rR8jc5qUMkt4DfNnXU0kJHiADskQ+8sqpWJS8zxOZJ9mo3Ggt+yW8UXrYaPrXMJzc7WSWsooPSE8=@vger.kernel.org
X-Gm-Message-State: AFuF++nDHI9ZtaQXvCLi1t0524pB+DFpKOX+FyfQ2uvrU/0acFk+ipKI
	UTX4LHWJMtsLCCqtXo9/ObUShP1D0xO/lzf65h38spN/GpgpATv2/aOBKRbMyavIJ/4=
X-Gm-Gg: AYBFou1ixaiZ6ANADEapItO1C/JfTD5QwxQuSWhuop2UAKGcy9qXLpcGnIowM0kKJHo
	k5Riir3VqTpuYM8yHZikK+rBxddixMvy+w4Z/zx8LQgrVBRPovh5dkaatAV+NL3Pe8gbmry2aaW
	wnwmVDleLjJ3qCfLUGP95YBz7IYX5jT1yp8IAI/r6iFmh3qVC45HFiXxtaFUqNzfXqkiWt+lzuj
	oHTp5tNryuma3oAzGqxFZtS8mEVYkumQSbbHiLsi4pxKfcYjicZJESdQaqkXtYrnpJ6xGjD2INe
	SsFdTR9gEB2sHKeGGyC2Xc1t3WuafI6XNxxbWrTeJRkHhLMGXYoY92tnHDwMsWVn95pzbyjivlL
	RM9VOg8m1beOHuVP3XRDn9C0YjRQvd0fR0k24HgxVLGFWQNYh8jBE36QSNYoeFbbrdPQhYVdAQL
	Sh9ZMWF0cegB7qWxtXfbyPG6y5zmcKi15uOiVKxaOga3lhqiv55Q2ekeQjB8YLA+qH8pKmpjbqs
	3ZuGZsIvWoP9GWD+xVCF/sVXzan2jeJLMh5S1w4/ZQ=
X-Received: by 2002:a05:6000:64a:b0:484:3621:6341 with SMTP id ffacd0b85a97d-48441011660mr15993949f8f.15.1788273932264;
        Tue, 01 Sep 2026 07:45:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3b72:e9ec:2552:5b90? ([2a01:e0a:106d:1080:3b72:e9ec:2552:5b90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d37111sm5175659f8f.5.2026.09.01.07.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:45:31 -0700 (PDT)
Message-ID: <5b10cb13-77e6-4754-a885-92c873866ef4@linaro.org>
Date: Tue, 1 Sep 2026 16:45:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/6] wifi: ath11k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 qiang.yu@oss.qualcomm.com, Miaoqing Pan <quic_miaoqing@quicinc.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/19/26 15:25, Krishna Chaitanya Chundru wrote:
> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> Add support for MHI bandwidth scaling, which will reduce power consumption
> if WLAN operates with lower bandwidth. This feature is only enabled for
> QCA6390.
> 
> Bandwidth scaling is initiated by the endpoint firmware based upon the
> bandwidth requirements, if there is high bandwidth data endpoint requests
> for higher data rates or if there is less bandwidth they request for lower
> data rates to reduce power. Endpoint initiates this through MHI protocol.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Somehow unrelated, but I added this to the ath12k to test on an WCN785x and I just
got a single event to set the speed to 5GT/s and no further event whatever the state
of the Wireless link is.

Is there anything required on the ath12k side to allow lowering the speed to 2.5GT/s ?

Thanks,
Neil

> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 38 +++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index a6c9ff112c68..9bff4c4bca3b 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -20,6 +20,7 @@
>   #define MHI_TIMEOUT_DEFAULT_MS	20000
>   #define RDDM_DUMP_SIZE	0x420000
>   #define MHI_CB_INVALID	0xff
> +#define MHI_BW_SCALE_CHAN_DB 126
>   
>   static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
>   	{
> @@ -71,6 +72,17 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
>   		.client_managed = false,
>   		.offload_channel = false,
>   	},
> +	{
> +		.num_elements = 8,
> +		.irq_moderation_ms = 0,
> +		.irq = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_BW_SCALE,
> +		.priority = 2,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
>   };
>   
>   static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
> @@ -311,6 +323,30 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
>   	writel(val, addr);
>   }
>   
> +static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller *mhi_cntrl,
> +					   enum mhi_er_data_type type)
> +{
> +	if (type == MHI_ER_BW_SCALE)
> +		return MHI_BW_SCALE_CHAN_DB;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
> +				  struct mhi_link_info *link_info)
> +{
> +	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
> +	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
> +	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
> +	struct pci_dev *pdev;
> +
> +	pdev = pci_upstream_bridge(pci_dev);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	return pcie_set_target_speed(pdev, speed, true);
> +}
> +
>   static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
>   {
>   	struct device_node *np;
> @@ -387,6 +423,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>   	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>   	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>   	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
> +	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
> +	mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
>   
>   	switch (ab->hw_rev) {
>   	case ATH11K_HW_QCN9074_HW10:
> 

