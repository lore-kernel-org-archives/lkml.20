Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792736926;
	b=N3BzcP9XAtX0RmEx57yzpCVpVkthDv9EuGAzS9EY7zNCTCHS00H1vRNRJfAyHb99dAEc
	 caWvyvZ1EgBz/i+PWz+oGZpmIpI8imc4HDtYKFvf8KYORpGWCXcYZ/h96/Lv/NhQ8FAaN
	 XP+1VGXDAYNK7FtonnESL8f9oLU6+cac77U18P3E+94ItaEJ7XATsd2Zi9DxsV6CD6/+0
	 l7LnfCrd4orS8XdwWhlIWO9GbTNA0wtsQ9+Nn9R7l4AllLmBGfpsl3h6UGOw99E9XcFj2
	 FXzdV09rjao4Xj9KNOXkmQUBImMra1cyR/OyECUdlhHeYY0fF80OtGAM/jPrDUQDq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792736926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
	b=doLQh/rzq21eqPpDY/qx8NyG61JPuJjakwZZ7Q91jonU+XenlILzdpwZtWRoadqHkXhb
	 gwa/LeRBrl7DL/mNk7WFge3N9nA+znAQceMwjGFj7bK2zdHAoulhIS8FHouIohr3LDEXf
	 Ek5m85ooorBbWcDN0BOh4b/Pq5/LpDXoeAKmpMshrxqxYLGD8NVdQZeOxNY2yCz+m3L6n
	 JyVEgOEiK5rIFx04d/lJw6JSJwzV3rHq3l34zdqfe0yAlp9d9QEe9IdAYUkScxAlrsuZe
	 dpL6kALTBaSh673/kmnXNLNG8+GkHU1Xa3P4eHtXWmDoS+KU+p/2e1Ri0WLqD2XxrZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+u+GPLB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlZSfhS2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195A606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3195A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+u+GPLB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlZSfhS2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FFaN1869602
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DW2w0x591pvjHkfz8jt7Fqo1
	AwPIyp85Xma/TxwZuQY=; b=m+u+GPLBPWPBd6lTolvyN8SBmqB80emrAO701WFU
	rJiByVr/KqWc0kdL1MwrXF+dj8MH25FWQGdMontfbuxAh3rXEFxvID6Nfbg6yf/s
	ojJWPM2t22z3tdwabCyJmadKTAjVLyOcxf0ft72r44SQUtFpSqLyLz9EIXQONQaL
	cc51rE7M4lhu7HhTtCJI/HUGUjD5bdMnUswvXjYP+EgfNm/MqeYcaG96Gpt75n2S
	FbPaZHKH2PMaPOaoQ0FwRcRsKVqmZkKRilDTl9gej6SzC0bjFa3eCKqAxS/M0CLd
	6dXu4oUUUKE05Wy9bJx0NKlaVdc8kOkPR5G1lICHcnhdPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmja9jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:28:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93d3a7335so1358395ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792736924; x=1793341724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=XlZSfhS2ke5TU324pzhJKCKbiqUVmFtpPiVHV3jKSyigQgYqGEZeNaf8ucVjyK8noD
         zSIv0udnso9fZrzw4TP6Qj3I6cWl2tzXZ1ENXxw7bQlo1r6yWI2YA6/Dw5F9O6L99zB2
         GR7RKEt/e/KS7CLG0IkZ4ilFKQu/E61uMw9yxYsW9nInamX5zDuH76YtPrlEBVQHMiIc
         jkdI1bqsGvESrwA4oaj15pIlo8Nilu5RcdL9LVlaML5TbtMihvcvCNAD1grsAPGpQGxv
         T0uWdTOB+wfTrZWcxuUQz58l+CHtaKPVMEyTsTzWgmt9la/rKdQRxeMlKgeM406B9/mV
         swJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792736924; x=1793341724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=p6fULFePZ/lx6tLrEybfJMDwHv3wnXlMTs70KxhcBH26aizbljUfMpvjyFPeRLCqkM
         cxpoXqknBSx9BFsGk8A1ILilZSOVS+bp08GQgZKSkH5AWwkKSBxjEZw43Gqxvcgf9Rtc
         ExjjLKsb026/WmaFAoBISWBxRDcQXT/RG2ifZ5xs1g/UikvOHZUkii5i0mmcWqtm0iKz
         bfS8HTqV/wXSSN+7IguDaRrC+tD4ZHDiM6TrhBhrM6pVX/GO2nc/o2oplqKbN51iWNRB
         9un8LoObj1ameuL6Rmwd4ki41unKXUTA3y6NkuhnMtajR6hyRI4oh0Df2p74s9q6sYHf
         56iw==
X-Forwarded-Encrypted: i=1; AKwUvBzwplMyG6O3dNnH5rgat4tPQgDhP6W83NpDaQkVXn6yEgC3e3DQ7Xxy7J1bnIxEky19xu1oxHo/VhVsZdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc7cQHeieTCFhE8wnvkj56k18t6ndhgNdspBW5PHGmp9Xl8/4p
	xoHAzir16sJn3pG44ki5L/zg7YGSCipH+V+IGPL5rQBanFDa7ek5OV21ho3HP5n9vgU6HgB1UOV
	kJdFE9AfP+rm+ojmjSiPeDPZ5jEqXmPCWcjaMGs37vvxFgfNuPyBpaj2EODGqL159Aj7BAyaHd6
	k=
X-Gm-Gg: AYBFou1MAHAVitMPsJ4QEENcI6sk4CTF1/NlJVRm5yKTVJ425PDqP2GlrzSxMoyNyy3
	cOfEapUZSTNtQoRGovQDJfYg0CPqTtLKu+qNNsrMO+pLzFNULNy9qBpf6N498YujCwqPKe0Zfq5
	xdA60mKTGGxyY9ak5rEk5kdVKk69HuOZD1cxOjmWuMp3wGhu6lVZBEglqvgRe1wR7K7xzcaIdZh
	orJRzq/jn9E/PNDpA6n4SkSdddS1voeJPFlNpsW4wOy0lf4i+A2BFlS/pW2lxpC91hHhxb5dUEe
	X53EljPemBx/kWpZzZ+QK0ryHFSQcb8pBjAXBiBQtBKfLJ0we4uPxgFtATrEeHX4VBHosImo2/Z
	k5TsJMb99KjxB7QXBNrVoXQGd4YWgajU73utnN766GlxbplN+BJt2IE93AgUawuwUvQ1ueRy8d5
	5Ux33n3xne7p55WmikNqJAOvp09F1z1N2waH707G6z382exf5Iopdo
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118735ad.3.1792736923948;
        Thu, 22 Oct 2026 23:28:43 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118515ad.3.1792736923522;
        Thu, 22 Oct 2026 23:28:43 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3b01a6sm5982175ad.44.2026.10.22.23.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:28:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:58:35 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk:
 Add HDMI overlay
Message-ID: <atr+k3qqNHWHlvmh@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
 <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
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
In-Reply-To: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
X-Proofpoint-GUID: IJOA-CQ9gOcCLRkeFv_b8K2b0xJby_Zp
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adafe9d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N28F3utlMq1gC_S77h4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfX3MDcX3veHWAe
 wsYje2p4w92N+BDj00nqOP81gFAlECnsmigTK0CAGe4mJejPy+Mu+QYPXbUlYcDCZuJhVQh47Vc
 tEKdP8uCrEbPD2SdFZnX1RiqEC/k95Y=
X-Proofpoint-ORIG-GUID: IJOA-CQ9gOcCLRkeFv_b8K2b0xJby_Zp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfXx8KH4XNw1NoX
 jpdQWmBwXEbuqtdlMgXX4h3dayBmIbjY9VJrgb4NaobbGTz1yBb3F3X7RAiWzpDq1SVztIE5pld
 G9/jxMBCwBc8+ZeycC9L7eI6Fkoj+Dl29sE6uHg6utNgEy1wtzXd5kW/PoFfIpd/M7MawXz0CUk
 4NeCH35QwITFQz/vhhHRLuKARTZghKgzrZH/itasUcK0wlmfmjEHD1lDnpysO2zN4ukKvoQxQJd
 QA1JQjhkmPWaAwli2ayPhaH7qD5HvYZzMvarDWOE4wz4LveAoi+RIymt9nbclrudwUnbteQ9veg
 /bqankpG6qbBMlDiZ2kxLe/qWf3RYvwN8tZw23p6QYklU2xPUw3zUlbQ2wN5w/TGiBYRHtDrHOh
 3fv8I0/JjCo39buo6i2lgAlvnBL8+kSNcrGR+6O5f6EiOl3lTD9zmSVEDieC8Z6UThEO7n7b/UY
 SrxSVPwdU51x06bL1pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230025

On Thu, Oct 22, 2026 at 10:13:29AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> > DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> > LT9611UXD is connected through I2C4, with reset and interrupt connected
> > to tlmm GPIO76 and GPIO85.
> 
> [...]
> 
> 
> > +&mdss_dsi0 {
> > +	panel@0 {
> > +		status = "disabled";
> > +	};
> > +};
> 
> Please refer to the panel by its label directly
Ok currently label is not added in base dt shikra-cqs-evk and shikra-cqm-evk,
will add label in next revision.
> Konrad
