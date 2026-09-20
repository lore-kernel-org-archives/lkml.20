Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA56A3DD875
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891119; cv=none; b=A+UQHtyKt+mgO0q5ou23/+k6VBshN/nDekC/pFP9F+qJGrCb9FdcOfDQB9KvpBuTAeU2lGHD5GpimkpMdaI/eS89SJOKRU49KXYRwSfjfztphKg3fxDkTtSd8mQ9cFCdvgxrpL/viy4xrN7w/5Hu+LvHUMTXVE8MAYLsJjAt1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891119; c=relaxed/simple;
	bh=sIPjK1roC4GjTke/gQdwaT3BQ13pDX1XWahschRPsts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/cLyvR7BtxnOzDdX0NiSsQpzwyj8n8Zzqd2d38YCPeEqrVF0h3YVNk7OKD+dm8HSNk8UHUgOQ9kdJPrs+hkyX9b8RehTNx/Mc7KlJgM7tlbFKIoxmXn8CgwxsJeg++snZUkZv7Uhl4nDLYlW9vGPyz2JB8NM/GWt8crpWCJnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4ASAqEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RO1eO7Ho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4ASAqEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RO1eO7Ho"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K553j71755988
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7W6rf8nTQJ34DibSctX6UNZK
	7y7hdh6Lvz+TUAjbqbk=; b=X4ASAqEmJRQr8oPfp3MukGEm1FScI8NpXcByqk9G
	21AGj7RwiVCc/YMLcUmCFpj3jeyOPFWzhNHhMaGnhFAryyesIfnPEPggyDxTb1Tt
	e9x/LYeBpquzi75GufcDsXLPERIWky3wTcFJP6/tV4EQwYTWFuw2kfE8jjuMmZLH
	k/Zrw+rT94vGb0qiJnrBBTfUiSjvK0JdJLSRBr1LWgQ+E4wXLUwlKuvok7OIIA4J
	8TeNaTV4/r2xsNZ5keTxnCaGFKlN+IcDzfmNAuKQPOtP1rIG/kuxZVTs5cXirWiw
	jxMc6SzAvVryHiTkb0XzmeNPNSu8CDJSSEdRW+C6ej/FQg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfujh9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:58:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8633c0d7353so2245851b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789891116; x=1790495916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7W6rf8nTQJ34DibSctX6UNZK7y7hdh6Lvz+TUAjbqbk=;
        b=RO1eO7HovrsQL9u9pDSSJkWBNNEMeN21xFN4j3kyrTgpleQv35OIfgMuq+wfQxYiAc
         DUSSG6qve+7hksAPhF2JW9vvltIns40G7jtRh/zL0vvGR1Nnk4XceHBotWbBpKrrzxb2
         NDz+hNntp+3ZbePByKGxRHnqhCr3VJfKxLcipcnFaGwLhgftjg4gX5HWt+usEGnos+uM
         w/U3ubTl1zFEobm/44Rh+VcJdpxAwJahRNBGslpxQ3altsuJtp9DxuEaX8QZ04mjF7Km
         V/vBvA+JqzWK5MsdRDnywMvA0Zj2H3tDWBx8gZrGFZqjMW7jU8Kazp2WFDOM4cUrFmd3
         UCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891116; x=1790495916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W6rf8nTQJ34DibSctX6UNZK7y7hdh6Lvz+TUAjbqbk=;
        b=0X+fGUdyhHJMVVzQGlFjf3ADrvGIcEen9G2Am2M/y78P2TNZDzgldQzoU8qoUmqXex
         9LQSWwzs0rcCswc19KcmlnWtaAMjDntC7vmZZF4WNyMfaDIG1WhOz6Qx3M8nHMFYxwBo
         hLshe4LOO9QPx3yxY+eflWo35VQBp8hZ8w331cNCkVCKGFkGG0qhDmAYQf5g0qkR14Qj
         dKO195oWpwzmmHK4Z2QrfN09C7dZo/JFlAhV3Aixutxa0evXgplMccTBCNq2+xlFCNZF
         u2yf3OfU3zCqUxA1Gxw/5xPrHVLxy6nltf1XCSQ6Kg95JbdyJ10BkC4/y09f1xXNgJUS
         pA7A==
X-Forwarded-Encrypted: i=1; AKwUvBz8mnNrDQQL26q31RLkZw/c8zLvHqgELrwdS9U0mpXd4PGwT0IVxxLCdCOe1qOiUBEV+I1OmAkq5YAqdU0=@vger.kernel.org
X-Gm-Message-State: AFuF++nc77m/Zb3TzkSsZWTXGCn+FEaeQ3C5D968oPepOgltvksUgNQf
	0ZFldRrAbF4gkSAhfKpBb8k636+9JRpNKXmKudpdNuxwzmehykWlHHDDtKYO5g3Le//++3WJ+9S
	UVpCm+arGJQ6TeJO+MOMWFmIYjM9SFGRUXV4EgC2YDExTYrYt4wrQ0sBsGjOOCE5Ao4M=
X-Gm-Gg: AYBFou3P00P5QE192O2trUyMmuhfuVY3gCGOmJ4xigwPvoMy70Sj3cgsDDJ5EyKeGH2
	A7INH7yJaPJmF9nZNgNm11JFf9vANyZYNoQ4PPM1Z+lKTJbT1MGX5UrxwmzeK/TqfY0TQknDr2z
	P/QORb75qJFdqGUni3Fd71NAPFF/PPk0ITOcaLDrdH9CFHXICz7dFh+NdK+reqAgcSTG5tm3NG3
	xCJo3OSOIRiAkJ/4Yeyj8u7HderbSqFCcz6NcgklkWwH5LSet45q7yhp4NtA1a+f8Hp3JXrj0Ke
	j1rTAqNxjx8YubQneXLpwu4jnlpf/UyB63QvKAOHdN1NADABiq3xptUv/Mda81j40KugDJweZBt
	NwnKbGD3Qjp/2o9of+B4P8mwQw0wW7uw7GH8H5kzDtdA=
X-Received: by 2002:a05:6300:6ccf:10b0:3dd:a197:7370 with SMTP id adf61e73a8af0-3dda1977468mr3929212637.73.1789891115872;
        Sun, 20 Sep 2026 00:58:35 -0700 (PDT)
X-Received: by 2002:a05:6300:6ccf:10b0:3dd:a197:7370 with SMTP id adf61e73a8af0-3dda1977468mr3929194637.73.1789891115465;
        Sun, 20 Sep 2026 00:58:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e71a4sm10282212c88.13.2026.09.20.00.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:58:35 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:58:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <aq-SJY3UkLb9HbXj@QCOM-aGQu4IUr3Y>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
 <20260918013740.1355096-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918013740.1355096-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfXy7gRN+lUv9Cr
 A8eEaL/tZ3cBBg3OZ1J37a1E7B78oIP0Z1V3a9HQFDGIFS8vMjjSTAoZvZVUMjbws2zIRpGSVki
 nrdpmJ244jgbbhn+A1rEsmWnnLsTM9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfXx56XtwLYm6Vs
 WVkOKeSmwWfHFBkWcW9UBAFLv/M77eUM0Eskx9lXTlBYnEaW5HXq+6sZWKpVogbkdAOkpW3ZK2A
 qOgY4iDmhQqftguziZ1/6FSdWkmbgKBmrh4rh0LglDkwRSgkRf5UvUerJFT1O89ph1+1xn3I+Gy
 zde+cIdGr/YAwxe0nwRkwpE6eZ5VtCNkWqHWX/wgv1W1+vwATv12iv5H6jxhRgfsJWxR8t733sh
 BAI1M16t98iUax0CvZl95Mji0sxYLCCAPRm2t2GrLRbqid1pelJ0vQt02S1dV92chys0k0My3O3
 Zp7m2t2B9R3xQbHmt2YSwd49Vl2u7hvdw5YPBoz/W/Rw09dd+uZrxxIJWGsaOwhHr9v/IpvfcHv
 SlfUUEiIPG7s6zbmTAtAEnEwlj3BQ8NXn+JZPF4Pg4VrlcxTQghc0y3bJJtgnhGPc4t/MrH6veu
 PFfAcCAXGUTZbwBfeAQ==
X-Proofpoint-ORIG-GUID: Xz8p4YnFhjBBRjJFwnWTVu12bfPeP69K
X-Proofpoint-GUID: Xz8p4YnFhjBBRjJFwnWTVu12bfPeP69K
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaf922c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bmYPeUY2ZynyBSnN7qcA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200113

On Fri, Sep 18, 2026 at 09:37:37AM +0800, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

I will separate this one from this display series, as camss and iris
depends on it as well.

Shawn
