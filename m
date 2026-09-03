Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BA137CD3E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421789; cv=none; b=EhrBFpA924c6OJSg2kywVjlQGERBH6UMRey48ONvcgZOR9YGftWLmPxCrRnTaW01wvPq1MiAQIcTeu/yrBOX3T85bYIB+uWb8bSsjBytZDhaucMTwQRWf5mZ5UKEqWiGt0HlP8gOUgAs2lSWwmWG5g6TiQL/38Um1t49WzZWo+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421789; c=relaxed/simple;
	bh=ksv/avRnK4UOBJ1PwYrAwimKQy13c+CjYXmlx2M+y08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4+qtbvjO96um0FMF+oC5weLUgdbdZNxI3MsPtenU893nB9KNgtewvFECQIiawYQqoLenXyjTnxtXcHXr9dZjuKZT5PF1e5mcG/VRF9aIWc0m2zr80h8SX1SP05jANQiHUIeB4RipDuv/z3/8kNuGYbhZJjsdtPy5ESwZWRsCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1oxQjw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T13BqZOg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1oxQjw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T13BqZOg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lYvn3244943
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GHibo9Blx2AAUlYEMr9nHfq
	J5O/B9F3H0pQUm/H9Ds=; b=Q1oxQjw/FsamPFoT6xhhMx+0cOMRK02mhvy518Zk
	ZrXvctXVLhqBKLXcq4ksiw5hIGxZ+3HNBq1gSumdq+mfme0gCrThrv6fjTC/3szr
	fcUql69XiY38pX/hu1FVCSsB18qPV4I1s/Q7ZW8Vsb1yhRCumW/iw2Mx+vY714OH
	cgWs8379I1YRcESweUqdhoOZMLDum2TutAL2U9Kn8yM8ZGUUna6IUEPmRkuOAu6l
	zPyxT624VozAINaIfXnQWowqOT/DktWhyIzaao3jC09xhf72qZx/7iWtJiHWAWMU
	UoPE5fl5QxqlE0ht3rdJ8qW0HxunKcTeO0+31GiYmClhHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcecctp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:49:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso370561285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421786; x=1789026586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=T13BqZOgjfdoXUEhABJkkafh26fRsW28zEpYhfzCS1Jv7ehhaToPeksB7/T+82WKuM
         LrDVubgDRs3JIfrCGmHRtD/X3gW4mPllh2OAnhkrh4WwDm2PU7KUCKiMiU1o4PYGWNzr
         0VuHFFnmpwEqQdj4wWfyXeh4N2hVRJqBaH4H7/IcJLmZGGBtzYogcfdcoFa96Rl5MKc4
         XFxc1j+Trv+H0jX93OJ1JEVvrLTRjNFF9xWFql+ZbNVDOkUP8xagBedXSGAXMAhxMke3
         GbwIreI1ckQw1v0oLYB/lAd6rGnFB33WCssMokVA/tDC2rrrP8fAxLDfTXmQ0QHZUzYG
         pAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421786; x=1789026586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=qzeUA1Vt7PkG6bES/VDIlnz1w5KNKwnQEo7kVQPY+1l2udv81pawqAywIkEbBufAjF
         OvQe4hWyzmSyhdBvLAIy0GZAGRt8tchOmfWnt6zPF6q65FlEd9fPeADiOPYfxAmdkLC6
         u9/cSWAyVgJBd3PXFYbjDePrpoNTR66ZpIMkWRdU2PRxLeBJGI9uT/Lc1uymgWe8EPzh
         qqpkU/AB9yQ5cDxwEttKW9GG0Oe2sgZNRz3oehzXUCQjHPhVc5HM267wmnRMJqos477s
         TJWDPrVGrrJjxbv6+lzpFwM+sMV0Vf/umv4grWX8wU/CQf/OHezjJA59boQKnsqSIdhs
         34IQ==
X-Forwarded-Encrypted: i=1; AKwUvByAVT6VPzgUupdgPGsgM6Y1G6ctO4HhpdIhX0dqzXzNuoLyNylDFQqbnh1GqEsCKDbnEd5oCrXpw82soEw=@vger.kernel.org
X-Gm-Message-State: AFuF++lp34b3MW0l6mph8EjM+BEYX2hLuQAR1b6XWp4x8/nVPOgtdo9X
	xEWC3pkvH8g5q19rQq2WFLBHseUtPg4LZXT/78oW8RnYU3GY5ie/iMo2UOBLCpKBzrw8R9fIOAe
	+/MnsUOxweNfagEZ0N/sdesoH5Y8MVK6HUsxDCk+O4tIetxeYI8W9HAvU5TN6C9s36Hg=
X-Gm-Gg: AYBFou0e2KfjQFiyxyBmwSrI6T0Zc+8jgLZYMPMpnKzTVHaUyCxJ+R4J6Bq5tnN7SGy
	cPbHwEGuV3Ufgm35RAMSj0X32dGruBLbTBN+73LCNz6y+Afx4GC+dxitrq6hfPaXlzdKgJOcEJS
	M2Ba2dYXQuX+1FmSN6yhDRoeMcda6dOCBQbrxi1/f87xX70fkJXDf+V0/g2Z43RX5hle/2Lina+
	jf+ZCB9qgerMhALPY5/1sJLHolhUo7cRQ/9H8cWz25YcrG656GJXiSMh7/Bqom4h1a141nGba76
	wiKLZcY+Hr3CH+JotaWZM/hZell2OGKytbXuTfp0/Mfm7WzGcktVcEs1hIDw0QFK1nnX2dsUwk+
	N/NPltilgMKCftw==
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279825385a.41.1788421786019;
        Thu, 03 Sep 2026 00:49:46 -0700 (PDT)
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279821485a.41.1788421785465;
        Thu, 03 Sep 2026 00:49:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm11219681f8f.31.2026.09.03.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:49:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:49:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
Message-ID: <oznqr22wo4tuonlcs36uabppl7anwax6hcpdt4j5ppgjpmkzha@q3qmtizrtzam>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX5v0+a/exaM9E
 POSZcK/4kf49V502ypR/vQoAD8/+C/7ngjzp6gVARLrQRIpa9ZNdzBy7ohhJmZUr/i+0jmnVyjW
 pK2TGVIHFVVv64ao9suR/Kx0Qshf86sKea/bHc9bw+3+y35ZeSiyyJG0t4omThTQmKQ8cQe/gyq
 U/t3ENHGg1KLOOlonj/enzikoHShclp4ybxxVwycYeKz8HfDQtAeQW3v4Ze+v6AQ7F4d7iImem+
 gY2SeZZ+I0czGVJvonM0BnlToPsYwA/KDyau71NH0inxnWKhuBRo43i9SOz0+msZkzBR78ishzz
 lu5R0vUdUwaY3BWJKdNVtbRV2eqZKhvAv70z4yZIL1yIoQjeZNHKn6CZprUgZg9hO6yHRA7p34Y
 gf3iz31g5AIpVlw6X/8gMCGaJH+SXadgzPLSWO/9LOElkMZiHZsIOWbTUthrDcgOCuB3E8a5Pyr
 NA+CSxn5II1g3z49SmA==
X-Proofpoint-ORIG-GUID: krHvlgIs0UeKa8wxPnpMx6daQY2psy0p
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a99269b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: krHvlgIs0UeKa8wxPnpMx6daQY2psy0p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX3pGpJXUbDbYP
 Er/gDFBkUrzamb1rxdNBuUR/AFkUeojBifljlWK/JPjMB5SdATpLvisvxttW8Haj2BgWskfk8fz
 a6lVsJ2FKxkTdc6G+9FR2EWoOA54Kzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030068

On 26-09-02 21:22:25, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
