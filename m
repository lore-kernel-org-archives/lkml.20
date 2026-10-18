Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AFB3DAADB;
	Sun, 18 Oct 2026 23:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.42.129.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792366202; cv=none; b=Ge+B7PTzUbRPQFNNIc6jJ1gFkmNhESYpCHro9v8z+99kuegreEQ7RrqZ1Xo0M11MXzQji2JAg/MbY6jdM2nAJP118ZubGDvARiXBBipHjJKIyINJcaijwuKHcy7BKLvfl5ntRXQvoBeG2k7fTo+mDTtzGAQbdVVXmhMa9hLt4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792366202; c=relaxed/simple;
	bh=sAvbJTRu8ZSxB5bP58kEDYXqHsPZPLiCqrS9+gn/c4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yk55hPwEehGayV0h8h5NRJpGzcXfuBptXUnl/xzGTqYXHj8hoaUbTRBPFxbCJd62nBn+tqrWIZuQNqfkJ3mYkwhtDED99xRADCX97mA5BKY/5/UIbiMDTTJNMKgVRE9CovHyZAcNRW54aZs1012glnZq99GUyH2fkR93fPbUTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=XMIr6sOp; arc=none smtp.client-ip=84.42.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="XMIr6sOp"
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 7D3D55340428;
	Mon, 19 Oct 2026 01:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1792366194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cxv9peWI8l26Jzq3BiiH6v311pkQdBeWOmm4lBs4J/Q=;
	b=XMIr6sOpJebZ8drvpfLngwyVq+yCTExaENQKbETSYI/d+aEldmwEJxaQycNQN5xZQ8Ud7F
	irj/ZsNYmP6OQUm/56fSwQBx7u5ovKkm3N9Co1up2gJw60lNPWA4OYRofgEOC8PVxkHk2c
	gPJJJQ89VAiir90eG3Ycf18+r8CsZGo=
Message-ID: <391498ea-51f1-4390-b84a-d0d738ec409d@ixit.cz>
Date: Mon, 19 Oct 2026 01:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
 <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/09/2026 16:22, Bryan O'Donoghue wrote:
> On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Add a port backend for the first generation of the Qualcomm PMIC Type-C
>> block, found on PM660 and PMI8998.
>>
>> On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
>> (base 0x1300) instead of the standalone Type-C peripheral used by
>> PM8150B and later PMICs. All Type-C events (CC state change,
>> tCCDebounce done, VBUS change and error) are signalled through a single
>> aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
>> to find out what changed. The PD PHY is register compatible with PM8150B
>> and is reused as is.
>>
>> Differences to the PM8150B backend:
>>   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
>>     instead of using a software debounce.
>>   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
>>     requests are advertised as 1.5A.
>>   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
>>     is applied on every power role change.
>>
>> VBUS sourcing is optional and only used when the connector provides
>> a vbus-supply, as the charger doesn't expose a VBUS regulator yet.
>>
>> Assisted-by: LLM
>> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/usb/typec/tcpm/qcom/Makefile               |   1 +
>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   9 +
>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c    | 605 +++++++++++++++++++++
>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h    |  15 +
>>   4 files changed, 630 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/qcom/Makefile b/drivers/usb/typec/tcpm/ 
>> qcom/Makefile
>> index cc23042b94878..b8b9350184c19 100644
>> --- a/drivers/usb/typec/tcpm/qcom/Makefile
>> +++ b/drivers/usb/typec/tcpm/qcom/Makefile
>> @@ -1,7 +1,8 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   #
>>   obj-$(CONFIG_TYPEC_QCOM_PMIC)        += qcom_pmic_tcpm.o
>>   qcom_pmic_tcpm-y            += qcom_pmic_typec.o \
>>                          qcom_pmic_typec_port.o \
>> +                       qcom_pmic_typec_port_gen1.o \
>>                          qcom_pmic_typec_pdphy.o \
>>                          qcom_pmic_typec_pdphy_stub.o \
>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/ 
>> typec/tcpm/qcom/qcom_pmic_typec.c
>> index 41aaae6bb3724..ea1d5b0927436 100644
>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> @@ -12,16 +12,17 @@
>>   #include <linux/slab.h>
>>   #include <linux/usb/tcpm.h>
>>   #include <drm/bridge/aux-bridge.h>
>>   #include "qcom_pmic_typec.h"
>>   #include "qcom_pmic_typec_pdphy.h"
>>   #include "qcom_pmic_typec_port.h"
>> +#include "qcom_pmic_typec_port_gen1.h"
>>   typedef int (*pmic_typec_port_probe_fn)(struct platform_device *pdev,
>>                       struct pmic_typec *tcpm,
>>                       const struct pmic_typec_port_resources *res,
>>                       struct regmap *regmap, u32 base);
>>   struct pmic_typec_resources {
>>       const struct pmic_typec_pdphy_resources    *pdphy_res;
>> @@ -134,31 +135,39 @@ static void qcom_pmic_typec_remove(struct 
>> platform_device *pdev)
>>       struct pmic_typec *tcpm = platform_get_drvdata(pdev);
>>       tcpm->pdphy_stop(tcpm);
>>       tcpm->port_stop(tcpm);
>>       tcpm_unregister_port(tcpm->tcpm_port);
>>       fwnode_handle_put(tcpm->tcpc.fwnode);
>>   }
>> +static const struct pmic_typec_resources gen1_typec_res = {
>> +    .pdphy_res = &pm8150b_pdphy_res,
>> +    .port_res = &gen1_port_res,
>> +    .port_probe = qcom_pmic_typec_gen1_port_probe,
>> +};
>> +
>>   static const struct pmic_typec_resources pm8150b_typec_res = {
>>       .pdphy_res = &pm8150b_pdphy_res,
>>       .port_res = &pm8150b_port_res,
>>       .port_probe = qcom_pmic_typec_port_probe,
>>   };
>>   static const struct pmic_typec_resources pmi632_typec_res = {
>>       /* PD PHY not present */
>>       .port_res = &pm8150b_port_res,
>>       .port_probe = qcom_pmic_typec_port_probe,
>>   };
>>   static const struct of_device_id qcom_pmic_typec_table[] = {
>> +    { .compatible = "qcom,pm660-typec", .data = &gen1_typec_res },
>>       { .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
>>       { .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
>> +    { .compatible = "qcom,pmi8998-typec", .data = &gen1_typec_res },
> 
> I think this should be
> 
>  > +    { .compatible = "qcom,pm660-typec", .data = &pm660_typec_res },
>  >       { .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
>  >       { .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
>  > +    { .compatible = "qcom,pmi8998-typec", .data = &pmi8998_typec_res },
> 
> Since I'm not sure "gen1" is a real thing and besides, I see this gen1/gen2/gen3 
> stuff in CAMSS and it means almost nothing. The silicon version is the salient 
> thing.

Best I can do is GenZ.
But now seriously, I hoped someone from Qualcomm will chime in and tells me how 
is this type-c block generation properly called.

David

[...]
