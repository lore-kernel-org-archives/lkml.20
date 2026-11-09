Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233916;
	b=QL0lHweu4G72adeL7/QVeoCFbAeBssSJfgy94v0bmzgismy3hVOdDKWXAR6BlAhUmAyk
	 TQEYEr8GHICF/xT7NR2dildcK5ynUEjbRqKh34VVF9r+K3TFzFGKSMwBWcyBq0UZaANG1
	 2ghYgZEe5XK7GLZft+Eu78jZtfnvo9mJdYZyMo52Lj9rdR+uVty7GwJtBgDKyRz9Lzs4H
	 BigCxAR8Zdjb0SyMmWPxUBUPmZLO0UtxX5CxXvgAb8XO0T4Xb23ecqY65fuECsjRUvC02
	 sYDU6JIe7L3HkAaX2i67GPdFVszRC7yIty+PmTAp1gVftGoKp4UBOpjhw77kyib6rJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
	b=jMnuLsiOZ3CC+PH0eXwqfzbkiGHi/5X3zeuqh7JciETtIrzqa/Jy0QJenMXVotIggU7Z
	 4K+49cv1GXlGRIJGTntxecTMO32EqF+ygQbwqRb1D+zzY8kXbNpbY1xCsDNbBSyyIgPsE
	 HMWGbs+cWe/Gi0NCaSnF41+58+/Ryd0qhh+urnAHyG0/sFF0x9HJ5fCLyRMY+ZA+6Uem6
	 wQRjlYKNyXEuFof4VpiGYgW1D54EVyOxMZVOVg8syJPCJkzINnCjeMdeH3cvlaPesR99z
	 sooOTfoyUH450OTo/r7YF/c75Af6913Lrtkj3GO4teWcM1yPfHk/Fc8oKFBqskqgYlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1VAxCzk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVq6hVWa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3C606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F3C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1VAxCzk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVq6hVWa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF9D6334886
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=; b=P1VAxCzkWtn9zBeW
	Hsym7T8qt+1IqmD/MD3EU9b5HLMs7+bDuSxKLw6Sjg1irvMCMcDRlZeFEPfaGqPM
	9U92P2R35y58+cbdCp2cGva8+qkOKPs3xSFoku9mRUJxiiMXWaJCkncsfEfzOueL
	0KxiphlprjBSrW4pPh0sMt4QXRgBpHnDfqCBgnpPdfLEBwyVgDxeNZ9WagV9zQYi
	8p80wHU4My15p1ElL8P9F5Kwi6TO2YRMEpr01V/PM5iaNi0Fqi0Q2Dyh9ZFHUIjK
	V6XToE1m6pVtbSXrfTmidieJOI0lFwaTrc9Aca73Iz21C/5GUOUFQ2AOJJ++JOS3
	GFXRFA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58hs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:18:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso26697137.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233914; x=1794838714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
        b=DVq6hVWaPAFFDPYCX57zwoR9Qq7T8MqrXtwv7/pNytCXwv280LKTyPHN5926jVa1qd
         6grVZgdCMNwIqWM0Q6drVh76gJH0UI/jQfgnHyN61NDJOS2+2Qri/3CNnAdI/h1TRJRo
         184sKhE00Jt8a7ADCnK9vcCF3vkVAJXP8e+ovMVVVbOVJemqbHt+DtFDBwuNbDZ/AvpY
         akpO4uewbFBSDhVssbLOe1NfgABtWh7noG4mCTKA+ni8pxPdkCxVzjH+61t7M5jzUjY/
         SAdOUAVlUY2UUh+w6hcAg/jJFCC01+jtem3B4hKGGaViz+yeVW3vm3/rxGnopGJc2DWS
         UhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233914; x=1794838714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
        b=E/mcxHQ19Rm35UK9o/GeX1awvE+bhKM87cdFC2EygxZGzBIPbwBPd9csXJs4SCVvuv
         65K8GvKs3C0WH4hJCNJb2FJsOeKIwKsLdPNdUYcR9rpiTYQxK7NIACy1UP3hjQpS892o
         +7TdSIL/R8yV1Ey++5wkSN9RnyxQzSLw1IIXN39616qN5cpE672wE86uHLk8FBx/Lr5C
         2Et5hXbE9yByGwNLNSMwpD5UhBqBgi71/1BFefrkFuR/PILbp5h/nGKCXluLtjdkASql
         ZkuydrvtewjP49QJ/K3E96YcKzLd5/Pr5U+BKyfiO6O8n9GYIQC8V3hi4NfXdYCd7CbN
         sCzA==
X-Forwarded-Encrypted: i=1; AL+hErEocm30r5aZIM0l/mkl/kFVkbjuo8HSnZJsr+UIR6l0FmXqIGrePTguhpyyu5so22JrpIQF5XRRed0DH0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kQtrQXUOPl2c76m/PN6wz0ow3FedH1OhSAvO4+Yput+76bHzv
	sHzCZxfDHskdsmEvri6eaCuFdwtmdcPscxcLQkW2ZV1sjhOtCI2LAiO1L3k3uSMz9CvRHvD2elG
	lqfmLLGXfJ0SCcyEzIQVuSMVSqx5FY2OewJYTMC5MGuPzXAEqj7qdf3hyM/5Kt5EyxCI=
X-Gm-Gg: AYBFou1bHVIeadVP/cwnN8B2DA5xEdFeuIbbZlSOFt6mTVajSIfp8JaoV6xYhu5+U5m
	v00Ck0i3Ihpa51Jc+xGMv4vcvah4LqRUtxq68+8bPrd0yv+ZVjgOr42DXokh/SJQbFJMlMsOT0O
	c8c+oMzRgoJtU3b3FHrHBKrqkZhwCLrmM86oL8dxmHlU+zpAwUIcjCpMwNDnJIpBszOE176+fXm
	YGnkq10YUEx4+h4iJhLwOiJfsPKYScAOZyZ/pxHJKkKC/OsDNnyGdtFVaFKap4DgRRTfv43rl2f
	jFeUuzGfFWn+QnCxBtPa/FkMsB8IcOTpa1cZnbkbU61QTXlL9FO/JkB8L3Yb1+23aSltw1wEnFs
	S67EpcP4ByAEmUIm2TwW/PNnXsdqRi/1rOFHS3MKZBAF27cZ9VAQfY1/KVe9POAB+X+rLdg==
X-Received: by 2002:a05:6102:2922:b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d2da6441f7mr1258789137.0.1794233914190;
        Mon, 09 Nov 2026 06:18:34 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d2da6441f7mr1258761137.0.1794233913751;
        Mon, 09 Nov 2026 06:18:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1708817a12.26.2026.11.09.06.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:18:33 -0800 (PST)
Message-ID: <6294c55f-97c6-4f6a-9d2b-3375473ed203@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:18:30 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Release OF node references in
 init_mem
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: irIF3sr91QYnj5Hi0jrPUriY5k7qq60h
X-Proofpoint-GUID: irIF3sr91QYnj5Hi0jrPUriY5k7qq60h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXzQaCOpSO5vU5
 fHs7gbWg/SaG+G/YOPpbfVLowco0hPlonl4+djMo8duXjDaLc8mq7rsZwY3va1xh/eaISotGtqv
 yx48GOueeDFxaBhwNH4glZOMvAJU9Hc=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1d63a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nB5WFW7fbi4sKZXQVyoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX1nZb03MOQemm
 sjWG9TdSdPkmT4MjQIPaH9eQy7dX+bEfJP70CXgfnBWjrq+Y+vSqq52MD8Mhf2H05olb8kqGWKi
 tz2KvvJ8ihpLZLUgyTLzSvQP59r34jMFw2Oj6kIdudXNlh4vRP/jE6aKZlLz+FRPcDOrd61paYP
 Ruo3lUwILrqCLZM6JKlOv61jbmxXM6tgITCjwvFtrfHNRSC9bhw8Mwnw8mHB/7mVgBkhF4cJ2B6
 QmUf/eTINVAFWgC4xWR5Xftz6A0MqpGAB/DjyM/5T0Fz477G5l6nVAW+2nt9d6Dm53HtipVYjI0
 KqW5NtLSxe8T6r9Q/ezat6vbMS1BRZcp0fgG8SglG03WzjkSdvFn0CQDFpRpNtbXZHYwkkJZaEV
 dqeo3VJscrNxlNICWvxRAyeV3VWzW1qaTNZr0OxAQSrqnAigs76F3xMwAu7SRpo27/2VXwUneFu
 QgJjUS1A9ATHeRhJ9ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 11/6/26 6:45 PM, Anup Vishwakarma wrote:
> q6v5_init_mem() parses the qcom,qaccept-regs and qcom,ext-regs
> (index 1) properties with of_parse_phandle_with_fixed_args(), which
> takes a reference on the returned device-tree node. The two blocks
> copy the integer arguments and never release the node, unlike the
> other parse blocks in the function, which call of_node_put() once the
> node is no longer needed.
> 
> Release the node once the arguments have been copied. The leak
> affects SC7280 boards whose device tree sets these properties.
> 
> Fixes: c842379d00f1 ("remoteproc: mss: q6v5-mss: Add modem support on SC7280")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
