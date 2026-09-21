Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF8310651
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972236; cv=none; b=LGWRMKdjaUU0Hv40QzJpVvluY25VeHeFWmHbSibtQLW2q9VWZifeLUEOGFnts8IH8ikI+AWYs/pe0KEvpNWArHXG1G0UYTbLQrRNlhjLHM8JCrJqmwvsF3T3fUz8X/GWJxo+WAn1tLP2JaykJSfihKqKsL14ln0qmuy8eD4nxvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972236; c=relaxed/simple;
	bh=ddfn3LbqEOO8JuUkBmmymYxPMCnLmvYpUAoXtX2mPhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nezUNa356oTxCZnc5f+KrSNdIRI6mFKVwy7GlXzaREKvQYUWCViXjD3UPiMFTgExnOgkttyTRroxAaW0rBkH6eHYjJzvOmnWpboPk0q45LScn9+uRM9v2Kmx5/B/hdfsVKcFTcCz2MW9INZXoQxrq2HMfswdZ3G7nBzyeUC0NxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7MeMR0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGQtHowD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7MeMR0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGQtHowD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZVq4007206
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfTLiSXODMZ38Zdtd8E6UO7a
	gf75SjCHxDaJtukqv3Q=; b=o7MeMR0KyxgFqFNtza/daLmBomdhbj4Sn+qtId8R
	K8dt79WyZ06RJi0zGfQyTyL1+Es4Ux/OQyQGbSBEvM2t1uKqPeBjroWkc9c4WggJ
	tUltikZUPcp7i1q5DH99c6fsXh7Mbo561P8CfV/L4qu/T6wYy0hRjVor00550oxM
	LPExgWtFAJYRcwl/dHMpuSMJSoKPV11Dw/mKB2HxFzYhPtUvwXezKV5Mkn+3gd4t
	TVNO3lbswcjMKfibQDBujtr+tnyb/VfPsbLcWQeIsclbKPrkhsX8pYe43+IcN25/
	L4fLmTgsd/zcUCLHpsUDXrsxKCYSKyCyBcJlSqa8awp/Jg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b9717-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:30:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3305441a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789972228; x=1790577028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfTLiSXODMZ38Zdtd8E6UO7agf75SjCHxDaJtukqv3Q=;
        b=CGQtHowDSOi4RAihz7Ll152JgSiatEADLGz67nsL5H2b8Jm2PA72xOf/xJYh/TLwvz
         dJEQCTGFIYsqK5UPNDKz01Imgjv8lN41dCcnDQqyUe6zux3Vbi2KFDyM8a8HhbcdueuA
         Na9Z5f29QHq1StODfOLGgi95vKp0xARP/hEawZns6ovePST6DfmyAd0bNGpvTl3L+4SL
         KXinn8M0yZt1n7LzSz6/9n1vaeUdbFhh9ztksDVR/AH+VqHNnSMKCWfJnSb+xrmdCBuM
         2kekdcn+2MllI4CNzIgXqfGEyy2kGKpG6hDsOIxxNGsT+OcMe7lScvG12SP71UEa3IFc
         oJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972228; x=1790577028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfTLiSXODMZ38Zdtd8E6UO7agf75SjCHxDaJtukqv3Q=;
        b=UuGf8rPgAcA5vhHhlShtYBQp1QTA2tqZ0yDNwSycDgorBTYrKRHy10Y81bR28QwtL2
         BtAEoZBb5ViimJgW48eTKJDTaND6UT0kt/S62RyH6kX9hUlun9qEimZ/TdkGbihUQKfg
         /MSSxUUXRo/USWG4ObagkSLg2IOh0rYLU/+tZw0R38+8Xt5/AoLlN3x2H4v64e65op7J
         7ueqStQ23P4WKkrHll450NmEwv7eNE5/sAFohN3gOPJCwS2uA5g8jKCNVuZg+jxj3oQm
         JCYmqSLThEau1lySXTjV02LH3ikM46YxfktTATcShfpdx/VWRXdxFe1gDkS3J0nUtNpW
         joeQ==
X-Forwarded-Encrypted: i=1; AKwUvByViZCqk+QHSS73qDxAgHBYVBm+sGoi7ghpko6P423uqkqsfdgMSRzCfAMW5rytLROU2uk7C+yhmkZMFkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lljPCr3/CjJHu23A8pHW2BA7Hx8++UTr78IVJOx7xpmmHWcbDU
	DF4ssFBMbSseu+sfCndTziA+StNsLmaYpcf7fSzvaxWvE2PZ8i55MacOIl1jP2zMkrq5eMnfoju
	J/1W9BQeyJ9uPnNqvVhsfc753BjrJ788duDM8jZJHL312sQ7AC+/wHKxAqO/w/fK/zss=
X-Gm-Gg: AYBFou1vd6FmErK+3PgdD4CJectbUiNuN5QyxySHD30byZz2OqOCAkGCJNi6jmRyw9S
	5rHIV1rrp4j2BMo3oS/lTQYXTzmd8Hvoc+b5E7D8Wlk03Aes1841/LpE2lspRSaVHJEzN/rkl+u
	BpdwmV+Ku9eEdwYHzPiYaxyRod9BxsSmVcUguQT0uLuKOhnMcn+yJoSewFAJGlWLRiTqZ6/3v4N
	Fmf9ISFgnftyZ47tF3Bwp6i6tqPbin+Cn5u7PYwRVD0vfgdJV+e/I4QgB3Q/vgGuLObq/Wr4uZf
	lGOzz47yuqUCaiig3QMVIBJ4d75QAEl/MEac7ex43KloNFAcVWU+Th6NXvoLNXjd3Ds27lORWRX
	kMnDM1vX4S5jdxV1OO5cuvoSyBh1Z1qUWQtM0b8Z6loDKfBA=
X-Received: by 2002:a17:90b:384f:b0:39e:455f:36fc with SMTP id 98e67ed59e1d1-39e455f3d97mr14697478a91.28.1789972227600;
        Sun, 20 Sep 2026 23:30:27 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:39e:455f:36fc with SMTP id 98e67ed59e1d1-39e455f3d97mr14697440a91.28.1789972226826;
        Sun, 20 Sep 2026 23:30:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144df9ad683sm8871128c88.6.2026.09.20.23.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:30:26 -0700 (PDT)
Date: Sun, 20 Sep 2026 23:30:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
Message-ID: <arDPABIQl9wKYVKa@hu-qianyu-lv.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5MiBTYWx0ZWRfXwCxa2XjdM2QS
 SSZhGUenQjFKsXVyNZLYIV9ZWWmtEyjoZaHLj3jt2zyOrk9Vbgls0h09MgHzGW8N2HxZJlbtIZR
 Ks+eva6POL74xcieS2i4+d8rkypCWKei13Jy9RBiPrIOJNGjnm8l61lHRJIHLK78kNykJFw/JD8
 h6BRVjFFlJVcaWOPacZVkPut+w3shXQtU327kQDHuuTbE3rqHgwEbLcRCb8lWPVOZ+UgGymQ0E2
 qdgYJ16jla7y+RhzO41wqwZjTs4doJ2j8bcQd4bXNJqHV5eYAMcxTIv6OQupcPaD1DP8t7lVtNr
 nZa2LBSyJR0unEo1naTL6XSgvqCucReUA8GuKZHb/2+s1GjATHpjinZQ1XfvSKzBj7GJubzTNWI
 +5Cx90CTUJvqCDanLKv8s5RrBpObcJxeKVbIaMaLIx0WopRTOS3uB2P78QLsJRVYMAXKrqYR568
 qg8Pqu1MA21g8Hcy2yw==
X-Proofpoint-GUID: uFZxAtRH5esIWAysm7BUUMkIkjBK9l25
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0cf09 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Tp8Q_eIeZBUexgL1P5QA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: uFZxAtRH5esIWAysm7BUUMkIkjBK9l25
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5MiBTYWx0ZWRfXzmjYUCpfyFRo
 p8Jn8kKGVqCkPzVC5/nwzsCkLyIhqT6yuEtKGYWP0Acn1CSJJw+8z2O5hC/7f4Jgck07l0vkFDx
 D7lRFV5cwedrfLP/Ds6ismocM4qkrzk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210092

On Mon, Sep 21, 2026 at 11:07:08AM +0530, Krishna Chaitanya Chundru wrote:
> This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.
> 
> Nord has a single Gen5-capable QMP PCIe PHY block split into four
> independently-clocked and independently-resettable ports (A/B/C/D).
> Firmware selects the active lane topology at boot via a TCSR
> configuration register, and the same PHY block can appear as a single
> x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
> is similar in spirit to the Glymur multi-PHY support already posted,
> except Nord's PHY registers are programmed by Linux rather than by
> firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
> tables along with the power-up/power-down/soft-reset sequencing needed
> to bring each port up.
> 
> The series also documents and wires up the qcom,nord-pcie compatible
> (reusing the existing SA8775P PCIe controller binding), and adds a
> CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
> convergence issue in the PCIe power domain.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Tested on Glymur CRD and Glymur QCB, devices can be enumerated.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

- Qiang Yu
