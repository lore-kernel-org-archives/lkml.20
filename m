Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2AB53CA9A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078325; cv=none; b=W+QntZdQUkTMKrYp8rwBKT+dUhWQBFVhmewDcg5z4s9ckehxg0iAy3A+hMTpAiBw4zom0BqWITY7sk2FquhFrwqz4r589ugmH6j72Ky5Eqw80ULc3dYQyvFhu7qTgBdTBhrW+yOalKtog1mIqiQskNyHPTYp0tpurWQzZ19dRL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078325; c=relaxed/simple;
	bh=w0szmDFYAAw/McVgBMAQwonoXjKCLezxEOAl5aSxZYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sY0k8699DZFkduUtMh6tafUVen5wvWDFEWzBXp5h6iiK+ThDDcmgnGi4xOYV6mBy1bJrrCFs892Secrrc/nQTMKWIAqMvW65c2v0waitBpLDgTMRoEaUMHV3McMlU9Pdcw+rBklF8aNW1VSyoyCwr7hzuK8yrzqSFgKk/lDCzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDoGcjox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7hO5lw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDoGcjox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7hO5lw4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPBnn015163
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6+Qtdb+PnVAFVBQZIIJ5o3YT
	xTJ1ZpFeynW9wYr7IjE=; b=lDoGcjoxYErJjEItZhADTDnb7Jnb6tyj4eNIz+fM
	VIjNvxje/O7btEJoKuk2DtetPoovhBOUkOOgzrwrNVeAeyfJLXtf97h1ZKn8LyPj
	NANALrLSNNvX34y2ex4Vpzbpf/vhn83k6zGlfvDG/n8yxKSoQPdKKak9cTJTrdbj
	bs1vtJ7VLTCFRuLKt04A7u7YK0yEHK8QUWzSjxiYzRe+PYkCmtK+GfAOooPydrgb
	qLvxGpwa+zjBKENBwrHlO1QKeamUPbckebhtjDUK9I3G/aty7IDGqtOmmC1/uPTD
	NIxNOa0sjIJvjpavZ3vopdUsvaokHs56mqWyoHvnwsaeCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjys1ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:58:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso68353925ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078322; x=1790683122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+Qtdb+PnVAFVBQZIIJ5o3YTxTJ1ZpFeynW9wYr7IjE=;
        b=E7hO5lw42Cjk3IkiYGuAnJ1e/kGtTWWpWZZRowOrpAxDkKxYbw0Y+BQcZDeyOAnbRb
         F3wvDmHbjq/q2qDnqGqDdIZuSAhZiJSriuxZEmZWgkzHjBNUmgTM2jgvmnnfz9T2eMSP
         DRujLPAkLoXwiD4MJz6Cf4PTwCvu+4qPaNsy7gZbwHOBFbY4bTHkZp1alOQ0wJ5QPFLu
         /e2LbUi2Cd3o+vRRX45OSOMp+HNWLBowKMypobOJSUQ05ZDfj1jKTMgRQcStriyyHJK/
         wVwGE+Oz0eYBvuybj/ab+4hVFDSA2Wdl9D3D3ggJ135MLndziFriKluDHSO9ElzIZHi0
         59xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078322; x=1790683122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+Qtdb+PnVAFVBQZIIJ5o3YTxTJ1ZpFeynW9wYr7IjE=;
        b=MFwapi/1b+6FMdbf3FLpvfbQ0W2Van77VclDOI3Epwd/omgOlwgwNToNozQwC4FIkv
         PrD1Qn/8P6X+YvwMRdkEFpdEcayOw3jpknt+TWHKh6KOXYCG9l3DJtRGHm89bPLo+sFt
         GEukN2WskUVJXZUw4ElTtyauxm9+8u3UC9Jnu0KQ0MuRgfn83TJHI0ooke1t9RMho0h1
         GxUt/OhB5XOFcmCYiKZ5ZIfD5iZcKC7aNundjBiBmMqv+heKIH0sUGg2EOsTxqq907Bg
         QEN6jmv7MvQHSc5ic5uzHVF5pMkt6tdNLYdebt13/fefvuJHBVfWjnyNlotdLy9/FcC5
         5mbg==
X-Forwarded-Encrypted: i=1; AKwUvBy/gR9WBMCzmOzhlMi8KjY82uRxebTUZ0gnK0odJDx58DeC13h/CriO6t6gvFAv50pX7Nk2V3V4BFGNy80=@vger.kernel.org
X-Gm-Message-State: AFuF++mRWbYW/OuDe9w+V8cLZeE6Ww3rRR+kgIys6Iinv+kVCp+vjrQf
	Jl9p4XyKbS3dYGAVsCnMRp4kUQJLiIMKlpCgSUjwe7736eEaygg5nv3FWQwDE7/XxWfE1kCshhD
	sz1hNLRh6dRh9UF3tGeRInuZjd48MKlNOhRTugh1YKJYZmbAy3fxKpGHZG4jWANpiH6Q=
X-Gm-Gg: AYBFou2XsLKPUKLrY8MCiCJGI5t+CxJY9jzp8fEdcya6yMczE44f81P9alHGcFjHS5A
	RELwzCA5TGpO9SmMdft+nqPzdEYfWtw4vfONriYWo2hswYO5/e2UsSIFPQlNlnGF6pNYLMfh/fg
	nR9RQUCbtSBa++EOD44SliZvy6cOXwnr4pYKMe61uyICRnzq08KUHO2oDGnPrUg8/9jiKNdyLvi
	4RJh9gHQQJLaSVIYXx1FBYGqPGDii1q8SViu3C1lxblcXUq+I42Qb1EgkSZYmAXYsAfbLeL+ndO
	EaYthGJxBwVnV1KPg8gllR7cug/ALq0BpR9cLTQEsaDFw88iS2CoQp152Q86SzvQhyIC+BwTU38
	X08OTXrejuStM2Ajff1RseF2NQPmlc5VFnxhQ9+RWJg==
X-Received: by 2002:a17:903:230c:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2df609abc79mr11643815ad.9.1790078321464;
        Tue, 22 Sep 2026 04:58:41 -0700 (PDT)
X-Received: by 2002:a17:903:230c:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2df609abc79mr11643425ad.9.1790078320871;
        Tue, 22 Sep 2026 04:58:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129a33esm5665322eec.14.2026.09.22.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:58:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:58:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: nord-ride-embedded: Enable camss
 support
Message-ID: <arJtaiNMPmnNzEhE@QCOM-aGQu4IUr3Y>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
 <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: x0_IPVXLo5TJ0mqHOel4WLalZgq8XCeF
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab26d72 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=E4mMBdOhJyD3lkwEI3YA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3MiBTYWx0ZWRfXy0xsE+JS9eVz
 +pMIjZD5EWkkCTx8zWi+IJQ1STSKw664ZYg90u68cW8sB+q1BTd1/oQVsER/IypZGwh2fmeton3
 5McpRq4exZXj5VOgOpVfaSOTv+8Mpxa5IM9ErDdpfxZnI7wr+nZFkehCkW+fli9yiHZj/NByDHj
 7mb76F1G7/ZyIqFeLNbVZK3zw6njXdCaZ8ye8QieX7REqnJylFBvJSjCLByg/iGBy3XuUZZRDNw
 /adz/e8nDzgu6IRxNFmDtY5FY4HuOLEoDuw5L5KrpFUjOejAtUsQ25OpWEUjeBs1AYPDgqxZUVU
 IvPLkuTZqU2DrQihsJyIdrc/Ac7Z+eJp5lGDp1LK0j9DsPMYGqx52xUJ+oylW6rcaRQn0hVrvzd
 Hjfzr7cpoHnhnTYGUL3VwC12rQ8fB4iRrgQ4xSDqgpSnaj2Py3PLEBnCml6bIEM0YLIFFFhH2yd
 4wWJZKw2RL3cKAIz5Jg==
X-Proofpoint-ORIG-GUID: x0_IPVXLo5TJ0mqHOel4WLalZgq8XCeF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3MiBTYWx0ZWRfX9zd7TI2OROH4
 YY6LdAHhdhf+Kbr2CIgdtA04HeHPLtuzLa064w5MpCWA0KWQgm+SBfg35KbOkqWTAZAY6Dj/2Rq
 IG34jM271v6pQthhE8ff6ugDcvCRK2g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220172

On Sun, Sep 20, 2026 at 05:10:53PM +0800, Shawn Guo wrote:
> Enable camss support on the Nord Ride Embedded board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 09ee525764ef..674e2093f806 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -366,6 +366,10 @@ vreg_l3l_1p8: ldo3 {
>  	};
>  };
>  
> +&camss {
> +	status = "okay";
> +};
> +

It breaks alphabetic order. Will send v2.

Shawn

>  &qupv3_0 {
>  	firmware-name = "qcom/nord/qupv3fw.elf";
>  
> -- 
> 2.43.0
> 
