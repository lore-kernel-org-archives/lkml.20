Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E837FF76
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364415; cv=none; b=VI/IYNhZ8jeBeYtoELgS+5YEHJYeEcDMRFdtY1fc00chxDJzUlBjP6zAGwQFh34GXwGQDp2yoqtpTD35qz51bimxRqX7BvbOBBD3ZdPkrPmw8AD/4Ngx/6yrfQeP/TSW6JuPu3Mqlp04x09UvI8ne8SqxPrBllxrKF/gtJixBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364415; c=relaxed/simple;
	bh=M2iZKvRdwplPax8rxY3WcgzBwFQS3AeOHQatw9y082w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN3X5o7JX1i/mRrgyXJC38Hj6e/oyvB4ngHbKY5+V8c22VTw6kMYUIFbfSu4C8oE23SqNJtGuc9ycWAT37JTrPy0+56tP0QZdhMLQeWJQn5+3KTVt9zf8MtSHveyHdiolSJXdqTl/+KE8t8OdsGVaTjdlAfJZVsqonSmWkj9Faw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h26UC4Ql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMMhhSlq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h26UC4Ql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMMhhSlq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZcwu1348830
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=; b=h26UC4QlKNy6XYp+
	hGK1ImMOiRwBNkVdVfljNeVwgP544n5HEne9AOzvSrLKrCWH46B9prV+wWuasgmj
	TXdYXf0I+NXY3nWlGHdMEywfM4QdKszpwl0aCgCRBpZf2+nWj2Og/yewFjP0ub3H
	eheh5mFOlWdinmQh8JDHSZrXWu5nKgF83MiFoB6o9EslHXr++Blc24vULW1W0umY
	Lep++EKgH3zX7JWvvX69UOeF/wf1c4P4HTOOjmEjVKnRUHoZrDYz/FsF2wUYg8c1
	N5QaYz3azcanEAeQnI9fjWpeRqbBo/F/azNQz02d7h0GGIM284MxAuduBWbknjEo
	AeHoNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4rknf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:53:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ec554a80aso2926571cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364412; x=1788969212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=;
        b=QMMhhSlq8TclJO4hpEonzxBjM+qfHrdihG9cDzM0WeDqOFvsZC+0uOjU7i7VT8VPoT
         eGC+dW2CT37/KBAyrQGgsR6PhaipP0XWBeM6axYBRC402imbg7WG6SDeMUDYA9fADUEk
         yok4d0SX3zAI4Bfqqo97FJ89thAIeToH3yzZULweSa40OcLkA9cVhuSBdfcUL2HISXhN
         fdj0Lg0iWomcs5Vfag6EdfesPsclPoM3f4gYEgqujYP5/7ZYsN4sL8je3xJUELPGfYPF
         JoBU2KrThziLiq8fHMZFrH8tH57HBIhVeOXFD/h/G3r1uk49aYnSXLWFOJ8N1j1GyD2l
         CQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364412; x=1788969212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=;
        b=PLnjeSGC2LvH9Q3d/y38xm+GHVYoV+ER3K/LcGOEiuNrDVM8YArkp0cxqFoHXsGPe6
         rLTpo06ttTXP1sisI6N6sjh1ybZA97JsD3AeDphig28Hwj827/8yE/mLimNuL7r/Xfk8
         QSxNDwVWgkOxU5fax9FEUQ2BGPzI+vodzjFans0UqMF08ctGhNW4nMM9sF4NzKHmto0d
         NH3K/6KKUKKBaa5dyxCGz2iX57ZWiZWNhcjZz3NM+sOevrt8izwJHSOjIBgDkfSg2abK
         6s07jc8XtPnANJqU0tsDpwFEmt1BJqNtNNtL34nVxi950MVQz59P8vktUr3dkQg+IH/3
         P8gA==
X-Forwarded-Encrypted: i=1; AHgh+RqTsstTK5K5ajTAoR28ZLhSM/mpteUd77Boy+F0qG6oNZC38zR0Apb8LaEWOm0GLVNwzXJdQ1LS/jEliGE=@vger.kernel.org
X-Gm-Message-State: AFuF++mFTJQWG6EyJ15sMbrHxGmUSNh3Ik2ctxI+knHvvhtlyZ/z9joN
	D6gciKi0oZ0Aq7z1h/P7kqSi0OVp4xmvFCpG8LUW0Xn9OMVvkJOQcPDPSJTzTand4tW3yezDSph
	4FEV+omKVdKATUS0bGCfo8iqFChb5yiF7AwXARtCSyU2MiIQcA4C3dtnbU7rrLf+3pc8=
X-Gm-Gg: AR+sD10XrndyNp/Sj62E0h5tNNB3+KRIZAIuFf/mHYTulnWH/neA/01YtKIFRENLdYz
	sPP/k/jebi0UTVcHkl10lUQoMhXAS9AYJMkN5xvYV6U84CqQ2ukOO1MYb4rgmR0pHWq2iblGM4I
	J2SsKz8twQUzyc9r2farMEboNRSIjct5wo/uOdaqEwqbXxZBY8maxUhXAx3tJM8ycDL+JWA82tR
	qzsZ2mfXpTKVbj8jjP4UcysUc2V+N0WFdVwJzcSjJshdGhr2dsMeg31lX/e3o3y9tdYuB9wdmc+
	Ulq+auTqcZolM4XKJ5mVCPXjiBCZaR7SU00+dATTxSicwVxMO04oM2LuMcp9c907y4UavB1kBnp
	1PDaFTBAZ8U/PSLzDLfwRRg==
X-Received: by 2002:ac8:5d48:0:b0:52d:f626:a46c with SMTP id d75a77b69052e-53036d5a52dmr40146391cf.4.1788364410085;
        Wed, 02 Sep 2026 08:53:30 -0700 (PDT)
X-Received: by 2002:ac8:5d48:0:b0:52d:f626:a46c with SMTP id d75a77b69052e-53036d5a52dmr40144931cf.4.1788364408715;
        Wed, 02 Sep 2026 08:53:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d7esm1289004a12.1.2026.09.02.08.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:53:27 -0700 (PDT)
Message-ID: <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX5Xdw0ixaT5Bx
 usarW2W9XTZUMit24bul7eE1x44P7ZCMaXPiBcLNeahW4ImXy3Re0kjBCjfw+OCKhMTUjHtPOVX
 mZMxAyspT1xlRu8b3nvmyN/cE/QwZjzwZrt66/pGGFJzVvpnb1ht09nBPb0eDcXipCGmAyHM2sQ
 29JHvnE0Lo2QEPz+QcWjFFGZ3FbMPol0W5FoIxKKpzzoAdvXZRT1IL2tNvglL7QtGOnQafrCpjO
 LFyXpo91fNLwxHbScuH/5itYJK74iN8qijzywXKAsurpJ8rCw5cLPa9MWuPmsQdt2weyZnHbHCJ
 NvRhyIZk108Us5U+XemNB5ciRcpDdVbcrC/32VbGHRYI8dfPFSwphjfG3Bu4PSFcyNrU9U8bca7
 WCVuvBxcBK39XkH1DkFBeKKjCV+qrvL1Tq85qJiSY/uduJoVg/b1ArgoARWKrQK/dwL+Jgwmd5b
 n1c7AxMwUPFsgRhE36w==
X-Proofpoint-ORIG-GUID: ZgBN4ubU7KS6TVk6nm1Mdx2KOn2jL-To
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a98467c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=FU8zUc8beOFBw0TLZfAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZgBN4ubU7KS6TVk6nm1Mdx2KOn2jL-To
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX/axo4t2LBm0M
 hN6NR+FOLIKZVNYGWvUursYqWLw8CT/2J5Xk5+50taQBCq8Iec2p36ropWZ23vVJr8tsWH+PdZ4
 yZZ6ZrwbHWq+7YlGztb2tA2HfJu3ASs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020140

On 9/1/26 10:06 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.

Have you confirmed that behavior on the CRD?

Konrad
