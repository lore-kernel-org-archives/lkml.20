Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DBA44781E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434101; cv=none; b=tOILlM+R21XI87gdmOmWGWf2igBTu8HU2wtBqX5MckE50x+5r4Hh4c66L2O/EfePy7Yk/V3o8PFx3okeF1jpmBnKIgOdR18Sl5mOb7EW/VVCz0W4Fn+4CAltiYPLsN/uJi9KoQV4zGOZ/S0oIchQFl4zAVaVXf0abdf9uoFH/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434101; c=relaxed/simple;
	bh=iPCNerosbo4Jfg+IQoZoErtJ5EEDm9uiWHnZRdO1/hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqKRu5Ulj3uxC9jrlGxG+JIo7Oswp3n2KZ3Gls8tHUeMqTwleUkAFz/sOjtKCdcnsT6fAB/FK6CGLaF3bRZvCefc3alAp/eseLLr+jxh9eig/ELYfHe1vTDejcyx/azMGmK6g/5Qo2Qzs7KbVccPVSjGjSZlMciBeTVU5H/3ikA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb9XuRrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGtOr3ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb9XuRrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGtOr3ne"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBrE162772
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lz0OEqSGbW8F7CVDGnfMLcxZ7fyADNJyjt3Y6EUKNBY=; b=lb9XuRrmltfl6Z79
	AA4xBVmMbJ53trlzoA8ZhpUnXj83wUkuEgnL04xypF4ugEBxbdx4jgghjzdJuERT
	B2XBm1SCP7d8A51+SU/RSYhlhXMJNZH3W4O25QA1ZCsS9WRzS+LmKWhtye1xJkH0
	Hl3FeLoKXssQRqYyC2/on1JVFJO6g88E2RH2LPE0eQta3NngYPBgUmCe6rISI1xN
	imcn59H6o2DZJjd0JbrlKLY1g7ca+PzRhGju+V/VaYkTBELa2E6XNGI6iGFjNrOk
	f5hziLodyYWkUNDN6HRSQAcPNpcgN0q8o1B5rpxATeBTGSUlqyL43YxHkKpaYkAu
	FV/u2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx08er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:14:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93771aa0379so607011985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434099; x=1789038899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lz0OEqSGbW8F7CVDGnfMLcxZ7fyADNJyjt3Y6EUKNBY=;
        b=YGtOr3nei0tkRGGCJ+dHPSa9jBHvt4mVQMZnKGGHHAghEiLArZxymQTWw79UM2VPFh
         plLqHa37fK3oD1IeyyPhCj55cLbxS5h36OdrOJiwvJYiKsbR67WPNUEzodUVzaZWZiNY
         ShAFtupTIlV/Ar3z+6MzXP3UKYSxEsWJ8wWyNyDKQ+0DfRtmU75yN5BnrOzxhdevhiZS
         DIMy5PFvCmllVxiV9Jih9QjoSueS1whRW6ZmQmnGUa39ueLpTcVgRVt0fCO8fwap18dX
         /hX4XGcZR/7guR8LqrsOcAiP5avkK4yG5JXxMJQYS9Ox9+szE+gYZNu888Yo+G4b/O/g
         mBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434099; x=1789038899;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lz0OEqSGbW8F7CVDGnfMLcxZ7fyADNJyjt3Y6EUKNBY=;
        b=evIFVTBgwneQwwcCmT+5VWLEboM/wVmNaCFc9qtXtkTDWgtasYIARGkC1z+3PTUnOY
         wbh1aVyorC4IVGg0R6wkfM3YsCKClmQcWBkoKp9nz/b6sHNhBJpWMpC628+CdaZ6t/GQ
         BpQlGWl7ApYm+aLFB//fyAmQYfU6KpNceGPYT0jOH/9h11csY+cxMduWjvwi3yDIRHbE
         Xp7+cjlQCVKiZEwJcTM9p31ioc/sD6xV9ontJSwucDTus/50ghdETiFje+kQa9lc+G6U
         l0MwK9SUpKD5Gkq8KtihlMH9tg4QXuZ7gXnzczEqQva4feYWTLVqyRlPjs795t1Q8uQ1
         Btxg==
X-Forwarded-Encrypted: i=1; AKwUvBzBTDMZzlso50HkE9CJOUuCQ5F9ji1Y8Ic2Sdae+VYdYll4HXBN9Ftyllreszoiha3lwDxFjyn5MFPOtF0=@vger.kernel.org
X-Gm-Message-State: AFuF++momOZehEKWL+OTzDXFAVBWN2ALKTVZW3GpuoJO41EQDAfQIf/T
	uZkBxYl3h2uK0K6r5NhV2ltcaFGc1sKtuRy0B26DMkOXJ/EDDsCohUcPKLYmfsmTZOuQZQRlxpN
	152OpXW1AsDocemPw85fj603bWyZxZxhX13XkzQlrTvFW00uBQJo6hL+9KKkrysse3hU=
X-Gm-Gg: AYBFou0GrkBd9rcEf2P9S+aE3nNclybFgD8hY84FCC87HWMZFwuIpm7RvK1a0g4zt2n
	7uui3RaStUfX2wxhy3O/8llYfSPJWdCVXZjmH3q15dFSQ1MaoGl9wfP5VHvUQDZA+hbSkzf8I40
	DsQGDwW+joI8NkMxTrjT7gZiHH1KvfIqmHOBAByWPtM4haRjeT/Fcdb+yUZ9vpImkDJgYk2SfGA
	w+vYLrsbK6wZBnPcb5CbL5yk/YmLJlYh00ltGn4a7NpKxW7lj2Uio1w9GgVwH08e+iKVRmVHFKm
	GSDuYSNq/C0WEhtlRPryX2DFRI/NMWmaMRFLS++n7r3K6dpD+VOT3OMUASkRkcaD90QddimT3p6
	87U5DQ9xor31kAflYkTxpc+obmT1n
X-Received: by 2002:a05:620a:2682:b0:939:1459:efb2 with SMTP id af79cd13be357-93960ef3c8amr1369313885a.24.1788434098815;
        Thu, 03 Sep 2026 04:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:939:1459:efb2 with SMTP id af79cd13be357-93960ef3c8amr1369305585a.24.1788434098304;
        Thu, 03 Sep 2026 04:14:58 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dadddsm73748635e9.9.2026.09.03.04.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:14:57 -0700 (PDT)
Message-ID: <34a028aa-d17a-4a59-bd1e-26ea784a8401@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:14:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: Fix setting completely bogus rate for byte
 clock
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4VG3uzeNQmWJlWXuRB35FUYJSBG32UgK
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a9956b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rFN8pUq9rjxbytSTOF8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4VG3uzeNQmWJlWXuRB35FUYJSBG32UgK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfX+/y5hBY3RMWD
 jCpLhledf0bmd4tUUQ+ZAvtYkgX8UjXpu0rd0nB69aWLSLvJ5iSgj74XQWFz5R++2GnetxVOCkJ
 0u9CfE5UusS1ZIvdjKm7USBI8Jo33yW5irUYmNwOaoXS0thi3A4jnnJTGWiELGsQlXEpHfmHRy2
 zYJBeGkga+qoFgo+c74qCihEuysqnEn83fpavy1Z2mCrv8KN92t4yGGB7JHyuyO/d3l/dGBI58/
 h8AwmVSfVWpSB4TRnIwdXyJ/pRacYla7/QuI/QmmYjiAyEzahd5Yp2/UOEatWIqTGeLlRnjb3cQ
 ZXItZVa5IY1nTQ0JEAap0M33MjN7btI4+wr/IzrGj2tQ4fmIWamdaM/1tB0Cb8RHXvs1z63FoOI
 p6mWx1Thfax7qnvgS8T7LxOd/PIXDuoXFzXCrVhHd9bgWxvErhZaEYVItckHNgqmxvDUjlWE+B0
 25H+R6O5HVbKFKe/WnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfXz9JXlO0ilS4K
 YyI0t6WmID6TW5Elnt3A+/2RlVbWeSiZCBiWz8LXu5k3l4zQN9rDqAUpemUDEeYw/KuKY2u5519
 qzypOWpiNOgdOkTlzIfIJcaO4gNSWrE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030097

On 03/09/2026 12:47, Krzysztof Kozlowski wrote:
> Revert commit 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to
> the PLL-achievable value") because it is absolutely untested on newer
> hardware and obviously wrong: it rounds the byte clock when the byte
> clock is not parented properly, so the rounded rate (used later to
> actually set byte clock rate) is 19.2 MHz.
> 
> This broke DSI display on Eliza and probably SM8750, Kaanapali and many
> other new devices:
> 
> [    3.164727] dsi_link_clk_set_rate_6g: Failed to set rate pixel clk, -22
> [    3.164729] msm_dsi_host_power_on: failed to enable link clocks. ret=-22
> [    3.164733] dsi_mgr_bridge_power_on: power on host 0 failed, -22
> [    3.164760] msm_dsi ae94000.dsi: Power on failed: -22
> 
> Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
> Cc: stable@vger.kernel.org

Actually this was pointed out to me, so:

Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


Best regards,
Krzysztof
