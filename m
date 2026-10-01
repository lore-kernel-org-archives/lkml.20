Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255F4052A9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897439; cv=none; b=dmmD+zGF7WAYgC3a9qp1SoqKJfe4fW8LxQreibI/6NDs8Fgj4R4aaXlDlTo4tfN2crmkiAf/9laGC1dtwbPyYZaYUupg7Ilantu/5MPxAOVND7j70z2N3x57uWZfdxow0Kl/uQF0yJdxZCHTcyq6zlD/9XiJKwWNA9sTKViE8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897439; c=relaxed/simple;
	bh=D97DedcSn+Zwer4yckX0JWjfX+0T9Kq8fzLFq/N9bJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONZKfXUGTKTKhtNqD2TVtsmlToqNjzOUzdevrLQRpgF+SgDH7fYfUBCbujw0nT7wnuaC3QFwS/CL/1OfOzxXD+CUFJ+w5t2UYrGED31qEwTj0CxktOw/d6RHAeL4K+LhjJy+SbPSPvfyT3U3GSAYG5tcLvabxxq967QfL0M8ftg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDDE+JBP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGiPiAwb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDDE+JBP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGiPiAwb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NFSdT3829670
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 23:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4AbQ8DsiqRNyKzuYux5OlMD/
	rfuVBocWRxUHqNysAxE=; b=dDDE+JBPep5SyEc8jlf1fw7rJFKRDS/np2bW2+Z+
	pGEZxB35h0PtXlY59A8Negt0Zdpqr4V2g7rW5isDPxzY7g39Z+t0KTIjhaGIfY/z
	uShHC7pKtX0bLvZK5948jIsB55+n7INtJwZuaiYZw3F2werpTUQl7oxl2j1OR/yY
	tsXLIxYd//LhsQc1eXzSE7bkrNc5ruL+qluMcvti+/dMwmNOg1bQlocY0vdxPVp1
	wIZMtrMIfzohSQJdhJlVeyxmL/T2jhOlOddCp9KXBWlwbz49tMekLe/E6r1ezrcl
	g8q4IS3XzfNddY63Ntvf1sJS2x5N+lpvohK5szrSeJu0OQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcj891-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:30:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso176266285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790897435; x=1791502235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4AbQ8DsiqRNyKzuYux5OlMD/rfuVBocWRxUHqNysAxE=;
        b=PGiPiAwbMC6Vxm4sp1gwlg0Mdxzz4Jo/2lgtQZgy6WRJTr8kmCrBiaaYJA8OqyNOwf
         p8KiffA80OrhFtnMlqyYWZ1ze9WgMj8fyngFKFeR+9Kvyn79tGaI86TqD/LI9VJk+tv/
         K3QMNoG/DexSLYKG3v8El4wV5KjWSqmUuuipZz8jas894M9UnYzPDzPjA3+UVpusIZe0
         7L3ttAYTYNv/ESQSkqsIut6mvIXBBIAj3eWzjK42NwyYMuAf+owlM/Q4sQ9ZEapnXYIx
         A2IUSVWkYAEmZ+fmEM+LuSpucICvT9lIbd5YUGCV2FoJ0kH1HbfxQREiJtlvR76yGaPe
         RSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897435; x=1791502235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AbQ8DsiqRNyKzuYux5OlMD/rfuVBocWRxUHqNysAxE=;
        b=y8OBJGts3hSah9/MnvQoMABOgrnq7LE0JA9RF9M1he0U446QmwzEP3763IuNTPvQer
         Uvh4TbkQE/0pvL0RBjHMpB187rrN7fV4RA2ZaU5+rbFuBVb/pGNVmRx7lI8BIKGaH32U
         U8g1u4upP/6Tar1R6DibTC3pZnSz4gYfj0PFu2WqI7Yr9pSq8XpN4M2/bFyGWuHPW12h
         3I98uT21Cy9w9hQeP2yP/6nWSkRxVbeA9KR28tDvONcpjpgOzZ2ApwxgScN+Ut6OauTO
         subpW0cbX13xSHI5rij/BvmWIG75GdjzAyL+Dd8YLJ9WtyHxYavB580arD0yCODky22G
         mB8A==
X-Forwarded-Encrypted: i=1; AKwUvByM3MZ55nUJ0c9OoCzQHPEOF7yQksuYRcah/G1F29h9Xc1yoqW2Wp/5vPO0xtOTvZwUk3PoUbOLizn4SJk=@vger.kernel.org
X-Gm-Message-State: AFuF++mNKnnVaKU7WQFzdims9M3SBO0elo1Y1+Mow7xxt+OoQIgfr7OE
	Maw0fGYzXLxExl84wNMyUvypRBcJOv6DDUh5yECiLYP8TnpM8NidHNBM31SqLSrP8T3C+EmI70r
	wjDjEMXKh8r2lGpaD7i5TGR5qzWdkxOBNKVtyVz4F4T9CXpJL+nCwKVGQzvwDDHiKDxo=
X-Gm-Gg: AYBFou263+MXMeSGJz8icix6k95nVXp4KyQMmwUFzXLECVq54ivF/NhLE65Gi+6IytT
	Xu7BljOwNF2jBJwtjrcROUALGVYjv2bIcN/i/qJaTzV1LURZTcN679/Dc4z4cLDkOy3rbmHd9YJ
	3Cp8J21ok+/RPTolxueAbKwC7ICPqlv24ntnZalyCS6TngoBCgV8z9uBufYGdPPVFmQlhKPI7Nw
	b3Tpg/7ij41dNmZ66jGvf/bcJ5b8uP/0Fex1X0EUb6AxFK0kV0CwVMhkNgeAzbOOotf4d2eyEWY
	5G3UoyIiOgSuaZfD9iQAfMy4aSGetctcjMuhWgKSM+ar3r73BBkD8FqA+GSOsvZfXc3PVwVP3Vq
	NBu6m5zpgBOQCZrme1mIiMXC5Gh/0uelLD8VuEDlvUvgWGQpwRObasGzgnIV2G5aiUQs5m5cktT
	WfVbbueStcDU9V
X-Received: by 2002:a05:620a:444f:b0:93c:6450:9cf2 with SMTP id af79cd13be357-93cf16e70f1mr157178785a.28.1790897435251;
        Thu, 01 Oct 2026 16:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:93c:6450:9cf2 with SMTP id af79cd13be357-93cf16e70f1mr157164785a.28.1790897434369;
        Thu, 01 Oct 2026 16:30:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c78bec9sm224988e87.27.2026.10.01.16.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:30:33 -0700 (PDT)
Date: Fri, 2 Oct 2026 02:30:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>, Val Packett <val@packett.cool>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy: power up the digital top before
 starting the 7nm PLL
Message-ID: <f6w6anqecd27vgvu74ykjnd3smwhiji6uzejtj4geoe2kupiyh@v7spur2rtwqi>
References: <20260924-dsi-7nm-pll-digtop-v1-1-c2b24c8e218d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dsi-7nm-pll-digtop-v1-1-c2b24c8e218d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EfvoscxgOLPei-10R-gDw_SJhkiJoP1E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA5MyBTYWx0ZWRfXyFyXo/x2GZ02
 ukghgC0OTS2ARWACVaH2nSrlZxKeySB5sLxYi90EygzO36rEpHOjsrs7NMwVTkysJjZfkdmurfZ
 7hCYGmZpYuVcJRSYOQyO/7tc+nlxJr8=
X-Proofpoint-GUID: EfvoscxgOLPei-10R-gDw_SJhkiJoP1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA5MyBTYWx0ZWRfX/kaAou2Gftx/
 4xzawMe802kCfSqwms/R2+u6S4pQemyBviR8eEOqnW0bvtQmNhAjMlo1i6qjKiIPB/Ol34/uSsq
 Xv68fmtuP2nQuTmsOWIHu4rtLwfercJyyZulb/Xac0UnM048/CmGVvJ+zAuTtf7YzSqd7McXcOb
 NYyOQGJKxk3zvYJz/DkriJCKMA93B0DZAYNyPbz4ActE+Duo62G+oR3b0vppj1xBDQqPuOxc35f
 hxFLmIN/0ORb9yZd9JrH89BxzQzGKf1AmBhNyQu7cfhgPpFaadr7EGl2sS0RsXEQ+Gyp9SBq6Y4
 bS+JVDXd6NiB5gtBlpGIBbaqbB5RCgvN6/h3E5rlIeaCsVaczZYpV9jFKrpj7Xn2MoQ0cCLZQ3x
 11e77E0vDTECyN3thftBVKcJ9/0Hn8f8ygVcXeZMAnzZbGITa2OJbR1nH5iMo3oVaMt2/ibKFrb
 Tb35EtLvpqm2Gvfv3yg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abeed1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GMMiCQSux9nJ0xNYgbgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010093

On Thu, Sep 24, 2026 at 03:51:03AM +0300, Dmitry Baryshkov wrote:
> dsi_pll_7nm_vco_prepare() de-asserts PLL_SHUTDOWNB and starts the PLL,
> but leaves the PHY digital top powered down; only dsi_7nm_phy_enable()
> sets DIGTOP_PWRDN_B.  The PLL cannot lock in that state.  This went
> unnoticed for as long as the PLL was only ever prepared from the DSI
> host's enable path, after the PHY had been enabled.
> 
> Since commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for
> pixel clocks") the clock framework enables the PHY PLL on its own while
> applying the DT's assigned-clock-parents from of_clk_set_defaults(), at
> probe time, before the PHY has been touched.  The lock fails, the failed
> enable leaves the pixel clock with an unbalanced enable count, and the
> retries on every probe attempt stall the boot for tens of seconds:
> 
>   DSI PLL(0) lock failed, status=0x00000000
>   PLL(0) lock failed
>   dsi0_phy_pll_out_dsiclk already disabled
>   WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x244/0x24c
>    clk_core_disable
>    __clk_set_parent_after
>    clk_core_set_parent_nolock
>    clk_set_parent
>    of_clk_set_defaults
>    platform_probe
> 
> CMN_CTRL_0 reads 0x20 at the failing attempt: PLL_SHUTDOWNB set,
> DIGTOP_PWRDN_B clear.  Setting DIGTOP_PWRDN_B alone makes the same PLL
> lock, with no rate change and no other register touched.
> 
> Power up the digital top together with the PLL bias, and power it down
> again with it.  The normal enable path is unaffected: dsi_7nm_phy_enable()
> holds the bias reference and writes CMN_CTRL_0 in full anyway.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Fixes: acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel clocks")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

For the reference, picking up this patch breaks the boot on SM8350 HDK
with the disconnected HDMI display output. I'll try debugging it later.

-- 
With best wishes
Dmitry
