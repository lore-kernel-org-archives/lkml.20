Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B8351C2D;
	Wed,  2 Sep 2026 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357675; cv=none; b=tazxuo7etsjkFI1ne/mp/aKcVBhdGyQ1Z0VBJCnhUQGNyea5wthmjjteBIZnQzX14qxfbDBis+4dKXRMsVrf3hTdI1BpMJ1xjWAcZsAWdUehgR3RAjhmiyvnkduF7Pbz8rAEXi/sEYn9sMEcdjVdFnTKkRDvCEgrmluT/qaP/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357675; c=relaxed/simple;
	bh=+EcCvnSsS/XG9UpUY63V/TUuUl343Rk+J667CeZF2+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mazzEDHqgTaQbTjAl3aBA97UymdZmEPxmp+sFxUn8Tp7xFZuw8qfTPkZDr+Mz3v5fCAPLXug/lVqXcTSsUC8f8VMnZL8+nxCXr9zw4zTqBv2/GTz+Wx77P8zM1au0QX6T2fjKysnEJLFXgftojZuM6hFBCUF/m/kTFhQaS9b0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=c0vhFCUm; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="c0vhFCUm"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB580116285;
	Wed, 02 Sep 2026 16:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788357666;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UBvLVixT6RLkfZb5JmChiUQYBB/FY97zNKMHPqvta4I=;
	b=c0vhFCUm60JhACOaILD6cYJwpBpRswO/i3lqu56CVr/czbBMgUfZFhRhbswuSBOvFcrnt5
	umsfz3gNoE3y+FnfJ725bec1sYgvHj2t1SqJVD/kdEkf1hGQBn/uqXfm5NDB0KPZbgL/4L
	CTSBib66XoXyCKoCsMikTAIk9LokJgaqTN/1d44C2d1aHp2PQ5eHeXdoNYSoWFifK7bXyk
	bzuIEEq++2YUKG7ID8qeLFFn2yZ9jC3/VeID1XIl++kMZdccFMXY12U0+Q8saPOwPsPkA1
	qcldKnPecGK9avgb+c4COn2TAIRkF/ucNtNpYd2RtxyB3CZnCnlfkasnOhLK5w==
Message-ID: <6ffc69b6-4f93-4799-a369-f71ce9d97530@nabladev.com>
Date: Wed, 2 Sep 2026 15:45:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828150739.174460-1-marex@nabladev.com>
 <20260828150739.174460-2-marex@nabladev.com>
 <4a33230b-3e5a-4132-8467-79b864a91b99@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <4a33230b-3e5a-4132-8467-79b864a91b99@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/2/26 9:52 AM, Fabrice Gasnier wrote:

[...]

>> +static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	u32 mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
>> +		   SYSCFG_USB2PHY2CR_VBUSVALID |
>> +		   SYSCFG_USB2PHY2CR_VBUSVLDEXT;
>> +	u32 val = 0;
>> +	int ret;
>> +
>> +	if (mode == PHY_MODE_USB_HOST) {
>> +		if (submode != USB_ROLE_NONE)
>> +			val = SYSCFG_USB2PHY2CR_VBUSVALID;
>> +	} else if (mode == PHY_MODE_USB_DEVICE) {
>> +		val = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
>> +		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
>> +		if (submode != USB_ROLE_NONE)
>> +			val |= SYSCFG_USB2PHY2CR_VBUSVLDEXT;
>> +		mask |= SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	phy_dev->mode = mode;
> 
> Hello Marek,
> 
> The 'mode' is used typically when exiting low power mode. Should keep
> track of the submode too here. See next comment.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_usb2phy1_init(struct phy *phy)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = stm32_usb2phy_enable(phy_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	phy_dev->is_init = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_usb2phy2_init(struct phy *phy)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = stm32_usb2phy_enable(phy_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (phy_dev->mode != PHY_MODE_INVALID) {
>> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
> 
> This part restores the mode, when existing from low power: Controller
> driver (dwc3) calls phy_init/power_on. The submode should be restored
> too here, instead of USB_ROLE_NONE.
Will do in V5, thanks !
