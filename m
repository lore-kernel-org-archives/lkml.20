Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292C4334AD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142791; cv=none; b=oT2dK506vcFYsVvXIyX8wuN7Y53bdhaUQALzjfgGQ9JUYw0Q6I2bM5EDmh9IqBF5pln/Cnm2F2+bFchCVLcv7jUG+0xWBrbvtb2MUVy7Q9ptH29QFQkFhMa2pofIbN16ohhIU5lD74oaHkF4mYpKAPz3wVZMshUyCJraj0tLv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142791; c=relaxed/simple;
	bh=sdTFEiwdKBdmLGPDrLxGYW/wYoC7r+tG6zp8sSE5yS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrMMOIdfeNSojxa9SpE2ypJaC8qf9Wf1F4URxOHjDCL6Oci/yNjI4B50GbdbvG88Bxj0HHjjyAZZwYoRFdlTIQoHcqYK5mDkXoQjlc9ICJ8NzBecgSdbdaM/n4QPMkJXc3rGoGQ4BgKLGnqnb54k6qqM1RDUD296DhN5vt5k2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qm/nLYLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw7IOW22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qm/nLYLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw7IOW22"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iI9f2247138
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=; b=Qm/nLYLPOzPVqxzO
	OsePaFUAwjDa3uUoWzh35323Zjb+087nMe61H+Xhh00oaU91ndd4JBfJnBEA3BFq
	rDKs/XnC5DXtgYnd8qFkrEJgmCh6xUSW8M6NgtIeWL0XaThyPe/We5iqoq/Crs23
	zVu18YaZ9InCcmaXHd5posygTTWYdaq5jNa284MugjoD/6i3VMlTjdBMK0m2kX5t
	EAgZzgka3gLC4XEAYyhQ/fLMQKQeuZFuafAdOpz2d8htuGXFJzIbvfTrCnJ2Yoku
	UrjTaoLH5AHV54RjmeWduzxnuhZYCt/FChgj1WX5C0NKIdS8SXb/Cvnq/FwRT6HN
	DbOk4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw29jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:53:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bee712354so662805eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790142789; x=1790747589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=;
        b=iw7IOW22+R/VfWka7D8eGxIh0Q2qahFS422Sw4npEE1FPlRV+Bkp9F/myXUa4jzcw6
         ogT6yJzjvf3T48kMiura+GUBVmpOTOJl1LwtUhRMguVNVrVb1MGRPjdwk6CalkSY5q6m
         FfbodRR5ODlKEI0Eng/nr2Vqnw7Kh4P2pIeC5Mm8dWlwSyjSX2phmQqJ2Ly+g6AZbYG9
         70ks/EjXL6BnPwnanrGceIiP4Ebtr47k6TaMfIkWtpw9mcm6CC+KKlKwo7OnZe0jJUmA
         6J1U68esIK8gj4athNvdP0z+rdfdH1DPI0xifVL+UWKmKCaVHqLbt3dmYE/ZatKHHN+5
         fvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142789; x=1790747589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=;
        b=RpuwXYePAbPxBDDQGJTND2RCe+gCsZv4nxCsgtDWNquBcu4WNmtgIM7IFLT1QHeIYp
         dXzvkRnP2zPDpD6ebE0+O0qE3PNni+4dtniQgnsd+r592TNopIf0GJ2TIjvVlHYprtqR
         wQEG0DPoUR8uOVhHqCj6HuMo2lgduKCD/I7DNbrTQOdnII097HyiBXXHDG9viNvZLUW/
         +JOWK24bcvjHVlQvQupxy/ldblWNacaXfU82su0p+DJGtTO8Y0YruFAOGrC0UWUXZoL9
         fshH5Te4vlzDJXWMzFgU1bzQMP59RmUHmCO4iHS4TUhEjRXMf5aLlC9WUPxk3WpNksD9
         cZ7A==
X-Gm-Message-State: AFuF++kcMeH9bzIEDZQHxPtxwPRHw+VAoxc66xvb3M5elqB//R/tX6tT
	rNEtBMa/itwAFQ0Wv/FF/6BN6NeALdUR/q8sPlg2iEe/ckTapGnuMepajud7OTYKZNGba/+8h9g
	E5GRisgLW4yvTts/CHPiCCi5kpeoS8qKjRpZ1VNiQoL+snN1ZhwRwk37KAsYaeSMrS3Q=
X-Gm-Gg: AYBFou03/69ZcE8GsaqMkXhVARUjOQMWrvKm5uyOJmlZvUqcG8KBAvFpCueMX4xRMOW
	suBAyWgHibd/2roAMwcGfhe9968xrtgddqVpKZ3Gs36vtpnvVFr2DHLAQB9seJ3ucsW/GTaKX4O
	UAyZIINUyuzevku9H7kUWHuBhsmAEOZnWh/4mkDEVQVLBuT+IV2jeLvaE/S93OenMGSb/cGjsCz
	h/c08ARja41jdNtHn23vNwBeHPMaJlSCm/Q+2+SMwdZdAi3BYNSs+3JXwaN3reLzHaZh2Y03af7
	6sCUv+xmIyhJ5jfcbHrayNmw8s/L4xTyl39eujC7NW7eT/uTlBU6lqEIR7k/SjqwBdYXlUZ6Ps3
	XUsuiH2WXHiCjPbR939BDl+OMqvs5KG1CuClvnyxme56MN5bItggEKCzTyDpqYxYA0/M=
X-Received: by 2002:a05:7301:6187:10b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-33ec164b694mr1044437eec.3.1790142788775;
        Tue, 22 Sep 2026 22:53:08 -0700 (PDT)
X-Received: by 2002:a05:7301:6187:10b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-33ec164b694mr1044401eec.3.1790142788212;
        Tue, 22 Sep 2026 22:53:08 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm3611698eec.28.2026.09.22.22.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:53:07 -0700 (PDT)
Message-ID: <6eacce65-5636-413f-8213-10910f3a7ee8@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:23:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel@collabora.com, Igor Paunovic <royalnet026@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfX3n3kHqfgcH9t
 ady5DJOrmjaXGA+HKkPuc6cvyMhPTUOmIohE22dBBfmp0m4rHZnmclGCPZOria0wX6KdHhkNA7k
 b5sKDasDYD3i8x3lNVJbZXIO1Bn76Cvjsl9tZE2zDmijHbjoAsgzk4HPaNj39WiM6UHiYoMeYjb
 hGsaEiIlXZQ6LpNAo8+nDpdcMxlX0kinVcZX3Zb6r2z77Nb7iO+oWcxBHs4AeCZy1I21O8OoDUR
 Fap0WDLD/6iq5rGJ9D0G9Fbt/385hUZoxgE+KmnM2loNRVYsxwCYM5y7dClc5n7LsBvFSmpOW3V
 YfjtS3rihNUqxigz+hg1qmMj4pqTpzinf6yIV5JHIQXig6EOvsKNUkKSRWg+G/C+gxyQZAycYQT
 nFwjUc7WSf9bTSzJsJh3vK9QA7hlH0zflGbC4FqaCqgIexwqUHQVp0bwUTVisp/uHjDJHM6b/qk
 8RXlNsdc1iZ3cgbdSuw==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab36945 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=J57iu7YKHINu3dHgQOYA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 3MBZ9ni3JWivoJkuH-Y1sE-W_20cIaI9
X-Proofpoint-ORIG-GUID: 3MBZ9ni3JWivoJkuH-Y1sE-W_20cIaI9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfXx9HFjsVWhpue
 6kXITf5+5zHDAwcNuPsnH7d11aLxDtYAhUXQFMYaGhseo75QQ6GAlEg9bK/Wsnq7xeWJwj/d6/H
 vqF6u0/yTBw1FUDpV6NVZmy6EYzIjFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230023



On 9/15/2026 8:47 PM, Sebastian Reichel wrote:
> Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
> For now this handles things identical to the default glue.
> 

[...]

> @@ -2448,11 +2448,26 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>   }
>   EXPORT_SYMBOL_GPL(dwc3_core_probe);
>   
> +/*
> + * List of compatibles, which have "synopsys,dwc3" as a fallback
> + * compatible, but have a vendor specific glue driver that should
> + * be used instead of this one.
> + */
> +static const char *const dwc3_compatible_blocklist[] = {
> +	"rockchip,rk3588-dwc3",
> +	"rockchip,rk3576-dwc3",
> +};
> +
>   static int dwc3_probe(struct platform_device *pdev)
>   {
>   	struct dwc3_probe_data probe_data = {};
>   	struct resource *res;
>   	struct dwc3 *dwc;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
> +		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
> +			return -ENODEV;
>   

Would it be better to split this patch into two ? I see core changes are 
independent of addition of the new driver.

Regards,
Krishna,

>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
> new file mode 100644
> index 000000000000..62f2a03b08a2
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2026, Collabora Ltd. */
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include "glue.h"
> +
> +struct dwc3_rockchip {
> +	struct dwc3		dwc;
> +};
> +
> +static int dwc3_rockchip_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_probe_data probe_data = {};
> +	struct resource *res;
> +	struct dwc3_rockchip *dwc_rk;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	dwc_rk = devm_kzalloc(&pdev->dev, sizeof(*dwc_rk), GFP_KERNEL);
> +	if (!dwc_rk)
> +		return -ENOMEM;
> +
> +	dwc_rk->dwc.dev = &pdev->dev;
> +	dwc_rk->dwc.glue_ops = NULL;
> +
> +	probe_data.dwc = &dwc_rk->dwc;
> +	probe_data.res = res;
> +	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> +
> +	return dwc3_core_probe(&probe_data);
> +}
> +
> +static void dwc3_rockchip_remove(struct platform_device *pdev)
> +{
> +	dwc3_core_remove(platform_get_drvdata(pdev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_runtime_suspend(struct device *dev)
> +{
> +	return dwc3_runtime_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_runtime_resume(struct device *dev)
> +{
> +	return dwc3_runtime_resume(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_runtime_idle(struct device *dev)
> +{
> +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_suspend(struct device *dev)
> +{
> +	return dwc3_pm_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_resume(struct device *dev)
> +{
> +	return dwc3_pm_resume(dev_get_drvdata(dev));
> +}
> +
> +static void __maybe_unused dwc3_rockchip_complete(struct device *dev)
> +{
> +	dwc3_pm_complete(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_prepare(struct device *dev)
> +{
> +	return dwc3_pm_prepare(dev_get_drvdata(dev));
> +}
> +
> +static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
> +	SET_RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runtime_resume,
> +			   dwc3_rockchip_runtime_idle)
> +	.complete = pm_sleep_ptr(dwc3_rockchip_complete),
> +	.prepare = pm_sleep_ptr(dwc3_rockchip_prepare),
> +};
> +
> +static const struct of_device_id dwc3_rockchip_of_match[] = {
> +	{ .compatible = "rockchip,rk3588-dwc3" },
> +	{ .compatible = "rockchip,rk3576-dwc3" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_rockchip_of_match);
> +
> +static struct platform_driver dwc3_rockchip_driver = {
> +	.probe		= dwc3_rockchip_probe,
> +	.remove		= dwc3_rockchip_remove,
> +	.driver		= {
> +		.name	= "dwc3-rockchip",
> +		.pm	= pm_ptr(&dwc3_rockchip_dev_pm_ops),
> +		.of_match_table	= dwc3_rockchip_of_match,
> +	},
> +};
> +
> +module_platform_driver(dwc3_rockchip_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare DWC3 Rockchip Glue Driver");
> 

