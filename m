Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9573AEF55
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888681; cv=none; b=J+AmVFHlNvWjSUQ7Qvr/FW/C9f6MKa7hQwwSBOzIlrxF6wrMu1Szv1pkX2mVivOcwxq3dEAIHOeKmEWb8eEkCaUxiBHZZ3rcmmO4t9qDTZ5ZebEQjzKoYRFCz5gGfI4nkctdXH9FO5Z5mhPvID0u6TrM9zH6/3unZi04AOPcafg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888681; c=relaxed/simple;
	bh=s7eAoytgHL78rL5A8ihXjUoEHb//2G369+9k9wxCR7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpwU6IrSi3L1sRFhly3klpGvymsWqqD6RA0ujkqksWdEtP974Dv+0aJEckJlDrj4OrML5Vm/6qAErUpKRTz+Q3YJDK0mDeRkUMTtDuey4EVLXyTQcCxAmcuCyRTtydBKA4KcD1CfHP4I7BPHvdl1y9EwXjSCPY/rw8KeItkkFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WU9P4tMb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGixPr78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU9P4tMb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGixPr78"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K5517F826150
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tE12glMtnWbg3wZF5tpLsoGg
	lLX7WuJZscPmbfDKmso=; b=WU9P4tMbZtsjPwBqnTtYg/gEyRwOWM4ovuhTKM5C
	hYE7nPTDT2YSc3TN24gfOoP/6fPhHOIQwcnLIPelMRtW33CBpatctqVBLgdNnSEG
	1p2kS9QDBB6ZvGdD4ihmPr2KUhBeoeHW+rYMo+cV6miUH9E1REKMtKQyTzkKz37q
	7wXJWsnyzcBRDxE9OirUVfnnLYZ6GF7i0P0g2QqRnv4VCVMFwtOgPwRnEVETBe07
	lbdsYFQqLv1IXnLJYEw2DZ6HRt4YtsdtI9d1mjy86oX07aXVjSExegWjVi7oQdH5
	dAfaf4qFGre8SiLceL2B1lq490cxARolFO7w+2mpHYuSqg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82dpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:17:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so1656167a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888676; x=1790493476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=SGixPr78MHpV4Sc6KmGS4eQNicvRumiO+rVPY21dFPHQYvlOyse934KZI7kCdDtGrq
         tpR57IIUUr7/Dyw+dHtU0tva71fEmx1QdCjNCbdHotawwIbvglea+X0qqK9AbOr+yf7B
         tmpX1JMhTyLltiZG6Wl9TjJ5nXeTOdeG5YqqAWZMTDT5xDTevb3KeQ/2sCiu49LfSdZ5
         WVDrOl1Loqp3rC7b1vEN/XC6DiMoQ7Ec1M+OmjrzCzdPx1D5YbGBoVXG9mn+Pf+rafjQ
         cn+KKSeCxCMz9JKtv0L974tsTMpCFnuW3WEDDP/eM2nfvbqcyLOdRFx0Ua5DHrZJ9jub
         FDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888676; x=1790493476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=zyXORX6xHV5U0s595hgecZxckUnZphAmc7FYvM/4uFXdbyJ+ZAfeRpgALcvWlrv8QV
         70RkN5Kb8Fh5cvNTu11BwrkKewP7cAQ63XVdcz8d8FmrokBlelLoRG5bBLS9c4F/jLmV
         gI1OO3HYl7IzdX29Cn7ysXtBLS2EkxU5WhcYVrdSDtyC1yE04Xv4enz2vVm4rdPA9AVp
         JtU4cUVdkueOMSvkLW5QHUUf74XEbXeTUNr15qjboHXmarYwCXZFYYy96h+dOtLYoLaC
         TThrqwMxXhop+gkhptc6mSga4aqm4mbrLCe4ZubHFsP3qc/6RnLNDrGhpWMwdB/LXhY2
         nmLw==
X-Forwarded-Encrypted: i=1; AKwUvBySPZSdI+tBbLxpnW2T3xY4sAvRWkuA4jUk0572h0ovZiC0xHZEm0dTaI5n3pYdDqhvo438lwEmObHqptg=@vger.kernel.org
X-Gm-Message-State: AFuF++mbc+BV6udoBdEi3IDVw/I3Eh7ax5GSm3nBa0S2+HzzBwzzAmo6
	JRq0RyJ1UT6p6UhSHkmVzk3NortTq4JFdbzm36oKfreus6o29IE4QFShriXG2ejDxUJwoLRIMUq
	2Sjm0LRRwSO3dsZzBMiwoJc4La+RuTHMPU+pIODbkaufbn5RsQHn1OEZMyQG9mkjZms0=
X-Gm-Gg: AYBFou1t0zwHC5XP/wQEZmfTffOwUFO0NIoVOq8jhYbPJIUcuFc3nAK+rlgCIUaDj1F
	PZDeljoVGq4bSSBuwqKxsKw5mPKT5d+5rBGtFPG60J2muBDzswe/22hTdr3zuncUZcd18/yVPI6
	2XgH7eEWStyMO3exPHcLn0sFRxl81BNh5n6xCEbkn1cUQb9QXs1dZMpcCLktZfQGCMft/075Baj
	7RDgssRW4WMSFX7XIaLDDamG7Hssg8diZ9VgOJW3/Nh6GXhCQ5S2iDFRdtm/c7r+tAH5h8nZkiN
	tYA5uSupLXgapeZGyeZtxDxmpTySOBZP7o4V+TwhnNH4fx08gLIsQC+a+Ufkf+Da7Xvw+GtxXOh
	TL4H0zB07NCUVLZGWGhDZ5XenbzTsPYCJ07lZ5dvaPw==
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928727a91.14.1789888675763;
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928706a91.14.1789888675373;
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm14226451c88.5.2026.09.20.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:17:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] media: qcom: camss: vfe: Add support for VFE 900
Message-ID: <aq-Ina0nVQTBTL0-@QCOM-aGQu4IUr3Y>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Rg6o9mQlAwg8ioyFQXWVdVOOF_qtlnCg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX/sxCH320jBVP
 ly8ELKsRG4VSEdK9jET4x/MB0ToJ/RINM8vdxh5ItKYdun+eKt2Oi3/GETuPQK7lNfRD6Ye0aKE
 lsI12gfa81aA46xmhLGRSvXYHEq9QxI=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf88a4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Uj4jyQ9UG6jGA3GiD8kA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX+ptl4uFsHVzY
 7sPywP9cXSH/3QkuMSQVVax3gzCIndJBDlernJMX/cbM2Hci2MxqsheDbYzWw4Ksk883sKsvSh2
 FNZ91c7LrgKyX0UocE/45atqQ/fMrKABuArDbf8AADdRHXHKOQ7zYPJex7iRvJYiH128PaKQixE
 ffpvw9iaY87lm/LXQJPBZ1tHZf5xdwxK4iVMYsa1ykkO0v+gmoq+Xv4L1OjMqWGWPcWyTtT3MMt
 D8maFPF/q1wdEn3LlAZFMWMIMmGsFOi/vSMl93hRDvrQbBzbohU9gwaFH46agwIIPFVDt59XepT
 wWx7AU9Of6T0DXvsIHAhVWJjkqGbkzb/380Mrefs2j1I6J3H+pa8UU5UU3YMtXUmMQrNz0EN5DZ
 vyBNRWebcxMHxrmhjQLG+NNtO0B7FlWTw5TGuWE043jyaz4V5Wj0ZsAK2hydnucFNkpaVKaMri3
 p+nOYLwP7vAmGrnlupw==
X-Proofpoint-GUID: Rg6o9mQlAwg8ioyFQXWVdVOOF_qtlnCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103

On Tue, Sep 15, 2026 at 05:34:14PM +0800, Wenmeng Liu wrote:
> The VFE on the Nord platform reuses the gen4 VFE driver but places its
> bus registers at a different base and does not implement the write
> master CGC override register. Add a VFE 900 variant to the gen4 driver
> to handle the different bus register base, the separate location of the
> test bus control register, and to skip the missing CGC override
> register.

Are you saying VFE 900 has no CGC override register? Hardware document
seems suggest there is TITAN_A_RT_0_IFE_0_CLC_BUS_WR_INPUT_IF_CGC_OVERRIDE
at bus-module + 0x08.

Shawn

> 
> In addition, the v900 ADDR_IMAGE register takes a full byte address
> rather than the 256-byte-unit encoding used by the gen4 baseline, and
> the full IFE write master client map places the RDI clients at index 28
> (the lite instances keep RDI0 at client 0).
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

