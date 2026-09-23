Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25BE5383C8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172205; cv=none; b=rmo33Of50OLqGKS+ngqrr6/zG0y/IDuQuDCumGjMd1roiDrpkiXuh0QjRy5JZYZ8Sz+HScsWc7mPda3cuCEShl2dmA6IAM3H+6yEnxXr+gg6jLrPQ9uZo4pBVtzebMOVkr1ymrVEtqlcoimqOH+0bLKTX/4+CZeEPpWfLEAubDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172205; c=relaxed/simple;
	bh=GSQllyyTxbdIQGfOjUU0cPCdBxDt67B5m+P3z57pWoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3t2XK49Jerg7a6UPOWD7+OvcUdg8O9oQRCx04hkWu75N3K17Xha7/+rU+QMkDrXa0o/eTpS1NP3701CeqvshtjPV2QjfOs4E9BVKcRGW07/Zo2PJJ68TfwROauLZ1fkWIU0lUtkgFFJYpjOK9KFr3tVudJLv6ECWVlOKE0cfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1YyJPzH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSTaZ701; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1YyJPzH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSTaZ701"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbWHG3027997
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zLOh9Kb/p8pBZNay6kbh5A1C
	JFhDDZYL59AUqu/b/gA=; b=O1YyJPzH+HP6pm6E8uwn/gVhKqzy4B81mCuRhqh5
	braQwxSA4e5IDI8LmTnnWPCPAgaZ3nT/khK5bIezROpCUttIkxkpfQxWe2OC7cUB
	857enoXG8KAe9nStaZdZhtAsXAnQjItJRac79cfVh16Ws2OHRIAbHQnd4yLuVpPi
	IEpiGX7fxA505iwdpi4FCuq4VBxePNn2uX1N87b772VCVtZUCzkzeRu3eSO4QFkU
	rzPGEwNtmWQqjnT/HkxI8tbKg/xOfIb6bW7VXePlslG9EwwLqYcuMYeRxR7qMVSe
	Puxyne0tqSKUI4J/0PED4k1WRvtKAF8J+va8dwEw2G+D6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwas672-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:03:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-868db1b2c64so806986b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172201; x=1790777001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLOh9Kb/p8pBZNay6kbh5A1CJFhDDZYL59AUqu/b/gA=;
        b=dSTaZ701kIQl/gJ/oMC33lxJBvx8DIvf2tdfbJa7mHA/c8rDIzZ5BVn1/IndjvvCnK
         +R+qTsO0jrw+coo7FdrSK5duZwng2HPwW9B71adugPYZRlzjUqD4cZ6tvK3sOUnaOovM
         duFv0UlRQMZOVaxytpE7VwD0HlTSV084g/tMINxOSJi7dES/dtQShsiZ/qzMHZatGzTc
         D7l5Kz5Y5bMjBHFcap8zvtbYsMV3YULeme2Crwmzyi/h2MXd24/kbtRe5FGraHa1WQof
         zJaOXowNY1hQF+ia9T1e/+eFEt2qySg3SFZfBq2LH90pYt9QR+LkrAu0fo00rTXQZu56
         Ib2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172201; x=1790777001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLOh9Kb/p8pBZNay6kbh5A1CJFhDDZYL59AUqu/b/gA=;
        b=nt1YMJ1GXPKF2K85ttMUlusUBy87N9mqbVSqmiLzI9UZIivvM8G1NXsiULT5dMkrDI
         JX+6Q1AldYhv38hw1i3o9DLO76sScguK/55J5qGQC0LTkmIPB2ZuO/3uTnW2HPyjF9F1
         w9hagIdqTsR3OlG9K5elmHvG1QS4DYlKJucOb+Y7p0s9cI77dVk1am7YbZ1TZPCDRhEG
         7uLzY8J5POmDn13qZ82Ika+NR0800MndQGyWjE7TrdIjeUcgEYdnl71wVrEV7nSD3CMl
         YVG1FfikU4nVj7tHI5QFYEO6FPeuv2WLHAuVq8mlySyXkUwlzjCouRusGq37f4RWy6Q5
         aQBg==
X-Forwarded-Encrypted: i=1; AKwUvBy8qd/FDfGa9V8ILK7JI0bnUkJs89teZG/q2kh8nc2AFUi4cpobzV18jBesVhKNlOnEZMeWDkt/W3BeYYI=@vger.kernel.org
X-Gm-Message-State: AFuF++lHiBcrVtRHycyzxYZ4zEIeS6C9K7+oNDDJ6HqXCkm3yTExNSZ9
	AZsfREkdSKrkCCCzCJAdxHxWGxs5cgg+oHDO35QGfLRx6qUwv67gJRdBTeXK5Phz406/pkbtL/W
	VdWDhxuhWRsILoWhLHJkeXm+hqLUY0dpJsIaOSu2iWmVF0FKxsfwwt22GZlbPF4DQqOk=
X-Gm-Gg: AYBFou11/FMYjlLAXvLY8Ie9OfZ4UJw5tosaGizVL9kdZ7CRvUzepzjgc4Om8wA8yBv
	KmuHzSsYJ2SXMbIFhBwsUYbjeiJD0JAO4TmkGtoPk2YWDZaKkDLvrE40sY50rph1g98FTHVPoVN
	J3jT4g8ya5SuhQme8PAsy7HExRlq2j/jfE0DmH8nczWsUNwANUGzdXlZoFUUwVoGebNKDKJ/+9i
	3bXmYN8iC6eYZv0BKxli4jfOkv3fwqYUCTyc4WRe5UaArIPH0LClJm5Q2Pl1Jy5Aa19j3NqLxMi
	rp1sDo60CL3FN6h3hlOTA/yytif2/m5ujEwFLbxSPnX/FWO+KWBywmeuNez/ow08PncHJPuCSyv
	EFkbVv3bf6gk8
X-Received: by 2002:a05:6a00:4c1a:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-87d18d6d036mr2571677b3a.2.1790172201286;
        Wed, 23 Sep 2026 07:03:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-87d18d6d036mr2571644b3a.2.1790172200645;
        Wed, 23 Sep 2026 07:03:20 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm1366950b3a.6.2026.09.23.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:03:20 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:33:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
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
        Jan Petrous <jan.petrous@oss.nxp.com>,
        "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <arPcHSGFLrxXFEyC@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
 <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX6DB/NIy34xja
 Nytb9y1KYl4U1fPRKx4bcH2YOd5LciW6d+RLJ/PXvX3CrAEW8XBeD9dqc+2ThxrkBsGOmsEbLxS
 3LO0z6EYQGwsN6rRLEaTsqRYIlkGEP5AgQ8EmFqyz5g8+qdmlgI+8aJPKRAkC3g2Y43Qs+G522k
 yEaykLej9HIVqMbSRnDOlKUIG2nENtqFt8nMY4I19rlPHSwRLBCzvm97NaSi8F4NVO3A33YAu5R
 HN+InBZ3saSb0Z11EnWUn1hLnrmW0JmlDOYxgn54Q5a8ZOEBnIRdbTXUlVvCqHk2gIbUeHA7Upw
 /ZndSUOUjtNn3lAooE292v+wbHZSYWSJpVJsSrMDb1C9X0JhhsypZTmNiDyr1uarkSlZGJd+r+X
 fAPibRYriDHFv23d7T/6UCfTuO629bSeYLY7Poa6USJJjT2aRVjfoBrgmRC1ZYZWbfgKzRJAHvr
 +D18SLZNfJddBK6aK9Q==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3dc2a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=dR3U5T3Y49Kxp-nVN2AA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: oEamr5hDxhvmg5d6KR2NeCrUYRInZn15
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX7HLrt8YbV+uG
 RMZvkOxLtidtbAiT351jNNHt9rXzreNQKCvSXjFhYbFV+nEQzksWB/7ZdizV5rkjJunjVhNs6N/
 K5RiL44H+HRoH3VcLEJJmA1K04iU1BI=
X-Proofpoint-ORIG-GUID: oEamr5hDxhvmg5d6KR2NeCrUYRInZn15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230055

On Wed, Sep 23, 2026 at 09:17:44PM +0800, Coia Prant wrote:
> Hello,
> 
> Thanks for the RFC. A few comments.
> 
> XPCS_ID
> -------
> Is 0x00000030 documented for Qualcomm, or is it derived from
> NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
> I'd rather see it confirmed against the Qualcomm documentation or a
> register dump from real hardware before it's used for platform
> identification.
> 

It's the latter (NXP XPCS ID + 0x10). The Qualcomm hardware returns the
standard XPCS identifier (0x7996ced0) upon reading the 3.2, 3.3
PCS_DEV_ID registers. I tried following a similar approach to the NXP
DSA driver of reporting a synthetic value to bind to the Qualcomm part. 

All this was just to make it work with pcs-xpcs-plat without introducing
a ton of code.

> Structure
> ---------
> pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
> need any platform-specific handling. Adding another abstraction layer
> on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
> and Rockchip differ in power management, address window size (2M vs 8M,
> ...) and MMD redirection, so they don't share a probe path.
> 
> Pushing that into pcs-xpcs-plat would also drag every existing user of
> the generic glue along: they would suddenly depend on GENERIC_PHY,
> PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
> would have to carry per-platform branches in a driver that is supposed
> to be platform-agnostic. A per-SoC-family glue driver, the same way
> dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
> separate, keeps each integration self-contained and leaves the generic
> glue alone.
> 
> Would it make sense to take that route here? My pcs-xpcs-rk does the
> MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
> reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
> help with the generic parts if that's useful.
> 

I agree with your concerns regarding the glue on glue architecture. I
also don't know if each platform glue should define a custom MDIO bus
with similar logic. Maybe we can have a generic abstraction for it?

I know that Alex had a patch introducing pcs-xpcs-regmap.c [1]. My
original code for this platform actually built on top of it before I
moved to the current implementation.

At least I now know that multiple vendors have an MMIO based XPCS,
albeit with differing MMD redirection mechanisms.

I am going through the pcs-xpcs-rk patch and the eee_clk already stood
out to me. On my board, the PCS link does not come up if the EEE clock
is stopped. Going through the databook, I did find a barebones
explanation of why that might be happening for USXGMII, but I need to
dig more into it.

Thank you for the review.

	Ayaan

[1] https://lore.kernel.org/netdev/20260501155421.3329862-2-elder@riscstar.com/
