Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043123D7FF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842574; cv=none; b=N6i23UaZUy7n/qga1NsEm+SWInhFMgThOuYCDpkbCozJTdpapyT/1gWr9Z0Dj6nulRj5QGFLtV6xyBDVGNeWvf5OiEP12F3K2RbVvIfe1rI9Aai8hy+mSooSbenULtAV1vE3w9O9ZT3sZAQS+Eh/mItGF0EPlXW48RvH6wIzCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842574; c=relaxed/simple;
	bh=/1DwrtXLUl/SM+2pkFpXTJgQKtSS4VCZ1/ENKW4q3t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZpHgQsBKVFSe/hu7zsCk72j0msFhT+jTEnfEIeEEsGocKgWuxgRKcEiTZukmM6QkZ7uuE+yGW8emUQ3WSYHg1eLiduPdAhywIX3KptNFw3wkEPXNucXkLb8C5/ueg7Ww7w8M7rRgJRwQkz0iQ7VfLBGPvX6KLlwVsJERu98iP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdllZzkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+yzmMSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdllZzkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+yzmMSz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfNM2176996
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 08:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=; b=UdllZzkYWDkK7/KK
	xaoDcsiMXKjfj6cDd8ySh7ZrkKLDSOYOgkPMaFYADhkSj8V7O9K+VM9AZfIV2YYD
	zxTAULs8+UKfxPmEdni2F4gDIvp1nZq1dwQW6t95TZrIzainWB4mScRNEMl87ngq
	eSng2HiZxC8jQN3SxqFX7SerJ5OQq8vXY61Ta0wa4HuIuyumx/VFPpVWRiJowV6R
	CM6KUU4Iazw75qwl9aaVZyZu41Puk+tr6i5MXrsQQ7o50n9vG75kndNjSuCmB3rL
	jEepRG7wt7DguimbJVFK7ql/cDxPrswL3ogMCUW4xeAsXtr7VcEgdZXSrvA6ATUx
	tMg34Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nrmmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:16:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c9a1cec69so39775885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842564; x=1791447364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=;
        b=d+yzmMSzl3XLCWtrCRGbOiNaIVplCTlbWuWPrPoTxr9jAONOGRbgmY6nakg6TH93a6
         O9FXDe8cgX+oSdwsoib/+0lXpRYeFgwiVddFsmpJT+Sd76NkfgyzSrjuBtbZdeqrBcrD
         6mGZNI7wIr/uobQMQ3uFkZ6pgFHRnpwlKyBwVaQKONGFRmcTjAsChDJyOMrwt1cFzjYK
         iKqmtOIgm/fFhC/1IKNiGyQmEZUU36bsSgEuKhnC+I0r9aHmTsZGmziK/Xy1XviBLwT9
         6fiNGiDJtKr6PEKADlv45X7zgSpMmPLEtoqzQwV4IJt0bGJxEH2hhtEqQSg+yaPwzjqd
         3tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842564; x=1791447364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=;
        b=gkT9uR/2V2SefWq9OQiRju4CC4KwrjQ2cC+gecVMpW+Q8YEpX0ulcmlOqeATby3nla
         DJneU2nzdt6NXIk/yEjPczJto09xH6INNVJyqeFGTB7PiIq8VH52JoWAL8YAZXr1+AHx
         VQhR9HD7inadrdqhGCZCzl2biYtPSDZHu83HzWaSEa1LZKUf316PUgGa4fdXucxyiCrD
         5xkQIkiELYg2hTdn9BwnR85w1qw3Cfm9KbpJ+RrnQg1IobggKABpbBx8+sp+ndx6Dqf/
         xGsRlwMq9S5GmhKZkysAlNubV2Ch1l5RNlX+P5N16VXIx6gTxuXTPQf83XyDMOxvDdAa
         QpiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoh2g6MrOEoU4SNQUAm7SX70lOQUxAdgIGJ3+AD7SUwUqyk+Tcjbw4AHqSx3GKwzs8gjb9X5lY9ES55fQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l90V4M3T8GfQj0nuF3jbtsJ1yMTGHZ9nCKhIDD/OkTKOwbRZCm
	WOkfAUJQEVthVTn5nYviVme5nrLS6WYu2Dt0VXJ1wI/xRrUGOWJocBo1eJEUjxq61qzdwdS/7Vm
	Mp4t9HbWiBtJeaIla9dkDGvopdqJ06laPko6L7v4y7nyo0Ro/xACO5qAX6Vd6wetqB9s=
X-Gm-Gg: AYBFou2bYWQVXzHnxmw8CwOEOgXOu4iDM//vTVEBuR76o49rVbvoJyko3vlUFqi1YDB
	paAJ2x/I6ojS6sUFy9CFCP5xslcIBH2zAeLh/y7FAwfsoOft+xOSeWXEqXv9xb9kFt8jGrohuk4
	NMoaG2/IhkoTa4MBGPy8VR/RTe5VZOIrODr5PiM9YIKODslTuF1PS6qf1ITug+CJmnl5B8W34QU
	PxypKNMt90Si1s+AV2dnFIu7Ry4ESffebl66q7XtTGiIKoDNSaTNFie9oXDWalieVEDSZMN1Vjp
	Xx0dgncJSzvB2wUWtwN97b6aWF7buTmBVSj/50C30tpepB0R40AaJYBXnHwm0rdIeyzwq3m1W0R
	yrsc3BoSIFC/OnDWan+ntZw==
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr635879885a.3.1790842563971;
        Thu, 01 Oct 2026 01:16:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr635876385a.3.1790842563375;
        Thu, 01 Oct 2026 01:16:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d86372sm106000166b.56.2026.10.01.01.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:16:02 -0700 (PDT)
Message-ID: <67eb0b53-6c05-418a-b1c7-6e7264bf794e@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:16:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe16c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=n0B6JTkGe8lfbm6N72oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX9QsAv6+I/Os6
 /TCRCF7NJQjg8PKS4Hni+j/fPm1bjFk40htL5Q60/YKOc/c1A5Yz+cchfDrsX/OZTZnSJpfLtWc
 CbhD1s+M6BLz5bUlW5rEoZW2pUu20Rc=
X-Proofpoint-ORIG-GUID: 9AtLCa_yUwSVFsyy-_m9tu5q2MKSQBZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX54893PkZk+Qo
 A5mnWkhek2GHvAlnw7bnB47NonF401jqq2C9Ww/bNXpxUkN2HUOWsjzqC5sOY1oPP6eJiDGmycw
 O8AJ1dP3hcyVUEeh+Mg/aEvyEigTKeVWWmRXYIyJBXfJCHsy1hpCE0IwjRf2hVbu8/OUAqejNPM
 vjCPdy5pM5Uu/mmZnRWUwpBGcnl1oS4jkMw+9IacTOxSFM2nFtK8ufiYn3yyP3M4nhpGdNKLflr
 yD7q23Oik1j0IX3OtZ80tga6dqqZ6d06HOAsr0+PS+c4qiFg6ENXhocYKj6BVJddr18DMSdfbd3
 fCVj3X6/Fr07Zqwsc/VhZdEZ/enEB+TkSIUy4dBcC6mVqj3tQf2b664Gbo1dh9euVH5a8WJAiyw
 9Xn+FTGMAT1MRTa6b+wdK1J39OZgTANJCI6lfln4ajHvjz4TT0c33QGjmOFDpYn1Ex42qSvmjZM
 1m2LDQUugvZKFEZwhBg==
X-Proofpoint-GUID: 9AtLCa_yUwSVFsyy-_m9tu5q2MKSQBZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032

On 9/30/26 3:53 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Associate GPLL10, GPLL11, GPLL8 and GPLL9 with their existing configuration
> data and list them in alpha_plls. The common PLL helper selects the Lucid
> and Zonda configuration routines from their register layouts. This uses
> the common initialization order, configuring the PLLs before enabling
> the always-on branches, instead of the previous CBCR-before-PLL order.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

You may want to adjust your system/project-wide prompt to not
be so noisy in the commit messages

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
