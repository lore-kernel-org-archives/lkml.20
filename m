Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F913F12EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753793; cv=none; b=QTh6jfabXp5vO0n6wKyFeLNOJAZhAekCvsVeH0MqcbvzNybL9TkuMZ+Wq1PtV5dCacr3oTnKptE8nJvvt0GK2JAjxsUB3zFtavTOS/H0N+VwKcIfjZluJv7UrSI3NWo0NhMGT9SKg4GhtDu5qYV7p/uv7/jDH8LQ62Pzav1nazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753793; c=relaxed/simple;
	bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPhVgXafWslDSKIWOjXcisD4YnRsn5FzG3mop5ANFzwMljib+A+CZ4RN6B6jePed3VbvV9Sa+9Q8UfnobB0fUWx+pS8brm7AhazdeZTOkcyEy33J5NxDF/+XiojgYGSGt0252pVHZDf/liNMp08UUgUhzhB7PLBriRXkH8s1SLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5rAc/Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/p1RFFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5rAc/Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/p1RFFV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lGvv3454915
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 04:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nHa62S2Fcop0tZTlAtSH7Mpl
	YDBYa+sP0sz9MET4hIQ=; b=Q5rAc/KrRsZVCUKuHOaqa1dHn41YqhPSjp8LrCX2
	+Rj/jmzD14q7cisqYksr882AOOov2OYEs8ZI64HbHGr3PD7ypqrO8NO1HrIa2FA4
	P26lYKppG2O/a641PTCAvVytMFzSjR0JTo9PJezMko9gyQ2hp5M8MwJE0eUTYEx2
	BNsJyckesb9c9UrtzZOh15Kg1hsKTMjRN/Lqo15G8cKnIv1YJ3f6tUyHloZNb2Zk
	udzwWClUGZ8kRyNavVkikTnr4Ho4slqKfs0BtBu6ALr3KySZdjGQak0nfdbhkrf6
	Jds81yifsmkYL214lgc+pJA2z672ZZW9OCvPY2bPLqIjmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany4vsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:03:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so5404631a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753784; x=1789358584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
        b=B/p1RFFVephpB1p6vEil4vfpF0dB8QpA+9s/cPiIMpmDoKe71XmcPGyv9FU/17aekd
         zLZR/lpyGnN6O0qKbveb1kpTNDh0TMahqGHrFduW8WqJiqdxerQP4jxQ60v4YbUp0jpg
         oE/6WrkCA9JWuMuAZ9WwgrnnvrLd120iaZGyzUzNvQ6a508OgOjqa8HwJGxRu59e+2LG
         95bmkLNh2SY+PifBDvfCs6SrdigvDrEWKYaEza8uzAItJ06IuaazIszgpbLSfFCUTEMH
         3sAjlZF+xVFUJv3N51LNyxQClOJ62TavU6EoYqIBd0hz/CK+zrczDctwUFeTYakSeydK
         54sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753784; x=1789358584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
        b=OicY+FTYBfL3qRf09TsM1oc2ipRm8vB0V4LvgqKAc9ehuXWh/JVAxHVHaKsHMdf2zW
         +brcl41D2Xm6GNfXwn+/2mrIvNwXPO9WJJt5GWBTaehG5a0dumwBOzv45RIxm4xfAtYS
         SS3R+2aq13M0I6Fb0zShHxFoh5p8loDs09DGbS3ZSMQovu8O8IoBT32dMrgFQUuwYTTK
         Id45uBXPhpwzllNCndpzjxIewvnGgn5sOikTZ3Z8B2ktgGshN3FVRPElkh/1kpkRtRYN
         bmWzMzpqY5b0fGgcjnE2wGC8OQ+AV8zIgrFNccmKxyoSYrjgdEOxfzY0cS8Uh69FIw45
         YQbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuEH2XfIbQqYFEluWreGURApI1FcyhMgowlBwbYU98dmlVA+NH7SsC3SfInTB/B1zVb2tkOcG1fABNssM=@vger.kernel.org
X-Gm-Message-State: AFuF++mLcCNwwJwXcQtfoZl0rOtcOM2aNw1FDl0NGrLx6ebeC7IiwQk1
	rS6yZ4SoOQ1xXlNp8izev8OYfcNgmwa0+rGeH4M6S60oXfYgJHj3ygAXPlKXMreQIOXlvExnmvR
	7sY3MUj0UGq8UwkeN383dYgskFhGHMyHCB2lbhJH8a3HXwI/bj5Gn4G0ACQy8rqkfoM4=
X-Gm-Gg: AYBFou17dIj+iywVq1lzhAxo/b2wwDmfvizjK3apnIfwUi4bxyY9ysRE2Gb8AUsdm3+
	/ncfcMPrtP4hn25EWzkK+MneFhPtC0iMUBtCrRHvPIVdhOusH+yeK/SSapPM+GZYHekQvS2bQmW
	UgLc/baGDrORTxWz8ozgU7t+9UBuNcBWmoRWxzymQqxRtGR7JgUD3BUxTKGOW18TA9gzkp15IJ4
	TX4LG9zGwrq56BxHHa/7UyObQsoVYw/nOWBHW2UMIPC32p374U8Ez68geU3Jp4fxpVtTz2rbdx0
	9t3xlpatinitGtj6FVSB0GG17C9nLDN8yDgGgV4QpGfY9VDIQwfmQAniWrDDMdMZk/SQZZz5wAP
	dKaSbZfveeVdYF7XvcXHBYn4pK8YQqeSCyAmgkHwxoXf7XxeeBJCcnWwvKem802scIK+n8B9OwB
	gm+CXzp8uC6SdpEGeLbH9ohhrgT5H+1w==
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr17670971a91.14.1788753784364;
        Sun, 06 Sep 2026 21:03:04 -0700 (PDT)
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr17670914a91.14.1788753783888;
        Sun, 06 Sep 2026 21:03:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm3798517c88.9.2026.09.06.21.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:03:03 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:32:55 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] usb: dwc3: core: Allow glue layer to pass
 reference clock rate
Message-ID: <ap43b3zog8iiBgt9@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-1-dab83120b10a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v2-1-dab83120b10a@outlook.com>
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e377e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=J1aC8j_Z7Edc-Vy2RqkA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: fCcCApCCvY6_sqvHPovpkWDlbJZRqzUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfXxEDI36A91cJn
 71xgGbBSfOpj2Wuka1w58ycHsMYwE4O6tRUB75AbPKXl6f+hQMNbKdMovsiS/dCOzrmfRuJv1ns
 kxtiBCF5teeyiFYAGPrBWfR6txZizB9WfBkd9BINVqeQ+RhGKhD8vgo/getmP2GnaDUPxf5RVIO
 RXVNRpbiwF3alK+s1FbSrOvjIEmqcKFwHuf3V3f55Kbyf/Xb6lYZGauqbOx8HNPORv2jnuoZyuY
 kq2UNkBJkmRWpmeIjBbts2DN6cAN9eKS1O9KEzYNOaCiB3e3unSurxR55/TtsiovYSAxQSW6LLE
 /q+/VV4ZRwrD/lYrDxSKYA0GBNK0WrZRjdcUojo8bG45UMW/AqHGD98WTMSH27xQ056WtLWR1Lj
 qY6VPatq2i1VO+aRv4vJ1C0cn/8mX05SV46tWpSk6sBYN/4mYwrd4lzoqR1odKYy5cVUAyaktNI
 VqOaS+kD+bqDYeYZYLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfXx2sQCmoE9jWU
 nODGcZmMEGrjlVzcYVCeaYnAkl5Ezg793F185xgA+qwJn/XvzNZuysHKT0dfHtpYQK/9alD8kgm
 eKGMfX4BxxsvboPsC+FkAoGTxi6Q/Lg=
X-Proofpoint-GUID: fCcCApCCvY6_sqvHPovpkWDlbJZRqzUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070039

On Sun, Sep 06, 2026 at 07:52:40AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add ability to pass the reference clock rate from the glue layer to the
> DWC3 core driver. The core calculates the reference clock period and
> frame length adjustment based on the reference clock rate.
>
> In the flattened snsp-dwc3 model, it is currently not possible to pass a
> reference clock that differs from the default since:
> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>
> The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
> flag in dwc3_probe_data to true, which disables the core driver's clock
> management, thus it also doesn't acquire the reference clock from the
> devicetree needed in dwc3_ref_clk_period.
>
> There's an existing DT property 'snps,ref-clock-period-ns', but that's
> been deprecated. In addition, basing the rate from the period is often
> not accurate enough to derive the frame length adjustment value.
>
> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
> and IPQ9574 with a reference clock rate that computes values for the
> period and frame length adjustment different from the hardware default
> from moving to the flattened model.
>
> So, add ability to set the reference clock rate in dwc3_probe_data, then
> have the core obtain the clock rate and use that to calculate the
> required period and frame length adjustment.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

