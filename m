Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800664;
	b=ZleA5RuS2adOYMHAJFqCBw5VyvTA/IoWroR8kElbrFsjsPrxErs4qN7LMic5+cPn4yIK
	 mBaLl/8LTek8CQryE14Xk2qc1wBk21H4ZtWyFl539ME692ow9Y5Wxg6BhIhJDIRxp1Ck6
	 mO9AVbx570Xlt3lJh/OvYKwYrWTxWErzlIEKtO+Vbh0clvdytKBcYXYfUvT4JlL28EsAZ
	 MU7HWdY8pWdu33Brx87AA/TCkjAPN7S5oskIBjziW2ox6Yd3x5INRnS05Vngk5ATMH7tP
	 Sqa1XBZKcCQjiVDGCdB4d/gTtb5wFSHM1YXGqWH0GwN5xAGikJEe+8+FFlVy5LmWPVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
	b=2xpO8v1EcMGmEqJQtKJD4Pu1QW03nP5f7e0wGL8nSWYyBuPG1A5z6/0g0/ZZADh0PgN9
	 qNjNXdqauPczM2BqDJcFaCEeaMH9phaFjbizCcI7bvU1uA0NAp+WC5jVL/VDDBOOOPjCy
	 LR27sHtbcg/5/z8QOK4RsNcFcaurIB3ntJFZOTHXxjI5U8DIiMbOhLFjd3fxqHsBp7i2L
	 xthErrvGJrdiaWzuTJn8qSDOwFrcRA6xr/FmtoPV/QhThlsPobB781Gtx25hbAfLhXfFh
	 tGedFAQsDdsojgZavaVhog3v7MOXTxbL+XDzom72UhZfe5H/t6XQiFmFijrpuQ0A0Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqgyJjOI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKmhtW9w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C85606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqgyJjOI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKmhtW9w
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaBmn2728930
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 13:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=; b=OqgyJjOIOi6iq+fd
	6/3OBwbnpSFHEDMFcK7Im0ACldgSNml8YIy0PJwjZAU1hj2G5fzGu+hHMp8056s7
	Olncqm0L78ev3PsNmS0/XHdwu61jdjOZEfqcqK4/0x6Y+D/hvNGkv30UNI/jO5y4
	8A7QyyMBeSaMmEs2VHEnZQo1rRVCZ6ZepqX8m9SCIEmSfeDBz9UA1ipEZo1x3dG9
	UHkaeWa7OpfFDAWhjEFmCsDrvthSADRAjhDR66qfTf5bH9LgzFQ+qZMryQEH7oPj
	yAH3gkR4bN1RZKuYPffLbDXg9h5kHvAIGCJd8fmRPWy7yukYEcps+E33R/cXv87T
	65Zlew==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbnm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:57:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso2665587eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793800663; x=1794405463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
        b=iKmhtW9wZmHN45O287/KnhiDYIBjv8PNNqn6CK7AKAkJkNN+ycBQZzKEfjz1UC3Vqb
         /2P4ovSauS6AfbvyuwFtEoMhZG25InJ9gQVqe+eZTgO6xlbMmt+YpnbSi6Dc9HjdEBoJ
         OMGrZhP//IJZgbNVsMkfSV4TpZro1rwwF8YflXeeVD2hv5sbWX9NtaQdTlpFNmzkQ9Wv
         VfAsFO2ldbULk7fOJujKPCbwMnhra+YuKLUYHOQlOy8k/bQmX3Eg41UYaztGA28SwVRL
         T/F7OC+0WH5jQxVd1JJ06BmQ/mN4wtb5EXQndPtQf4a1X9luGr9SRDhY/qaWEopHQoKS
         HUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800663; x=1794405463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
        b=SFDX9OgWX3QBHn9ZVITB0y6IaoKWJH14OAwGbHKUr6Wkh++uyJJprnak9ELsYTsn2x
         WNzYUeF2IqtPu3RhKXEG4orK4nlVnd9W6LPhP4Jn4fy5E2+JQcP5NkQsXOl5BFIilr4R
         iCwluuRn+zbG3DFmB0XEPgbzpmobyvq1+go7ige3Cyz5YRGsnvRMV/E1zV8/IA3HB+1e
         mRocG8qTyhCl0Esct+MOZGTAK3DZLJLBKZ5C4B7jdBlJoRJGh5iy8IYgQsgFKfyF0xjg
         Z3a5KK7IEElPbBSxaEKWS4FI7BT89/a5WJH2rxn0jXEzhvbPAkwcOb0u/GECeqKtoI/F
         Os8A==
X-Forwarded-Encrypted: i=1; AKwUvBzDUg8qa3xQB8fwCUrvf0dAWsFcK7up3tQZ0Pfn/2rH5y8zMKgq88an3oe5DFrZlmQ+heDEMulSfL6qT1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H1D/qiqqLp+DdjzrywoRc5A1BswBsvfx2NzSeDR1SKCxoNGCM
	/lJSv/3+RQilxoCWZ7NyZkdsQLtqytUwoxpVrYls3lSY/x7WJhTIGgV2529XfSmVgURbPkO5RQO
	J0jXM13RkiD+MvSfQwGxkUfCWHKEo+dc0SE9gV3RizcJ38HNNykbqiQ6i7fNurwJmzks=
X-Gm-Gg: AYBFou2rONpOeDbgxlNH7zokGtrmxK4aprVY1qm3eDSMIPv7FyzE6cWXeurFr3koOCd
	4bOh4L9JPDVmvXx4WeSAJ3FQmilgRVg8IJe0ZK7VGe27Coefu6GMwjOVMDWo6/De33F66q0ThyB
	qmwRJcaE22li3lntZSC2ft33i1gA1CEEjeYRP1Vc+0laHfUkdNyE1xpneJMytYKeBXWf7L4IYmc
	bcXMoArmjcCNLmgKXAzDOo3CB5sCGT0ot4yq25K6Pih3SvOQl7+MfTlTFRStbfWihQjqPyIJW1f
	vNxpSeUHDROIWbJBJ+pzQ6I1feahyE5Uv9waciZPheExyLeh3c6gObfVUcplXnuxsFxE76wE+Cp
	kr/7kl1TGafaXtQWrSy1aSbchy6cubP+wJ+IsAar9xzFkKrs9jV0kTwkBcaqVehTFuuPqD9HepU
	vZDWfh1BDzd7BxDSEII3KTGHXIobxvXgneRVOeMbE=
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr24419802c88.11.1793800662363;
        Wed, 04 Nov 2026 05:57:42 -0800 (PST)
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr24419767c88.11.1793800661636;
        Wed, 04 Nov 2026 05:57:41 -0800 (PST)
Received: from [192.168.1.2] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm7874697c88.3.2026.11.04.05.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:57:41 -0800 (PST)
Message-ID: <59c79112-0079-42b0-b6c2-d311f20e0dd2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 19:27:32 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
 <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb39d7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X1iYf39TFmsXOEfCDxQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: HN0t_Ve_DYrbZa4ztC40c8kdMx7PCB_2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7TjZ3n99d4rv
 /htiodvDUMXNC4rLhs6zcf8FX6QLHuCSjggHS4GIPat2/gO9iD9Flj/2I61Mmjl5AJAYiE4pIHW
 pNvcond3ucnnU7OLYnA0Ykdtl9OUido=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX0GsOxFxzVL/P
 KXYx+ULW47QEnnjLF4NC2DFt5uWoO3Pxetd9sivjp7fyeCfsRSSGYaPU53ro7x7VKUu1kkMCEJB
 z/p503jPaMV+RZFfDmxqjVGkAb95b7mtI+eIeoB5yJ5/7VRwnF7lvXldyUjZ8DgkLbrfKCifSG5
 XDeU2I5zrAGY8dIJiLHs+WCdg1aVBeAuo17xDrjF0wG5lSA7wQu4Uu8FT8snt4KxZ5htKFfdW2w
 FnEB2GtRAxojrWIxDw28WGB7dJwuWA3E6WOoaWmgJrnL47XbwgAfIKtgZykKsPFihaV3eyyIYpg
 JpQBL052CL0CqWkrLzTcelPHl7z4SiPqmXARlIBG1rS8meCS0y8P9I8iGJ1q+q+OsGosELIY9dG
 RcTBDI4wbdJ49Lg95cmK1yPb9xyhmGH46xwzdq8fRtPXfAQsFMmH8YfUkvifphH+ZOd0Y8UhVDO
 k+X94bPzxdmF/gH+pdw==
X-Proofpoint-GUID: HN0t_Ve_DYrbZa4ztC40c8kdMx7PCB_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055



On 11/3/2026 11:44 AM, Peter Chen wrote:
> The "wakeup-source" property, as described in
> Documentation/devicetree/bindings/power/wakeup-source.txt, only says
> that a device is capable of waking up the system. Whether wakeup is
> actually enabled is a policy decision, and drivers use
> device_may_wakeup() to decide whether to arm the hardware wakeup logic.
> 
> Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
> property is present, so USB wakeup is enabled by default and users who
> do not want USB activity (e.g. connect/disconnect) to wake up the system
> may have to disable it through power/wakeup, otherwise, unexpected wakeup
> may happen.
> 
> Having wakeup enabled by default also costs power. In host mode,
> when device_may_wakeup() is true, system suspend keeps the controller
> and PHYs powered (dwc3_core_exit() is skipped and the genpd is not
> powered off) so that the wakeup interrupts can fire, even on systems
> where USB is never used as a wakeup source and could be fully powered
> off.
> 
> For USB controllers, keep the wakeup option default off and only mark
> the device as wakeup capable, so that the user decides which USB port
> is used as a system wakeup source. Users who need it can enable it with:
> 
>    echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup
> 
> While at it, drop the local wakeup_source variable and use
> device_property_read_bool() like the other property reads in probe.
> 

++cros-qcom-dts-watchers since this is used in chromium userspace and 
modifications might be needed there as well.

Regards,
Krishna,

> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8116dc94c181..1451b5eaccce 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -653,7 +653,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	struct resource		*r;
>   	int			ret;
>   	bool			ignore_pipe_clk;
> -	bool			wakeup_source;
>   
>   	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>   	if (!qcom)
> @@ -757,8 +756,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto remove_core;
>   
> -	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
> -	device_init_wakeup(&pdev->dev, wakeup_source);
> +	if (device_property_read_bool(dev, "wakeup-source"))
> +		device_set_wakeup_capable(dev, true);
>   
>   	qcom->is_suspended = false;
>   

