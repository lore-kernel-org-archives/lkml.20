Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604612;
	b=i3ersNL9FF7uP2jnf8oIVoZ/Nzk3P4NWBlHXvp25EO+cjo88rTX4bN5WPprD/lU8J4pm
	 oPtvFvUbtA2Sz9VR+TUL9rZx89d0K1PvL/6qdFRvJe3T0lV8XCNQDp96Tb4n21KyaMAXB
	 lsN9b83ASv+9sHwpt5CdiqOQDk/xqFE/n5EYepsHhgwnK73KwyCouVX/CNhCKO8BDc3dL
	 DvMBGLD12FKY+ZeAuQ1WkqclmPD9HRbCvNeXEY/kkCy3wSc07HUJKoGhul/A16ImUVouO
	 2otvohz4HZk6yl4YLQI3vz0N9X5MDDsQ35GCXpLwgi6Z8MeSBlZesihTX3QUw9GPLcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
	b=DVAyJ+hz0v+QKLnwbQk3X4cI24W4XZAWGceYFNfUFvfd2l84G3v7ReP72eEgUmNnegwl
	 3m/e54590V2w82/K3U0vUrjOvr37eXK4UEQf65qAw2QWu2W9lxELY6uUfBORwjm4IHKMl
	 tCfUt5IZS4KAQvRkQJthXPlB+5rhFy/sVfbii22/04h1u59l6H5xCWosfJWfYV3gW7136
	 UH0USTcdcJPocuNS42tLewdmP13keXybvsfA5Oc+p+GXbdoA2pQdZWqOVaFs3jWCTwyro
	 JwcbviYO5ihhEfSnB8u/+6KobpRacPgirpkjxtsKG4SEvskr/Q7eorYjyg9MzR3rJWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B1A606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B1A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTwUo4158360
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aSFKPdeTRbaa2HPhrRZ5lrX5
	j562cGmEBOpF2qSZv8s=; b=khjXYNgYOHV8sfchxq2tMxChs5gp1WBoK0+wGuuV
	vrubl1HA/2f6mHJ/1GdZHeEEjTsGufVlDRIDYhhf6TlrLzYusF8ifSqsd5wE+Abr
	ewlyso1tgsJDKqPW2E7FEgTk2y/7HKmg1Tee05FkYZZF0zI428AXaBt9BhhVnQBB
	+SkzeP/dfIevydKZatyDL1pMO+Z6mte5JRAGq/IMounxO/iRlt3FVUw6CQL2Cx7L
	+ytgjwP39PwH4lCvSKTFDxhxr8BoRdcE9AFyqm/twgU+8QAulUUk1HqYGaxlswlS
	F6CAV4HrHchMvniE8akFXyUO1X2up4jPjZHiz4C1abruhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q95sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:43:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so225464685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604610; x=1793209410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=OayrCijp16EU3jPa5yO8/sliQOVNdMKp/iB4XHvSCVTnyR4HHdltnejRAZQyZdB3FN
         dBRSn6MpyyL+m4moC64PaPx7BGw80TS6yAsudVpQt21kHjdXUEuE/l032wm40hcl7Uqd
         C8uHVnivziK9SMc3d4YJ9DOGBuUyjju3qZUCdVQ4NhgqrHA30aLEi+iWIsUtanI2snc+
         y18KexqiONjCm8L5S00KuQJA/4DXTg5IkVH2J3pBzs2hew4O3wTXJZP72BitnlX1aYO6
         8ENNMbQ0l3XV4w8jyxn1cXw3+L+r5E4auZosU4O/NKMRBGPzgGmfXbQXIdEil61nTRXf
         GT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604610; x=1793209410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=v/DJNjVBoJ8NhdGNs0rpghPJpRqWARF6M5bC9fhcj4uxwg2jNRXl6f3g+RbKWgUfpS
         iz8AxPGqZ3AacyAjKcRh7Bftr6cfntHLuxtKB4TEQT0jskKNl+pNjO6hkvq5tzE7BkET
         tZGI9mLXMEctblHVyj/keSrp86hahRf4zhuIUivxvfvNn01vAZRzaU5C6heEDi6I6/oG
         BfGjN69Cmkk9P2WEAerJNMnA8zLbUmumLNoVkW22lYFw9WTj4KIW0nyGX4WTk9GZYThp
         X0ndIBJm9ZIrvrLGeELWO0hCR3Yh2634xu9Drztyof9Ezlhyj/cu+RgRbPsTC4GchB8M
         DAOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuHl2KVv2GdiH+e3ElWOkR8voTs5/N9AAY0BcnWYNfndK1k5tBZoRZNstmTV0xJmqTOt+kAeNR9GnHnT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0A+Ge5f1x0cLmqpt0LyvttRYYTZcduveB1bJ1Ubb90yGRDrmY
	7/aHoWYJo3Jp3WcbTvK2p3C05HDCV31cPiFnIV/Ote88872Er9smWXfQxB9Qm02nz87coMc6RG2
	6ZkIwQ/hWtgRzWV2L4MKZkPacbzGLzQ798Cg9FmTDHClNEx9Z4S9wMhTqzRnxeh41UBo4XW7NJE
	I=
X-Gm-Gg: AYBFou20qjfT2/2zhLqtI7/CQeC25rX4hAixlfQdorzFiMY7O2mof+CY4amoHSuDeUr
	XVSNDm3Myq3AwFwdNeqzlqYGkdsOnVA8BgpT4Jx/pACZ5a61f3bc2f+h+AhtvRkVNyiLt+JN3Rm
	4zqTqiACApNZF1LoRCAQo/qgcRyYXBO4pJhUm10WkkrKi4PaDWDSk7PMTXlsFVErTcU+Swvrob5
	bRkxCx697qVLMiHFN1DPvrNvm+IjFdZsszxA8nqW6XHt7oi5qr7/AVFpzMK274EWvPEW4yuzogD
	8YQpf9xLQUnnxKGb5mC+zvgjpSg5SGmlCql6xoq78NXUZUeMPTEZnOchTJ+P0VeM3OW+qK6UiBF
	uzqQEUJNYItNARi7rxebfQLvOj4+1w3fk9GIDBEqzaTch95gPT6Cohsp/xwG9N35lA/X14IfAaP
	p9+rDINe83XCqy
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527031185a.47.1792604609938;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527027985a.47.1792604609508;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa12040ecsm640028e87.35.2026.10.21.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:43:28 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:43:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
Message-ID: <tx64ni2u6paa7pofcylmlwytjjqsi23pbiqnhp7wywbbywla2f@3xaql533unhw>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
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
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX6Oxpwfr23Tqy
 MHfcJkPoUWloKLoyDJRF0LefxBds6wx6igDwG1WmsbBpQHFYhuXI/YLZV6VZsbeRaZDIR7LL0Mr
 QMaKK5YneNvzEPypBYvshECOBopB7Vs=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8f9c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JR2_SSPbN-Trn9morxEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hfapIh63eb3-wbsHeY2_0dbikBLWfRvZ
X-Proofpoint-ORIG-GUID: hfapIh63eb3-wbsHeY2_0dbikBLWfRvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfXzSflkI7/DtnW
 3iD6OnGsvW4+TcvW/n3/pC/DomyUg+hDFPwxRhZAUlUugTMvU9+VU0CQTed4jsVhUydWrb0L0/M
 T77B5GuRDmbBgUBYERDYBUO2/fWOQhiaOaFGIqhoaWQHxUrzSM8mni4Z6tdmlh0zs+AkfBi6Hhw
 mRnCO4EiNtpxQaBdZcil7aB7JfYAECC1ol8IOl+lrMaNtrqeZ3/t6g7w8Mj9rIGQnLbiz/Up7d5
 0WofkyTdkMxS1b1lezsNNSizEtwfk26OEpzbxZIHb75R5D+Gnt1lYU80gMOpAlmVmo/ypwaKOyQ
 u+pr3t/ss9LiW0kU/r4jm3ZVQT/WEjUbel345phBkt0CXXXOc8vTGDUmAK7XxDZD0+JjyGSplZo
 cc+iTeHDn5tkhFojip9+oXuJhJI9xgbIgsa0RNVOBEjbMNcphzAT9+v2O+pZFvGiqfg1mg3gYV0
 DcvjIiWDFa6wBgJHmBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210070

On Fri, Oct 16, 2026 at 03:50:19PM +0200, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> > On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
> > that provide the clocks for the A55 CPU cores and L3 interconnect. When
> > the APSS clock driver probes, it attempts to reconfigure the already
> > running PLLs. As part of the reconfiguration sequence, the PLL output is
> > disabled and the PLL is placed into standby before being re-enabled.
> > Since the CPUs are actively clocked from these PLLs, removing the clock
> > during this window causes the system to hang.
> > 
> > Avoid reconfiguring PLLs that are already enabled and return early,
> > similar to clk_trion_pll_configure().
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 60173b076cc5..3641b2da92cd 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> >  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >  			     const struct alpha_pll_config *config)
> >  {
> > +	/* Check if PLL is already enabled */
> > +	if (trion_pll_is_enabled(pll, regmap))
> > +		return;
> 
> Please add a debug print to match the other similar calls
> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
