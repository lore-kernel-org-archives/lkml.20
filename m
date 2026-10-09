Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EBD49B45A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551906; cv=none; b=Ilk9mJ94c2zCVhg6SgL1FKI1O0/XvOms8gsbMN9uFJSueBb7FSp+7KnMZF1MRL7bMevnn/nl72x0VJ8VUwRtPkiWphOzsR+Y1z/tWWgKFnec+y5f0Q4iynWjFp8l5nQizeu99lEo4boPY9miPGbs1CcDJjsP3Z8VFC7E+y1r+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551906; c=relaxed/simple;
	bh=35owgoMuwrrGhU1IN3tED+EYAqd8IALpPDCTSNeIVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaBHTUEBPZxRnB2dfBEivoWhFsJq5EpYfOsjyBNvWzzdIe7UmFji8H59BVQINOAouc4YV3nBZ1C6FCYglxqYzuJEYwixq1vpgfXJuldBM1ghxWUYLzLAonU747R5oWf5aAJEwggm3YJBWo56ll3oIjlwLD0yPLlyKsp4yPHePxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZ6qkEpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7WSbdoA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZ6qkEpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7WSbdoA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699A4fpR1336285
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYYBr2BmdY4zOcF4U3A9MMVD
	JkUDAoza8jdCzVd87J8=; b=gZ6qkEpN/3z0dp4iU/6TBh+4OpMelin21NOP/SRx
	MNxj7f9rZy6MhtORC7OPNIKpz0JZHg1I9i3mtUqbFcWTJLHI7Ojsva5tvjyY5YYe
	Lb673H5g63L1jckeq5bpK4hyA+XyP7tRAflWpb/Y71vJBHMrIc7SMehyyJEvBLZs
	Bpe6xluCmmAjxK7RFkfekuRVqoY1UDIk/2xSvobcp5PCmJ7jC8XP8VmxbWpeNcAX
	e3SSyS/PTEE49G1VR/8XR/5vL+X+sx7n8Uz6ekGflQa94kdQ005deNVvhvkg5/Jn
	ZOrVGikNdxHVoM4cJnL8E925DFF8Y9Fx5bbR+Jw66l+0QA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgmgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:18:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso1243449185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551903; x=1792156703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=L7WSbdoAMEzig9N0nbMAYCYzA3VyFG+ZIEIBKJ+8LhtmClnSiqb9UeIG1y/DZlPXGl
         +GyrYFoW3VEXk4vSza88htSdZRvWqCIBfh9HhTzNjM8kem3t+9kREGsVEwt3CEB7nY0p
         2VWCcjcRxUYVqmVitxfbEnX7o1scPFOAXinrw8oetTZUNjJScfjQCQNonV6L1uE8tW4w
         k+wce3moaqZOxTcfDgBmGiRdMqwr0tl2bl6P+P+zavW3XGioByvZcGDEo1ZVRxTlro2Q
         APlZwMZIDPRaubgvTye47G8gehUQ9BfuedqRhXalFXBC1SRQI7xshUlOaV439j4Sum/g
         paDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551903; x=1792156703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=A8hvamBnISbhaGQdwNis7IPylXyWYzMBsfcUAkMhHPgce3VxIyYxOQBl7ZkwTmhFdI
         wvpWBiKeAlKL4x0UTk9KTxQiMqOdBqSC8Ht5iQZcEnWRjqo1zZN3NV7w+37s7dm5MmW2
         HNUKccsbUFCzwzqWKR5sd/Gl04xlb1KB9I1LdqeukDo7FbQu7K9Fog3xrdulsUWV51Sr
         /l0Ya5wzR8lJqo8E0XaVvAM8i2ShwcNvFKaFH9FLyI1U/T32NgzAJd5fXp9fDw21taFT
         pEY4Vefax/XJExdwhUVuX5y8/42HtwG0crGcdP/6ZbwSFmEai/n3+mi8G2Pz5kaIPCi+
         meNw==
X-Forwarded-Encrypted: i=1; AKwUvBzqKjcl/S18qlcdG0VAl1wjY2L/3/zTwd6/eBLi7CTuwE4u1RAHJzJwFXPfX8P1yYnuJMujlu2Acddm/A4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2L7WLom2bKHGM14nBnew9l0pIg91/jGgroHNUO1EafHwHqhHL
	rpUySDGoclKaceXZD08QqZzpYpcf1uYgp02vKozVhdi53NEoExlcByF+8/MLDtDbzi2hIMjzFx8
	AG6fEr+u6+KNLN6gwr7jyg5YyMne5YChDQmtlJENChO9imhO90WTPZZEHS05BVN8EihY=
X-Gm-Gg: AYBFou0huKib8azrdgO1Jy/Wt20ekwLVx+Y2/RX/1EJhs1RqwI7NzYqYaOhxHCs/OAm
	g1dbZ+0Yqs30e35dSBMcv66FEN4uLaP9/krGIRBNWMAk63osVbcwGKqxwPuqsQ7kILWWXd46hN/
	9kDYSOKS8QOgOGhSDzbBkvm9ILnXMLIhZ5JbCaFnZxnn2Oe0N+WWAgYpfa9j60t73gRvdXhB581
	TqvLGBguSOBGubFxJZbojNPs9Qsr4gwU7D/WJDFwYr/Pd8cHrGIeRkmpaf6h1rIdo061OaIzy30
	uQYQXqjAEr5Ga3s28D4v1udssSwegaUX/xILxAeikn+K40v0oMVGi/37RRNXD9dXgJQZIBg7+2X
	H4SA7emwOFapGZ/nwASetYhorpsixiLrw1eJfBOfJcBvZswuPx94UY+yJhig6d1iQaX7guo1YIn
	oQMsJqk3AwZSJd
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247621885a.35.1791551903034;
        Fri, 09 Oct 2026 06:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247608285a.35.1791551901630;
        Fri, 09 Oct 2026 06:18:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5d8fsm5986561fa.30.2026.10.09.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:18:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] drm/panel: Add driver for Novatek NT37705 panel
Message-ID: <xwaxsqtffljmv2tgobybq2f5v23hs26wy5zjdti3dziu62kq6z@qpzlpnmplnwp>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
 <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXwFpL5lahT3ch
 dy5lU6R45tP5JZBG76LGoNdt2Y1W0j3EukkKoVOoZ38VQQyP+nrYc2WA+Ld7oXLHh6cyXj0yZPT
 FDs4g0Nf+zSU/Yjbb84RKW78ff5u9KA=
X-Proofpoint-ORIG-GUID: RBVHkDVWlZVszNtjTf1yBHm1gnAUzm-w
X-Proofpoint-GUID: RBVHkDVWlZVszNtjTf1yBHm1gnAUzm-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXzIKurUu+t0uF
 ZqRFrvLhs5MXjd35MYSh/xY9h0vqXXNmonuLc1HpkULyhX9yu+EGokilOgauoKcZ9ceK9SXxN3R
 lqgfY4HZ197q6N1Uzx96Lb26ItnEKn7ui5sGthvy7HXCiHH5cG90eYEn2e8gQP0+Esw8drj0v54
 tCH/sWxKcKZKmWgB1Bj1lPeMYSAOmGJ6sew/N/XyDuaJ7c+eivqh2iYkKV3eA0Me78POOW8rUK6
 M+yhRPqCLnwhdJwG6AHYRN4ov57l2PV5JhbGPyy+outpp95OAujKU2UxKMi1yonTaWXPa0l7h8k
 9Jg2E/9s8wckBjVCR5LALlWCOFamOkFMqJXnjz49Uiv27XmDhi0joTQtCXi3KdteUT4i4yPUxd3
 +5wcTuGCmQK/xnVrZuc6R9p5iCd6wXnZyVgN/kxwwS5sC6cNx37Z0Q5FPvH9ho7gELCqPSyJ5Cg
 +P7RdzjJ7cnKNZCDpGg==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8e9a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qNtwOHy-hT8K20Jd0IMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

On Fri, Oct 09, 2026 at 01:25:01PM +0200, Luca Weiss wrote:
> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
> smartphone.
> 
> The panel can also be configured in 10-bit (RGB101010) mode, however
> currently it's configured in 8-bit (RGB888) since there's some issues in
> the Qualcomm DPU driver when driving this panel in 10-bit.

I hoped that fixed all of them...

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt37705.c | 396 ++++++++++++++++++++++++++
>  3 files changed, 409 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I went through Sashiko comments, I don't think that this driver diverges
from any other panel driver.

-- 
With best wishes
Dmitry
