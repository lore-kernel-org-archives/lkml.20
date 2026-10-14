Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20153B83F9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967073; cv=none; b=b9zEYdwGGMemaaxqjkihPY1OdIaCk/0q3Pv/bQnQ8iOyPtF+bn1el//geYAx7dVz6pG1x9sdRL9oj8HVT1L1IqMRTLGT2NGx9lD4NxxhIu30rYz6Gu9Fu05mLm8/Mm89c0M0uTyMApVXmHEDYxfhjzqoJTyz+oPkvPE/PI9lB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967073; c=relaxed/simple;
	bh=w6i7lW/hwahzDmlSA6tJQSUGt6IJk5yjdUIT7PvGf7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRjELeIwjWIBnvFUe4Hk4QN/oUPaED7wB2k9H5VdwLUfWYFfz+SBdi9NOB6BmAxJSSW3Mia/AmZ/n/Hwbdh4JWZKtjpJqm0iaV//5wbmbTf7IADDSjQL7ZfmDdTLqVR52FQR6j3wP+AjJumueHx1VEQubcVnlB5svwG9P/zOO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHTLEYrf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQlcIwuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHTLEYrf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQlcIwuG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7TJbq2874211
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/dO9wEXpKZ351zph6knNuG++
	0aS0MxQ81WRUeQ8zWvw=; b=nHTLEYrfHkTzxG5g6MzkDShNgP/4lVqSYgfELiBT
	B5R1VgO4aXByJQP28PwMmdaZwoWTRpkcGZfo0cLRY0f8OCoQxAxNNuzD1KFJFp91
	PSXPp89W3fPwK1+nckz0iAUDtFL4zGGV8K5wYdRRVOk/+F8UzDVEQl15ASgMHXiD
	f5H7/mSYutVG4ddfhKIiJMpvdAlSNVSwhOP7pNUsN6WgiF/yr3HfFYAU33Znaq/V
	qruLhlBgHX303zlA9U1q2DKk+xbvYH3nF5mb0I6HaEXohPgfD3c5MyhOTMooBZ1c
	viPyvboM7W8fvPsVsPSdaesN0IvxGGM9jmUMGFzH15kMLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphhkc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:37:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso178111985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967070; x=1792571870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dO9wEXpKZ351zph6knNuG++0aS0MxQ81WRUeQ8zWvw=;
        b=DQlcIwuGJwc56Z+nXopZ84HFL7hyqsnP/ciBPYz9jEWKvXduYZbeUT0KBG6UbeUQyL
         R2chSim7kRnK4S0Au0E7t87LLcN7KVwjLuZlBjJzBNql8Is3FKnPoyjbCQwtHZLvaC12
         SloCwpxsc5dkbglUdplwPWep7U7werOtlYfsVjoy66uth5BGEPxQpT787gVhdZHLma0H
         38On6MBu39W1qznKuLue4dxYRlWsVfIq6r6kVBl/7L2KTenTz5EvAbS37uc7yPGWF+46
         IqiawUK437eRcJei5qLi3hq2xkJppQ4HDd5e4tzvFsA38TyGhFP8gHkzAw8OqSBTDRBi
         3RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967070; x=1792571870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dO9wEXpKZ351zph6knNuG++0aS0MxQ81WRUeQ8zWvw=;
        b=mn/4PLgWwBfg898s2vuwbBcCG4zFAV8+Eo5ZO4Msuh35qfculRDQC1g3TH8SmaPgrn
         S5lp8fuCKHUpIK+KCzNF/Z6Et7oVy7I85QO9eCmu3JODQrqbxRqkcbY6j8Trw9IuYmKZ
         ACxQyj5JiF32iH34GfA4Lpjh8KCr93Ve+jpMrtXPpDZzTkczvid+1UPtWsTAWcd7qGkB
         KExUnBrMPExAsUipibPwn+v2B3w91LCr8P6n0ts5aLYzJAWE9jLtollzGI9nLGPnJRtz
         UgHW3H6q7zaxsxDBrBthRkLUnaHKqpi4q5+fLTATqpxfKE1pScfUd/XfjEQz0niq717o
         QzVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsOBCOQ0Ilgs4KW52v4dhDJeeuJgOg0wkzNo/u34/UknU3h6AWf9xcagZ7yGCYoEVB6+YeTMLV22fL/UQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfcD5A4o2lDSKtSovvu9JhqZVl9Z+2H+bVCrTMMqNy43iIyXGR
	4IZ82OgMPcpIFMQVqwjEEoFSfVqog4tgP8+mAPMKsSvQMCfUnOBOVQxVF2OefDzcXGAZpGxgdda
	Rdqwy/rpEEuZEdtFwlZdi+wk1DY2vyYhKjHVaz4SxhB3NHxXOwIIf1kOzBSf+SK3RdyE=
X-Gm-Gg: AYBFou09NKf4sCHesRzbvDTky+ESA1S65XuskBNOssoQihNBALPjgAy2sD2Vq0us/og
	JiePHgFgdiyjSxUkz6nMP5Brl5uCpQEgIG631PeEbtvBhA2fDBXKFjDxVnT8Th+jLeeLa1BZSMj
	v/A2v+1HLXwZ0JAdKhT4SJTQeI5/bEUe5n9EhTit253uupIYEmjajUA71d6WwLXHJ3gA2kl2GTW
	hEVF3RX8nNcrZMca/SuZjEG0j7I0PZt9oiqCA7WPqgTzpybKuqhuETMOnQtNIMNg5OMWn4yMFZ3
	77Yyph5E9jUm7Ak+EPkw8yv/npRDzrOe5lQc7R2Swn8aawXUELg7rt/bAHelYVacflx+meoD0bq
	+vvbQIAsBGNvjnwpU
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2481090285a.17.1791967069934;
        Wed, 14 Oct 2026 01:37:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2481087685a.17.1791967069285;
        Wed, 14 Oct 2026 01:37:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm767149055e9.9.2026.10.14.01.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:37:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:37:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: yoxcu <mick@yoxcu.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt
 through the PDC
Message-ID: <juep7e5qyp3fnlet2r5fqfeepwbkmhhaey4xxy46s2rfsjtg7c@ax2q5tionsuk>
References: <20261013203749.3078262-1-mick@yoxcu.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013203749.3078262-1-mick@yoxcu.de>
X-Proofpoint-GUID: t_AxLio1k8ujqNKDNzy2NslbjWEViAU3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX/Xj6+yJRuxAU
 Or1SCbeNd9GmyVIFJ/I2NwEQYlRXu5fXb+/jd8K0oczj+j3pVYN30dGwdhc0eLflN9iQjgNs7m9
 Eqk0b1WVWdPM3H+9kzBI+Tx6Z/WkWPI=
X-Proofpoint-ORIG-GUID: t_AxLio1k8ujqNKDNzy2NslbjWEViAU3
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf3f5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FxBUbxoBbJN2jJ9NEDIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX2dqwwCjJc/CR
 B25DOJzcCE3BVH8f52ALmYCG2Yb+Y+99KoauFMayhvrUq+sD3FteqS9VIhrZY237+vrmwMEjkEw
 DPflRHLTadU6TlT5yhfI0cKDJGRdpIEnpb3Lw29Lq2HViQaemQRWAGwdF8VPxCdDWr7QP0RGZgD
 v5KMZUG2cAQOzDRzwqpWSwKFa5X3aPK/DQAi/oejsTsEp40Z/ZGnPI4+s79vVLR6WvUI1klQerP
 CetvMrTHQuJ84ROMnNOl0+uDErOp0Pzec+R0tk1sXyhl1f9Dbu1GZwCi0WewttTO1RaZCfGr7Rw
 amKKKpjz01rtZwcLL0mdt8ClhLoLaLvC22XmeHzZt7xJWMp5GlBwpshDNV+fm13ow7epxffNrYN
 0XbtM0ehyQ1IPI6cPKnUSRRjo8+m1/RMqRWM7+50szuvQTEFio9X8W7ROPUxQrzbJS6UlQ+PyxP
 N2/vWrS5Zny9yAhGaUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

On 26-10-13 22:37:49, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
> directly to GIC SPI 481. In CX collapse the GIC does not detect
> interrupts, so only interrupts routed through the PDC can wake the SoC.
> 
> SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
> sm8250 and sc8280xp already do.
> 
> On a OnePlus 6 in CX collapse, a 60 s RTC alarm did not end s2idle. The
> phone slept for 456 s, until the modem woke it. With this change the
> alarm wakes it on time (after 62 s), and the power key wakes it too.
> 
> Assisted-by: LLM
> Signed-off-by: Michael Auer <mick@yoxcu.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
