Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737450;
	b=GAqU4VOsc0MoLocUimp2MlXnFqa49o7IV03lggR9bPRKmCZf603h9g1USmAAcVq2FBil
	 /lurzWiPEJqqY/gGUEwKvupx/R1jDYulDsA8evC9qdaXemor5FPghUCCQP9pQkrCrx6Er
	 uQ3KiRBHPkv5gdrzo5ag0/x8QYE3NK5yhvRdfaqkVpnxSuCpSXhoXEogBZJeu8bklCc8H
	 HRgFMAnO91fK7D9AfLn6NqoOHfD3U4IhQhwBUJ4bUMROauN5UYIPMoDLoQdNbr8fFMRYn
	 EX32K5UqTERc4A7HfQn9urI0qjaGyZoJ3WsF14lfEsbzXl7B08eXW2wCHmrJiXUUSHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
	b=k6c643GFmxj4EKYz3ATzfi9ykEPTBKj5U9U/luvM1dkTM3jFM1jEVwFh/WEBw3qBcQCu
	 sCR6jTdfud5gYQIcMcaA42y76+vtURkJrJjcmJyVnWcwoxxBcOxCeLtCGxdtlOteAVIe7
	 +xxT0jkNxdoZAWjlQO/j+y07itGytPeF+9gzIluh0WCOqmjNJGljM9a5QLKp/GDbXtDZc
	 OJ3zj56ASbM1EVVpX3X6tV2Fsn9GiTEr9k6Su1DVSoN6tn+PQbqNr4T2lUhgIvmCWLKWf
	 wNCjjkHWwSbvyO/pIGC0P2yf0pmjB1dzMK22Y+N2n+GpCtsfi2kCZ/uxe5ur/0Y08HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENbUrwKw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVGCXmYB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5BE606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5BE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENbUrwKw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVGCXmYB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F6lk2376820
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4w9d0sRIsQ7UXyR/DRVXY1z
	FUeXW+at3Um1GzAx8ug=; b=ENbUrwKwANfB9VZ5cqxGMnLdt+7iBTxqZsStqlBr
	wO9G3FNVtMFEqSyfi35SvjYNEzqF7S7XLFlx06wItlOCffI2kxTGa7z6QV3euD02
	CZ2WCtzUMhdhFSHVZLdTRGMSonN2cf9wS8ES1FxfvFHHY36vLNW7v225W9A5s66i
	59MYsKf7AaKuk5f95DEZ5rzkk0cvV23yVo2wfUOmWLJci8Z3NuhSj7JYwMvltnx8
	XGAz9bm92jlcmI+Gc6hboVIMm3MT+Y2cZ9A1Uomyb96Ltk7pLaSm0Gjk9H71laSP
	QeMZYgd1V9xOS/p0en+11kCAxI1v4gUtD8+VtppQAeU44A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmra8sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:37:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac882b3e28so132135a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737448; x=1793342248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=fVGCXmYBazdb8QScgD+XyhVDN5GaloEShl7S1P3dkarXLuofIQs1FD3wijAFBIpMiX
         xp5RPPk1GdxdeKgShSNHbPot3RllVZfA9lYaxJcBH8X5Ji9u8hWNdqlQcux5c8lo6kDI
         aknGQANB6YRBkmYOTEzQGmmQHsiB5Ta+SE7oaT5KHo5ukrPeuIFcFJtIeIxNwgqNib53
         hWahYfOsedi7dDP+QusiOO7K82UogAeJjQEdMabOWupNZmQZ7hwZ9nJO/fw158QlD5z/
         wmF+I8jEnLNHaaOxLrcQU3Vos4Njt6spdZJqc8ReaUHJfk+vZ+RQxPFKtBjJXvFCVIBW
         w1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737448; x=1793342248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=ziZPEA4U99e288arhZ29ncbvxLM3tRDCCaF9zFraOcccwu4ZV+/YQrf1Nxd5Q51p2o
         IpFJWWPINiOaYYxdL6koeZ5jpnhsbK5Ih2XiuRylHI8lwse7YbKPOjQ4E81OxxN41tOd
         s2HhgpNrUWVlf6hfpN8/RXNlVNHr53yeCgh92oFfkrkQF83oN871VZ5iqkWYXRn1F2dw
         HPAVvg0JwOwacbQ7zSrgOgpWK4chWE4GaV+1huLzUvt1XsfSkrK4RKgCsNb/AtMDXfib
         ZRZLWT787EdtpS7lHJ7LkHF6q3eGdxQXJHXLIgcV8kZoZyE5InLi2rQiAuPRqYBN3o8T
         P/qg==
X-Forwarded-Encrypted: i=1; AKwUvBzVgmQyT6uFRwUItvWhUEgYLo3bkarNTm9pW4crJFvbpBihiVLvzsiXn4cnho2hyH3e2Dc5cB92sEK5krA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz1YpXecOwn7WboxPOBpCnFrim/N2iJmOvo+frswxeJqxf35lp
	3LiMVsQma4eB1PIgWw7mzIIaCM6q1preYc8Q3Oo1CzxtP5tsCOvE/tmbcWdLl71QWiMaQYoQ7XJ
	NwDEDpE+vE6XsxcMTknFI5Rd6xU9Jp3GFSml/BeUeP7fY4GwEwyQ17uWielBW9oRivAE=
X-Gm-Gg: AYBFou3L9trdVlwg6ghUHzmnyORthsm8864XFWLVXtQRKHu7xI5Pk9KMHMVOIzASX+A
	qouGreerYQdW/VtUh4azJCzeBI5oKc5lEpXTEO9cvLqIjf4exgoqqczKlnCsNaH4TEGhyS1nsEk
	Oph2AZkQXl59N0msLvTm/9MCBd0/HKZf9zz/YWN/Oa3uAU0rG4y6jEdEd5Q/jl3amwC4by0ktap
	+VwxR7NLHHk8LH8QgbsSl6vtvUgT6JFNKlNsYpr0nh6oWHxHHb/SeOfraFC16J6WfSQNHN/vkLD
	3ZcydMjjxYm0t5bg9C26V6G88Ntdn9X1dhpYzZqc+SRw79tt4YyF3KB4IXLzHqWaEato1bpodRV
	4ZqJd8omxM/QBMFNPAGT8jIAUOEZEIyGYBLrfPX4XNHO4JrSXSuOlkCBSciAIOvw+cSl6/OTeTu
	uCqIVt5ScyHSIT1B79OEVg8KBocRIpWo/1vnKAQUgTKD0AMGX309AG
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870533a91.4.1792737448037;
        Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870495a91.4.1792737447564;
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm7300020a91.1.2026.10.22.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:07:19 +0530
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
Message-ID: <atsAnygcrej9e8Af@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
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
In-Reply-To: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
X-Proofpoint-GUID: i4yC13yQtwsv6h9y7syk7-tPsNezAYx3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX3cjjQkjcTvy2
 ScExNEKx5MKnZ2x8+GJYg8CIWWd37S3+3O6Y1BNp0Yd3ty4izmXLDH8HprThufjTv+CtBTHPMGH
 jtI8qgpEdmpq/ZqvK7WnzdGFfNS9/NM=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb00a8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=i8vls60rVJ9ycRQRyeMA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX17ustKI1OVS5
 CKT816PI8DNp8yXmkQIugJWkP5j0tFD/qdnVs8e4neS4MF/R3+Eo1dIyTbf5YRXmDT/8iMySOla
 SF8i7UFtUf6c951GXh5CvdlSwPyjVgZqOp51WQxi+hdheRfw4Pis+6+/cBjqhs7977xXUlWmHn2
 GWvQA6AUtfioWgIYSCeImD8qGs511po3YKtCx1FlUZai7mBW6RAHQYr+gMmSNg88IjHnwdBPhjc
 +Yt82ALG0lW0lR46lrQb8u/WoZvxZU+83wc2+yy/0m2jKhas6Hq82cRKlJOK+fivcXU4AzwF1a3
 KGLW6sSat56bbOx+3EEQUVeFXanDFnwN0W0pYNIl6wo6A6ZbeJcg5/vb6WKL3/lCcx20WX26GH+
 +QtH19nzVl6H9fdHZoVI70KJ54MkFcD36mxH146zu6tmfgYbcD6nWfXg/l3Hm2n9TA8xmr48B5Y
 LlRF3RlNjWGNJyR6l/g==
X-Proofpoint-ORIG-GUID: i4yC13yQtwsv6h9y7syk7-tPsNezAYx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230026

On Thu, Oct 22, 2026 at 10:14:54AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> > card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> > named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> > DIP switch. There are multiple daughter cards designed that can be
> > connected to this PDISP1 DSI0 B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> > - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> > - CQS/CMS: DLC0697 DSI panel using a DLC daughter card
> 
> But if they're daughter cards, they should probably be overlays too?
These daughter cards are connected by default on the respective boards.
Therefore, we keep the default display configuration in the base DT so that users do not need to load an overlay for the default setup.

Users who want to use other display interfaces can remove the default daughter card and load the corresponding overlay.

> Konrad
