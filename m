Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A173A257C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631803; cv=none; b=IoKEtIOIcQJluob1jEg2fctP23N/V9qDBLTV2pM6s2UqoXPm4d0+7ZnlTKRSXOMbFXmcdtktulFnmkUZ2cWoVWiFMGZ1y7r4uiKw8U10VO5GtWUOipl/HCVo2DQLHzuLc33zICOEe824NhMH6yUQlasCu1s4j+cHqFCsaIbqE3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631803; c=relaxed/simple;
	bh=CMYvDPqsLAq6pkjr54jYgkQnfHwz5DtZrlvx4wqgFtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftPoo9Wj8J8AqeT5/8/hrvGzY5OkGsLeYQTqC/Eb9FL8LaDoApbK5zDLyaX+J1kdpuLJ+jqXh+M8B/pxVrWBs1kvgZtgOKuA2TFFgTGhvOqvEgofAUmfpK8JHl+LmI9cXLXceBtUt3B/CzZRUB9qjuRVJzquyFcZIZgcazntnsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC351Cz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFo2oaVn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC351Cz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFo2oaVn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60tUb1031681
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PfClSxRVkrfkzd/aMC38kqBu
	wsc6wodH7g/O5+B060M=; b=cC351Cz3FKnbAmbwF8Valz1+O3Ke711ETI/IspiF
	EV/gAjRy3MflaR3dA98hBp7VpmynY6LvnCUp9tEJd0zGodlV0vvnWp3e8XUHGsxa
	97Shdep2V9woRBLB4X7V+XmbBmWKycVhHPa0xcPmCLu/Noldyxb6h+UcQNNyYiV7
	tjwIQWMYpinQa4pm9Pv2tpBWdY00VvpJ+C/9NE07va0RxsXNwSRmFll8IJ9oh46T
	Vnyaww+Ga7IcftNRYzbMrYl/8IhDwMGQjqDHxQk9jB2Dxd9LUIwl4CYDEFzbQsF3
	XrIvUqsddweiQ733QzZsTURMhp8600BMoFBRp5zRsqIemg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hb5c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:56:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390a2c895bso175062085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789631799; x=1790236599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfClSxRVkrfkzd/aMC38kqBuwsc6wodH7g/O5+B060M=;
        b=CFo2oaVn2R7ZdV13BNp5qdHBbTQKX4/60+lu8aKZTEImQ0JIngNuLjQWQVfHZjpt14
         QTsTgAQ9SqfuCwPApEdgQcm8H/hM8l+pzMPQi3igTEcUunWxrtAUs1K77WUfupZWG51M
         CkqrZYfg4okrjzOVkOkUCV2qJA/PeAB8qAWiPE0DNhDNpuQt3WDwSDvt9U/a0zVNOpMc
         lVJUI4z2cUIlr5s6dtxZqyjvw796pXQWyxPZHR+Y2EeRh92xC/UTfzIy08387yJ6qblu
         2+2sWGihoc/5XNCy5oIYM4hw+MU8OA7kP8XSME4X2+aw7KSRJvVJmFTSnsBXJklHmLUx
         Yn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631799; x=1790236599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfClSxRVkrfkzd/aMC38kqBuwsc6wodH7g/O5+B060M=;
        b=SoxbOY65atMem3NUYJ4YKQ7ElQoOeuY0/HuenEqvVwNBJaQdyn6fETSrqHm9JWI4+D
         rrOwfscn3keKQPnwD2IEazVG8Wg/BFXuAv02P1FHzEmNmCa61fv5r4p8czay8d7POKsJ
         VVi7TGqB0RIx95mNRkXUoMiwSXV1j5ofxVxPOXbtIT2yQO0t9gy1GZsfyMx3y/4AC+wM
         2O6jAb5DsoP+PT5eTo6HHXvs3US0y2MA/X/NWVPhpt+q1jR6dcyBL+fg1YMYLb19bbRP
         t/RoTE9/ALqucWww5//SwkwCe9co9dIGG9N9OJbEi55ncpvU2BVZwytgPc+CnEZUVzUs
         BCdw==
X-Forwarded-Encrypted: i=1; AKwUvBxYD7JTdG9QGVr31lw5KyKxaqMBdNn6paGkIgf+XhtstvUcdim37G08MDqtQRLw5LGEUjE55SOhhMaU6bw=@vger.kernel.org
X-Gm-Message-State: AFuF++lki+K++hAtiq2KGBn0WJ98Ncr0iva2vlYDJ7o0cYNaEs4qXeM9
	fGyiPrzo7KtWPnZYBoRd4+wpYIRBHzdGQ/JfiHQ+YlKSQ/m/K1/ACh5CT5EUAu1/5QJXze2P0l1
	TZIkSeAjib78o8avIm1ulkcWT69UvD6dV5ORU+5W8iuQi+osN/gEEfRF8XMx9GPHe6eU=
X-Gm-Gg: AYBFou0TMdJS53ZsMJ+d3yIwM9rbD4y+mUoQNKIq3M0aHo4eACKDBPkpoVbFrikk3rV
	WT56/7zJ9DtRNXxSJwr4YBYMBW3NaSOeoD3LIhlX0i+4MfJdzit6ogTmrX7f68EoVE830oa2AXu
	FXCzukcYMoKwJJt6eDWrjVWa+9CSC6ixnEt+LJxph5UxxGKdHtrVLhdtjo1wCQW0IsDUCnO/uqi
	9MOaFtIPtky7h1G7a/83Yl1RQUsroDv829Gu0N+WqMfeepuiWkZhvbHdt4myKfE043t4REflKH6
	0ikW+6Bz/HBaHsh26ShGa37Ucbr4KMRYeYxHBDahMifenhqs7mZSzkHgQ3rvWOCA6F/G1j/ZxUt
	jXjggCJ9ecS1gckEJGUEj46yV2qQl8QB/r6IJlpnZLWjTNpYXkABpUAnuvDZkbs0a1iNWv/GTRa
	8z6BQVFwy45MwV
X-Received: by 2002:a05:620a:600b:b0:93b:c45f:9024 with SMTP id af79cd13be357-93bc45f915fmr557190185a.7.1789631799320;
        Thu, 17 Sep 2026 00:56:39 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:93b:c45f:9024 with SMTP id af79cd13be357-93bc45f915fmr557188085a.7.1789631798944;
        Thu, 17 Sep 2026 00:56:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57deda4sm1587200e87.55.2026.09.17.00.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:56:37 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:56:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/29] drm/msm/dp: refactor msm_dp_ctrl_config_msa()
 to take panel
Message-ID: <lo76t74cekbhmigetz5ovb6t7fg2pbvkh5h2pzjbjxmq6lb3e2@f2nhqd4la3w2>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
 <20260831-msm-dp-mst-v6-2-c91d35d6fb9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-msm-dp-mst-v6-2-c91d35d6fb9e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX24n/oe0NW3wJ
 2+2eyNBRzKO4nCXQzhbQpFQcAG3Mdk9KRT1fiDPmp5JPvcs/4FdrjumZEslXFTfgkKB5VvPnlSL
 h7pUd6JSSDyNrHUhLdyOfz4JpYWex6rO9hB2wU3svv5UpUeYhUxwUjGt907OkVTixPmFe7Jz2tm
 7L+yOFHJHn0JEZhuZq6/R5Kpdpnohr93wA9XsbLwkVFGiLfGE36C2sh8JGfQa+Sd4rjm3TWVQ/c
 HG6lyAO2hJeLom8QLm+y1mffs3/FkZQBszd5tM4siA+qVLvbAMbMPnBk32GGfMzLmix2+StW66v
 f3ysGPEVquJCb6TkVZ+RgRE246AKmyi2g5llK/5egUClH8OuKkKXzMznWmSZRKkJGXvkqJhTu/N
 LuVGKyq0JD/weCIFyKU4R8V4WVf10zAK20Qzdfq/ETzfJd3OhezlD57V/wWYGl1iGK23PaXE3sm
 /+UW2FhMLLRnvRz0Ggg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab9d37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HrO3g0W2lMO92zknuLYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TJbeWOO-BxGA4hsV7VEzq7wK9aK4Sbf6
X-Proofpoint-ORIG-GUID: TJbeWOO-BxGA4hsV7VEzq7wK9aK4Sbf6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX2it87LgE6wDF
 /VRXCdehDLoupI4xy6ARyVZfd3W7RyVjFEf5ErVc3NvCOSqYlTOfBEGOfPktA6SuAtmUmzhIbCk
 evv3cAG90rc81w3KtolhU3QqsnDsHy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170106

On Mon, Aug 31, 2026 at 04:17:19PM +0800, Yongxing Mou wrote:
> Replace the (rate, stream_rate_khz, is_ycbcr_420) parameter triple with
> (panel, rate); both values are already derivable from panel->msm_dp_mode.
> 
> This lets config_msa() use panel->stream_id when writing
> SOFTWARE_MVID/NVID for MST streams, added by a later patch.

Please note the difference from other commit messages. Start by
describing the issue or the problem, then continue with the solution.
Yours instead describes the change and then mentions that 'This lets
something to do something'.

Why are we performing this change?

> 
> No functional change.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry
