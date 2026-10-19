Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E358279D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420443; cv=none; b=ALGm8WeIJmEjR/Qi/l9ezFBQvv/ryRWzn1unk/uE4ib+dDXTP0x8Y288a3Md2s++GhtBMuxU55dHa2Hr6QuMixP3JLlhCh9V/Uv90ztDhsIxV12RpCoD22cSOTvWWZOqO3hCSC9JKO8y1U2DDayMhunGIWJg+TA1zoJodYp+7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420443; c=relaxed/simple;
	bh=WcQ472JlzWyfKsdroR+3HXzHyBYXsbJDi2NJWQqocjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udwCQJSl/tzhH5C8aNHTNt+tedeK6PRBgFfQYAwhufsX7+700h+dQcNhSDoJWM165ReC86fNuTImxlDDdlOM2Es0ftnKL+PpXkJ5C20yfmAJwGzgfTpzKPgv6zsS/r15xoU1G2X4IdePrERPT8l4LS+WEXOY+3axPxfSAyOeEfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6UkAfOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mkqr5ruc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6UkAfOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mkqr5ruc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Tw62774407
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POE2ObsCQc6IWM/vI+IPuFywbQU5VVFMHxTHp5jpsOU=; b=n6UkAfOd0/PhJ8g0
	V3AH1hqQjLz8pAP5ZtWNX/Dtt1I8qWwWJl9fIkzk7iMvKXA1y7lSf3Jl584V9/zD
	7WUz8V/aYJJq66KzneJRpd2+jhNwgOT5ioIM4KQ67OF27NHbmqzuBsHx98vzHEoV
	CNfOqq2t+TdIrD4O+FgPuMxCadI8bcgw9AAecvyXENc9h322Z2smObXXSMoPVwKT
	HVJrepac9/aHAv10x2ckqvM4HYQ76M9eIwDCnG6F9P8wAxiLu/Rc/xaCUzrS3BF9
	xH+5mfDcXlulDMt7h6ejaExZiN/W7tM4vaz2XHCDnVSyB+2fCHlIzWvXZYkhdX+a
	YaixLA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur38y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:34:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so5676614eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420435; x=1793025235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POE2ObsCQc6IWM/vI+IPuFywbQU5VVFMHxTHp5jpsOU=;
        b=Mkqr5ruca8JyPcfL+sa1Gh/fcR+JAHyT34+V8CsaJeGfN/8hOgfKa7xmYIxR5YGtCV
         BgKtnW+Jm1WKuxaHgj8VWwfsNIKQeMQ09pt9xT5C69nxlbssXYBbLsaTwfmpCpFQGx7a
         FO7M6LkOS//GJSHv5u5ahaNHHv1SxRG+ROZ8oP92OLXJsb1zZVR8jUh5YRXrB2Sbp+BG
         crzg1ySTp2eJmHgvQebhBOSWgh5S6blO6+R8h8xIZ9rqiSdBSROQ48/p2WWGAD5JD9i+
         4TsjkaIu/B6xJoK0+jQSqmHerwvgnqLYEtVLAifcYMcp+OufPQTJk5El4+Yl0n86dPEm
         e+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420435; x=1793025235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POE2ObsCQc6IWM/vI+IPuFywbQU5VVFMHxTHp5jpsOU=;
        b=frTR4gRakcjyeDh73964Fmb8UMKnqH0WoxlBGm2nPeZYahOnC1M12N6izWt3+DJG8J
         5df92xw+XTLtdSfhgcM29Be6xUiFtlbEoFxGi40IMXvibYmLFVX8n+4yQPuJFsB+j3+U
         jLqkGrTklCIgWya0RHVi+yzJbKji8GScRbknlfCaOqbb2I2hIg9acU0JrtZM1X9mdZx6
         40BZJFb9zJv+Z12SoT6++oWUPqeTybohutuPQsoU6rh5UPePTP6C0MAj+Yxro8+5XHKI
         hn+BKRIuRJ3o2LfAWyT+kne1PFsP7Jpb0KvZjJhORX8r1YYr1hrpHeTB/ZAKcTaKVZRY
         mxKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4sE+vb50ASNLSrMJhl3/UE1/7VvSAYeIsoSDQgzhvKEdagNx/+pH8YSvz3bNDMbKCVQkVAHmAzgia+k0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS5NAI6R0oUwnBHDvzX6mPQ3xnAHCNWTXfcY6cMYlMQr/MxY+3
	ucfX1M7IZBB0ju/KamLPr1dC7M3rMOOwQR3nrT0YqcrSNOMsdxosvz+qOXr0pymcYqGLDiIc93i
	n9B+fYjEngucCa1+8pKmemiMEe8MgFB94Yz1bs5cODd1HxTegDtanpyEAaiBHC0eICY8=
X-Gm-Gg: AYBFou1yenSLBEOWCejD05brvfe4Of3nIo6LlkMO/kge+JFvXj/fW0cXSAa+Dp3r4HF
	wJk4aVA4f5w2cKtbaR810hgYTGROLSYi5xzhRMVwmIT9+vL9/ktseAsyLa2rP+NjE8cmY8D9cXg
	EGzCQsqLR7a5pUCY0tmgwHyYK+wvBiXLh12YX6Vr30TkzHW3UQT94bVQlPM1cJ/BJRPXDsL9bF+
	TArO25mvSU0AJTU1nKOu4esRCfeQtzjVBV3PzCoxMkR3TA5ZXSXexnaY/jI8Xj5QG+N4Hn6Hq1q
	Cp2pbq5d5yEFEqTtyaOyuk7KmokQBhxoXcg9mSAcsDgklUchODh2vBL4zPxRJWImtwjXkjQgOyR
	qlhhcdk58Af7zziE2Rv2yk7okd2Uw
X-Received: by 2002:a05:693c:6311:b0:361:308f:55eb with SMTP id 5a478bee46e88-361a264b569mr11180868eec.30.1792420435124;
        Mon, 19 Oct 2026 07:33:55 -0700 (PDT)
X-Received: by 2002:a05:693c:6311:b0:361:308f:55eb with SMTP id 5a478bee46e88-361a264b569mr11180820eec.30.1792420434259;
        Mon, 19 Oct 2026 07:33:54 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm55166547eec.28.2026.10.19.07.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:33:53 -0700 (PDT)
Message-ID: <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 20:03:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfX4m5N9MCIsY9D
 XP2PF3VGWcNzv31wZf2FoKoTN7ac/EolNcC5Ak7Hrec58Pc0M5X5Xmw64wl76g5V6n+JlGWkXPG
 kq1RLnKmkpqTX1yWLhBu1qCs8KacEm0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfX5/kIy60Uk6ty
 fWDCK7P5ibXt7EI0hKOGUhKEb7yRuZVw3nvzPBEK9F758NE7B2ydy3tNytb0dXCLiFIz2QNUD7O
 kTpKnIGuLHtX5YToFSFamuhgjhJFfEwC0BQadLSdL5P2umHlcPcF+aZkw8qOdi2P4mWTPFdb6Ru
 6j129p3syQrHMLjbwORDeCg+IP14ipY2DPC6ahxUeg0GKrjIY9CHN40J/39PBYrf1c+MTUQFwxw
 avurAOnNVW2ppn4pSi4EJE0yZCG0ta5E76L2FpxHvgHBKEqjIj4Xi9WKZzMNTYejTpFoDYAyKqE
 uIyVyGssTIFyy2dsT5vQdlX+TesGTmOM/ee0IpQRajYgfvJv2NVg43Dq+vqrF/GJ2BYaNtXznjV
 vRlRgpmiytJLAK5rGc3LjLOTANMh81j8+FnoBV2bn46miaT+Z3qjPOROOkrsa6IN1q3S7EWhiKI
 FOqgkROi0HZIVShNTHA==
X-Proofpoint-ORIG-GUID: LChymBMfCcEX_Ii_leEUbAgjgxIMT1Vv
X-Proofpoint-GUID: LChymBMfCcEX_Ii_leEUbAgjgxIMT1Vv
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62a59 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=A3JsiXT2jxe2NWqPQ1aCbg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=I9o3Dif_SDxZ-f4ivgsA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190057



On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
> On 9/25/26 12:24 PM, Gaurav Kohli wrote:
>>
>>
>> On 9/25/2026 3:13 PM, Abel Vesa wrote:
>>> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>>>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>>>> Linux CPU critical trips trigger at 115 C. This can shut the system
>>>> down before firmware reaches the end of its mitigation range.
>>>>
>>>> Drop the critical trips from the CPU thermal zones and leave the hot
>>>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
>>>
>>> I thought that was the whole point of having the critical trips set to
>>> 115 C, so that the kernel can gracefully shut down before firmware cuts
>>> it off.
>>>
>>> What happens if CPU gets to 117 C and the critical trips are removed?
>>> How will firmware thermal mitigation handle it?
>>
>> Thanks Abel for review.
>>
>> For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
> 
> Does the hardware mitigation just pull the plug, or does it signal
> to the OS that it's about to? We absolutely need the OS to be aware,
> so that e.g. the filesystem will be synced.

Thanks Konrad for the review.

The OS is not notified before the final HW shutdown at 120 C. There is 
also no useful margin for a Linux critical trip here, firmware/HW 
mitigation starts at 115/117 C and hw shutdown is at 120.

So 115 C overlaps with firmware mitigation, while placing it higher is
too close to HW shutdown to be useful.

> 
> Konrad
> 
>>
>> So the CPU critical trips are removed and the firmware/hardware mitigation is left to handle those thresholds as critical is not helping here.

