Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5243822B1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749891; cv=none; b=H06n2DQnM1Oz+zUGhxy9K6ldfxXc9ldmiSdYxxJ3Qcp3IQvOuzm/0XSFTugkKcaoqHSooBJ7Kde8jfAzZffVqfIh/X6BfWiYyJ/d5IR+zlAdVQJZ1Z0/rwxl76m1jZPuAa0C1nv+AS49LhBgDTUfj6NoazkVfe3qtOL79f57jpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749891; c=relaxed/simple;
	bh=ATYlLON9+41qrpEt1kq+/boPdshZPBXjRgOd3SdnoN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mc282mdnwrzKBeQSYSp8AXV4E+fj/YhmKbZVZSwyWb2GqjprhAcw5sU5XvqtJhgRnpLfPdpNtph5loxAwoQYlHgev2RyT2e/0P0yWNrYFRFbeVRCZRHQyuBFbrqrBFzLf7gAPf7tyMbyymZKS8l6mUQKEqaURoRvq2OGWxTvTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4GmvjPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ak0ESWzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4GmvjPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ak0ESWzA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC4Bk356880
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLoKBN/hoCc/SGUUxif+dFrKboRcx8sziXZKGnHtGCg=; b=W4GmvjPA4yV0WT+v
	uXSsbWJ9F/u5gWOY33QnERBJj8221QvIWAhwZQ4L2tQDF5ePMxSq1/WpyWznAXuq
	3nGH3g8Ib44Yr44ROiFMCodKTjtqy5jMEb/CtYGYTLom8iQl5N/dclFjToEEDMX4
	7gN1DUEJZ/fNhSKRVgoTN0qA0Ed2wNTfnPDnW5GfIHtfV6Q9icx+38IpMn/jmAXr
	VjVObsSZomOJD1TmvJ4sS6iHwHh++/DprmtB4vVNkqIeTqPmE+Yao4dOvlqfdmXG
	zNTG3FGPkQ/duY1e5g3+Hl3GouEhhY+bOf8xYdvG3dDTVnlVxouUjzwsE5lCnc9S
	9ooSeA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9xre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:11:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c65904ade8so30774e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749888; x=1788354688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLoKBN/hoCc/SGUUxif+dFrKboRcx8sziXZKGnHtGCg=;
        b=Ak0ESWzAwM7n7xe0ylw8zv3Hn3qwlRlWTjd7TEDhxIkQNkWAyAsxR3KDw5BvbpCu/l
         1ZJliigdaP+c88jZpXnLnRWFD3N+Hyyuxbn9VxE9vlzL6PICwpHTChSoLSFtMmAfHyMB
         j7td2HEWprLVPo1ufcgZga0/qSXMtljbP9dDTbZBnXFAnkO4p7WLNDXF5zwAT7tiUTqH
         VU5SfGr4roXIpsVy6+KQ5r6/QfI5JBzx3vEplM/bvKdvdGGb/wchPqXw4MkSfNDTDmRc
         YZ9hiySoWkrgZ3iMIfcuip09R0mhpgh6GxRvpR28WkwQ/qvk8NqjZ4Pgpqo/f784EkEE
         JZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749888; x=1788354688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLoKBN/hoCc/SGUUxif+dFrKboRcx8sziXZKGnHtGCg=;
        b=Zd+W67xe2j82o1njtuiGTBYKGBDPh1fO9pGYkrseEnKGEmhHUbLqQiEJbhfGOaSGHl
         c+WWtRkAks/I2l8rwZPKRRUAUt/Pxu1Zc117CCpWoTTnqC/bVTOblZl+MmXXYHgbuLN/
         egCCwSTW+j6AeCBwD+0yC6Ba26vu6Dbk8ScWreqhU+oNApp9s/59BKdyiRbPajPJune6
         QjZAAiBqZuiuR0CigCNbucFGldoptkFA89bOa361hQpLEqzSzs+3gnc5+eAFoBqjFhCj
         7W/hUjs9Ot1aB+HbVukRbeH96ipFa+T0Wu+3SWTLwb5nQUjjOifdHK1i3/KimzuCDRpi
         i3zw==
X-Forwarded-Encrypted: i=1; AHgh+RpR8XM3F+oFX1TnVEioNnQ5HQny1S6urXl+6OrweTivMWmz4h0MKCO6Et+qUGSvmJk6MahWB13Q4SbECRY=@vger.kernel.org
X-Gm-Message-State: AFuF++mDejgU7jAh0sTrOiW04imvAHKXB5iYYLYCVtXQHI3QzqvrtBEv
	aHseKyzDMAzgfXp41IzS7kv74I2flNXKvt6Q1XxGTddhyNriK0bpbzvCOicnkGVh0lBpKs2a4fn
	dIWgBmzPGUkEk2+cm7bNYBejLyDXF3lg10kDi08Vm2SahnnLTArOtEpwr0R+tTxBtM0g=
X-Gm-Gg: AR+sD126L/l0SPreUh4jA7lLiqAAtOC1dabB3E/EcrOy1iEqeoeRNbexbQ3B9MCfZo5
	oaaHICPAnV9C1vKTkulXVcm3FS8cyC9CGPZecvhkAlY7FxN18BacdBuSfyjM7WEMlPYH/aOvzC3
	RqdPlYo0HsnQmjXX/d1mfgDU3AAYuWjNAROxQjFjFc9r9CTEtXk8BpkZkkk7itwy7guJQRBc7Q4
	dhdi/2tIha5o3MOUDRYJkwZpArmcxy2Obi+KJdTHXuhZXljIg3AEOsRMfIz3CzWyAdoXoYuDwXW
	w0/JuW5DzgQMU5kUcAH5WOVKsg4TBSXSHY0y7/f52qzCNEkeNxh1CLPLJkK5gHnCr9Hlaabd8/O
	YHdrrLOUmqJCB4gUfhOIWnH8g
X-Received: by 2002:a05:6102:c03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-782c15036c3mr955832137.2.1787749887772;
        Wed, 26 Aug 2026 06:11:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-782c15036c3mr955818137.2.1787749887215;
        Wed, 26 Aug 2026 06:11:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88a928sm529427266b.33.2026.08.26.06.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:11:26 -0700 (PDT)
Message-ID: <cd8cdc7d-30fe-4745-aada-3e0f7db528a0@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:11:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: support Glymur DRAM info
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
 <cd434320-4bb4-4937-aa75-6f0dd081049a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd434320-4bb4-4937-aa75-6f0dd081049a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tSn94r6_sQXEEypptsYlD449G_UuC-Ob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXyLdjqVWdvepz
 tlgRAZtcgxJCoZQ3JkscJ4eP0rpPt0lUKrS0WfZ+pgAy3tm7tk653ntGsrbrMgxLHDCR1m6twwO
 7NN05SZNji7CauNcslVTvg0k/5luaDbavRXxxV/5z5eGnktW/UFXC0+pgOQ9QK7GYq40Z8WyIhL
 lnwRpIbK4QlgS3k6k2EpVVLTka5PDr4LbZxDNUSgYbjgy28ARRZj3wEaHBnUEM+skAcwXW0P7Mo
 bddIIuYo6s48aKXY6iPyG05jTunn9QogEXugDvTfZzyy0hWHfBFHC9vqjxpo+x77UIBMzWzjOt2
 E5BfQ9RXyWeiFm1PX0/XW3JCfPV6l+GzY+Q70/B9z3dMMGskxAgNudHdwCGmz7Mimn+s3Osngm8
 TE6ELtNe322Lue499VrYnEBwxTUAC9hGS1w+7tLnCCmDRD6w2Qxr2eV/q6uArQLxlftoszCsu4e
 6EJQEoQy8rZaxBxGbVQ==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ee600 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7917o2VdScDyYRt2bNEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX78ZAQh8b1duy
 b984ETEwL8dJtAbxeACUP/qV/HA4h34dZKKxzv0axftU231f1uiij+iFKSxZI6ggxIq+3ywma8B
 tQgCTCLO1IfVXujY3YC0hWQqYLMSnq8=
X-Proofpoint-ORIG-GUID: tSn94r6_sQXEEypptsYlD449G_UuC-Ob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260108

On 8/25/26 12:24 PM, Gopikrishna Garmidi wrote:
> 
> 
> On 8/20/2026 10:00 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Glymur firmware provides a version 7 DDR-info SMEM entry whose 872-byte
>> layout is different from the one the driver supports today.
>>
>> The data contains 16 channel descriptors, 14 DDR frequency slots, four
>> 4 DDR region slots, a 10-entry SHUB frequency plan, and v6 misc information.
>> It accounts for 616 bytes; the captured SMEM entry has a further 256
>> zero bytes.

[...]

> I can send the overflow fix as a separate patch, or you can fold it in —whichever you prefer.

Please send it and thanks for spotting it!

Konrad
