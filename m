Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861C369D56
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984738; cv=none; b=sZKVBNaORj0vCnGuvrnBXz/l9tvzBY3WHnpp0x3EBbWwwdBQQQU9GLok9y30zaLgnk28iYk6FKi4gGiR8ufawh9tETm+eVrrCuEiHaL+Tx01bVdc1w/UuBSo4jbBuzg7zG+UzbhzHG2LtOfQKzoVtVKnf+zDUnlpfwk8z1JUkro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984738; c=relaxed/simple;
	bh=zDaaCC/jLOIWcnflHQlHeEjB6WL5lOGO6nUa7LjxF7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXnbEcnR+keoLbcNtdwebyXHlBDay7tTA6fxSrLwMWoMLdvl+0VqPMHkcyp5UlgjDyf3yHKlcvTKY+WrfGbrMf8k5L8SUoHDHRUGbD2j1yaaOTt2IgkeyXlk0pUAeN8zGRDvetBzaIje83NWmsEvJGtDZSYnAkxkmIli3QuUTsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yh290ElD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0RI47mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yh290ElD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0RI47mz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeCUZ3884489
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 23:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YgTkQRn9Jl78hxcy8EjhxfN7
	hIYcFJc0FMzXtgfR1Ok=; b=Yh290ElDF1DpR2zJdaxME98AIGCHkl+uInh5Unad
	Wg3ed2JCCKBa4K+wRgy8+tAlMB0+S9XFExsGJqiM+PdhZmUeEMkWD0LeSrbm/GRt
	OA9ru21SavhVJOTkzLJeNFixju1+31I1s0rj5QLkRngjLDJWRdvjY0+V6FUYMGRT
	9XpBDrgCRoQSl75CaegdDQ9BspGdjXTMawqDY+bWHotSwIa9ol6vB1nIs2HP/BYu
	ae3Pp3yBatvjS2AgQMGaU4KDMbai889dSZtiZyvLMGl+sT2uENOgtmkFlHq4ZlID
	GCfWllYQdutKDU6R2Hg79+Grs/MPC/2Hx1/WotvxH6uvmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp3w7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 23:45:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so27869385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790984733; x=1791589533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=d0RI47mzxK3hkfGnCal4y31eHCMuS2NF/4KnU96xsWGgtvZb7xs90EjSXd/s3y0Q0/
         Y1ixyOliwnZ2DLjWcOTnhYd5cwuAUz3Y9F883Stodwa54G+jCigeL6J9ePPAvguTymWk
         ikW9etfXeCG33Ha27lPdZoOrOj2e4C5noyP4DTLw3IWG/6VeXvoWc30/GbSIxaIjzHKD
         K7lmjjl4ehgqSVckpJCghWFBPcU1n6bHvJ1vbYLHknvA7ebJCI3t0qGQX/vCBaYETLS/
         rbeMMrpsva2l96i9Fom2d7DrXn++3S/2lRyBTcvckSvbQ5VAv+Gd4mWyE+VRhAfAq578
         jsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790984733; x=1791589533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=PMjE5EpH6CwQUDFnfrvdv8igytRGJ6jBW2IPvhFnFDhYmhSjsIN9LbmmHQPjupOgsF
         7hno/ywf7IKn3Tg//u0usjPQ6jYwXdjbUJ7sVr2boGaAWl2n1yFFdg9Xh8pIHDXpKzrS
         zaJFzArcVVdvUxp4AMkGyVbNa/LkLCLOLxK7kDBX2vuJuMny5bMsqup/uF1tGHz4pFex
         OfbxtkRtjUgIiMf2HGtCx34yotGuSas0c8lYuYtKyhl5z1b3aWX68nUs4gKMleA3t8t/
         iznL/UoIigGCu8Mefil5DRB2AeeMRafRrI/ZJmEw+wxJ6OLSHOk/Advr0cjqQc6Qb0Q6
         0+zw==
X-Forwarded-Encrypted: i=1; AKwUvBz4TmXCpdDeqKKw3GDmgNAutHWdQLb61rrs1wzvSZUXBZhbiH6Irae14Gt98MWz2YNuic4ae9B/g3fqP80=@vger.kernel.org
X-Gm-Message-State: AFuF++lEYtc+GaQRKdm5rRJrPQCvlGgQZwpp0m60NBRgJEyuOnNRuR6W
	Hr7vFzvatEXga2nU7MS3pna1vDVLxfj6op3F/VMLdXVhZOIKm+5XeIqCVlPEFaWUSjEKhAnwvYt
	FTb1M+tVaEAtU5pRJaLRPakCu8tMKFcRoHORIxDRnhFFJfgO9/l+M/bQ2Gm4LyYPryNA=
X-Gm-Gg: AYBFou160lcA5Ut29C4rYe4G4MXQQOY6IpdlKB9JgHXLNgxdvFYluu0CIWatqYNwUVj
	78sef5Pi7ZoFzrasZTv1AgzBiO9JmjkLHfHHfVbOnu42fBNQmBXitcC+XKls8na18eTkoQrGRjF
	dl8a9TzQQ+f9Hg5OAPtBUK/Xb0NQEQ4DFoYwkiVUr53+U7HCIjMSttX9PaJ1rOZ50kgBv4PqxxL
	p17GtefNc4NYRbypakQjgLv+7UqQ0v5/rKYEVfDLI19Ijsh30O/1V1VtK4gpPR1aQkNSGW8xcvW
	MugAvoNmG/sYr2qHfQXSl2TvkKcWeAF8BONdiorRzodfXJoaJQtgB52/MPZRPRMUa4hxh9BLCrg
	hCoFNwPUUF4GlkQkap5l80t76y+ULQGmszsLK/6ee25oDHqbC8m2u4yvWG0YmBB4rHdhuJdbJvB
	IC0M44EsA60GPU
X-Received: by 2002:a05:620a:a0db:10b0:93c:c6d0:1969 with SMTP id af79cd13be357-93cf170b7e1mr616285485a.15.1790984733174;
        Fri, 02 Oct 2026 16:45:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:10b0:93c:c6d0:1969 with SMTP id af79cd13be357-93cf170b7e1mr616283185a.15.1790984732607;
        Fri, 02 Oct 2026 16:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7959bcsm1119191e87.35.2026.10.02.16.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 16:45:31 -0700 (PDT)
Date: Sat, 3 Oct 2026 02:45:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: don't report link training success after a
 reinit
Message-ID: <vjjdhsbkjxomgzeirl4n6qyvyz3wu7xaoyie3vakada4r73hxj@gicg3pz2wjuz>
References: <20260925125314.16563-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925125314.16563-1-okerixx@gmail.com>
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac04221 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=m9j_GCGoi3mryc8sS7EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vtv6hyBlzS1wJq59qLdv664fPYsy-u-W
X-Proofpoint-ORIG-GUID: vtv6hyBlzS1wJq59qLdv664fPYsy-u-W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NCBTYWx0ZWRfX5XCWee9AYkwO
 sr8msqAu350oxjvSScrzFdfLZTJRvLsbqtPR73KChQ86Fzoxf842lZZ7X+Z/kufkMqPoCUMOsoi
 obIAmaJKMVApkJ0HgK0jdYkOzfCVswY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NCBTYWx0ZWRfX1SRQ7IEzIhit
 ZWplYtg+cmgD78vBlLUk+x9EZzAOeqKtVsQnm0THcIsgQtId6spvIWb0VyTEC2Mfyc+8UI2ypQs
 uF72QVVaR2+XwYQwj8jo8pHXb0GJew4lbLlMasQpdegSD+whYYDpsBeO3dljrrhX5GJwLzZ7TNF
 g/35wGP1BkwfSUhAgPWKjpSVpqQzvgJA9KWJT5wh1u4SfAwvPi+OnICCUIqktB8zb0z3kn6rEST
 7HdgKTScyI5vMNXSM/gM/tsEvdiCatwmKUIMm3cA1NA/6O1jXwOpqjqmiJhpMsHWCxwl0orqT8d
 eycKLSm9iMLt3kf6CSsmBh6VHHSnpPhRh9Zf5MlqxEe7jJ7JRnCwd4IIAvXo4lJlJ6+iUL3qjNA
 1somqOMSh14BapXkLIQQX84T/yK8aO88GEYYz+cCv/HkOlDnKSDUSrrZ/u+GgDpGeZv9FhbHX6E
 qeVQNhMlxKP9dKmLwSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020094

On Fri, Sep 25, 2026 at 02:53:14PM +0200, Oleg Keri wrote:
> When every training attempt fails, the retry loop in
> msm_dp_ctrl_on_link() ends on a successful
> msm_dp_ctrl_reinitialize_mainlink(), leaving rc at 0. The caller then
> enables the stream on an untrained link and the display stays dark.
> 
> The retry counter only reaches zero in that case, so treat it as a
> training failure.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
