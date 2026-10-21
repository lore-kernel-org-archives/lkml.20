Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604574;
	b=pf0QhzBpr3MjEoQ3OxDkc30xm42HmtEwrPYpoOV9eEL536VAuwnUNG579ui6tJPeA59G
	 BpTYbO35krXsKkzDnVAj5vJjzdPv3kuL33VBXzwjqhH6EkeJq2nKhL3wAfVfMXu+h1MX4
	 UFP2E0EwX87LsW2wADDMYCyKLtsUGGPUEaPdR8duJoVh8Gv+20WWjdCAM0PhS4yNhyUWE
	 i8kdQHkaRy0tt63CoVO7a2LxzUegKEwtna9X/CRpQHcszTalM3Dvz9mhNnz2XMBgYEgzU
	 w2aSpXceh+9LfF0DObsf3Zm0KlG2QaGdKZQOEKR17Zxr0Nban/Ij4/V4smkqCyo+yEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J6uuKNtXeb4uetwD4PZfD6MtJhK9RufAjFZJblRiWyQ=;
	b=lunTgmYZyffCI38AiitHK29BjeesgR1J9xZAQqeSy4ZPEkW9q+x+E91+0cUKBzSon/QY
	 Tzjh4nNDsoHD1aXBTuk/1NDWZBRVrudIC8ZaepIbonNSJkF5mgXqEJdlw2A2uliW03Bd0
	 /0GT1mg8FsN1pyXRBF/uZExt403KTcwllmCvZuT7CuMo5u/U3Knzvv0X73b6XGNIUBaYG
	 0zPlHyep58SVBmY9bCUld3mi3iYxYq6jknixyfCaN4NuE/zrJzMm4lngX8jtHlgTEFHNS
	 xfDmqBxY8dvnK4xtmrTJ0ElsI9pXJOtc2SJx+CBOZGOik5VvleQ8lZWHGn97GCWaXPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5UJc61l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NW+OdVzU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35740606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35740606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5UJc61l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NW+OdVzU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG4EmE2149352
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J6uuKNtXeb4uetwD4PZfD6Mt
	JhK9RufAjFZJblRiWyQ=; b=b5UJc61lKCk10wRlwwdluLhM8Oh0cHeTXdtRbdLw
	de5nxnODD42+dQF+Npftyjw2cbnPLTVyDsg7LVJ0Jw6V/mXEzm3UiTLnfgSu80mb
	i4yR57yXplDSr3fsm+VRFL6DsXDodLxYNIpQhHGgA4w2XT3cWH74iG4tQtke32rD
	Xl4zXJ/BJWLdxqM2iOQLUNlkhHHRMDvY/7WDZJnOL5RRMLsV08v5/zQJi75TXgFC
	1/tapy//63912OrCpVEYL08LMFAA5FsJjnfCXwtYuX9uWZjze5j3Jl92Mv4qwIOK
	S7OspoUnFSdLOgAnXKZPmMOC0AlPx91HLrx0DgxglQlyEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke0f19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:42:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso217153385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604572; x=1793209372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6uuKNtXeb4uetwD4PZfD6MtJhK9RufAjFZJblRiWyQ=;
        b=NW+OdVzUEUQEv/RcIJERWMhfZNFKRj9kZ9lQHNRnTNYaHcBvgKm4y75lH07/TJxCyB
         aJrp60lp3i2TuBWjJbTb7+ap84CajzpTcGdx8uzJLG69iI2GVwZLLUh4YDDKsheVkJza
         bUWYNebMvp/vXr5fQWoPxAmwgVHiYcpFzSD/7B8CrU1Ttm6Tmy9SLCF2wl3SI27kPrkS
         pLqR2eyXdaMdbaQF6RTPw03SxByMc7dDDWmRFXfJiJP5n7cf4t5aQTxMIqrEqFateibl
         UkHLrHo3+hZcdlKO6te5f1gEIglJJhLVV5eprPLclE8AeWYbDIkhDR33qhi5UMszbBKA
         bMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604572; x=1793209372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6uuKNtXeb4uetwD4PZfD6MtJhK9RufAjFZJblRiWyQ=;
        b=bxZc58LdsMEMs0FphQ7a5wzVSZDK1Mt1YK/VtftX65RLEZuMbhp8SWa69oYtG+A1JA
         avLP0erVMW+8dpG1OHLpsUrm9jTroeIhVE8UcnB0DR1HTwPpLV/d4mtvTH4Bj4NEK/x/
         ceeyIsw1Gfsioxg71RS10xjK6BAYaBeI0zsYmRlSNWahcQkpT3L4tBqa5m/K3L09TkT4
         g6EGU3b8+36UNChkzdm2LmDXbmbrm/mF3yM0ciS0yat1PPnKc7k1uhpIcAFjouUuX0X1
         eLKSof+Cmgn3U7eQT6PWUzfxXNkKNnXeKT8xt0kfal4aH+u60zNR9+aZBjprUM1nyFDE
         /ajQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAdBZPuIsv4qnsbr1K/HWPUr0Ym3+ZfIDd4zu+sqW2oKatWLuR+LyNk626A/0lrwBWUg8JN+9eFiO2I0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFV8g9CkDT3ySqhHPxS//ExnlRIVECrt/FSGpIwYd4prjZwGgv
	6BB9guQ11iqT7LhvZijmNncH6zCmXM2n+/4X3clUxRTP38pzY03S8EpSpgFfSTJmyCriWJASvPj
	ZeIn2pRCh8egeR0ywS41vilromKckfiYBvhf0IwIyznoL5B1k1fKBOVRt+EW5FTNysnI=
X-Gm-Gg: AYBFou31WFNhFqWMOiuJTjWzDaiHhV+cg2BHu+V8RhZW5rRi5wRh9bVP9kkM57Yv7ll
	vlVnh8RnGzK8fvf7wzGPH/WRInCkzsa/XCnLTqT8nfyniV1TWGJeSsxe8PIkdATOucw00BjlRPe
	jSVE2OIV9OCvbdJNW66bjEi72fmvLnKmD0aPdjKdlRwE77aJff4XuEVFWvbm0Nzqyr0xmjoIeiX
	0mhvemWuyxPhyykOpT74Bvvy+LkEuMKdMJTqSfvvDwKlvhVySUTUpuUyfa9ivWdTjS9vJW6FE0W
	GTSC4J+bGNtH5z36nPZJzBBgZ5J5S5NKst0g8zLhtTjD4G2XpVPhhdVqpP50AGlLlDmXseB/08J
	SXx1fI/XmkxAddTFHFRZzNRtd2joicMxcQALoIBCW4OYLJRMnU+pKis3TCH4R5GGDMPdjCFA3Nz
	RN6e1sy9plGZy/
X-Received: by 2002:a05:620a:690d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93f57f5ec48mr547612985a.59.1792604572216;
        Wed, 21 Oct 2026 10:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93f57f5ec48mr547607985a.59.1792604571628;
        Wed, 21 Oct 2026 10:42:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4df0c9sm1729191fa.4.2026.10.21.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:42:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:42:48 +0300
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
Subject: Re: [PATCH v2 3/3] drm/msm/a5xx: Use the downstream GPU idle timeout
 on A508, A509 and A512
Message-ID: <s5qnjxh7sj4rtzwg46oeeukeg3exjxjxnlp53c7ldyi7edpau2@sf6wt5xdw2q5>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-3-457aafbb28da@gmail.com>
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
In-Reply-To: <20261019-a5xx-gpu-pm-v2-3-457aafbb28da@gmail.com>
X-Proofpoint-GUID: W2R3nSS1DZpEA-ShVqI24zxZRb7Sr7ED
X-Proofpoint-ORIG-GUID: W2R3nSS1DZpEA-ShVqI24zxZRb7Sr7ED
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX0MdG+nzswSMn
 uSaZqU7zT5MpRIvatVpktgFJUoS/41lAp8RURTbfLjMwzsBX6/2yYuVkYdiz1DQYYCLprnawpqE
 bP3N9Jsjqp5IlRTXSeNSMe2eChFt2LM=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad8f99d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ajoyPTHG4wiO7EjX:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VJCrZHs55krGogs9KgYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX0ziu8IRfBAy5
 locboU/vM2V5QhB4vNds6uqvPELXzxL/bTjcrB/hxfte1TLFT5Qe54tezBDUL43u/1X04IOXXY4
 T+p/gV/yCEIZwjxCm4hFldHchIh6EEpgMFPI00ExeypfoPymAEs4N1Yr7v6zbaHdpoxokadxLm/
 Io2z1bRBxMDHrwbPAF0SpicJcAGkrFhTk0HXOCmYijH4q4zaB1gXBisbLwEkA4g3qMRfaxjoXoq
 m9g1agEf1F9G+3G2UL94d6I7d6o57kWGbBkRjuAc4LyVpMpH8iZPi510F8Yfaq05a/hvqs/sBzS
 3owZRD46SKPdEFAgFm+hW6g4pKdahzTLPHzd+fatIxbACqMdyjcfskKqrfN76KVRrr7i45tK4nG
 NiE2ao4cQ3fQYvOoWYztrtcfK95SnI2vsDo63Wr8DFFzhwnvvqK5Qof2waq/V2dBJd2EflvFfJh
 sBqOlYXLXxKcf3cut1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210070

On Mon, Oct 19, 2026 at 11:05:10PM -0300, Fabricio Akio wrote:
> The A508, A509 and A512 took the 250 ms runtime-PM autosuspend delay
> of the A530, raised there because quickly cycling that GPU's power
> hung the system. Qualcomm's downstream driver powers these GPUs down
> after 80 ms idle, qcom,idle-timeout, on SDM630, SDM636 and SDM660
> alike.
> 
> Use 80 ms for these three, so the GPU powers down, and releases its
> CPU latency request, sooner after its last work.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> The value is downstream's idle timeout for these SoCs:
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L71
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L73
> SDM636 includes sdm660.dtsi:
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm636.dtsi#L13
> Downstream reads it at probe, restarts the idle timer when the last
> work completes, and slumbers the GPU when it fires, dropping its CPU
> latency request:
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/adreno.c#L901
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2981
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2467
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/kgsl_pwrctrl.c#L2753
> 
> Tested on an A508 with the previous patch: 1381 GPU power cycles at
> gaps from 50 ms to 3 s without a fault. The A509 and A512 values are
> downstream's for SDM636 and SDM660; tested on an A508 only.
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
