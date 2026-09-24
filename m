Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5C4370AC6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234451; cv=none; b=MCM2be/P714yFt/hd9Ip8aXXm9thqMEGibpTIBN+tsicw6HDZ8QvKZg+lPS46kTLPoJhmUf+veok8sW4yUz/MMLZFJzTifeb2idkXwmZeWQ7q3Z+OWLSrQppYQxPhfUVpiLh1UIJ7IVVD76ISOv7MS4zhNvOF9LSk5n9K4EXDkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234451; c=relaxed/simple;
	bh=8g/Nu2exqZnzEWOEcMF36hF0k7LbbUJNQSot76GJ4/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jE95zqO1T2a/6Y9CtT5fL8XLkCDTOKXjYd/GEF6LP+EaVKOgyYn0uoTzkxuxXBIqNgFWKgT15j73gxQyZpP9UTHaRo2Ipdc6hZoL9RxzBAPJHZENf0u9P6fKFt6liWbeNB98soED8uN+LJ2ljzvngiI20lzq4GytgbiyzjFoMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Au8ZT6dj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FluGXY3v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Au8ZT6dj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FluGXY3v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBbI2277192
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb6v5TNTLG+rXI26rE4xnUFXkbsGT5YPJR5eE09G/Hk=; b=Au8ZT6djQKHhufWM
	pBVOTljDDaxWqzYVbVCMeEw/8f26dxg+5z5Ma0V9FnupxiDuMHpEMcXph8B3VUMr
	bPtd1ylocwEJemGqGaM96jT+o8ckw/90Uuci/r0CSgJkKywbzbQ06ABUHLFE1NBm
	YvH2f2Xp2j9KcZ1fz9nEIYDMm/70N24tpOmNyhLpiVfFzAV6nlGCS+NtDfNcqCCY
	KJmmqCho9uag5uiO9MmsM51D+6uNspFikjcAOS3M+nsgFSWAWUSRaVrMd6BYbqwI
	5Xsp1Vex0sNG+Cpti8kJOukrze54PKDyqWQ2DzD7sj04j3eT7hFYbtxOvNnm7Hww
	3e1Lgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxuv1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:20:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so3324680a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790234447; x=1790839247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kb6v5TNTLG+rXI26rE4xnUFXkbsGT5YPJR5eE09G/Hk=;
        b=FluGXY3vqdLywVPmzCk8OLgKjDwZ3pA4Kb6SGXWSrp3YXepZFZkxgo38jFbRMRaTTA
         gE9HwxYKjWRprV7Xoa0lHdgYIp1IhuCCjTXWj8vPNhs9UbiTFTUKDYX6bDAP3MVxLnOH
         VBB1d2IJoRn4Gz30QG8pyeBYXWUrWtu7MJugnevILrcBU8QjTJ3OdKYIeOnV7InClfY/
         vijTlwyRhdZpcMxoWOxXJ7QEsln6ktKIV1KP55mSDXYKfDY1kX8afA0saPI7vXlenrAO
         3rOsTg4lrBOXqetQzyaz6jS0ob7z6SA94IbhK2tUFiIEqpz18tk6gCaHuI6paQYN9ygO
         HZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234447; x=1790839247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kb6v5TNTLG+rXI26rE4xnUFXkbsGT5YPJR5eE09G/Hk=;
        b=iR3PY/DLfvlLV2fJ6pO6RDk80UrhluNeLsqByRLOm/ZIMq9T0Q48H8vuDhNy7+KUPj
         w4bmxSGrd73StCr5qikofolJE2y/ec+5skHy39pvXJKkLhF4HBikmf/r8x089uk4rf1a
         y/XXIWqQXMGpYu8l38f8VH19TZpwhgT7NIEPOLv7g3SzaqG+YdImYNd54gknsHVFLmoa
         1VxghMTp24FUu7H4+qOMfseTx3RcwvF/3cwzKNe7FDfZlCG/2lshP07NREsOamXuhSAb
         i3SIaTnw5asSlH+5xKrAkR8FYbuYRGA1wDSN0FzDmWkyf9/bT3Newo03rRBgHnLzejSJ
         X3BQ==
X-Forwarded-Encrypted: i=1; AKwUvByfSIWZBK2R5wtDO+cGR+KNhAPz5s5DyPnsSbJtz/li5+FpAp3Ds1tdjDzz+eZjnJkx51CpUlH74mzfOT0=@vger.kernel.org
X-Gm-Message-State: AFuF++nnsbr4l9UOvhijSrgrgXwIkA4qUAf62gkCD3gKsjA3ecLfaAGI
	oXw0e0EFSO3buEEDwdRAxE89sahiL2QGCCVinC1k0uFIEkflIQY0TO1sXcoI1piyoW3sWOccWCm
	IkwA//aFopKgBBcMGVG9Qn3Cwki1b1tSB0Mu0dNMTFpxGHd4+T9L7AIPb8oqhY0Jm+m4=
X-Gm-Gg: AYBFou20bcIm56kEqabF1skPtNMCCpf+6tha1o6df92sOlwByhwZAOu372EAccvyJ8l
	KWaq2GmTUdW7wiyyX6/lHr6R9i81Tv4Z1JRoHIx++e3xxaU1qqrCLXR1nueTIlVLVB3lMVddFJ5
	PuH/8JGcaUDU3iP6xaUk7C5ZAjVJJt7JEPOw0BiY7W41S+EK2s+B9hSliri4lmqflGNpi+6qwtf
	ii9WxkK99wVEroRnHOOivMoItQTMWcIDhOsoZFk41Yn0gOtjQ6VsQzVBVplxIWV8sGfBCUaSiBx
	wBa1N3Cs6qG9f0jvrzL1/9U/pjvNNee0Ehql9wXP4Wuc7RO+Lp3SBOsKhXY1FBWJDXNdiZVm5D/
	yIrPld7CVCqFuZmnoke/2SAx1K2Y=
X-Received: by 2002:a17:90b:2250:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0987247b2mr1341362a91.39.1790234447041;
        Thu, 24 Sep 2026 00:20:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0987247b2mr1341352a91.39.1790234446630;
        Thu, 24 Sep 2026 00:20:46 -0700 (PDT)
Received: from [10.239.132.75] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d67bbsm2154166a12.13.2026.09.24.00.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:20:46 -0700 (PDT)
Message-ID: <a15f96f2-3302-4532-bbf6-2f8241a6ad4e@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:20:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <839c556c-a322-4e1d-b68c-84d404f435ad@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FJzh_-zqDwX3xmXNXMgYWas2AMBfPmwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXyREvew5LaG5d
 QZNH+hDOM6KuS7/woXC0UuoKYWrliMK0mQiHTP1LvGvVXeWtKVZNrBkE0dzYwzlryaaifL/3A6Q
 CvNQVxpbytp8FMflaGF+sGtx19Ym+oGg1d9mF/7n2KLkuGeqRocq+M2fAfVUWLcIgXsZ3dlK0iC
 nuW8dpPCEMQCdiZcYIVu7JfUUghFDQ8y/eNWTR1WPsHnrr/bg65ahT6okqATnW6ORAj2E/ixK2s
 gHYuHtdc5b02tMn3IH8AeLYDpvY63G7KW3DF4pIFUBKuZNGO6RBmxF+2pjznF7+GSGYgjFsAq1T
 MYiH6HZ9f60uIU4T8WioZqP4Un4pUOzNFAfR+O6u0JNwGfzFCSTwXk/XdIqpRtB4FEKOWHwsoWX
 VElthlFS/GSw+cLWeiCyTN4j3qPMF7bsfyYplqCuF9plmV2hVxIoYg9grdHgI0zWQaLMJLT/erJ
 DYVki0Y5wSf2PvFQF+A==
X-Proofpoint-GUID: FJzh_-zqDwX3xmXNXMgYWas2AMBfPmwe
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4cf4f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=F74OYUcYB-Hb6iXyO28A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX83SMx91fDMVf
 C9TjHpJsIuPDlvhWXJSpRWXSOicjuwI9XMg9yXWZ7OOY0qgGAfYYC7so3oSGI9e8G/WXrl+7wJL
 G8wP8+9g4kyDl1+m0h6L19o0JKjGrd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240031



On 9/23/2026 3:06 PM, Krzysztof Kozlowski wrote:
> On 23/09/2026 01:06, Jingyi Wang wrote:
>> Add the ID for the Qualcomm SM8950 SoC which represents the Maili
>> platform.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   include/dt-bindings/arm/qcom,ids.h | 1 +
> 
> 
> Standard question: where is DTS? Why is this sent separately from the
> rest of the patches targeting the same subsystem? Please organize entire
> work targeting maintainers in relevant patchsets.

On many previous platforms, the patch for soc id are sent separately, do you
mean this should also be sent with dts?

Thanks,
Jingyi

> 
> Best regards,
> Krzysztof

