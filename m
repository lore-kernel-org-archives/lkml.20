Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588079;
	b=wReqXf9qHxkuHLhrT2/Igb4gk9MpiSR5pEQciSAqPlRACVIuZ/m44g57Mw7G2Ojif6mT
	 pU4IC1b+ISzxm4LPDTkFwO2F7t3Z6NaQ4k/fxMpu3bjutab2kiKZHgdEdI017exNRDZqh
	 6zflNwMfn4UW74Q9gcNfBCJ9HpdWeSaFJJRnQfjSqC7gCze2I52XcNfyJl+C2Doy3DI6d
	 N7sXOb7YFjZhAz4fEsNuGeJ5wDbCdin2BHQgcsnEOd7hGAcVBX8UmfS0WZw6vvF4woZj8
	 RoTLHMW/lQrfciZQ+1+n0DBIh9s0j0lIWGwXQTSk4xWYFyBBmZMy5ATnY5Utw599+Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588079;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uHps6C48bjErWLWTA2jyVj+V/HCuKfjWf7ze/6BLmro=;
	b=yGWWXCGcETqQ5Xo2G71cHa0q3MZCedcL3I5sHnVmVXCIy+gwln20hDi+byW61dsR26lx
	 Z7D9UJvJK/61fwp/FOzfKZaQLG+sC9So5uymOSqw+m/A1tLyQ5hKAVZ+yuubprtZa6j5D
	 bS6S9jH1MxrSWaE7sAqOBon0V9LXGSol5ip1WwiZnAiw9fjFIq6+zyhKyAfmtMhRiZscM
	 98T38FozycbowOi4AqNSLtc/aRb+ReEm/v12jXw9BLaQ2NI44w84+G3ov0ri7kTRZ5yAN
	 4+PAa2AufMP2nhF2BMdvAvsWT/hXHezavGIh1GjKnZUl8/OtmbQbHTUNVjMof3nFf9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LlwgX1B9;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NqN65Qjv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BC3606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BC3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LlwgX1B9;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NqN65Qjv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg4I0325099
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uHps6C48bjErWLWTA2jyVj+V
	/HCuKfjWf7ze/6BLmro=; b=LlwgX1B9QPTmQmXJZC3FEVbGiGYzEgnKeg2Kv2j2
	x73Z6bydNkiDaDZz7Rkt36TgSMxA0Tcon7A/Qkx9jgOD1Gr1bX7uiFUeqxlYvU6m
	OBRVwUscuRRKuGqCYTHFdWJ6YCGGMfYt2upE8FItNlJmVASCW61RC9znVFkT611h
	tqRBVbVLIFrFdZgtmkD0Zrpc15+/D0sDRrbJ517N8TSD0K8NaN0Wn7VtvRpn7Q3f
	sgmJ2BUqwy1GDryKVySzuOW+wr9/z4nWf8gLxYeHV9EiBoR/oOkdP8pvQHlcJ7xT
	YSeiW3AYBYrq/mrwwj7o8LrXnjMRdplYPaRd1j9irawV2Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v42tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:07:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so2912290eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792588071; x=1793192871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHps6C48bjErWLWTA2jyVj+V/HCuKfjWf7ze/6BLmro=;
        b=NqN65Qjvk51cnPaIJnL1Gu1v6zHApo+oN7v52F/O90ImUF8/IXxhyglIH1Ac1HMsiK
         mYnadnNi7w45Vn+o2v67sNMZYoZDAl4lUSXaWgHkUgQU+F7iUICQX+V3BddmsPF5b0bf
         dC/d6guGhO9DBOSed9iYgV49yQckJY6dAvUlBp6S8U5gBIJzrdIEENuwjzxm7wB5n2Ln
         77eejz5A7LkJCXmUJ47yK4YyXVT60aKerNU84dPNof4bI6hj5/w777zrq8zSWmvpEt4m
         K4yrdTwCj9e0XNAKslhSmW+BYq8/qc4DTt4OfdQ5l3caWJ+OiuWME4Akbl+NcU+abiOd
         FzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588071; x=1793192871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHps6C48bjErWLWTA2jyVj+V/HCuKfjWf7ze/6BLmro=;
        b=W2PTd94iLe4mYfbcSRHapqY5vUcsIqkjYo4TecZhy/sOz2qFlrSZMTNQ7pseQfo1RH
         Gp1RG0IEQ4q30V8mFmUzxOpybq28kliEns5JVruV6dtKI1LfD3f/ZElAjGubFmxUIOG7
         xdOdJdfyfXG7wavtCs7R1ce+6/nbIz51d3Ot+MnKL5KE1oLVtQwUh194+Eg1A5gNGkMS
         BZ15E8z7k/pKY8JSSthv03xOqtx0II9oGRm8FULhFiv4LH4Ad86rOkAiOiKKU3aalDlL
         JZME/0os7n5URhf/6Y+sRcFwEcs0qD8ik+3d6fz2HFqEAsqWg+CErKl+flmXjfiMI/+j
         r83Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7WxzCjYaFjC89NGk5DxTsGUasas6nGkKw2mWho3mV1j5gKCI36eTaV8W42hCkuRd41M5sJzXUojh2mO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhaXWTzRbeZoqRlnZmLWqi0Go4Ag4X2tAtSV+fY8L8KBTPTJ0E
	Yrb07ozuamxYczAIlsr6bduC4zObtr1nj3VcIPrCZL8C7Rj89XVBfNZ+RWqL+0QJQvyDJgC5Z61
	x719F70NxZZlL9BMIDGOaJ2LSjsghaApZAZJ0Nd4baa//o0CjTIRqZJh1vjtpPG3Ftww=
X-Gm-Gg: AYBFou2lwN51DRV+LT7rYY+VEnt8cmMf1Qtvitv98wBjDHc7M61H2NB4TrzuS0wg7nJ
	uUU/rv4wSYKlo+DvJhCcSdQBkSo5RiXQHgOiCCBn48AnFI085kNVEoifGn8f1JDg7yUnXnaaZyN
	ItU8jDy9HMZMJ89MSaDOQQkQdzfF9m1Mvz6RkO1YvVWVNFoRY/vecmBdopy1uVNo7Tvbi4KGCGn
	hMEvGCW/VpUq1r+5MXBAmjAGvtG5mr4BIWltAZXEmzDAo4hDiLOogegI4eiaGoctrCm6G2jcXKB
	rt8Cl09qaEuYMCNkAEwHlTV/B2PPA9pI5k1QNaddsYq4mMzfOWRNocioBm4kbHd05zE2vvW248F
	OVIUzDPt3WlEu8Ot7U8iRGa1HeQ==
X-Received: by 2002:a05:7022:7e04:b0:15c:705f:b981 with SMTP id a92af1059eb24-190a67fb474mr2783337c88.32.1792588070417;
        Wed, 21 Oct 2026 06:07:50 -0700 (PDT)
X-Received: by 2002:a05:7022:7e04:b0:15c:705f:b981 with SMTP id a92af1059eb24-190a67fb474mr2783235c88.32.1792588069115;
        Wed, 21 Oct 2026 06:07:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm6052461c88.14.2026.10.21.06.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:07:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:37:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
Message-ID: <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
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
In-Reply-To: <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX3Tm/jsZp5+Ou
 DopZoNye3ntivd63rS5QVzvoKAzJnhX3oyE39l96jeY1e1fZq2TitNWoN26EqEt3pUFcKoioboc
 TwH+gXqbKiTACXMNrAdUalf0+TLU29I=
X-Proofpoint-ORIG-GUID: XRnQEFEsLUuKPdf0ZnIfXC0Wcn24gp5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX71koYYK2urjL
 AptDHzbvIrvdyaHz1IwcWen1QpIiUjIlGjxFtxHR1cA9hJ+yIUNOvJtffQvHDn6fwhusJNwY7QY
 K+2HqaoZK4E0glYuTAmEXEMlQs/wRCKu2vhvjUWc5hWPBZ2SiG87keWBg80sYQRoU8X7c4LE7Sc
 vuZvmitzybOG69GvxzrBj39ixfMGfg56RhGcx+VriAh/Jl3T8VCcyrdfuoWHXhyKolfJKY0MVvN
 GbNOS+mkHuuVvh/ao1XXzQ7lJbKQEuICDZ/HEBRDAc0Xcufk3ETa/RzkMhBfQzmoh/QzQgEVX90
 xwHjjjlwALXqvV3exEQhkMjDMDtJ+mjUhBFc1F+Dv/3mpX+htjewxREQRyMQcr+pc/8sXB12fMk
 sOKYzZQilz0GR2qEMFI/qIe6VUvh28IBDJRe5JfyGHGd0BL4S1GOT36SWX2vhAKIXfs/wJOefO8
 ksxEdNACSbZbpqbtRmg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8b927 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wXrbNP8IbqZU6GI7zsQA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: XRnQEFEsLUuKPdf0ZnIfXC0Wcn24gp5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210052

On Wed, Oct 21, 2026 at 01:32:13PM +0200, Konrad Dybcio wrote:
> On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> > In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> > public function, migrate every user to the new PAS context-aware API
> > qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> > 
> > This series migrates every remaining caller of the deprecated APIs
> > (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> > removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> > 
> > This series is based on top of although no dependency as such.
> >   firmware: qcom: pas: Make MDT buffer retention explicit
> 
> LLM has the following comments:
> 
>  1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
> reload, because qcom_pas_metadata_release() is never called
> (patches 1-6)
>  2. devm_qcom_pas_context_alloc() is called from repeatable runtime
> paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
>  3. use_tzmem is never set, so the shmbridge prepare step never
> runs on SCM and the commit messages are inaccurate; TEE gets
> a real mem_phys/mem_size change
>  4. Not bisectable: patch 4 relies on the NULL mem_region
> handling that only arrives in patch 7
>  5. Patches 3 and 4 don't apply to this tree; iris
> iris_detect_firmware() still needs mem_virt after the load;
> the base of the series is not stated
>  6. Patch 7: NULL mem_region now means "map internally", which
> weakens the -EINVAL sanity check
>  7. Patch 6: redundant second ioremap_wc() on top of ath12k's
> persistent memremap()
>  8. Patch 6: ctx is set under one scm_auth_enabled check and
> used under another, which is fragile
>  9. Patch 2: the context now carries the full region size instead of
> the MDT size, which matters if use_tzmem gets enabled
> 10. Patch 3: stale qcom_mdt_load() comments remain in
> iris_firmware.c
> 11. Patch 8: no issues found

Thanks.  Will address them along with Sasiko's one.

-- 
-Mukesh Ojha
