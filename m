Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201770;
	b=ME2au/hU3IW+b0u3vWGTKP2uKLWhGtXDulRoIBU8UADTBm81qcQRWz9mJCOUd4ZxCA9H
	 umWI3uHi4CzHmIzNMl9DgMk7tpRvV5eTqbIeJ3S3aPNEcz0R4CVnE+2JVKaS/OiowJa18
	 XqCqvbYkEuzWAs/zARrOtVD7CYKOaqWW0wUKa+lHafhdFxu99EK0eb7CqbPgZdboQ1OT7
	 +7xltZfoyx7gmXRCQr7owCHh8YZ9/Ma3z64zMebuYmVvoG8TETBDv52QZm2MqFnBYMPSd
	 p4tK9JrhDuzHvzPSCUplMquM2VdBW57t953rIeE1XxLZ6M2jo8rIq3Zgmcre2olirLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
	b=zvEGzHKrFMJKNddTKxXJXuN2kj2k2dGOqJubaDQ6A8LG63AUeWfOrJa6+xtwEMWbXn/J
	 LuaCFSc6/avcPZwtRAgx99FwBrPC9bYNsQ+4lMXTPODLHFZfRheKl7chJ6/XSC2Cl0q1u
	 lalvr1AwnFMGV+wvyn0T5Qk3nMm6sysh+qxYRuDVyK0sRGAEhmVzUNpI0J7T7OGtF8zOm
	 jsKTHWbf/z57Oq+yutqBetpT6LYDiPE4/fvPIrI3ESTr4iagZb73PYIMHXaxDlFiOWl08
	 ZW238XKbZzojOO0t2r6P56b+qe3V5Bz/156Wpx862ytH+Ydw9xuMYCHcLQVkH9VOP9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPF2g9Vp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPDUxPHQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05DE606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05DE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPF2g9Vp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPDUxPHQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA46Y1471866
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X7BsiEJvpOtzfW72L97F41+W
	NVsWQvFRDOudbh1Aepw=; b=XPF2g9VpKEEzf757oCYGSqfWFGVr/Tx88KHa6+1C
	UDRhUIGXYOkMJHbtqsCrueXtHvnJpPEVIaGAS6j0NXqcfyjsptzwBOkCeG5r6b0P
	JTGEISoiKpcew6AwYx3kakTq9o9eWSEgPjhfP7FKEdWdSBJvRaqPrEdHKcZrp8Ez
	VJLjIqHBp2sJ7rVpreiFM1tux7TRLIm6K+REyhGgMTjEAK1YH//QpZBvVZ4VCRpS
	xqs/I9jZjCVKZ64FNZpEm2kxxp9uGH4F3NOrwJKLHbMaiILW4bEubQyNe9Yzg5Pf
	v+QezbqZdNhMCvMv1oLE4sBrmAoer0TM3EFAx4xYQADyyQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh70t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:36:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c0f73807eso15598826d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201768; x=1793806568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
        b=FPDUxPHQ4nvj0bQlFOqnbiqgnO1ECYtZ8X6kdXhg2ptbpEMd9DIB/QyNbh3uLSguk6
         zVy9TiuPt1xDZ9pN2guZdinKfuVqesPDIFTwCrtjmjHX15hBS9Tgrk8C7p6EntUgCSjx
         mhXTANC7JGsJ48kUpy6GaTxGYjk4Jox1hWYd56Z7doApIiGpnawUvYk/+R/aQ6PTFekk
         H+5J0f2zrwVBpNQKbnCntvPwbPO3RJI9DbI/0nl4t9GQNAg69lgvFVx8QUgJ1M00sFul
         HUSGpq40SD2wo7A8m7n8glqKXX2CeiOEuMnA5Wao+cq2Rac/SQBDBR3+kD/iiGZvQX1/
         vlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201768; x=1793806568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7BsiEJvpOtzfW72L97F41+WNVsWQvFRDOudbh1Aepw=;
        b=xJ5epu+qg3zpoitvMi4lnfaQNcNKe/MUfBY7qez0LEQbmhZpBc5WX7XS+VtgoTxDpV
         bCD97tOEbLmRvAZrPQzm7AM+FRZG6BWv7zR/zBMweNB1/u4rQFNjIwd3eoZYVN2Sx3cZ
         ovU65Po4FobwH0HMFU1Y6bIbFYTbI1B2Y69Ro0XHVho8NQGuuRz05dOKPEzVod1u5GLp
         /7+IN9edGPjQvUQix6hEHuTfwlTo8RhpFE5lj4ICb5GRpMysC4a0cTBE9OBqvedIh82p
         WBaRbbjW0s4u6DeflB2u/JVlJHWRdQH8a+1tbT3X8XY4DZs5eGefEloKiMy88Cv3v1AZ
         Nmtw==
X-Forwarded-Encrypted: i=1; AKwUvBzIXx9mlW8+2f1QEZsU+Lhro6KlqhysNKpGirE/QtLi4y1g9Cm6omlU15ysHcFS0YwJCYhWv5s79cEuH2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2s2Tqw0DRRKgCkkb7CR9vtE7DNJ/08KWjp+HCpYoms3khdhi2
	e6NDH4lE14JUWV6WsNP7/aCvLCLmeRSLmTxeNf7nxo/U35XyJ/lc80k0KHSlyzcSenSlDKAmYdC
	+TSFCDYhdlfzACFc2zlfxaEBEka+amihYoSyZhra3+AEykcbQR/l0znCOMfv1HQpKh3HzhHwcoz
	w=
X-Gm-Gg: AYBFou236yPUSzobCCfHJk5q257mDt58BNPQu7seiJXMG5wjoWxOg7dMXPUgOIHrB+d
	tXHQpwIu+Ket+DYXA7UsgroLA4kexXpZF6SsoXgaRbhZhcvJCR38bjW/3QdMFYUGSsHtvWA/L9e
	IQTD0z8FF8opAhm0N27WlWLnld6jHOg7brUUl+ulMpwELg/NvAKQOpU56dUbzcm7ZfBHTDyPvqa
	aoLIvb+NUtx25pgHA0uW/Ktx1YGJqeD7EjWd7GkH+/V1j3MmhrORcWOBQXHDEYv1rE/o29hchAw
	o5AjIKQnv4hZCXbzxgW+IKaCi38g/0SU/vACsXrhs9qhjJms1p0Ii4CSZC+871TON4CPHRqt2HG
	gbldn7ZyyPApO76i1p22QXUEl/YVCYyUtzn69VNzzOqhMnt15Zy5VJ+qD4bBMRE+kKA==
X-Received: by 2002:a05:620a:a989:10b0:944:9dd:b6 with SMTP id af79cd13be357-94409dd017cmr240087285a.80.1793201767669;
        Wed, 28 Oct 2026 08:36:07 -0700 (PDT)
X-Received: by 2002:a05:620a:a989:10b0:944:9dd:b6 with SMTP id af79cd13be357-94409dd017cmr240080885a.80.1793201766973;
        Wed, 28 Oct 2026 08:36:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm51470285e9.1.2026.10.28.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:36:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:36:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        mani@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
Message-ID: <ytxypmtfd7opi36ybmb4qd7arbfcb5mu3acthmpo26l3s4fkme@hbmfvg7xfqpf>
References: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
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
In-Reply-To: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX4cYJWdWrRjsL
 B/w/YEmJ5+Fv+wgEs/7QiFRmQ6uJKCw6Y1LRok8SkBls0q8hGckMH8cBaRHETbFxRW03ky9CiAi
 bBnGj+U8BftJp8izmbVhNXrJ7uLPyJFAfCfQ6dqwpnKsX9cJ/XANAHqFVetAsx2ohdNnAapBA76
 oxFyw/Ct/kaq62TOf/lrpzxFqTf2XwCaSNwmqJJaiX6FRQeRNprbgEZk9SYzFHY4C7oyX6SQaj6
 Yfbr8g+CKB99+YZXzlsmbqnEdUmql3fOW114dVe+JGOm7GMIXjhVrpCOvCnhR98VV7G6q+e2z5F
 s2HEbGB94yMhu9RLN2UhFb3yCvMqhY/LBLQZQGwKV0frRVTPoRWBT+KHQc4lLSwrzJ+UHDH1xoe
 mCZSV+WUkGaUu4febZYWBWi3Ua4kzcGpJ9Y2uy6W8QoA7SVDYa9qDCOr1ZvZiKx292bcg0lghzW
 OfFK1O+49JV56jG5qGA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae21668 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WKNOtjYE1B8OkmgEoC0A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: NH_gjY3VXqjcQwGgtV2HB6f12gxKUYsF
X-Proofpoint-GUID: NH_gjY3VXqjcQwGgtV2HB6f12gxKUYsF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXxO8j1vcctSDP
 8KHtrKpPFLi7jxChh5eN1t3qKdudEFD7q6kWpPli+DSzciCRD+iBmK6LjVqnpYzYNxLWOg2bCfC
 RzRGhz1qJYoKKK+6dfnEuUW0xGgPsrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-28 18:44:20, Monish Chunara wrote:
> The SD card detect signal is active low and requires a defined high
> level when no card is inserted. With the GPIO bias disabled, the
> card-detect input can be left floating and result in spurious
> interrupts.
> 
> Enable the internal pull-up on the SD card detect GPIO to keep the
> signal at a defined level when the card is absent and avoid spurious
> card-detect interrupts.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Deserves a Fixes tag, doesn't it?

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
