Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09E3264DA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849201; cv=none; b=YhBoE5EcFtSqv3jHhaxDYEhqPCP+OarVqYpkXHQydX6DctJ4JijhumAKx3yRBdHMZRn6NDeHSqrF09QOe+Drqd26gvHyUG0P9v0s4N1dMJAFkyiW/9TGY+naN8XGKWLoS/dO7rM16ckfqM5rntoWyhymmfbfX7M1jGKq+lB7HvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849201; c=relaxed/simple;
	bh=GiSP6QV6mc0s3OiNVyzEWFjgk8ZwlgGcOGH1LCRfE/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eb/JOgtT1Ah/NN1thr7Neifo3N+QWpNto+cgHTCFTxt/DUhf3RmWA/MeW5mVntJ0MxfIoGnzqo8ypfgi0p5v6qUcvq8639gHghNEMhguDpGGemlHWJIybb3RHcKkJ1c9ZMio2z82UfotpVrU+Q+y8NxD5UGkdYjmgY3kSHrB1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0glBXuy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bp9JEI4E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0glBXuy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bp9JEI4E"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RGIMAI707901
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=; b=h0glBXuyQUQRYemm
	DfEe5CHlzurV6Ac3tsRZaFGaqEJpGD5PldYYJ0ygayjFBm0ZRPi3PRQ6yk+WTpkY
	3zzVN1vhXEeXFyL53bker2bbEITkgZCrBR2c5gPkHX1hZVdjt6+RBzjsaifoS/jB
	4MyJmG2O/RhiD0zb/6C/9FCkKM8cVB2ZQic+spJXtg6Y4TSoSmu72trDf4yhHwx4
	ySW0ZFkVdyWT8sOI0w6TV76RL5GPavheA7YfIBYPf0sZECVeknbQ28ybpQZ7LWdt
	67VyS9dUjvFMdPZpsDO6sflvWpTs9t0y/pH7fkXuEL4XWYfR9RWBhiQVhve+hAHu
	aphPXw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0g3my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:46:38 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e99ff505c2so170658a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849198; x=1788453998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=;
        b=bp9JEI4EiuV5kB64KB/bpnqmCyLRs2CJWf7PEOeMVFz9JQ+xr48FPlUsNlDNMV+jD0
         Se3n2FEtadCPzLn/LGqCfgBl0vFbgenTKlEMd37k4bLcOObnYrLuSfmeuiUgZsB0z+FG
         4nwRuro9RavGJqoiItVA4OOJ8AGwx3auOb3L0J4wP69kJFvd5ukjDTUzcCENQzMHcq+4
         IcVjwrU4J5FscTR4GeD12ojOREPIph81LxVVzGs4tdfOOKjmVvzulPv8LLY3MMGPMl2/
         4LX7lZOgdi4QDfAzFGKOsN4ZHV3ejM/2GwQ1r/U7Ost22SrrYPtaMUAeA93BMo99hCqD
         pR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849198; x=1788453998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=;
        b=m/Fiy+KDNK3FC+NQeSqfPb+pGeQ+0Ou4BvixFaLPS9jhpItpuAx7k/ULfDm6F0KrIW
         gMztftlcU69r8UJsBGum5gkEZQyey5NuXQPgmIabOqAZXDOHhUiRDy35HmDIM1h3wr24
         szkacZaX7krp8aKyQgt/uPQKtgOWEAw+pIxQjrJ8LDooLxds0Q5Ngo13W5Q5aDoYvif3
         C1GlGRD3NETAubh6XglSxpDBmZ5D1yPkHYDgft6mpW08xqbNG/ph0EvCya8CkmuZFn4V
         Murwjy0JrtR2brTOnti2q5Ud66RjLE7+YEX8u1u0PVemih41Q8MXYQpgR6XhBZtj2UNX
         6YAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmPe0NwWIN3lYfjoBztsTCIwmXqjWhNyJ6zfuu+4E+/+h0r37Vgdr3o33HkpLlta98K16BBgFiFZur4yw=@vger.kernel.org
X-Gm-Message-State: AFuF++lAlX964Yp4Taq63VQLMzqzDL6RWYZXkFrkEbu8r/5h19z1say/
	Rc4nqYPmjYR5i/QYjzxfxQ6BxWEOjEMFCQKRvLjYcG/4ZNuC+H+6QeTy/SI4lSw9ggn+X6zHInc
	LdZtyz4YvXgcMEU9oEVEeUjVm2YuaVB76Oh5BZ39j9xT3UgdbMN3UN6fgPl8fHIaIvf8=
X-Gm-Gg: AR+sD12GTFYiDDoWGXo8kcdn+/gGDpSzmy9nTTMHkBumFFIFeaVFXbx74Q1jiC5q8ZS
	uOiwbQ3xOHzgJRy1SPIxbYS2w2RwWujXqvGzc9hAm177zUV2X2dZX1QVsyIUs7MLaVV/llnU2eG
	OiTsajFHagzAgvmQLjujWVdH7eKGnZT+XLCJ2QFo69OHsCddNrDvLJOsV99Thf17gG6ncAF69KJ
	Wg2Ak7Op+9mHo55kGjuGAmcAynUYE1WAt322keoh3oqgLIpf+Hzl8A4b3Nwfeb9hUDb9em7xHtb
	Q0IVG/lW8zP1Xj33qGNrw/P67O5Laqmq6+4QzI7O35OGPYe1gBw3YwV11QhjR0JBUuPJfxRoQpq
	5qu1jkOxLf6oB+lBXLLg+0qCBc3BXiGo=
X-Received: by 2002:a05:6830:4494:b0:7f4:d8e0:c392 with SMTP id 46e09a7af769-7f4f21ca005mr792613a34.2.1787849198156;
        Thu, 27 Aug 2026 09:46:38 -0700 (PDT)
X-Received: by 2002:a05:6830:4494:b0:7f4:d8e0:c392 with SMTP id 46e09a7af769-7f4f21ca005mr792519a34.2.1787849197577;
        Thu, 27 Aug 2026 09:46:37 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c81c3cf2sm4497199a34.9.2026.08.27.09.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:46:37 -0700 (PDT)
Message-ID: <789f0ace-585b-40a0-b1ef-2fa0bbbe0ac2@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:16:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
 <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX7CnFR1JQYvjr
 +0ndSoUwTWQ3VqSEqiOjp22SvPLPpaPwcorIB2xyTWDiO4Qr6lYaYWKDqxbrqDMWT7GLCB1ZEOL
 Q3bTBKdkKszcs4HNjq4mULtQEZyYSvTf1gjmTHUg+95COnxu8BM+/l7BS0OCUmLDFKsO3dOy1oU
 jIt4/a8xbIISfv5CrS1ta6UhoqUn3EP+25ryfZhYmYvzyoROTrtMVhJg3HP5sGHGE7fyLSi2WmF
 PQL68T2ZAvIJrNIRqlD1YRT34lqZGUH+g5R+E4JHRs40upk2fllgySTWrbGiFj+kM9EfR67qe9G
 NxoWujfBCVZfkG33Ui7xRIXVb/HB84dhkMuWfq3jHRFsYHANFouYx/SRIzRwtyR2OFp2BbstnYF
 QJEnTemPD0qRV7EWP0FOFfo9TGtBqkMW1gdHB2QHtkqGgN/zTvzEp2fpFLVxoORxQzAop3hIrPB
 rtAhJ448ORUB74Uv+yw==
X-Proofpoint-GUID: wuPFjyJKivv7NpPNC7goHeF2JQjZchcf
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a9069ee cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=isv1MMe3HlJYIrOEQaEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: wuPFjyJKivv7NpPNC7goHeF2JQjZchcf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX+mW23m6UG4Bo
 uybkGuh8p9OqAYMANAo9/pchptdtX3/+RZN0rclocx/pZIpV4DNll8foUD4QZXbSjOjPXHvGy7F
 fOHA3Jc7fl5oUUeSE3zYgjKrJCoNGck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141


On 8/24/2026 1:20 PM, Abel Vesa wrote:
> On 26-08-21 21:39:02, Hardeep Sharma wrote:
>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>> interface through the common pinctrl-msm driver.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm    |  11 +
>>   drivers/pinctrl/qcom/Makefile       |   1 +
>>   drivers/pinctrl/qcom/pinctrl-kuno.c | 801 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 813 insertions(+)
>>
> [...]
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-kuno.c b/drivers/pinctrl/qcom/pinctrl-kuno.c
>> new file mode 100644
>> index 000000000000..f3f8ec3e09de
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-kuno.c
>> @@ -0,0 +1,801 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-msm.h"
> [...]
>
>> +
>> +static const struct pinfunction kuno_functions[] = {
>> +	MSM_GPIO_PIN_FUNCTION(gpio),
>> +	MSM_PIN_FUNCTION(audio_ref_clk),
>> +	MSM_PIN_FUNCTION(coex_uart),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_a),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_cs),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_reset),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_te),
>> +	MSM_PIN_FUNCTION(emac_mdc),
>> +	MSM_PIN_FUNCTION(emac_mdio),
>> +	MSM_PIN_FUNCTION(emac_pps_in),
>> +	MSM_PIN_FUNCTION(emac_ptp_aux),
>> +	MSM_PIN_FUNCTION(emac_ptp_pps),
>> +	MSM_PIN_FUNCTION(gcc_gp1_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp2_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp3_clk),
>> +	MSM_PIN_FUNCTION(mi2s0_data0),
>> +	MSM_PIN_FUNCTION(mi2s0_data1),
>> +	MSM_PIN_FUNCTION(mi2s0_sck),
>> +	MSM_PIN_FUNCTION(mi2s0_ws),
>> +	MSM_PIN_FUNCTION(mi2s1_data0),
>> +	MSM_PIN_FUNCTION(mi2s1_data1),
>> +	MSM_PIN_FUNCTION(mi2s1_sck),
>> +	MSM_PIN_FUNCTION(mi2s1_ws),
>> +	MSM_PIN_FUNCTION(mi2s_mclk),
>> +	MSM_PIN_FUNCTION(nav_gpio),
>> +	MSM_PIN_FUNCTION(pci_e_rst),
>> +	MSM_PIN_FUNCTION(pcie_clkreq_n),
>> +	MSM_PIN_FUNCTION(pll_bist_sync),
>> +	MSM_PIN_FUNCTION(pll_clk_aux),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig0),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig1),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig1_mire),
>> +	MSM_PIN_FUNCTION(qdss_gpio_traceclk),
>> +	MSM_PIN_FUNCTION(qdss_gpio_tracectl),
>> +	MSM_PIN_FUNCTION(qup0_se0),
>> +	MSM_PIN_FUNCTION(qup0_se1),
>> +	MSM_PIN_FUNCTION(qup0_se2),
>> +	MSM_PIN_FUNCTION(qup0_se3_mira),
>> +	MSM_PIN_FUNCTION(qup0_se3_mirb),
>> +	MSM_PIN_FUNCTION(qup0_se4),
>> +	MSM_PIN_FUNCTION(sdc4_clk),
>> +	MSM_PIN_FUNCTION(sdc4_cmd),
>> +	MSM_PIN_FUNCTION(sdc4_data),
>> +	MSM_PIN_FUNCTION(sdc4_tb_trig),
>> +	MSM_PIN_FUNCTION(sgmii_phy_intr),
>> +	MSM_PIN_FUNCTION(spmi_coex_clk),
>> +	MSM_PIN_FUNCTION(spmi_coex_data),
>> +	MSM_PIN_FUNCTION(spmi_vgi_hwevent),
>> +	MSM_PIN_FUNCTION(uim1_clk),
>> +	MSM_PIN_FUNCTION(uim1_data),
>> +	MSM_PIN_FUNCTION(uim1_present),
>> +	MSM_PIN_FUNCTION(uim1_reset),
>> +	MSM_PIN_FUNCTION(usb2phy_ac_en),
>> +};
>> +
>> +/* Every pin is maintained as a single group, and missing or non-existing pin
>> + * would be maintained as dummy group to synchronize pin group index with
>> + * pin descriptor registered with pinctrl core.
>> + * Clients would not be able to request these dummy pin groups.
>> + */
>> +static const struct msm_pingroup kuno_groups[] = {
>> +	[0] = PINGROUP(0, uim1_data, NA, NA, NA, NA, NA, NA, NA, NA),
> We use underscores instead of NA here.
>
> Please compare to the older SoCs in upstream.

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

