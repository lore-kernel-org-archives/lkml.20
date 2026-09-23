Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EAE49DB85
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160252; cv=none; b=nFi519d/2C7fmRJRnzrOO0hkVUtQvTgeYp+83IAguKSYpEYcrY+LD5ub2Ro9UHFmcVLFRjmrmeINNuIfEl1blazO4uLoxyKg7Lzs96edaXKyD55F+Srv5LtfpGfLOEDphuRqyssDf2oUMDcHt9QJ88qZ45ghAEQqn8dcoANOJUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160252; c=relaxed/simple;
	bh=DKCb5PEyfBRYfAj3Eb9S7AuesiwcU9yyCp10TEUzwkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUBRRDG3K8b0yDH3c383rRbqFM2rItIY5q29BOMa98IbgERuAOHN9l+uOilQWCWGIdx3OefxRZlCazds06nIPqk5v9LeO3l2rykKKzZ8K3HowjcoIpXE5OOiResfkX6j0E/yPkTfSq7ZoZ55mh6NXT8guhnWKES1HR8dkmvJCoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djR04gIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTqg/Tar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djR04gIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTqg/Tar"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2e8g2429394
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tdm538hJDBEeOtB+OYg40rCG
	/usyp2101S2xsTzwFKE=; b=djR04gIia4FrVZw0QUhpS9gvO12DqiZtxfId+T5a
	GRD/kg2tk3szeGR8uzBHmfUwE9Dt3Otaso7Lp7DEpIHMaP9RP/yKw86cgf2v4PS6
	+I3TTC31C9CUk0284C5NpVdyM9vDLwR+A8K6zh72VrzWXtOK4Ai0bhftcrlQyV8n
	PaR4QugbjTTwIv6c1gneLUS+/NmwXfc9/CNnf9xflXh7hs1kyPzKJklcrZPi8TKH
	2SQ4zY/cwvwlgsUU0FMPh0wN5UOJ7pMsXq7DHYqgb3+G1ciwAyt/Z49M2krIgGHL
	JUIMW/VhPX3XVlIpVO5CdBN/BZKD3uxOuyZgG5G+nz1J+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh453-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:43:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1124631eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790160224; x=1790765024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tdm538hJDBEeOtB+OYg40rCG/usyp2101S2xsTzwFKE=;
        b=PTqg/TaraM2+2izq2daoZavo2fFnNChOdRF4oX4uTthw2pLyeXbKy+XK9rJgZtii2r
         V5F+zzH7u2lGu6bSGUdklb6xJuID1JlSRMPqZVOW+VZicDAwh6blJYIarkoW2H4PXOmJ
         kSJMkG3Aa0lpN10wdaDhvKAHT81WlywJP6LM8VM1hw+0PKerk7pCt7Tc6W1ijGbgBdAQ
         4oEeSy3hM/2PjYTDAz01dH7GVTrXolUOdw2LE0udZgBjdHrn6I8+fPzJDhCF/+gHWzXw
         OXxSx4JtYR0o5Y7YDc9JpWtjAKtmF1gHR0fLYcDvLdDXC/Sj6s6Ms9osUDsvRRvUlwl7
         Z6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160224; x=1790765024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdm538hJDBEeOtB+OYg40rCG/usyp2101S2xsTzwFKE=;
        b=hex6hHDtWThU7KIMfwLK7pdIpQCnDxa0mzCNpJaTa+TEypkfDtX0NoW71uUhdjvE2a
         ecsr+gf/R6lAU2PhqTbOBKeetqMZh/eUOdHORfJsxmTfJ7ifHhZOGy4j5BGmfLGSCNAF
         rIWY25EAb9W15wjkbQSrOdan8NgPG4OLwk9kyfFkYMTNJREK2c0l44bPu22+xi+L87u7
         I6JIqDNbJVT26cO4pDNq9iP+7Cc9fFqHIqB0OkR4iTxz8Su6IYTGf/LsBdKgeBH4qc0W
         xDGZIVerHkCVFhsdTZXjhq/yKcJOBSz8vN0K9tlD6aHM+1UdKYT2uPo55UBRST/YO/ig
         TXAg==
X-Forwarded-Encrypted: i=1; AKwUvBw1LYXuL3yOvOLmOcqBZ1/hg9hIAJoMbM/uBbV6Ijjxa9Cdz+JiYZiz/qbOFZ9thyO2ZRbkn2SWfrXAPic=@vger.kernel.org
X-Gm-Message-State: AFuF++kKwRwjL8fqvjDZxjAf+ZJsuNXBvhHkzKyghWEnxdnVl733qk3j
	mswynigD5v8Wbsm39Mz0d/qMoN971WfMqSzvBX2mBrcnz1I+p/upcpCdelj5d3AJ0FoOlkHvtHa
	z6f9zKI2g9u6xsWq1wfcjKXVaaQzR2LK5MX9nBvk23U8gN/DdnKEG3DP/S98eph2i2Sw=
X-Gm-Gg: AYBFou2jKdRmDhtpVu2bd20eoAteeRa3Cu3Omkss3b5xktfqghaG0lztIlteJZw9Aqa
	b98+ild0/lJF09tjZeeYFO+4bas0hT0aWpTqOyTbztnGqP+hAdqx6xHl+fMd4p0/SLFJpsCzXO6
	Wl6LDNPvpXzvVC66whc5s3oLRkcnR+CJpq8GdWcvNdnJxfch4eMptpkw4PkHf/q5aLwygvwSW3s
	5uDKW6s+A34+kNzwCSyGMkmtoZd3MhJfiApZkDxSnsYObOmpxKfJ7JMS4R/3zNxPtzZxTBWZbcW
	Qru390cwd5iPWSWaDfVS7a5jDq2Ddp4D/dnrVzS6QNqGxlgisy5pABd6W0c3bmi2kR0ZxxVLcaR
	nZEKqoIYdpZYl
X-Received: by 2002:a05:701b:465c:b0:144:eab0:8373 with SMTP id a92af1059eb24-144f91598eamr2150616c88.13.1790160224228;
        Wed, 23 Sep 2026 03:43:44 -0700 (PDT)
X-Received: by 2002:a05:701b:465c:b0:144:eab0:8373 with SMTP id a92af1059eb24-144f91598eamr2150572c88.13.1790160223468;
        Wed, 23 Sep 2026 03:43:43 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9820ca5sm6285226c88.3.2026.09.23.03.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:43:43 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:13:31 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Coia Prant <coiaprant@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <arOtU15iv5CWPUEu@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
X-Proofpoint-GUID: ReahK6otEfYHUm7tNbc-NjrUsDgJjnVj
X-Proofpoint-ORIG-GUID: ReahK6otEfYHUm7tNbc-NjrUsDgJjnVj
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3ad61 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=keUjBhY1HaWyqSYI5lAA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX5g0grpcMy39y
 5BI5wLdVibJyl/RMvrxTQJgTFuY7JuC80ILPr/SkEWKh9KemTm02dQnYK/hzz37Q2bLje0sINFK
 Sy7IjzM+j9zJ5K0+i/CNX4KnpIff3KI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX/I/jZQBl/wFR
 GFgHdWuVtNKzsIybD3X7Fhxw2rEChXJDkSoc8vnsIQcJLRQfVWzoj6iUR/RD1iOkcq/uNt/sccd
 X84ctSxmhzhb5hFo9v4igAj48kToksEbunH1tL4t1E6G+7xt4FojDgLbHQudujMRtfoHYL4qp+d
 8KG9fUCDT2HeQpw7Ade2PsXnfEClst8yKnstOz1xiUMR5LO3D+Na3QGRw+pOOvYjG5ZJf+W3bAQ
 vVG+oH++yiGFzILYjsFIcNvn1XD6S1SXugCEAnyJ4yywM7TU7Kom82xza06+cfPD3l30ZVQtg04
 kxAGfImk9F6syHNB2sDxkCz5RixzWwTSR1jv+m096AiEtHViLw6maG4BxQrJkPKsSqoa9IZlycA
 ZKu1KmDincn4gyBBnuNTqhRkKqWstHwNB6MbBuLI7VBLR5KEYrL/rAZCmUp+/45LqOZ4JQxTJ3y
 SOecQLG3a8laOOoO+Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230042

Hi Maxime,

On Wed, Sep 23, 2026 at 11:41:14AM +0200, Maxime Chevallier wrote:
> Hi,
> 
> On 9/23/26 03:07, Mohd Ayaan Anwar wrote:
> > Hi,
> > 
> > This is an early RFC which adds the XPCS and ETHQOS plumbing required
> > to enable 10 Gigabit Ethernet on the Qualcomm Nord SoC. This is the
> > first time USXGMII together with an external PCS is being supported by
> > the dwmac-qcom-ethqos driver.
> 
> There are currently 3 in-flight series that adds glues to DW XPCS and stmmac: 
> 
> This one,
> The Rockchip one from Coia [1]
> The S32 one from Jan [2]
> 
> 
> [1] : https://lore.kernel.org/netdev/20260922200336.2201212-1-coiaprant@gmail.com/
> [2] : https://lore.kernel.org/netdev/20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com/
> 
> MAINTAINERS entry for XPCS says :
> 
> SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
> L:      netdev@vger.kernel.org          
> S:      Orphan                          
> F:      drivers/net/pcs/pcs-xpcs.c      
> F:      drivers/net/pcs/pcs-xpcs.h      
> F:      include/linux/pcs/pcs-xpcs.h    
> 
> It would nice if some of you could help maintain the core XPCS driver, and make sure
> these series aren't stepping on one another :( I personnaly don't have any XPCS HW
> for tests.
> 
> You don't have to do it alone, multiple people can co-maintain that :) Maybe
> Synopsys folks can also chime in ?
> 

Thank you for sharing these series, I can help review them based on my
understanding of this IP. Hope that helps.

	Ayaan
