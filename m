Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013D3630AC
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700637; cv=none; b=Y2usP/KpdU3m2yW+Smf9H0Z2TtLFIKL0S+uPi/ojgXf8vms7mK5O0Hrwc6H0HSXeZU7t/FKQGz1WzXtm+TmaKaZvaoKPn1bYQVrDBzHZScQ7TDCKOg4FvJmBrDq7J+GCbaTKrF6KWUMBbNMGNS5poxXw9yVTIzx1o+KcKobK7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700637; c=relaxed/simple;
	bh=GG2J4fso33oIoTZfD3Mzrb1HVRo/ufiE9ZlJtC7lK7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKXVxIvKiNkhHuJdfj5kZANxvM/OVohsRs9LKp+EvPgx89lUW0hzWr7w5zK2vUeNNOrTpXfDX446mYWV5tChc9+oa7qpyeBYPfvmbhPZu9UXGvLZRtRRTQPJYK6PQbDeXX95LTdpuhvV85x61ZSKjlSV2SwI67aeSdiCyZ+4A3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajeoGkG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eV53MTpy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajeoGkG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eV53MTpy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B50I7o3122320
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rnc1OvV3U/gwC+BGfdFIj9X0
	ZgV2oXUIAGTErZwS/rQ=; b=ajeoGkG72+UszQfqRQjwKJvpTzVW/N+uTk+L0ykb
	N0OeWNHPAzLGMFLydcu/nl0Wx5qecgAHaTagMRuhn1OgjXr4UaiFkJS/tZd/36ju
	saSnqUbLo/EfXnikVWyRioLyYLulomrn5+mXRW2C42hs0oDMZ4ItmGqmoBaK6TOx
	QXkJVm4BfzVCeCbvEuIVQasEcqljMuop9N4B1VOCS1UXLOcZ0btyYtAaR/fCYV1u
	s+Koc3BNmPx5hFNUqvNo3ATPis06z56ZSshoO9nVZTMMPHSz7wcZQvRh+KJ+HLYm
	qmn0yPFZ995V6OCDl1tfLYTtSaT4nV9zKmSZZLCKgqRa2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxjmdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:37:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1943335eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791700628; x=1792305428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rnc1OvV3U/gwC+BGfdFIj9X0ZgV2oXUIAGTErZwS/rQ=;
        b=eV53MTpyOSNl0De8KHnenaSuZQcUrgNy1BMAtd+fy04HemGaBJwVjjuGJ7TVjUzl3j
         puQ3zgkaLNz+nXCLeC7JvD2EJqaGIGClFyvsPqUfsS5tcN73JClRTprKNDwO7CS8gVGV
         Tp1fTHw6H3YX8ENc9wvP1j8Kjvk8tJHsZ/AH9NVU+yvlWR8zh76j8v+/klTjATmyGDjo
         lvbVnsJtFYx/6o+mprxUpZKQCq7l9pF60JEJ3K7dGsrI3F4UTGjPUdrVx7ahIgxtYLaY
         4KSsu5Qlk8O672BECWETcb3/asC/BjS39DPIN6P5cVmVgSlyD/ARCXdoSFkkjXlHG2mW
         3IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700628; x=1792305428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rnc1OvV3U/gwC+BGfdFIj9X0ZgV2oXUIAGTErZwS/rQ=;
        b=oIygFwXePCrfJxmT65DEgHUa1FkvGyUIkICEbreEVFIGnxB29Np4KlHbXcnGfzrpTt
         tBr0BgGuM/JUIi0sKm7RoQk8EHBwOtuwIPtdbF2JMsSLfqxQQkLV4LC1skoBvdKugwEo
         cDwUpYVpAhZAZ49YtKF9Zli0c1Nhn4P2LyC0ZijhraLkfFbXFfKx0tVmSdSGebjdqPED
         6t6jTx6xa+pIjPGdntKTOQ17VGk0EtsL5h/iWX+2DnTJDydjWFEKnjiSYcfRukL8fGw5
         hcoYl7vbxBKCBtPICifkdhJg7cdR5UrcnlKydxiNaj2pCth2p2bnLLai0WBqvWiLsvf7
         J8dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC4qcc/3rCrC0Q8MjxwbICghjQoyWIoqJcJVjrh32qBTtDJrNeXGCoTvnpcFHypd3mv55X5ngKDG/r46I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwtM8EqvIoPLrssCEUeU2RQB8t71p4b+kKWzncbE+HITxyEPTA
	gm8U/gYkfHEsN5ODsmwDPk92g5fgH08xQ1/Xh+h8QBlA88Y+ZjyeLxVHWX9AbxAIT7ri5w5IfVs
	hjxvhq3dzFNyKqS5q3/xNIqnwn5srWYo/mqGxxLHdbhVcYHkn6r92CwO2OPICf7lyxzLx/OR6kT
	I=
X-Gm-Gg: AYBFou3r+BH4yikOh2eTPBm52GIHPm6KgzMZreC57DU1ZvjK7EfnoxgANT+g6PnJdJ/
	i13LX6a6KVNBRil6eWu6uYMG1fqOX2eiGuXWnLdkPO+9ZfeitiOFUTY1VBaEabaEqctX3N9dQuW
	ehNWeuH8Uf30SC/K+emKilywkzllVNPADKtyqL5Eo7C/f+6I0PR3IZRu0RA/UGlGBfynXYdg3QC
	RSDS42mMESGjSiZY4dURiTX6F6uR4sTd8zweMUSQRm5bw7kb8Hg/lGUZJ7HJYLm7d5aEnG94mAW
	x0b1Aw6m9SvLdqp2JF1an3mDnSheqQ0FfXBc6/2qMt66MsmjiwPszR0xH88oXMZy/I3D+zs4o41
	KvRZ6ECRRs8qaFTcUqAe6OIVIe8wNWaZNm7b9TCBesA==
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr9337661eec.23.1791700628206;
        Sat, 10 Oct 2026 23:37:08 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr9337612eec.23.1791700627378;
        Sat, 10 Oct 2026 23:37:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm20811159eec.30.2026.10.10.23.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:37:07 -0700 (PDT)
Date: Sun, 11 Oct 2026 14:36:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] drm/msm: Support for GPU in Nord
Message-ID: <assuimpZe3J5E2rs@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OCjrdOxiKr8IXVfcW4IKbFHnDcIr0EiG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfX6Yp7/YE5j7A6
 aYJMBO/RC8+n8SypIZkZ5HbLx9Cpi5TTkynjUh+c8wGLo7P80jkUeT4EsiW8MX5FvuXeXDkL/CP
 JE4DZC9Zpf78QoOejLlauHUsZb5Ac8s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfXxRsAxe68kQnt
 OEuGfcj8mddVcIPBkUeiqkdhfBDA9tO7DlyxygCe/fsPHmWmV8MbrbHrCdGapcfgDvl1Pil75mB
 vQm0Vk4EUKgSAGgvsMjQdG2DZtY+UOjaiW4N+1LkZ6w9Buyaqk1m+KAffrL7QXaEzX/0AQxLjHa
 oGgFv/4gUyjjC4udfOmzyBg1o5MFjOorzwtrxHennhOsrXK+MIkwFoAKHKTHEe6DIHVsq0302mF
 DhskTm0kbOZHAbhMcjnTM3znXc+vIAX2zsSrAstyOrkrnnpZmp9943ssAZiyvhZdTEXN1qQG/xr
 KQAGZuupUea8AAphbsTQnL7JNQoASnk8Q6BN4nvTScJVfViZEMzEthLvAFbJNc7lHDslMLWhgq5
 4YxVETmap1TQliv/yJp8E/IQeWBKvhzCvMZ2p+Eic9UwlYpQCJz5VKjeqSV9Hjk4nPcXJE7DRhI
 uRFzOmcdrbpZBGZYUMg==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acb2e95 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7srVW7kWV-eK-ianrkkA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: OCjrdOxiKr8IXVfcW4IKbFHnDcIr0EiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110026

On Fri, Oct 09, 2026 at 02:36:34AM +0530, Akhil P Oommen wrote:
> Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
> an Adreno 753 GPU which is very similar to the existing A750 (SM8650
> chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
> This series adds support for the A753 GPU. A735 support will come later
> in a separate series.
> 
> The driver and dt-bindings patches are for Rob Clark and the devicetree
> bits are for Bjorn to pick up.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Aastha Pandey (1):
>       arm64: dts: qcom: nord: Add GPU cooling
> 
> Shivam Rawat (4):
>       drm/msm/a6xx: Add Adreno 753 support
>       dt-bindings: display/msm: Document Adreno 753 GPU/GMU
>       arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU nodes
>       arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU

I tested it on RRD board (against next-20261009). While kmscube seems
running fine, I saw the following errors.

root@qcom-armv8a:~# kmscube
[   30.192468] adreno 3d00000.gpu: [drm:adreno_zap_shader_load [msm]] *ERROR* Unable to authorize the image
[   30.192503] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -22
[   30.202644] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0

Are they relevant? Or am I missing something?

Shawn
