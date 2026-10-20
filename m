Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483811;
	b=RLnizH9/JoyN7L9oSpnew3t83C0ewphC77I77Tw2CjE0FAH4a2srmxDCKtaQkciqXFcW
	 G6g4NkeX5+K8W30jGLR9IpVnHH4o5lT/cZGnlzFLC0h758yFiGYnbi3tJj74Jpex3m5mt
	 p4+2d1S4pav8cqjNPu1NiiM7NIWkfsU6O5Vbdc4IpLsCXIYV7x6Df4Pig7ZideepvcZFf
	 KU9yvX6SkVgISeLgQl3/xH+5gerL/95Fq4gPYOMVY9zMSub2bv/PS9y+bBtccnszd5WNt
	 FXh038sD599w3OIvUiI+IcFrVyXXNQfu8QmPrjf+pX3cDC3xbmgeHYBUxjWypjRS0IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
	b=1nxfRogunG92SPNfDvLAPgay79QviB7qBh2ZMehSdzgbquKn0GAywUHY49A4vEhrUFxn
	 0L+FNKQwkb5YM4RbwphqHPWExPYmYTaHWBMQDHSKad6f1Rp+1k35bLKZf1+wirC8lbs5q
	 WJsLOBn3QCqNCmTegaZSos7QjpRLBrLVVWxTRTEvW5ZV3x49kB1nNgPkTs7jtcTlj26ML
	 7855k0dNs2fmaCCryEfTZq7z7W9CPlP3SluyI86ARU85tMAGFXGCdK/7x4+DkOBw2kl0Y
	 G63oj1IksZl6hBHhvZhRbTe3Qd2X0wiWKfn4rFuF1PFTZHl/8ef1Wh0dS8Z2lAN8fHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHPlQmG0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CBj1Pv2v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57225606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57225606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHPlQmG0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CBj1Pv2v
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tQem1211293
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=; b=ZHPlQmG0ZtBE77Qv
	3aS9lp9Fo5BdTSq2vksPzOWAFXGAnnaUC6LNBX2VxnNJy+U82OMsl4+BvegVgVbB
	QD67DB/IvMVaA1g86pxvznFhL+PjgKHujF0svkAahHqfjvkjL4AXYeYCvVq5tgUb
	WPr5Y/sdVWPpAom2lpn6sF0GzWoW6mp2HqkzsCY7qnemqlySU9etrfIaa5NOnXyg
	3Cg5dkfJRdOI8eBo8C2rmJtsEbAYDC8W2w6mr5cwTWuuryqot2bSR5p9vRfI9thD
	7gu3qC2cGY+bu4eix2n3YCX/qsUI8Nn9VHO0kJqD9EYS24YDITGu0oScilezCdqy
	+MrxDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1jay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:10:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so53948585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483809; x=1793088609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
        b=CBj1Pv2vx99kMM1P5lHf7EZxEAtaYhVlHXjj0xrBuDGiqx+nQQjXluzo0y6S/x3kmY
         vRjH1uUWRk5d3bPekFCEYuVexLcTF3eC6W0krw77+Iq52DO6D+SACKcTNoV1RJiLlBXK
         2Pb0xwRLNAqIH2n9S+izbYonHvdR8hA0IRhUFu9StD2yQ2At4Khm6xYAW3LEA1bBI07z
         HgwA4Nd7xotnS7QFBRdVgzU0pqsQzk8uJGXcBpLxjaALP3Gr71S68Xw49K/6IYKXmsBm
         VuHvcTtmqNnMHEb3GHHxJMqCROWHyi5Q4LUIn51WHB8xkCcGomdAdEFjv04zDpvNvXGe
         m2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483809; x=1793088609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfaQ4cN44MeCR+RAKTBKQ69nJge5iLKyKSEoE7Jhr0A=;
        b=jfOX+NWESn00ncaeKdBWcYFx+XyvlTlK/3TzfCzDuZeM6VH4jW4E9zc0lLyI9ELziS
         2rrud5qMm/2ugsGFvM3IviHovP1c0O7siGlcQwuZySL/BUd8p8RNBJt3/gFoxkH+SEVw
         8VxCSoDxwBXMkC7B9/AZBzAgUr2ZLrxdtw+v9GM4vR2354+GntoRUYgAf/KcExI0bo2Y
         bdk8i819XU3ZAL92t+TJ1nbN8m+nNAHTQm2UScpATuOa+3HdRoqbktC2OwRso9xL0SyC
         w9kLysKD8UmKjtBHDyV3k37qpTx9SsA8uvP00mSTelzPjmyFeHEuNz/sN4IM/av4bFwQ
         G0KA==
X-Forwarded-Encrypted: i=1; AKwUvBxrEdwSpQawuOMYmOF5rbsAmdUvjz4pEyNtJXLQyPsTBIsJClNJXs+PSjhLZAVxVCWn4xgU+KLIayBdFU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNdWfdrngJS2BtNbPJTcjgoq2zmoyTGQhj/Rb9zyRYpQCi3K8y
	KnI6nmQRMK8yMKNDNkQRNAfN82gs2K4doI+piNik6nxFKexgIqvMfzMhDowAWNpDB9nZeRl56+T
	BwvAunYm8T2ry0/Y3qADShXrgsvY3U3wUag3pBLoEQVnPfmtWUDBvjLgdhl5l4PRPTSE=
X-Gm-Gg: AYBFou371tLXdEyQcMLnWI4ZEeE9E2JsAUfkys/0MFTfKjtex5fIol/Nw6gSJsy56Gm
	7zSgJkQACO3miaF67ofa+F6G3oxBel0MIB+YmjjL0giRHtn7eCpoLQd6v2EbBrBPSA+/gqiUaGS
	aoLeKR/qJBVJsc4gLSk2xcKDD6Itj/fgR/r4XYeZGVZUq9WcmgpnSvieQzglQguTpydOUk1Vw53
	8H4/L4QLNbyMnuXkSSqbxfAvPhB/LpXzprjP+QuxfbdcxhbCjw6llT9umdGHpsB3MOShxNruqKE
	KuXn618I3HB6UgXg1OMzv0stiHsZ1oyCzCizaZlJZ6H2azeC3S5NuLYNAmjbks4yPMxm2Sksbe7
	zgDcw2WqPMURhD3azxBKvow==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1960106485a.4.1792483809404;
        Tue, 20 Oct 2026 01:10:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1960104385a.4.1792483808910;
        Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10ebsm456527766b.22.2026.10.20.01.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
Message-ID: <398766a2-2abe-4abe-9e25-6a17b15557aa@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:10:05 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: move GPIO
 haptic vibrator
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-4-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-4-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KQ2nIuvBm3KptYLYm__07wH13JNjb3d_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXxfyshTabkwDx
 XQsomokFA9BNMBFexCqUOk9atjnmswHWJvXiDyJGvp5YcQPSzlDdJbIZwvmbsdVc6+Z0G11X31g
 zEBXm/1tOBWoTr85Mcvdc2albC6/PUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXzpTb+uB8NP9Q
 eTkhNmkju9hYgbf9ehFRvQ6+nlLmbz3i1FvBs5L5WGH1b4VcJd8Z9hpPu+Sb8M7MW9c3e5uExj1
 A8MDGifIf7CmeMwDUY8k1bJPjFKEsbxOEQgBka8valQnmvhb8WfUDoxZ/fOApJQyXYGtcbKaKsx
 dj5AtLvPf4/9UwJILyWH2yx+HrfB5bSTK9sh3lIb5hbsIjqSAcUPLTNtKpLwqa7SE3o/VWvGF09
 j0Q9vh43oad3pFyg5yMeRjCvBAZOc0dlnJTAtvxhBr1WgsQxdMR51re/hc7qe6NTv9cL7TJIhN+
 CoIcDTex9cTvAres1reNGPxnhI8PNvLwf5GqXLlYxvD8ZYn9YabkUTYl6omZzVmAN+aVbcsQEwx
 VQj6ooaIlLfLlZ0wXqwxs2pehxC0NHCFAj+IQ/lJOC3BK9kdu0KJOi+1Ej7NfwuiauFgryOjG2+
 8cxxYKaWihm1N7OkN1A==
X-Proofpoint-GUID: KQ2nIuvBm3KptYLYm__07wH13JNjb3d_
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad721e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=RZ138lra_CrwkBlV0WwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Move out vibrator node from Redmi 5A devicetree because
> Redmi 4A and GO are also using the same GPIO haptic vibrator.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
