Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FBA45C714
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785860; cv=none; b=Q53eNQ4zpMsgSJZ4yNTCqVmfMHq2cjuDwLD6J5pvyg5+CKWI8+fRk6JndtRd7l4Za+A2NVaG3rEgkbOSRMm1Qe5Rou3D8C5H+E9SnQjl7bZ4t4JnAPJNgMzJZcebiOZRnahM06ObiUMxeWz0TydJW2g7srDPTInYOFNXGuh1IAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785860; c=relaxed/simple;
	bh=ikOeO/tWibSC6iQA7mD6jXYuV0kQJtjOsGaYG7zTij8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaYzSi5MoH9Ugy3p34OWNXnk8qCxn8c3lKwwR+oqXxnPoeKP9hZerT1i71mQdr/GM/nyw/DglPghpsj8ji/bn/q7GatnTpJxOVuJLgC+UPFr4NXPRht9rxGviKDZUvq/DD4A22psfSlfYOv3YBX2V8wDOw8fNEW2xl1xhnt+H/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cswsJG+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IT9AY/ne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cswsJG+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IT9AY/ne"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmwZK810024
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=; b=cswsJG+ztxu80V1X
	AufJmu+uZQIDXqjTm0wYgchxoEqga3lk9IT22i1b8lYDGAzM0r7rsfRJ66SKl/dk
	NQIfAYmYNrPu1ugDQKjQS1ADhQuKUabGuvWGi2pRvgaajKoJPppm/FwEVFHyxaX/
	286AK4L8I/7aCppG5iGK5IVBzALfaBtlZ4iSPc1l21Gu8kiPSU8F3xQ+x01fyejb
	VLrZa3oAJJuTWAike9EhoUiucg0MNMvlN8ptcAP3+Aiy+az2G1iceV6t46vXsi91
	l/VJA1tL/FtbY6a33IYcfSbq8SsVMuDrLvpKD2gy2l2L0aoYZvRtJNkD7eVtBjlg
	7rVVag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9f8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:57:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91045c83dbaso8955956d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785846; x=1789390646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=;
        b=IT9AY/neVxIE8NuQ8cr0E1rKAZGZYk4sil+ggYe0cYz2U7siIwj9a4IU+XPSUA5oF2
         1u0N1u3s5V9HSh5w7VVVJtBHUnq+jPa2OvutbFDvv0uR2JODtBGpeeuVkK/p2CCShcgT
         EIqFGiiIyBvDMW/TtFNn0ejy6u9YunmlcUAL8WRnBTqhO+UbEUOuIP+145eYFhsxPN8z
         AVkxizbho8FgCjbXR3c73fLXsqO+kFUH6HkUUPiGQeMjTumzFaxesOqohzIqNDXqfYP8
         m/Obupl63oc+gMjABOc831V/KaHmRNQpzoGQVCagFJkyzX8cmUnZ2C9HdP4neE/fxk4H
         OYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785846; x=1789390646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=;
        b=g/Wd4/Zm2eTkcwK43UJoZQV/Z+Iyf/4HkbNAhRgV2LVq6xrOJ3RN45aCJwtJXTjcnU
         cGBY2wbYOsjSEVMd3VGXx/C1toXhl1+q+cY+qaEml/VtXyaNBCHK/s/ch73sVjsID++z
         DIIfZ3O5RG+Rq8eChtT3LJd/yNvvoMU1q1IMfZ+dgJM90YzB6/BX0YWum/anP5ZDp43s
         1BtF3BZ1o8IBdmSKJC3oiBFyuO0ZF2MCSdBYGOSage9ID+MjIKOOZ1+bDpFNSysdu5eC
         LPck+I/rymKuLHncANpPrGjf16YSLOvrJVaRT//o8lRpA2hPklUpZhCxMXk5UPpYS5Sb
         BwPw==
X-Forwarded-Encrypted: i=1; AKwUvBxl4VKXB94rTqOFhUgwAH68AoTRXSWqym6tyB/qCkqjQl4DJWjG2qExvGADEuTUcjcskAj5Ln5P2m8Uw3E=@vger.kernel.org
X-Gm-Message-State: AFuF++lI3ip8a8dvY0dwPvf9E8rxso2bArwxHGJZxCMuykGM+VPkg+do
	3B6TaaFcgwPD5UBZ32nwgBTHS1GlPt4L0qVxLUz9ziCFA0G1M5hp2vg+BhEVJAH1pnGKuKOkB7s
	p2gMszx6RNHuDjLApQP1E6xEuov7F9yZnILpOfYWnW42SBKNa2QuL+bXwyz0mUzsBguA=
X-Gm-Gg: AYBFou34qQzytOhiofuv4Eu3tlhyKDlIgDuNaa+YUFE/iONumY4Wdc+gbB7/dt/Nwck
	+bTPZjjx3MBu1KRZ2K1Z2uqtEA9rZbnKR1F4oHoX595sHpLznUKDr0Yf69+CdaJEuWQR04RGzr+
	QYelUlrQyI+SpdLhJoLddg5sdlc5LLZ3gN2CCIgHq+L/Q/Sxfl3RVkOGnMRJBvG7Bw3GUpPE1LT
	RAJtuX+qKx1yNKommjvt+AMFgfWy3lQ9OthlEjndyI/DkYJOTj7TgNX62q20+gxcRm+XdhXdYTE
	SCVvLHx/o/94sN07L4opu8o9OwuXPG1i504aAM/yuPFk/VyHgou2331N0Fu+v5HYnEN4ITyZ+Ix
	qp2eBB7tu5g0qij2huD+lXg==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr808268085a.6.1788785845742;
        Mon, 07 Sep 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr808263685a.6.1788785845319;
        Mon, 07 Sep 2026 05:57:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm361995266b.9.2026.09.07.05.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:57:24 -0700 (PDT)
Message-ID: <615579df-d37a-4917-b2f4-2ddf0d595f9e@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:57:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: ipq8074: move DR mode to board
 DTS
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-8-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-8-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 36ZPaP9j5UQ9c6HXOjChtT-P7A75qZ_g
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9eb4b6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=3QQp2-qM9dL-h2NKckwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 36ZPaP9j5UQ9c6HXOjChtT-P7A75qZ_g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXwzgfZCgIrXg1
 +Lo2+uvFNbMHGbgvYZ3+cPj9ykHFHddPGFWC8mJxasuX6JOG2ZmNJFm2wCn7dXQxDlyYTRX0Dre
 4VlpKI7Jfs3gq/pWGSIWniuqgPqc3/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXzPTqPaoE7cCs
 PyOyLd6nW4n7U8oeog+tCE6Nc7PJKaijpjO47vp7VIBAK/12VhU2B3phfe7mMqiSV1/X+ezsUZi
 ynX+U05FsQVXsL4VsXfFYrZGdeLvKaDL265ay0ctGIvrGWqd2DRZgTWJsv3/3KvxrhFwpDLEXS+
 KfbOSMi3P5IarlK0Wgtnu//9F1mjxW50p8aLK61dl8PIkwwUxns8M/8xmRX/oJWkIKt1DBEeOlU
 QLdOP7fMZlqfdeYH2F0/rPvvq1+5FCet7jbjW96MaQ9Z0/M8prfw/VTNdyLVBfxtIwImQmy/uu1
 QYdxqiivEzFEe46VM0m6t6vpwwY0HFvRCCMtmFYFzQehVDb5ZcUffF21ROpYohAeTKHdr3J939l
 8tpTM6sewgIPD+4UeMqXov44OGeYhdnbDpQ3F2BDTKkeJiYcx0FVnZmyHJ8p0rvj6rABzEZ0qct
 pm/DOucQgoXmnwdXUng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Both controllers are DRD capable, but DR mode currently set to host mode
> in the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
> hk01 board DTS file.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
