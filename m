Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A454549BD77
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165567; cv=none; b=lkNov5rMwIgukP3n5fq8IneMMv7DcBuCYeh5qe+nsH8eSXS9tqXLQKDoIgMyEMfnURPFxYOzhqrbNcOgzULc47OCdhT3Rx5bpk3Q4n04EjQQGzpb5eNgSHPxQ0udCtxtajG6hIPoogN+dTzoE4po4MckqfBZJ9VdiSSwKquXT9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165567; c=relaxed/simple;
	bh=0VO+6la6VVXKr2WM+/hRiCJTp8YOwR0hvpsSzIUTMys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3cmhpA0qAYsG4nMS0MT+GTT5kvuwgka5lu2rWEqNQ+grioPghE1CZCux/JVtBVj9Bh8L8JKc/LJWj0rreswqY1CudNgdU+9Y3/O7gYgUSQR7sw30kOXE4NAE+Gh//Efuj/YEvji3k9K6UBAfSQxsbdAPyC1rgpaJoB8FO4WRLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkikkWFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNokYSgZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkikkWFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNokYSgZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbcxG2466702
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IWCAXdbt9MLQNW2dNVZ65g2U
	h0XJcuHhkEaIaIxj6KQ=; b=fkikkWFkCfrIuMPYgFh2PBG0gzBE2HOtEcoC+PGJ
	Xz45tVKP/N79jRR1xwzXlaTVy+NjjBRoi6zcCwBya66nbyDkVMwv5SN8+45qUZJN
	1Q+XNHr7fp4qZW1SkUrkLH//xHydwBGioJUfZvfMWi5z+ORSJy8l2o25GfD8rxHJ
	nRFkTwG5NtgqtBEaPiZAleicFL4PcZ6ApOMYnalbs16cQJSTamBJ4pge5iUiSvMd
	ls+Iubb5WH8MjbqIXKLP/XJZSWW2Y7SyhxxDpqYDsFHjQSrDVnr7BVaIaMtUmCW7
	mGNz+gNavws8fXLmW6d68KXgAmsiPT8Ixnzt670lOuU8uw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3wtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:12:44 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9829a8b46a7so155383241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165563; x=1790770363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IWCAXdbt9MLQNW2dNVZ65g2Uh0XJcuHhkEaIaIxj6KQ=;
        b=JNokYSgZCOVYbU6jkpWqZW52OTqSrxRhkhdb2fZZdapMQBTzUHAKH89RlCCvooV6XB
         OND7e7iBiZ+hmrm7poVuWfkl5yyQ/nsG0fAB/XnGazE8vX7pzFWXQCE3aNKlNQmvyVDe
         Fzvh6t6gM6fEVmCcW9Momv3sw7WFsWcZgE4vias8xWpYa+N5ELkMIeHsd0ojZJJy1Qi3
         3CJ/EVGqA23DHdgzmbPF2liqQQtN2WdClgnN5f6d5G4dAYUQLs5JShIGWPQ8wwc0hC2D
         SG9Ke/382IytyDEtGYNnRqypQWY84ZY7NMJ619kWDNF4bIXkZGP5utBHLUyqroF0lEBS
         q+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165563; x=1790770363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWCAXdbt9MLQNW2dNVZ65g2Uh0XJcuHhkEaIaIxj6KQ=;
        b=JGj6XAi1/3tZgkwImxvoGYrAGZ9/YIQ0HWLHFqqMW0vl3TtbNODJGquvWLKeO0Mvl3
         JOqMiZmgqBJanKEqy2EFCmVbDB33Ywz4lURK1xj5KvW8w0kv+pJ93u8L0ptJqESlext4
         oYgw1esYIJlunapKbvY8buKROIaTTjWCD4mjHk4v9WBiTM0ImegwVGsRkkwYJ725ykQ9
         SGVhHAkUw2zeZlF80xdFQl9vb/ArCFiZ3xIHDheXpkXJBHxNzEX4bwH7Zd1KRrjbb1uO
         qW64BrIf/gDnxajz/PZoP60gcmImazkT+9reRr+UioukJs8pDxxB5Ce/iCNhEwdhWo1s
         L3xg==
X-Forwarded-Encrypted: i=1; AKwUvBzbGSLh+fmU0OfTWPYPSIzNHdmu77iQfy4k/JSMng1k2IUQxd7g3aWnfWJh7+Pp9ecGWjcbtLbi22LQuyA=@vger.kernel.org
X-Gm-Message-State: AFuF++kggthEnqK2kqHPM4yU7mqGPL5G2255U6Sd5j30XeUFccC6mgBx
	DNTYz5472TZBBgiMdOo6+rflV1+2rGTrTd9nSUK51G9caKmtd3s67eHEWgZTsy8MlJYc+A/dCdg
	VFSOx1VGB0EFRMINoci2M0NRrT2HNO0sFCzUxg+A9cespDnaz1Ga+1zu36/ShcRoYUl4=
X-Gm-Gg: AYBFou2F3HUGsTnKdfKKNxwXhxHFY0yk9N6k/UyH8CbjTx3hVK6NaM8A8ZaInmdfI8C
	dSHzLqVTyyolkKkFjbFDEyBJo8wbcHuaAoacnunNRTtNBpJVQ8EeEVNR1eSPEoIS2W6Wg4vO+Bh
	ocWBpMb9k/N97IeSr33T4dH/B+ZF4oPpxbuR2/nipFQnhhB3swr0Hu2tSsLVlzxYR6fvMHXLi3D
	pPAJRUSrBbgkwb7wVqRWhvFgPNa5COpWBUSaRPJpV4rAD0coR5F1K3gGjTk4YaruJE6MbJdIrQe
	kOXtSXJlVket4A4ZkQr62HfcEavfiyOLDIsjynyA7rzTE3TAtA/f5UE3d9Tpvd1ciUqhs3+J2Oq
	NJAZFuAWnXda8KRiCI0VWg1Z8KJamqZZTp7StjaIVnzhnSCINlGQfdcQlfqKs8oba1cr/GR6bRi
	rQ2g6KHZUzXsRX
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id ada2fe7eead31-7ac1bb45468mr2060910137.12.1790165563573;
        Wed, 23 Sep 2026 05:12:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id ada2fe7eead31-7ac1bb45468mr2060883137.12.1790165563151;
        Wed, 23 Sep 2026 05:12:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857877fsm547327e87.28.2026.09.23.05.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:12:40 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:12:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/15] drm/msm/a6xx: Fix RPMH dependency votes
Message-ID: <tdjlbzqqpjmpdpkwylsxz5z62zaxceaqnmmi5rqishdnefcfed@qqxd4b5e7ift>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
X-Proofpoint-GUID: sdK1SOjhHuS7vNQh4yh_N3jJEb1PrVwC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX/I1nd+KOxUd/
 Y7/s3vt56nIOBtH9lYtUqUWftZDEfwPpQrnnCFFAutEAtpUHAhFqnUOUe/DUmYJgtT8KSFplw6Y
 W7v36RY2bFlV6RiYVKMhoFQ8Vuxl3jE=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c23c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6T55iVGf85rzv7ZivO8A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: sdK1SOjhHuS7vNQh4yh_N3jJEb1PrVwC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX9nnL3gkKhDrL
 72Kkn1sGIlIBLtzgs083MhWfYXl0dOKq6d5w2g/LqCGUI/S/BUX2SSQvKFID5uE8sqEzU64sN5W
 pWIGV4dcZe5fbErM0+ebRstRGRzh4OjXNO/gy5xLA6g+OvQZc9wopvPYMzI0sLbKxK1l4s6uO+q
 SKu3siUu4XGPBh2HLli8bk/wzCDAikb1eD1wA3rIa5VrEfjzxurox28DaOdBlg1ACHt3+EF5ZQg
 bIdYM9x4Oz1O4ObFYjkNPd68zqwG9L+8Ebw7T+PIL7w0sZASAbuC7hIPqd9m9fKnZ71MLXcVGuY
 zzG6BjzqUc584ar41AoiYg7/QdM2FDvY4AdnGYrX7ROymH/na5DP2O6iQcvG0knWgwQls44en5y
 D51AQkmbSRBF/erTeABjNJIHT421SL4ALw3R6/rCfTVrRC+WwwwMtj1siFg2Ffo9eog4oCGYr9t
 BSejL5ttteLO36AbFsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 03:55:43PM +0530, Akhil P Oommen wrote:
> a6xx_gmu_rpmh_dep_votes_init() iterates the GPU frequency list
> (gmu->gpu_freqs) but was passed gmu->dev to resolve each frequency to an
> arc level. This results in generation of incorrect dependency votes
> table. To fix this, pass gpu->pdev->dev, which owns the GPU OPP table.
> 
> Also, reorder the dependency vote init to improve clarity.
> 
> Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
