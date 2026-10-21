Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591674;
	b=d9T8osS3Ewe4SQb3slWRYl5z7zgfUCrNFE6X2ttEEoBSABespXIViyIlgHM6//LIDWRA
	 AOTzHbm8uIDMJ5jQ0C7+sYi1XG9B+NeHTXJ3PBzzxyCksQR1unaKOddhtUekedSOIonF4
	 if7qdP5MLdF926aONIAN/kLIO7+THtDkNvzJaaYqOGUCWrZ2EpbwIU5II8tQZs1QyvbvI
	 0/peWwmPtwoeIxYSv3oPBI2cmzV8Z/Vrb3CN45kIv9f00buX4gTvZ2QKvFWVsIoDttfyu
	 JqUMD+2RCyQhL7wK7phcAlSksX720a+fCgH3VeX+4LxyAaX3Wa9GHLbWkZgvqAMhW/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
	b=NgzeQU82N4XDwoVjXediIc8n5X2OlsKwChS6zXAgr+KcH/LkGNqdT1xU716zbPesbx/+
	 Woe9jtL6J1tatR05Fn4OU+FlOj5rKx6h31gQohdULnoz4DW/vTE2YPknKjMyHCyJaonAy
	 DPouSrpXkDWHungZD8WXddjpXsKby84ocwUaDridFehWmeqzDzMQwN72iin8AO+7eeVK+
	 jspKKLSVqMJePU9ejD+jFpSDO1t/vQ14g1IpVZ4Rn0ppbGVgVx3ZFECgz9JDicpj0ksEU
	 MNpaZMszE1P5wSscveVDd0EKF+gukFMM5e170stZNViIFSWFC4pKIXOFontaBdB99xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJ+S6J1h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XTM/7x07";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C49B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJ+S6J1h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTM/7x07
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDIOZN3869181
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=; b=JJ+S6J1hBjjE1k8D
	9PIiLcB08/81RGUIepCqC1EimYOLpRX/THQSTUYyJR2gU760cjwXeYxqUKvI4fvt
	eq/YrDBtYkWhRhBrvw4UmFRdkekPGvmkEvQ2SINM9RBSra0xAvxuh3w7s2Pl39bq
	Ykfh/GIyfLvvPnoFcxNq3/3GhdVe6Z3b2QmrHmMAV3ih9c0w9Ea8A992IiuTPNj0
	VCO4/BbRlMArJodXmBef/TjiyK0nVf1ziQIGwHvj6mAemfdTxOJLpLMVy5EERe2F
	+LhAbP4ol/2N4NVR22zIjNaNkyRriFKjzaQLiDQPy9+mmsEYHkRlCo29cYdSUEtM
	+F8EgQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q86qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:07:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso32123e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591670; x=1793196470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
        b=XTM/7x07i5O7YXRh/glNLFgYvG+aZs3/73kMcVTrNfSxlrkiRGc66chPjoSD/ZnTx/
         S/eTefiKoF5IpwwsgTSEblvr+/zkxHkW8r8RX+QtUfEgY82BDdrQ8WMnaHJSkRtA/ZhL
         4B0hxfUmQpl4jw9GXqAE6griexZJ3jhXF4nONxT8bzfc0yGjlIeY8fBlFUZK8NNz2Kej
         DlURNKD+dTEp14hsZNRVL/whjw60Ha8CfbP+UaXsPvZJHFuXWZ6puUHFIGsKT4AZzWdQ
         uKiAf9WUkCJy3NifBDHneptBwgu3ZQpA5RTWSmx+TDFQ4rYk5ntrx8HmalH8lIsevYM4
         VrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591670; x=1793196470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
        b=1ORe151FhhHkutZtw11Gp6yFdk7uw9h0DA7veXrNk0SRUj3QIceR1U+2vI7KktL6bp
         HnaZh28RvwKl3J7zNhciiE+hTd1A0ovS4lJInAHqIk1oUx19IXNs9iByZkUFN1o/VKgz
         hD2NGUUA3D7ema6djkGBMMeBhEEpLq1Pd//BFrj4l1mNu7P7CccA8TTxMj4CMz/W/d8Y
         saIQCDpLCJpdaAS5RI02x7uKKs6pPPfmpfLIoJ9OdU/Jjfdt1OEeVGhXz3quDscWmEJr
         DsuYlp2xZxfScnhShZYydnrAVppcZasXY9QOyuLq5QNp7P8mT9yVnmlkpHM/3DnhgG/y
         8eug==
X-Forwarded-Encrypted: i=1; AKwUvBxC6FQ0sZyQBPpoBQiBYzaxyV9HlaBRt4s9HOQkk76fh/+hF43/1Dq+Om8ItqeIcIxWNyhnBnDaDVJPzRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJddgzf9Vyu7hitgmiV+KtHO6VVjwCh2atOnx/1oV30Mid85x/0
	2P//giq3B4peyVw0HjGiL+yOj+asFIQktm5vwfp1eyA/+fnCHzxHnqRfeZHIFQgkSdv6ZlR3wCE
	zj809agz2+KJkGmpiS2B2j7LYLz2tUezwEYdyvF8dV1iH2I1gymhuD8Ip9aEv6g//mmI=
X-Gm-Gg: AYBFou3/8Zsad9a3ZbsURSAc8hKSApiToJA8Obf1EfKiNNGxUkuYcSwWFcRbrro5qMT
	5fSLIcDsRflhJvPhzLY2twAPB1+0OlzWIMXJltbNxb0JjnwdIdZutkixErFyxKUyjR8VuVNU2uj
	nHDE7y7OPzTs0g3JQYr3iZKuPQuhS40XfH1CxBzKTZCKtNdfgKlbnYAqVRbzGykAuEczheR7rUD
	T2qDP/BtFg0gFmuKt0CBJ6Ao9zE1WPsYMz2CW2/n9akiacCZ8xpuNgWmNrIm/fAeYeKIvoN6Mza
	g6x7MfAtVvIoaqlHOdFSi0xQ/r5AMExCLhQ0gCR4fMsZZmtfmKnsZG60dw6OJWXeDEQjXHVVL2O
	A5NVMSr+acPp7zXunD2K/6w==
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr698636137.3.1792591669702;
        Wed, 21 Oct 2026 07:07:49 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr698606137.3.1792591669237;
        Wed, 21 Oct 2026 07:07:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5625cesm6971266b.39.2026.10.21.07.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:07:47 -0700 (PDT)
Message-ID: <ab7c536f-f57e-4560-8d1f-6ecbf2aa4b07@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:07:45 +0200
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
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
 <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX8GBOHOF6kqqs
 dj4eJoNuTe8xxFlTlVKhzABqfrqVZJDc57+XoX0W1XPm9kNkWhJRoJ98STf2UlbcLIzEaOw+cYB
 wD5u43EdkNpbFAmorxEYVncE+ElZABA=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8c738 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=evxpD-9nWyVjaAOWT8gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 2OlTHJ8ZLRRBJ2QTJM5O8G7cMSE1SL0Q
X-Proofpoint-ORIG-GUID: 2OlTHJ8ZLRRBJ2QTJM5O8G7cMSE1SL0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfXxCB+3KvOB3/D
 Gx5J0EOqRMGuYvck9cKbrwpy+QWt2H+HNoPs+XawMn+r12M0bsmRupxX1fr+FBm7fMq2KvxiK03
 0tR7LsFmRlJBT/2hLwYFr4BM3zAzfm/kkbQcwGzNAkMg7n99cysRBmy9m7ycZid21G7ZxMicIpZ
 had4xs7PKpPI11lEd3APX+A+Ho/S+ub+e4//StcBWuEsx6gfKoPbz2vcoIhtFs/8YyeUW24A4Mb
 vC5GeKJeqdX+uOhiSvqce7DS9940z3clv667OFNQaDwGWTnmogfpYBo6J5yGyqxZAT6uzFPEXGW
 lY8NOMdjOLKrI0VOJL3o5OYVawRsfyw0RAgBvIhtkJnXFZ4zYU40R8HTRgWSmSFC8U3gQUgASn7
 OTYIIAkW13xi0gxrKfQLO8dauYXVpKs68O8+Cru2MCJqQk37p5eXzj1ctJC9EjY6vx3DujeOliJ
 0AQQGu9WV83IcRfBKTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210056

On 10/15/26 11:15 AM, Mohit Dsor wrote:
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> 
> The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> rail. Reset is on GPIO76 and interrupt on GPIO85.
> 
> The bridge receives DSI output from MDSS and drives an HDMI-A
> connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> 
> Regulator and pinctrl labels use generic board-level names
> (vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
> from the bridge chip.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
