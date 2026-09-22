Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8C53D0B8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078628; cv=none; b=FvT0BpzTrO/Yz/6Sayyn1HVg7zxnFd5146h6KMhKcBQq5d67M518JoK30WLnxmWLmK2lx2TCd8NdNg2f9+uQ7UTsgaknCcRYQO04WNq02z/V2el8urcmAxmQ2m2A1QBYBuXPD71X0udcpLPWSbPLju/Vuj1o/+lpBJoXC2Aw0tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078628; c=relaxed/simple;
	bh=SZCXlrQAryWhTDqNuUadzwglBxE2aUkKuezLoH0aDRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0HHMG8qEjgBXSpVEQnNDMLESxUXo7R/WB3atMKGtITtjxHScqNJ88H2kPuUheFB5HQcayAkcdpOyrv9KqCcuweFWQ6fuYJ0tssx+bXEzSVKKM35SkrNiCetGghwD3KigyBBKHAKMW5Urb0AnNSlcUdRaOHitFMnjw33iDh20mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGIYyFF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgAdJlHE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGIYyFF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgAdJlHE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPTvb3516030
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=; b=XGIYyFF6dsfvo/OU
	YLl/mPQe/Z9bzqgu4v0+bXeQ0CJd2miuxkagDmzl/TfuBjcBy+Z99sOY+bjtFM5s
	Lbz/Xf8mxKHyTBYtmHvGxKhXrUx/caCOuqMVt25HIuZi4BRXhfJNEJc8IaBov7f6
	uFc9CRghMAdywstpZ2eb7qfZzN5U4FwdssqDJn8/WJrw/tYhtzS1RtvHax5dLoos
	e5kf0/CR/KcjLZYmg1lmRnzL/rjR8PlQfNOMkB5tzOamiqPsj8J9uyZUIAQLA9Y6
	/HKqC/4/pcFVBFvPj1ujY9lRgKL5EUQTccV1ODfAnsJ2TaAXDs48gejNjzDgrUP0
	arvSqA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqa8qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4823aeee320so165984fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078624; x=1790683424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=BgAdJlHEET0Zey4poWZlccsZ6t9o3sp2Hx6+OcU9SiQDPxiD1gHWTwG7Nv2Z9ciNFb
         /E/3UHlUU5lcLzqrrAY14RLj+BNGNE4zpy88eWg0G5a7WJ1Nw43M32FH7zVGI7GAObbu
         XZE0sqMBscy7WPt6AxAG0VlyO4H4a1kqMQCCQL+toQil+CWSHA6w9igeZzbZKSBW1Z1h
         U0IHDzEhjVYUMSMwtxStcoyGa25r+RAf5VF6gkUIYJMFBkAm8SH4V0DxC4FnA9lPG8R7
         nPfxK9fpHajBBO13JHqC9bgCO0zBKQYwA5ZNKSwY0/eU4U6ZO0Rl01FJRlsN0g+xm7i7
         ObbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078624; x=1790683424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=Go6o9vMlbmh+f46GBIQno07w7DWemwvRPuepnx3FEvO50hZ97qv19Zm6747ngkbB5y
         4bOsdSXHTVmt0jSmcVehua5k4/xm3gfOyux0to0uLU77AtrXCX5JsbFaOQ6x2fHggSy8
         QnZuLlXcM/DqsumhBrXTkBAOEd5PI4HsmvRDmmGGCN5uGV50GjlWt4UbirKjjUk6ehiq
         BeBkvXjq/tSE8kuZcB4ffu5/cIeNxVl42yOIzXBGgvPO3IS31hzOMlAnVdjARRa4gMDa
         Lf6nLSgzFNrLMMQMrc1JQqE94fIrervsYE2vYAS+IEY+wF73NtushFx0+wnBeXL4PH8k
         3eeg==
X-Forwarded-Encrypted: i=1; AKwUvBxhfmISuNC0sUIixIlZl5JD1hqSGIzNpo/3mbDKTHvB9vHjpjJK3eF2gGpB28G6MUHj1F/ZRIBHYi9+GEA=@vger.kernel.org
X-Gm-Message-State: AFuF++mmFXD69SCtxdoE2eyrtcnWcSjMZ61UjdyYQCWAWprfHSQUr0ju
	/sxKoG3e91NssBppRE/T6+w1sN7MwDNSQSVB3HryyNCMi+xjjoqTQmtx377F121lpZlg2xZCGQk
	wrd2qoANI7HneX1Lera01041Hok3GU69wm1GK8sgeX+hCupT23aQ8iJt8ctDy9kYZLh0=
X-Gm-Gg: AYBFou3gJauOj8gGLsaQxnugI3SIKa83EMxGEut4NpiV9dBp8JqQXl3Sk2qLubu5042
	CT95HNGNviqaDsLUGQVpdtWrqndajqWY9ClMRgYx168qzUl7N39GRPYPxV0JSlpxFmKgzns6rj+
	3YRF75OQCx1Yx7lgNmCcPVCZPLFYvUfO7BKz5w3hd8bD8lXjB8jRMO79jZ7cYHnRmtzU4l44IH0
	lkX+hXqaqU/HJRtDuaUyF3mR1nIp4GUa/UwWbbjRwju0QG3I6MZxWDvGCWxvwZo8X5aM5Q5svDr
	kH8n+fhPA/5avDbbRuBE4ORWbOZtMdtwUfebSgysSBSoDbgGIlnrdaQPOFgVUIe5s4b154E+CLC
	ejHH3MQMBKTPfayWWa1OzEA==
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228120eaf.0.1790078623778;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228055eaf.0.1790078623189;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9f1895ddsm54692066b.9.2026.09.22.05.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:03:42 -0700 (PDT)
Message-ID: <69636cb8-5867-42db-a8fb-aa8b2d9301e2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
To: Oleg Keri <okerixx@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20260921144953.15113-1-okerixx@gmail.com>
 <20260921144953.15113-4-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921144953.15113-4-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8p-6na6bchFx7LKXi_3N-qlsqWnN-qIH
X-Proofpoint-GUID: 8p-6na6bchFx7LKXi_3N-qlsqWnN-qIH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfX56U222g9bjGb
 cIujhAt4pbxrTzJ/igu6OS0gd5UQkeJSxpJ7grn1AeJMdwZK8v0vTwLiheL3vFH7J9YwazREuZT
 dkjxl0Vb9/zMAK9A8QkCz2TnUhmNw7Y=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab26ea0 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cXQzEVsWzZF_LJZYrIMA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfX6DOVEIPC0WLl
 AmDI7oP2tIAmwdOEdEmOfjLGEXr3Bz/0i4sfi9lGZbaK4LIvm4svbqJ45myBJLYs7Q0oEQPaxhH
 PVqCJ0WRjSF/CPgmqV0A1E2sL/99/ExF+1drAJ+de9Ol0lWlAihFwtJ5Xn8x7ySAi7WP9qBlnRN
 Ei/GnuyZpFwFCyliXlM/SwM1OGW5Fa08MkvyOU3Sky+jpvBadM+Vq2sfjF3bgaitNx6yMxnDjna
 4IYpAkySzaFCJBvD/COpdh2rnmOJtPPHnQVu0D3C3HMqSc20YZJPRtRl1C8j63hhkkTJRvpgc13
 RhxIVntp8vvMmC55e6Ka4MyrHvhPCSCkxP/8n62PhZUXNxCSAg14YqIGEnelEmOH20w4ES4xt2N
 TXpV82SZ4A9bvqJtf6KCbGLpxLTGvxAoqz2DfuSUop6p00L4KuxTMOZkf9W9kwRXuEJYRZgTBP5
 UR4VBCS4LKHJloLeNgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220174

On 9/21/26 4:49 PM, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
