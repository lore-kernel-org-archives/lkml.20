Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A28489FD6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990554; cv=none; b=DhF5ewV829pIWrehoGscW926JatXP4tHIExWQijGGx9eUMYUvV2vE3LP9i8BMraIew9oT17inlnFrevQXo4sXSagf/Ugyuv44c1OocCIZoYqAzwNljfuj8TcFgi3NLgz2s2wP51zB5GnHxYeN0ZotIHE9SW8TLrRq6blMTegh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990554; c=relaxed/simple;
	bh=HHlA3ZNEuhKfDm4d4c+jXhjuKOBy+d2g6bs8QECFrlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m74vhzhgt3nk9gsqNTjXxxCUbZEmBqXhW7RqpoNUITvHjFLSVkAYkpZ7OdDUx/8E50IGccXbzS0W2zclMEWL0Q/Qp8BOqryKbIigBv7QTZJ7lw/AjeifekhStEd1mTAe3QTf9OFR3PgVLMoxUZVp7rhZxeY3qR5FMbs9k2iyyus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bH73n8kb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fX/kVP7A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bH73n8kb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fX/kVP7A"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe1mO1563503
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RacektqXu375c4L9KiAsUvB4bKjBE5jyOEGZ/c/EWGQ=; b=bH73n8kbfHIr3Z6h
	aferxfmolebruHmuFDXcgrFX9YFgLBGPJSNHtbJiQe4q/2EINyd9k88N/53yncrL
	9s0a+xfCuAA94pH0n1LZVw6QuJt3zTLcza7ursBiTf6Vt0/rXH3/xiMfpRYhWKFj
	LFczxy9j9GRJW8+0INzHkN1JqTUO/1lvZUSgIaAwP/PJdko/9vRj5kOCvLnEuK0p
	YE9c89g9DaNjaf5HYTKTkWPgjalmB1m8RJdnHHcB2OUAiZpZSQ29ZTjTlok0/uhc
	cZX8VGOS0xhyh8lItPof/2VyU8xWjg9ULbXfJYKVkEMowy6pAp391DwzuxtAlQtK
	REypLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw12na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:35:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso76018585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789990551; x=1790595351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RacektqXu375c4L9KiAsUvB4bKjBE5jyOEGZ/c/EWGQ=;
        b=fX/kVP7A072DsmbsjP4/o6mKfrJDBecmyLsdhCXfRIuT5BPLyyehbGKe+WYsRvfpMx
         CBmM1z9Tqr9m8P8U6B3WIJ6ut7zvXW5Ng8STcuosAYGGoVVh8j9W4AU3wCNI+V8JHGyA
         IsuBvfegsGE2mb4X9Gc/3qjL/aaDmD6yM8150P3JrxwWqHjhVijoASJb8IIhGYtRmIEa
         RAqK/079nJS3n8YWk9UNCAhsKSxOBPJiV73sJfzexwFGT5oxY/OVzG6/2TOjOSv8KCL6
         du6b5+naRe8xp6IZs+S+akneu564vljp1eoc8yfH1YPCM9t2BvpF4B4u+JijVNN8RuSF
         lMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990551; x=1790595351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RacektqXu375c4L9KiAsUvB4bKjBE5jyOEGZ/c/EWGQ=;
        b=GsNTP5sWFUCuJYPsPyoXsJa51ue2ZA8TQICQ3bVaFZ07YOFOEqY5MVnVc0Txxa4+Nd
         WshJWto9SB3WacLy23qCE+1Srb1xInCV19r0i2Y3vC6fIWLSa2MSdTz1RAybis6pgf3P
         DK+3XWnJYDAjn7Ds9R8TCktS9SKMhhQpKMH/VgMzH8bhZy8YKhJkKjb1gwrX9g5ws/rY
         jf9d7OOSBNvXOcvgNhhLOpcssjLIyRT4BOtGdSkJAANcZMTw0mHFePPbolhGjX5TSJQb
         E1I+SXvdAY2u1TnzuEhhZlsolFx0hqFTsEXpp9kzJjdmQ0dXE4992vil8pP4gUVoTP4X
         Xafg==
X-Forwarded-Encrypted: i=1; AKwUvBxHGXj9RdwY7K8Vl7/QQfyTxi2x5zr3OBOXUwei8YwHxX4sC7uCtyyHJ8i0N97CuizKhHGOaAQ8rH5yIWw=@vger.kernel.org
X-Gm-Message-State: AFuF++kQlTg1uCtwwKHnOE+yYHfc9oxdbxJA0NtoiVWhaEfbnf1OKMG3
	XwVEmExkGbElcQb+W9n/AYmPiNxlPuC1V9WCCDzOaKupRZGq0JLmdfz4b3PpLQCohe6hRtfocHm
	DW/biLIBNAxZK60RjyzuseuIOLB7yZbEkccduEP+sTK/tj9+aoZatvkG8C7W0huIR8MU=
X-Gm-Gg: AYBFou2mzBeiv3quWtAaeAWnm3ayW/a9DI31wPvhRvc86Xb8mDMwnl+4I/66XbplZSO
	Q7X7O/PoDxwcMzvYAbUOk6Bfc+8lqpIahMBy7lxFb0FO7ErOgmTsnHDeTjh4drRv1SvIupagZa6
	s9ypcNF+3jnxa2ZE0pg/a620RuVN2XJPrZ+YnAXpQ22RGYxx1otrKoNfKEZQz8wwYbrjSHMO+aP
	glNtSJ+1QnD1/uRZAoLOMH9AZyXP4chfHzK5myqMbLE+zqcPvjTMPs15haU5lM0yDpOhj5hgQbj
	/EUZxOVEdU0SHrRzHy6Jpg/STw3I2F78rkBLaOZEg1Vvz0X7xVZpFppCze+nuz0xO6kEj6yUx0b
	WSFwGYZoUYuSo02DJEWN62Q==
X-Received: by 2002:a05:6214:5b04:b0:90f:1a3b:b20b with SMTP id 6a1803df08f44-913fc9f462cmr884646d6.4.1789990551415;
        Mon, 21 Sep 2026 04:35:51 -0700 (PDT)
X-Received: by 2002:a05:6214:5b04:b0:90f:1a3b:b20b with SMTP id 6a1803df08f44-913fc9f462cmr884306d6.4.1789990551084;
        Mon, 21 Sep 2026 04:35:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e18fc5sm4196752a12.24.2026.09.21.04.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:35:50 -0700 (PDT)
Message-ID: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the
 embedded controller
To: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914082950.9393-1-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914082950.9393-1-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2NyBTYWx0ZWRfX1meTGo1t0wA1
 zdG/TekpjhL341q6dm/Blb+QQqT4qH94gcwmN7uTxGoZcVT5hFrHm6AmUU10ZNpN9ce/NSwwBjK
 rix0OwFm8+cLbHL0ayvuWxsdXhgGOL1Hwe7xj+DmS5mrbKjXAN+WdD5MfO1plHH65jGpfaQ7Fko
 O1f4hyDrza9l5RcoCUJqrq7DvdjIg3Hc2wR3nT5a/XqkcZWIko3kugldMWF5z5zVV0rMF+qNLLd
 jggjI32e7P+ign/E6okDIbUjwOnpAZt3RKfNX8hCG48swhkY+7xbXxFyY2+WCwoVG9AwxaEHd+W
 7DkcOXm9cCtAiHb5sm1ACt0BJK7iYCElo+DyCdZaUESgwXfhl6MQhjPu/qmnPDaIavo20LM3Mi/
 spXWsJWTor8BcMrF05IV56+aE5aie3xsIAVpcH1X/gHr3SGNjOGQ3OfvX88BEeuD4Xvpp61yOMK
 2J/tCe3mEKknVxZSlBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2NyBTYWx0ZWRfXw1Ntwmnj39ph
 xGO1TGIhcP/I5PMjyaTICUTsYat7Oi5JBKDAKK7BKNHxMBQSjtorXyrI2BzoCMv/zvcV3WM0Ucl
 zTE78Qs2X/eQoLkSoxNB6qfpDgS4rgo=
X-Proofpoint-ORIG-GUID: xzIXZJ1EQNvXkiAr6pSmn0rD87bpO6eo
X-Proofpoint-GUID: xzIXZJ1EQNvXkiAr6pSmn0rD87bpO6eo
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab11697 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=n8V4RSI0IBY5zkqsj_gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210167

On 9/14/26 10:29 AM, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> The binding and the driver are under review separately [1]; this node is
> inert until they land.

No, merging a node without dt-bindings would cause DT validation errors
(which you can check via make dtbs_check / make CHECK_DTBS=1 qcom/foo.dtb)

> [1] https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

This link and the paragraph above should be above the --- line, so that
it doesn't become part of git history

Konrad
