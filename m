Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905460;
	b=TmL+a1RC7uj4xovcsVOenIglYb5cxjJWWcWgvf+wJSscJcueMjf4MH3vM+fFY8bsakRO
	 jIoVSTueJh5gs0E5KfMJKjafO12m611ncOTGEBedv1qWvtHUQczYlDzKGgEYmA02wNDkO
	 1c8sP/tJibeJyP5+bi/CSz8+E0nT7CFxAUulFgmgvY2zeq1EhR3yMzk/dfYtHjDtAHkI3
	 9SWrO10DmkmUGt3X7Ki3feWNJa7dv+e9Ixb28NL2UbCv5K0r+E6ZIW8CF3EKMneOtGKGF
	 u7bEebXj3qm/aMxHMfL0QNY3QqWYImnabnJ774qX2FKPbKU9vDNFBcdp7yphmjZczoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
	b=qifE0HFig1RoRTGjLp2iv6S31q2b9RTfCYl6cnxUkQjej+8hTQ2a8AjWVv4bfYWLTFqs
	 RWVW8aReUhtOI+Ou6O+9Cp8wgLP6owVisrdm9SR9vh8Xrpvxh+0Hll00Wi6w6O1mrhR6G
	 VF0tSvt0kM5jJd+Eh14dnCADYzkcSsp4CtgIEIBcwxYP7YC2hTheTl8Vag8EalRSqr1x4
	 yMITVjv4QbDUwQWBWJJwi4KMGkgeEewNkumWphMlviPzAqj/iSHfeWHxA73qwtaADiIjs
	 pBYDzocMRx2MuK9lcOUyECcMc6hFUUkUuiUHUm6uiCE4WWTrBngsVxwcSg7SxEc/MHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uAdmTR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTH3momC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117F606A884
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4117F606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uAdmTR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTH3momC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f0nP2998611
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hL9hddK73asRbtuhj4FvdSTn
	jK2vhO5tYp9ta4TqGcs=; b=Y5uAdmTRGT9dDM6+TuMXcj7ZLw9COd1hOeWbckR5
	a76AhGt05RVd1yIXSQMQgsOERTJyoZG4dZ137OjDLu4vmmZXhrj0CMRGinKscKJW
	wKAiOO2SQlGT8A2XANaYC+5BPs407fcF1Rd4ety0ZQ35lO83a+GVBUm6N9FPEZLU
	RP60LdxnVyX6paDQ4y2UgymidEmn0NLF83IDmXp29vmpZrfbIeqtrh5OtS/QruDb
	3bL638w0DVQriT55EMhQGZqD9i/f/RsFwnk13jndByb94c6vTEmo/M/vJKavoCg5
	N4RUp6hSLi3/J2CnNEqfEx4urPv2vi6wFKacwjMOhAshhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0gng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:50:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9493e89d4f9so800527785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905456; x=1795510256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
        b=GTH3momCXUyWekCtB4u2TZa5r9f2B1jFJfRXdCRrxFxkysHzR8ctI/0AI/jCxSBJDZ
         rEFLu8kPNEoRQLe33earEM5QL28eNpbhJ+rtCYOiwpPhWWi2F6BpsnCtLWS0STVqA2yL
         oQPqVwaP1vM3fHi2nq7NnK66W9XHS7yvJDtj10bK0v3tovWg6uLq3QuUP+Tqj0ky4PG0
         tkRSBfvNg1O+qwAvS0Zfli1YPiC7sRQTmeJ25/LdmNCvdRSnhjEXI0b7JrPWP9pghEGn
         FZGjuQrxTGU5Esbg35ql/PF1WQg6z4/o/5DSDBfjhmDcOETA2hUebB4TkCBvJA3dY1sj
         Semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905456; x=1795510256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
        b=v9Zoluti5xXnmunuSNI2PwhJUh6nkmAplXzu6DY1S5rqevU4yyIrcWKV0Y3/vJcFt4
         cgV3GQ423ubeHpDWV0DNVeS4I2egOD1LMBijn9ul/J8mcM8pJhC5grTQr4R9JbTJJwR+
         7yWT70F5iN5btsxP3NYJlwNUjepMvhoEQHluY2Tnk6viJE+ZPDDtoJEDbeqFq3LrQF7H
         UhsojYt6aCcwDfWLSTLihDDXgjqFysbZq+1Hlo/R+1IIH5+aelZOF20cIQY2+tTquvoI
         aXFNmxQB74CelCfdeM/KmwaQ4Qje64iWwLKG8G3s6k1pRUwv3yJ2/wEq37QIYjSke1R0
         Y7aw==
X-Forwarded-Encrypted: i=1; AL+hErG16qk44e2jmCTx3cf1F9QBtAxFu+LJ8L4KdAL2UReZldghL7ylL5pFw8lZzDgI2qiXBEgKoVsedaLeDbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6su8SxpEm1A0kH4wQO6WL6AGdVHgwGrJL+hNaLWXxKJho69qp
	E6juHVthdI4O5YF1PtVQRqSiunSOpNw3xtCO7iysDfK6UpuDGzDmn58igoS+rEqODLMWlNK8CJD
	jEWyUV6TxNq19jQ8OgfGtl94SiI8v41OF5Hx3hryR2cItTlaUoZL84Z3knSY9oGQy3rY=
X-Gm-Gg: AYBFou1U/+XhGZyWRSulOb8LjlnUB54T8+uJQoZWy6UKO+rsibKCMyIiGZuA32zS2DU
	jXtAXUam7WlApuopQOXPmJqw20jsIHdxVLcNp/LKiCf7ycZX+efMUbEPwCNXEF8KPK6XjLaOBZD
	RCLgv3fTwhRbTV9HI6QbAajWhC0M4s412g18ap81D0ShAZppboCxdrN7WiIuGC6DW/A6f4v2sKn
	Uret8nC2+bGsE7vk5MgLpehTTGsMl0UABKwLQLQl4u6PlHz5IhnAUKDYwu3t/8C/rWJgYZUK/Ft
	v4ooKOB0C0g3lNU1cCRgAMMiXVf9JSWT2lIjnt/9yEjGmAw0eDqPGa/KNVm/dC31nEE4oekJknc
	/3BsigZWFG5qkU/f4nPOYeT4yR3DN4T1NjMRuCmsrwhvW301sl4Y14DAUpZkSDAeM
X-Received: by 2002:a05:620a:4155:b0:947:7691:731c with SMTP id af79cd13be357-9494bccb8d1mr2102672885a.65.1794905456422;
        Tue, 17 Nov 2026 00:50:56 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:947:7691:731c with SMTP id af79cd13be357-9494bccb8d1mr2102670485a.65.1794905455810;
        Tue, 17 Nov 2026 00:50:55 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566a8a16sm170923935e9.0.2026.11.17.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:50:55 -0800 (PST)
Date: Tue, 17 Nov 2026 10:50:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] soc: qcom: socinfo: Add SoC ID for IQ10800MD
Message-ID: <3cij553mn4idl6g5spnmerulglcgsc5s5nrdbg6zrcrntj27qt@mhrfwetsxxhx>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
 <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX3v68OZ/PafKl
 brfJFfBhglfgZOgo8mtAqp6ds1ZyhZWB7RlWzqbMR8nveeGvUC7YJHqyx8N0qmsIcu0WalYuW81
 +SF0n5NwIwJFISSTKVPeE12o+CoKbTI=
X-Proofpoint-GUID: UloQbPc7KVHVvr2X-YA1pXi4iKuJpTRD
X-Proofpoint-ORIG-GUID: UloQbPc7KVHVvr2X-YA1pXi4iKuJpTRD
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc1571 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hvuvgssclkmJWzRjKEYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX6aJse2lr1DnN
 GKIO/XMi0WmRQRMzkaOVwt++vmkqzX/4afxuW568jgIfU6Z1zCWTRb0ZReZ1NzAllByl+H8Ybem
 UVNCsVrbkIN7tV1nm8OjRAKfweCgbKj4LAsKf4uGarn9XjdYZ72zVB4QFI1SBausxZuB+nPSM1j
 AmyuFXEC5dmDaeeJSoepWBS8/oMa9f+v43vM76IJruvEb9dN8lD/Vl+lcbt8bkmfEBSBUEKmqSH
 DJLbfSr5VoaZVipAr/8V1xIG48qdtivvW6koq8I5kpHQI6/589aDRZqpwkOH0lWmzTXt1DjklIV
 6vy/DBA5A6+96/rg+HiaZV/kcbFybww/NQJN4dOK9Riu5T1GuGJ22NqaXJIEgyDW8J3GuORjFL/
 MbWBBfyFh83FuokJrjhStfgvo/Sdcdmml4inIqqmGYINnxE89fX+xHLzSM1KoEPiqa0iv0/TBgV
 WuBJOnQiHVsnlUP8saQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170035

On 26-11-14 21:33:04, Shawn Guo wrote:
> Add SoC ID for Qualcomm IQ10800MD, the robotics SKU of the Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
