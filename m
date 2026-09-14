Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554023E0C5C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427328; cv=none; b=kTGNkK8UzEqAFMqqRuawHnKEo5+IPAj+r2kexdwzfR7sDL4+Tca+JafxY7SyS9LwhxzB6MCd6jcYS/1Z52GGztW2pQu1EPQ3N7em1hCkv3PDrP7MwBPNDZyreyIRfE5iADdKwkiPlNFMC12MSz6jwGPoOibwpXishZR8m4jWHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427328; c=relaxed/simple;
	bh=MM4HmYEslwlFT8HkcEYriN+iKsGM8sUFm0m8up2LJO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBMmYBjjTY4G6QWJhasn3W/1P/Yv1A33KOEV2YYY1KDy6m3uEAgMf57sLLY8O50KjpwqO5DejSAlzYQUfZTiSp7QUWUrMbfQhA2fk+3sCfsWwhcSi5cQHsKWnRk5IV5NHCPQL58RH8ybcTVK0JZJNrTqP4Wnv5g505d2ElhxCXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWYERCwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qnfropyq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWYERCwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qnfropyq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN0IXa1440935
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EOf9jLDathiKO1GdPmBUWCGG
	kUylbrTzUgoCUbTBCZE=; b=CWYERCwErA9YwhYo+x2NFwrUzqRRohzsoxsqdi1a
	95MeXnHD1MH/ik6G9oONeC1tThhdKaRMj1ngfDplCwnOWI226dqbLP4lFEeDg/fG
	6Cvz3pFB85SdkdccAYBTibDxN05WnUe/QbLbJf9MJWz0Nx20vIsi16L/n9mhwjL2
	s0ZQeRgNJHf2ahzIVZQjuU8sQsJ2Y3bD+6fH0Imm2kZQ6z2DXiiJr1oT7qjYE6Cv
	7u+1iP5g84Sg3fhmr7a76kJKDQNvqPv/ZOtiNXqVIAkwrc+PGn/4j6NtqFbczyvD
	UAZ0jCXrn62A285mppAxpCuoFQjQweEA4LxxXHMvTKgPQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqay8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:08:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-785827e6073so887038137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789427324; x=1790032124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOf9jLDathiKO1GdPmBUWCGGkUylbrTzUgoCUbTBCZE=;
        b=QnfropyqyoXkaay8wEOgR/YVLdbvU0SVMUX8eRmVJyNxpH2Ksk/l+EPzPCOcLhAOjU
         Ar3ffEDe1CckRQAZJ+1DA26EUNacRBPrBhLOyDOo0YLIiaUzprGzRBDLloxs5DKpfRpz
         jPu31kLiQ6QLs8Ro9TfjfU7cpqkcrLBtYzXdVfFXAjeo+9OSYbnqjgIAOY/IMCkBYB0q
         kkN4QNxvefkbZh48Upz3ZUpaVo2Tm513DYWtCyeIuqszINRKQN94EbpsNTCc2FA9J7oJ
         3wyAMyfN+h7VLj9LhTZ5B/hwM9sbWJjAGydVp7DHyee2DeDZKzl7X85cfAcWU4W+uIMj
         OkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427324; x=1790032124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOf9jLDathiKO1GdPmBUWCGGkUylbrTzUgoCUbTBCZE=;
        b=WNZSem5Yy7r02ozdKMHt+LBx+hX3qCXWSjy6z+5kJ1Rone4ySlYL35uWFmj+Qky6sA
         HH4wHNwZvW/H9C1F/neqmG/KE+wg9FlHtEC7f0gVBrWRX8s7/5pcTCcikV/5T32EWbQ7
         BKDUKRp5VzpC/nDbZPEu++Tx34slJJ4LIndfaWiHS/QqC5A1jIAzz+wGDH/YOX2ktI2I
         xVsDhCmUlVNlQ0JxuYQOrVRpE4VSt7zR3RiJdZu2ynHS2XTZIdp/N2MReiZPyQjrVUOP
         W7rKJRzDB7kMgHhyiLOoc5uny7V7Fb+4Pgo3aPfFWdXBRgYwzMp1PVBzkCHxjedP0pEa
         t+8A==
X-Forwarded-Encrypted: i=1; AKwUvBxBcLRR16ZF6y0tMT7LHeNO6USKdWp2ij1UlHaoT5MYxSr/xsStxnMe8uED3KrR7BmIpmz7MLYmkZ+7YFE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVx3nxDghxbzP6fASksk5tDYIWhQS3mZTO6b5eVYYNGJHWljrX
	QwhwkOmxJq3JKeWj7zY61z/Exq0cnP1IvtvmKph/R6cGxGOE2T1NvKdiO4MCwQqDe7u+OQJRKqb
	csGWjMA09FZeSf1A4lNa4Os2ByfYH7bqp0l/GWrJ+a1DWcNP0xqZqWE/iQLpIA37CykE=
X-Gm-Gg: AYBFou1A55YIahAKSt8oc+5ru6hXgNz/JRZwcyYEC10Cu9Zq5p/H9CIQ7MKgA2QvRXP
	POfjB5Ib7NNMnPbCX0xnVHbMSq5ucQSgX99VZ1lK5vs0fDno9KrZcrYpYpiSY8kHPL1sLZ+5DDG
	52GNcfz0RkWdypnZptHP7k7bSlDceIZoPC2cJsoJ1yGT78h8FE+/iOVJ/mIX/3a2xZ6UEDPUv1i
	mX7cBoEwXyWKgxxvUbME4XhhEZDOiQFyF88SjiInQ0bM9niHUwK4AAnXyTv3czRrQ7+JYDtOs76
	M4XEG6eSKQ6poK+cB6uD5Bd3BnbTWtuSI4rX3mkUAcLxs4XqMyUWxUeqoeWWhBg9YJ3t1f2PA/p
	c2BMma4qzY5kx0g+/W/W35FIOeZrccPCmEgGk1R/ehUBU+/N4B73Iu6RDrytNb60bldvrYF8KW9
	xmAx04FmLEn3v7
X-Received: by 2002:a05:6102:160b:b0:785:e069:6c5 with SMTP id ada2fe7eead31-79b5adb091dmr5457423137.8.1789427324377;
        Mon, 14 Sep 2026 16:08:44 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:785:e069:6c5 with SMTP id ada2fe7eead31-79b5adb091dmr5457408137.8.1789427323825;
        Mon, 14 Sep 2026 16:08:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5b433b5a6sm22229601fa.4.2026.09.14.16.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:08:41 -0700 (PDT)
Date: Tue, 15 Sep 2026 02:08:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saim Shujah <saimzst@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: clear pending flush state before physical
 cleanup
Message-ID: <3mhqndcw4defdpdo7t5wgb4ysh5cai6b7rq4sargypesxr67bj@6ibdnfmgyrol>
References: <20260826182459.1506522-1-saimzst@gmail.com>
 <wyoltftfpoxowxs4g4uwa2vi2pnspubn4vw4l2y52bwrhcjvew@xh3og5yp7uaq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wyoltftfpoxowxs4g4uwa2vi2pnspubn4vw4l2y52bwrhcjvew@xh3og5yp7uaq>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDMzMSBTYWx0ZWRfX6e/yuMQZ6osV
 +LAIScsXlfpEcurFe4VCoi3G3oO1Jwm58fLcGBeZrd7hbhdUiuLHr9WP4sbnAxLxRJtiJb4NvfH
 KjBG5hnsUkkGawaKtSjOaI+GK7b0uYCb6V7Qkb9Nt4Ut5+7MbOmlQLDw/7rqbSMIYObvaVRrArt
 h7sNZazV5fw3CLi1V1gKfmSBfjyskSky/8LOsCZm/TPrx6/UGtvh7RBhPTOjL63bmIITK8b4iZL
 V+UbPo/dx5RhWodJPo9bCiAz5i/qLtOe9/18l/cKL1NDHE12jap4PjjCQU7uHcxd94qRoKuG5JT
 dM8tdTHpDpLFjTDlvIRw1cxDe82aadmj7snjUWGKakPsebONrTXcddWUNBfAFKyj8UECyNU7Uvr
 PA4dKasZOhDe9cLZX+x3IwCjBj6NvIZDnCSAOl7IQlhSogapt5HRVwS7X1tUJzu6a73/Rti0yM6
 ShcPcl/PDi3BlYK9GBA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa87e7d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pG1nA-xtObB0exEfb0QA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: BcY0R9zMrx_T9ZszU-LKzKPKxczsczzo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDMzMSBTYWx0ZWRfX43rZW4klwS4z
 gCwHKYuC5FNP0psBgaCS9Dj+fj7izZ8bnZ+WzLSvOVIMzdYLv4ofjSXdfZO6ZGWiX7/qT1cjSCO
 jPDm42loxV/UK3dsm6re0F2hza8HTNg=
X-Proofpoint-GUID: BcY0R9zMrx_T9ZszU-LKzKPKxczsczzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140331

On Mon, Sep 14, 2026 at 12:59:30AM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 26, 2026 at 11:24:59PM +0500, Saim Shujah wrote:
> > Hardware can consume an active-frame CTL flush while the cached software
> > pending-flush mask retains the submitted bits. Video-mode disable stops the
> > timing engine before physical cleanup, which then adds teardown bits to the
> > stale cached mask.
> > 
> > The teardown trigger can replay source-pipe bits after timing
> > stops, leaving one pending and preventing the first commit after re-enable.
> > 
> > Clear the cached pending-flush bookkeeping before constructing the teardown
> > state. clear_pending_flush() updates software bookkeeping only; it does not
> > write the hardware CTL_FLUSH register.
> > 
> > Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Saim Shujah <saimzst@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Unfortunately this patch breaks several IGT tests on sc7180:

kms_plane_alpha_blend@constant-alpha-max
kms_plane_alpha_blend@constant-alpha-mid
kms_rotation_crc@cursor-rotation-180
kms_rotation_crc@primary-rotation-180

-- 
With best wishes
Dmitry
