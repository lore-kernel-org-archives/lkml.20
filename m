Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5392A4A8438
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843356; cv=none; b=fLGM60cUHfij9Js8C7V7aRw06X1Ce0HTtx4bt4JlT2JSPSq8MnCBts33zxaq9mj6hPDunTLTRmzwQHxTcbvkoxwhBFejFclk3twnhK+pYahkSf04l3wjw6OZ8VoIR10OG0xN0IzV3nUh4eg4zTN9+0QFJT2e1uo6SWuwWoygJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843356; c=relaxed/simple;
	bh=px9auo44XRq2/gIVEu/P/EZU8qovirN3WcDVMpMg0eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTVdR0rzheSpvPxxeRMVrVCYTixL+owVvBPQMgWXggu4VI9qJKriPxDv3MqemUB53eBpJ+Ol/MV1u7eTjHHUyRvMIRds40aopxYV8GqTiOWQ0XQlrB1BD3uWK6Jm0ezNxtcrZlLuVm3RQnCp9McbS1B4xiN6us19lo9aE/9tmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhY/mM+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXtH9CZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhY/mM+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXtH9CZ/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xQ842887820
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=; b=OhY/mM+JVbvxmq5o
	mX3nLXY4kG0ujjBI3ejFR++3esOjOW1dUaCMXY934jZTYfyVK9Z68e5Oe4FycRfq
	UVerHgbVlw0+65ruNxk20g7YXK3RxgGaG9LoQ50h6yaOcQ0Ve0YXS/9o8/LWswtC
	wryO9mpummylTb+WuUoQAqjEBuBC3WzV4aWi7Q4Qfy1YEUipkYkdeZ83Ipob3tHF
	VBw9+KSPivzy42YkQzyn6tdW2pn3v6eqdw+cDajJu6I3ul3fpPGcHGYr4IlNDHpN
	fAQwoK4/JaPVYmcLxZkL4TURERJAVZr4+rWDR62XlfJEhoFBN5Kb6Nd81UkUi658
	HRvtmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tm576-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:29:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c29d85d0dso68375385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843353; x=1791448153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=;
        b=PXtH9CZ/tPG/5jBh/Z2sYjDwQFiCZrjRSm52fd5kkS6ZUkKZ5CEYAO0N46OBGxaK0K
         wU4U1eTQ8jY7Nnov/8PCss7i1qZ1SKU9YP0XawPc0M+pQVmWiAe/uCt0q9rM6IG3pHVl
         v5194cZeSKCXDlTZR58JZUKb8X11TBXBmsTnh5Q4GBBEcipmZmHdGEQbpohXEDcHe/zf
         c0gtV4qgA9WnneJ11rDkgMDEzs5WxwoPOCXLgeAZE8o9/O1M69zwCXVX7603wfrZAHBg
         DjEzEh4+J1G/lovuiRuDzg+0naJa/+6Q8VSDXzZNqDjqUlgY+w0tJW5hm44X4g8qzbEE
         IF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843353; x=1791448153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=;
        b=fnj9L+SE+GYGrEQMz7/juky3tBzVK2WVAg2DVCaRfClp7q7JJncCPW473mON0htIfo
         rRa59gsvkIoT+7lB7Qw/OHqIkcgZT511fuKPNjQ2fz41MSx8SvWmpRf9j+rp9JkJ3Dm0
         idTP+fzVEF6i231tTM2cm9SGhOTNCYKCAEM2aN57fqLeEQReLkUx4+mQw+4uXys5+Zqo
         /NXJdIuGvIKNuKcQG7Jv9EazUUjsbEWPotvlT3Y4bc6MQE075kT5KC1QEhOACKMKs/8Y
         vZLn30boR5Bo0wPHtmSjyrFvmberpjZ9TblqjIQexoZPqkeq8ZGTvzmXTbJuPpdotGdM
         a5nw==
X-Forwarded-Encrypted: i=1; AKwUvBw0isXkDxJFz+DF6hZHwWRsLPZa48+0xLfxfyNUsUWuk/O3CtIo4SzELtPmDC6d6/PT8nQiHC/Trf0a/Jc=@vger.kernel.org
X-Gm-Message-State: AFuF++ko/uSSoiMF2Me4PHfyoKAM+z6u6BTby+R6VBXicuxVx69Z+vYv
	ozkN/aGeqoo0rYZU8p7WImXbZ96Ak0fmUYMxmUnvbzWmYNN4cvnasZ7tt0R1Y/4fOl+n68K1L3J
	mRvXHU/N9K4zZsM0Du7dUSSw6muRZ64MA/0xVOMbrXElR0xZ1PAYY6j36B/nfsqji7/0=
X-Gm-Gg: AYBFou3NxqDiy/YMluaYwv4a8l5oZbHcQ698235ARpXye+ZFHz+Cfc7/y31ifusMnxM
	WgT6k5IU57J40bwdKHDVh0Euz2ewjVoW9PTMpKm7dPi/GzkSpUKsZPeWDidLpv4s21pZKdf7VVq
	D3+IHd0zsWi2/AhUVq6Q/4o7rEH4AnFPIovCO8VOilFSRqrmU4qdiZIKPsOeauHSwzZvZImzzvd
	9fLoIwVrfZnTgB9iDi2WGioHR6AhYfaR2x6UKAgGrMlJsI6loUc2Vi3i5K1mS+FOK/QklrqI+sd
	R4O1eTlt4VfMzomG8omO5SBEA2IuS6giYzOTAv3o2N+tKhBd9GkVBEh/cwYgvx40BYSrtlT7BD7
	5RvgNSdSINPSy/hi3MCX7Zg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr676878985a.0.1790843353444;
        Thu, 01 Oct 2026 01:29:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr676875285a.0.1790843352958;
        Thu, 01 Oct 2026 01:29:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce2ac2sm111175366b.29.2026.10.01.01.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:29:12 -0700 (PDT)
Message-ID: <dc353f9e-e189-4ee3-9c4f-de35b07ffe7b@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
 <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
 <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfX7P2hHZ3NR4kV
 SzNk8llk95ff6kHcvJkk/4/tojje8E1WfgnNU0QA+nFkBJ70NF4hODyjCd/f4HkHtxjDzmTX6IL
 DEUMtImz4x19hjI5TpnWY6/biXG2QB0=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abe19da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xMYjRGLvxaAixDAT_M4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hDXU6AIeKU4gTPu_X3VZqHGfTlAyWMRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfXyt9tAuHlrcQ2
 izlJpwOi6aK8TzI7Ri+zIhoP2qlI6DDs15ouj+q/jmMGl37FY0vdB07uCAU5VfxbnoC4BL/ZEs1
 erJOZklB8zhGJGp+ebrx8ErE9eUZZ+3ikPZZadITbH6iRzJukCRaWyZ2T2SAXoa5E8/ryRaZm3e
 x1Qc5tb4b+TCEMyAT+OmBjgxiuRgo1px0+zxoJeQv2F84LS26DpfRSScQAvXjD1szAR8xqUHitX
 5w1BOjkwQB7V3tmFCqF0KXGmx7jZdkj7JZ6OejVU/x5PyamGeGzVZMRE+LMycN+fs0p27BnOCfd
 P0qL5GPAtIXB0wRfwVz/Znhl1HXxZ9FOWGX0os0PcqgHN2R8uo8V/rMfJNou2TmEAOQokZbRqJV
 9GAEUWc81oAXSqy4qlwhQ81JMeX3zjEMWjZv5EIXBxT60qnh7vvT9ApGSpNyB8Tprp7XqiN4w46
 m7Pt6kfDISiiQa2QrLA==
X-Proofpoint-GUID: hDXU6AIeKU4gTPu_X3VZqHGfTlAyWMRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010033

On 9/23/26 12:18 PM, Jishnu Prakash wrote:
> On 9/21/2026 7:03 PM, Konrad Dybcio wrote:
>> On 9/18/26 6:42 PM, Jishnu Prakash wrote:

[...]

>> or drop the GPIO support altogether, if we conclude that they are
>> fixed-function on PM8008 too (I couldn't find clear info)
>>
> 
> Hi Konrad,
> 
> From what I could see in the relevant HW documents, the GPIO
> functions are fixed on both PM8008 and PM8010, so it would
> be best to drop it from the driver. I can a separate fix
> change for this.
> 
> Do you think we also need to make binding and DT changes
> for dropping this GPIO support?

It's okay for a driver to implement a subset of what the
bindings allow. Maybe there's some esoteric use case that
allows exercising these GPIOs, I don't know

Konrad
