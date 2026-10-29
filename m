Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238680;
	b=t8aJjB1UjUUtAg3XoWTykx1G7gQYnxnRxe6Mkh3yzNuRYjvg+8qwZ0znvMKaRXyRaTDu
	 BtqQMqpr8HogNWKrh+4WzkiyQaWTg+fYQg+A1KTndolCKqj2esfM5TXP97LaJkqbljMyO
	 OIdsv3j7CRrMN1SPr/2MY1lHycU+HT/lDlk91ZerS9Z/c3p8kkf3A4JoQauKxgGky+Q+Y
	 Kfki/6//H+8JTCHEwMiUexWrGah+DU67+tfKB6QjV7RSzcjPz9J80cYTnH9aHAOheaLB1
	 dDBhVT9eR1jRx8Eiav8XNTtJre5FCw26sA40fvjddTBB2qimb5e2eXXCi5YrNPFHVSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
	b=jVsFCGePd2riteSw3Dzm3eCszZKgI9pfZhUXcKicwKJNmvyLk5TqOaNeg7qdvaaetKJw
	 zXmKD/Us7q+pebFsOufHmnpYhOxzDAFuCj7cmE/dpybXqon4vihJLD4ySdcuv+pz/Cvcc
	 OQoPq4j5ZNqSPzApuua60YoG5Mz1VSRPSF1OFgOTVVJVbx60QzyURiAWW3D42vNhLkWx2
	 VRL07gbJFCsBFgO8IrLajL+nZs7CL+WKZ8UmL6/dWyfxP+yHpxmra4G7Yi6lNV9x0a0Tz
	 ormr9mzhBg3KgvPpdUZWPITgjZyjJ1i26GjmJyd7PFR/CD93Zo6KWHPxtAbmodfenjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjE+YALq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f71RSJsk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF01606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjE+YALq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f71RSJsk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jhBi2830133
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2NgBNbLq+9RK99duvmMJui2c
	E6p6jlGXHry0ZBzeGwQ=; b=PjE+YALq5oSs0K/SsDeOpvvR0L5UI9h9ymC7pRL4
	Sh1CdtNvbAUhOeF+ITnRzndDlS43zOdQvMRl7oTlwDSxC1XtXQ0pYSP9QWcOM/Ex
	6lXeUF6dfiTvAdaP38CmtZ5/rBba9KVHhu3X1dfXrUyxkTG/jYH+QWCnTWmqY+iR
	uMyqAaqquH6+ior3SZemUKnpK8mwg/+epjGvrdVh96j11o2rocDcEQxzZGsLg2et
	Z1v9hBLCt3l7nq72oN5/TEdSlaH/Bt6/qRPvCdt2OM8IYQHV+iewGf5ppQM5gQrE
	kBVaIbnuhE4wrRxsyrtRrQCa6ONeslB1TOwuvj6hxKFYvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpsc8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso51794685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238663; x=1793843463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
        b=f71RSJskHUY8w0Up1IqrAWrSwJ7qGp7VMJPalzdmC6nWtGtY0GtO0lQvAIKMaDR+st
         OhwIHpUSb7y+7bsUEJqUOqeEinweGKXfKLei5UqkvHVFmTNgRdb5s4rv6suzhE3AA+ix
         SSwKewQloywHNNyJkKSTXIUOF9Xj2ScQfP+wmkaM3WuHC7e7ZqaynF1rTK4iZOqA7V5w
         pieba7oY8GrhYd6CtejMLlgoiU6wx1CYH5FWSSCo57w20zrI3EcOMO3+oyt80kmE3H1K
         /hdD7KQXPPAMFzhfI49agL10slInQvPueJC6Sb77zCNity0kgwVLQWDIUilpSsj1fD4c
         myUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238663; x=1793843463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
        b=qMJHKY6x6yj9wCUx883MVM4XRVaAFGYFIYhIG88knwxb2lFKnOmk74XUQNiaxVjNN8
         /HZJ2Q4nsCkSB4AWq9oPPzug+qiMiKzx5OIWogI3LN8xLXQt94Lw/75Rxi9QTBzQNx5Z
         nibmsLMNbleUNcqMNk4v4P6uZpu66CB3z/d808um7DYWYr/1iHKLhaOWkbwvSjgUbIkS
         CorE0TVshO+RlZxRhOTYgdI6wvzXJSGuA0vjkORfxOxfF/H87cFypSUGefeKneVNjVcc
         PMTVA5mYJ8wW22kXYWoEHgk85PrnwI6DWtmW/auZeLV29Uf1XEPTPsnhUMtqiAxalqbB
         +xCw==
X-Forwarded-Encrypted: i=1; AKwUvBzQH0vIevGwcPRWEWJNG+NOOkQaFUevv2ix87g13R98JxZci6fwM1rLMDEQ0eUPFVXKx4dBCoqCGCKVsIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwgadvzRAa2GyShsLcx2Qn8J9H/D8xUI4NXzii4q95U/BWD9OU
	zGOseC+5PE1VOZnSXM649yHYimNYRWmc9JG7ca76bmNcw/vwjKZkBZt7XzncDMCxsO4eAjAosUV
	CSzY0E0GcDF/Lp2d9e8bD2Cn521x9mMNFugdxbI9HCc48hfzdoboXrcfpct9utxsC1wk=
X-Gm-Gg: AYBFou0yNxvrp9NkXpksz4ziYXX+LKBiXwv1eRgHwHlgyoJhjjvT8G2xR+ZgRDbBooi
	wsSBXBQh5pwFsVtz1ZWulswtZQcN9nDs3Ug/6QhS+m6YWd2VlVcF7Uv30MqQc9WOaN31PQfP1+k
	HIkALOzjjyPMRHKHtWsRapbf/bcJP9BZwpiI0P+VSDfI3NdWZ5zI8uyuqhOSi62secazVy20fWU
	iEtMJ60pgHADysyRORIi5cqnmxaxaCreH/PJr7wqM9sRDZdMLTJnQv5qlwYSvMfFpOhqjw2rYHR
	OlNAEKoEqzCYEuwYfOcHEyIJmS07zXv9X0CeWpth1cnJLzyrx9D9LCZYUb+RzL33wkCgQRxA53H
	VyRrh5om1IBhuJpPwss5EZcBAXA5n4acSoDnAyLiXFCEi19CHzkyJxTQx1gljGll+nIOYSj9xiA
	zDNckgJPxFY8IlLyR3DV8GZlW/yNwg2uKiqLUU+rFPo1W0WFjgya9hfyv0G8S3jA==
X-Received: by 2002:a05:620a:2815:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-94413381feemr207245185a.17.1793238662562;
        Wed, 28 Oct 2026 18:51:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-94413381feemr207242985a.17.1793238661951;
        Wed, 28 Oct 2026 18:51:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c8f4asm982402e87.83.2026.10.28.18.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:50:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:50:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
Message-ID: <uqtvrqp7rsmxcloz2fgzv2jbcofd3x7y6hm6plnan5mao4t5rr@6lxub7q3duti>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
 <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
 <Sm-FvdxaOiXpzzGo30wECHdQF_-LtUaJCO3mGpBUxXfnVCYjOLE5DhNWdNmOMhYdkR1RMXhPzWuHhsZJkJ_Vzw==@protonmail.internalid>
 <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
 <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
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
In-Reply-To: <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfX0eSARWl10/pL
 GSm0gZF9jfP5oVzRD6qxQ9KGcHd3GOaHt7Wt0D5bIL9jF4+HeziLx+ty07gt8lqnTihBy3k2+jC
 FTf41kI0tBaIdRzFtzIUSgNwZ+QXsLNpFlN11vbPRLxttN9boUiw5FcCNoLTQWtvtPqFspzUa11
 i3cGoQW22K0IRxGHdjxrMlwvYTy5XRaI2w0wtwTOOb19a2wb3KFzNw8UKniOYrBq8NmxBN4CbGn
 9H0oNmY9g8rlvvUsVsCOAnOzwqI87Dym7pc5erpx274c1/AQdGu7BcM5rd9tiKll+HivF2Lt2lA
 0TuFIxuve52UeGnWLOl07/JZIkM5mOo/1oEqKvWbNGGc6PlYzeskEW5Qf7ZO2JK71kGPz6wLceX
 VYLeS/rEKQMn64zTitCMOTDIp6Vdf56yJ68cpsTrQTvcw5oyUpR5jglH6MMD7LdEOHsrizobgEu
 P3IP9953H9OyJ/qhtEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfX8PGttB+MFdyl
 uqNQoB03pWU/WWxV2S7KQY9KF3VMvsCSDRrvNdDn63thyji678SZcnVyc2bnwngCpLkbTAlJ5uj
 v7xBCi8PHT1+2IswBLnNIyM/Zg7tdew=
X-Proofpoint-ORIG-GUID: 7-4SCMQkAX46rDJgI7147fb8YmF8eYrt
X-Proofpoint-GUID: 7-4SCMQkAX46rDJgI7147fb8YmF8eYrt
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae2a687 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=z-wHjszcAMnUrtkC1bAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290007

On Wed, Oct 28, 2026 at 11:00:29PM +0100, Bryan O'Donoghue wrote:
> On 28/10/2026 19:10, Atanas Filipov wrote:
> > What clock votes cannot express is why I think the camera NoC is an
> > interconnect:
> > 
> >   - The camera NoC is a bus with several independent masters: the VFE
> >     write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
> >     and the camnoc AXI clock sets its throughput.
> 
> I've always conceptually viewed the CamNoc as just another NoC that happens
> to live inside of the TITAN_TOP_GDSC power-island.
> 
> I think the trouble here is the CAMNOC_AXI_CLK is just one clock, it's not
> interconnecting any two things at all.
> 
> Noc entries in DT usually look like
> 
> interconnects = <&gem_noc MASTER_AMPSS_M0 0
> 		 &config_noc SLAVE_VENUS_CFG 0>,
> 		<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI_CH0 0>;
> 		interconnect-names = "cpu-cfg", "video-mem";
> 
> In the second case we're connecting an MMSS port to a DRAM port i.e. two
> completely separate producers/consumers and we have specific ports that
> RPM/RPMh is involved in managing.

RPM / RPMh are Qualcomm-specific abstractions. If you look underneath,
you'd see NoC clocks, being managed by the RPMh cores. We also have OSM
device, which describes how each of the cores / clusters is connected to
the L3 cache. On MSM8996 similarly there is a CBF device, which
describes connection between two core clusters.

From my PoV, CAMNOX_AXI, is just the same NoC clock, just not being
wired through RPM/RPMh. From this point of view the clock can be
described as as an interconnect, it gives correct abstraction: no matter
how the camera blocks are connected or how the connection between them
is managed in hardware / firmware / clock devices, there is a bus (aka
interconnect) between those camera blocks. If at some point the clock
becomes managed by RPMh, it won't (significantly) change the hardware
description

> 
> Which is not the case for CamNoc - here really we have some shared clocks
> which we need to calculate across components within the Camera power-island.
> 
> In downstream the CPAs code does that.
> 
> - icc-clk would I think over-provision clocks
> - CCF would as you've observed under-provision
> 
> - But a CPA's analog in upstream which components set/consume ?
> 
> That would work.
> 
> After all what we are doing here _is_ specific to how camera works. We don't
> really have many - any ? other examples in Qcom SoCs where we lump a number
> of different semi-independent components into one area - ICP, CDM, VFE, JPEG
> and ask them to share aggregated clocks - in a way that is specific to -
> guessing but - specific to how these components get modeled in silicon test
> benches.
> 
> My vote is to replicate CPAs in upstream with a CPA's icc provider driver.
> 
> The bandwidth calculations are already proven out in downstream and if we
> get it right - potentially its something downstream could switch to.
> 
> We could even use the interconnect API inside of the CPA's driver but, I
> think just doing votes via interconnect and icc_set_bw() into icc-clk in the
> drivers directly won't produce the same bandwidth calculations we have in
> downstream - which you may loathe downstream code but the clock calculations
> we'd assume are ~ a pretty good starting point.
> 
> So; make the CPAs driver an icc provider.
> 
> cpas_icc_set() could/should absorb the downstream cam_cpas_hw.c heuristic
> for calculating the aggregate clocks.
> 
> Its not represented in generic icc-clk right now and as we add in more
> clocks/SoCs this disparity will grow.
> 
> ---
> bod

-- 
With best wishes
Dmitry
