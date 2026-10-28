Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168277;
	b=FmwEFZmR/unehO9LvCnH0QXySHSAZTPCjy5QjxFigeD8m47jZ8Jbu48cXdDJA72DjdVD
	 txCZwe7ghUHZ9XMlgOQtXsyNocssQBn9zJ5w/t7uqDSfO6IRDdhwO5lrDcyDlmtZe7mzq
	 HwC7SxczmYUM5xICjC+wWvCx2eyblbAbnP/wF9lb3sLh3kUTWA4spLcs8kbiRYOBsa4A4
	 vE4ZnkKookqgDqZ78aLgxqZgJPXlYuXPqoryXaZ0x8pvvcwBFdNxwy0y3ytcJ1imPguc0
	 M+z+6m33oUcNVD9U7Np/BCIn7wFMkhnpyOryo+jX27IVu6Q7iaqrXPoU8LqOf6OrpWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
	b=0pcTihPNlNrD5pgdfuA3sKQIKFXRmXTZlSdOImbKdqPDl1yeNA+RlcX/fxIebkdVpt5w
	 WHufbU+Lj+frfzHIyipdGABjTDTKXu2ivh2ibnuOHUUrBgohlKxEJUCeXDWwx0IG8G5Tl
	 busEXmHaI4sAkbft/lRpfARIx88eqVqva+bn0qmR0zW4MIUaY3Vs1wjM71joP57uTGtDz
	 J81ZySIghfb/hiRnUgkp48BiBt8vbJ5O2lyIwZmt2jLA6+RgNpYwsOlSnmwNAkfJ1gBiL
	 X17XThoa08mGPfF295yNDWhwslEbA7iGCqv7/ZKp4JfUaA4f60oby25++WTGTvgdLNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XW2U6fPE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MH3MOwAh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA40606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XW2U6fPE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MH3MOwAh
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PTcZ3748953
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K5N0tp6NIiHbYJA78yp8UEG2
	k3L5MK6OnFuRMDqwAEI=; b=XW2U6fPE6C4yHQ2co7/P93VyMQJKxwrPo2T4NQ3q
	oTvpJ8ah+XpqWFUebYTjh/EPdByKg7ZP0WGr973GUIT2m8ZdKa//XBm8EUSTid/D
	avgTP1xxBrhGwAnXxyjlnwnPy/L05el8TPmxSsDllxIn0C7Pj7m9KkeXmbpY5On8
	KmXD3pwRJr5LrnxAjD3ERtYU2UD6tm4SsIrLHJn0GtwTLzj2uZL0zug64wC+ZTrX
	8kdRoyH/bs0OYLNtBcanKnRmuboxpVDlntnaaDBps0WeWHdzGRgalsFuLKHs1BR0
	EP/341ip8E90ZJwhBQtnHeqsz0m07uT/hdMSm7BP3d2smA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g2rvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso528583a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168275; x=1793773075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=MH3MOwAhX46ieleihZkm9tgg28MmNkMMYneeip3z3n8K31UV5YjQRwSh9GfvD+1gY1
         9YWWJvAMaTJVabG5vhgB68SVRocIflC/v976tQTxIRdfs131yv8DSp7DWIa0EKdJdyle
         SK6XNnShI8GIcG+bVO1cCWwr8eoq0F5gKWNsNPAo832qfzDKmg2AAU2bVrEfxwdW6c0R
         Pt0WRUZ2nJVHZ4fRu+G6nMDgAPKHEoMy/Criwyob8zdVfKrPErQSluEkbZONv4+4RIKa
         JKsjOGA6+RnTZGggNd/erifnvYjPbRaPMB1lhVXptWpJd4uHUzEzDB6bvdM2d+hSK40B
         O6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168275; x=1793773075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=TXg9MRZ3QcbBBpOey0y692ruVOd4fWMD7/S8/K7tHXSM2CyUsWpviHooxttg2b36op
         K4wIkDjaKzVKacBd2fLnC/qBz0abf+W0jBXcbBQGJao/+/yy+XeB7g7F+GrGwKGWstrn
         mO8hR1W56ekpgT3ln20IaxVG2+U05X0QpgMMHm9andkg/Ze5zKGaWNLo8A3Z5XRCIgPK
         /hMeouqn00JkAZjK4xMTJcNh7s6/Rim/JPvRitUXPP/ehOqQwJJdjAiI3q1riesF8GqJ
         EPuaI/EDJRKDth0284aMv7/tq+bkMNgoiYjt/a4yKP3bJlm0bK+0+RLw7CSNRuJ7puu/
         Lmiw==
X-Forwarded-Encrypted: i=1; AKwUvBxLOHS6YYqoNN/h+WJCUjLWAX5EPv5ha5Nr6lHIObH9TGIDq3Az2ErYyCne0Jhgv5kzShzMIpSiLfUOmpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqxoBQ81vZ2lTXW9UxcEqlB7e4+XB5WmdODrC0ZWbhOAJmnmhn
	kyXQmGkFUk1NUcssbue15um5fyHgNEu7hoZkme9unSsLMumkhyTd6VaGoan2l8NertJbicV+oXl
	EZoJ2chg241aIngigbVodGQLPB9A42AID6Mody8GibkntHn6Lr3DOIqoaxM5ryNBG0U8=
X-Gm-Gg: AYBFou13CwUcNaUBY51E5zJr7vSWMPD6kJWNPAbQHZ/FYeIkAw6klUF8JtzEfhdaJC0
	lvZN8dCpUG9TeHSiAUNxftX6srdGG8E+fFUL29yCJxyUR5dqcC1nwok4rzUQD3PP1yPNasCgH1k
	V5EOqtufvuW2bo8HBYii7wzo71F+Wg0mhcm6A/sdnB5NP2UHNr/lFuRH9U3dyukAPj7dylwBLp5
	p5LwBBqjd8bBnxNaPqQ5ga4JFG7/mjnj263pqf/u9YN7A+oX5bBJw75H+G2YNuRZwyxr8ey20sb
	Uzja2JvtAHv0isj4ROtL+4CJZhd/SmARPKRLNxFcItX1n+HnptIhs3XKG6AA6vk2DWZKqvIJtxr
	4QVutiI4DVFxQTO4OYLIg6R0DDs+AOJAbx2MoIazdiPkDkddrzzIOoY3xYwJSsTjZ4/qBFyJEuV
	4mP5x6
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979109a91.20.1793168275418;
        Tue, 27 Oct 2026 23:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979099a91.20.1793168274988;
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a944acasm1441431a91.7.2026.10.27.23.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:47:47 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
Message-ID: <auGTi2SWAeT8fg/Y@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
 <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
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
In-Reply-To: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfXy3JqeY2lT+ge
 Pp8o8OJHDEVdMvV0aDNNT1KPHBWu0DL/rjCVHLByfpTQ9zluokoSG09CEIffSc3AAfTFN8pOQ+O
 +v3Q92ggUniNPB0rUOvlksLotVrReODb6mEVqHYYLA9wwpyZAPjCqL+Im9aKaeZZL5Elz4H2qn7
 kvzNdE0NBjJ/gVgrj/OfaeYP4vU7ZY21Qy8rn4Jm5y4rA4evCLfl2u+0EMnG0j1ZXpzksHssgZX
 aRUXHkBtyxvoVs0Fg4XLbj8H2NyGZUTObzhnuGBebj78qjvoktZQgYbQ8AIueuvreDUdCVqWpW6
 3DAY3EO2D7UNcbcZc3WXciOhEGViv3FarqduEgtStgL9wnwUyIBgH2bQ6xcGAojl+6XdudU4ZT/
 7ezejfIIPaMmWTnYFb2azrToG2wCo29IUFO5G4dco/b9Rry6w6EhC+UeUDyL1KYGkKRza/XN7JU
 xgCydyoY+G6mGGq989w==
X-Proofpoint-GUID: iH-mGmvjhqpiqJ3z_t0YEWA-K7cDT744
X-Proofpoint-ORIG-GUID: iH-mGmvjhqpiqJ3z_t0YEWA-K7cDT744
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX1nSxvGip7WxY
 7LrRw11LKc6cWwmXHTBfXG78VB4dYMvRGlNHKoiGdJMCXhwbL9nvG/2o+YVQbdhto98X2Pp3rbv
 YGujULnGOIVM3GsOhtyLjbamIdvm0Io=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae19394 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024

On Thu, Oct 22, 2026 at 10:06:09AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > 
> > Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> > DLC daughter card connected to DSI0_B2B on carrier card.
> 
> [...]
> 
> > +&{/} {
> > +	backlight: backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> > +		default-on;
> 
> This is a little strange, doesn't it come on as the panel unblanks?
>

I verified by removing default-on and it is working. we will handle 
it in next revision
 
> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
