Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8A37E5EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876452; cv=none; b=p7s6SUa5GYXEIRGo1wSbpoSlnaLSRRN34VtudMd7/LS3swYvofaDc7Z4TwNKOeRuauE4g592MQdF90nckjnQP6v/7bf1/4X3PD94Y63B9nF5cO+e5H0YPs0fjbDvL/wQ8Og39jxVR99mEoU2x5YLI+zUinM+FaBmdGGnY30hyWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876452; c=relaxed/simple;
	bh=HNtZ6WxqkhhZxZcY0QGx+aYFkBcRDuHhTkZVnERgxgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCjocVwcBxH+U4cjKFy+5gVLhZQVomFtbIMgQ/3Wx+9b6AOrkr0/qj5ZHgYfSf0kFkIPPNxjbuBkeYU1rZSTh3oz/O18Tx5pvEDwmeb1YbbD300BPJnuM33U4/XwGq5OtsfeM3T0JqVeINmlSzUBrEeDkoCOSlsK+JAWdy7Q6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVEOvMuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIvSEmaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVEOvMuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIvSEmaL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20mi4302833
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=; b=gVEOvMuJ29Cd8Tk8
	E5fUCLBmjwGvP9eU7uoGzTempBz9i2mM6p0m4Uylu0RyfK1u7JiOpFhl7oD15R53
	vV+eCkljybWYkfQQ9cFhdj/SMO1mu0oiUqOWr2cNK/HytSaovAYl/Rr0qALmOY7M
	eYW4oe05hKpSvZ4B5PN70nhyFSeBkZ6aOOWeFm+jXrk7YycsYyRuEXS44IrU7/Zn
	02uY9OWZy5iVEfmQ6Bnol8fvVNaanVP0eeAGF4v/x+e0e/QibwCWAQNYe3Y5uDqU
	iFE/KIGxwzpslCoSkdszLbPJM+2dWuyNuzRxHPO/omGfk/43KNxscIR9k5XmCkQ0
	sLGMwQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9kw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:27:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so1728434a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876448; x=1792481248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=;
        b=YIvSEmaLNRp73hhjXl2Fv9SWKIPW8s15uRgJltamM/WQmMLido2+JfgG4iSQ2Yylul
         uGCcXrFrReTdNH/veEjx3DWMFt917Vb5+ARonNR+MkhH3EsKnec8a2HEGMgRqYBWJxd/
         NUY91b1xNCmc8vvk5Xkm+GE/hXUImFaPpCG+2qEsdkNZoGc62bTKqKPCvusv0l6ytozX
         69Bxex4X2tvQrSAIUDFPpegMM/ENYuabSQ2yoCk1BOZmZQ6CLzsZEEzShOQcj8yBOT5O
         spount2ZzC9uEBshWJvgIViSYZU1hOlPnwCYRMDts893lRf9Hm5vXUvbHt9QJ/fUd92S
         Dc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876448; x=1792481248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=;
        b=kRA3O/zhGzX2JiRVEKKsvExHXKfEJCdy/cP1lDAfAYkrix0icOeoctLR8LuE3aJ0um
         mtF/rsyFJoRJMK4Hhh+TV7Qi7R4+RThlYzD/AlF/wArHS4nt89CEiYh4Y5BNm9GGwXJM
         DbrpNsgEAjERHm6uREzzw39L4qaet0NxAyVGoQON97AiXDyaj7choR/PYE1FrvfW40KZ
         nahu16yOnC52Z4BTz81vXFg4MxgrAcjSoJeW0zq/idLFjldxPbn9Fv1/9BUgNL/Vvo7l
         bmsfGOyUjARFzcOg/FUq5LeyMix7Rm0NMqhH5fD4v9mbR2mNVTcSwqTlS4dWfk+Q5CW+
         vkRA==
X-Forwarded-Encrypted: i=1; AKwUvBxkqpuF2MwyyZp1CZg6BFj1+E5b1apTZqMaCi6kv3e+kAGa3GFVs9lllXvwP/btURw8+2OtopCXSOv3nbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHw42z70Q6YHS3yMA9ZYBNJ2vmZRMjwOib6k591Wn75K0aBzIg
	Sb1YbUndB84xzt6frhfsd5KHqPcYM3t0ggkvSMK2V8e9J+QCG9/Urtdt08fzHywg5aMGgmvtG3M
	WaPAVMPYKWdGF7pqWpTT0QWxucVXKSWaKEsfE8umr0SXxTF3mnwqcmz8NEnauQsbYI/c=
X-Gm-Gg: AYBFou2NKw4hxJwesiUbKXjo/gCCsabF7KDBzJ/D8FtEQY12wa4TLIwh6hj9x0Z67yd
	afHs+nqpk3IjrTVKGD9YexJAqIWMgkkQwrDyxH2D0P9pDOQnjkQ5WHNKOWMSjkMlkkiHV6xoTFe
	HbNmzheX7D8+jZZKPQarLt/T1LBNDoNSaAtwJZf+IQnwAGeYneD/QYhFU+Ev3qgv/dzWQuzkfq5
	XF7/6sayaHaZlmgZGsTkqbS18lEZa/c1IdiYUzDPpGth2R/g9RBG5fynxpUmSxYQT2qIrlKpq/q
	REC8EUlTKmZ1jWiAmG8It3koG0iBdAta//40PafsyyaLq2ftXR6m7y/MrsUNacD5tDR57CMwoB3
	w7xbgb2Xb4J1gR+CC/B7WY6btHvvJpwA=
X-Received: by 2002:a05:6a21:a02:b0:3de:5ce4:9e72 with SMTP id adf61e73a8af0-3e16c07d2c3mr9113728637.56.1791876448556;
        Tue, 13 Oct 2026 00:27:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:a02:b0:3de:5ce4:9e72 with SMTP id adf61e73a8af0-3e16c07d2c3mr9113720637.56.1791876448142;
        Tue, 13 Oct 2026 00:27:28 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da05caaesm5050788a12.32.2026.10.13.00.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:27:27 -0700 (PDT)
Message-ID: <122f5f0b-6314-4b12-b9dc-8f983c9b5698@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:57:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
 <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
 <as1F08YNeWz_1bre@monoceros>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <as1F08YNeWz_1bre@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfXwh+P8pz8F9hI
 8ArKb+bAiLOckYXR/V+rnjjAKrqjm5q+h4/1zG01K5xdV7t1ma4nxoK3xP9IePmnicoBpdWfuW6
 Pw/z7HwnvYizbuKK5KdsmgrAP7QbCs6EPyb94zERz35+19Uut0fmCVBXdsKwXm9zArMCJpZHCP9
 5vbMzxIFfsDMbX5FZhjB3yhxx7VDGyFY7iFee3Mw7sjObdUVWU5UEKxb1ITxNzAwMJLg/Qi6jq3
 41PcgOpbKPATzYIkrN+3V8wDcVWFFvh6/h+7X3Ji7TcRisMlI+TC7/jVbCVY4LIrFdObUt+Xgaf
 QCQRzlnaKgyFepUUytpszvrSWKGbkWCShzH2d5Xf2TBf8g1IeVNiAt55NMdrYnty4O7MOISNuGv
 lM9qWf7T8oKymxJudvBy2DSJ6C5Iomm1REfdNr7wNJsIpvBup+kt6BPaneMHb0NYvBxyVkG+E0C
 iJ5Ft/ab4s4Xx0vxYlg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acddd61 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qh2oGK4qJ8XON0oEHbUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX0HLz05IsS/Cu
 KNxwqimPiZBGV7EUGFGBJ2JCQzyVvYq/6xGa8a+HwrQs8VI5UEIHAQsdap+MCTWcH/KBQ6DiyQK
 gTWrTD/5u7tpsZlOPm4mV97SodWqU8E=
X-Proofpoint-ORIG-GUID: 9udX4xhRO0HNfGGpjc3TkgEkhNjMzvxY
X-Proofpoint-GUID: 9udX4xhRO0HNfGGpjc3TkgEkhNjMzvxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029


On 10/13/2026 2:13 AM, Uwe Kleine-König wrote:
> On Mon, Oct 12, 2026 at 11:48:00PM +0530, Kishore Batta wrote:
>>   #include <linux/devcoredump.h>
>>   #include <linux/firmware.h>
>>   #include <linux/limits.h>
>>   #include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
> Why? There isn't even a (new) usage of any *_device_id. There is a
> mhi_device_id, please rely on linux/mhi.h to provide that. The main
> effect of including linux/mod_devicetable.h is that the driver grows
> many unneeded dependencies, so don't.
>
> Best regards
> Uwe


ACK. I will remove the redundant mod_devicetable.h include in the v9 
version.

