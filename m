Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811C497B79
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963869; cv=none; b=W/d/savVdNC0YS556ZhToJCYSZ2E/H/eBWiMRFE3rLSF8XZcvcCT318c2cDzLYT+Kl78FmqTnjqIEDMsjV/B7h35zGwm/aA4hQI/REgFPzbxWfYlGS/ZQqS6iCMg9IPUELPbhG3L9O28Mk6h+jVbxvuEmTmB9235u/H0ddHjKoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963869; c=relaxed/simple;
	bh=fOUssPWxOegTLj9IlWTPXILieBKy+2Too8078n3ye7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTDnJHijj9QmFhvIIyKr1sKtGz0MP0PQBjL5EhlCALztUNfGDspnZTdvbeLkpa89IJ4PboHAzgbHMX78G40sNLVjeVTwYUfaRWCSwNjqFau0aVi9XgKCTUDGY02ZsoCDbXxZE7G/rPnRcIcjT2SwQa/hfK6fF8DGfCuh7Qpaq3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlSBL68Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSNEqAD/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlSBL68Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSNEqAD/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1fHC61592414
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCCRSrNdX0Wl0cdwWasVKcxRpYvsw3s7ZcCpfOqb6w8=; b=nlSBL68YcU5o146Z
	z+K86ZUokgnNMPspK9D/WyhvvaCsFcAAwqxV24VJ1LDn0qXvvBcbDjmKhqLlZLhp
	bQZWnYUOvyZ/9SfJD10b1sKo/9CfoIq7Itkq997/dwpZ/jXF9wWnr+r4Vh6Ug4VW
	awDkU4LTEWJcc+z+TD0hdcCLbpyY1WHjxkPf6Vi9EqgaKfbhK9JCMB16sxdddXBO
	dOy7/aAmohUgtZFYjNhi+rDbQJf6jXZsa/WmySvdDWlMzSbIIRYt7aSYJdYSXYoA
	nIl0UdK11/YLtEOd7Wr/eWIsb8WXo70lgunu/27wbFPaB28nmzrx44/XLWeDRhoc
	GuUaWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tk1tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:44:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e6188d1e51so45756625ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791963857; x=1792568657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCCRSrNdX0Wl0cdwWasVKcxRpYvsw3s7ZcCpfOqb6w8=;
        b=YSNEqAD/nI1P5yTkGBwwwh4aifpn5kMq+EQVwznzXxjoVpyJMgrOWjIaejjSo1YU/h
         L+ewFcl+b1WeHffSBYVeAoNWy2G7wJBk9oyAqINnhk9HvTnAUu9Tom6pqbAKGVt2d16K
         lQXgIvEwJsYmBj9HClS1LfJYBpTvTOvF0o+J+iljMk5r9NwDRQE3usByYYbqUBfw+Tzj
         cKZETHjXEUfrnBhX0enlJWKZ5UHhTsFM5SZpCF9y3WJqpp3Xo59IfRj/CmlWooua8HsQ
         EriGRWOzSu4beS7pQVxMrAs+8PQqNtAHNXFa0N6P5KpAu/TgIGLdWU2is7ReFiWhNYzb
         78oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963857; x=1792568657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCCRSrNdX0Wl0cdwWasVKcxRpYvsw3s7ZcCpfOqb6w8=;
        b=lI9Y6CiZViPJTXdsfvy4RP25EZRmATle2BT8ji1ojtstbOhQp4mDbJ5gYALNEmHYsQ
         0pRTUdkaGW9axIpPH8dT6eoWGvTbjZqUjhAE6ln1k5pnVpmuBf5odzp44XObaPNsjvdW
         KBnpHmG5I8USpqHTXfhXXUTzjl5mRDoxVm7CMycZnGI/1pA2rUNHkAjR5L1CgUOhxIvH
         O2yKL4tpyi+64ldQhf778G0lAmJJ8iiV2SYl7x6lCvnetfznIUesCBIXHqRTLuKjqrHE
         jyRji6A29qVxcMkpEakuzWy/qSgMP1VGN+rVrnATE7EJtKhtc9UC42MkZR2M316tjcDy
         GeJw==
X-Forwarded-Encrypted: i=1; AKwUvBwQD6W3gYmbpAaJTVWhbjt5AQiXKjRXsfZgoXsMg2GCIzxtUJjvkrhXun0PhDquWeq7ma3sARpw2W7JKrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy8xLC7ytVGBUY96NrwpJ1NcafAdxgh//BGqrSziQiL+XSddxW
	rb/f0zpci6hneyNTEA0+5YvJhBUKRg9cM6878LgAaPGb9UZK3FE4OtyxV+rSaXw2t75NCqLlpYy
	KvRM4qgheh42xgYcErnXTBQBtd3XuKe82tHRiswHpwtIF9GZAod+MWTHu74qR8Ke2PZo=
X-Gm-Gg: AYBFou0Q2TbBT/bEpzmup21RKqWvUiXWgHkEkim6u6bucBqKiaawEI9DAtH6xQInOlS
	rfCA7PhpDpn1YSbyZzc8y6u44LZr9/At8BNq+0VV5sxHGBaEBlDduAHJqc34yEUEX2m71wzMAOb
	N0ZmSGIL4DHPnVBSJt2raq+5u6IcsDp6UqwBiDD+XgzFXnVa6/ordSL25llEmFCyT8MqOk86jsn
	+KFLVCtYUN+3VyM5If+KFTyFYijIT2b1CfDzqKNaYbfXXvYP/p94qWwZW5djPJXe+8+SrOmfIHT
	SOVJRd4/Vfi2O7l/I4Lm2FGcE7lHd/0QD28t1S4w39tnXNMeSxRglfddt6EvXMiihD5WdMBRWcu
	pcfBv8u0rUde+pewzAJO4mzKOO5f82A==
X-Received: by 2002:a17:903:41d0:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2e8429a9fb0mr134274875ad.10.1791963857438;
        Wed, 14 Oct 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a17:903:41d0:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2e8429a9fb0mr134274455ad.10.1791963856917;
        Wed, 14 Oct 2026 00:44:16 -0700 (PDT)
Received: from [10.218.9.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8dc4sm64418425ad.59.2026.10.14.00.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:44:16 -0700 (PDT)
Message-ID: <48de9560-76b8-47aa-a87d-361c4e784a40@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:14:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
 <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
 <926167d5-e912-42b5-a040-be2bf220adbc@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <926167d5-e912-42b5-a040-be2bf220adbc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf32d2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4yO6XKe0Cte-09FKxggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX/yRfW+HPII9U
 eaFCJeFgnvDMJNEM21YpkeYz/ujZ03mBFatWaXXEiKPrGklj6YK7E154sN/uFU34lZiK+q0FWpl
 4YS3PWtcfKrZxVTqzycxjjUvn2qK+JLsEvRHF3vWCyQcNg2qlBGsShnHFcCLO8mZ8r8ZUjxlvyo
 91S8q/eNUpQqD5wwleUJOsJ9U+PSWngywL1VgEEE3/VBZaTFsXX2IyHSU/3eP9/N8aJmwgVvsZ3
 xEM4GIzQY0i2PVBtUH5CnMKi9EUQBWUB85At0TeOC5xbJ8ShmSCSns8llTCyA8agxYVz7WhbHe0
 ETxuQaUKFiPs02c3nPeafAfoF4ll2Y5PnqYVmJdl0tvifQvHmu152UII1RYMkzRQ4NslD55Tm6F
 uB3lqSsmBGFBtPFvKP+NbY9ck2AsV9QrNuKzVFLP0tFPfPWazHRlCiy8RBTBLn09a0LO3h4yvNs
 yfuUWzaucPXZXwRD0KQ==
X-Proofpoint-ORIG-GUID: Dya40uaM2eeH2qI_qzIfPY-HBZpdWSli
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfXwUNprp7MvYfu
 x+JBWmv3uJfAn2o726+E/DvRybkyiEHN+0/ilbBCI6m2rkWjaPfJ3dgboG9JfjKEWl12oIolAiM
 RWF8aSDOGqd3CvMWrToki1dCdbV8lGc=
X-Proofpoint-GUID: Dya40uaM2eeH2qI_qzIfPY-HBZpdWSli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140030

Hi Balaji,

On 10/12/2026 11:47 AM, Balaji Kalkonda wrote:
> 
> On 09-10-2026 02:04 pm, Dmitry Baryshkov wrote:
>> On Mon, Oct 05, 2026 at 12:54:29PM +0530, Balaji Kalkonda wrote:
>>> MTP does not have audio jack connected and relies on USB mux (WCD9395).
>>> Add necessary nodes for proper audio headset support along with USB
>>> Type-C accessory mode and orientation.
>>>
>>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
>>>   1 file changed, 51 insertions(+)
>>>
>>> @@ -916,6 +926,42 @@ &gpu_zap_shader {
>>>   	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
>>>   };
>>>   
>>> +&i2c3 {
>> No clock-frequency?
>>
>>> +	status = "okay";
>>> +
>>> +	wcd_usbss: typec-mux@e {
> 
> Hi Dmitry,
> 
> The default I2C bus frequency for i2c3 is 100 kHz as configured by the controller driver. That is sufficient for the WCD9395 USB Type‑C mux use case, so an explicit clock-frequency property is not needed here.
> 
> Thanks and regards,
> 

Still the required frequency can be specified for your explicit need. Do 
not rely on default though it will serve your purpose.


> Balaji
> 
> 

