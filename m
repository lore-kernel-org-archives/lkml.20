Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415874;
	b=mzAcHz7SPMCUKcFYQjgRm4PuFv0wUICHx6aacfAzVI+0srBFR+V7UfXO8gzbeZpU4NX8
	 Mgp5kn3RdWSAA1ppvm0jlErJ97CpU+HFoRiUEM6md9pBG86y1Fpu01UiU3sJB+Jbkiau8
	 SGtxPbcnerqUDbAzC6qTP+qg5mh4VERflfcnB7waWbayPI4nofCf55eurFOz0FLVjEE4o
	 f0TECXWoZsVL+G1UQfAuSe5+ShWPoTRc/1b9g6CT4BtSFz7IljWggOpFpF06pXt9fMbzX
	 kvyXN4tG8rC73gsNAfDQZyoiZQakGIzA8oCnBvAdaUxLOraxv1v+RXR0sFiNp4kGt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wBAAd6ypHpzxF2jT/1bccNXbO5jGvqIht6KXoRaEevU=;
	b=DZxZ0nrgFKAjtOsycfWN8bcFXlGt2wxFKSBCr+a96KwCoGL3HrtnwXCd08AzFDhS32RT
	 fQkjm2k6DRM6ShaY9mAo6qwYtLq5LhNoGZexeKflGOXn8M8l9KDdB4kAS/DOZfJU0UFKh
	 mCYp7NClN8OThTmiVS0XD1Pv2JitISjmaBTnacYot3LWow2IkUyMIIDdGxPlMKy1xK+1U
	 cRkxyl1h/HEfTcaV59oKDzlwbkcuJj0du+7Ic733yMR2sZ6gttmWcOa1B7qYgNgK7nKmb
	 AaxfVmjuAF5Lrej4ypDw4H/JEMdcaUoczfAc0+u6gsXOxr0JxOXypk0KQCk55FB8nnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV8EPPlP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erI7PbBv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV8EPPlP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erI7PbBv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFP4T8014264
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wBAAd6ypHpzxF2jT/1bccNXb
	O5jGvqIht6KXoRaEevU=; b=PV8EPPlP8R/QMTcciijD/zUP18PFiVlwC2PX/1xK
	mK2XDM36iH6gCRs02RXJ3lGqQvXO3dG+90bDX9RTuy2jw3vDxkX/axOKDZZLgtvs
	MhrwT/WBJnBDGNJ4koKsYc1bsZqI07HYvkVx802EzJ/dntPT5/TVnFRdKD08C5jJ
	dqHrE3SL3Uk8zLb5JenoxGP8gV0qxQUsDLI1ak72okG4CjWmQSnrVp/dI8U2KVy2
	+6zEcPtoSUdAZzvza3iewWEafmj4HcKRLwbJzJQaAdeqY0yhWyH/hl54jADuF2D3
	VSDRd2Mqi8aFju0vS/VTlBW8BrmoCcV5/MWIgo0U7F30RQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymrcbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso616908885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794415872; x=1795020672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wBAAd6ypHpzxF2jT/1bccNXbO5jGvqIht6KXoRaEevU=;
        b=erI7PbBvAqKFUCHDRqbrSK+dHLr5CnuVZRKWYpwClvoanMygWS22hpwtw00+6tbVAw
         91WzhH+UPem6S//putUJWRNXFutYbgpqsL4A1tS9Bs9yFl7f3k7vN5MVjCRkM0wtOYLo
         bTjsYehYb4ghaYHRJTKMEBt4BZ4A7PjDn76n7oZeDWj4O9Yd1wacNidGIbwXudCzOf9E
         n9HbevNrttqvG7CUkUjJqrOLN118/mIBS3nDhbn5uTJ54xtXVXBS4FcOhXH0wDXtchet
         8SUlLD9X2O3vkG2nVBpEfox52JfzRKfQZZXCodDoeeyuPL+R7W6O/TE4CRWkFlrCcfC4
         O5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415872; x=1795020672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBAAd6ypHpzxF2jT/1bccNXbO5jGvqIht6KXoRaEevU=;
        b=jjyO6H/xTQgY0OKlD4vgXpDI38CcjMyPyRGCNCyEwJx8ArD0xMrSzB+oF30y5kvLL+
         wiT53hqw/uupE0CsG1DSJypl+TDI70aPoWmhw2hUQt0zCV6N1h7vDfMDKI/5guGg55gx
         Bf1SL9weFdbDVdeU0H96iwTW9kK8+ti32Aivj/N0KMwEgnfyPriO/jJK2pe0TAYwLaNw
         i1MP3Znpyg3sM4s50F08XYw9MOT/7Mo/AtHWAI8/BXYKTRQO/tUBKVffK5SjbotUOtdF
         qk2Gt1QAROPiLr8Ei4ko2mV2SRHsrOfXmwlrWO7emVYpJIuhqbC2T0UrCDIlStmb9NVU
         z43A==
X-Forwarded-Encrypted: i=1; AL+hErFKgQJEMGjHlk8m4XTeAbVsMH76N7xB4kgFYtFFlO+Bk6qPuFZyW4AMrx0iw4Lvad8h+OBuYQRVP2BM5G0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IUSq5Y7c9f5oR76/+2XB/VBWe1OEGuuqELoPR97BM7TdiNXpJ
	ZXFoFfnx7/ttM6f9Xj5dKypZSwIhypinbeomcsltjMbHAoCW9uGS/fFw7xOd876v0uYyMCA0dzZ
	mTE47JdVllKEG5Ga7ETO2VnUcP0M750VfF7mFMerSorxyuhk8DXVpZeMqon0RRIuwMxA=
X-Gm-Gg: AYBFou2F2hXDoB3JXWM2FiF6VnOwPDckXDMnO4kOS7Ppgz+AbDBArxx0y8ygWaiwOOL
	NHKmQ6A3mppFGtshvQwst3wenEcCCNi+43F+N0cbb+9wLTNzr2X+7/y5Ng+5isJudCvXBRNjcM9
	XZDCqTEv2FS3rG3WkOMnHiqFQJWc5xz6vsZ4oZwih7sR0BEY9LHDMBc0eY/PUXB6uAsjEUR2one
	NJILQxrcdsLV0ppizpCVNSfVqFvg7eRwqINJPl5oCYPmXtOqqmgwjP7mKY1eMvH1oBqT87IWq/n
	77smMyxUIvG4FZRoeu1bRcW6Mamqnzhx3Z72TTfO1KpXjuO6nUCTgL1jZk4+XNtOei4nLhdW0Jr
	vuLQOs3iyf92vMF3ZvncCPQRMJ4b0CShBIRSWB7bJJzRwx7xUhS37TZ1g9qeAx/dnXxoXEm55hA
	Tw/bw+J5PXKNQ+Uu8DaB7uvToUso3QzjXVx8uDUcbjh9QH9MJHuOO0l+1olfIuMQ==
X-Received: by 2002:a05:620a:6cc5:b0:93c:7e9c:3bba with SMTP id af79cd13be357-947aff8a94fmr488373485a.41.1794415872086;
        Wed, 11 Nov 2026 08:51:12 -0800 (PST)
X-Received: by 2002:a05:620a:6cc5:b0:93c:7e9c:3bba with SMTP id af79cd13be357-947aff8a94fmr488367185a.41.1794415871533;
        Wed, 11 Nov 2026 08:51:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15ead140csm400318e87.22.2026.11.11.08.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:51:09 -0800 (PST)
Date: Wed, 11 Nov 2026 18:51:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/msm/dpu: keep SSPP priority order for split
 planes on DPU < 5.0
Message-ID: <f7rshy2tnugyeuvjuxje23qnx256x7rqed2sswt5ewfaqntz42@ajnsw2t4sor2>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
 <20261010-pipe_order-v1-1-9d8bd29fd78a@oss.qualcomm.com>
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
In-Reply-To: <20261010-pipe_order-v1-1-9d8bd29fd78a@oss.qualcomm.com>
X-Proofpoint-GUID: egOqYKnR1EhevbLqrCh6MLSugUmNNUN_
X-Proofpoint-ORIG-GUID: egOqYKnR1EhevbLqrCh6MLSugUmNNUN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXzo4zEBFCoDTX
 Pvw+I3cWZxPXU+CdnUtTIRhF0Q/726gB0E0E+CBe6sp9ZJBCdWxmq2XcHG3XaOkVYSaSTtuHx6N
 o192xJZfqkA4mGCxGwkajuMKEh4Z/YsqpYge7lNj9tlqXJ3oluIszuJKLjKbaWOUcPVqdsrscuJ
 QNZsIfLBGuSHf/IdEGtYs4JscdicpmthTVZ8kYq+QWjzJKKMJtwjLKP/QIkOZriRcj4gKZZI553
 UYloiC+ekyFv0lXlMFzVAE88fS/55U8DkVRQUhRw2XX9nrrsRQEiQiaEOAh2tknAc2UuuyiOaMm
 mrm8QUxNTyDNpkgq4f2Ac9riQ4i9ZTSn9Ev+uTwMg9I0gJKEkULjGwfPi2JUlaQxc/P5hVc7oVb
 cB04nVhp0n5N8SC7a0KrCPQQpTOALXhdaoOA95SVGGbYub3amF/0kX8o0fvPcR5lqQ7PcG6cUGm
 ulkamPlOI4/tNzR2L/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXx5jC+82d7djo
 lrDiTfwpIhyKoiqZA1bSvGrN9htlAgijO7kmjiLSDxHZF8XfMoInRPnwx3tgPWCvcYZc2QYTM3q
 i5+65sxKR+OGvZGe4aiTcLt2qYeiI7M=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af49d00 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vBrEaMr6vtUGFZbctIQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110067

On Sat, Oct 10, 2026 at 07:08:21PM +0530, Mahadevan P wrote:
> Before DPU 5.0, the layer mixer places the higher priority SSPP on
> the left of a source-split pair. Priority follows the SSPP index
> (VIG, RGB, DMA), while allocation prefers DMA, RGB, then VIG.
> 
> Swap the two SSPPs when the right one has the lower index. Both are
> reserved with the same requirements. Same-SSPP parallel multirect
> already puts RECT_0, the higher priority rectangle, on the left.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
