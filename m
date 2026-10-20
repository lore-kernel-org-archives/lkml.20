Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501530;
	b=4wZ4cWzFoHBC55CZSNx0j9fKhlCoQise35VRUeDK2XN5Q2jL0WttmZDbZ0UcT5SMyoaK
	 6af4KyF7pOhRxpkL+KLIoKApVbSuY+7n0Wt/uX6d9Ez4pp07LB7JikO8wVqjrkZjz17Af
	 L6gD/n5xBK+0vfsvo+p+dWp5uy5oED9F4FOffpNdGweGTUANAF7FTM6rOJ71+dfEyHNsU
	 Uus4UrTGqIxXxHODtDUbD+hget1g+Hxf9c2VGqw/X+4US8nIxf3ioA47FFBTkGJ8JPA1q
	 qeX0Uilpqvhh2edcYaa9vz1y/jQJXNDK4X82pC0ndwcF+Y6FJr6C7AUtbI0Bsjydrew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501530;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=YDc06yRlsSNlXEmulUrV+Mwea5zL3HsZI3CQkUjyJAw=;
	b=smrln1i7vBzz2g6coSgvY54alQfmsBpcNf13oHnAXMkAWmbRaHhjFcR17tPtipyh4R0D
	 GcTfSNcW1wvzZqUvvCbva5P9pdhhP4mNSNnyuJ6+1sf2jLVC2jPZpXKgq+JBoXopMvun4
	 cpofIAOLEJG5XpBEF53DVymFG6Q5SgixfEXuRwB/BgOIvUCcbFz4YZEMvUw4BAwvuiXeM
	 J7oFz4BybPp28tHpXLHBEOVGCsO9O46BzWfJ0Y28pjUGj+QWu2AMNouiPHSiOhUV4H1mn
	 c/ttX4ZJabTnxdNBpMEqHqFZ0pgYkbPnVe2i4m+BmEqUwlz5vmFdHKBfG8734MTjK9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=myqh4M6I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B883606A31A;
	Tue, 20 Oct 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=myqh4M6I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33321F000C4;
	Tue, 20 Oct 2026 13:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501530;
	bh=YDc06yRlsSNlXEmulUrV+Mwea5zL3HsZI3CQkUjyJAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=myqh4M6IAWFmqgXG16kpxErWnj01CbEjVgU4LBAptO3UADlbU19+sv6x/B9PEc7Cb
	 3jSgOY1ApBSFT+V0uFzp8vLOZZOTiX/r7JyoRKr+ZGHP9ygA8E7K3CZuOR+ycWE4F7
	 zKbY3RaYPCERlVReQav5DTgE9UYK35x5N+9oQ3jjRjOe70WtIFo/8ASpiIvcce6gVb
	 tUkQ59WcDlectF6R7qse4nYQqlrrAVqXBS4h8ATJW5VlrtDbnt24YpY5b8CKbdwbqo
	 oRL5B6DHok1P3BHrNkdtMKx0y6MoRA5Eka8x7ireF5vEFmQNDppxKYmj2FFSCu7T7K
	 q2L//gCDcU27g==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sriram Dash <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v3 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
In-Reply-To: <179216548965.106618.12539639688235621089.b4-reply@b4>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
 <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
 <179216548965.106618.12539639688235621089.b4-reply@b4>
Date: Tue, 20 Oct 2026 15:05:27 +0200
Message-ID: <xhkdbzew834ko.fsf@mkorpers-koolstof.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 16, 2026 at 21:14, Manivannan Sadhasivam <mani@kernel.org> wrote:

> On 2026-10-02 11:41 +0200, Mattijs Korpershoek wrote:
>> From: Sriram Dash <quic_sriramd@quicinc.com>
>> 
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power protocols.
>> 
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power on/off.
>> 
>> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
>> whereas power domain "transfer" controls clocks and interconnects.
>> 
>> In this variant, two disjoint sets of resources are modeled against
>> the power domain suppliers which can be turned on/off to achieve modeled
>> device states. Two modeled low power states d1 and d3 are supported.
>> 
>> transition: d0 <--> d3  :: both core and transfer suppliers
>> transition: d0 <--> d1  :: only transfer supplier
>> 
>> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 127 ++++++++++++++++++++++++--
>>  1 file changed, 118 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
>> index 980ad1fb1e2e..9fdf7ae681b6 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/of.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>>  #include <linux/regmap.h>
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/reset.h>
>> @@ -95,6 +96,7 @@ struct override_param_map {
>>  	u8 table_size;
>>  	u8 reg_offset;
>>  	u8 param_mask;
>> +	bool fw_managed;
>>  };
>>  
>>  struct phy_override_seq {
>> @@ -121,6 +123,7 @@ struct phy_override_seq {
>>   * @phy_initialized: if PHY has been initialized correctly
>>   * @mode: contains the current mode the PHY is in
>>   * @update_seq_cfg: tuning parameters for phy init
>> + * @pd_list: list of power domains associated with the device
>>   */
>>  struct qcom_snps_hsphy {
>>  	struct device *dev;
>> @@ -136,8 +139,81 @@ struct qcom_snps_hsphy {
>>  	bool phy_initialized;
>>  	enum phy_mode mode;
>>  	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
>> +
>> +	struct dev_pm_domain_list *pd_list;
>>  };
>>  
>> +static void qcom_snps_domain_detach(void *data)
>> +{
>> +	struct qcom_snps_hsphy *hsphy = data;
>> +
>> +	dev_pm_domain_detach_list(hsphy->pd_list);
>> +}
>> +
>> +static int qcom_snps_domain_attach(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	struct dev_pm_domain_attach_data pd_data = {
>> +		.pd_flags       = PD_FLAG_NO_DEV_LINK,
>> +		.pd_names       = (const char*[]) { "core", "transfer" },
>> +		.num_pd_names   = 2,
>> +	};
>> +	struct device *dev = hsphy->dev;
>> +	int ret;
>> +
>> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "domain attach failed\n");
>> +
>> +	return 0;
>> +}
>> +
>> +/* d3_to_d0 transition by turning on all the suppliers */
>> +static int qcom_snps_d3_to_d0(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	int ret;
>> +
>> +	if (!hsphy->pd_list)
>> +		return 0;
>> +
>> +	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[0]);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
>> +	if (ret)
>> +		pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
>> +
>> +	return ret;
>> +}
>> +
>> +/* d0_to_d3 transition by turning off all the suppliers */
>> +static void qcom_snps_d0_to_d3(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	if (!hsphy->pd_list)
>> +		return;
>> +
>> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
>> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
>> +}
>> +
>> +/* d1_to_d0 transition by turning on the 'transfer' supplier */
>> +static int qcom_snps_d1_to_d0(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	if (!hsphy->pd_list)
>> +		return 0;
>> +
>> +	return pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
>> +}
>> +
>> +/* d0_to_d1 transition by turning off the 'transfer' supplier */
>> +static void qcom_snps_d0_to_d1(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	if (!hsphy->pd_list)
>> +		return;
>> +
>> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
>> +}
>> +
>>  static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
>>  {
>>  	struct device *dev = hsphy->dev;
>> @@ -196,6 +272,8 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>>  					   0, USB2_AUTO_RESUME);
>>  	}
>>  
>> +	qcom_snps_d0_to_d1(hsphy);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -203,7 +281,7 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>>  {
>>  	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
>>  
>> -	return 0;
>> +	return qcom_snps_d1_to_d0(hsphy);
>>  }
>>  
>>  static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
>> @@ -316,6 +394,10 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
>>  	{ 1310, 0 },
>>  };
>>  
>> +static const struct override_param_map sa8255p_snps_hs_phy = {
>> +	.fw_managed = true,
>> +};
>> +
>>  static const struct override_param_map sc7280_snps_7nm_phy[] = {
>>  	{
>>  		"qcom,hs-disconnect-bp",
>> @@ -390,9 +472,15 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>>  
>>  	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
>>  
>> +	ret = qcom_snps_d3_to_d0(hsphy);
>> +	if (ret < 0) {
>> +		dev_err(hsphy->dev, "Failed to transition to d0 state\n");
>> +		return ret;
>> +	}
>> +
>>  	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>
> Why do you still control regulator natively in the SCMI path?

That's an oversight on my end. Thank you for catching it. I will fix for v4.

>
> - Mani
