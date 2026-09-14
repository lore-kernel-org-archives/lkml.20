Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C924457B1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385007; cv=none; b=Of7NFcTzjOTwA/z+8VZE2Qv99ykUjP6ETknHdOWpM/PBCo+LgGKgqszd///4Jhizt64Hx3f546mclkkmchnTAeBH2r/+OdevkLiMXpnep+PJVsSIskjgNsRwiBVUYpo+1Icell/D5xW0qtbysFx6wsdk/iXSGoF/uQjVn4HVxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385007; c=relaxed/simple;
	bh=9NTdtJ/TSp6i9fELQDWEuFYvwbqy3ev3R+H2YTC2xv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppuDh4lmyjAjHhXNo5PBhIKrNlYoVWW5r/AasfAVDfn/E55xNjKI1WzQ1LGCoB9o8NHIl5PH+imYUPjm8LAg1SdW9pM3cf6qtckGiMVde6acjpYVb9LEiZTYWrSbBV4bw9jJQ374XqCGhv/bFBATBZNXwLg731JBDQiPYA2czQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/WVOCmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht9320d7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/WVOCmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ht9320d7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm3o31216142
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=; b=E/WVOCmY/+5Enkgw
	YEeOQ9dPHJUB8CWxTR20yFYOlY8UkoMJaYfEbZw5mtWvnO47B9tf1wMQPeafNwuh
	wcPa+7jFxuwllxPm+71b/159YFvZtg/2RACZvfhGXsdX3lRflqfucbjNfAT60rpW
	nT2W6tgRlLZN6L+MSJ/TNerjJkANtic5DzviOrYF00TQxSgNoyEqEGVr9kcRPO/3
	gIuOu7yV0ud+xAE5Z0o7WnQCbf35GMdm9FpQLiSsBTvoxEBODy0Mr28DtrxMTC/P
	1BajQAshRn13edHqPJho+jbGH0cD+CYPJc+8jjhbFR5E60BgJZv+Py3P6XJNpBgD
	ZRcYpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0a87v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:23:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso39839285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385003; x=1789989803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=Ht9320d74kpNIcVyo8Quf80aiP5sRtcR3/0wQmYfiFriM2hhqg1Xc30rzDlEyoNYFM
         uRHd2FRjQOZ1zCgRZ5KOqYEbm4q68H7RiwKLBhVo5MofTGjbi5NYvFfajGuSZoDZZTw0
         EPteeyDnHje22gRYbYKCuMNAsdLLXRiLdZbW9nTjGVbPMnkkOMlD07nTCUCIDy+qe0U0
         kuujEZJb9EXOnBkkLhL9clPNrfIHSDWucD+E7UJ6NFZpQTBhIGV5pLX9PI/safMHVzv/
         D41HwqyG3tb5J1PXgemorUDx8cIj40aHjlwKE8Ged7XPrzV2qxiwtdL6OGmuypDNXRLZ
         Ahjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385003; x=1789989803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C99yA2ahM9Y0TtIpiFt1fwPT2Pp5VWgJygOu7Ai3npc=;
        b=HG6CUOD4zQn/Cgzs7i33xWkSEVfIK1bZr/LzorzupZp1xs2cMMrWg5PC1Ot/rar8Kx
         YFf4euaCmDb+QPHzexOTWwUiTXqdBT8dW1CRXy6+CjvfcclklZHZ4N9+qbWA+xkH3n1O
         o3f3pHSSNH2tZsAtkzOOL/K4V/IAKIzr4UMKPpKPWHJGEiqvNWDabWJwrwwLdxX2/XsP
         2pyTiGQA2WKpwTJW+5oqui9+4BuRKhsc2VOPwBwzgLFfxWUl6qPjpiyYrU/FUqSw7ZyE
         Tdj9qDv5NpkDravs5TdyZpN9k0BuVaT9CwzPbejNBlMoLWDcklZ8QVH/H4WCIOMcx2tq
         sZAw==
X-Forwarded-Encrypted: i=1; AKwUvBwleDPkRIJUGlPrgLflC/8O067/r7JOjK6yK65DjX8OuahlbnVy9kQKtNBZlqn6zeA1iUZ5zxonE+806eo=@vger.kernel.org
X-Gm-Message-State: AFuF++mapl0NsJg/9Sx6hpsmNiVKudyvXCBf1YXIw4dqd3/pSilP8/HH
	vXsz1Mrj2nAsOFh8kC2l+CDrhTXfP8IBzaUzu1XcVveziFhT3g2XWUAAIurXhav6aG8rv2UnUoi
	tRN2ll/WPS47LKZ1LJtvW7WC3yGkaYOODjtqvCeZ/GYANkGsPi18iFxGF8rvfnuhvnew=
X-Gm-Gg: AYBFou2MCqDMM4g81ICr4K+I3Jjkq0AflfwnPIf72lRbkgBfgxX2BjarxGCb6KvFhv/
	8vlrNBgucGBzb3cYY8fOwzEHf9/WBqPBS3qKpM90xki9Zsi9JhxrWmFC4ZWK1tkRwTTdap75m0F
	2/riYb0re/knCVczejI/7GR6QgHFiFvLOMMjtG9C3ItuMCkCByBtSIwDp1lCPSMfCHMKUTXf6Gc
	bqStrt4XpeZFhr2cSxce5XCqivKe4s7qdQZA4K7T3r2eEJICptDRVkvjsbfZm1hkGB3ynVW3DvJ
	dK67sqfsSqztl1CmgszhC5ww0a/yLDdFkuorj+x36/X9BlFLRSzgqqZVvubBRttdDedV04NYaXt
	kL4Y2C/wdRtXVagW3j+zS2Q==
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214250185a.3.1789385002616;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:934:95d9:85fe with SMTP id af79cd13be357-93a29a8d250mr214244085a.3.1789385002074;
        Mon, 14 Sep 2026 04:23:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296601f4ccsm406660866b.20.2026.09.14.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:23:21 -0700 (PDT)
Message-ID: <757e124a-4c7b-4d3b-b73f-19e7e39f2677@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:23:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/20] soc: qcom: ubwc: Add UBWC config for MSM8952
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-15-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX7WOoxU9nH1nR
 HYzZO2QGZeyLXl+aPL4FFGNC57mcRueLwm4fs4cUIlBwBvoKXhDEii1hxjHDi7Tuun7V9X5jftz
 s0X/+g4h7qlkabx+xdYOMvtChYCtHxc=
X-Proofpoint-GUID: eba00SWeThnRVLxlYJ0bzqWhs9wHJrac
X-Proofpoint-ORIG-GUID: eba00SWeThnRVLxlYJ0bzqWhs9wHJrac
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7d92b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OvtQcJRYg_U4C0nSOkMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX7l+pkpS6blzQ
 64mkEe28VQkZbESd6CMR2vih0rAWOovrS+3k5eCEYm9KlDxNlIA7OHLWu3Vwa0at7TlPWCjIe8v
 YleYjCuh+rPjPhtvByIQ/ELEqp7XU0m1j0tFcrFMdRIQDrCstliEgwSRlTn9hIuIeDrZY4+RCJ9
 Z+D6IjGP3kJW6ju+D1SHT0DT3qNVRYcxbcB7qPih6cfRq0gH+bP/+ROEotHFR/qby2Bkx4Jg+Il
 MI05JI2KnUNVcrrh5Co1wVCfxDwVCw9eD/35lBF8sPVhEASqwUO4hbtpSuQo/IF8US4daG8VboP
 M7Wrbng1jbAbS+YqhfWno9aQkb2fHJWUfIW6Np+HmwVak/ozS4y5jqGTHQtF5E3LfGRV3sn1Inx
 l53tNv10dpgahhIyDr1QD1LJGSN42D7jE09jlwSaf/E1f3D9G1E6YzMzAHretfV5RIvp8g/Aogr
 bA3r/iKt1P8WtcEk8dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140161

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
