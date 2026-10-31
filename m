Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483274;
	b=jFnj/d+wumEbhFKfmJKCdo0ihmAAq4KMF2bZxBwjEQgPxhOarIRVw3TQZPwyS2puFIyc
	 g0m030DqV6bhsviuVtuhpkin5BB1MjVGzUzvUwhJtx32AVOUthqkT1t4EfWdLgTuw9cWG
	 4RH/Nt7bC4Y/I8akJ7VZS7O4sCkIoZCDMyEoWOnJ/k+FRJ1XShXJwqhSysAZMFIChaIDb
	 IJYal/iOnqZqcrfxhDFBcBnjWYKOb6ZrGz6qjd96Dgt7KVGUY06qlHzf2LR7lAOt1aBDP
	 J50RB7+Kyut7Dm8owRbR/1WwU3z7XwDcJvXnxMl0H6a/CN7MJ4aRKaecAK/ZlyBiUwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
	b=WZJYLIwOclnYqvsjuwVctEI5QnYG4lsNbEFUq+/mdhqyX6NOMSfVeIcZ0zfOgv+WSqUY
	 9Aj46/mcDDhqeusrm9zOK2Ks0NzTIzs+lJXikawKtiMsILVJrSaaR0AqG+5Ta5CIpkOGi
	 rzZj73dyagydzehdyFoLV1KAOMZc+Yle2nwafN9aeEC6mzSuM8+7iN28v6BbhgPmTJmej
	 4Yunq308UYOVZzcvq/vlIQZczIUGFW0Rkz+xKBWjB1LkRETj70b/IVW2Q2cr0M1vpLzb2
	 /UabOmBd9ENUnjk1WeMLgVG2Qz2a74xwXq4SFVLD5qWDhxYgam+c48j6Wk4hINcy7gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2SSwTqG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjBrbGBJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCC606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FCC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2SSwTqG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjBrbGBJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFE3I2398595
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UqYmn+dWGZ+bizn6nanBskc0
	M3ILH51untQXz8qg9Lw=; b=M2SSwTqGeuA0H/yPvVtef+Mp8xkHwwFekiHn0kBD
	IXkY8io9I7OOYrQNJc9veFLHQb/MO5gVqbJ5k0W/pdOnBUfT/j1tjPj2FdmaR+X6
	VvCxH97ZunhjVXdQFnvieF2sLRVVX/hTfOBcMkH3nuOVxn4QgzIJt1xrERdxXyOs
	03MMKpdvcPhhoWPCgvmJS4h8+xe0kGrSxOJ+Dix7JzCr/EMKLx78H0/zKj8ugeEb
	yCzE9/SlZ2sSogLTZlqalPlDO1WmzEuIcurm/8MOhU4MpCXTNVh6WJtR81AWSksU
	PBQuRM6eem+E2fV3GqzAYiYK4JgrlP9tWYQs3mYgU2zMVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ej09e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:47:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so345621985a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483272; x=1794088072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
        b=LjBrbGBJE+MS6r5K3/JcH4yrxJaBRxVBEF0oxUcYe8GCIkxb45rQ6JHlhkFKjZDL5o
         ytEuLWQ/ZHGpcQr/j7ymTfjwMM4pIwSnoTFTpfQW/76wPKTUC0OpByUpG9NPNfUPF1u0
         5fLQXFlBpDTrzi6azjEJxe84rtkOq6Vq1KttsoMzvCueRizoHxV9F6sASUJK9aTFgmlI
         sO6/WsOO1Al7I0qpkDfD0bExraem0jyUJdZITNaN/AHgCfz065F9gTab/U3T7hYVA2RE
         NqtY2gxowlCDfOPVHKZhqSo6WyCrZqVByrQN4Fkbo1ROqenHPwMUlwbeh7LMmDITGgVu
         /qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483272; x=1794088072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqYmn+dWGZ+bizn6nanBskc0M3ILH51untQXz8qg9Lw=;
        b=H4Z1wPNF7P31CO1h/iQ/5s4O09HkDLPZqbmIOOnLzEiRI48cVWloY/JrH1FSkwVBcw
         RP+GnmcjHgdyZMU3Q96SLRjd8XQd+hCODApEH6uguOLEq0GdY6Ddngw+PGjFcTexjoPg
         CWWaTfFRCpc99IBfSGXrPkTBXDGPBilwJMsAOkkix3D+YXxHhPTXjxPeAO8Nc6jxkLQj
         HxpzVomtNsx9kWSQdO+GWwF0K9+x0+QMT6SPD5HpmbBUVMCECGs6fnLdKMqeEpCMKsjc
         ZGJdyN+kxX/A8wzz1AkliYYC88wRe7w9OeTtt9o9iaNV6oAqq1nqIammC+EHdMmKpyf0
         kx5A==
X-Forwarded-Encrypted: i=1; AKwUvBzSwXBVGqpChlxqJWd2l4QRnu85ZlbEqP6PYEeKODn7aS/4jmEj0zq5l8NFmkVOpGl1k06Je0+yTz9hDhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9j4Z3VfY8cnNBeYXjuBRXzinc8740jJBU8eLTSohd83nFnoJq
	Qmj0vxVdhuyGjDm1EeCIAhMQZ8tDA2suL7GhXzpTOlzHU0UJb8DFp0zlSzu9fFqxF2FIAMH7fzn
	hW8+DgRyy5rURJUgoiYGisGM+IM7AncnthPFWmskmHAF6cKTFgIe8x4mRNx2Zi2aTCwg=
X-Gm-Gg: AYBFou1Tb6oOy0Jb2sS6yDlpHwawvs1IuSNFeiytWiXzI38MR4VNEgoHxLbTLi8lwXX
	+SAyAir4cBPuJzJi7nGs0SdTNYWWZZ0A7bXDB5821dipSjBWk8VV33Cn7UDfLZJqZO0wSWsHo9R
	uDU9lCZLYeDB8+6aC+4wLqf64gMpxE6k+Zs3vFLj45Usqsj3BGW8ltrzWzVSbZOsCNQmlCbBCsR
	c5Wg9l/TlKPdAyjTqiwtASbpQ2p+libHuYw+oK3d2dn2os8wlemf1vjQqSwYLNDNnYu+Qg77PBs
	BWZLZ2RSM7JtiMQiKlxpyubBiofi74j4TdMQb7z8zkrwBKLd132/VOnkfmvCGXC9km9qVTXpChr
	gjGlP2H3wx1UiY7KsPFWJiwXE17rRenwbc1hrtltdcP0c9r9tfcslPuaF/t0KXD7DvhYoGadhOj
	PqT3PtA+HVTxqJUFs49iQW9nGsgqJvmhIAiWWHA3VcTRWBfvMvlNpBnFp8yvWX3Q==
X-Received: by 2002:a05:620a:28c7:b0:93b:d7a3:45cc with SMTP id af79cd13be357-9442178def2mr985863385a.53.1793483271689;
        Sat, 31 Oct 2026 14:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:93b:d7a3:45cc with SMTP id af79cd13be357-9442178def2mr985860485a.53.1793483271221;
        Sat, 31 Oct 2026 14:47:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm758554e87.1.2026.10.31.14.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:47:48 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:47:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/msm/mdss: reset all block resets described in
 DT
Message-ID: <odog4t5j3y7j4tatqsiywfj27iufeazkzp3vtfvzce2knct25n@ephs3ngmt2i6>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX9yqjMXZFU8zc
 Qn6qyh/pBSdTUmwiwzDah7QiSh9vMWLgOfH6L9xriwZ7KR405hUC2DdCe/FuIkCV4HhNKPFysbu
 ieP6iUVTc4bbC0rNussnoHID65W/gfNijbzwDa96PMEm/99Nql05pGWkiKJARmcUeCF5d3hwp/q
 QQPQbXNipQI/7qT6tW7h2wN98C9l+vm3KYxiIMPG578k5EuqV/naYtXreAnzjyH9yinnEIBRS6N
 Pkt+7m0XzMSeWcK+LPjAJDNCaQnfzENIy5g6So+z8u7j0DZbz63fCWd1RBEoeGhZgBgAccR5dQR
 ThUOzf1De17Ypo3eHXeL5KKzFcmFmf0f2DkyzewFlXBsOw4tvsi4UVOOuuBDm6a0YXIDcdt3xjE
 o/zxBBp1DajM0O/ySHifPoI025Tk54n3KuWXPURaIP2PX4toIu84EMhxfDmbwxT3U0D6Jzu+bO4
 V5UfmYtLPHKzTd4MlRA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae66208 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=XGdKMLjMlLx_IEht72YA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DqHPTdFO7kPa0TJDH8SJhuc2OhtuLMlm
X-Proofpoint-GUID: DqHPTdFO7kPa0TJDH8SJhuc2OhtuLMlm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXyJ583ssBhA5J
 AGWBcG6nsQuqad42qJF5rRDdgewjqEtNJzlUKqKE05sK/7NLMfke79ryGoDCAkQijrDg7kAYJbC
 77UGk+lPGUQEzdzf993+i3ATp2oxSD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Thu, Oct 29, 2026 at 08:32:37PM +0800, Qianhui Xu wrote:
> msm_mdss_reset() acquires only the first reset listed in the MDSS
> device node.  Platforms can describe additional MDSS block resets: the
> SM8750 display clock controller provides resets for the MDSS core INT2
> interrupt controller and for the MDSS RSC, which can be left out of
> reset together with the MDSS core when the bootloader hands over with
> the display block still running.
> 
> Switch to the reset control array API so that every reset listed in the
> device node is asserted and released as one group.  Devices without a
> reset in DT are unaffected, and for devices describing a single reset
> the assert/deassert sequence is unchanged.
> 
> The resets are driven from the display driver rather than from the
> display clock controller: the clock controller supplies the MDSS clocks
> and power domain, so it probes first and has already programmed its
> PLLs when MDSS probes.  The block resets do not touch the PLL registers
> and no display pipeline is running yet, so the PLL configuration
> survives the reset.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9087c4b290..59343987bc 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -306,11 +306,22 @@ static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
>  	irq_set_chained_handler_and_data(irq, NULL, NULL);
>  }
>  
> +/*
> + * The MDSS block resets are driven from the display driver, not from the
> + * display clock controller: the clock controller supplies the MDSS clocks
> + * and power domain, so it probes first and has already programmed its PLLs
> + * when MDSS probes.  The block resets do not touch the PLL registers and no
> + * display pipeline is running yet, so the PLL configuration survives the
> + * reset and nothing visible can glitch.  Bootloaders that hand over with
> + * the display block still running (PLLs locked, blocks out of reset) are
> + * returned to a known-zero state before any display hardware is programmed.
> + */

The comment should go away. AI agents like to insert lengthy comments.
they are useless.

>  static int msm_mdss_reset(struct device *dev)
>  {
>  	struct reset_control *reset;
>  
> -	reset = reset_control_get_optional_exclusive(dev, NULL);
> +	reset = devm_reset_control_array_get(dev,
> +					     RESET_CONTROL_OPTIONAL_EXCLUSIVE);
>  	if (!reset) {
>  		/* Optional reset not specified */
>  		return 0;
> @@ -327,8 +338,6 @@ static int msm_mdss_reset(struct device *dev)
>  	msleep(20);
>  	reset_control_deassert(reset);
>  
> -	reset_control_put(reset);
> -
>  	return 0;
>  }
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
