Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66C3AFB01
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881082; cv=none; b=kYVIMR/W9tDs93E38YWgVVHO+8WCdfJ+JC8k0xuH8LNKTuOWq5VxTK0qAj6ekMhRibDzYqISibYnW12A1tU4Bczhge0VXOMuEFWtWjv2PHkjnqyFdxdp1eZO920/648XrhVNqyJRtwe2QpEI7+xKkiNivVwuWQAd5gp62jBJakY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881082; c=relaxed/simple;
	bh=HZ7QIReQ3uoSFnEfU/QJNR3c9Uf3lS5K2cdxd7fZlOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fK864065e3gKMoT7XeJPdaQ7pd4mf9o89Hf+l013nYe05tzlZ9X36Da6opPBl8MCF3fj5zCPCtAuK1xnuL/jFJ8caMII4rnb1++p20te1IMzGDyPGgheCyBYJvWbaM/KIEW7h0UVT8RKS5mAGuUzc8Lko58tKd5vgkPLGZR6aoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caCpwNn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6jU8Rb3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caCpwNn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6jU8Rb3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YsV93208372
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=faK0bJ0sX0dcSnwboayq3MHZ
	Icr4uJu+BKG/etclmFg=; b=caCpwNn8oseMurXZLBRWMTz+TrmZik63MloQIBVZ
	V0h4K9VIGhkoKvsbacEkmw7TJ1RkBwE9tQ6rrlzbJte9vYAS3WFF8ufNY8rFH7zj
	MoaOQUTo6j5yAcaDh4HGM3IKZTbaBbCKmvAJjwbIk5R6JxnXy8VH9C2DB+mSTU10
	NBZ31VUZGd9PGL2Bhl59k3CPWx1hL4xep3M7aEhbJ8OObdNYAbHJVZtJH43tT+Fr
	TQ/TKZWW/lOsLgK4PVOOM0UtI+a/mGrAnfSuKWJ6KU5mFm0D41FScpZLgpA6Jsi2
	GR9ISiy+w5ZPeXUPuNj7ZYpV2pxDfYPBUQ3oo2TsZwMJVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgg6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:44:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8067974so697288685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881079; x=1792485879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faK0bJ0sX0dcSnwboayq3MHZIcr4uJu+BKG/etclmFg=;
        b=c6jU8Rb3hZA0A26Y6d+WOUdM93ZIr4Foan7aY5ZCvRKWXDf4JmhBnYEkvN2fyx/GaH
         35hK4Lh5Sbp2YvQmLJiEyNCtPTKi5QhcFLNgWyo2V8tSno4Z9FFJG/QQXG7Le2Usm67l
         eyZO/d0hoyz+XuX28aA3pFiBSI1SdBAWP2TDrgotWgdDt2TaPFqRjYXRHVBXMByaNG3R
         NkFkmkHIxOGY8T65SQxipIhd6VyWzQgeXiakllqno+deCnHueMP5oXEDrQmSsTVtfwMX
         bDBniD8xtwnwNgCEfmdLg6zAGbTHHsRvkb9RVATYC/Yifg2xvMp4cXocIMSnjrxu8SOe
         +qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881079; x=1792485879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faK0bJ0sX0dcSnwboayq3MHZIcr4uJu+BKG/etclmFg=;
        b=KGANkMGlplxw6a19OJsigbnLz2Wc4MtPqAH2SXbB3PduB8m7gGFniDOur6YaE1y7Xz
         gXJjiIjnCP+NIoYOREE+Bm9TExXz31soSJpajQ3SaM3ZldaxGhCqharhGJar+IqjjD3q
         9fKRl/0vBlUHSrGgEUANoEcOW17P2uIpz1JqMmyBEq4m0bTitmDE9UvzxHl/79Q4g1AN
         +ozVAc7WqYyauSDF+bc08BgGY/v/8+73FWylJ15rSwgjP4sZkMMa4coyx6VT1/c89Ol6
         lCApdmVUM9pmum/vseL6Si8WfshfJSjMVWKBYTF7L616RcCEKJ7uOWbf9mqblH3VU2cc
         o6ig==
X-Forwarded-Encrypted: i=1; AKwUvBwTQmeLyo9StGvDSQzP1DB6VrT0cyYOFP/C+7FYmCKF9caNSvfDPLZ2rgQ5tm2mbZ38KL34xWqRP+i2d6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1hqQdhLClf5GqRutpKG8eScMsvzVnEMRmHDx2/V9jm6xUFGrQ
	HS+GX1rJQaafTDnQcNI9t0QD8RNC/Yd/NxDuFoRDcdVNuraTrll9ghBgUhAXR1R3ayuWVHCszIb
	TL9+y7YFf++EMVV8zPjkgb7W8fMAC+PNnKNdT/UDl11F+VsRhXGugwP0Iyfj+33K6LFI=
X-Gm-Gg: AYBFou2a47cOl6Z/5M/s3m9BNMUaZ1frliRJa6ocTXHH1XG3WcNIhIq/ag3IeZPybzH
	WtAn+ZLRLgvWhFWTqPo97v435jaMos+pZQ5I/BDmsOhICV2iwLa8LP5Tk67nTRN5sBPXDtTymIb
	K0G13znmnxUHxEz4+cAj6H7MOvqLK5XNMNDV9BDLCbohqDHmcZcfk41yxau0e3va9B3THssXozh
	xMZ/pcGlj4I7nQ0rvO13oR4ND8jI07KmzQ3EiZaZuKOLRxIsRxUq9o7kRN92KePEW01nXmMzb84
	i78yiUlhnezMAdP6f7tppjcqQ9GNcK9rcH/bzJISoaOR4iPuMhnxS2zcwMa9zlhx//8JymTgLxy
	hZ8//Vngvbx/UPLA=
X-Received: by 2002:a05:620a:4507:b0:93e:c12c:fbbb with SMTP id af79cd13be357-93ec12d05d1mr1863346185a.72.1791881079184;
        Tue, 13 Oct 2026 01:44:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:93e:c12c:fbbb with SMTP id af79cd13be357-93ec12d05d1mr1863342285a.72.1791881078606;
        Tue, 13 Oct 2026 01:44:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm380055145e9.14.2026.10.13.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:44:37 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:44:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/13] phy: qcom: edp: Add Nord voltage-swing and
 pre-emphasis tables
Message-ID: <qihez76tvkqvq4axyqmqyig73bdds4cuuxhzzv3smlztu32gje@q3r7o2uuqkw2>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-9-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-9-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-GUID: sWVh2R5K0mPatAE08pekxLg7FAl1wfjv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX1gZRyancx2OS
 k2v3oPl8rAh044ByJbP3MRwByRfuW/3SzlIyt6VAFURUENcV+1Eut+UH7Sn+novIBwmdBaRTtOW
 d4GVQpcul1GKeShi+weD0uLpFCZXtqHrpClb3yT6d02aGaBd3Lfhfjp8iLGF4jBYWguoy6UVubX
 EXbQX6TwrW2TwBkAUiISrG7HWaKHr7JgYu3eKGjJcvZu8RKIjqr24K34veeLWNCDep75G/exc03
 mufnv1HBshz/7blShZaGY/LwyIZtFWTiSdeF+964dNWP37xDQSYNW+8+s42ljAxZWfGixwnVx/x
 KDfaKNGHunj8iXo5y48lkys6yvgTw2q/cXnqZc/167kXMqAFaEq/vwEBPv+qznyTcNOSfzxOQHl
 lx0HNZgTvNKi6CDqYBO11H7cearEEcLiDSEdqQ1zHberLDrPGXmorJDuJfZqgjDWTekptHfIVug
 p1mbdCVffONT7edk4lg==
X-Proofpoint-ORIG-GUID: sWVh2R5K0mPatAE08pekxLg7FAl1wfjv
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6acdef78 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4S7jAy6oAwHpvZ4QFX4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX0UOsVSriYYZo
 xa/ppoOhjG3npCn3O7u3q/TlXtD9YCAqu+61xQYk/lrR4kOFffh0IUBQCXsNNOs3q4jPlAKGN6d
 Ay1DLs0ZKLOXqPeOmY5b5RwSAS/XV54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 26-10-12 19:02:19, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different TX voltage-swing and pre-emphasis levels for
> both eDP and DP modes.  Add four pairs of 4x4 tables covering
> RBR/HBR and HBR2/HBR3 for each mode, sourced from HPG Tables 2-2,
> 2-4, 2-6-a and 2-6-b, and wrap them in qcom_edp_swing_pre_emph_cfg
> descriptors.  The eDP RBR/HBR swing table reuses the existing
> edp_swing_hbr_rbr directly; all other tables are new.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
