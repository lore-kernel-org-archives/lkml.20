Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCE31F94F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788541; cv=none; b=FPUPlwroWc18UIlaZmVvzyZ1nWX81CZdOysze2F5c8DiU2btj+ehO+yUpN9fhUvjL19XDRrrQ5ZwjTwZOXtECWhVNSoe55vrsfRbgLnXvpw+GAwMGoKCMzWH1dRX/BHH22KsL13UM0YLEYijcIDYohnt886DAYzchCywhyf9IRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788541; c=relaxed/simple;
	bh=OJ2nSuJXLHtvguM4x8s4yuBBxhM6QHeu9C/RlN5tXCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqYq1hAh+ajgnE5usbqnAKtM7hpHEMdNY1jCQHxc1K44yANuy0ZKtgy5zuB82PbxAFpDREi8noJ6E9BMbx2e7uJMREQCrqQTd+3fX9nS+/dRwOpysWmlAl9clPCO4rTKEvlwUCuS0TEvGtn48Xk5lrRiuWLzWAG5JgEXVEUKd/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHCTT/wI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htQrDblL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHCTT/wI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htQrDblL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PU2d1786873
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEv15uB5jvzuscgRsBNdPogBjVh63pUDzUDDlAxN2FE=; b=RHCTT/wIHCQoWLAt
	WbYVYASEp8m2ZTgSyvx8+tvv1WYFPF+KQCnqbmtosUzmqwbNaMnNCZSVST3uXC/W
	GkoeINf75x7Ry4C7IekoixU1UVNbxXCz+vR5DZ3ph+y3Eo/nJsNicMbuzWe26W4J
	GOwySfP7u2xmRBZTkW1bPt/IlFKpUTxDlJTfZxwL4C9XeZqeWeFcXpyVzfEDrxD/
	8F1J31ZJj37zRnNJF7OO5P9Dm/GuX9zKiRUXHuIQs61rVYscPSQ1BFm9bFK6O53e
	bcwYuIIROe/l1fJ+UalcugYeX4+SpshpZdKlgxi34x1Xc0POFzQzQJPQ/RHTJvUY
	DASSow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rdqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:02:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so289801185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788538; x=1792393338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEv15uB5jvzuscgRsBNdPogBjVh63pUDzUDDlAxN2FE=;
        b=htQrDblLdk8WPmy+vrBF2aMQC6S5ciqDyyWyU5F93qXk0+ijO3jHe0PI4ddWsizosy
         QK7xFrZBaMoj0BajIcCgM2Ey+AjfxQtyWazuuARoxHRzSSwnbI1oxxMjob038jTrtByu
         QTl72x6NXBGDtMXyLRyFDVglIr02CTN37LfO2QHUenlklq5i4rBTYfjZ8OphKOmOVteB
         quOvj2XYkkLWUX7rKHYrBIZmkbhgWisarP0sNBDvMhiavGxSYaztAo5fM4/DBPDqdHWT
         sTZnj2YzuPAo/NmOmZFFXenshTIOBo3PPwyX5IUQGpokTix1sPXsAVP3thdAYQrCulG2
         LEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788538; x=1792393338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEv15uB5jvzuscgRsBNdPogBjVh63pUDzUDDlAxN2FE=;
        b=HXPnNTS52KRxJ+DuTwNAxuQKnsLLfVHoynpp9a70C+qUc6WavxiG0ZuccP9XEl1ov2
         aAJsUzbAr8M0f2cTvhzRnNnnIhp9l4Bw8RUWABRZdQwbpu5C9aV/cmE7Y2EfHp8Ve3f9
         MLMvKt/qrm8f276FzJrpJweOCbVCoe/tDQyJHY2NoMpi2kj6FcctrdBGWs/yG0TCr5jz
         F1/HznislrLeAbHozkVhKKkw9zAu6WOB6J8+HznA+68M0CNWEa6uTnG+KOLjnQTa9LRl
         3ATJ16v5DU7TXbpKlyrvbB6wKTjDp/ZEwt1+F1NbDw/69rBp/zN1TeTI2qA+bjnc61Ow
         1F3g==
X-Forwarded-Encrypted: i=1; AKwUvBy3HdbWx8ch5M7IKZi7kEGTQi/C1IU+3tYwMOwcz9PbvZ1DyZ9kh0Ahpw9+tnxMbTqdeRiUqUP3jwBU4Ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJITEdY+9+itzLQPJpyeZ2MXc0xBshGoYH8fjla609IWDYdVKoW
	flQwOQh3+9Gsv/hCy1EyT1G80AjEr5Yu+n5C5yhW8mCfEKC1cvnKJTKFHxJWR0pugW3YGKaTpu4
	RpoHaiQmIas5eVwdvd5l62qMczjH8a6i2ZsjFc3D1SWog8bF0lGLeM630KSys5n0WhBY=
X-Gm-Gg: AYBFou2+cHFEVod8RNTz0pqixz/nOSc3x/0OSxTY6z6EacODjVUlVnKboba47hqyMlH
	Xdd7Sb05c0//8IDVY5slb4fYwa4WLG36FFxDhtRaVVnlSjvmOaIlWquyhDxFWmRXLukejBBYlfr
	dpy+TyDzWrfwSaxbfOP/MT3+lKTOZV1hMiq4dEOc7jOc5ZWEWuxbo8wTvJqpu84YqEUb4o83B+L
	JAIj5G5S6hvRJ1XRvPXSepL+cfk7XKh0qb2Dng3Gvblg4OKs3QMduTWzuvsX37fyIEIVwYOHT0j
	YIq22ubXjYqDy92+rl96Ez3nfJJ1WHvPnVwHJu8L698p+gXIhuLLylF3Ch45ujVLdA0u9Phcqty
	T3uFW3WRPPD3HBaKNlsYRQZtdwaVxgcnRgr94Jqg=
X-Received: by 2002:a05:620a:170d:b0:936:e18d:763d with SMTP id af79cd13be357-93ebd0df184mr1544550185a.8.1791788538285;
        Mon, 12 Oct 2026 00:02:18 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:936:e18d:763d with SMTP id af79cd13be357-93ebd0df184mr1544547085a.8.1791788537811;
        Mon, 12 Oct 2026 00:02:17 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1a1feb78csm47273295e9.0.2026.10.12.00.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:02:16 -0700 (PDT)
Message-ID: <d5d4b8da-9b76-460c-8ea4-a93b78975865@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:02:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Enable the streams API on SC7280
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hitesh Patel <hitesh@ebytelogic.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260915121536.19207-2-hitesh@ebytelogic.com>
 <fcf04e15-d47c-4b42-a94b-077486cf634a@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <fcf04e15-d47c-4b42-a94b-077486cf634a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YMMqk7fft3IAacoEHhdBp7W3YgcHwV7M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX6ivZXYW42Jfv
 7+tHkCqqYSNP2uXyQ4y+W1KBF5wCLw92VaUQdjX3TyKSezV+Gw0p+dkGbFKz1UZ8+nxmNAG18O7
 N5rMPUq7VfvYu78g576EJbv2ewGssr0=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc85fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ZovgdgjKAAAA:8 a=rMNtKmAk1xC9TIrYJMcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-GUID: YMMqk7fft3IAacoEHhdBp7W3YgcHwV7M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX+iBhJ+bhG4p9
 qQijP1EWSBufsjxK/i//241ub3nVxHOYzqVBm7icmXjqekl98h5x+TH7WpMdQJyZnEFXEJgvREc
 Jk+s+3/sAA6TLxEXo+SjC1GAa3Ux+tdAzSseVYhElVYhpPrG06XP6kjPSGIZ5PXA4qwWmfR37Oj
 HNY2aW51RFZSmgFb+bBvr1q34I5I4obCOKwnS+suCZ8e9Rfi+n7BTzwF4d4ECSDKaEY8OsQ9x4T
 10Zc+WH49beAHW6PFFuymMX5f8By7nhTPTsXDGYUsJJ5ZBoGx4mbDmR0f2uVDy4nYBJZWhwQsz3
 w0qb33QvQosFArrzaukb29pDVxzhIpDWrLPS/RHPICvCMf7HCFWN75rl2vjt/JZyS2CHZ6Gexb8
 oc8CeeFLh1GlBukwT+YMT0LqAiBrB54ti+9kQLcgvWfhfO3FyzD6CJOQhLN8JwfUBbwL9BS9B20
 JA2FiGe3tHddEPc6g5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120027

Hi Bryan,

On 9/16/2026 11:08 AM, Bryan O'Donoghue wrote:
> On 15/09/2026 13:15, Hitesh Patel wrote:
>> Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
>> done for SM8250.
>>
>> Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
>> deserializer, one camera per CSI-2 port, so two independent pipelines
>> share the deserializer subdev: both cameras stream concurrently, and
>> each can be started and stopped repeatedly while the other keeps
>> streaming, without the WARN in call_s_stream() and without the second
>> pipeline tearing the first one down that the legacy s_stream path
>> produces. The CSID test pattern generator keeps working.
>>
>> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 0201debd4..2023c0df2 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>>   		.reg = { "csiphy0" },
>>   		.interrupt = { "csiphy0" },
>>   		.csiphy = {
>> +			.streams_enable = true,
> 
> Set it @ the SoC not for each csiphy and csid.

Yes it was review based on the patchset, i am still working on incorporating review comments new version
will be posted soon.

~Gjorgji

> 
> ---
> bod

