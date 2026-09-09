Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F6568542
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965447; cv=none; b=SMnA8NiL3UG0NFlFZuXsDkA4qFP/5Qws7Yj6ajdw3Wacfv4rqMpKZXJA2RDoE9QQZHmGp5ythZH6TIs9IS/x+mT+PpHBaPI0JRn/hWCgXwnqUW1esgHmPSuCyoF27oumUHZlaGXyFtB5Dmw+VbwZMSYoJo/v2NZoXvE7pP2cuQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965447; c=relaxed/simple;
	bh=I/3jxJiKFAog04xwE1TjUVclcbiREF++kcvKc8InRjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYsINMATRLmhiLeHQuff/dZ3WLXEv9gKLKD+BdvcXxOJ573X/mvM1onyWsBZ6Lx2KWDC0lwEpXawbV3vbFxVqMLzQ37Z+mvfr7lTV+hWMoFjlWB/rA1RH/8MtaNlBMa+REIS1jkM2JF7lWH8eeh6HO+j5mOTPac2HAeUM110HQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iku3K+fV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+qyKtxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iku3K+fV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+qyKtxd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6NP599754
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=; b=iku3K+fV7u7wHY5q
	VA/Q9i/dsYog2LWsig7VmLJruKngKU+46GhI42u92lhNPiNq3mP9soLjzh75mlPA
	1TxEXKcBpa2B7NxmKqwXMyIWaespUQ4UZPLyjEhoHUCeySVdtxvVhZVpUUmwkNHK
	vbLbDy0lZYcGv4zLYfny4/ipdPUthYGefSMEAS54UWquyADN5etGBPEEis0U588r
	hgV35xALbJYDu2i4Ys7jAzijoNl44MYCd5goOq/8Srma4sw5fmbuk2RgyY5YQrIN
	rtISU6QZll1416dHhL56yo3Sx+Nm+spRXvlKg4app5dg4CXsn2dgvCqxpudmsuWS
	e0c/kw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2vb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:50:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso184597137.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965444; x=1789570244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=;
        b=T+qyKtxdJpIL8SS3/5ZT0zOh2kXCHgmyB2e0zgf2vnxpKPHAZbXlaa67QSsO6Dlzif
         PbVhzPFXNX3K2uItLaD+lA8THoGZ0umI898MWrYErdlv6Dcf/ZRJp84RFp8DCozFClro
         Y6EjSaevLhOPTtYnfquUljwZnxeVUWbJ8srgPN2jfKpfJe55+7M2xZO+oBKY8GH+UwwJ
         pSXtPNLfDI08n53b1KNEoN46lMVhqFME/UOaMNJ6OYPTBgiz1vTGTihi9Jt7u09ZpcJq
         qUC1N57UW0RN8cp0pna1AU0IL/51JS5AcluQD8TX3w2OR2uz+kvjEXsp5GurxqvLpiHs
         zVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965444; x=1789570244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=;
        b=AnxuNUyAEAbVwP1+cg16OH0m0gPFMz5Du7+pPTvsmQFs2TA5kGTVUheFIeZdUJSTTu
         wSUhT07+rLwUH4XNxm0TuPzxBGdATyof6U+8WZ4OZUspq8P6rb57PJe58smMwu2R8B9Z
         lrBj4J0ZGSywnUjE9ZpKKO0dTa+5SeRyTJMuMRo+pYD46bTZLjWlqnHz1N4MXIom4IoH
         P/3Rh5qUV3Ho9SiuR4s5nUxPGZrKEyHjgJ2Q4uyIiMuvfT4SHhnaPuicBzDmyAAjk1/k
         MbwVCWme8ToRaQFy/vpEL5j0D8a1WfIpWWwd+MB3ELcVfJiHptD5/gHIuqOmT5JNz5Uy
         Z+Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwHc18YkNRsIf+AHv+QXgqqXqJFuxQLqBy3nP8/ro8NQrUTQd/pZgAKRyF7QN6a7lPxbR8eu7JSm7yWHio=@vger.kernel.org
X-Gm-Message-State: AFuF++k+UBsU9aU/Vy16fE4FqQxIMbIQqPzbAwthDelmv2aDkzMViqR9
	dV4vSnIppRsRPsRZexe5Q56nfZVpoJVvPQLAGYVK0Jbo4uG0TQ/xYcodaJWAHthxnzs0n8u4r7j
	15t+9f1y+c535qnGUD8LpjbbV2R7NVp7YoptDmULRXJc7B3xaTB5+m61Z2hbvDVars/c=
X-Gm-Gg: AYBFou0vWzEbB3m0kDjgqtjgA69XZdBgic0azx5dG51KPAuhgeodWnJwMHZmhQd1M8p
	WMySEEeWWBOLo0HFMSnrTvEtMSmBKrJBg7tAhQehmUKfPMsaQpjAQ1eca+zeqBTtApwWFS4uEcI
	V4Baq0De6OuqerMjo1iwh1VysXJEo7xywPClE8WeObk0HLLiGjB/7+zapPenoySCNpsQqI50aWd
	O1kBCVanlxcS79dMU2soCcZ/gXTcGFn+qGMULIloObQpt8OZ9IsO09R1gJK8A9FY8snNyEBWSS7
	+4CMff2GYJxcp1x0uI/RVc9uPFjPlyOzHmtJcS6H6CuRJtN2u99hl2SylCat+wMO1CpfGit5wyE
	QBXM6DiknGBPOGkxzCHAdJA==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2883030137.1.1788965444072;
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2883021137.1.1788965443567;
        Wed, 09 Sep 2026 07:50:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d57fd88sm767240366b.44.2026.09.09.07.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:50:42 -0700 (PDT)
Message-ID: <c2f3ae91-4f0f-40ad-b03a-6d6340ec6244@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:50:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa17245 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wyx5Qp5Zs_5CJwpGNdEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX9fUeRJcjl4Mc
 B+ixTaDZAhJxceQksc0g7hrH6ssKM7p12KgO9tc/CaaUbqnf7pfNRuLLfuipWbaR//Hi65w8WlV
 OB6SheeORmT4U2L8pDBAmxZG/ftGTRMeiRF8/4PCdH5Bb27/bXEEF9qeX8mhNhnXxWiSuI+D4gd
 L/ne8RGvHBNiFe2mEInlNJe9KzPjBNdNbSccTN3AHL7w2rFJ2XeCQwCxvo/c4+LZfNoy3u1E/ah
 Rw1jMocQe45rqEl5kaI7qcXx3WJnT07Jr+d+PQ/T7T50PUATzn9ZeoLf9oBqYxSKGviOPGQKt2Q
 hElm61tL/Teyie78xvR6V73E31BY0OhK5kqgwaw3BH6yV2Sy3tEYRAohFSoCQ36Flcm0P+p3Aza
 azHGPTiw57djbairNqdU0Pt+QzleOAYDekveM0eSDa2xMc86smH5GbUcbmTz/QAqOYKnqhGA5Jv
 33TDgW7fG4EzXO8IVPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX8QucsPPtxcnU
 J9+WtvbXerb8+wnnNQ8zeoa81Hg1LwfUpA3i5+fNUV20HSrhbebrlP+oIwUqao9ZvrdgTcuEVLo
 Kb4T7g4F7MhaKqLtRqwxNjbu9RC6w3w=
X-Proofpoint-ORIG-GUID: fCDG0qLSiayshAM9FSUdW4erpZy3oVxQ
X-Proofpoint-GUID: fCDG0qLSiayshAM9FSUdW4erpZy3oVxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On 9/7/26 8:33 AM, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---

[...]

> +&i2c8 {
> +	qcom,load-firmware;
> +	qcom,xfer-mode = <1>;

This property is undocumented and unconsumed

Konrad
