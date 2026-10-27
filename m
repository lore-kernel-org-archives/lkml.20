Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100282;
	b=5i0xgEbtmUs2F1eiivkJ6Yhrs0bHhIZHpbp0oFOkao4WFrHMPmG18mFC3Si5i0g5t8XC
	 LUdnQKAXWqHHnkjvUDcZK1dWq4HzjEqzOrueDSJ50yyZgdSXpEaE4iyKYlkOJY+Cc2NY4
	 3YknhGdBTHro4pYeM7P9UFZ0+WXdtaLFRH9ukKD59w6NBXpUV3qTFvE+hJoCLAzLG/WGH
	 e3Sf5rKM38OZlYGgw5sp2YJirVqVKUSgVxHXthhHEp5N0LdGNEXANQyeGAE5k/Npg8yw7
	 CkNPIDm6I7pi+4xMsK71OM+yqXGDEbPE/UZkwmhSWQOa+f1eHP6iW3vbhuX6F3fxxOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
	b=3a/4Sc4Fco3VR6FBdkgRExrD5ccqNfaSws706YGJzRuM/oI/Y8X84v9B9VkoegvsXs0y
	 YzDIJOfXAj/M0pOuBYnyOt5TeLEmj6o7zidDE35UOwqrBf6jaPf12Udgd4/ulPpGsJBvJ
	 mzxXJ4oQiSbxbootSdV4jjaTKet1MnRsLFRUJXneV/cxJ/OJ2iA6ne5QiAbEDqt2r7Ybv
	 MY6Sx31l9vjo93/Sj8KFkI5prde53SFr8HqLGV7rrfltfiVSGM1jlaARb0FQ03hlqyXRF
	 ZPZ5LmIV7t9ZbiauJEw2IwdqTIV/d1aub6fpmE8YoCtQNNQjYS9ixWos93uBDub6uzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TRPH/WHK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hh/hcgDh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C523A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C523A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRPH/WHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hh/hcgDh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0VL1921832
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EebyHFSMp1n9L12tdULGndsY
	oFeYpVO3FQRxlQ5nOoE=; b=TRPH/WHKXcU5bERME6r6Sfqelaypr4fFjNzjkaxa
	YrKCMAnP9iS/qaiiZnI3szfyLH+fhSPrLUAh124W2cP6GCejTAUF0VLYQE5tziKx
	/tp9d+0n7MOqWtc5qrR04x8pqVAOzXfsFa8QLR5hC9Rle5Sk1Vf5DnAgoDZVmm3D
	N9JWzoR19LOkbDBTtZyjJIpwLMeUwAw+VsUiYZUw9NRbOM5nqNBYYjq8Dd2d1N1/
	G11vD8bnRc3SdQoRo8L+9kenhO+kBtjpn3S0pVeCzGjKeDwCXLt1pJtUtSKWMDg7
	vdc6EgW5Pc5QIdYY9peXirc2Pfd9WGOvX4o/EorN2Bsc4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68m0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:24:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so671137185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100280; x=1793705080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=Hh/hcgDhL9DivEOD7blRfa5Qz8zze0LKOjo21tSOf0TZCss+yRduFCrTULIjdCe/Wo
         6AT8+iRF75ewkWRJlh01YOvekeRQgsPOT/FHXvnBPlZKfnNDTTBeOz37Y+kQXSeA0iCx
         qGGqAv4ETB5RieYfZ3+QX/4GLiFp/+b9g5bn3OTZXfjehq8bUOCtkP8JDdnBiYxbgYHp
         GWrXqJHa6NzE5S9r3v+JuBq3jA8J1ynNEX3ff7RXdkKK+MgkywnGC37deWZRovPdvbnO
         YP1SgqC5y+qXsTxjdit/IRn26FeZ+wdDtZwWifK0J6qxtI8lgLgYpF1Vd9c67tWddzRx
         SvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100280; x=1793705080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EebyHFSMp1n9L12tdULGndsYoFeYpVO3FQRxlQ5nOoE=;
        b=c6V5y2zfkhQB/iaGcBau+TeAUYLO+nqHXYVMGz4spWm7BsNWidYzqkOxDfbEGsC7l0
         wl6JmhMal0nczDWgsOrpH92V+HoIDmr62f8fXEaOT+z1N8t4HsUk7OcBrqmuZkEK5i2d
         VYolKK6EGEcbzFCC8FWmdU/mntRa+RvtKpUlq09RM5aAkgpo0WTpDosK4s4x91Pmm/KU
         Sp8Mb32qA0bK1Hpi3n7W1ssekc2zw1SuHBCZY36XR/CtGaqAWt+N/fLSw64Wq1yRUr2X
         rKC7b/JeIaigSeOgA1ysF236hcUbaeN0nuRs+dk4CITNa0aWDDjZQZVRgDzOaPrWB7HL
         SJvg==
X-Forwarded-Encrypted: i=1; AKwUvBycbR4u3RLghw+3gv8IbgfD5x+n5ivgosxclNdEIp3WN5SZj2kNTMguWJm109Oa0tce1Ro+i+B5e3ZmMi0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf5wYrJRyIWG60hlAzUoZMscUHFhY2gIab9D2BSJ2ZreHDCiDV
	RdyPWRPA1HcbDLHVjP1fqpcXEH6YRcLKxbUjI+OefXfZEHx9FMbthB72gGa12CvIcgTFf6txfOf
	c5CR+g57x20ephAeSrQaZA+da59XEWlIbeV5MIpvYc+mFerDVBPk+HC/hnChfHcp5n6E=
X-Gm-Gg: AYBFou2KiGUYxq8hsYLolsOC0mVCLSe1+LG5+bFT4ZN/ZAWchg1YsalVJPuqFt4ibJC
	ycwnlzA8Hv3AMVoWZCiM1CQVbN0GopGH4axwU1ccdVS/N/w5t55MLLN3ZIYLKX5fXnx8VC3qTN0
	v9PV3pL+bLGeh1ala/WlpJjSHPjoFvxESg/nz5H9nSmLfyL/5sbLxootors/siSArqzV9pWFjHu
	VxnhwmaW6fzm3LzaPipi0d4KozEd9rqp3g/1bDZ6zHdzuGQMeX6FUnJ7MlLgAORXA2GnzIAbqbV
	aTOkNAqladDVbFZgZHe6egSfzz5417hlbOAwnUIlQepUElwsP+MoxFasaP/x1XkJ4nuHpENfz2v
	em+nZuFFeKrAkfUWq
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488918885a.18.1793100279944;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-940ef914997mr1488913785a.18.1793100279289;
        Tue, 27 Oct 2026 04:24:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm20649357f8f.22.2026.10.27.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:24:38 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:24:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
Message-ID: <dz4woik4nsgqpyahkbzvxeq65oaqhopvf3mltpsxvf6dpkvof6@zjsv4sbzjfjr>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae089f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=v7bdSaspc-564zGwiskA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U4bKq4Tw_CSsoGCnlKx0YNErYVswKZmp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX7I8A094NDEFP
 mjMBAdtdjmCCYBBthKHDUTRZb5P7LQGJOB23rnL7tjQWX+uNsNuTN2uM0rlwT2xZuihPPicfoHX
 UejInnG3pbsigPg5pa+zkE45EULqqzY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX6L05DYuzB7n6
 A61kfPFHTVkAMW18uO0aCTA07VAGnw5jHeFVJcUAoU/65NITS15t5blgcWdvCygsCT+/d8DKgEq
 MZ55w/qfbxqwSJ0qBy00AL8gxS7hDXoOCQDyRBQJVYmOUi+YQWmRvQjmEcz4R+s2Sypgt2AAQ94
 eaFx+ZkmQ745vbcnFQUgEWLd5udIMEv6QGqtKExjSc36dN1L2mu3CPCcTuYGkV+SePgfHKAU4Rn
 AhoyiMhMxbiX0FIZ+KGOFccRL9XN52vfUyFc/jYAOA8fxTE5oEF15OQNp2tQFv2MaweNGwiABGR
 Lhc9hHmRiDepwRoRCPPLUR0hdyVruDlEJz8uhTwxP5qdeXefNtG5XcuYNEYa4g4gnrzgWYI2dxO
 iTXrLZ7VBMWsnGcSny+ONVKAAMl4yfJTXarjKm2AEOvp12V2FX2RaC81iwv0s/zzqSqt6OBDcyf
 qoI7FQQfxSc1Qou5ZMw==
X-Proofpoint-ORIG-GUID: U4bKq4Tw_CSsoGCnlKx0YNErYVswKZmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-26 13:08:12, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
