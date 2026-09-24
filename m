Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60824423E8A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234910; cv=none; b=SO0lR5kyDQzykT3EEBIFWDLos+Zeq/rTQgNCTDiFROcGtbCHhz5VC70nmt/LOmoQXw444QT1DgRfL8egkaYp26IQopjVpUgnNAVgQUUpaA0RHjlN21bi5tq8m1n/kcKZKjb9+yI915Nmb1K/b/m+n0H1z5rFvzVvg4xcoVajZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234910; c=relaxed/simple;
	bh=biulYIRJvwcStkX87PxbCl0EBUs0lCGN/+7mcJHOmJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aC8am/chrQzhfW8xDrHLCDvYMjQ183Cxyv4DxFeDpwMfvz0D2KPHcRCOcac4tND6TvGYhYt4CxuuYKmaP6VghlSyHvVJRWPAXMiSmCIknowmFyHUr6qq0ZAxUA0tS8etvGtCFI8QY+bs4svfTI5CfC5HSfB6zGdVLJMNS66OFnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB0bm5dA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV0LXHJo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hB0bm5dA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FV0LXHJo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eJcm582429
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBrrhxW7NP3MVSnZIE5UX6bV9qp/YUbwOV2BYZYignE=; b=hB0bm5dAeECuZt6c
	ZdnpMkZL7F7Wq34QtC7roBAWc07Tp5TasUDQn+u4hx6tybr8Ie8XIwkmQFQXN3NX
	2ys1410nLKVva/cbYVhhW3KEFyz9U+T0uIIXatLIfLTXVrt8kp24Dk1NU3v0sMZ9
	6WVxJhgVRx/cEOXd7w2GWG7A5PPDxSRKdajIfDMIw4Gs2mSj/KiC/V4IiKGE6XwE
	sdmn3i4mYLr4L60obHU/Dop7VryqGFRsbTGki7trD3qBHTaN7myXi1Z8ohMQPceu
	ZOmH6HlQBOjUsp/5uPUYBQJDgHxHIE4jIKltGgIyefiB2edBhgGoSye1bp/JNvUw
	SPJADg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkvmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:28:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so23370985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790234906; x=1790839706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBrrhxW7NP3MVSnZIE5UX6bV9qp/YUbwOV2BYZYignE=;
        b=FV0LXHJotuoU2n+NZHEbAWqnSsoFwCO5bpQzbp1LQWCKAcrpNM6vRF+cmQXoyRXLPP
         bpTsTIkOCu0Ov+MVwZY7C/LCeJsqtgVq6ioMtU3J0SJ4bZ/lssU5Vm6jn2Jt2rfDpeTo
         7HlgjTx+Fu/fNqyDWvWjBkr3HfuQz7teJhNCsxdM9wHx5T/VrHvUnyo7DerECbzONz6D
         VK9WhHe5Z1Qk9Y2lvOko4uFnIm1HC0Q19hW62Ms8SpwQxNpOtRVV3VQSbKAgdW51DJMt
         lB5E1sXWyDYeK/sWT7trP88W2pR/SiTJ/Vgn+IAK9pCz+aa8qaZjAIhv62Ocdsn0TJVT
         mq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234906; x=1790839706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBrrhxW7NP3MVSnZIE5UX6bV9qp/YUbwOV2BYZYignE=;
        b=I0GJuKoaF9gpfmQJ2LphYkjPnmWEMuNfOM5W5+EKfMP4IHtaOTFVZM4LDq6cp3IHgt
         zYwqJalc8spkQp2HzDL/b3awh+ZJf0aheIGqHXkCLHI4CBg7uDMFt3JnoIauBm5Yf0cv
         t4NH87Ilj5RmI0ueQ3KSIlPb2F0z7Y3klhitpKyYJibYNp8VonFbBH8RlK6+av8/g09O
         IIwZ/j+u1Jf/sjIQrjYVF8QWJ2qAjK8fjn7jZWfX/V9Jug7r7xHYr/uwQvY+rRYU47Kx
         25L3gvlXXyShCPPndtjK6dvmdkXC9SQTRLfTZWNL7D0xwvzmwfDXFzsfSfGyuRWTMr3t
         WmVw==
X-Forwarded-Encrypted: i=1; AKwUvByzadUPjcn2KJL4PFjxl5aKZPc525Hgl3Ew8w17zj1YS/aAaUsH7BQZiBbCy2olAEWUynP8ToDAysEQXCU=@vger.kernel.org
X-Gm-Message-State: AFuF++nvV8jJgXN1qJKbdOsVcORlSkywBMm4PZGeWb239piwedvLbRKj
	SAhjXzXpVy41+3CioA//JcmPQUoKegmBPhCtlDT/nsWT1v1DY/3bdG94Sfvcf0QYUj/EovT80Gl
	S6wU1/G3DqqiJw52VKqxO2Fxcy8qwAsSnFFOwgFji5/VSsLa86WUWIUyJRyMmqwYYmYs=
X-Gm-Gg: AYBFou3RMCTVnVmg6FEQ4332aV17k+5woFgrCoowFfKOfsCqhXeIf7Ee8YdjwXxjKwR
	jW1RrJkZ8H/+8LVoY3mjj9ggbn72PKRljKGa8iU+Usf3NkkUauYY8gIIKMW+eNhCHmXyAd0thCX
	7xaOpNXmLxeThTY/o/vDHhsNZyqF+Gr+VGgYEkGwqa2CeFxrs3jdqT9OLkTplBM0A+6lyp9XP9K
	sMmZSL96zSFEtpTDCiivoOJvs6RS6v3MQ1ClatXcF0jiyEw+x6+vpvz1So8nmfdrznZgLdwAZcf
	coQRqc07TcXRg7yPcnnr7Hwaj7tl9tyZS0Kzfxe6KLgKA3xR6mPdUwBCTcpLZYqqzW0OqkE2npz
	MPhWfm8aQNVAq2wUOj06HRw==
X-Received: by 2002:a05:620a:271c:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c362cb26bmr153252485a.2.1790234906214;
        Thu, 24 Sep 2026 00:28:26 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c362cb26bmr153250585a.2.1790234905743;
        Thu, 24 Sep 2026 00:28:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae645129sm242676866b.34.2026.09.24.00.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:28:24 -0700 (PDT)
Message-ID: <8157618a-7b8b-4c2e-871b-5bd3f5ec17c3@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 09:28:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
 <20260922-maili-socinfo-v1-1-a82bd7d4ca77@oss.qualcomm.com>
 <839c556c-a322-4e1d-b68c-84d404f435ad@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <839c556c-a322-4e1d-b68c-84d404f435ad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX0fQh4Do1seqt
 Ab0mA8mioJRRFLAj1iMCMIznEVZzJYgeSh1aKOjy9VXoAteHA8V5ZiKxIj+rY6+Hiijd05z6Z+a
 83lVJTpnCd3frnkQcSrk9uMpJGf2EMumYzGnttj0PSX0QfhpR1TNyEArG7iql49Vmu3BqvWjBG8
 9q3FEWDMxpsbnF/45ZH08wUneQNdnARkuE41p3olAtu7r7QXst9dg0M9+wTEGzj4o6M4j9DJEcz
 s4+QkvMNH14LxOXmUSQnwW2kwf5w9pp6k1rdebyDwIFifMxnR/cMRsoxP7S8JEcDoRnaZNq7wqL
 sUffcmW+v3SXzO7/aiLHUBtb+lx4FSZvizzA/GJmiZU+FJCDpb4KOnu1orZiS+G781/K/id38O0
 JwNlxzEsnFOAlx0CZUeAvV6pYA8oCtdNvIOeLnYXkLOW024D3Agg7IZpM5FZTlxMXOmpu0kH036
 CdCaMOqgrzV99ylKjLg==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4d11a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=F74OYUcYB-Hb6iXyO28A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX0nmE1DszUhhQ
 o5vnCWm2eRKqgUEesPTdqwKq0EIWngRt8LOE5ioL0uXORKy+KE9U1B/HZCSr9im9jKlM+hHMI3Z
 FIFkwFUbShwLDgnwXMQD83gafXMQROY=
X-Proofpoint-ORIG-GUID: P4wmCHkeS7bvTE0SwQwT_gP4Pnrfe1LD
X-Proofpoint-GUID: P4wmCHkeS7bvTE0SwQwT_gP4Pnrfe1LD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240031

On 9/23/26 9:06 AM, Krzysztof Kozlowski wrote:
> On 23/09/2026 01:06, Jingyi Wang wrote:
>> Add the ID for the Qualcomm SM8950 SoC which represents the Maili
>> platform.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/arm/qcom,ids.h | 1 +
> 
> 
> Standard question: where is DTS? Why is this sent separately from the
> rest of the patches targeting the same subsystem? Please organize entire
> work targeting maintainers in relevant patchsets.

I see no reason for the grumpiness here, this is perfectly okay in
my books

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
