Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA8C48C414
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808290; cv=none; b=K/b75NW9xtLX8uyBvSIK7Byg+9Kvv6OocpgX8U9SLUzLugilt0WVeo7kWhG3PduVO9AG23XeN2+MWGNQDjh64cZ46dAlENof/8UY8Ntv2KAk3AGCFwSf5pp4FG+ojfxmyhZbtIXo3dLaDUEXmswzKbxm/WOT9gsvlqTavWsFILU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808290; c=relaxed/simple;
	bh=friZCIjXMB43ZyatZaeWUOlL+WSIXupxwiAaNbwCThQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtXaoZDviUCYHjNdNjAk6dVpU9cAHZy6tEGbMsO6zYcK+A/0/D0svDiM1AXqbTvB5cILVg8Sx/qfr/Q/XdWmafn2i89yDwfLDIwXVW3B8pZD1c2vjCB3Lyc+TmhdjtukXEPQ/Bphchj7QyHygkgwcr55b9K2boj/CA+im1PcisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLDoTwHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddN7rabx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLDoTwHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddN7rabx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0V902088718
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h7qMwlSgAt+t7GkDL5quXlg8
	W4SQwFrSXsclHqg7y/4=; b=QLDoTwHGFUkmsvvtd5WYfnu9Q4F49LCyK2yvu+2i
	dGgqwc9qOdFzTCyJTYI9s2x6RwIT/tjtX1JLXVx/c9Xx1evMRgynYJnEDHzSpNqj
	sr6RaxknnrkX4aEvdeM9AC/Ac7Uq6tH4Gq4npUeycVVEtEZWL39CwcAZ3+s8HWxq
	TXPJ5IEXYem699CjJRUNc2ShJn76eiFX1cYcwRkkek8KnH/69nhf6505xMGcgojo
	qIEyzMnJ+PUP9vSW4kP4NtSWj2kOqC8gbXduOEudmDlRnl1ZWuRXy5PKJeOvGE2n
	C+/do2BFt0lpXjmCqcJr1fcJXj72gPnB8PzO96+89JZBtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1w47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:31:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso191696985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808287; x=1792413087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7qMwlSgAt+t7GkDL5quXlg8W4SQwFrSXsclHqg7y/4=;
        b=ddN7rabxxsIcPoemkhLiMedzHIYEF8Gq34LGPmd82saPWk2nygoOw+8D1caBiSEU4R
         RXbM6JeKwQ2QbsWxKKawerR6BijamhbYRDQwbRDxKRzp7eY9GeNZhhlo7gsCxcHGTasR
         JXD3ACAsBVGsi/1ZXtx3zz7VN1/DAfHMc+FX/ZDMdPjvi8CwD0+h2CPo4x0bhWyplZ6P
         tVUjRwYpcxQ6uGZPwtabr2T/qx+0jwqVDhTzkZ2bVrNMT8XHB+5Q+X2cLCd0ahcgq/UE
         jV4Y86JUM/6OO2Je46WU2/SeQeDCA+q/nCjiwGG2FmE/4P1bQqN+tm+FrqOfcue142PI
         giXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808287; x=1792413087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7qMwlSgAt+t7GkDL5quXlg8W4SQwFrSXsclHqg7y/4=;
        b=kx8eQUd0i0iZwiQdCPTSP5iNpx5jofHGqijRTONn1grk6DX+Lxojc2A3X2Sqz+rwDN
         kENXL82TmSQV5bzB31oV5PaZjAWLnGZKhGAI0mO/+5FceatXUkfJ9XSTYMvlYMLRlWr1
         SFydJY09oZP47+S5QOVutwEEiMWVP2yGLSx1mdwuDevaQp6C8ISyW01BzLT7GZsHU1sJ
         6Dj0pXD5UdQ62kN7cfrLAbzmzRgeQlmdawdqTElP0qPRmCrbi5VUxSuLMTih69+Mi3hU
         QvKm3z4DWNquSc0OAFcckpFMWQBBz3o83fYj3sbcq8Rl3fYjD7XWL3QF9Lun29Qh/vFj
         cjnw==
X-Forwarded-Encrypted: i=1; AKwUvBzqyf0Fww36lroXaAz91bdOiIayiDusCIk/aQqjTiA47f9ft2+0rVO+qeWH5BpQbkkarcEzqjEd1/QQ4aA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJZYjcJOT5TeRIFOG71xgxGeL5U4QTJrNQdy0JRPvRIlKHabD0
	CDrpdD5JKm1ziJoPjMsy9YZlhXAjXYI4S5kTDmcquyu16sRd4gpMnrNVzd0VNxGEvXlRiV+Ed/1
	xhFSVeGtDB/CuYDa1nkq5D/FZsP0m1/zCmATJS5rQXFJCVBv2kPrPhlP+750UBZV2MLcLkvEBLP
	U=
X-Gm-Gg: AYBFou0gERLRfTwj1d6LQtb3WYZm+nuMLBI6ERXzyUP9Y/yW5A4UY+/9mehVwKY5UoJ
	JMsu7UAKOxyDxP7oMQZ8phzqSF8IGz45eCTrUUmOFiXSrJgLs3gi96JRzrWsskCaQhArPntCIgU
	GST+1bgFELQJCG/92d6F+CaEHlL08Gu1aYqET6yOPWcKGV48IgsOeloxiQcF+6xCB6flccGNgid
	cJxsaIygNMyBLeX7j02+05UxfKGMitjIsr9h+M06YHjjWhFN64nD/d09RfDSv/f3MQXsztx0HhP
	f5nkFdHCHawRJ4iSpujemRs7/le85siFsxro86p4+atrLrYJBKzzMTtsaMyQNklMGAUlotc7mih
	vrDjBpfBYO1kACAsiRLCnS6Sg6DqD3Oq5EX2v96qhPj0zq+bWGCEE5ZDHtjCBA4gx8rNa2+NuBq
	AZDdnxBX44oPuL
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr986750785a.82.1791808287034;
        Mon, 12 Oct 2026 05:31:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr986745585a.82.1791808286386;
        Mon, 12 Oct 2026 05:31:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cdd958sm28225451fa.35.2026.10.12.05.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:31:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:31:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: Split out a7xx/a8xx device tables
Message-ID: <a74ijgv3bfpgd5gqokwlyf72wxgzsc3642obj53m2jjpxg3g6b@loenpurcl62h>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accd31f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ysDuX-smLMpIrN7MedEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX925/okLvfDFC
 rs/V7OdQFNvRhd/XlLtEccEeHXMbbiW0fqYX7u06+4x5QyzaEpktpL16KksPGvldrjiWGs9OxUO
 Nlqaliq+RJt6xFuBrjZqD9cGkfG6B3KbpuYCQisflFn2802OZ/uOmeUy7KwW95ZjD4NtDONKqe5
 /embSEAuyJ7jcC7KtoapC1i6dmYHsDiQKSKiazwsYDr3KachPRs7tzQHoz0D5NmNqtNM3oPTih0
 PKHK7gm40ms+Rd8Qc0ia9AaQLYresbhN1fzHm/3ISwDhXaXUttUhIPcJBFdymFzidKpN4hBwgxP
 Jwpow4r9OOYRwSmgGGIFeOq/8Ryt3d0e6nVADFIhjU/lUMYDUT0rrM0hpKnwuDqLlm+LTumULIc
 cHSMciyAncblMKAt5439avteYlQlZOAwtFh0gF2VyXCMufhlcgef8nLMV+mhtV2GCbBV8vLZF1S
 2JdJHTk7zODYWXGL5gw==
X-Proofpoint-ORIG-GUID: bc8fZZ3S5mR18gcXHH6ZrCyQTCnhjTxA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX9K75VDso/0fQ
 EwyOAngJk/RHoQdQmoAMLlcBd8ETn6ZyPNixDe3NQorLcQsp69g7hldrsWYPwwxiBVgMR85TbiT
 dydXxUGPQqBeImJuUAvISs+TClwfKQA=
X-Proofpoint-GUID: bc8fZZ3S5mR18gcXHH6ZrCyQTCnhjTxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On Sat, Oct 10, 2026 at 08:41:20AM -0700, Rob Clark wrote:
> This way we can start including generated tables for a8xx GPU snapshot
> in the device table (without having conflicts with earlier gens if we
> eventually try to retrofit this approach, or later gens in the future).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile              |    2 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2310 ---------------------
>  drivers/gpu/drm/msm/adreno/a7xx_catalog.c |  502 +++++
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1846 ++++++++++++++++
>  4 files changed, 2350 insertions(+), 2310 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
