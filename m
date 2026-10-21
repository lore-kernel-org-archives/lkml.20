Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604555;
	b=aVAWz/aJLJogjtXUqp3y4hRAQ7JaoYGRjPyEc+V5WCpwSjaipWQyPTSp4s0X0y4iynbc
	 5xmw5RctzKMDWTlcsqOPJd4HmNm63ZPPs4lBbToNzlujdnITOgOgZik+GYlCIP+FpHDDs
	 YG0c1SjBvGK0PNh46r8GcfwS0wDJLIhuCoKfsOD+jZz9mTMcqmQn29DnpEPIy7KfjQmru
	 BYHPWKyKAYyWBuMF1CDvB3nSjz7a08FGfOYNRKtXJ8GZKbBqsVKSlCMUihlcN4N+rsH4E
	 47Rh0eulYaSwiZatjZ3ZSN5/EZdxTEb46GiLgshCxcKs4pQEygfot6QtyvZiE9oVhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KN+PgTF350Bf5Q08x7ilqI8W/r74ND/C/koqFQV5cX4=;
	b=RXnT9d0M2Chns0eDAQ8jW2wD97FMMsdbqxYFzwHLKL+LLfVIq8a7MT0Fmf+U6Yrg08rA
	 sxD6oYdtqT3CLx5z2+qhfzgFmcSoWehudv6NCgkQ/421JYI0x7xh2FG+sk6+6Mpzo5oG6
	 LcEFHo40Ant5oG6xgeTbwEubbOV1Gcf9AtJH4Cce+MzJFkQHJY1bsCw9cp5KrCjX/u6qC
	 IJx7kD2Pf0OJs1OX0ZVlvh7vULIgSefzQo0YEtvZgy+zh5b/KAlHU3HnI+fxP3/XhtEye
	 IYT7WMIq1fHEcfxdTGdY2CvjmNASVJPO0OmLq14shpvnh/Bzf3bfRG7mHj559wcenhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gR8dQDXv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCDYZvc6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47524606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47524606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gR8dQDXv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCDYZvc6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFoIGR524343
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KN+PgTF350Bf5Q08x7ilqI8W
	/r74ND/C/koqFQV5cX4=; b=gR8dQDXvW6Egwe+DwHNnTIKewLTe2ebFyOreWuTt
	rCDnG26YKc65toONtrrne0r+HBq2kkeEabnxnxFE0XK6HN4HioijCvS3iK74SIhl
	YysrV+4UcoY0GeGUvWcLHU8rJiWj7ON9asLO1T67AJ2wLEcX8v+jj0mqZWRfT/UD
	NFNc9Cev2ZIdWZGb2xd6s/AYam2ZODJdKG1x6sjGCIOQkXIdJMwnCjSY3a64CIYJ
	sembuh7p7snPwPKouv4Lq2zLCEA+Bs99/NgTtFPqOGV2OJ7s/u55H9GuieKallEm
	BpO1rTlSqXkdvSDEVBLXAPRSzrIeky2INjhy+6d0755fPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv0h5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:42:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so176427585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604552; x=1793209352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KN+PgTF350Bf5Q08x7ilqI8W/r74ND/C/koqFQV5cX4=;
        b=OCDYZvc6lNe4IalN3A92rXJU17UpILv0iTOnPOeIWFz3tFv7J2vZBqlO4cp3ymMT7T
         hg4t610U8eWvUnAgBVhYOf9TH2RaZQU93uyG7Wk/bi8CBtc1zCmSDZFFsHx+snyH0YSL
         lKcdiQE6QMlDtnc1SpOFgbebaejz0LpKcvmOM87SA9OKAt3I6sMU08tUEeSwnbLnpng7
         uAPJTbvspGEgfQ+eC43zELtB0K5LoUCVR3JRonp2o87QjOxPqqi9fNT2Agr2ddbdaLHu
         23X60MBYnRrEzwkpd7kX+ZfandcAjfndXRggoY6uzlJxOHI+0c7GuJuvFLbRCuZe6dJp
         Bw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604552; x=1793209352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KN+PgTF350Bf5Q08x7ilqI8W/r74ND/C/koqFQV5cX4=;
        b=ALwXQvZHCkTxN+VUvu2WjlwIBbbFFjm8jbumYvTElSab30P6dJJ5x6F/H0VN7aOLc1
         M6+jEQm/97pYNEvGOBKGJb4i3YeqYrFo1u8a0Du03OI6PYiUOtcS5tgXFpMhR/LrttzH
         d/20Y0KQiYMrXawTJVoc3JUr6xa4xrjQkuQrW2peMw/wwRv2Xaf0Nq9BW4h8HsR6znhm
         J7kd93h7RKbbpnyWbc/5xA0fHIHrahbNNl/yXqasv2GxcF9vTiUmqezvvAh2kmMzHiqx
         zXb31t7mDM4eHUX8sEiIhdJXc75U0/7TOOOagzNcRPhME6/2MaDxURijaQh3XKA+oRgX
         mY8w==
X-Forwarded-Encrypted: i=1; AKwUvBxSVxkTwOq6QHEwYc/aBBA+o4QE+zmEgbVMj54sdTdPw5nFCDMQMG7YeAhwbo7gh2D36dbLIiA786d7cZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKefkvihDtmWcWyOyD7LevL6ajRC2YOmsoAWgI+1u8xOoJdt9AJ
	GXAWiJw43f0Smszgs8PFQffLcpF7ueUcmP//sUNGLYblkwuSPCkj/XW590eBT8wh0hfw23tQFXZ
	UKux1qiguvHOBtmF9j40bA94N0VQG9xUTSIdT7h1WSzgwLgS/uRahvZd8kPCUTT8IveQ=
X-Gm-Gg: AYBFou0hMkyHx0voxfGIgLJI0vTHflHaHbumMtZvy4fTE32Xsrvzs2fQjrlK8ZTe0zD
	o9CyYu+8IK5iDPVNcD1nnYMq6+82WAWolEByRxBwBd06i6UTCrECIs8Mecj4kDjP2WxkUKDeNDG
	KLLRiKiBAnnyq96IXXzj2Gr1UMWy8h3UHrENtkoKKWlxFXlkPfK8SP9zQvBCF/tG7T5wXvQ22cm
	FX81mkAkD8iPNZA1u49/h8+gnxjo7JVokIK3p0CBfBPCbEjTbcYYtAD3nB1zrmJYpSg4qMRFtRv
	F41pUBbJE2PA2enZ1J4JdEEZw9veCIlMYvUZrVTwSkjlM+fRSgKgxoPlKU5FvSiOFPxYEl9xkdn
	7jvV6A+KbHqc+naOj2OqcStIG/cffHyJa79/1eqLOGFu484o5l8ULpsSwQWxYIegAu+TniAE+pv
	t8+2rtwYRakMJl
X-Received: by 2002:a05:620a:4493:b0:93e:d364:c9fc with SMTP id af79cd13be357-93f57e5e30emr518394485a.5.1792604552201;
        Wed, 21 Oct 2026 10:42:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:93e:d364:c9fc with SMTP id af79cd13be357-93f57e5e30emr518389585a.5.1792604551742;
        Wed, 21 Oct 2026 10:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4962a59sm231037e87.4.2026.10.21.10.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:42:28 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:42:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v2 2/3] drm/msm/a5xx: Hold a CPU latency request while
 the GPU is powered
Message-ID: <54itft4rw53zcxoyx5vhxz3zfenxgooorp6lo44vbsdayrq4yi@3f4btdyicop6>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-2-457aafbb28da@gmail.com>
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
In-Reply-To: <20261019-a5xx-gpu-pm-v2-2-457aafbb28da@gmail.com>
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad8f989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=j5_2AGnEbwvZtjme2gsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0ch9_iHT6WEm13M4PsuykHzHZq1twtC6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX06tmd2TpMBna
 xHbJpRqVPGdFVNIi9LKWp1GbNwwYel/IPu2zkmZxzgokRe4H2kCkvn5UdlHRKRnUHRCAsm5ArcL
 LHCv0pzII/BuSS/PDsujcDuXuPGWfNE=
X-Proofpoint-GUID: 0ch9_iHT6WEm13M4PsuykHzHZq1twtC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX0e3oEE9wdx5G
 yAPz9mLgBEk9j2twixDFjms9xa6RDAKw/ifR8tOy49ETaKHmhoorWrVuitcqfTeMZa2tlc++616
 kQZ7ytbGjz+bU9Z4aCPl4dd4MXwJjMHI7ltzxim/gP0MMDJxRYYk3sHTGW9Vof8DAn/YptyJ/Xu
 r1dtOeUOGWupCWB9qt8Yq790fGwlPMYJumwXRdS9EeSK8gEoITRimmn2YithxwaLZ5GSMf/hsAe
 E+Sbpz9ryWma4h+R2Wt8HpfY2Bf0xdJYa7Ds5oSPCNbrhYSCF+PakAeuq+6IjQLn1moDAh/ruSC
 nDrGWVHMqqrHlkm/+kchCllSrz2Wsfcqw5xU7unO34RPMbQZQWCy3AdaCZ5DkrGDl+UGjiOPFBe
 9n/EwNMybRiBKK7izZ6lfqawSVNBG9uVBk8W4ok6Z9CW/kVr/HKDeOBjKXNaKPPV8xsV4psG6Ug
 FYuQDSI7VDPDMGVKmOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070

On Mon, Oct 19, 2026 at 11:05:09PM -0300, Fabricio Akio wrote:
> On SDM630 the GPU was observed to stop executing while the SoC is in
> system-level power collapse, and to continue once the SoC wakes. Its
> interrupts have no wakeup route through the MPM, so it cannot wake the
> SoC itself. A submission overlapping such a state would stall until a
> CPU wakes, and a stall longer than the hang detector's threshold makes
> the driver recover the GPU, which can lose a frame.

Do you have any extra patches that you are running with? I don't think
that currently Linux can hit system power collapse with the GPU still
running.

On SDM630 the GPU is running from the CX, but we don't vote on it (yet).
With the CPUs awake we keep a vote on CX. With the cores going to the
deep sleep, the CX might drop below the required leven, causing GPU to
die.

> Qualcomm's downstream driver holds a CPU latency request while the GPU
> is active, qcom,pm-qos-active-latency, which keeps the CPU idle
> governors out of cluster and system-level power collapse. Do the same:

Could you please check what actually stops in your setup (CX corner, the
BIMC vote, XO)? I think the proper fix is for the GPU to vote its real
rail, scaled per OPP, in both RPM sets, rather than keeping the CPUs out
of their idle states. I'll have it as a part of the CPR series, but it
needs a bit more of the cleanup and polishing.

> take the request when the GPU resumes and drop it when it suspends, so
> those states remain available once the GPU has gone idle, and on
> destroy, which unbind reaches even when suspending the GPU failed. The
> limit is a per-GPU catalog value, downstream's for each SoC: 424 us
> for the A508 in SDM630, and 518 us for the A509 in SDM636 and the A512
> in SDM660.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

-- 
With best wishes
Dmitry
