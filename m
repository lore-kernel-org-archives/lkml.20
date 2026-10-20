Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501663;
	b=YXYU8946ILMnLdweVF3XlxNyqMXRzy325dIlg2FQYaIjLox5gI3Aa7wDf5ZSUaUqdY/b
	 aXZCbM7ZB6uNpzleAE1XxWRUp3zoKky7j2aRgi3HFN+TgxKAEc0ZpSmkCjg61De0XSuZd
	 T3HcZwuRmoIUk9pYbW9lzffNMU0BULbZhQ93LPJxQ9+CWZcBHoJWb/pKLRVN4dF6rIxtL
	 wTLriA3eztx/FQhaMJaq34QFR7lN2F0gmJIBm7Fry7VtWTw6SnZKjJ8ZNOR6uo5HKbNzM
	 sgxz7zySD/3+Cn+5CMwU9HNzgjjSeyOKKyr6rJFGmH8s/p0vGFum6XFqMa+9/AQWJCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
	b=wOT40c4hZ1sARs1afjCCG201p+sm+HAsaFzQgBa3WlyTXNqW3eh7R6pWCeqN0MUUpi1l
	 PBlO/O1iHgc0IOPpqiAJdzgNyazCSpNSE1fMupcpEch9VzIuz1pRICudD7abg/7rT67gE
	 yn85DfwHJFq5lqpwraLV+SD4zWt1HMAVrREczdpZM6yNnsTF8Ykf7zKfyRzmclTnDMGTv
	 /LBWVW3xbpajjg0DiEKXtaJz1DUdYNCOo7LTGqAyU86pvWt7VtBmEJbNtRCk5SXjJIZJ6
	 2sGO/BEvQHTW2Egli083ihXD2mbRDifQLke6XdKoqfkiE3meky5HygCAfRNmGMiKy7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9U4mXOF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuHqGSCT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9U4mXOF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuHqGSCT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx3Wb599738
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dHtMFy0XbgvQcqpGji9wXowz
	3KOsd+jONNfR8siOCQM=; b=T9U4mXOFH7JOJkvItvsuIFvBGeMaHz2dltnDo527
	moLyl6EazIVCHguKQjFTVMSJC3k2O0+ROhxUeJDvOZqV6KCcwIN4eKEieULyodCD
	+4/HLbg43xYz+wqCTJpxEWUwy4c8ZACvMCObVMgRJ6LAqlQGBqCIHyzqoI4mQtaf
	Xd5qvOZiC/fvwt0B483UTA1rDn6qip4GYUm5nJk1K3NggcCunho0y5caAKNspi+2
	XgPRqZI+yPlZjE3ikTH2rWcpZuPUV0UHC5ShWCkPycFsdKs4CA6U6THVGzLFazk0
	TaqlTWBG48QGXHVWFNvNfWLFOpyyIsftmdYlpERrLvaQpQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2jch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:07:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99076c676cbso240896241.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501662; x=1793106462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
        b=cuHqGSCTlekNtKPe0C96yXEFMNWIydl9e4c/jA5Z0zqxWKZJQf8f8ZoJfO7E3Mb+cy
         GrWjTSxmP3EtYnYldJQ/fjDHZ3jhg6qB6uPZGXsMiqO3uFTLMhFHXiGjQq2NQ2NUsLsE
         nGk2LmL17GYTVyPFcRHbpYdylUcW4DbfUj4eSvnE/TSz00f528FxmWTtBNesN5Do/9vX
         JzN6hiNveiGt4xm7dx8xMnUzGQVsEwuEfvQnMAuH85yGhkKCfMIDkvS7K96BGObV+Pjx
         wCooAJu7XtxP4klDz3fRWTei34EQZtWp0zNWn5ieDSLc52XQIsT/uN9mUEpPNgZV2fCT
         fQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501662; x=1793106462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHtMFy0XbgvQcqpGji9wXowz3KOsd+jONNfR8siOCQM=;
        b=yWyHr9oWDA1niXqGVQqlzhXafIRoB7I7x23EunifxeCtXwNwNJk24fLUtOWSQtBm//
         ch672p9QCQb/HXVKaqNk1RLXsUTMdENQQ4vuolGiEfDgSOeaYtfKQ/oWezS/XDrnQ8/s
         s9MAXCcAmKfSCi1/z/r6dOEo7d44f4KUtAA4kOlrSECcki5i7hnRXFNS/twzyV2f9ihg
         F88sKVFCYtIU6a/++CoEL3oJHZSGXflcO1RlPhuL1Kux531a8eFn85CZOn/GBJ7JEjFa
         GflAZaOvyhsOv1YFmARZBUE9OV0gvMzEoO/UZlnmmicRbOQKgnaJl2WjAdYXh0tKHczY
         3/Bg==
X-Forwarded-Encrypted: i=1; AKwUvBy8OivdRho0yptry6HiF2TZtngmGRdvdF3x1iAgMFnt24UWihF8+343hgxSN/gz/2ivEaaoh4tDTIbeocU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuuxlj4OxcdKZ1KxFPNvFZjhT/qH6Lvv8gRZiP0xTYA1nrGYFK
	tVMT6QcHin77Fibo4SUb7CfLQgIMkCghs7b81rSqhpF4kGmrGC2ETYDg5XC8yvL2RQeoGIc45qx
	nbRFT5Pfq/w9yGjJsoFV03n+CNpZo703usjxLLtZLnZ+nwNJ+l6R/00AnT7nrfJ39ZS0=
X-Gm-Gg: AYBFou3o9ztNp82HC7tDb60MeF966iE+20Uu8F/G+eEfhT9YrxzTQWfJ9TEbw31yvaQ
	6TqUNbUa+AN+Fe+nNO9qx6wzr3S3bxUji2zh3JBwHmBocKsV6h/FkZrbdVYkhUfrKKTAnxUJ6Gu
	p+fA0U48/UduT9wHPt1vZgqTapHTceOWBqC9WGmUxRSyqsJ7Llby3cM3DXYpJ+soE8NKHx2UdzU
	MfOEMRiaJtWvYrW2ejXwev9iOVg3PiV/QvQGibho/f8XTtdmlVC4oHjjaeB+ixyzCk/v1Kfz/H4
	WYxPxdJ0PjvO1+Bx6ePwnVqaZINKaQLSS6kEG+3xgryFG/t9MQ5AHs4s2cl+iRx8+wQPHXHBMEq
	b+7jtbFODM9AcSytP
X-Received: by 2002:a05:6102:4193:b0:7cc:1942:c156 with SMTP id ada2fe7eead31-7cc36a827aemr2633456137.31.1792501661541;
        Tue, 20 Oct 2026 06:07:41 -0700 (PDT)
X-Received: by 2002:a05:6102:4193:b0:7cc:1942:c156 with SMTP id ada2fe7eead31-7cc36a827aemr2633447137.31.1792501660992;
        Tue, 20 Oct 2026 06:07:40 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d97b7bbasm4264685e9.0.2026.10.20.06.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:40 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sdm845: Use ICC tag defines
Message-ID: <5rkmjbhbgodmfyhd3rd2w3tbv7onjoclqojiehd6ug7enrnlke@jrcx4nt62r5b>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-5-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-5-cae8d22649ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad7679e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S3dp9cuBsdvKgzaJaSwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXyQAiAPoL9R6q
 rn6qfrZvHGZUy+LVNAm9CFMhG/v3ZE7DUrUKeyq5Ce/pGyR8NrSaI/JVIxydNyNp/6Dmc2JCbg5
 ar/mk4+gBz5Z3R9wSCV3Xs6P1UrX/wM=
X-Proofpoint-GUID: M2cdX0zqYOtcXkHbhVZkMFSn3xqBeIWQ
X-Proofpoint-ORIG-GUID: M2cdX0zqYOtcXkHbhVZkMFSn3xqBeIWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXwwHPJtzRMibR
 t0QiZ6PMoNsH9RlGkt/glHw78Pcstf9yM0Uq7Z8fDWr/00kSVgCGdxca5JmQic6Mpuakp2p2nvk
 EgClB4itK7d9Sf+BbVZQLag/vuUK2tK2YWY+Mz0c7nIyj4/iywfFpyYynerxd8c0pZiLTzEFr+f
 HTEoVCf35vq9CTCMmrCqczpVGq5PccplveMqzP0wEBAeWHooi/vMqJpgbu6HVq4YXwxeZMEETRZ
 k/SRwS7EQRpXvgGi3/dcSvlVpEzwB2R/hPC7SUmuILEhJXoR4KzY8n/w4bGkB/sCMebDe4wiACE
 efSIMZmg7OtdeFrhxeBDpiWYjTd8C1tlTYvsNhKWDp8V+jtolrnSPfOeZPHXngbJBQoFswHUo/W
 BnH2dTzrHDwSf+kgJx6E1RTrYMubteUjU73hZknlf+qJG+Xkqlv9XasY4v4+HgSf7l7ftdfpTZb
 OiEAB2hpqhvSczors0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:09, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
