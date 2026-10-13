Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8033372A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894313; cv=none; b=fB0ZSmsZ1diE2gyzKxoA4i3oUyADzT43Kz0Xdo35E7k8a07AsNQNnlIUOmHjcbRIRReEOg3Gr4W1iZsJIiKPvfmdrmeMdfkCKS/Q+EXsmXyYk00RCGULNc2q20m7GmrPceLS8r/BaeV7wFZSxCYO1AUP/jaidho6SPIMgeWPOAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894313; c=relaxed/simple;
	bh=kN48EpqyE0d1QMaITv5ujVGH6Rw8swFJtyMblgqDkuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rgjb9Q+y+mFu1Dk2zi1SRQtWFN5YPVWmslJx8wSZKBK38Erqzxwx3CualTuRVo+rwd6vLZ+3STAmYoWjrzjlWNH+e213GTC46D8vQJG8ac8n4GmAiSZ64kRR+mjYGXEZdgUTjOVtM4KLuv7ClFeH1fbKrsBXV9QPDHJOlQznfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMAnlZC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLv508KX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMAnlZC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLv508KX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OW5a015194
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SIcDQaXu/994wf1s6RnqNPUd
	3EMpsW+IvnRQHDqw2Qs=; b=HMAnlZC0KAo+kR1qsnV8zVEZJBFpnpzfHH6I7zey
	UJ6iu+ZZnVvxfLZovIvmbO0gEeBgsiIzIaVph/NqgHqdzMEmW9DuVCvS7dfLK4k4
	LXfBh60NmRJPeXNp/Z6gETmpgub+Orzd4+wMZrp5ZNJZ1p1HDmJ6COxUMtkrkSel
	0rgM9T0lSBB7hpjQKycUmxHAsinCboDuxCfX4vHp4riXMr1NZziwbsnZGisXSDV5
	VSQTKZaSV/tAJ52U6h0nnxdJWbUnHAl9caIumfS87v+YD83mKt27BWPITgXtuft0
	09tS+RMOwByXcvEXTE9GLTesWoSIYQLRkgWlSk6hnGUwsw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uh73g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:25:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b994cb09fso16663426d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894310; x=1792499110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIcDQaXu/994wf1s6RnqNPUd3EMpsW+IvnRQHDqw2Qs=;
        b=PLv508KXhGqJDoLlQWcPi5ctMplI0T5ZWMCGh+es4yZtwszLptaVSmzVSwL5F3vazn
         7ZhyDVD0ey+kKAvCoK+371krpgtb+MhiQl+cLEesKrP9+LBWCbIyZMNQ+puc1PY1fRF9
         vpD6w0SygeGUtI5tPocGJExeVsYtCTNvmBqwhJvbXmwavXP1ea9/HjlqINnd4JYEOGhL
         twDnSLVvroYIo945MDAuWS71Sj3RlRWUFPnrxliQ6qEDperWxZhg8gJqCv153vnihvHw
         ufeZXjTxCRFkcUeKDL/LeLSUzIw7jZwWNm0yl8b3Y64Qt2BUxlqLJ5/Be/PBy5/kvY5X
         5wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894310; x=1792499110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIcDQaXu/994wf1s6RnqNPUd3EMpsW+IvnRQHDqw2Qs=;
        b=NFCVp+9Yca+FTXUyZSY0V3IcQqQk8PKMHxlY83WhoSGGIxXMEcElo7nioS/YzMkb+X
         FnSg7Xlj5Nb2awOVRgH4ZVb5oLYSKEe0CAnJgu+rpeONFleM/M5OwDfUumWpGtwDUuTy
         Q7s4d3djWI/a7AcFs4NvlSPlUp34G3b4+ncYJdPBGQs+wx0pPDuJCpLy3mm5ulxVVrjM
         1ulVdtzv3QDpLjNFAe2thnNHY/iY+L2mz6rDDzVk5lFhoRVTa4YSZUzsloc01f9j/o9O
         3qnikavY0EhkoenWPpZz5iYos7Uf8cXdtY8GalNSVluET6X8Ku3I1R0UCkkQ1aFvR2fB
         bBdw==
X-Forwarded-Encrypted: i=1; AKwUvBz2cmhbbKH/VwfNbK49LlMwjWMtvaECKSN29gWNzjVhxRPL8flsT9aGIcebGTEuaCcK0QJtbZXU2lsgFDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvANTayoA+isK46Ba31G6evF3ZDGRsvEnNj98s6L0zb2H+Ahmy
	NTSrAsJMRVoK+OLh6hVFofHsWYfFOwL9il3s3L64S0MDB0sWd5cs2RfrsfNZPA84+LxylrpNrmg
	p9nalh2gVXIf+iMh1bKkG9ejWVkAII0hKVbuIP6kuSUd7srsBMTsFoKzdO+hvvnEFcyE=
X-Gm-Gg: AYBFou1KgfVMZaWldJfkot9T765cc6GQOleSu7SMcBs2jLL7iqVo/n7KQArHBqi4G+8
	lfvZK9a1Y2nMCDJf0Mff545lKBUNzyxiNmCFBt0MePgAgMTPEECtwc86hw30sobQlieHkrRmfnm
	pOdcf5nxy5qXm4kf2BQob+xLnrxyULXsE8+41qS49rwEttxFneT3sbTqvQG/SipDZQXEv2X4M3O
	T8RRSZkSXa+0ZIeeTYyaBlKe7QybjzyrR08JzJReLhjp/PWdhSyetFaIJbjKSVT31SYpdPx73eP
	WYc+6qC8+jlodYGk8ODLu2JnSmN3pGqI74djEIjreZp+Pcb208yuhOJsggRjTGuG4L2U+UychaX
	Bu/dUnKPL9eFBr8S8Lyqk1x0hjwSGrBOtrzNQq0ZCyKlH3uGGEdSwau1DDf0a/p1slSC8YT20zu
	7IcD5GXjbv3NdA
X-Received: by 2002:a05:620a:800f:b0:93e:c12c:9b70 with SMTP id af79cd13be357-93ec12c9f31mr1932230485a.75.1791894310110;
        Tue, 13 Oct 2026 05:25:10 -0700 (PDT)
X-Received: by 2002:a05:620a:800f:b0:93e:c12c:9b70 with SMTP id af79cd13be357-93ec12c9f31mr1932223885a.75.1791894309475;
        Tue, 13 Oct 2026 05:25:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9c17dsm35386631fa.13.2026.10.13.05.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:25:08 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:25:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/panel: stop mentioning deprecated
 devm_drm_of_get_bridge() in docs
Message-ID: <abqpm452aay32w3kpxp3wct747vi5shxged4mgf5o4u4fmzbfe@5gy7uwpxcap7>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
 <20261012-drm-bridge-every-panel-cleanups-v1-2-0fd272f486b6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-drm-bridge-every-panel-cleanups-v1-2-0fd272f486b6@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX9ETZvXjVa4QB
 D8mI1idU6nwblpEKyKrqmQdrkdqr8EluczztmaiAa51FofCmkJ6tT3kvMtkc55i8FD4kFFPDvZn
 yCapcdGDWQX7sYXU9cysC8teQUgmrBsF+aiLRFJ4Y1Bx1BzInGE9XpEbTUxnQyskvBleOKifoRZ
 8ZZ91EyhX/1E7D1CeCFDECKC2j7HnauytZcZblgjBVTrtFoFo7K1V8CS59yXcUVJj1afItk/C7d
 j8jnW+dsETsYQ+qtEKfgOQGdpAIW02rmxYgrQ+/DMRgwktvJcoMDcJgkUmnW2DFa4GpYbW/CN8R
 YiPhvPXt5iOCdwV5srPY4kt1TnyT3hZd9JgoKHYEtJmasMc0JaXD7/8GhriAkJXaEXuFh6ucRz2
 rSjaCqE+qzt0uWdnfM4ZB+okWaaMX5jlN4uzWJFA+uD1wKzNHHlNALsuptBItOcgSI0HUcAoNVV
 7aZ/YJ+2gFh48xV5HWw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace2327 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=5gYlZd5X36b-6VqQ97oA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: smQtAObLYQJDIFwHKfXTheq7lbOrOzDb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX8nLFeMVkHku/
 lN5p7nxji5/HOAKl7LpU+GpHRLhKYhH49qvF/I3CwKZfWR3+TfocPJAyzCKBr7AcNKyt4A7B3Mt
 57seGvV+FGBX0QPnlXbIU7GVc2cMDUE=
X-Proofpoint-GUID: smQtAObLYQJDIFwHKfXTheq7lbOrOzDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On Mon, Oct 12, 2026 at 04:29:52PM +0200, Luca Ceresoli wrote:
> The kernel-doc for drm_of_find_panel_or_bridge() still mentions
> devm_drm_of_get_bridge() which is deprecated. Update to mention the
> currently recommended API.
> 
> Link: https://lore.kernel.org/all/c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn/
> Suggested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
