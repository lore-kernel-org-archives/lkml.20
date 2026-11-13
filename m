Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559343;
	b=UF+3GRp33tELReOm9rKtK6DsO9jVflmGpYEQJimPGNWKfuizcHbrYLjhNLFsUsxBKWnB
	 cb8PkcveQ9xF5Sb062ii5/ysCBH2TbHPmsHeJIBqVHuk6k03XTSftp50tFLfkmhoo9Zfg
	 JBVq4AzHHSqRHA5coAtUgvTPniulz3Er5ciGMglqenaUyunuxQAkKanTTcHtvvLLQvZ0e
	 Yt8rGTOxJshmHwja/MizPjdkpPhRnlv/PnuG+BelNX9dUSE1TuLW9C8fDgyO/XsmC4oPL
	 hkeGYtlts5r4RSlPMmlb90IRJCiTyVrPm5eSDWR0woY/vbNZcTJ/sNij+Wz0sJlgjYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
	b=0ytvtdA6fKfnU4ZR0jPR30IqSEhTqGjeCALKNBRji5//VDpB2tXZEzaF/CjA7s3GPox1
	 EJXu/hfL3cs3zugivB/A2bU6fdvdC3PSWsEOTYpE9qwpV/XBZ2REDh8cHXOSgj6hSmk7s
	 +RwczrFg3YZt8hoFGM3mOF7VIUr04Nk87V0LWr8yopeNoUVLNjr9pbIdvjve9gizz4qaa
	 NLDoGJmXLOQyercVGDOd5iwE9WUZzsoUPWX/RdxUiYLzF4v0zwGEFiz5oeyn/+pp9qKR/
	 6FAROP44BGjhFlW2fQuHEyOdrL7KZ/i2UkEREX1qmW+eZVSkVvEdt3JNH62srbYnb5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGimaLUT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvc8X65e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33623606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33623606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGimaLUT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvc8X65e
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V0jk4101625
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=; b=fGimaLUTuSPB67+L
	gkMMHlc562vtZxedcLBFHVCNY9pUSb5wic+JzVyNQC1ApGW5gxEPJCrGVMbLeGhP
	at0naneyMKTeLeh7CM/W9aU4HVHbb177KouisW5UPzmGkyeeEf/xMk8Sgmj4PNCi
	zb/Bddm9d2PDbV2/x4DROibRhIvH6dC4Juv0BlPKtRSYWSepO0yjekplezkHDyND
	tmQbv5xLCk/YTQyoR7YHZndsEI4+EKZ4s5llIUcHkKEKqwA3WubiOHbWVKXREdes
	G09MQgWippVzJhJ33E3es1ATdU3m4HUN9nWCia8E8yUyUyXXwzZq+F/+3eqpzZXQ
	nldyrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjcs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53635fe2335so1563641cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559341; x=1795164141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
        b=Zvc8X65exbYm+98h5ztZOo1g0aYl2ufrTl4e+b+Q8ebFDiZi7oyZs9zEXAlpXz5MEe
         AzbTG+CcE37JW4oKwYHtBLO+apmh8Qs/6PQWhaq56atoapKmfvm4ek7S6rFq67x+M720
         7h4bSCzzwwFGYcmR7lVeUffSVwyvVInZfwmnGcuTTvi4P45Jt/OYsGlHfwVENVkF2Jjk
         2fmAqLO8IVV+dXNSdHpDC3bleVa2jSUpQFrPXvcCXdCAE1Jl/UstsAFnAK3EHddYz+Ld
         9Cv6zS7CHXRkkydivEWn9iut09Dn1vm3u9BST8kD5eM85v4fZYN1TY2lZsevfd30eBIR
         lGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559341; x=1795164141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
        b=XzEyZGwyRb1J98vSDWb8/t6s5mD2Q5QXVg/gyvJ5LwVXPZT/xZ2BUkCy4guxHC+BmW
         B1BfbIkuzpZ+H7IkoObuBnYcXEmKGb94Us6V74TuwMuxrRy3lkRx/YDF6FE4U/tW+e8c
         fy/w4PGq/2hhdI1HaWYiEZ/GMKPZg+gTbtellty2J7q4WjZXThptP8Syv3RasPrLvqtX
         lPBh3Y7akMcQCeCWYTq8cdIcEZiDYuDdUN12jPRSwukb64wFIyy3YxEat2aD6f5Yl2OJ
         pF0EQkJTj3mQEy6/gjHjjlIqEIFKxs8fJfCNJvAb0ABvmYzjiPRLrOVEedKlLs7NbtP3
         PDYw==
X-Forwarded-Encrypted: i=1; AL+hErGr2yB3A5AugZc7trFDG0yoJYgf0D3dVQjNCe/UXG0btJrO81QEIe3qfJQKKvIqb4KzWfjI98vwpGxRhBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z984BuC5qNcqwcyhCfPcegesN09iqenoWpumj8xM6dCGhOYzOl4
	59QyLwDmiY5ZnZRLCx9fXWR6qjihKeYAfnTa6/bL2NnuxKIDvCWi9lYvUF71cTa1tHqW4Ua8F9G
	iLwpFTE4OkK1QW8/9mVQhZSJx4IjoTNvYga7IiP04fh1n0X4h1ViZKn4UkUSFEK1omng=
X-Gm-Gg: AYBFou1kW3y0XdvseH+iepELOy6UStjWH8/uEEUje2sX6UAhX+xFJ5AJeUzOWo+fQ9n
	LU0CXr1OClGbrXgKrlWPr/0IfHdXLvADBFXeIvacEBj2xYCGLZ9nS9R/KrX3zClK2wKGdN+IKVt
	1m6yVrR539TfN8IZyZI3YB6IRMM8+yvYmJhx0dnegaUPgl9SvFDtLjGzqlnVySo5c5xt6+t8nQe
	Qr7bVkmto/h/w+7pA3945B9J72sveo+MnIEk8c/S5YWAMq5kKwpQU3Dgm/UkvKloJcrhgx37Kfw
	mgBzewgZFUz7u3WXWq0HCYjKp327DNAmN4zlT/7naJl80tO/auKGzx156blun8K8B+KdSb526qz
	f3zqoVFxrMopYlft7h6fuAq3RVMNUApOCKnOJW+c5f8WCZTevJuxX62/3e9lVOV144remqjM=
X-Received: by 2002:ac8:47d3:0:b0:532:d67e:bc2e with SMTP id d75a77b69052e-55ac1235400mr26691421cf.0.1794559341270;
        Fri, 13 Nov 2026 00:42:21 -0800 (PST)
X-Received: by 2002:ac8:47d3:0:b0:532:d67e:bc2e with SMTP id d75a77b69052e-55ac1235400mr26691231cf.0.1794559340706;
        Fri, 13 Nov 2026 00:42:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b911desm64855966b.81.2026.11.13.00.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:42:20 -0800 (PST)
Message-ID: <9d0a3aec-052f-4209-b2db-0c2112de33aa@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:42:17 +0100
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
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        taniya.das@oss.qualcomm.com, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
 <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX0TF61zJLYpje
 qjIUwQDkT/Hpi4Y8u2xToIXjZ57fFHz92LNP2wGPtACwM9mCUhBkAajX2H0Yk6tW9T4OYdAhPMz
 kXyTtjgvlRT706t/OJNJhGy9GKJ2IgM=
X-Proofpoint-ORIG-GUID: xAAZqB4r9ByslumVYJt-MWtuxpkB-mza
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6cd6e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PjA2QlHgYP8RnRe0R20A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX5KkIaemVKIjD
 tqozROZJ5CROMFW3pzrgt39FTVoii5UcUC8PIU//qeqirdbYGJTRXyhjhw5XsjDwUMtWSufebS8
 ZE++Mr2b7NEN+10sH0YCvWoC2nvrMO/qOuHyjERTP2s50vkL62JXNsiIzCDiFPtcjCQ9EnWfAyj
 fYJC3STeEo+tkw3CTy7O6bwsz/lqa2X0Llyjr27lJCiTNfdmAwshCESivK7y/HgEm4/h9wgWcVy
 +ExwlqQFErP9EEHdypVZg+4+Il6CnPMCMQYHg/8XMz58vDpyFxV8RxKRkYaZ0Zi410t7pN6Q/gL
 ZAyn0JKoBhopYhKzHoxY/ueKhzlBLIAfiuGtzITe1nWGAHuEQIyojYOlevZBZW3EN/jl9syPmZy
 lEeEB1uKyAQTn8AGLJi/JNeb/FinytL/+OrCOmeH9wZzJAyVcCifNSKatP1cuCaqUNzeQfyHNz4
 9q9No67UjnFBL4U/35A==
X-Proofpoint-GUID: xAAZqB4r9ByslumVYJt-MWtuxpkB-mza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

On 11/13/26 9:36 AM, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, a block reset for the MDSS core INT2 interrupt controller.  The
> MDSS node is an interrupt controller in DT and the DPU takes its IRQ
> from it, so INT2 is part of the same block, not a separate device.
> 
> Bootloaders hand over with the display block still running, so describe
> both block resets and let the MDSS reset return the whole group to a
> known state before any display hardware is programmed.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
