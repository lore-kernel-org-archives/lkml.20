Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B751137F011
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572831; cv=none; b=VtqP4DQ9EZFvBB+NZDYoLSAO4xZw23LhrF31y4NPMPWGhow5NzQFIDDwtY2eGAjUULKErJW4fskExZjVfH9/P/cADi56SlYSuMUmsZpw+fSzTy1H9fPwQEoaVs9kDeZmWqovoO0NDMyn2elhpPCghgiC4qQBov5B33wmPQDDtKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572831; c=relaxed/simple;
	bh=4DYl81kZlsuBgH9Cq6P3j2EEwAY76sVSxzqBLH4OTgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THzdofdUi9qZtWAmaZzeyqen86NZ7wf9Xn1IA37bn9j3BXD0Xndg3Zr57CDmU2G8a4QQ45fy2hfseXpr8vz4YdDyTWbzmPvcMc0K+2EE1t/QTOhU8gBZ9qaaYbbZDEZGaQtNpKuwoksDc3GfXh89TFqR4XDDHXj35COSagASKNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrLeFETa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6xc6MHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrLeFETa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6xc6MHd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZpVt2471011
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 19:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rAx7zopvulLjm7Hc/dyluOi0
	kS3PVntTNHMshaG6O6s=; b=WrLeFETag5DPDLFdA6mGDsVLV0bkODfX9ZjQHCV7
	i5pQG2LdKOpRNtDIPKZw2YhA7jf6MA7vNU+R1zR6RRxa9QB63UfjEc46bevULuZ0
	wZdyg4FIigoEe49OqM1PvmQhBM+5MhgaQf0FldvscMNF7GWHLSKEsqmfbGNm7BhI
	l2I2gqVa3DpwuR0OrId4kBE6oZJ641x6L/lPm7ZmHTBYeSScZ7MFUv091w6f4K2J
	wXLO58J0kcPUxpvzmRM++Bdr10Uj1Xl2zPGJc/8NdeRk4DI8+HdK3lcrhHNEHGjt
	O6lKO5B/0rzZFjGlW1GV1RNNIz4gdnA1LEimt/KICpRUQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8gbmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:07:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917870a9be3so45353136d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572827; x=1792177627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=P6xc6MHd203qinrFvLBW4VO9qNbH9qGjRhUHNTnVo/XNgJGPY1x8ZD4PhJtpY9cFLJ
         BtxIYJcPArJLrYTE4ZvYO7lKfMLzoGt8BdGpt3vuqfv4dO4diWaMDwKejmuPkcnGl6zJ
         MEDc3tcRH/iJPrl5lBBbqGBzbsPTnqdawr0cjUG0ZENf2VkJ7S+VK8K2DqI+LaJwNUKj
         6ouT7nsrl2zAcG/zGK665v+gD85udWz7l7Zx0+Jc4TsvZuHoR+frSRkctQ3XHn4nHv7h
         eRofR9ANleE5yez46w+eOxDqwngIthKb0Br1w9nLTALdTrNsU/WHLvayVtLf5LzQlkB3
         ZXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572827; x=1792177627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=C9/1TCW1OiL0CWkT+z45CiNPjhCknBYXob+lPkccyWTGGpgSQFJfXjfwQLxiSpiSoQ
         6wfpXTwzwqQg/9WV2fwk0AbCiZ9FBKKpcGfy+fZl1uEdbjyfUV8LQ3dCxd/uIRGHqPJa
         Ecx4HnhzJg6Ids80E/fWG9I/kscyNLz6nIf1FawSR3MOjvoB2TV9x6YmA4JC8npbSLaj
         EsArw5WVmLPfpJgZtABCFTijNDCDMbmEg1bmWqvg+xPiOj9LQiMRmnArxaPMdVKetwuQ
         yIgVqugVeBjWf6v4U+qHQKdoJn4eJoyo56JKqolFEwiQmi20Z2mEy0PxitrKMV6yz97h
         SzSw==
X-Forwarded-Encrypted: i=1; AKwUvBw8PgtyFP0xmsS+hY3g9o7zmPIcVLIN1X3Mqw4zNcfX3Jb3bn8H6tuQRRGFpHALNLYSGOPS1lZjAmsD0MQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lL0JrCZ/fLBckwYzFU1HLL+Hpw7zU0KQNtY1fuznPOBQ5ANhbf
	x1fnrmLCj12jdscNMmYnpz+nUtCGF1/yj01LystcIKxxOqRI2xK8DMcrgVpVmoBI34djKOZ/lIP
	VdcEE2cxLEVe/zPkmTHZ25/k4rando8s+RGqH8ODSn1aq8eUKchzWYidHq9ly8GLmJq7AltH0/V
	PCPw==
X-Gm-Gg: AYBFou18el/zxfCBAkA4nwDYooE74fM634dyHqf1Zz4cepz8ReJoQ6U1UZy1a8wwwVp
	fMqsLAp8fMl+nuW+Icrwwy1eQzMQY2PNe/JSO3HsfQIEj5rn2aUjkZETQIQIlGfcdnjXzE9FAgA
	oYOPrxzxhmTINjTaeFr69ZFsknSoLJ7wnEGzKwRNR6yfmheAQotiqnHOmm/d1lBN7kncjzCnMHG
	+eD3pNML3fVjigIA/W18+tsPACKXoBOF0EO4Skk0LEBGHsJ9tk2DByg1GqFVmmfG8lK7MNAJCcf
	BcuiTXWVx7lJ7Tawzu23sVnMmXy3zv0icRK+SGeAoVd1CIcdxhGQeCq6iP1t8fbZlNc1OkxxW94
	OHN6ub2vEFCE++Q4=
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523226185a.13.1791572826683;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523220585a.13.1791572826018;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac94c6sm5327825f8f.42.2026.10.09.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:07:05 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:07:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Message-ID: <vorbu5wtvnwxxd77lde7i53r72wu6wlta457ovvzso44rlgnnk@qa7egbe7mli3>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ONOyTiaB c=1 sm=1 tr=0 ts=6ac93b5b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: l0vmMoBSdzEnu36v_MED1CxDK85IFTt3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX3EIEmrIYOSKw
 NE63nNiwv47Xl7l078FuI6DWiJSfHwfvBHlNoFnzioQrw2Ni+gxwlgwwIzeT4CRNoetki4wZeLY
 QKrSmyqIHnWZOiX0q84DWIE8N6+FJp8=
X-Proofpoint-ORIG-GUID: l0vmMoBSdzEnu36v_MED1CxDK85IFTt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX8x3PydoORYG7
 JIg3FwaZRDOI2jwFxp+cfVIdTxjhwZjEGf4rC6dRb4slBnGqge/thMEEh4vipRA/IEgrblA/Nq6
 5PZoB/KsxYRvq3lE0yruLxIUAEpZhTo9Cr6TZZv6BVOUA96h5uQ8TLSHOM3ruI6Lu+8BdISu1qV
 8ClvZhPHnt4OVOkpCmFJBIba8AQ4EcfhDpUo6bjkqjbwwa1zcqlgaz8D+PSRYvQ3CwKBvzyON5Z
 Te6Ca00Zzn39XeDB7Jmahm1MshHUD8uL5zIJGMHaMIBy2S9OqaTI/gbGC6Z3Vpi8EvDmxo6QDSl
 NkPZ7DHEerZUVmAn+IPenColvcWpy+vW755EpUI584LBpUMxVsuFbEsMvHEtNctLSW4Yh99k8xG
 SKXlrhai+nHmn17LjEOSZKxQbuH562ORy7anTL2ih5GyU8u1C8cOIg55SSIleR6kEwmDq8OAbFA
 MEkYKFrT96I8ywPBZ7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090076

On 26-10-08 16:10:35, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
