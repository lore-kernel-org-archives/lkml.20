Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191683;
	b=UM5l5h/Wh5TOhG0fcDSpxJ3noMID4TMn+EO/Rb5SBP5wGDeBdU2K470KCcoYHJzPFFz2
	 05mQO+1MyY2D2OHTszYHVOF4HcQpngG3YoWaNf9PddHo1+hLU0VbUqWujg3JpHpw9ZwoW
	 F8rNlcssxOfa0obQprCh/yWR6nqYgKUMKzwMCXdBNQoF1ViiNV7q2DXcNeJCkRNuIKQuK
	 y8EPgnJBoQmcUH/958sk/XBSKHbqgk24pLjtyrq5aUh8T1paxuzPskT5P52w5+Ck5DrJf
	 oUHXl52VXXuzPGNU4/KnqcnO2PbiVCx0Wfpl+ni1iqzNLhA6UtJ6TCdnFufERZuQVqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
	b=phAdkxeGHT/KLDNUMFU+zXgsyhuLnQMbeeyvRjqh5f0+Q4ToPq+JcAs1b3Vu/Vx6OeCr
	 DKeJNnZk4RodRSD7JPLotzo0lPYRsjyJzAC72GfA2T/7Fo9HEpjv+bM9HUytxrOggfhyO
	 xW7wNR9frhKrGWZ4ZcyzG+NhHwAxViCmdItNIX55GNWaI5hsoyy6rnddVxdEIFrm+Zzqr
	 Rkfz7bPEHk4Hi1XgV15iaLvcruZuqMtWhrbpjGw025A2kjbJdkOS4qJ5ozxvOeaQZ635e
	 kjIA3+jsPTlF44uBnnDVkZV8C+AJkEvBwVy0YIchvU5dX0C2WCk8Hh/uVlY1DKDBQXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U/dAt4b1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1932606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1932606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/dAt4b1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdsJn1011769
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=; b=U/dAt4b1vCKJz4R2
	1Mlby663Hp00rQgi2nW3Y9jB6nBqLctbracDmSB6Xj4ySTHPYv0k+qeR3hhr0Sqs
	2UJkHfm2bHLBJWrY93IMake8ERgHb4KtnN101wVPbwczAOrvCkOHVtnUVTOp1JJ6
	hQ597in0/dNY9pA7VN82PcIFWTRvyeryckbFi+kIGgRvhmYOVuJ9mjuuPs1VUZ/x
	MmPd5zRT5uVpdzqsrgBCRgTIGlvVqnwmJPDEPYarIZ39p0UKr92ey1mqHNvc58W8
	X8sq49s6pxhvWvsj6qOVtmE8TvsyFOzI4l8C8ZENejDGYtgp+glLfzjkqng1kSh6
	Hb9uOQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgf4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:48:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so2614954c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191680; x=1793796480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=XdMEZhGsC08xa/HoM5cUlqv0b/EBViQYSs5FZlc5IhPFfYqC2xHwgTxh1gnh3fdRDn
         mKBEQs8RSmItWMxwaxKCCOWOQPojsbEfs9xTEmYcWZYYW6ZO2MKj8hN7w4HuufZ/NLhH
         h9r0HFAh+b2O1zOHtV2g/RsMG43/bpY8Y1xsJxaUK3u0yskLUBjiz1kj8GwdjaDWKzML
         Vr0acyj+EwqsykOB05JEzMQID83kM6TtpnE7p29Fo/4Vl8yOHnC23Ca/fFL9wQMXuLz/
         VopE7X/yeR/1MFUsjgzhDXfyo5R2Ce3Q0nLr+tL4QLDr0zeBms6vrA7lD04RqGyOluge
         2HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191680; x=1793796480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=dOCyLGH12TehAyju6EpplrvnrobRiHQKZwOUY7YLX48cuM19dlOm5JWBII6xUVRy7K
         Lt8KlueGeZ878sXiDau2ahdtqeu4fiR+2qPkyR2op+QTWk5GfX7r6CdUbm3Q8buJIUNL
         5LDeNwgGMZNaps2yTW997uXWrG2hKEEVPoBcY5CpGDkQe8JozA2Op/0o39EnqNjUfqQ3
         rXYrvx7oAzKUB6Najfu3P2hMa2+UC7w7OJAaitVj/KJKAevSt/LxmqNXqIxns0rX4ElY
         j+e9NDcGxO1Zu7SlunVbS4icVXH6/UbCTOymPk/u1ewpwsxdXaSGpNPUfvu4YAe44x6R
         gHdw==
X-Forwarded-Encrypted: i=1; AKwUvBwKLaNIN/TfDoFRTdNx3jUC/cYxs/bECZECeUm64ZCYrLwaZrWNpP6l5RMpNf3KyYydROK/at5olYetG18=@vger.kernel.org
X-Gm-Message-State: AFq9FYKahvmcaLDjMlRFy0qwoQgCgkI49f7q1CqlAdX+MAZ3Kwz2y40Z
	+KFkRzNVoEr1v8y5C6qIS3u8XHD/CPCKIW1ZF/e7k++fVmlh54kKUuFaSQDkRcjHlaVlhb8NNK1
	H6gETUogUISeE+TGgG3p/XFchSXox9qGnN62cLPb+ibVBaGXMNM021M6kaRcKTU/mQQA=
X-Gm-Gg: AYBFou3M96HqZOpELFX0SmksObGz2fOjm2NAh7npPZXTgviq193P6nZTDGinH3ESXzY
	KhEh7w3bq0JM6UgggCIJgWgpoz8nTsmneOE5mik0NGYPGnp8PWcp3EZdoJ/5sKzOd0H8D/2oaxI
	BIP9dSP1OjGHIQJpKhmhoNG8PIefs6FsQBNVjtoed/SnLANZg2UAvlMmA+iGJrTEXvn1ogWBXRu
	KX2YMzHInLmlC5zrNI3KPldrXXGVO35y6D6W9mV6citQLKa1qIQ/orJBsqe4bm9R+W97JcmLokN
	svO1dufxHl3VBUE+RGVxXZSVfX2BtPxmZgB7c81+M4UeVL6WQfB/nu89qS1AIx8GVRbA4/zjiX2
	djJU3/V9/l5NRubmQo4PJHPhSn7dRWM+NZ+2cZezNDKu4ih7jPEUA85DmadJGQeITDUvg3FwAZA
	b9nZEk5c0q
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873322c88.31.1793191679694;
        Wed, 28 Oct 2026 05:47:59 -0700 (PDT)
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873241c88.31.1793191678889;
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm8546468c88.21.2026.10.28.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Message-ID: <fa7ddad3-81e8-4c0e-a5a7-74434746bd88@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:17:52 +0530
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
Subject: Re: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX8xmYshxx6vby
 L4tKnYwPsfnUtusg/dNjGEHeROyfpV4+HexeaTpBCDbgipV/9UBfH+dVtAWnHl2nHjf8Xlfwush
 SJdfo5JmWxjNYlbV0/Y9yzJ4kfi3SKAPSYVjhp+gaiF9VM7/PYvYhaqxEBEi8VtQvZLax6yURVr
 FbFiE7X8Qj6OtaPVJmFgota+lsscWcFRZBDvrk+NpYLFwZ0Z2nyBHyUWIBk1mSnhKbOazZiK1gt
 3N+qDn5t1CjNQ6IC7gOYs92pKAwuc2AsctGx45HqUVqOYqfiP+DIsNcZw7gKqSsgOvVD2g9rcz+
 3fiXWjG9eN3/yRPGlg0rl+ZPBPs2yd/VL7AplTWfvOO4qirrlchtphBtwuqeM2leAjgstgCK6v+
 +If2V9WrOfgZjaCLwDt/Q1H1HDAZK6nSHkP2VRxRHwxEVJY35Ftpz0zOcXmM5HuSBtDGYgGzkCr
 pVVQZd6ZOmt3YYtmoSg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1ef00 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=lZdmFDQy_dSNCzDU9jwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: POwlDk3VR9dc3lONEl0dbko4a5CYazjE
X-Proofpoint-GUID: POwlDk3VR9dc3lONEl0dbko4a5CYazjE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXy5GBsudG8QI7
 4HGLfXBb0hZGNFR7nHuZY8PgQdNHgqapxDiGBLxUqLAZ7hbtLqk7fwNq6s8Uo0J5dPNr+f8QpCE
 /Dnlphf0Bq5fUT1uqep7dfEQ2BhQDdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQM EVK board.
> The Shikra CQM platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components.
>
> The CQM variant uses DSP_A framing on its QAIF CPU DAI, configured
> via the cpu_dai_fmt field introduced in the preceding patch.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com> Thanks,
Prasad



