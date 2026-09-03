Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28693325726
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404635; cv=none; b=IhLr+gcI3Mb3scB3FcPvSoYxFDIzQSUu/JEPsJrXDwpXWebYv76rOlG58ZbeaoGNo1PXM/34yYfV6hbYMj92o5++MO+LqSn73y/6X1SVZSexRAFgG/Q3nA3eyGLYH/izLtVMI4TiHaQPRuDBmdP+jTWpPnXrX0LH35FdUEs+ziU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404635; c=relaxed/simple;
	bh=P9FnOrWtow+9Kvo+KtIS6ZuYrr1L9R4Wq2EndyLd34I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GP1nh2BZT3E3TLzhWO2AVzZzo9v1YL762VwRLZSle01sjECF7mCdqAEUgVbv2viaIKUT1VDiKM8p5Opzb+p/NfPvv0vjym9Dtd7KkoehKCOdXFqfugTOm/iVVnRBPQuk7nwG34cjqAq4hnBWZj+bXBoC9Rq39WscsNvhfiInDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jg83+l2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0tEdnLS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jg83+l2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0tEdnLS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68330B4C2752612
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 03:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IQwYwGRSkuZlx9JhvoUV/XoX
	OWFcMbYe9dIg4BR3CsM=; b=Jg83+l2YDmIje7ohnnrrmCQ4zSqtinAriN0sJOqm
	ACRQN56aZeHY7pHifkeSWZun150i4Ti68nfiYvex3PT8Fg+rEnYrmT6MAtQ080g4
	quUDOC/u1svnLBVg+FP/Iz//wN6GFVjYMjiW44b4TQSNeZbsn+nNDKmJsjPukC1N
	0jXbj2RjeKTtpnVs0vtLd3PUVkygydBvBd3prQoSC1moTCqeGhtKCQUwPHp7iY4s
	RZQ/dN7QnITJS3DxmlWKPS4eEPRqDAMzpC4Rj1R5pEHXxZdDg5INXjbNj8LRYb6I
	KeoxhdNf2QEsXUXwILnucTjiTP6PSh8C06Db3Y6dWOu8Bg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjr145-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:03:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso637867a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788404633; x=1789009433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQwYwGRSkuZlx9JhvoUV/XoXOWFcMbYe9dIg4BR3CsM=;
        b=D0tEdnLSERjn3mTO7eiV97ryNYeRdIpa2sMfSVU3TW2gELYaGVpsEv896T3yt8Fdbh
         zwACxF3+22ZE4tFcvIwAns/yxCevL1p2uIOPQ4edjZwDPrw1vCY3PKMscVazqWABT1fV
         16Ylu65c1DzF1Ty0FPLls4OttWKQkRfVTdaBevPeyCqPuMHQUMxwtTSFSCTvB04xW3ZP
         fDgmU3ulyjWrgBPlZMZQpKIOIwThHXBjCTc5r4xpPXQfZ3wkfFr44NNZ5/Nu6QiAoFFo
         5qvxQoscE2gZH02+4QsxfAuBA0EN+QI18V/plhQSFW+xNFMoPs5SRmbAVZueN2xXoOmB
         ilKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404633; x=1789009433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQwYwGRSkuZlx9JhvoUV/XoXOWFcMbYe9dIg4BR3CsM=;
        b=mIducv0JKQEq98DNKtsm7UASbfSzZ4RgdplJToDn95B4OPVH3BfvSTAB9AHqyg2Sog
         sjS4X+bKonyIM78hMhYLCCQaE2uD3o67HiZlazZq/dC4zyg/30e4fKEWAmd2CO5SH0yN
         AcgviSSCLyh0dnkNpXAP0mKd8UC/Ycnj2HUFhNHuIm2dB67kYSTTZRuB4rfZpT4qtMa4
         CCmErCcnGciwK8hrLDOzaaAtytJvXRBOui/meruTbCq5A+QaC1dxwfOmKkJGId4YjRfi
         p7Pdf0p06GtICA4HeyIT5mWMceuZa+uY/ARtmD+abNOfe1DXO0BrwDjvq7gEepiAuwLY
         YYfg==
X-Forwarded-Encrypted: i=1; AKwUvBzioaNDXw2jU4ajUT/G/wBf1lV1aJwgRBSFhfWtTQ2TkRP4mT4lRXG8YL4DXrTk8h7V+A99fDedg4c9I+8=@vger.kernel.org
X-Gm-Message-State: AFuF++m9yqMpBKvdWgOuCyTO/n0eQF1y5fVbrYCVOG8T7rg/+aW+uM+5
	1KHSKR507BNNPdp4Gqn3NmH4Q9H0qzNYqpnq2zm0dx3Ey3nD/WhXl53AJikFnBlM5siAMODnZ73
	KZuxjpQGiX0t8PP3uUiwlwaxK/VSiVVrl3W8I49fw4Iwj2dn3c1oqJ8EIjk+D2HnLJN8=
X-Gm-Gg: AYBFou0Af+66GjXyX66HgiAQLv/waXWgpMZ5/yy9w+d1Gk8RPqwnj6xxafqY2A/m3e4
	RiJAF1Bff8dUbulRrpl/Ybgxgicbeo7cs2vlhNEWNC/hNsFfH0+omz3CwadaaQkxhGaBWYTlkqA
	Ko+ogKL1TyHGIy57A/mai470zUKsaCKjzUjYWHTp7xnM+9/acQSlDl8TdgvLkcUdGnASf4gQsZV
	j/u+g0lWgCbKZJG2PJT2tvDTYdm70+daiLT14bfgWeAr7z3DXL+SR5wmGmTciOEvKmPYUnCDi+W
	J2HysuA5ujECbv91OmkhXA1/bXTc3poQgqxp4BjIXnNPCy9kaALZbeOnrfcDNHHMlboqsr4DFn9
	SzYgVcL51RFMrUI0Ekewzkw7qJqxngkwg+g6joZ4Fnew=
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr3748196a91.4.1788404632717;
        Wed, 02 Sep 2026 20:03:52 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr3748141a91.4.1788404632197;
        Wed, 02 Sep 2026 20:03:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592d9c5sm2215705eec.11.2026.09.02.20.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:03:51 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:03:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
Message-ID: <apjjku26X87-IjZU@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
 <9a7cee1d-1058-4184-a915-e7e943b4791c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a7cee1d-1058-4184-a915-e7e943b4791c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX01WbSI6Va/R6
 WiLkumyupQKEtPDGsH4DZuDPTKSE6mJ8Bwu7MpHx5GPVquWL/EOil+Ebi0ly7nYv5RehVxB3H+I
 WtZNvntN0HbQotHirw99nPcjsuunuk8hOJDORT1oyxhmTUZdRR/EobAKMmi2wnT58cHFMh+QHo4
 uxrKZUHTsJp93RjP2N9UADvj8J9PfzMRr6LGekkBu6PBmrjWrmTs8dj0w9RCx3cYZPNtEccZkib
 Qk/Ie8WC3Iz4NeS6cU/TQAxrGVyw6LJ85lW5DbDaMukZeGVywb+iGKoqM5/mAwRCnmCJYyqQv+X
 IcHCXw2daIZMyLIApLow9j/wVKZbO9AvQiL9EfucHexKsczWo4r0k38QAzBb5U8CSZfyAeFRODT
 IV+t2adWl6ya7O8csIg9p7PsPjAmw+0fhGkUOBTloa6tR7PifXKsingbVmOF4+Kox2xO7263FyH
 8Kv3baLG5YbV9TWoZgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX2FYp+gsHUWdV
 Y5U+jZ49M5KaYSU2WorHzIQQc1WnCPatTNWTsCc8NuwXQfEVd7UhhVjzahMKBGDKEGl5z8cJTfi
 5qcgg3BYF/L9sYqV4nbX/r37TBLU55c=
X-Proofpoint-GUID: 5EHa3UvE3hh52tB-tgqkDlPAGJlkP90c
X-Proofpoint-ORIG-GUID: 5EHa3UvE3hh52tB-tgqkDlPAGJlkP90c
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a98e399 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EvG0u3NYunSZrgkL4gYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030024

On Wed, Sep 02, 2026 at 03:52:37PM +0200, Konrad Dybcio wrote:
> On 8/31/26 5:20 AM, Shawn Guo wrote:
> > Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> > on Nord SoC.
> > 
> > This includes:
> > - SMEM memory reservation used by the inter-processor communication
> >   infrastructure
> > - IPCC mailbox controller for inter-processor signalling
> > - AOSS QMP node for load state power management
> > - SMP2P nodes providing stop control and fault/crash interrupt signals
> > - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
> >   userspace offload
> > 
> > The embedded variant specific power domains, XO clock, and interconnect
> > paths are filled in nord-embedded.dtsi.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> With our previous discussion at <ao5Vh_d_dAlJknpl@QCOM-aGQu4IUr3Y>
> in mind, can we reasonably assume the ADSP description is fine as-is?

Yes, ADSP0 can work independently just like the single ADSP on other
SoCs. As audio support depends on ADSP0, we would like to get it land
first and leave the cluster support as an incremental change later.

Shawn
