Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211283ACA5E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791304; cv=none; b=TZFA9+P2FS7gniZbaqZeam8OTE/SY4c79O/y7qFd2F13KfqRrAnkeP3I28kskNX7AcDtstPNQax88v1E/yLzy2x9WiJkEIM62vd+fem7eAVGkoE3y/e5nUbUphXr5cXFJchvG6wU/RTnmwKShCgak2BeFlgDncrapDIUNY5gLjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791304; c=relaxed/simple;
	bh=FaD26F1hjDGU7YdmsMYF2tmo6eU1dKriXvKBCTWPLv0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U597O5giTn9c7LOQZdyVMngSeYgwYz8R093FbhTKt0neJDrxmeja/348dUeNkGyOYOn+11v5FF4x0e8xQAbksfyEQjXne2Yi8yZMH02Gz+M8oXAnHYYAvdh+HMfUGGv0ApZnN2FvjnqpYpsEBGmDyFHYa9bAWW7bTfvDLKjYfEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL6cWM3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTjNI07B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL6cWM3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTjNI07B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdBWY851137
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 14:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=; b=cL6cWM3u0hVwntwq
	gH0kPyquT4TA0l7KwGuexA4YqhmRMrGeuhz7E2Xbl8oOxlWqB+1FcN5HeW4UgSKK
	D1XGXet3UoMmAP+h+BfHzbl12t/BuU7E1BgxTYBs6mG1a/0unqU1c6F/CCvLGPWo
	gNlx4Sdz6qWsW9xjoq2NY4C1IGNLZpaJnhZ+6CKlfjdaoJHAibfZBtPoY818oPqS
	WeYpAITB3y7jABXquJ49hW5yb+7xYRAhXy44YxyMbvv8suzFCm+kLYq17XTMR6zU
	fZ2cdXKQaKuFAwZz4TDKZdjuNilYWvmFPks8HNKP3CuCxUyJmTwLWCkTcvJis0Y7
	iUDGCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8qqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:28:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7ef17031so4474211cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788791297; x=1789396097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=;
        b=UTjNI07BxMeLdOt2vBd9IQxSqy88cSyZCCOYgJL0xxWjLjARhcq1qmYk7o2gArznf0
         6NPuBUZIkNXN5NDUYL8pfnSbOSYlNgb3KzdriZdjcHvSjUReejXCiorl5J5S17utRPV7
         8EqzmJwzdS6gY3zHTpY9rKSpcEYJ7rVVnXxhmXZFgeyNt4MlGOTccS+UlyBiOyi3/bL4
         FHPUEENQULtbM434OuXDjLh5c24T7zl1JOlPuHBtoJUlW55CrZ+mvEM6H+iBnv7fG5zi
         EXZEPw8I1icxw560qK88Z/bBVfeTDT5pqEtTt4ajXSvE9ILwGbQlp0eaiPdO3fHuxGqQ
         wQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791297; x=1789396097;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=;
        b=m2eUsQIXIMveOvYcsxgX0fxolpRJ/sDaK0pgKUwuLEx3G84E7suffE2sxvVim7rWAD
         DuCaMdEQo43OKwVhliRW6N3SCLomxwUATQ91qlW9wODtlfoKdaZnlYUaFY4I0ZpYRCp1
         aPAQP8s3Z8oc7K6UC9Fs1Q+E1RCq1EYcIvM7XXQEj40C2uGjprUx0OvZ0VRrkz2BQOrh
         v9ft4QmBHnCs9Y+Q78LoMtXZft9Rz8G0tOYDntSnZBObYdW/C7ydkAGjfECKRtVcpvqI
         sclAqHUwQC2sYOF+Fo6ihEPzkAOgoh476CLUizVcqtCBGqkwgPzXRzdQMgXNM4RCo86s
         R4Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwYnE5JhZ/JcVogu/iEe/ve+0CvUDN07jhU2E5L5ywNVrbwWPt9TVHpFasx8xjcas/XFoZtzTpuYvhU9GU=@vger.kernel.org
X-Gm-Message-State: AFuF++mdLb25ML0jzpYeB2cVHXdh00DrkpH3p+xR7vKLHjEyna2axi89
	di6YLU7aHL+rNWOXO8AH7nWB8+eUQlrjKcobSnurN4f6ibPa39V3URO23dOE/aHQkYsbAOzk/u1
	nM6p9eWnpbjmJuDYC2mx6AVkfCKRMsNubVJgQcZhlJV4PC4d2BEiyv60/EbgHeDxsR0x1E1i8bE
	c=
X-Gm-Gg: AYBFou3W2ugHzNU+bszkJ9owfG3nQr8XIiC9pihfTjVdlS/9wiSyzqoIt/Xg86KdzvZ
	jNE4FvY+VS15poLukYoYSXvGX+6ea9Zl3RG1+fB3c5H9jR6L3Y7l29EOVeuPobBMT/04cbhkyw6
	QQNXwrLJSJc21CJo7/X+Wg4UBvRXYCWVTUJLaTh9QYjVsY/ncZRJ9FpLtCGd1G4idMxJqV7YHgh
	mBLh8OTrFKZe7ORdYMXI6Pvy+8GVFSKUloW3XPLyIn4RXo+XCx1HJaJ6ystTRmTeB39dtP18bwH
	7o1mA86VdqTF97QOWeBjBKhvPETR1VfAyODVEUzhYiXTNZbMPVS22+2nptU6wk7IKrwmC3MHp8l
	CMK+Twor6F8TK6JUMEJdbnh3NTAZA+IJPig==
X-Received: by 2002:a05:622a:1aa8:b0:51a:8945:312d with SMTP id d75a77b69052e-5306440e830mr135271451cf.0.1788791296948;
        Mon, 07 Sep 2026 07:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:51a:8945:312d with SMTP id d75a77b69052e-5306440e830mr135270981cf.0.1788791296478;
        Mon, 07 Sep 2026 07:28:16 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm196469495e9.5.2026.09.07.07.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:28:15 -0700 (PDT)
Message-ID: <81915983-b16a-4647-a623-3176c70a1782@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
 <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
 <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
 <d1ec9149-7034-4002-beaf-d389f0603fc3@oss.qualcomm.com>
 <c8f9e9c9-d619-4094-8968-c162d6b2b361@mainlining.org>
Content-Language: en-US
In-Reply-To: <c8f9e9c9-d619-4094-8968-c162d6b2b361@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX9gMkaTu0a/OF
 kKCBydZ0NO40Jr6jXW0EXFbEOC3dL2zCrpGyCdBXLzzg4Ol11NGGClkWPSCg0hDUA64pXD7nduL
 LUgOWbrX0IIWdxLCyTIvctIJYMOMQzM=
X-Proofpoint-GUID: 8p6yk1Z8gD3RDgIre98VKfGQjvThJgEC
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eca01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8L-9JjF5_uZRE6cqQ9cA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8p6yk1Z8gD3RDgIre98VKfGQjvThJgEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX6YJ9Tp8iLfco
 rpT/5iNGUpBT5XppT8I22X8BxRF26elZhh+3dSgxUuuWMmaW7/XT7y8ropw/dtUmCh60WoSnimK
 slqTA6g5y1XJnYKXKtoRXgOKduznv4g3dnNz2PE5fNUI+l5X1TnJx4u8pnAdqdsR3JvIQYks8Wi
 26xbwGWt2D0tvCYz8CVpHHioLn4+xo1P/P8SpVgn0rDcuJO+I6FHZ6gCSSc2mIxsG5cXtRsSnq3
 FW2JC2FzvSMBCUskZ9HBd3dyrPOWtWkclkZ+bVlTi8oa2lShwniZvalI3WYPucsRoQ54JSG0NDp
 MtkWBqtHfs+pgy66nvuFrO/0hOQIgayffhXSx7ik2WI0fOHAj/tL4+KGZJK+prrnbQ4oFb4kHeR
 g8Nd8RBSGau2OsELCZg58aG39pmGHLTtgyptBYDzDpK7si7u4zVyIUPgJ5bG90/Ur65VgcDc5gF
 Y6szqR8K3+kvoR2K9qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070160

On 9/7/26 4:19 PM, Muzaffer Kadir wrote:
> On Mon, 7 Sep 2026 15:39:18 +0200, Konrad Dybcio wrote:
>> On 9/7/26 3:32 PM, Muzaffer Kadir wrote:
>>> Hi Konrad,
>>>
>>> On Mon, 7 Sep 2026 14:04:59 +0200, Konrad Dybcio wrote:
>>>> On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
>>>> I told the robot to take a look again (and again and again
>>>> a couple more times until it stopped complaining)..
>>>>
>>>> The following feedback is meaningful:
>>>>
>>>> Hi Muzaffer,
>>>>
>>>>   `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
>>>>   the function. Please populate the corresponding PINGROUP slots:
>>>>
>>>>     GPIO8:  mux 11
>>>>     GPIO9:  mux 12
>>>>     GPIO12: mux 12
>>>>     GPIO13: mux 12
>>>
>>> I will add these to their pins by sending v5.
>>>
>>> But also I want to ask,
>>> does atest_combodac_to_gpio_native
>>> have any mux on gpio12/13/20/21/29/30 ?Or are they wrongly set ?
>>
>> Yes they do, the robot pointed that out too but I figured it pulled it
>> from the internal data and not from the existing driver. They don't
>> really have much of a use outside validation testing I believe, but
>> since they're there already:
>>
>> pin	func_idx
>> 12	14
>> 13	14
>> 20	11
>> 21	11
>> 29	10
>> 30	11
> 
> Hi Konrad,
> I noticed that I forgot to say pin 41 (Sorry about that).

pin 41 func 10

> Could you provide it too?
> 
> Also can I add mpm pins as a seperate commit in v5?

It would be best to keep it in the same commit since it's part of
the driver

The robot suggests the following:

  static const struct msm_gpio_wakeirq_map msm8952_mpm_map[] = {
        { 1, 4 }, { 5, 5 }, { 9, 6 }, { 12, 21 }, { 13, 10 }, { 17, 12 },
        { 21, 13 }, { 25, 20 }, { 28, 18 }, { 31, 16 }, { 34, 15 }, { 35, 11 },
        { 36, 9 }, { 37, 8 }, { 38, 3 }, { 42, 19 }, { 43, 22 }, { 44, 23 },
        { 45, 24 }, { 46, 25 }, { 48, 26 }, { 54, 14 }, { 58, 17 }, { 62, 53 },
        { 63, 30 }, { 65, 27 }, { 67, 50 }, { 70, 31 }, { 71, 32 }, { 72, 33 },
        { 73, 51 }, { 74, 52 }, { 81, 34 }, { 85, 35 }, { 90, 36 }, { 93, 28 },
        { 97, 29 },
  };

Konrad
