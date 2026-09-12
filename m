Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17F3890FC
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246684; cv=none; b=ZUJEuj6kZq26oLLRDBFAk/ohjB37qO7xV5fIA73KnACN0v9MzaG669pLnBm9PdEKzcTHP668/rXjuIx9ggMitnb2CnvduXrgGUoCqtSUZ/uu6K7dxGKmyZwNDtZoulhLqWPzWAPRVOwFXqLkWTZA8RWSeNwAeMTsFwJfJ0Nz3Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246684; c=relaxed/simple;
	bh=yDv4E3nFxbJNVOjCwEv/RLNS+1uCzdQdmOulZITXdgw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YFFZotcc8sIPGBw23dhonv40cwT9EKQnnOAGNltkkQlkmXekP98j3vvB8yAQIICW6t2MdDvlShQ5fnVtO92RXISTjDBMm/XBkLXcwxsnVgzUt7XXBDSkSg+c2WYZFlOVSf50qyHQaBxayvsI10VYfgk383JPjA2gx4rFl58pyA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MhX5Xfkv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlVTZksg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhX5Xfkv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlVTZksg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI4Ztf3572503
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=; b=MhX5Xfkvk4ZQQ6g/
	KiLgU3Jnhik938QvC1TZcJUQhVGx6Aec/nDosu5TSQWGdLPmXg4d63G4TR0PmiUF
	Cin4AjgXj98K2DrMkrfKHuCE6o2gOht947UIjAP1hMdXbl1RLi/8b9ann2dnAhzG
	m+SvtDCZ2l4qwm9wlEMPk/KUohnbnKkXD2is9ZubQaMn9mvYmol/ac09N17MmOqO
	lZSrY5rDMmh3K9frCbkPHNQsghwuQZtv1W3/nFzH1+CPRd4qYq1OL1hdQXhNSqpY
	V1bxrT8hGN/BAp5Ogx2He0gf+OpcWXPo0rk+RKd94Vh0up+LukwzO+9PqVlO1EKI
	cofpHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d9vgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:58:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so370344885a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246681; x=1789851481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=WlVTZksg07BOHIjOFdzxKSONQrcKoGB4OmmHAymQ9WFZCzmH42F19Ii+18WqksLHeO
         mt/kXfcHHRbc6ZdkXU/0QD7MTB65Nyj5aE5SLurAAcnaYYA+GEAlKp101nXxViB9MYHB
         zLrHWO8akXK+Vcua3guFMNjbKTk96e+gKU8egWCpo2USORp2FpDiDkGHMr2sWnoaNwsh
         38BfEnqUd7CNk6WOxEHLDm0c1wwWPh1ZZbvM/6TqiYS8ky2Jxc5TU8olWg30PuLGgJbW
         EOVeiGAJky76/2UyLUkx2xWPCPA24xLeTpUVrsdmXreFbtL9UdS4My/hqu6ZYtVngfoN
         LJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246681; x=1789851481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=fQ8qZqI0NbKv7cfctpy3JoQI3PTjnXwUvRqFxFZPeo1glUAtbHQVAHDVogEzVtk76r
         IfgYjlZSQxousLWTla6aXW0po11X9CcjonU7G1q0whBR3ZI2R+E+sgsa0mirnlpTDRom
         sKV6LncCWqrmyM9Whrda88UMHoDfQfayuQUPClXNIPyK/+1n91nYFw+I5ztqTXf9G8hM
         ktuHTc3n9+2Y108CZwRJO4eafvpEEJweHqyUe+80UpN6Qriu1Plrur+awWT6cTTJ4D/3
         foyc+toGu/qtal1fgbfv6cGATERppLIZS/PwfV8rW/AG97RU1AlpcgfOD3h1fPJC4/Ic
         1UtA==
X-Forwarded-Encrypted: i=1; AKwUvByKiPEuyTMugfW8NuS0nkEr1u4qkyslZ2j472EyHFolUBUFEEnZnUrZuA0lNg34oKOIrHueb+KGnsUlIkc=@vger.kernel.org
X-Gm-Message-State: AFuF++kquiLWDAWE7uj+SJctG2kZmdS0gAt8jkA4BuwFiTWX+QU5i781
	2lIhhc10q0Ksvj4WZsvvkzucDQ9iIIunnxuvoteN0fNH/5C3wPsHT1xXVgWtTg0oRGcW14FmVjd
	IaCoiAmout9kwm1MmgpwBMgGFvhbqyt+y4sNv16oWBCd/PD5LJkHf1DVeF6w7zjXz8u4=
X-Gm-Gg: AYBFou276vuQ/GVJsYu4VQKrelRI5FaiRQkc4Nixm7PRqBj/xAt9GlMnGsxwGduyYSb
	4yQD2XJ3HCKJOfWqSHFinRpQkHlmw5RLlRQBso9dSF4MFYdsyG1XrcDw7K/1Y8VbN2XAgJtbyPf
	5HFS3XJSJvBiLP+MZ9OklZDDja5SCsmBE0vwrlIKWuiEk1RC9wcbHhAWKdGNLQuUzZeUAjqgj3F
	6PNAJ4uRolXL8EOFc8w1fzSqLllnVEpm8R5myHsq/ueCOeE20WawhMY9iiUfZ8VaxnHJ96BLA1o
	qy9cJ3e8Bf3SOtQTd30/kBsXZZfJXmxmF8uasCiBhIJq7CvR0qjZhVrXWfCNJAaRqYQcuLXIYN/
	KyjkQKST/uTOIf5FieA5CnfvC4kg4WCo1eM7Mq4k/Xg3sbBrT6quEUoxdnaG4IX7W3hgJYplYqr
	roY8sLVhu66FBwPGXsyEqRz0f+LCgmPTc9D0tSEWRqrzi4M3jV01QpP8jv1lIbg4FwaNc=
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411256585a.12.1789246680664;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411253885a.12.1789246680244;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59644f2sm1993071a12.29.2026.09.12.13.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 13:57:58 -0700 (PDT)
Message-ID: <a7f109e5-50fb-45ab-bf8f-c674d9e8fb3b@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 22:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
 <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Language: en-US, nl
In-Reply-To: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX4262n047PEEt
 z7MPIAB1RNhvK6onVfTk9jFEuhR0cOrKtedFSNYz3IsmV5urSXHC+Jn0p0yaqmIIWCqWgdRvD+u
 zEai75PDbsslajYBA0EZQH+7CrIwjEGi/wX2IMgnDMwII5DFbrcC5LxRwbDa+QlJ3a1tknGgbyU
 haqEIfwom+Qr3t9LuGrP7qTxrnNJQDjfEOQaM5SPxrDy9MZjZbsGIbREBCpZ7ga3U/HYPgEP0ms
 4nidsACAeatHAWl6GbklYxogfGAieOP2rrleJJGrJUA0FDWwHZGsyx0BasFA4983xYXAlkTeEJ0
 pUzU+Kx/Ja+tBWNK3GMAsChvgj0RRXb91mlLvNjCc6zjD0mOnf/C3QLOQKKPTd24ISHlnedyloB
 Xf217CDhqS0NX25BzD1xGtfwlQqTjI41vcTIhvIZ+Glo0UkG6ouW4N8xCeHc/ORSUMe/CuenjKh
 ipxARy7gSdrdM+oSIVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX7FgHo5CFfzw2
 ug3dumQB2UVOUIAHF2a+kKDyO3FWqjknIwmiR1H1oVVs+qDWrtePDn7+Q6FZe4CqFLBuXSPryf4
 AhdqLkfUJ1+VXUHS3PDIU/lYBHlsJWw=
X-Proofpoint-GUID: E8HlfqIOmz5Q0OfJQjUTpVO2296G0RpA
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa5bcd9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ePD8OZhNOdW2f7jq964A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: E8HlfqIOmz5Q0OfJQjUTpVO2296G0RpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120305

Hi,

On 12-Sep-26 22:50, Abel Vesa wrote:
> On 26-09-11 17:23:27, Hans de Goede wrote:
>> scmi_protocol_table_register() stops at the first failure to request
>> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
>> previously successfully requested device-ids in place.
>>
>> Unrequest any successfully requested device-ids on error to fix this.
>>
>> The code manually unrequests these rather then calling
>> scmi_protocol_table_unregister() because one way this can fail is because
>> of duplicate device-ids and in that case the original device-id must not
>> be unrequested.
>>
>> This also moves scmi_protocol_table_register() to below
>> scmi_protocol_device_unrequest() since it now calls that local function.
>>
>> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> This was already done by the commit:
> 
> 2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")

Thank you for pointing that out, this can be dropped from the set then.

I believe the other 3 should still apply cleanly with that dropped.

Regards,

Hans

