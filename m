Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226624C33DE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850417; cv=none; b=gm5kPCBAFX1YhcpzsKr302U1fkaFZ2yrUx0cfcNGihSdBscC6rLMBUorrQIQLTaVIJp8bhMjZ+h5JL+8P9IiHBcJpJ20f0wqZwxkigQJ6jcBVE96StQSXdSCqOmAM7zVma68LMwUyFGwYBOWNwE92B+KRpUnBolVXwf18eRAJuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850417; c=relaxed/simple;
	bh=eohuNh6KlNYRYQy/h/SpErgS+IhO/ceGUJkjacyVjMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuT/jxaj+tRuMgqAVu395J3y1JPefL1IENxgPgZCxWJJoWWLHWmzKTIm6eZHhB91Cv9WxJitMty++fYf/H3906HW5yuEal2HUP11kfW4ij3/AlOk0ZchGkgHuXypkOuFRzS85Jn7Bb6U8bf6OmQ8hsiVlieZzX2K3H7tn4lpEMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA5UQrzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISOAK7VN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA5UQrzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISOAK7VN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPpL2887745
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LGpC/EhxnEGpBcoNZ1aQac6B
	F248lrL0gT0U/t6mP1o=; b=aA5UQrzlLnoThkJhlyAMOr2bKa4Rm5K5KhoElpQM
	Xe/ATA06pFATQKQZSTHfQ1uIpU+8Y0JPAirK4ObY5jERCFoh4gVFarcsNMXgCC7I
	eLCs1Nc62gtxYKIYbftuJ8sZyyN0D/zOSrxQuuI+4UztlPvAyrS/L2omqGY/E9pU
	PNBvFfQZWwPgdFF04Bi6MkjBDcVKv6nM3VCyhcsjJKe/M7M/OvMt9kEnyI7dRb87
	u+0RkOk0KW6oXEezcChrYoZhztxYV4DC+o+halPYYxz82erLNeLJ0rXj5uacwz9o
	lI7ymwrSqF7pZQ58DWZpxXx4Y49zxo9Ng4fJRqO76HkHvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tmryk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:26:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso1402722785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850413; x=1791455213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LGpC/EhxnEGpBcoNZ1aQac6BF248lrL0gT0U/t6mP1o=;
        b=ISOAK7VNrbOzhd6swgQd0Am6QNcO4rG4FKbSwZT6G5PizxnkRQKOuv/V20Yu+UXami
         3Y1RWvM4fdl/80nChBHhX5UMQdZWp78yCDesc4bRkDy7qQS8scxUofLB+nZKmFTm0C+r
         tbsFxerZ0Wklt1OkQxb0FPSGTNG7LOwLnkEAuwoqe7m+23herQK79gpKOfKsnv4k7a7/
         2FwnZKt1/JBf5Sj9rkWsPvhocazXVKbHzLLTzdE41AiHeHOQxXCtUMhcWe/Oh4f9sGuO
         nyOunKpF/7hiCy0Uuz1rQZ/ylOcdlNxuyTVAJudn9xaRuj3SJ5Trps44wVx2T1FZWxEO
         cq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850413; x=1791455213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGpC/EhxnEGpBcoNZ1aQac6BF248lrL0gT0U/t6mP1o=;
        b=RUF8nu4xoKCjUzT+LWnG7D0HNnxYQxj7wn8DMahAoW1cbQNbtAQmUHkvL32UAmELWq
         rStkqYITeQbrRIYeDAYR8AD6lgbfzT3iYo/QrwILGbn4zdE+zRs7zL15AnaEp6iUu0zb
         m1h8oHmA8glVSuNIyCdUXK/g8KYY1ZRFWN431E9r8jazzhfLCaCGCXuadb9th2MfUvRt
         BqQPWP+4m0hZ8borka/7Y0Xfvp96IGbB9QhWPH/tXPPD2UW/jtO7js0ignYHQsO+b+Kx
         tqxGMNlHkNSI3u1OsUDPJLh0Pipi+QnZkIiIlVP1S5qhRS4RJ+u5k1ccfvpM/F1aMy2V
         nIMg==
X-Forwarded-Encrypted: i=1; AKwUvBwIN7YptaMOQH9j1OqxaZ5q55B/rW3JO7i0IJcXIwhfU+VHDb52sddspdoMxjJuy+gGNd/x/JCHgX80kzE=@vger.kernel.org
X-Gm-Message-State: AFuF++ltb+bNXQCA+Mq6xC0L1Se2MVuahtPYru/x1v5SsGA0llnmfnbf
	0FrYidojkWwwCmR/f+bLftBly4IIeFyi2bLaDed89LFMUgK8v+Y2B76Ew+iBIasLVhKnPeO7L6t
	uO9CMaViTNkgIW+BwAvDqiy8xLCijIDCE15HE3WtPeWlvsK8xRCGTzPz5R94qhQIiFb8=
X-Gm-Gg: AYBFou1FDVNFW2/KjYwRf7aVTnSnQ5oKN2jFujASs9LLQHmLBEDcjOuzmhxZPdhlJwx
	QRvyqAaSlmocrSe6HI5txPoZXTPGdZKER7BfUzCs3jGOJyHBUKfyz1OaykpnrvW7Ie1WhOBtrq1
	GZTzfD7zg0sC82bb5NmN+ByApzSI69dJ1PVPABAjleosxg4/nb4EURsssuiwtxUHVD9j7nzY9iH
	5lkFrTncpTbjdayeMSCOf1pri9ss4JdnWRVzO2pI8G8Na/RRaGrpgRwLPn9SoW5uQ1bYQMj2cS1
	T0Gw/Xri3ZYvAVH01xAezYmOF1IPLiPgv9XG5O+ZO9rXsnX0bPaTKgecLOYjWsKdiTSmXUDCtSh
	QjNvK6dHv5fAogrzpjNQg3u9HgAg3I56iVQ20Hzvf/VgFYP2OQBMFwxwOnnydmND4DwNe5JuKep
	0YOcqZWqJ6DDQ5
X-Received: by 2002:a05:620a:6c85:b0:939:e93d:a66e with SMTP id af79cd13be357-93ca96f4d85mr760518985a.42.1790850413216;
        Thu, 01 Oct 2026 03:26:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6c85:b0:939:e93d:a66e with SMTP id af79cd13be357-93ca96f4d85mr760514885a.42.1790850412679;
        Thu, 01 Oct 2026 03:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717f1983sm15528721fa.16.2026.10.01.03.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:26:51 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:26:49 +0300
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
Subject: Re: [PATCH v7 06/35] drm/msm/dp: add MST stream register definitions
Message-ID: <kum6ib5bbkx3whaxlhhcuoswwctyi4vj2ya56dastd46jj4cyd@hh5ygaikys7q>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-6-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-6-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX0d3E41nUI6Nz
 kcN2aOfrj/Bw3fQv7uWiUjHpMIvEO8Z8xWJj/jLyCDVNZr1qaDtOlgVBqHftGyNVNuUeqv/oZ6q
 XNvTSkgzPW9twmlF1cNCmgwgo8Nzvgc=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abe356e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xXsHHcRzK17jFORm5UcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tUzE_iLtmWDw4SZWSzYRHySpjOrBY5TG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX9wPvzjatKMdS
 xeOC8RlotigZa2RDpNEQLDc/umnDwAqdV3S4Slo7ZfNI7Q++bQj1D3Qgh8HKSQh9PXhuz68ZRca
 V+X+PY+bYudAcQijI+mpxDSAkjCFqKwGoiJZD2PkiyukHuTG8fYdzj290Mw9McXTrpljtbycuCR
 YArWyb6G6fHzZHRak6JhAXzAzuex/ipflE1eZTya+lkbBwNax0Bmhc5hG5gNKm5CI5BEzU4pyCf
 Q7RLYlY8Q2zQHIajxSyrwhVagM7A/wTqOpH8qrl4YFPIfeD0t7hwu4NFlNlrbNQZKL3AnsgsxK5
 +DSYJziWUYYAsniu6zvE6EWaqZtzdABaUa3Tog/sbaP4K4pVVhkjdK+Zb+sRKKKeyYA5vvFmU7N
 mkMQWX9vxd+EggJAldAZffduC4Fxtfr1+yt3ZG7GzjoFimigPa2KJY8+EKQA3htALQc9EvU4evv
 K7hFbDtHG5LFBQ5wGvA==
X-Proofpoint-GUID: tUzE_iLtmWDw4SZWSzYRHySpjOrBY5TG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:30PM +0800, Yongxing Mou wrote:
> Add the stream-1 (DP1) and MST-link register definitions together with
> msm_dp_stream_reg(), a helper that translates stream-0 register offsets
> into their stream-specific equivalents.
> 
> Keeping the register definitions and translation helper together ensures
> that all supported mappings are defined in one place.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 65 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h   | 56 +++++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
