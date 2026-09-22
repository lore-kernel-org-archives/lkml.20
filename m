Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F774A263A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104605; cv=none; b=UY1Mktq93KL1GFmiYK0wgtPUZYWWD4yf9qpJWtBq1sIGLcu87/khLXFEO9quA4QT5px8d/6CBXIjZ8GjprGdxBuQ90Uyj0mF1RYhzErPIFMUySlRggKTLB9N1Y6m4QyxupVxIEPrgliBZGFWcQ+QVNLsoYUV4jCKLc+ngSvAMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104605; c=relaxed/simple;
	bh=J/1lIjFGeiNqfLjljJDLTbZDhxthd7iJm+KP8BBIn10=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uYfD++s+HqZjXYXv3bWFqEhY1CUjN3TQl8Ab6Xe3+Mlu+sqk+51ucTV8Qw3ld7tsJ18vM9XqrOuZXhJV4GwTIJoiTvN/cVf8SnYtcNxpjySmTrpeJ/LygUwEPQunhxxYL4G2pInD46H1dzsdMN20YXSENINAXYfst9FYX8rF7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1ADCi8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+D/fczp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1ADCi8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+D/fczp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJCtCN1166677
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=; b=G1ADCi8kpSlVZNY/
	wy4USVl13QGfszXumugmn4e6Gr7BjqN8TZmtIYSK8IE7EuVVBV9A0Yv3rc40jtYS
	26xcDOhoXXf6ygzoy6/iNma0NlKVst7wSvXHgAjP/RLh4l7EZLKscHh6/o8pQrYU
	bUlYXtiH7C3H4nZGe6kJZ3WNtTyvi4Kwd7sz7MD2cD/ej8nBjr8cbPOqbZa5EBTo
	Haz7C3JHMUQkhkIiUBaYxHEueu3J8m4Mftqm0fHUek26gNBjkL2y6jhz7KTBQMlV
	wdX7bvcJthgfO9pXlh1/wJzdDR/OQ87+gLpEqZdOMtD7p/J60DFWIwVudAGFhr18
	RkwEbQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw00j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:16:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so195371c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790104602; x=1790709402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=W+D/fczpWgLG5ZyoS0+C2wQjM19KbDmTB8Y8MCGURKXjsoASRmqI79DDqpZcJi8pVR
         77x6/vOt5/46G402u23QlhZ4p68qabD4SikUcdISVuNrSjvd4jXFZzx3QClmg7yRGzj4
         eUxwEBBDOJuO2yvWU6ArbINaCJpG7ffnjr/KIYAYnYsrWFeo/xTa/ZE/AuATN/DKu2hr
         r9rFDxEGXtyt2voq/gWmDF99mB10E3F8aVn6vGQyvayRv5Lmu0Ft5rUkg12AMSNdOvuO
         /tIJIXESAj8Rh0w2/hJ/Z4wp/WeSwMeb+vlykgk8fw26eIbQt3AiBWnEwXT2iWeojuo4
         mC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104602; x=1790709402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=sUNZgggmYpTzT+vBzFSfU4YMeRlWRIHQssIneMPr1YCWJbCAgifEIqQruyHDovLoHJ
         axSDIt7sUUjD6OZAyPRUSjjxXPcrNzkjr4MmldevAH6jUmP+3ggDfQTSW690KG8X1xaE
         qJTV24wb507Ss/P21mEOsQXciOgBuYDvLr6PAGsdFhx2R/hAcpTV9YAKNF4nUkCN5bcj
         ZpxLZagw7XjMAZjYxvjtDj1wB637xTOtxPqD8FpqUtZztXNnWgmrs6rdFv+8YnHbRVyo
         h7k9/5kR3hZklzymJBIArHcwG5P3J0HfDB3rcU40yfHo8KWIfSgM/B0VntdVWtjqjRTa
         lAMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPwty10nmHIYA8PTLLOA298vVA50E9+RCXeATWsIL6Epqkv9FKOqtN0eH0uprtFYkZ3MLU0CVzNR1EqrM=@vger.kernel.org
X-Gm-Message-State: AFuF++k69/z6YX1Xa2KIkeRoJMznstpRuyaaqlLbABBPBokvgbnfDXzt
	scCBakUcuJj76E7Dhh4VZyvD88KlCkySfJPA2lkOKtGSYFHY75xBIX1/4fNkpVNfMGCRIAY0z5v
	3v8WSee1PCsDXlaNr9UQ3YT6eNN/p88KZNqWH9BwRu2kPoqw7VDmL6Z9tmtQhflf9Hpk=
X-Gm-Gg: AYBFou0FOfhegiZWRC5uZVsrpBydjDAruiREv3ng/lVv/jGiD4RlKEhkrWLkD2t0g/U
	/zastOIltY01eXbnT4GjL/kETrneEtGz3pLpHB4MdJLykZ8wxgmI/q1/+QbSLaaARUyVXZoY5/s
	eG03tAC57KkpLrMV3RfH9X9NGr214gsjfenQN/2rP/SyfON4w893UXJYBvZmu6i6yyNR8U/0yXf
	IS35E21iNjlh4Do/+UL3BUntIgSsXo3PUrJXlguRfgR2FtP/UrfZtst99lC4/nuMwXe6XBM/VHF
	Z2lRhCL7TkETtfE/05M0AmaXmZnyKS8gtB9cx+E+GXy4rpcEb+ziGSX8i/puNpeK0xoERdEQLqE
	S6F1TpqiEd9C5UQcRdLniu0kH36ClYY6F6w==
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374906c88.9.1790104601564;
        Tue, 22 Sep 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374847c88.9.1790104600692;
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm521798c88.13.2026.09.22.12.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Message-ID: <318f7e47-8a23-4253-860c-0e9874864a13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 00:46:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Keke Li <keke.li@amlogic.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MSBTYWx0ZWRfXw/FJpf0Rj1S+
 NSJu/FRZoNoOoUe9NnIqaPc5p1DP7BQHEin7hSCHaw4K4QbnZAby0iOqcgPpGByCTYQ4rmO5nOX
 0OGPEVP2vPGjfgGvVRTKhAQR8hW+rX9qvV8INYWFXduheYGNK19XTVVArzoTLkFxcYBiQgh72Rl
 AXxLv0EpIuqeHiMiZyXsq+wNz6+1R2zRW9nPwOSEcJpauPLUrelev44UwPTYo7kjO9y7855lVM3
 di3/vzL0SIHM4KnarmuztclKZjC0FCRQfcSZv4bfUFRrcqL/jjdNp9ih8xx0TueCFffVEsCqK/s
 Na6XKrsHVrAsaSFBRsvDDltDmpAn5j18symBy79WiHGr+HWkmxyYAVFYYyAHse7GoSBwaqQBYmH
 BgrOH41L5lYp4rmnuKHAql/C5MewxVhRZLg/MbZWA+iMAlr4KI8eW8+59OvbMwje/PwJl+TYG4c
 jmjpknP+tbY2CKgDLPg==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab2d41a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WJcS3fml3CefRcin8NsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: WQWPOfxNBbfh7c7QmA1tQRfXNoVeeMBA
X-Proofpoint-ORIG-GUID: WQWPOfxNBbfh7c7QmA1tQRfXNoVeeMBA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MSBTYWx0ZWRfX+rSuadG56pKS
 5ECtwOLx0juSt3/dvFYrNj31e5eQB73wfyMvnDKUSu7EIMSomM/vF1srlTcfIIHXwB1T7t0hE3S
 1+Q3k/zAibTz3qNDQnikaz4CV11lcBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220281


On 8/2/2026 1:25 AM, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>   7 files changed, 28 insertions(+), 28 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

