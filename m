Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511738F92F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334173; cv=none; b=Rqk+pIGgI0MFqmW7/qef+NuEHiZGkFkxpTJIqnjRw3S9rBhwcv2syLaGqtmiPXrooO+jhCwHpy76qEA3/N83QAXLWC32VjibLsD4YK69mj/P5b9/B9tC1/yzE1IrNWOTI3zB0A+Ym/Q6SFy98fuBpb2jvnZ02nrHWHjbaM08dkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334173; c=relaxed/simple;
	bh=rKcyrmt+sA4c3JIZSSDiJ/ica+9PH5/ZEv9TDdkdr8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4YiVWNm84wMaGO63JfTJ4YxWA5JX2v6Zfk3+l1N/Gm7q3YqfSUjA91uWA+LP5WFu9tzWLXrR+L8JD4h0wAlpGmDgjdJ0AMWj+woFrSuRmPsELLd/1oEYN8twRGRIHV/tSs7BoKoycipQH0O3QD3W/oyY7SI3caaLPEc+898T+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyGzXy9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdI7WyBB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyGzXy9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdI7WyBB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0RuO3218581
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wpeg4tsULyvmQiKySynkFQbT
	OmdnvDQyhOwFobjVtL8=; b=eyGzXy9yCmSIC1dmb0L56WHzbG3zxvbGUh2RXfWV
	wWFwpK+0jAwTXYhODUxQl4jVb1OR3A4QCLmCB6qaaUqpFG21rCFwJw+ijSHaBONz
	PM2cmiOr54uM1tID4Q7N3LabPpv7Pw7tbJk0yN1p8497R6d0cbRIIN6RaHYyNywx
	imz+g5TMvPXGMLOQsUM0MAYQLGR4z3xj2uV7nnjuYQ+TixqO4Tt0NsQIZ9+m9edp
	dv/0MExZ25PyKZqXU6Fj/ilarW9oAHnAHXoG6vVCmz89zqSA+wjXJNJMxphraIPY
	ChMtjTAVm5mkv/yHh0WOarKmjpjdtoTL3WHKKz37HnQNCQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dm5pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:16:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806756ea40so2350243241.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789334167; x=1789938967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpeg4tsULyvmQiKySynkFQbTOmdnvDQyhOwFobjVtL8=;
        b=WdI7WyBBpOtlOogqr1v+Ywcp61TruURaRuFliUnbx/YbDf062WBCdf0nMFyChEMNTI
         Bcn2DtrV/19v0AabUvIMj3Vt1bedqfmBfTQDygCMVCD1m0BiivKK3idj7O6PNCQPWODP
         TsCJTgxphdwy3JwT7pR2jx+GjZ+8blgatssGIlQjZffUNoR9LvWsQl1lgE+UaMYGxC5o
         10yqNm9DNLabWeMlIUmM3r3m/2LVbRCS0JCowmSeV8k+JRv86Taom8cJv5UJK7cHNhRK
         RoWdeFWHR22dlyXsLsYncp1Nt/9QuItAdGapaFe4dxCB+oNUp7w/+k5i7OcGfEAPb4zA
         fO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334167; x=1789938967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpeg4tsULyvmQiKySynkFQbTOmdnvDQyhOwFobjVtL8=;
        b=Bv8CGi6YTn1VeA6jBj3KWq7Pji0F1LolGjLkWSeT4JcxkfHI6HLUe6+ytbZdnpyqN1
         3tprD2wXemSNyO+N91gFzAp+r7tYsMpoVDU7LOGjKF1Z8nEp5jprws1ILjNFRq9uJqAb
         wXw8CAOzQRDUCGWZD7KZMsjJPO0MTYW6WZU9VgVU0dktPte3DfxSvlLfClBpgH9FatnG
         HSFHPm+iadYyQJbhtC1rgyQ8nkQ5SkPwbA6lx+Sp7oZO8S2JR0OGU0ecAEt/v6R8D4pL
         xuR1lYDcG6l+2bqDNz70P8L7A6DJK0TgAojdK1/DDgf5SppONp3UMBz+8c0BYznYgoXr
         Vtrw==
X-Forwarded-Encrypted: i=1; AKwUvBwvIX7PpUv+CKK2IHQw573t8TNVSnjlCgwnTv/aFCNKA9DeQQOk+NgChran0Ucj52HFtk9dwx+1Rowv0iQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mod8DcAZdJmJL4hSm4GABhnK8BwzCQRXIs8BiNpvHT+wOat/t0
	2eUL2Jp7anflDlW/OEql61UZVg8EZv9C3cXbtlSE4oIs0qb8iNKhh9zfEbzAkhz/4/9aHmUR0S6
	JI0HfSFbjLJtjCEXQ3Va5/fQy365UhMemCbbjsEViw/F2UiIAZ7EHi3H4sHNp3vVO4N8=
X-Gm-Gg: AYBFou0mJbm0WV1M7TVhGJH5bMACoMIYuDo4NBCs0IY/4MlhxtrFaNDWtfAqmdlAMHK
	PkawMQ4ETwdGVTOe3lUteQcq9IQVt0xWoeGvASmbyA/C/iUox5iU0pVnv2cpE754e/O2JkAdtQ5
	Fqrx+Q9WjdOgFmum0hLLoLepSlO+KOJIHtBn49sv7t0o35mJu2l1fAKC5oFY0Rwod+niobQtHZD
	mFyN7hL1qxrv+CLDLrOPauRKW40ARhQ5FV0foqacY8le2wGlygRgZ+vIvR3J9CWNMH9myFuUXBq
	lCKi2a8l7nt5Fg1m83MNnfMiH5wa5OHbGT4FcF5znMh0Vw7Q/JN3vkSFM0tN9UOF/NARVYTyxu5
	OfFfAvHtjWafX/qRUbet5c7M38srhkPiFfCui9lekKwqnIaOKhrKNnzUiEJ08xUImCF2e80sXYl
	xadWwhO65v7Eo2
X-Received: by 2002:a05:6102:f88:b0:796:1ed:ba3f with SMTP id ada2fe7eead31-79601edbb2bmr6668213137.0.1789334167506;
        Sun, 13 Sep 2026 14:16:07 -0700 (PDT)
X-Received: by 2002:a05:6102:f88:b0:796:1ed:ba3f with SMTP id ada2fe7eead31-79601edbb2bmr6668197137.0.1789334167150;
        Sun, 13 Sep 2026 14:16:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a334baf8sm22310821fa.25.2026.09.13.14.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:16:06 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:16:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jesse Casco <jesse.casco@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: skip PUSH_IDLE when the link was never
 enabled
Message-ID: <kf43s2b4bt6q555leqyy3xlsv4ccqhapmcsesa535rmsnth4eb@zlz24kv7v4r3>
References: <20260808171325.133041-1-jesse.casco@gmail.com>
 <8728ddab-ec45-48a3-b2e0-93b85938d8b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8728ddab-ec45-48a3-b2e0-93b85938d8b5@oss.qualcomm.com>
X-Proofpoint-GUID: V0rbWywevrjXpMnV2xfCF0LxJ2Ci2pfR
X-Proofpoint-ORIG-GUID: V0rbWywevrjXpMnV2xfCF0LxJ2Ci2pfR
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa71298 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bqXh0vLP62WSRRxxKw8A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwMyBTYWx0ZWRfX4T0RWGhiIglg
 J31Lq5JpIgT7by4XyqO7CCLDU1z+SKY3WQlpEMvCKoxuhWuKAAK+jfXucjz98D7j7nFSKPInezZ
 2lbOrsgP2vU1IJeBUfy+AEtUB3r+vQg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwMyBTYWx0ZWRfXwGNZF/AgO32p
 bjy+d+kjd6UfEOtgj2mvvqOfAav6SNdJxZFzyQ7Onlj1ms3OtRd5ZOvJDfbTVg5KIghrbH5jh53
 B4cCulfUTX2QnBp4YkadkZJGmfvsYjy9cIhYgxXgIN/34WhJeqasqi+x4now6n6pBESV15Hk1gc
 BK9LTfb1Cg2+utVFAsHQu4y6gfF/L7Ft+B0GzSt/byxh80QxWlbS8EgCUqkJpzcKDl10EbUk87h
 M4Sq4yxgP44RDyAYGnv8cdLgRyuCKvdBmOT/pIJ0QfRqEdUuB68LVGJi63mGUIfiMh22BiiryrL
 BEa/95h5vH/AwafnnL9HPa+slnuFfdJq3DTrRv24Rip6RjZvaDuRzIUDAQogUlbZO6lqkZxyDOh
 mxBtqdNiYohDvBwofGJlATf5ZvrS1kR2p6XD2+yHc93KXjcyrAJ90TKuASiSQeLXDLLriaWzXMy
 m1b6s/bvZ4iNaQFp7WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130303

On Tue, Aug 18, 2026 at 11:48:58AM +0200, Konrad Dybcio wrote:
> On 8/8/26 7:13 PM, Jesse Casco wrote:
> > msm_dp_display_atomic_enable() returns early when link training fails,
> > leaving ->power_on false and the main link down.
> > msm_dp_display_atomic_disable() nevertheless writes DP_STATE_CTRL_PUSH_IDLE
> > and waits for an idle-pattern completion that cannot arrive, so every failed
> > enable is followed by "PUSH_IDLE pattern timedout".
> > 
> > Every other step of the teardown is already gated on that flag:
> > msm_dp_display_disable(), called from .atomic_post_disable(), returns early
> > on !power_on. The PUSH_IDLE write is the only one that is not, so the
> > controller's runtime-PM reference is then dropped without the link having
> > been taken down.
> > 
> > On glymur (Snapdragon X2 Elite) the consequence is not a warning. The SoC
> > does not survive it: TrustZone force-stops the SOCCP and ADSP remote
> > processors and the machine resets silently about 50 ms later, with no oops
> > and no panic. On an ASUS Zenbook A16 (UX3607OA), whose eDP panel does not
> > currently train, this reproduces without any compositor or GPU involvement:
> > 
> 
> > +	/*
> > +	 * If .atomic_enable() bailed out - link training failure is the common
> > +	 * case - the mainlink was never brought up and ->power_on stayed false.
> > +	 * Driving the PUSH_IDLE pattern into a controller that was never
> > +	 * enabled times out, and .atomic_post_disable() then drops the
> > +	 * controller's runtime-PM reference without tearing the PHY back down,
> > +	 * because msm_dp_display_disable() returns early on !power_on.  On
> > +	 * glymur (Snapdragon X2 Elite) that combination is answered by a
> > +	 * TrustZone-level SOCCP/ADSP force-stop and a silent SoC reset.
> > +	 * There is nothing to push idle, so leave it alone.
> > +	 */
> > +	if (!dp->power_on)
> > +		return;
> 
> Dmitry, should we even be reaching atomic_disable if lt fails before?

Unfortuately. The atomic_disable() always comes after atomic_enable(),
there is no way to fail the enable path (you can see the outcome in
other drivers where the _enable path ends up setting flags which
_disable path checks before shutting down corresponding hardware).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
