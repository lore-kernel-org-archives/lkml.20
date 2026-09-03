Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F134541D226
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421249; cv=none; b=DdwLoQrMLcGbvdBUo5dqaFmK/3tMlqmzGsxG7mGmAXGXqLGm/g39t3oDIIaI7sdyCKrm/N04b7JJRnaqGnEAuJO6wEjO/3LxRa+5Ic6kJHacaq6qwyJ3KOjEFZq8ebMw5MLhGsJ0LKssoHy/5ThpaR2Tq+1DNpzIs1YyLPwLZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421249; c=relaxed/simple;
	bh=x7pyjtGGh7b/U1VS+WdJUyI+xIeBGiIvfSijCbKsJ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZCMzv0ta8D/Z+HodxVbUCjhn9Wuz3G0E9JNBYlcHppop34ECLmVt/zO5Tym0WQ6/BZL1Ywmx2MkhLECbdHnM5kE1DY34FphkxgCWDSGzJvPuYW4g+R+lWL3YDQUbPLhFGhCkOSjOrwNOQrPn6limd9H/VCByYOmd5b833e9iJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnQu6kb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9jELry+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnQu6kb0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9jELry+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lg434023736
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kWXB0DBFbeY92quzkukTnKj6
	Wdb6ho2r4wmQ7PLthC8=; b=cnQu6kb0RChSmq4lxnIYpcqvuhBYGdBZeNIsbKJD
	8oJMC0Q4vj+QYxMxf0y79c6+hhIRHd4EESq76nAr92E8wYIrQUFr9li3/HKoQ7ff
	/NfYJ/goqcQJHondnYMduSg2H9ogh6xDU6h2M1SZ81vDu/+g6Rj+fofMV4GQl818
	e2Pv0naBPSh3DNWjjUrGJ3MeCUdmAG2L4dF0f0q9ohhokzrJs8byw352rbdtYuDY
	OztvUBo8rDG66Jo1gzhgILKDvBguoMB/KX7nIuhuYqyKcMFq0Duaepn+n1ygALnI
	VpxqywGxLlQxN4v9x0bdW8SxF0bokbivs+bfzsdV3ScO3Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc14b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:40:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so2696800a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421245; x=1789026045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWXB0DBFbeY92quzkukTnKj6Wdb6ho2r4wmQ7PLthC8=;
        b=Z9jELry+um3uiyh8AugFysAENxzo8jppLqIrZiI8uKLqkxwID647AP2NnFa8QaQUBr
         qRdJm5ug9Pp24S2Yf5S9R5xjg3jdx8uX5uB4tt36KOo5qF/HdGzX3CvsXRJ+n0+3GPwX
         EQI2oJ+x1yZku8tUMFy9MzL/3B79wzN1tNnOyle7s8AFPWBYJEWWCW/kV1E2tN0CZ7Vb
         xL/ndTUDSHKG/an+1FeefdVzlNHqtS1du+33skXlNqCTX+TVys75jiQUWj6neoJyG5yS
         bHTuh0Dm4z3rsn/eRuO5uxEd0RUBeJavrp3Jf85uvLdCJXe8Wem90h2jigjfep3QuHjj
         /MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421245; x=1789026045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWXB0DBFbeY92quzkukTnKj6Wdb6ho2r4wmQ7PLthC8=;
        b=BdtidDL1z1DszwElRv8bPtvpk8pOd5iXFoGYYqW1rVZ/U+w6lan1BXNbKdp88Vypmh
         Jzqc/Wujtwi7Hbhtv9M3K29dfr5jD6LdtVGIYqEiIOG8f2Q9QY4CzMdbRRvyQk2Ki45a
         0LaFaHqHIukTjRksYGsEr4qNVCpT9wet/qsJAUwG/DUPSlrTmlO6WKcERK8/8DPQ58lv
         g7EhAIxMU4RkT3asJhQmelU709w8g9lFDw7Ain/9Q8zcrH1ZgtadR7p+shFSot10X/jH
         Ngn7UZJ2vxrrZ6ER/isXhQHFX9907qw4XiXwc5yUpEklIev8NIIaRVwPnl43nWtI29of
         Wg8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzw+Ak7Yj9VJ0GLsEVKmzHj8T2p0O1nTIE3QHIDB35XtdPYPihgpraVfhkePidj8qfumFYZVWMOSnthZY=@vger.kernel.org
X-Gm-Message-State: AFuF++mz8nzYq/Yw1YoGJzWhWChGHtgOc6t9An3VXC+28dulhJUzCbxQ
	tAokzYUmP40nUpz1vrJbnsiJYeCrX/poCfaDvbfHDDmdDJTtCaI2KwnF6hLqcZA7VjV5XvBVROw
	18QMPFGUlWn7zWA8RAhr+s04gWZ4Pc2c4rLrK5SgMZ1p8crOU8utIgefrEgyn/JQrl/sGE0iDsy
	hm6Q==
X-Gm-Gg: AYBFou05n8dZPJiCrxMCIdVE/RboBr12NaQObjzkVcpWQ5XgpxLYYPzy+gHeDA55A5W
	eCzNCPPwDq3u+xot4ZZMVF0+pmQr5I15qCjGHQuLvqKUDLAG8gfTiaowfb7kyxl7vyaTr+FUIWe
	jnt+MYF8kzUZ6Tx+gMstColsYwKdcglPIBdmUcMSC2yeI74VdLiWqNoHGuHq3zeeHXrIS3bK7s/
	m8Wkrd3JD5y8+Oxl9MLs+o+wmESQHklTwdXhCi/S4GikVLduNO1Btb+U3W9YH+aNDVRFmz032cI
	KRlr3zuZLdgtg+z9xIN84drABBh4jekad1SaJXLZPpb67/CTuvsifjsD5O173thtdg+EsveAw2J
	2d7H6r/dpQfI3SWAxzhjyCMbTWQhLMtrhvOTUYZh7lOU=
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr17400851a91.9.1788421245531;
        Thu, 03 Sep 2026 00:40:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr17400808a91.9.1788421245045;
        Thu, 03 Sep 2026 00:40:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143199692a6sm6767023c88.12.2026.09.03.00.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:40:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 15:40:37 +0800
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
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
Message-ID: <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
 <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
X-Proofpoint-GUID: 01pxUGYc_xaXTNEaC-_csGZOD6b7J_u4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX5MFPlgRMXWKM
 leLP+XOViDens0aQI/Q9X7Oj7ziiEjp7M9jCXuQp5tMkMvZUtvsQg52D3SThk1gFd2Wp433QjRq
 JSO5PsbUwsbYY+JP6l7KzTZYvwtavLPc0LGGvdbE80BzsPFg+jKDHPAWLxDjERF6+KyhH8bcX0d
 jtPzZ970+Lsf+2GgiFfzOChUsz2XwzHsOJ5zkAy/L6f7F07NA7FMCcQPngOzAywiDtz3HLDYktq
 jn2Y7+j8SjCdUaXa7w+Z01+BXZ9WKZO8nhU9TEGw0T0SgPjGZLs/7YNnPZK8z7Paa2UZHSgYt4Z
 53xAdYPZWQxX2D7rtEaRPZ8elHVKcD2w0+fxx4e7RYh6qAEMAsIgUdOrTnQLA/+H90KAUCopa6e
 zo37/bb4JceUMK50g6U3tvNMW1+EzL9gMXFNGl5SfQKOvbBykJ3zrZLNBA8n4bmDZcvgXRNoIjZ
 A9hP89oD2X20mlgqiqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX8V1zbLICtx8s
 aMIWwxy/A5HxHz351I31+JqWdEa/wC5v8LR1acW3P4caViDLUgC0cef/Yi0Q4peuSGIO+Fow7dg
 YGtZIpMRKqoh2TadE85/P85sjUy2XbU=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a99247e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ibTjlFuhWse9lpBZ6vsA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 01pxUGYc_xaXTNEaC-_csGZOD6b7J_u4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030067

On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
> On 8/31/26 5:21 AM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the initial device tree for the Nord Ride Embedded board, the
> > non-SCMI variant of the SA8797P automotive Ride board.
> 
> [...]
> 
> > +		vreg_l7a_1p2: ldo7 {
> > +			regulator-name = "vreg_l7a_1p2";
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-always-on;
> > +			regulator-boot-on;
> 
> You mark _a lot_ of regulators as always- and boot-on - is that
> necessary for all of them?

Ah, sorry! You already had the comment on nord-rrd.dts. I forgot to apply
it on nord-ride-embedded.dts. Will fix.

> 
> [...]
> 
> > +	/* PMIC H - "UPMH" satellite (CD90-73961-1) - SID 0x7, Bus E0 */
> 
> leftover?

Since we agreed that a bit comment is useful [1], I guess you are saying
the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
comment aligned with nord-rrd.dts.

> 
> [...]
> 
> > +	/* PMIC I - "UPMI" satellite (CD90-73961-1) - SID 0x8, Bus E0 */
> 
> likewise, a couple times
> 
> [...]
> 
> > +		vreg_s2i_gfx0: smps2 {
> > +			regulator-name = "vreg_s2i_gfx0";
> > +			regulator-min-microvolt = <300000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s7i_mm: smps7 {
> > +			regulator-name = "vreg_s7i_mm";
> > +			regulator-min-microvolt = <300000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> 
> Are these actually exposed as regulators and not RPMHPDs?

Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
here. I will drop them.

Shawn

[1] https://lore.kernel.org/all/b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com/
