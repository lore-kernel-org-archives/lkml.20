Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098855;
	b=JFl9hlnnl9aJqICWGLXOpkgbRfw8ELFkE+vPvbPUN2t6xywAWtrV3nhQ9z3kSQiCBJbm
	 LccuZdF2EyQ6KpmCRIr1XwziXvufZuhRLOlWmIQ3DOffg6Eeb2R1JrWroJWfNH+6Cw2/R
	 D36TNDnux8RPGfOsslMGl2m++jeWaljsayCWUdA9WT6kIB+hEMNtBlIS8nIAJCWLaadO9
	 N3IPyTDiAZ1fVwetIup18KXdaRvhOR+Z7FylK7YV0nxITN98fPhFek9BAtNUUP4dN1RoQ
	 S+7gVQ25dlWPLQEn0hk8RUztmUTHqcWHXxHWP08aOKgVs7U8LJgSPAOsshgddEMg//g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
	b=mo63O6dogz0x5QvnGUhkCD0ghmFsbv229cQXvscYy4te3O/rfc5Ml6sQ42ltnqTo0D50
	 kpCkPGe9B1jUIj86PoTEKxM8XAfQ9qUMHioAXdzIEtH9k2+glQHJ/Gy7Gb+2EU7oUzcwI
	 BNOabgZTzT2tCY1qSnEjruA9eftGUqpvlxZ/7lb8sI86MCoiPQybIzrUVRnA7Jq9ikpND
	 G7EXCmGkioHosgYjWlq8tCZU9Ums7C4V4Hzy/h6NAFPcnn/mnxzyHmQMvZ/8Ils8QpEL0
	 vYraXmHePQ8lPQXjemGA9k5TstJgLsY3FvZeiP3RkB0at+AmpILXjfdUAY3OXUMpo3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g6UyFwRA;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AN+at520;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35920606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35920606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g6UyFwRA;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AN+at520
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvq42523905
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=; b=g6UyFwRAdDpub3xv
	KavARD8Bjry6BX3/Vaug90AWHbvNAlnHsYB1LfFUWk2cyxTjGgJyJlnby68w3tcl
	AEMJfA8s/vnOPVIzXo60vyff9UqAzW4u8C5RhZd39rAzYOJTWWkjYFjefKZ/iyaa
	PrYwlLX120qSTGY7KxSbJomU4sxqrZpmqBFOq+hx8fDpJXJR+FwnzRYKA8bqoVHd
	LWj+GBSb+tIZptX5zB6yxHcEhM9AcH3wrqAkX9T85VHvMPW7ROdczlPEGoIki20Z
	8VaDyPPnbnE0m+WFavUkq8UdLdYR084iZD5MrlSLFM0/zqTpb2odNX8CAW8AufSJ
	aogcxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20qs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:00:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso102762485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098847; x=1793703647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
        b=AN+at520miud7BqLNv+4TR2aq6hB5sjMyGIRyQqzUh9HUECX0ef4oWS+PIyW01cm79
         0E/TFGRhpo8hrq+Ld8MCULqiF9iqZkosK29u/XRzuEL95BYFU+yoT7anZgJWA5VNK18c
         apnbYxZqP3VQlpjE+FZCh/THMIai5qQ+xrkOxQzcLW6zd8ild+zCD67jxbfsYgYqzxwn
         J5ZbuxQFTlplWmsM42bZBTCU3aQNuRH+hAfDxcRj5MxSyb4sOezJ9a50t+ne7Snty+rV
         Pgdj3rJeWY/RVE2A9AaBvWevuLzgHwfwEek3wUY56qtOUSPJ69oanwPkg1FJ8sNjasPn
         NO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098847; x=1793703647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg5aDMm3VzAaO7yqXiSIZx4X3XJoH5B6cD+TxrNA9rA=;
        b=fGq+Hm8T/PCkgSraZ1gwPLkeaxMsd1wmooekX40EirFYC4eUt2Hbqnx1QfuyhhDmgv
         xtfDpAtZ4YES4kM8Q7kcWhMQDTYAcxxnPLIZ3UvLm59EZgjlitsi+zZDhF7Kj+mHm17X
         /4nkxe4YSOdK6ZuXiLIkzu/OFaAUd9q3aN96PLyDcvnaFkm50TfLqFjkV3slDpbRZVUt
         8o/e2DT8Qr9VsgCmzA+DQj79sZzR/tHuui1bNTByVg6OR8laoZ/EWsRfIyZIF5VeetwM
         Dsz0ti/M7Dvo4/T43os4IFcza6OUZ2kIXLsmccaKvSpLObdvrcxQ9zkFjPI6q5hkAP7+
         6aSA==
X-Forwarded-Encrypted: i=1; AKwUvBxmpP7bHPcOBa1qZfcbsjy52gwhxarhu5fo+5UiLYYqtIKmiRcmQRoqsNLGso1Q3LhbISndTocqLUWKXdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtRtp5e4SrMNEfS8bKL7oIB/zsAxSQ1+m29aYbdtcYXoeXnahd
	6ZMhU4I0XlCnHNRaH1XzjROerlZC6EVMj7sxyhx624H9ogePh/uq7mXzrpFGRuIUFwx7v1SRFcl
	YpJwqfwQGd+9a2kvlI+8qZKRp61BC3a7I7YCPAC+1x+1NpE+6YJFAWeWhm0FXFRGFooQ=
X-Gm-Gg: AYBFou2LxFYHahiToUTZatJU7l1D7qg6hRV44wYw5BZULjYWBIi7d5s+VVaKWJpq8US
	7ofCwIVJIu3ZE8Ck2W8EY1dhe1+K19+0Kjgzy87G+6v0sSRdjGo1Vt+lMrRf3EZclPDaJtJgW2F
	KzFIkieLIbLdKRO8cW54lk+EBFrMACbJgSSjYb/wCZRuSva1XBxr2HotGTYpB6RtZ4q+D5J/OE2
	IAyOIYm3vvyD4T9UU0O/r7b1iqiIRNRc6+wrIavi3leeQUd5ZLTC2drFSCKpJAhwzpyn5ljEk4n
	KkXdoQZMoqh+mIu+0m2XK3bLX4JpUd7pERcIG0UJJhSnpgBk+Kcim54FZirPIF0uN1kXt/yqkHd
	4HMFB63R316hZUl/INaQyaQ==
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1494957285a.1.1793098846392;
        Tue, 27 Oct 2026 04:00:46 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1494942185a.1.1793098844938;
        Tue, 27 Oct 2026 04:00:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm4706281a12.3.2026.10.27.04.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:00:43 -0700 (PDT)
Message-ID: <0032f652-4ba1-4a52-9241-635207f0caa1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:00:40 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
To: Hiren Gohel <hiren.gohel@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
 <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX6icbctNb/VAS
 UOXDEKu1N2LSCiMLVDy6V+/0CP3wxrqxm8zZajUK7N0RO4oxRhVv+QcoVedQbsD5ON7oTLd445D
 RAmZjn/Ybef4Gc9rX2isxw+WsqXqnm1q1BFbDxshQIAP54XcbqmUJRI9Bl9qgC+jkpPjiwhHbGQ
 zuLzNDGismTVjwkuNQPJPc1ypPTGZT8/ib+x2z0JZM0Z1hd3yOfLbyutzJd7mbkIaL1MH15/9w8
 R3RdEGttPmw9/iYQoa+4YPhiglZxewi3pnV62IynuQ4++ArWOkmVbcELiL930e9aXcfmewBm6kz
 8LBK04sqXeq2Kgfa/2ireGoN74zLD1t2AS9lYp2CUxd5p8a2CvQ5zftduXg/1hUhQjLYVTqOV/d
 wu7vNhCIBjwn1K6yYklcaWSU7uDDnt3HfOcKpZVy5m7Pli8HWDioFiqs3+YS2KSDbs7QJ7nWqkI
 lgg8u7fdofeFmuy5EQw==
X-Proofpoint-GUID: o7azu5kte8oym4ASlVUGqaOS-zxVgx6A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXwwAm7BHZyhbF
 U6GpwW3/yfsJXqtEiy7A0MqhNf2fz35evFG4km2dchNaK4q1Xd1R4vbG+cwQIY5sxD19K4LJlph
 QLy0XzmkwuG37yc967glOmKjnEcYQdM=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae08460 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3LHc-E_swVJ6H1yvdaMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: o7azu5kte8oym4ASlVUGqaOS-zxVgx6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 10:41 AM, Hiren Gohel wrote:
> SA8797p platform abstracts resources such as resets, clocks and
> regulators in firmware. The SCMI firmware exposes multiple protocols to
> control such resources which are identified by protocol_id.
> 
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
> 
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
> 
> For example, to power on/off the PHY, we should use the 'core' domain.
> To disable data transfer and keeping power enabled, we should use the
> 'transfer' domain.
> 
> Add a new binding for the Synopsys eusb2 High-Speed USB PHY
> found in SA8797P.
> 
> Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
> for which we don't have any information.

How come we don't have any information for what the firmware
that ""we"" wrote does?

Konrad
