Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC1C4B2045
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865329; cv=none; b=swqLL7kgyv9fpGaZ6vnow09HjyWJhYYVsEzPAaUfQVRHqffSz7EfUZuxHU95Q/5SGiKgJUDe3iF3pi6DcKHfjCiK8BZjOZGVG+7+e5sFsGZdqAiLXbxLqs6vuAPXgOoMehYVsP/bnD+IJYK+8Co/OcJQNSLj0Fflx6DCiCvRK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865329; c=relaxed/simple;
	bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3FtBq62y2G5lAoIG8n+pfmLPEbDXWa+ND+B35+DdgQysHRsBYQecOzemQeeIOFgshDi+s/AVNorkY/OjAZdtmFTboL5sfsx7Yu7ZmVFqluABhJRStrb5kxx2TTuy/Hx/LV3HSF1nv03mIjOrN/1K4XpPlPEyfCzl+cvtW5Tgho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7yKtaBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUw2re0N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7yKtaBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUw2re0N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADLCq2596015
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=; b=o7yKtaBdaCxH4nN0
	VOUWEwM8q2MMaMQ4ISuaKAlmS26Ud5t2akywVqneFO3zXLCblHCFDMfjd3GNLYOQ
	34ckGPXjdk8N0xkmmKmrurGFgqdq9CRrQr/xuBjMYvcA/Bq9HA4WbQJ4QJUVN2j0
	XG4P9jDUUyImectiyRsYH/d3NrdOpXBGujrp+0yOuSEWu2joJYisZT3KqrFbTun6
	lsmexUWzwgQHgWI1vECCGx/GjKO1BK/b9kPDx8PQrJN+RGcgvqmv4R6dBy1Vo1gM
	zfxTaMvvkvB7k8wIdfcgbgB+997Yzfqonwtv+HqVgA3ZmurxTLAoyxQF/SgwGr45
	r6ckFg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1cgkbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:02:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso105596137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788865326; x=1789470126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
        b=iUw2re0NhoXUxtgNKsJpePu3MBPl/YsqlsJVhUGDO67PD/HFiUh+XptxMG865tfPNB
         E5yXMEBU4z11QoOLDuoFOQ86+TDE6Puymr2On2jeXSd+6FyGbc+Tap6sVhS8muHwYTDe
         Y/60eiHNEKOfDiS6BFdNCQgVA2WaI+sQepGmnX1oLl5168OLakoyJCYYxpweZISTYAq7
         SwbeAGL80zpG2gYp3fAe/81VCfc+AG4svJyJmZ2L+fNmorDYXZHOGFftdDSvnu72C9Vi
         9vkcjw5USMcTRHz/jSvKmhnVyK4AevA9fxKM/ICgHQhExcovPEp9UTog6JCePN8d0F74
         BAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865326; x=1789470126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
        b=VqWZD+u3HqjGKklahry0oCLa1vh2A0w4uzqEWltKjtr6jiZNooJ7WXUvJmLspbSM94
         Ug5BWOlhCzwgVv1ysx/ZAiHEZrpACx9oPqoQKqT0jub2S5EWYTMY5DEWuYBPhDRosV89
         rkKlxoeK2h2KkkGIqaPx1uFgkE8WWnH997n/ZKZvOIzbJJiwFZaK6rWyJz3IHEaSw3bd
         KRFj3XCT7pz4B8XNh+AqAdHwfJKS6TUNFxf2CkJl3puPRHDhwfxPkwxQg9KVvpwyO3bi
         liq79hBdPA9MTMgzQBDHhNXhGcK0jNGAxWa5qobWvMxl+tfF/5MWYpsrc0l+EMMNDdvA
         Olxw==
X-Forwarded-Encrypted: i=1; AKwUvBzqpXHaPacyjvuDdiAO/68cf7NzB+d6tct3uK038zjxvIuIAPTXqWcOVhBEXfsXX6K0Y6iZ8itZJPhMTIg=@vger.kernel.org
X-Gm-Message-State: AFuF++m2+3i55lMWbTsFD0XQKqHoRZJjontGkluJdBQeGKkwuFqlq1rq
	92W1o3pj9kf3R60xqna2/lvKEFO9T1JrYxk6QzByMy1RZrw1QtQS0tPavMz4J8LTEez93sP1s27
	R7gQLQsjwVEHyIa8mcCIR83CKeUAXzQ7+cnZ5qKa/Mqp7n486UudnQoHhWfdAASNpf0I=
X-Gm-Gg: AYBFou2qgLjgInYgZPmHUrXnulToV0l6YKDuzVQKowypp8vtUXEAM4Pwae7wD5NntZP
	CGk6GMpZpW9qVPLOqgK+a9yo9Lrc0ny0bcMKtfgBb8ZwdMslIqlnTL+LBKVOS8ucWMat5RUGCPI
	q6BPj17lyxy5qGww8HAofm5GVSfZ+YKJx2bQHlYTUlvD4KVVdygNvokfVrSRKdD4r5YF0fqaC1A
	gD1zfiIuDzlN16leRd35xNTTUXAPzMUaXsuu8wzpr63cF5WMDyyHpcx1KEtN89RII8haYzdKXTq
	n8r77GVNTJuKjdJ043P/buv86i+0A74H5ellkDSlYZhagEBYnwcLk6A12LhS5pWBZg+LikokJNZ
	TEcgNi13gM3r5RxAcUyE1vg==
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr3144939137.2.1788865325729;
        Tue, 08 Sep 2026 04:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr3144904137.2.1788865325270;
        Tue, 08 Sep 2026 04:02:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm607243366b.23.2026.09.08.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 04:02:04 -0700 (PDT)
Message-ID: <47344b6d-d64c-43ef-9344-0409a434ee44@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add MDM9607 APCS IPC
To: Dmitry Sinyavin <sinyavin@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908081158.2399852-1-sinyavin@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908081158.2399852-1-sinyavin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6a9feb2e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3ovIoLsmiQdKh0zOvnsA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Zi5t-rARrB3L0gmwaKGXFU8XcsuoA1T4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExNiBTYWx0ZWRfXxQ5J7OWFQK0u
 CyySXgjn8j1oBx79TuiXkc8OVZ23pp7l2PaLrjAA+u/PRCXr9LXCG4gtgv/rB1YWfnz82Eto6sC
 2isdHMenyoSzHzjCUnPpkGbvcK37iiI=
X-Proofpoint-GUID: Zi5t-rARrB3L0gmwaKGXFU8XcsuoA1T4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExNiBTYWx0ZWRfX4onx2sO/GLdQ
 FXCtqJ5PNSAYfNCXx8LXRzWR/GxETKAbV5ezH4tBrQmM+GZvvOS05tQV8yCOlLSulP8Kg6RU84U
 di8ZSFGtK5AwxJ7ilqQifX2QoRruBo2rXm5eQKbACYZD8uG3kRalj6b44R7ANzvK1x8JgdCzxHu
 bXd3+PdODN43NfxD4otf/LSvhYeyRc5cQTgbGGgc3w6f9iANALYTn/BHkkxrgfnnAN5sd1pdfNL
 Qrwnift24XngXu2akYkWEr6++u47h8Nj+l6ucNt7ZiMB7YoXVptCzIai3XVmd4nuRoMFmLYhghw
 EUgB87C9PwNpicXloXfQscqbxNQL4ZLjPNbKBj6omPvcASchk988Mu0FC45jJsDV+pZU21y3dtN
 CY157CRSex0ndG6vvxlyV/RJy4CxwACtDo0T5OSZZ4VQ0qqTPLFIp80z+pqlgU0h7SOqWvYwn/U
 fGLGBfFT4C9sik0fcbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080116

On 9/8/26 10:11 AM, Dmitry Sinyavin wrote:
> The MDM9607 APCS IPC register is at offset 0x8 in the KPSS global block.
> Its CPU clock controller is in a separate block, so the existing MSM8994
> APCS match data can be used without registering a clock device.

Aren't you going to bind one to APCS though? IIRC the setup on MDM9607
is somewhat similar to the one on 8916, although naturally a bit simpler.

+Stephan may know more

Konrad
