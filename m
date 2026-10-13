Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C83AFCE4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879061; cv=none; b=Zv53brr0LtO4A9yC+xWKB0+nkLtvs9kRen3YDJtCnKwnwcsDKHTHI7aU8wBeyGNXXjl4Ko44YzLQJLd0LfiImsrAXBMsngosdo4p9ILVFKwdk8iD3yp3OFWZlkAsLWM3jb/Aj5nNmeQwox+zBU92qMNQqL9NZ+Zw+WP2foCG2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879061; c=relaxed/simple;
	bh=nH8MQ40z1Mc2exT425damuYKC9jptyWNp8h+R5cRgA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSHVorpaDDJM5N2DYTAlByKgIMP7mbnBhopJzjcr7XY3sOL2km2iVzevP5+hf3bs8eVAT73f5Oo3w8EUXxmRPfxI7joUZvFxnrO8Tl/Q9bVaYRE067cYmRj/Lt8YOP39X+iLVi3Gv3AO73xpUpAURggR60+kFtri525BCKjYL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhsn0Zu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECCyCS2D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhsn0Zu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECCyCS2D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20rSH302935
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J30WEc69x7Icrco/7FPPqYma2S9shugrlmxRjW4uihQ=; b=fhsn0Zu1lMTl+aO/
	qXDVkAi7v5NoTntV0lMNqI9qLVM/blUNJFRpebfoJPaJXNiOQpfxFwodIJ83dPf2
	bpEekraM19wha9dLLKY2NQeDf5E7xbSDrlUcE0WW/0qC/m83XD/5amuIuJVleKg+
	4XrzSXO5OERSTppBw7PiJBCDuIbm0M6ud9f7lNa38MWvpCxWUQ35TLDpP9CDRb6J
	/al6BUmMC3MMy+sTSqT5wQuqmmbC5Pq6eaII1MX+yv9oq+sN/+4YX5YoVXot6Er+
	hoJD2ik4slzSaUfw+VqJ7iqnM2Z2e5W0GaZjEYznFeQzqmNyNTlo4V5JNnegHiMg
	vxAKzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9sn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:10:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso26971285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879054; x=1792483854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J30WEc69x7Icrco/7FPPqYma2S9shugrlmxRjW4uihQ=;
        b=ECCyCS2DvO/qzeQHLjq0NBGCb5U8BIRY5RCqoUr1Zp6Gpme0+KDFjJk2GiOcyGdYv8
         0Vmujg9qTASremMEiGLV3ckBrH+AH9yugPmTeMrC8MRigjG7lvW9fYqK1cWENibtnWKJ
         OehSm6o5O0nI3z/XtlwD6kV0Lp1iDHwcyJ3npznA4aUJ0eCrdBE+vQpslJeSo1/P35hS
         xVW6drBLqgK3V1zTOe283RBgcjjT4CGxycRn9Xxi/lzUG8IL/snOGIAGorj9GHUAWEHz
         kdpxUj170a66kv/c4LljEsdsaVf6mnm0aLb+qJTqrbqEPc+Y5i6U2ZLihPHDfrmqQTGz
         qWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879054; x=1792483854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J30WEc69x7Icrco/7FPPqYma2S9shugrlmxRjW4uihQ=;
        b=GJhUQTk2czOK+7PCizVA9uEPdhbRRwwVf0vmUYN7VN0x829ItX/lAnNQ6nEymN9nqu
         iJLcOkkKqcg6FJgvjPznHFh4BX5IDE6e+6CF1MCKQ0YE7bu3XzelxFu16jGkZT+g4CSU
         7i2t2v+b6Up5cFy2/SpfQasgxbKtAm8jB81IsKNIyXKGefRb9iPl4fxn++4llG0AkrTB
         al0m2apr2ifhNPlIowZIFwH3++v2Z2px2vAP02rrRx+LYjsuAbmaLPblyyWXNCDcxhfr
         hhkuS3//NFNG1dQVTVMsvkB86k1RUQHQ8o12BYGdFoMixyWUlpn45JTIzinIHrmB3IfZ
         z1PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhZWtbOo2it+Go7MlQ77/Hpa3bJRlsBeA7CZiDhLnfzDT6Dvk3qIkn7ZeHLIFEsxsRNMhpKwL/DvTZZOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYInORnfOEm1UNEbb1HkIzEos6bJKqvB0sHLNQloSco3vgNth1Nc
	nxKB8tjX6uwemrTeFDzf6tJebJ+rd2+RgrYuw36YE0fbRtD3sk390tAQMh0B1Gcdzpu5sFbm39n
	5Dh7CRqQfGKLU++OW4tvbk+QjVKnez0igNsfjdgERJEZ5wFHd6coWzAmeLGjpFXJQ39Q=
X-Gm-Gg: AYBFou3AXJCF/qM1bpbmff2JEmyQ5f1uZFOcjW33iiDY8Qw42L861ahF/K15YQovmkd
	rAXhL/xuyhV8qbEp+2mZ6/tqCK6/tEx0uRDoE7AY09EAmxF2gJ+xtanEOPFPuHu0Es10a1lQE0P
	kFVR4OfAnDZ6KVJXeS9fAU7Ox0d+/HjGcF1JC1tARGAFWxl4coNngZRgYWUDAw3aJxrw8wterR4
	6KrvdHTUVZNFrTUKWztUaDgRBOgXm8Xl+2ZUFzLrFW5VyAxiAumJ/iUAyUzszywKbBaXyCy9hp6
	jK4ixTpAg9fgBikhfAJSBerKbA98CFT/2gBLLRwlojJvcFZTH2ZBdQR5XJH8JLiA8YNoOi8GbRj
	eAsOsRWUl6wALSJaGRbj/3A==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2332840385a.2.1791879054184;
        Tue, 13 Oct 2026 01:10:54 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2332837085a.2.1791879053651;
        Tue, 13 Oct 2026 01:10:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31b8c4b407sm505684666b.0.2026.10.13.01.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:10:52 -0700 (PDT)
Message-ID: <82b9c2f0-5876-4076-9275-98dbb0658449@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for
 monaco-arduino-monza
To: Pablo del Arco <pablodelarco1@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004101849.34191-1-pablodelarco1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261004101849.34191-1-pablodelarco1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX5OXq/TwP+r0t
 AFvaRs3lalwe8ls48gxcsRxENL3JvVtf2JgTTNlXtEt+Mt/XOOAZZ228paT/RfaHEMSFGLrX0BX
 n//W4Ere0Ngo3JUNZlwn49hDoQJT5if9iwU2ugwsNQL0FwufLIvjU1dtQJaSquIpvyhVvcW257y
 u2JEIVFES5lnZl8X5ZcqoPYkh12R2VJa2OR1FGfeZdJRMd2kTZDj8q5epeTH1R4RQ76IbeoEmAR
 TsCy/AkkASlxkfyyMe724i0vfe7p5jdIb/BgzkAob8FmZ8kCNobJCKmagup0MgaSw8sXPvfYlwJ
 xMwnHKFb6T8TfIVy3hS4k81i/jZ8dD0sztQ74dMb9t6+PEohFgRwVw2AwVNicaGzdYlBshQaERo
 G/iokzh/VksbVjCFjumsAA16ke6VI5wZKHclpoAA53FS0gUuTfcYbyR8er4BJ9q8GAJASsM0HnR
 +wiLX4tS+vxpSTe8NuQ==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acde78e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=05w5BP5Rb16C3YaoyMoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX91AMtrIwaaM1
 ReKMqKClOF7b6b9yENJVJsoYvvJe+4GN0PiCokWvYQXR30Qps705fgfk24BmOmLda91xzbCK7uS
 wM1S22wprZbLByIITwFkEUOu/DSBjyU=
X-Proofpoint-ORIG-GUID: jDi9yM7ZIopUDe684LpwTW54FDcT8s8v
X-Proofpoint-GUID: jDi9yM7ZIopUDe684LpwTW54FDcT8s8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130032

On 10/4/26 12:18 PM, Pablo del Arco wrote:
> Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
> from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
> for the Monaco EVK.
> 
> The board boots under Gunyah by default. This DTB lets it run Linux at EL2
> with KVM when the boot firmware is set up for that.
> 
> Signed-off-by: Pablo del Arco <pablodelarco1@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
