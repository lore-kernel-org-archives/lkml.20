Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478104;
	b=l94dXQjqlKEeqfmwFEsWH+hOWy5j7b+rGeX+9xWTb3ucHcMuhrN/ILWTFSPPoheh2kIo
	 Ld2b/TEG16qDzlQp65w5c31rmrft1oytsG7mRoBC/pPuNTZ5CwX7iAHB6/R07/c8ly7cl
	 YJzxEyvHiUx1sKKOp7PZarGPfz94T74ZNo5Ay3kDXCWMuxUQSBjbZlqsF8bnWRNwuJYOc
	 qaVjPB3zBWu6VoDGGB1KjAkGQMTUCdVGbZLWU/yMQW5DIy8e3xyxI34Dvhxh8wH8VFdAq
	 bAnNuUmQW/71sM30Yes5HS/WVYTdo5rEQ0XynwkzfID8PF31n2PIexKubtP7+hr22qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B3Xi0jd2KnKgrPJ6ep80cd3l+8cBf4DAA514CH+g2eY=;
	b=XEhWBy98Q4xjz5ia7Ro2hLpflyfwacK/BR9QSncKKJADDvWMnxUUTQdw+aDifosi5Ee6
	 SRdEHE7zZwaurcXCQTS9Sv7+QJEaUeiQ2pFVHIsHD61dq0PeOvPSJOYvCym4SOVmHM54y
	 VeqAnL/WdkXSG7NXdHXChmzWv5edyALA4m/LtFdgKRON1n8cCf8ZZTkda4XXqSi6gvoMD
	 pwE5bqxDk0BfCe6RE7uO9Pk1YbIDEvDZOnCH3eatnshul0eK9+9fKoiYdot0HERhqQfHq
	 g4Luz6FIRUp9yjB/HCSUerDbe2ARKD+lKoIALHing8WKIHuCZ5ckwOImzIRgE1gErPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kv4OSASr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMHyrNKS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB9F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB9F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kv4OSASr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMHyrNKS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJEq3d2968834
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3Xi0jd2KnKgrPJ6ep80cd3l
	+8cBf4DAA514CH+g2eY=; b=kv4OSASrS3Cpiq2h1eVHDFVrHfu35u0+0ecLTj2Q
	aExk9rf+knDIy8Ltfu8OZ425fp+lHKY57/8876eOh6fVgg4FDVN5dLmAb+E2MTqh
	bHRfoU6CBKwYM655l/oQlUrX0w1NEHMvTC1G25M1ztdj9yuycmAS01IoJcE3UPRD
	JoGlElNz+wBWLHqDxmGv3qd5OMrmpESTQYlux0gFE6vzh8nOp36ob/W1nacZ0r1r
	gnMTyZRMIn1enExLZnAVVxQvSZw4g2KVLIlYY4NW3qhF2NpXWUQ/VNbegbsykIb8
	8zni7U1/cqvBTlQiSvo2Om+38WL1ioy6cv++FaON/3k7NQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjcyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:21:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c0f73807eso24110696d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478102; x=1794082902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3Xi0jd2KnKgrPJ6ep80cd3l+8cBf4DAA514CH+g2eY=;
        b=TMHyrNKS4JNc2PKDEJDsCNADGsjLHcdBaSCdjuXygtoLgh3+lhNNF0x5v1mEfXdf6L
         HZo2HJrFk8ZeX6oSfT/7OLgis7CLrKY7+mH1xLxkHX6ObopRhde/+jv7kaZYshokEDnN
         n6ntARSXgAt8OhtWU9Gkbotnz7zkNgCegdc3ZVvOWMJ58BVn7IZVWTqLZhH3MnwFEWqp
         pCwt8Yg0OiOJtA6cVryAjPV7P0xbYmxDzYx0a6rV9kmIpcjKLNmYa8mBVsagfYOqJJql
         opaAWG7QqGI4pqmN7QtpIGO513pkAZuoS+lbYVZOrdB9z0Z4/ahXWGKkRHsj0j1c5Ii3
         HlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478102; x=1794082902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3Xi0jd2KnKgrPJ6ep80cd3l+8cBf4DAA514CH+g2eY=;
        b=zdzET2P8wq170inmFJ1Cyv6ZqhdDv7ZLc72riVdhtTL8VqU3xnD5puegoqEBHd3j0+
         r2eNOuVJJLPDz+0GHg/RY7GabGRrIlPdNrGAj4SJzHcft1WGwoBWBpHxMRNxXN5IDPjT
         rrpzYVd/PKnhTK8ZGCwnfyz/DffgIGWLfECggfBt5/ZrmicfK4lXX0w/otVYqABYziq+
         0mjvaPZk0YTfddszhLdbMp0yh69Y4fujlFHa/t/4YFiMwzglkfeVrWXr4wqQDJIzB3Qh
         Aijgx5b1VkyPlMEXVs8Av8VMrfHoSMBWrOUkaMvHvBhhebp6RpPJojIXyCMnYSnB/iNq
         f3kg==
X-Forwarded-Encrypted: i=1; AKwUvByCKXx57EBgk0wPBrIEAb8hwEhh9BQhQjQ3RmUyimviR4S5Bt0GEvuuisRYJy++ftM0JF9nr6mi0IdJSMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLai1jA3Va0d1jKPmeF7o3CnkbRBDoRAjeheEmB1VPfH2Xk1is
	86l1k8ePGEpKxGGozmSGnDUal0hWVIFPUlAg5TFaBRtW3abU9AImHLllOJ3J5gLgDLvDmmhYXxY
	5w+aHvFNSy09qolIsD91PDhGueg0yI3jojJriY4sb34i0p+9Kp9I0gyy7vKOa7infyEsbMaHLsH
	U=
X-Gm-Gg: AYBFou3vh7XkOHqDFCdpak+fz26rubm/8YvfgUcPzpakFwSOe6+2pEkfF5P4Z7qVpqc
	Nmz2tjhzRXOKWACwShZQaWdn7i+SERc7zHSqCzuXaN+njG30/b9llFflZxnpcZHP/SRfMMBfoMp
	XsCg2PYwEDr5RXV/YOH4XlRYY0b3qMr/QajXLL6OFYw9E/YYQg7Dk4LndQR/9RfL+/UbBHZYtm6
	oogLg69QhfktAv4csp/AMULJ7MtVamL0vtYknwWfBKKTUt+LQ/I7SrWW+iWv1Wpt3IVVfI1TkTW
	swcszzjPztwh1dxIeV+OKjcx+irJI23Fz1qKrpZshJqXDBZx2U71pu+vA2AgMjMy/ynD13Boa8x
	UQ8MPtECrcwbC9+UuuRasIoW7OdSIZpB9tu0DRcrtnLTk8RBNZXLdGrRxEgX5sABwojWF3o6CWH
	vrevga8eaz8XCzJBcMYWZ84UCtv6AJlc5Zf65OwF6AdEzbrDyMjIGSQsj5LF1bkQ==
X-Received: by 2002:a05:6214:4902:b0:91c:60e8:a8aa with SMTP id 6a1803df08f44-91ca4baf013mr85236206d6.49.1793478101602;
        Sat, 31 Oct 2026 13:21:41 -0700 (PDT)
X-Received: by 2002:a05:6214:4902:b0:91c:60e8:a8aa with SMTP id 6a1803df08f44-91ca4baf013mr85235896d6.49.1793478101049;
        Sat, 31 Oct 2026 13:21:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbebddacsm12698671fa.6.2026.10.31.13.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:21:38 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:21:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/msm/dsi: collect bonded command-path data into
 per-SoC config
Message-ID: <j5ixobskknatvusosmhgvvmnze4q67iyfwk6gsa3y5goovx4z4@mhumd2vsnfkm>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-GUID: d-fCMGdYzX-uOu0bbmJ0AEbNkZiuTgZp
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae64dd6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=CeVSD1skKhO3MnvAeOMA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXyreVhGkLi3D7
 N+Dn4Olb5Eq7ag8hX2JdTaMICWDtosCUUW8uSAeEpb2Fy7fSBP2wk6tv4H+UgyaZl035SJBYbyP
 /euVTCVN/h1qmfk7iJ9M27J3Or1+Ios=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX2d7nw/MnDtpk
 yJGPnZ0a3x4X7zwAKUxiqTgtlm+5icndN4GGA7TVwBTsxGQoahyeBTHlLrPgu/wTnuvL66MRgQD
 0Wo0wO/N3jrfxqa4oc3ruKJJRqR3Bj55YhX6zizDcHq4ZS3xwQmpH6WBqIFQJKoGch7WUYSojS3
 u6iE9yRNim52E/KCA2buDx68OssxD0pzrwfnv/wsX4Yvbw88l+LnwXZxXegP/TobUPlx3T74dWB
 JtIUpQfjZNf9HymsXAjpxA8ZZLmo8heh7R/BMPud9AxSZ6lyFBXde2adnpOdyucLd6uTO5ahvkC
 11pdssCVOn7QGZSHjIwk/tQVGPwcqZERO71WI4WML7PpFVomUXt+iXh528nrBVVeN3jRFWd7QKF
 E6XnTG1QbnBrA1GIIJms54kK053ltQC1JSC0bE6ZVbh9LUJ7cxWsSmJXVWSKFJBE1fMV1MO51oI
 oTvH0O4BrATRG8K9VEw==
X-Proofpoint-ORIG-GUID: d-fCMGdYzX-uOu0bbmJ0AEbNkZiuTgZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:00PM +0800, Qianhui Xu wrote:
> *** AI-assistance disclosure ***: this series was drafted by a coding
> agent (Pi) working from the author's design and measurements; the author
> reviewed, tested and approved the final text. The design, measurements
> and decisions are the author's own.
> 
> The sm8750 (Lenovo Y700 4th gen, TB322FC) uses bonded DSI: two DSI hosts
> share one bonded link, and the master is decided by the SoC generation.
> This series is preparatory refactoring of that bonded command path,
> carried over from the vendor tree:
> 
>   - 0001/0003 move the bonded command failure flag into the DSI manager
>     state and route the command path through host ops, so no mutable
>     bonded state stays file-scoped;
>   - 0002 collects the per-SoC bonded command-path data (FIFO error mask,
>     CMD_DMA_CTRL bits, peer poll budget) into a new struct
>     msm_dsi_bonded_cfg hung off the existing per-SoC table;
>   - 0004 takes the bonded master link id from that per-SoC config
>     instead of deriving it from probe order;
>   - 0005 names the FIFO error bits instead of using raw magic numbers.
> 
> *** NOTE ***: this series contains NO functional fix for the Q28 panel
> issue. It only re-homes data and names constants; behaviour is unchanged
> (patch 5 is explicitly "No functional change").
> 
> The bonded command path that this series re-homes is the one the vendor
> firmware lineage on this device (SM8750) drives; the series introduces no
> new runtime behaviour (patch 5 is explicitly "No functional change").

I'd say, I'd prefer to see the reason for the changes. The bonded DSI is
seemingly working today.

> Gates re-run on the final series:
>   - checkpatch --strict: 5/5 patches clean;
>   - make -j26 W=1 drivers/gpu/drm/msm/: 0 errors, 0 warnings;
>   - the series replays cleanly, in order, on top of 0f1fb1c9c1.
> 
> Qianhui Xu (5):
>   drm/msm/dsi: move bonded command failure flag into dsi manager state
>   drm/msm/dsi: add per-SoC bonded command-path config
>   drm/msm/dsi: route the bonded command path through host ops
>   drm/msm/dsi: take bonded DSI master cfg from per-SoC config
>   drm/msm/dsi: name the FIFO error bits of the bonded command path
> 
>  drivers/gpu/drm/msm/dsi/dsi.h         |  21 ++---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c     |  51 +++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h     |  30 +++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 123 ++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 123 ++++++++++++--------------
>  5 files changed, 249 insertions(+), 99 deletions(-)
> 
> 
> base-commit: 0f1fb1c9c1c8f09c711e8e9a82acbde2baeed691
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
