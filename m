Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3FE370AF1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237758; cv=none; b=ExiJbwmN8xkkpuB+d3CTuC83zRIBQFTN4PsY3APVhpjCYnt4Bq/5SCUPdbPKMSYniiHnNDrOq33Wh4F/BV1YggIPf+h0pSoynuT4X0u2YCUfOB4t5rUg/yFBRhuyh1XqLblb85v0vUn58yYkFrb6EEx8feCKFkRkoTBwqc2x9CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237758; c=relaxed/simple;
	bh=qGjs1Huu8cCVdgoi5mJWDaLieqVwL25J/R+l06Wftdg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cDpDfc+g/dPumafnGBtFW0Dzv0Y/NUNblwgs708zqAhwjtj5BFmJN5CqYCtPNwERhGqfTkKKDQ8mhROgDezoHFC8JDw3P+pMV1aZ4zGdSrwgDFZlkzL0VmCHNj/jb3K4jePww7eVsQ7nOxSEVRx2gMu0gveA8fMJjKGyszP6WLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5pvs1WS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5pvs1WS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so12264105e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790237754; x=1790842554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhGAUy7vdE34BxfY3VoQTAZqEaT6q6J+DpdP4yh+DNw=;
        b=u5pvs1WScdkyjAUCqUUeJlPcZQdEiEnHa0zxizPf+AuypNkTeJ90rqJq0ctNKXOJXa
         RAhy8wbZZ6lK5xrFjKmGjSUFmN3ouSa71DOCHUHmRNMTMk5Wom8gv4PRJATVeajnxlb3
         opfepRmGd8ANdgt+yN+Sc2dE9BBv4st1976bRIWwGVhHiEK3wm+rsw7wwrtHdUw3shDc
         DPw9XBVDgCbbdgt5rVOMW66C0g/TLGCEOHaXZswAwzaKaLyv/P9Y3CBpTJ8lmimpcNxV
         cpvni4UAcQsXmLcW5enmfp94x8PBXcinrIOeW1L35bW5Wf1qoJ03syqihJjpE6f05KAU
         9KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237754; x=1790842554;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhGAUy7vdE34BxfY3VoQTAZqEaT6q6J+DpdP4yh+DNw=;
        b=U7tJD6wTY3baDBAvKbU0dXFULmvb9JuLYsxrUDl6/DqwJo44HKVqjdh6HWL4+z7kUF
         fACTHUbTxme99zwMKee2+nNL0E3OAkSIidm8CiCdoO6ptYZK01EedZOAj+PoMEfuvg0V
         3xp+EX69D/ZZHd5DiaI/C+hK4xcuAFuHkyMd2/Cl4EzwePUqTOKdu/DnclP4wi5wAbSp
         niR9sjK5m/FPZoX7GXGs5YbxKT48DhGIljte0RKdRb4LKHLk5Hv1izG6267xSyKMbJYg
         YD7UouHfbZVhYxIvlEOscTOJKxlFVlAi/CyTQvaN2PtTPSHAlnnHAX4wOrZfnFfVqs9g
         M4xQ==
X-Forwarded-Encrypted: i=1; AKwUvBycP+/zKKLuBZwYe2UiPJxBc0MUBPThT9k98JEy62IazdJBg62JmjAZnJicmqKw8CKH47uPxZ6ftDLlRxE=@vger.kernel.org
X-Gm-Message-State: AFuF++l4oEfUcudbsQ6E4Hf8tEJjdBV/vGcERbA9Qz8rIhxlwYoa+FVz
	Mq7FUDAs6tLFJw9EDi7BZqndSxARhCPuloJzRttebwj2CDdCXYivmtuFQEWLgG1GisI=
X-Gm-Gg: AYBFou0+GiDG/GEBTkGLomeCnzEuj7wZa1lzc98BvcWtK9z4MZTfgaBC1uqQrAOkjrC
	wu0MQK1ipWID3ZxYp3yNoXRrXQrxe8kJzXYLhgA4sPRY7uJuIpO++/X1cVq+ZX9MW55mmInN+uN
	neojk9XwrhwOpVqqTlhGTQi+rLxHW6j2PR7e+Zmzt00o/R4nXF9ES0ZvMUpzt7V4mpcL1qIvR5Y
	nFTx7GzZsO0/cvvuuaSftUuIC0j1Nam4D5KMD9xgMvidRYMEpudx7wwBgNCkwCG16dTDm3PSuUA
	kf81i/mXMdJrRe/M4XBNb6T8KZV7kAJJUutI6ZQhILIOrwCFNVHrfujSvvKTJ5j49nfCZ3jwYV7
	J/m170yj0NAuGCzVM5ytnFj8tDnSWg5Ee9H5oxUcq71zdcxKqjKxyfDYMdikU/GTS9uvA1u7e67
	31asMRgR0QWXNARQSK94C/YXYMyrVx9tg9eLBYAzgP3u6kpRJzNyc5MVPDIr2UqjbFX//L12bEZ
	iV3VkMxP/BRaY6P+8I9YFcIVLKswA2XwpruxQirmSzQsLYEhvUNaw==
X-Received: by 2002:a05:600c:1c0b:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49fe66dfe1amr34111485e9.24.1790237754392;
        Thu, 24 Sep 2026 01:15:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5e86:d153:fdb4:61c0? ([2a01:e0a:106d:1080:5e86:d153:fdb4:61c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a247sm13233295f8f.28.2026.09.24.01.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:15:53 -0700 (PDT)
Message-ID: <e20cd749-4d2a-42bc-ae22-1ba9b3cbd5d4@linaro.org>
Date: Thu, 24 Sep 2026 10:15:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sriram Dash <quic_sriramd@quicinc.com>
References: <20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org>
 <20260831-phy-qcom-snps-femto-v2-8255-v2-2-dc6197ffde1b@kernel.org>
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
In-Reply-To: <20260831-phy-qcom-snps-femto-v2-8255-v2-2-dc6197ffde1b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 11:31, Mattijs Korpershoek wrote:
> From: Sriram Dash <quic_sriramd@quicinc.com>
> 
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
> whereas power domain "transfer" controls clocks and interconnects.
> 
> In this variant, two disjoint sets of resources are modeled against
> the power domain suppliers which can be turned on/off to achieve modeled
> device states. Two modeled low power states d1 and d3 are supported.
> 
> transition: d0 <--> d3  :: both core and transfer suppliers
> transition: d0 <--> d1  :: only transfer supplier
> 
> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 127 ++++++++++++++++++++++++--
>   1 file changed, 118 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 980ad1fb1e2e..9fdf7ae681b6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -12,6 +12,7 @@
>   #include <linux/of.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/reset.h>
> @@ -95,6 +96,7 @@ struct override_param_map {
>   	u8 table_size;
>   	u8 reg_offset;
>   	u8 param_mask;
> +	bool fw_managed;
>   };
>   
>   struct phy_override_seq {
> @@ -121,6 +123,7 @@ struct phy_override_seq {
>    * @phy_initialized: if PHY has been initialized correctly
>    * @mode: contains the current mode the PHY is in
>    * @update_seq_cfg: tuning parameters for phy init
> + * @pd_list: list of power domains associated with the device
>    */
>   struct qcom_snps_hsphy {
>   	struct device *dev;
> @@ -136,8 +139,81 @@ struct qcom_snps_hsphy {
>   	bool phy_initialized;
>   	enum phy_mode mode;
>   	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
> +
> +	struct dev_pm_domain_list *pd_list;
>   };
>   
> +static void qcom_snps_domain_detach(void *data)
> +{
> +	struct qcom_snps_hsphy *hsphy = data;
> +
> +	dev_pm_domain_detach_list(hsphy->pd_list);
> +}
> +
> +static int qcom_snps_domain_attach(struct qcom_snps_hsphy *hsphy)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_flags       = PD_FLAG_NO_DEV_LINK,
> +		.pd_names       = (const char*[]) { "core", "transfer" },
> +		.num_pd_names   = 2,
> +	};
> +	struct device *dev = hsphy->dev;
> +	int ret;
> +
> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "domain attach failed\n");
> +
> +	return 0;
> +}
> +
> +/* d3_to_d0 transition by turning on all the suppliers */
> +static int qcom_snps_d3_to_d0(struct qcom_snps_hsphy *hsphy)
> +{
> +	int ret;
> +
> +	if (!hsphy->pd_list)
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[0]);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
> +	if (ret)
> +		pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
> +
> +	return ret;
> +}
> +
> +/* d0_to_d3 transition by turning off all the suppliers */
> +static void qcom_snps_d0_to_d3(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (!hsphy->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
> +}
> +
> +/* d1_to_d0 transition by turning on the 'transfer' supplier */
> +static int qcom_snps_d1_to_d0(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (!hsphy->pd_list)
> +		return 0;
> +
> +	return pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
> +}
> +
> +/* d0_to_d1 transition by turning off the 'transfer' supplier */
> +static void qcom_snps_d0_to_d1(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (!hsphy->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
> +}
> +
>   static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
>   {
>   	struct device *dev = hsphy->dev;
> @@ -196,6 +272,8 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>   					   0, USB2_AUTO_RESUME);
>   	}
>   
> +	qcom_snps_d0_to_d1(hsphy);
> +
>   	return 0;
>   }
>   
> @@ -203,7 +281,7 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>   {
>   	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
>   
> -	return 0;
> +	return qcom_snps_d1_to_d0(hsphy);
>   }
>   
>   static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
> @@ -316,6 +394,10 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
>   	{ 1310, 0 },
>   };
>   
> +static const struct override_param_map sa8255p_snps_hs_phy = {
> +	.fw_managed = true,
> +};
> +
>   static const struct override_param_map sc7280_snps_7nm_phy[] = {
>   	{
>   		"qcom,hs-disconnect-bp",
> @@ -390,9 +472,15 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>   
>   	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
>   
> +	ret = qcom_snps_d3_to_d0(hsphy);
> +	if (ret < 0) {
> +		dev_err(hsphy->dev, "Failed to transition to d0 state\n");
> +		return ret;
> +	}
> +
>   	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>   	if (ret)
> -		return ret;
> +		goto transition_to_d3;
>   
>   	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
>   	if (ret) {
> @@ -472,6 +560,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>   	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
>   poweroff_phy:
>   	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +transition_to_d3:
> +	qcom_snps_d0_to_d3(hsphy);
>   
>   	return ret;
>   }
> @@ -485,6 +575,8 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>   	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>   	hsphy->phy_initialized = false;
>   
> +	qcom_snps_d0_to_d3(hsphy);
> +
>   	return 0;
>   }
>   
> @@ -496,6 +588,10 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
>   };
>   
>   static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
> +	{
> +		.compatible	= "qcom,sa8255p-usb-hs-phy",
> +		.data		= &sa8255p_snps_hs_phy,
> +	},
>   	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
>   	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
>   	{
> @@ -565,6 +661,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct qcom_snps_hsphy *hsphy;
> +	const struct override_param_map *cfg;
>   	struct phy_provider *phy_provider;
>   	struct phy *generic_phy;
>   	int ret, i;
> @@ -580,14 +677,26 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>   	if (IS_ERR(hsphy->base))
>   		return PTR_ERR(hsphy->base);
>   
> -	ret = qcom_snps_hsphy_clk_init(hsphy);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
> +	cfg = of_device_get_match_data(dev);
> +
> +	if (cfg && cfg->fw_managed) {
> +		ret = qcom_snps_domain_attach(hsphy);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_add_action_or_reset(dev, qcom_snps_domain_detach, hsphy);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = qcom_snps_hsphy_clk_init(hsphy);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to initialize clocks\n");
>   
> -	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -	if (IS_ERR(hsphy->phy_reset)) {
> -		dev_err(dev, "failed to get phy core reset\n");
> -		return PTR_ERR(hsphy->phy_reset);
> +		hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +		if (IS_ERR(hsphy->phy_reset)) {
> +			dev_err(dev, "failed to get phy core reset\n");
> +			return PTR_ERR(hsphy->phy_reset);
> +		}
>   	}
>   
>   	num = ARRAY_SIZE(hsphy->vregs);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
