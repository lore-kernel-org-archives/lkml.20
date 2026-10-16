Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5944AB62
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140835; cv=none; b=SQlPeIAhsZv7uVO34jNsLB6gLI8Y/0IvvaYaYV1yjCF4crUPT59uuS+ExcWSBLnblkCXAln3hYFbUHgbQZtmdQ0oCoPFDTfhseQ19JDa5cnvPDfw8RZvsZse9YKhZ4JNS7HNoXQVrOwlkmgT8Bm/cBrKohmEL4w+1Mv2u+O27Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140835; c=relaxed/simple;
	bh=puwzqlb8XSUh1RPgd8HEwfS5QcUnz4musm6Bbo/cdhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4byCMch2DVjFf52PtS6Jmfip/uid41p64WRV7rqUJD68yusp3pLVhrMn6J7RP8x6a3OyLAXp2BqQ4NcCmH2kCPMfZy9MXzie5US82O2/GbuESRm03mv76njxTzsh75bGNwmyW2ONZD5JJTJIRDau2cw4Iu4LIp5hY62FLBXWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBLyguma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INtn81F+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBLyguma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INtn81F+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8loDD2312792
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=; b=CBLygumaTboWfpqK
	gi75LdWvPi9jZFJIPy/2p9Kl8Z+4o5yB99e0ZiRIbJtgWFooRgY0zEb35yZmMgcu
	ATFuuFOMJuz/jGxJzF4O4n82BbYfMUHazGhG1TVBwa/NNFqVbFAf4kwXCKw/7f8B
	UJfGcEcuP7bxyqKpfHdwS3VV7pdMA792WFsMkzYd7JP7Sxpd8/hQb//ldYTxdLti
	scmTT1f6OeydJ4MEUjEEgGtSvRoe7/mJ18fSfpImzIpnzeXvKuz0qk3gM8dKfbox
	boxlxKUCzY/94CDhrdbQRO9I7tEnNMNx7xyB5Pau1IGtwr6SrMiUQmWNlC2Xtrb3
	0YtqJA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2wer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:53:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so20238336d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140831; x=1792745631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=INtn81F+EpFm24M1TrPklIL/IJU2p8jbKasi8+gvxGtvkoXe5U+dXE06vQoQDs9zT6
         7sP8XzS2EopJVHzW03mQWo1tQARysKKcPNCq02Vkd53wdX6RkI2I7UwzIGbgu9IqVLq8
         kiv82wjZFtGVHTLU52GZGY+Idot367YKNDzcTdAPndrdDSzWMzfme/3eYTaw1786Lyv1
         dxY0c/xEcmpyxgsfs1xtEBXIADGbN5BdioB65WMWN7qLM5W1X/1ItvROXIXkJ2x12yNh
         qI0dYW3xzz5n8OcAOeCVfs/l9cgDRqS0eO4BG4KdXXpZCaCJsgF+y0ESMvI7Xb0iSvFd
         TqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140831; x=1792745631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=dNAoBsGidJ/tdzMP2TrXQHYCe6yeRJB8NzCuJ6aZK9CcihrBJ2mDH92rGf/d8W5epX
         FAigjHCiEpXePalbhpwUXEggjpd4MLCiHsi7iFFIJ28Rm9AHPaLb5MnUE4eFXGJtavrH
         /yX801uSezerGdcnFl8DYLJ8a3tN6NffjhvKwy/qNd7WRoe4zjF3xC+uPcBG5xtnjhoK
         XdYZxB9hoJ4yrBtOuyC0WncZT3VgVpA6GxmZVixhe8PXwdaGl0WUJPNf7fAFKAhWhF9b
         eZCisej4N6GFXDC3DX2MSieCqVdwmdL0+LyfDRUsqhz2ZGIEGO7x/3PjfC/fIjGEXTgj
         aIDw==
X-Forwarded-Encrypted: i=1; AKwUvBzaUSrZK8tPBISv7RJKvb6MVy4MUKv+NJkiGt3moojrN2Kg87q6j1syPec+MvLllv9u24UF9IUm7Iaq1qg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj27U7WH0IuTYqOvIaS4gi8//k2jjTrJ2GqoIAk7W5EEYJEpD8
	d9t9hX5GTbm6IHhrD9ACSQO+HRpTEY7yWFTnl5i4vX3ARcMoSFPRo5P382Dm3I9lHbCIjOphA+3
	lrY/Lavwu7MQT+Xcw0uWOO4iKqqiUByNhlk9P03KNVzfF3ybEk8eVc76szr81cpwLOlc=
X-Gm-Gg: AYBFou1c7XMaB34g6n09TsiX6Kle5qgp1LQqW83gcCa1F/q2A4/t8ZrgSpY4mVv5n++
	L4eV+6Mc6ol9+Xwez72q382BUrpbhay2lWZY4Ycq2IzPA9e/hBpz0lGH9TaCbTzV3bO6v5CIhRs
	3Pjjj5f9TeGPXt6g858t41wZAunQkCRybs6d/TG2HY4aeUm8RDHQj3BpiXqce7MkwsPtFurH6Q0
	EQbErSeECBE8XOFimgazIfnGoQaid2qbQIruyIqA/dqoOvqpVAPjJI56ANxcTzGhAS0PGkSNI8H
	AbKlTDxj7Irt+5OrOwW9pA4dDWkxPhTuv/6/CcjpzgkTUAuxwiXxatIxkxt+L2GYgqFdmTYxF0u
	FLZN8HV82Wy9nrf+rkIqMRA==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019878685a.6.1792140830676;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019873685a.6.1792140830092;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm648663a12.36.2026.10.16.01.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:53:49 -0700 (PDT)
Message-ID: <855a4603-f9ec-4887-89e5-c92a943212bc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:53:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pmk8850: add PWM node
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwtJZQDBV+Q9V
 XJpCTwsnIbKrbD6g5PP5ZaskJcZP/suq0X6D/jnOyi48TR6Gd/yyrcbzFLKWbk0UpAJRTbOFMJB
 59C2QwlM/X0+3bSL7racLZfOaZPA690=
X-Proofpoint-ORIG-GUID: YhOrItTr9C6lXeEkbP_zyyHRjN5spuFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX1mITZjyIPu8T
 0KzCOPEpBWOUaER7lLTdyf3dthI9wz0mq2QHBqPVe1uKqvBoRrMOihq0NARAtKZSucIA4oxKWXa
 zrNVZR48Bd5N574NWrCMYlin29FXesRIUvUvGPixX+OKGQQ5YEKU1+psbF+p5PsS3F090Ldgj0I
 vvKyrp6gJ9K6qye7daTBz4e5eKjNFWbsCjZXu33rHVv66SCcifjHnq85Iayy4iszPXrF48IwLxo
 iRonFTW2NKL3sgk8O3o0lr7CuyUQ+cW/C6EQQjbAbi+gWwLLy13y63nKGIfMSfNazSEzsNZEi3t
 QQQuYbOq4Nqbt51j2Fcv0ufu5V/NzNQkmMamNWBg4xdzy8Wp5RLVOQFQKxIMgdkwiADkTkqd8VZ
 HnWwIq2pI2qjHT8YTaPqJ5GXdhvakYvm9SRqhooj9RBI4Yxn+aAgAHSj0pqEdZvQFTYIjW9aZL8
 RhngqEuwYQRFKqxb8uQ==
X-Proofpoint-GUID: YhOrItTr9C6lXeEkbP_zyyHRjN5spuFJ
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1e61f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3cXBS7fYHA2BcZxrE1QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/15/26 9:47 PM, Srinivas Kandagatla wrote:
> Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
> disabled at the SoC level; boards enable it and reference the channel
> that drives their backlight or LED.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
