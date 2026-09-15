Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972084772A1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466040; cv=none; b=UFrNEPfiBg7Dc3ZfKkN2itYxW881Imn/WnZ2ahRrxlbrenI7soOkxvSB+XcvD9Qkj9t2ZrE8RiKvwPynNgGyMauzrPyKYi6J5o5pHqZMc/2S+XeD1eSnf/9F7VrxV0UbZcMxiGzvMtfdkYNn4SsfmnvkdXMRQUsTfWEquuSZeo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466040; c=relaxed/simple;
	bh=5oBfPJ+x239lYmq8/4KXIZAlWyktSzNaDIv3WrYRGOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxbM/bdySpaGi+rSEgzcdova1z0s9Zxhi5ZLZ2bYpcsNN6tTBFMVZWQ+n24hHPX0PN/y+iFPsSLN1+zsnh/EfetIuDfHqcdu+KYtJHTWP0OQoO02G8Ha/pU8uBRLVZ7RLye/CZ1DSAad3O34glKzW0KAjoi7ZYxkmi+eGVhx4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLK2liwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+8XYPV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLK2liwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+8XYPV4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hQVs3560901
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pF/QF/hhxoHrOKiHFcOtOanP
	8OYOtIshKOaIzZ6HLNg=; b=KLK2liwT8BmNgKS33FVJjQLjLmDLdquSsUYoHrqq
	hrg3EOqWjk3mJv4Gm/qPyKVJAo0/oWHqTNmKLSpCuKkYmbeSDZucfHMwYGZnL0GI
	jD69y2mBQdXOcg8geyyJBqNB5PD0p98bqHlfTL6kq7n8fDwlod2R14f9D9uAxg/i
	Y1YqCDk0wYBfOtO0zdRDWA59X/7Qg2FxLUxQezMGrtgXGQqNtBOv+dapzgPRKxT2
	ntMOiww9EcP6OSDIMIGzae61y29M1pXgIaG5ijroRsjokQBaowPa/7IJMRo/7dDv
	9JMAKdCQrJgs6mivmcFBDh4nlhCYZn6NXxuIBMn5PTaICQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9uv0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:53:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939d6c515deso865367685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466036; x=1790070836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pF/QF/hhxoHrOKiHFcOtOanP8OYOtIshKOaIzZ6HLNg=;
        b=Z+8XYPV4QRqXPYsX8gBxTnQkWsXojSNuhgommG9/itLdEvnnysWgI8tTK0XDxicioS
         KF+bP4DdXSFDbNt9/vkZBNqSbrrMqe6QGftQvWi4rDaFGK4oKVw271AD2XX05WvOA9z2
         sMqnKmGg3qpH2bCM6ze567VgCg7TnAIL3zsuZsIJmTqM+PrL2FCcFTB+kZteaToMhaUH
         kBLLwbmTAgxlWdFdQIK+7skxsW7wRl0cVMBJ4mPssRRvncKFOXU+iAcixBqvUwQ7fGof
         BNLsikFQK+iRAKM/GNbl5dEpMbP/SJCz3e0tkDjVnYpUJjQxAcIfNpnNK7DmfOoHuw+o
         Zv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466036; x=1790070836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pF/QF/hhxoHrOKiHFcOtOanP8OYOtIshKOaIzZ6HLNg=;
        b=jSw133O1SelfWYoDXTXU+D4etYajvRRg9i98OimvEhBQUFSw1njD4Qrw2oKluv8xh7
         thZ4LmCERI7o5G9LBU1etr7xi1QuJkqDghHDjPDQfTzd0zAvsAUlVIBerOgv3YXPpz5v
         GTk6nvylAQzm4bXviGTW6QGYtnoSITolkgadkpeQO/gjTsrwq2aSx2kaXwD2FtKerY8c
         Vspo/9jY6R38DuRb1JKxNqmAho4uxQeiKfF4LxKsK8q2jcXYqWGE45yXwkjQEAUmFm5w
         q8AG8MjNCok6IxtLT8s7X9RJ3hjuNSQbST7t0DT6vUcxVb91yXT8EvXNe2ctC95eDKSp
         7btA==
X-Forwarded-Encrypted: i=1; AKwUvBwNRLRnp5OTZaTDKqoiZ1hcGke7njU7wqMOuciaoM2wLCikWnFcOXteSPTQew/j1WAaR2mQqCDKa3k1i90=@vger.kernel.org
X-Gm-Message-State: AFuF++kuqMnJ98YFw+gbU0a8qfl8E/KcuPiXuPLYIR5AoAhtvQ/6nCaT
	KRvdQ9Ob/Pls6uQiUWSj/7e1wWopkuFfbXPMvBySU/YCYpmv8/ZKHd3BBsrACwB8eB81+vvLS3c
	A9yw/VTJqop1lKoKZOzTElDRVLozu0OfCimqRAsFiNwm83iKlLInxZLUjjD+iI81ZLuA=
X-Gm-Gg: AYBFou1hGtALtebEanxL+6b8Xh+FKN9h1INaBleyxvBzx27WWpVizfnUsR2ysS0Deox
	55VT+JQiM86CF0yjtu1OU/zyCeozQx4OPW5w0zwTZYHKQfI/WxSMcVL442jxuGOYq8ZpdMsz4WF
	TZ8cf4WtSD2R5ERWcdPB3l0CYiMY5+MsR0JgT1BIFBeAQ4fTDFv458aCApLC8gqiiwXD9D4kSdL
	RkfIpLsS638KbA0ck14dDPZsQYLkRvIctTInf8gAOZV/W12nMuqtrg/E984H0PHhuu1zPQO2aL9
	j8GlWv9lpJJftEilbFBz21px07Z4fSXeIn/mn9whKw4CuEBnROwvYmizZEw4Bdm/NOmO3jOaK+x
	uYCSzPFpKebn3eg==
X-Received: by 2002:a05:620a:199c:b0:937:6771:e7e7 with SMTP id af79cd13be357-93a299f58c0mr218163885a.30.1789466036460;
        Tue, 15 Sep 2026 02:53:56 -0700 (PDT)
X-Received: by 2002:a05:620a:199c:b0:937:6771:e7e7 with SMTP id af79cd13be357-93a299f58c0mr218157985a.30.1789466035894;
        Tue, 15 Sep 2026 02:53:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e8249e3e8sm4523405e9.12.2026.09.15.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:53:54 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:53:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <saph4ecgnjpxd2fxeg277aihe2lnybkfk34ipb2nkg6wamxytw@qpm5cta6cemz>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa915b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OUGWfBxzjYAD_LoOebAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfXy+qGKxT70YiG
 racwTtA/7XK+gSXUn5/t8sDrI2hXWSkfKl9mTjQ5e3ShPLNR1v5i/cap73uvncMqFTjNSyF9mvB
 aQ1ZKcBJkw9fWLFZmsmoTMPLY4SNZsm/+CrnE2F5fTImjJaODg5OMcR1Qlg7rWkxI6S51lu4Ez/
 glW2qF5uomKpN62sSqnTsiKvtHCgt4835Etx0HNpU3vhZO7aVM0vbVCYgPNeKzWh6vIgMQvnoe4
 viRbA/8olI2IkksotjUsuEPfp9csWfTET3GI4RzH71eIVNJuuWxt2PkTTh01+m7z4r4D0qtF5Dn
 b27jzFiTX3MB1U9YfGNcEjTjuNx2h6oSacW0/jV5IgGC5k9A1/sJfGQIewN90slkS6h2CE/Glh5
 Rl3SLQonHTC5AU9gH7umS8ECQ+DRsJN21dXHxpegqyuzS9BqHnTm9odEDYjGOBfSpu/S7Qe9rUe
 F6utnOy/PtZ4YAj6Ixw==
X-Proofpoint-GUID: N-ZMzifojvngg6wOjhb5Ard1ruMdg6Rw
X-Proofpoint-ORIG-GUID: N-ZMzifojvngg6wOjhb5Ard1ruMdg6Rw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfXyoUm+RkYbI1z
 vVTIQ7y33PQkIcwNsH4FzGuDtbyCKZWOX1VoS24HkZ38Ra9LQQcbLsuckP5B5q1WPr1lg2s93Xx
 nbvzK5Kf0mkATmhWMbaqXe03UbpFrSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141

On 26-09-15 17:27:50, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
> source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
> the display-controller (DPU) node, alongside the existing MMCX
> performance-state power domain.
> 
> The MDSS node's CORE_GDSC is unaffected, since it continues to power
> the rest of the MDSS hardware on its own.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
