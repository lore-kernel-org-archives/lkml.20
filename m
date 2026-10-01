Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C772335091
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820554; cv=none; b=hVOzI5HDnGAagPG7MYCw9O61MK6hqvsYg1605b27xGhh+98hlREz9Js3V1LzKiFVTBTSzoLvsR/Yz/sPVdGmB6pHRoSqQ9/AegZ1ngSd1zd6wwgIflK2p/iuG8/USl/nhBhOSRsNR8WYoIZwN0q5gIOqj1R/k+DafGzp31jI+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820554; c=relaxed/simple;
	bh=0nIt+mucMZ7/0cVviw8vHDoATuFJqqM2lNrKWKWvtn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paPx5fIiR28b1y9puaCfykTfuLpDoGdpXqfa6Mf4cAcoMKaBpOUgo/KdgSXjoq5D0z8qm34PsMHWiOKIqSFwCoqxo9JRPxxAZE1xfHu0iEwvo6hFfWr9208NUyCfpoBduOhYG9logUTDsySZUJ/ieX6rDCcLRph1jpgZ78hWosw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZzb4Frw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOSAdlRP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZzb4Frw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOSAdlRP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k1wF2012358
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L7hGipuSz64raDNfiC6PIsng
	qaOE5pky0NmA3MYUwQk=; b=OZzb4FrwPNf2OywrAVYsZB6vxvz3pJi1NNLoQqwk
	RRVfZtXMRG4fgl5MFBRznl0LZAB8iW348pV+5hl3ZWICV2EE4D2lMoNrleAhfjxx
	Z61huDEcHt4gApuk9PXcq1X/tKYDyRqkeOWBVrlH6D6tacmrbTay3eXVzhCuvZ9A
	+8Y/WIODkdC9kSdSlf13JDqf/c4GYqAR797WoeLuOBlqsimiLG9ztHl63/0y5dDy
	5kA6xyGpgh2nRCkfPaRai2hsmOnw4gBcliwLmt0qqhROGXm8m6vxdeZ9YnzEpKBn
	4TPUErMMJs75+Ph2qQwCNYBL0hTNX0E4vnwm6EtO90oslQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh83yje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:09:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso291003485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790820551; x=1791425351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L7hGipuSz64raDNfiC6PIsngqaOE5pky0NmA3MYUwQk=;
        b=SOSAdlRP80AY5NqDsDsYTF5fuQ/ecORYwTON4DxJWi2rs/PsTvpv82RZ9iKbXhdSNW
         ovwnKSowRwltGkOfaTtCyEopH/h00oZo11SnLlxFPU+GSr+af4UJ0MPSUQkLn3zdmSw7
         QrtO7dWsSMujU9OEbG/s0jt3+/hsb0KmlQAhm59lZWaF5Tw5wCgm2SZwariIaeVKG0UQ
         XcsqSgdKLgeEXhJMAAs2qZAdDuh/MCFrC2LJWp1pTT3NQv55+9B1yYtlrKmXKEyRXjsY
         BVz4jgEHMoPMmeeeJstD7mbHmiiKLtt870JZlmqrcA9DfMZ6rx2nnf+FfUVHiYAro+CI
         U54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820551; x=1791425351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7hGipuSz64raDNfiC6PIsngqaOE5pky0NmA3MYUwQk=;
        b=aRtVGZLplZOz9z8ywo6O/0jonKo0hsk5tDMPSaTferPeZk9pAUJvvCXFosPZZO3ZRQ
         L2DospaNsfpB/UYZRq2+jtIICvNN0lt2RPgJU0HWQgSkAtS7c9+sN8uw/2GiFje3JS9V
         nBXZQvbzF3Mqw3WsZqtIf5h6UsJ9v9voNHaZZ/l5y+7RiYGx1rL4ELpGZTWPbuD5D+KF
         7Aydyd4mzSLfqZgtbYmZrLhACvNM2goTXFMcmbq3ekUDLLSRvl1K/UbAXWSER15CIJRE
         9IfWTI5CQ+axilGy9waQe2Kwkdt/IIUfTUdBp5sOIlKAHvivUfTnm2rHVyb2Dmp0SKPi
         AznQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0oQ5vyOLq8X2Q5eGdav3drwWw+4nOaH8oAnXXrDWM9u2BAToU1lcN9841gIZROmjVvivPoBalrBicv/M=@vger.kernel.org
X-Gm-Message-State: AFuF++ka+KyNes7KmFE28Hh77vduqz+aqSccgP6sh1K14QxqNNnVQABr
	9fTu34q+2XLwZr6VGVxE2BwWpe0VlCqyqjYEzZo1ZE/mHszMa8FHglgOAClywRzahZUh/8aqz2d
	IRLm2TAec11RTo2vXoieofASUaCcUeOc+lwdv7Dwym6LQIaVY/IRGeUVgZCCefOZL/9Q=
X-Gm-Gg: AYBFou3a5o7j8XWaX3MzBxcpf6PRaWphMCYZXNhJ5e3KmSeyvOhF+8CiWkTNeRj0esV
	QQgUo2cXjkVlsJTjnT5mYj6+PAG22ULmfRfCdGyBps3dlelBdbG7XRBmGLIDVuwmAdbQrKgtILN
	/o10zzg6rX/XY+12dh09HxMY7vSd3duDRX2T0UFwENbKlcw6emFozt+SjWbrQhDTxtce8CiIAq8
	zw6kqgsWcIotxYuXJwC1p4TAA02pv38dlmE+v4mtl0aq9wbhB/2mNtAksR0GjETe6Ibc1qPm97m
	+hhtU8giu0v1UMV03sIdaVUvtHcV+E/yEeZ+wP5g9q1xIL8e/5qu5AI1Wsh4uNCbSalJquZisvh
	42HSDjWahAaycFcnpzTUqsLfn9czqCyvEgHTB/5QJERF6PQZMfxtmLatMGvU4dcd/Nc0MvgkdrP
	QM0Y+tr6zXH7+h
X-Received: by 2002:a05:620a:7085:b0:93c:56a8:a0a1 with SMTP id af79cd13be357-93ca97db266mr609700985a.58.1790820551433;
        Wed, 30 Sep 2026 19:09:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:93c:56a8:a0a1 with SMTP id af79cd13be357-93ca97db266mr609698785a.58.1790820551043;
        Wed, 30 Sep 2026 19:09:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf388sm348995e87.75.2026.09.30.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:09:08 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:09:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Roman Demidov <roman.demidov.nn@gmail.com>
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
        lvc-project@linuxtesting.org
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: check pm_runtime_resume_and_get
 during resume
Message-ID: <oitetu2hyrg554hq7gzwfmtardpbaqpsipthukh5mqu4sr2zfu@rkab3aekdzlw>
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
 <20260929142103.81854-2-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929142103.81854-2-roman.demidov.nn@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfX7gHoCY7fX4rQ
 pRnq01LgSpQmXJIzioYp0w2qhjBxq7wMSiGlDEJCI3LuhomSDre4AWCHg9GgEPBqMYjenfmlGCx
 vUKyMoAh4HmBd+8pqYkHZcValZGHrXAG1hoZgNYtCQh1g8h+eimSXVGtFCpN2gMlpJjd0fu3f22
 PeK1b71q2IeRSNs1HMyLc+OAtpWO8+Z7SCc67xfstoF9hdUw5EjaN8vgY4+0Cjw4JzbrQjEbjcW
 js9BroP5dZd2VE1KRyW90liV0M8gYXDUlr7wlFk84oIQpvA019AaNMSBobdOmtn30ockQwP2DP3
 5TDnmjzHbw/rqNNT1x3N6hRv8+4GB1oHFw7WePAK35Q/q5YWZrFzB10PG3KQrONEBUljEBWFjiE
 qxjnFC/cGFIZGp4nGGcNNI5ZNgeEqceddZxIszHi58yj14ezg/SkxEfojIwZGlFf+OPZemUDJ5e
 PnZ5Q/nhJVrg1Vtnj9Q==
X-Proofpoint-ORIG-GUID: JkD9cjFoqLXzOXv-YcvVBiltC46ciOpa
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abdc0c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=HH5vDtPzAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8WuSQyhVeKmarUdqJEgA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: JkD9cjFoqLXzOXv-YcvVBiltC46ciOpa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfXzoYwoQ2clb6x
 P2ftniNZDPF1dV1gAlBxPkWaT0IJLypMfAv+chg99ki4mqRuBPF5DNiB/tL1ny2lkr7RWY3oBZh
 rXoDfDBmZpY9k2XAp4PL4lnY3hjPMyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010008

On Tue, Sep 29, 2026 at 05:20:59PM +0300, Roman Demidov wrote:
> The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resume()
> are not checked, which can lead to hardware access on suspended devices
> and PM reference underflows.
> 
> Fix this by checking the return value of each pm_runtime_resume_and_get()
> call and properly unwinding the previously acquired resources on failure.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
