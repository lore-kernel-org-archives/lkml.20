Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA2424D48
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767925; cv=none; b=N3Nsv3EEU73wryYoiQJipqNiHeQfCQiodF0rYCgBmqCVTDcUYCCejti1k2t+lvltBad79bYNWSLNsXNXjpfoTthJGjdiGyS64Kg5IWCVGtiDjcClV8iJ5KSBMofhynbWWYM14USeaM2MXuOra7gBvf0915Rt/V+ge1dmzNmkFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767925; c=relaxed/simple;
	bh=jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=em2IUQR7scmBFx/UvI5Qa0OAJcIWVgvyXDpJu9uLI7o8DuBHwVo2GyyDP/Zd5f2mZ40AXeff+R36GpdOUz8WyF0VgIJwdQwp7PEoflBhLhu7YmgR5s9ZVVF6Mfpu3XI/9oyy5meQJ8vME+t9Eed66mscos9FK5snrbfxDlSdg2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK6Jt41p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hc68eTSV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK6Jt41p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hc68eTSV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777LKA3363366
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=; b=SK6Jt41peFnEKklZ
	MZIfxW83AXd4tDGM/eGeoAVKYkx18F6RuWpl/6H6xJmBCVa65ChCm1DB5zjT5PPA
	BeNr00BsxHkuUrb0YXqE0WIwsVpdTGTqyjuKHzbfMR91CSTIyB51WhLhxmznhTiR
	k32xORYaQc4cLmcWyge4Og+Z494LGL+bxH9ABTHR9vLWBe+l0LWj1JcRZPhNW/NM
	62y1fUoaaH9PmCvuqEBHzrixuX8Hs5MYigNzBPd4my6R7HiIKhtZevIz+Vg4GuYZ
	p+H12KsorqBQlJmhA696cpob40Oy4Cb8ej4WdctFAtXt8VsRyu48KvJRU0Z3PnFD
	vv6JPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj0we0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:58:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5184421cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788767922; x=1789372722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=;
        b=hc68eTSVByMcEH2YjuUGjbI/7m4Eldmg78GwRdoH5uBrAHzu3riNn+ozFsPhjHd5o4
         usX7cYIgbEVkYlCgqkqnZoUQrUL4QlJG/rAwvMEE6Y30rBNBUJCM1lDIBsZMGbCzhR+X
         HNwbTwoR9x5A521Dxo6X6a+6pjTYCyAqufYg2kziDi9/6XTze3RODOH/HjKbVsXWHT7R
         /FoEKDX5erQWyV6/qvhmuYT9N7O6GVsmdElrUmDlqaLTU6U+YMsxXfzdUYVCPFm7fb96
         at00q3BeOcEeh3LP4CZ3NDqxMs1TxVO9urc7y3IYHV1V2LDFbwGdd1t/ss6WDVfON9mQ
         2q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767922; x=1789372722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSc7C8ZJcDVkcNRqrrJ4QnBpEFpFa2UDV+efPMqFo6U=;
        b=ZP9tx5VNM2Xt+hRJSSmInn/VajVcTAU/azH489Bp5wiYhIESNENgeXVmd3VIK9Z6++
         gQcpr1uT9DXRZzsNLJ/PMew/PffZIDzc5UV6JtxxREtspyE6j7qZ+Fj4Qx44rfLTNtap
         GlnBqzNVg09LeFj8JpX08k4/g6hGXGwl1WDzIEOO9SYx/9+VcZeCW1i2z5QihicKrfCN
         umzGPEM4hC39jw06Lk3JO1K2Jq7QOkQt6A6q8FVratjqhxUe0scXaptlPUP3GvKQ/Fuc
         5qpb5L7O2OX9ajpTS9GO7GPIBDCOdlliaZhrDjBn3I4yEGEU3RvbOr8Ml4mkwlpUK3K1
         /VRA==
X-Forwarded-Encrypted: i=1; AKwUvBwuyYiqqEl80PCzR594ZYuphDjIJPKuCqiVakgV6uljF4VgpLustzMXnmGucGJvrILFXxyJ7x0vQMitLkM=@vger.kernel.org
X-Gm-Message-State: AFuF++kyu6Q+YqcZonV9V0lQlg2gY+7UGWED56hzzZjX6bC02moAhOP/
	NDb76z6AwD/hzT7qvQJ4HcBBE7LkrNkq30S3CU3BRyhf1z84x8Ba4x/X5jnskV0ti72cz+1RwQi
	kwm7iT8kSlm4xsyEvijQTqGUyKODupGhpCu4EIvrMBLMfiz1CzyBZmLgL07i0cYO3t9M=
X-Gm-Gg: AYBFou3NwzBMg/V/R6L8D6q27PcFNJkgSX7YEwlFOQqeCpQcWqHehC2vP7+53F4gO8W
	/6NOtdpVhiplBQ8a6iVxD8asJUDgoE64oFjg554AlcJNARBG0xddeUPao/tgoWCTuSPaMTYAxWE
	QVDi90Qm4UMEjBvyoV8r1UjAkRfG5NZVXT105qIHQtR3Q6qlVNTp1HVXnLFFshDki6UfDfap0lm
	6SGxFnjWDJG9c3ewElOdJNh7o6sWYtDvVMrMZjUKCImL/OVw5nCXs8UFKJEuZu4yR/Nyx+FgO1V
	3uU03shguob2e0+6tUt1Hy7TyfGO+zCttgg83pTe86sxgrms1QblDEZPghe5cpelT2mB8Yakqk0
	R/2lw77OTLnri6Q/cG6Q8+g==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1143695785a.2.1788767921890;
        Mon, 07 Sep 2026 00:58:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1143692585a.2.1788767921300;
        Mon, 07 Sep 2026 00:58:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2637005036sm231540366b.20.2026.09.07.00.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:58:40 -0700 (PDT)
Message-ID: <16ec601e-68a2-4793-8639-b899f31ff819@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:58:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX42cud8UauryW
 vHYppfO4bCUSaAlz9NvaN9VAXfsC9Mj6WNdgKbNOJf2JILGA9KHPsOxu308l/O0pIkRkBtCD3nK
 W9yAw5oVjSlQf3ExYpMT+r7VO8sMO18YrKZeNcw8R5r+Rn1szBwERye9YDtMjeE6N5kV67ZM/F1
 bH+G7PnfmvSJ7XNgvdOzxfUgWTOgmHgddxUKU00U0zIgvHa0SGwQJFSNHaAQN9d2JwMiE8xGmDj
 5Y1Vzz9rDXHzVXgn5cownZjoN3XvVGF7HTc5qOQlunISrpVzCsNAbGoufuF/AiWVknq+UjUfXC+
 yx4+2RReiTj2/ndS93TiFdeI8nWrOOkD5mXQjE1NBddID2Vxt6xiZDt6d6q1U9DGSlzwiUw4Tla
 pBbPpB+FbEVvs4Fvy5C4UYAAZtJOeUUhR3pNpFq6yvxhO1d3GXYWOBSJMi6IIfw4FIKlXEFJjq8
 7ovXqKJZVP/IgjYlvHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfXy6MH1F6sTFs7
 AzRkDeLxg6T/87sSbZ70ZMhrHDIu6IIdcaVxtMQ8TgouJvMJxYKuW14++287xvxPA2gZqzmiIa1
 qqNrRIt4cTS5SeSyEt1vQAXEgU7En2I=
X-Proofpoint-ORIG-GUID: nIbdCNIDonZYpGzmKRdvL9ARh8p7Dr4u
X-Proofpoint-GUID: nIbdCNIDonZYpGzmKRdvL9ARh8p7Dr4u
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e6eb2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IufcnN8YJO9jMoX16S4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070085

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
> TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
> to reference the shared clkref on Qualcomm Glymur platform.

If it's the same clock, then just pass it directly where it belongs
and leave a comment to clarify it's intentional

Konrad
