Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38333C1086
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962464; cv=none; b=ibZWCVC7+bti3/ocDXaR5WguiYlZDa3+oJy97p9RpbeFM9mRID1Kc3bPrL5sCfLv//d+WmHEc+KRzSLXms7vEuEzewnY2PazR95wq8bGFrO0JVGZ6Y6vin5n8Pl7R5IDPmir3tkHSYnEVV4XH08OF4XaMFZHJ2J80lFjjKrMo/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962464; c=relaxed/simple;
	bh=dJv04GCBfv9Q9OqQCW/KCpqg3mnXeg8ey1h8IgH3AvE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r7FaoRxEwtDACy/aAkt46duhxlmmkGpbygEFesgn83BnySLZmDK1tbIxSMsz6RhjAptBwkxc70PjOSc0MqKbPhGGVAr4qBogiynE+6Qtb0H8Mx1WgcDgNw3Fg14k2YrmgHPdI7AfmTJzDq+x5dcmSuLvK7IjdsN7jw7IGx8rR1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrazKw40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEp0Joh5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrazKw40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEp0Joh5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2X5aD3000880
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=; b=IrazKw401apH70ng
	ZG35AdfkadcMTRiGauT8oOeMipmvv6JiHOVgf4rc/iIBJW7AaLk8EJUr2hSFIT5n
	NPIXUW3/lcDwy5JMCSz0QGRv41mmm5qbMHamE/PYG1MfR2gEQlKhem0ckYhB0c1r
	AxxDqa0IgcArLWECWVtYgjsJn8sXzc84b2AasxCFuBgfsPp/xTTLCiDDAxNUulHf
	eYQjLBi1AmpkieaF+uja4aO78qH5PnqRWZJ1cTyokXnLSyJ1r+n9OWp+kAcm/gEL
	fr5l/aAxVfUEPeeKI7nttH5nnzTa9hrkP+DPGeLPcIcJalNUrH9Gd2RmkqyDK4CU
	fGsd1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbetqve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:21:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so80019a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962461; x=1792567261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=;
        b=iEp0Joh55PkUISD8zHs0G/t7wg3/HhVljfJy79ZPhBKuyhFl1RaG5rdrf4L2/42wQo
         yNhTULOS0O95wqXolL7Gx6FCcMpy5caUtc1SOMLDf5gFb5Thnc9TR/d5epMKFQq+vihb
         3dd6Gn5Odxji22qDtxJY6956iRe3AhlZckvLJ4aPzogpFSPEb7ivDACXfrA/ux1NjIx0
         z0+gkqAFJEhSzDydCKhS2eV3I6JIN9CZc0/cVSwVd527kuC5UFCGRaK45ErDxgHFhiwW
         gXj/q+qbg42H8lfZGy+Q8I53iKHetzJo+6YkG+8x3Dj0VKePddwun16AeY0fZLQn5kPQ
         0pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962461; x=1792567261;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=;
        b=xmYx1+Zwx/geTRa+/uts699lSnjhZD8ecRkGj3QGIfvBWUeXOUo8biWqIMx7M6p7JI
         jQQbOoHIENq+VmpoIAuzVe2bYiO/R/w/DA7GGGA5oIARDE60CB5C+yAGAHkrtha3f+Ku
         5P6kWGzCHbWf2FYFiacU7dFKwhQmL69tz4L3IBPEfBnhxBEI6VTGy8DnJ2QKjTy4oaTO
         Ppqnl6aMDSo93a0naQwebqFxmJD+C+lrZ0ntsxJW/VJ4Ob5FfnsFdNxora7vtiULLH+b
         webGrgusxdJqqLpuFddkWivCjXyvj6M+mPyjlh8FoV5gS0UfCrz+4bteUS/HCAVG9ogE
         bIyA==
X-Forwarded-Encrypted: i=1; AKwUvByVGCSD6zUI5TMTpd8dlajc2U50efgdYszwxz2tjEU2KcL1ovtBXkmagNTtKFlYDWxUBSMrZ9YkFytdhDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJob9MlYF9edkuKp71pZVcGG70U5a01OtbscxumVR860ciQV2Bm
	+rJzzuE09bTtxDfr8WEjZxZ3khjXLL6VInl9/I4U7at9NADpuz1RS0SCx7Qy8l8u8Krd268bxm3
	RjhKjnINGNLwMFXJ5lRqBqd5ATv51ERJyyFBM4YZ3c32avZNgpx8VGjSIiee981CM+Sc=
X-Gm-Gg: AYBFou1nIx8LYJaYzp8LF7P8dsotNbJ0N1zT4mU6pEoR2SmhXG/aGNZkVB0L6/xugR2
	tpRSqV0P4/JldManBOjYGRWQiGVJd9vVcluxlWTyprmCBJGiWJFm9O1akibMkPq86O/rpCpxld1
	nuUx2mvtGeFhwKJmlH/jTIba07GlnpYLtsXJHoY1j/lrKFO2C5+UdHlKjAvsWZN0u47eTe3jMIF
	V7YQXbeeI4UQBPvAi7Zncik8nzakoncS03Dl4qE5lkJNCJCVdfrN4ODSuGyYJ4aS67870Eert3g
	SWw8wvL07UYnTvelGwdfgxQ6ALnTRXX4EGOSBCLi/aY1PQ23EIgHzVAajOQf+u7ST/LnGjnAf/u
	FDd0Jbdd8wzcCT8uO85toXe53VSNR+yJTpl4P5BE7S/tm74rI5LqWMQa32ADds7RhaA==
X-Received: by 2002:a17:90b:3912:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3ab3ac6e6camr12528238a91.50.1791962461328;
        Wed, 14 Oct 2026 00:21:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3ab3ac6e6camr12528187a91.50.1791962460699;
        Wed, 14 Oct 2026 00:21:00 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b74csm3549219a91.7.2026.10.14.00.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:21:00 -0700 (PDT)
Message-ID: <56401e91-6d8e-4489-ab34-ee25af031a74@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:20:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH net-next v2 02/11] net: ethernet: qualcomm: ppe: Fix
 multicast queue config table access
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com, horms@kernel.org,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com
References: <20261011-qcom_ipq5424_ppe-v2-2-8c7b057e2c43@oss.qualcomm.com>
 <179181020968.434549.112728167970187942@kernel.org>
Content-Language: en-US
In-Reply-To: <179181020968.434549.112728167970187942@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d2KplmBh1UPxrXJFiYzXhEqbtg6qSD3v
X-Proofpoint-GUID: d2KplmBh1UPxrXJFiYzXhEqbtg6qSD3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfXwcRN0qfOTguQ
 wzKrfswERyxiZnB7uZWqK7Xuwnf5x2vBdiBsBzp45ml2Xbnx9+wlBURRbcXVUro4GEOeBbbj6qE
 h4ADgFXrM+Q/jCTr4PLOelg0bJ38ge64fAwuXwfDKmQPzLs8QJwjADCUDL5uLWAYSYEOrUmOSx5
 QK0XPeOyXYhCXHxjtYZcZufI6YHPk637i6Fs5smxZWTvygeQ7hBqO597DnebKcUdI9WQCTOjy0m
 f3b/8frQJaNhEqEypoTWrZAPlZZTPCO/WVBiWHBttLrGjt9CEs9a+bFolKjYeNshDDyHpSobV8q
 Vvw4XSFqh/7JTSzKronEgRxXv2hcQhKb5zkh2XH7Zco6E1y00qT3jJWIxE1Y24xILEDFus6A95p
 7LOS0K0EKAQ5ODr+Xoy38SKxYNrPzo6ShQTUPmHBAUHiQRaQXOS18ve2OioseuLWE8ljTc4dxYf
 JhkKdQglkfCwAC29Quw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfXwVoxV/bs474U
 DF8ercwdBUQWyuSrpWw9JyQYb4Qta9la3fA+6DpNeP/Ac3/rlqZdHX37DZCL+OxMqrsfDmENoll
 atd/WdYumwdDL+soInlerlKtWX0X0rI=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf2d5e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1_IYofuslNu8jKGPog4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140029



On 10/12/2026 9:03 PM, netdev-bot+sashiko@kernel.org wrote:
>> Fix it by converting the queue ID to the index of the multicast queue
>> configuration table and accessing only the 3 words of the entry.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> [Severity: Low]
> Should this have a Fixes: tag? Commit 806268dc7efd added both the
> multicast_queue_cfg[5] declaration and the absolute queue_id indexing:
> 
> Fixes: 806268dc7efd ("net: ethernet: qualcomm: Initialize PPE queue management for IPQ9574")
> 
> ipq9574_ppe_qm_queue_config[] covers multicast queues 256 to 299. That
> means kernels which already have the IPQ9574 PPE QM code take the broken
> else branch in ppe_config_qm() on every probe.
> 
> Since this fixes code that is already merged, could it be sent on its
> own to net with the Fixes: tag, rather than as part of the IPQ5424
> series?

The IPQ5424 QM configuration in this series depends on this fix. The
issue is only theoretical: it was found by code inspection, and no
user has reported it. So we would like to keep this patch in this series
for net-next, without the Fixes: tag.
