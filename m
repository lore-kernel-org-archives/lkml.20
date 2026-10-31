Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478276;
	b=LFDdYnGt2NTQ1MhHTZtqLeyzJyTKP0+fCwOvhGwgdDm966/K/p2ow2QWy31SiKHoqRtB
	 4oIo9SuyVCqX/VieYR9yVO0sYWZzhsQKY6OQxTOuBcYQxyzCUu0XebrlpPDYPdJ0+yqfj
	 zJ3wBtr9Ug2Q/PDkjs5/hp9Bsfeqh4ZxYffkeKqtyO8Ev7k0Nia3u4Q3lUk2BQcz6NYOt
	 12wqsFreCvbEehDrGpVogCIyWeJUA9tMVPGmjlJOVO31EV7zsUU4J7mzF8fBdu7KpiOm8
	 B5UnPxCOZZXaWdJommCPbR4iNWEUOnX1fZh/YFVpg+pGR1F27z2qVbNyhtMOZNN2VRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LC+7yPvVyik4+Gpd7nEEb6EXAVPzoW8RCDIH4uELTVY=;
	b=pzGNEOfdTNETiFwZ5QuE0n1BYLs+hdw2ZcLd81VY+ZK3wdLaxgfVJTPhoYCtxOVCGinj
	 h0NPm28kzUtpkNoml+em29fthcd97wfd5Wxo+JR0VZiZOGcx7L+2fu+x9lTpX/NJRhNVA
	 sSGJWdBAkeGep/tKkjaG9PMJw/NJPLBqJMtq6Uq0qPmbw7IpLWCHlx6l/rb1A1mFXqiMS
	 yKK2URhcMA8VbUFzKb5Hb8JZgKVxbOU+o4UI7vMzHvU2Ku7sU7OIqhSHhFpOov8xBuuwv
	 WVqct7IodrjenYlUArJIucvFpqyyHS+ZLiQEWd66rUgugQsd/4lPIwHeQjmokDV81Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CLUZaKpj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LWo3pBW5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F38606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F38606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CLUZaKpj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LWo3pBW5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF1p62961510
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LC+7yPvVyik4+Gpd7nEEb6EX
	AVPzoW8RCDIH4uELTVY=; b=CLUZaKpj1g6ex8FCQS9pJcuDpv4TWX1jzc6/jDUi
	FcLRQVpCsXqEfFD4fRBfDD4ODU/Ls5M2UzJGJ5KmxZ7JYmAFXz6jhMj0ENhwbR6A
	B1wTUC9uKrcyTHYnr2p8RYfIrKzgHEWmqfz12f/SP50gazjlgL+oSHB/0HmWYvyS
	BNa1+kPp5hHvOxoA1BQoBbGpfFW/iBmiPgNh5rUTJqRU42gLE9D3zM8+FtK2xoBA
	m97fzzVV3pr1pnS43kNzkBLSgLEjdqKNVb3NaIzm8CFWKKbjf8lviSrUn8AIqUVa
	h5Dx2ZQNsSDS6BskLCATvsxGPLwMED3x5BtFDHgueQXGaA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dua06q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:24:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c6c1e082bso47355376d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478274; x=1794083074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LC+7yPvVyik4+Gpd7nEEb6EXAVPzoW8RCDIH4uELTVY=;
        b=LWo3pBW5BrR6BJQq7DV67ez0ZIF+7epsL9cWFYM+ib1yN1mv2AA6yfeuZHi3N3bKto
         z4ZQCgfoBwPhHqAJpPUbcE6PcxzRQLYzOSk5e0wzYjo7yJxiCQL0ZSdl4o1VXtP4poHN
         ap0hb0cx/On6Kv7AxgkfpZiKojwjnRR6nZ8qZItIdbXBlzbwNBvrOvMWWqrc/A0B2V/G
         wgCcCXTFrOwoYz/2k93BR76geT7llcf6/DlXUEJmmHKVXRTujcmarhEwag1T2g6bbtk7
         ZqdOukE7JocMsUxxxsJ0wfq9JVXKZTKc9GQMSOK1Xn4MiTp1e215QgoRW61iNr0qLxWv
         Q6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478274; x=1794083074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LC+7yPvVyik4+Gpd7nEEb6EXAVPzoW8RCDIH4uELTVY=;
        b=NGRnUugFQcCtrzMkB0RYuutVCDjpfuKg0LgeJqEYYj220SOrHoUxUs1y88Gov89odT
         RlDyKyXsyi13ZzKTBCC1s1kQA0E3NcCA47ywcWP9IT0ziGhbEm+AK4VQlBlaQW3uxG8s
         i7lUhZFKOrIbbkvfxNG4ilVRg1hZzVcWF8HUb8/ys3Ykyu0bAII3WjTrhH1SRqviojAO
         hLKTUP4V9kB48L0I6ZwGWRLsVE5IHGT7Ad0EkfRwm33P0FziBPN8sMd1hL2CfSDIB1Nr
         ykpmcwuQiezVRb0Ar/GB9kOB0lQ5gkLTqoLr1+Yu3WFcXrWsDZ1ZkrdPJyduxxOg0wRX
         GcNg==
X-Forwarded-Encrypted: i=1; AKwUvBxenYEQsfYXXXK9B6eXKlpgU3vI+lxISlITMxh9WKh3I9+IXluMhrFmsFTsfEny4SYgf0TinjDsjCeMrwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ5WMQq5WRUrXzEY0Acb4KeAUnvb4CKBvBXG+6KYNc1cVDUBDf
	DBqpDhF8mn5dJ2AuLmj+PBrNdUI50ZSaL9l++1AaAvA9I5vHTrrPkx4Ly8A1zvuB09sVnRNHBNp
	opTS68AI7iWtWjlnlutvE5Ejy/EjOC369PN71Od2K2cQYJmItX2EGxDhTwr3cwo2vc2k=
X-Gm-Gg: AYBFou0tZzv1SotJltvVD1m6iQn52d9S9SuoDnewLlnZV5G7qIuQOkvzyZ0jz7I+pTm
	s8UJR+sHQAYkydk9X3vYGmAWmwQNk411m8PZN3gCkjAFz0TFAFRWBiT8FegSiFsp6ZbkhsZK85F
	ZZ5N5BILau00dp+0o3qWLuZizBETGgvDsCXnRvd14y4NiF5rs+KFSA+2x6x3xXyeiUdOUFi16Ea
	blw0Gfhx/OXR2ru51NtDetzDRS+YqsDEdy+OcnjDCeUETIdQ1KZ8rBAT3dhr34J9WNeIiZ9pcOz
	GSZlWj7/M5b5cSA33o3CuWQuoTnzmTMGEy4XGem6rv0U0nZsHaU0ECT1lvhUBbMB25K+MbBj1Zf
	bvaNqV1A/irm7B6HjCZELtI/wXDRT4h1bW7ni5t0djJXlmEi0x4xdceCvG232faKZPp14fDX3yH
	x082MIxeuGbOH+onnguuDz4C3T4TLlsnFWNX2aHBHVosKdACPqGj0iX0tLxNIYuA==
X-Received: by 2002:a05:620a:444d:b0:93f:4498:603a with SMTP id af79cd13be357-944133d4a68mr1436455585a.35.1793478273702;
        Sat, 31 Oct 2026 13:24:33 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:93f:4498:603a with SMTP id af79cd13be357-944133d4a68mr1436453685a.35.1793478273159;
        Sat, 31 Oct 2026 13:24:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbefd30asm13000291fa.23.2026.10.31.13.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:24:32 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dsi: move bonded command failure flag into
 dsi manager state
Message-ID: <l2pcxlml5vdv4ws75wvqjhxbjr43hfosrvd2nyewhup5umxu34@feozzmxb7poz>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031150305.1107572-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261031150305.1107572-2-xiaqinghuan@mail.ustc.edu.cn>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae64e82 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=zRbll8i6zLBPDSgtwMIA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: tSCkdhz7M2KkmB5HZWyUxuPjRMhxAbx8
X-Proofpoint-GUID: tSCkdhz7M2KkmB5HZWyUxuPjRMhxAbx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXxdxoeYz8pmop
 jQng41BoeeDE7z2n8MQ7TDdhBAWCkBTz9KTg587NvhE4LHET5hSUYyRDvP5OvgGUEU5F4KBm0IG
 Cudm4fDbGJVCSr2/kyI/B1s+T0uPp3FONlf9X38pn+d6OLsXLPtk00EBzj87GkMgfpGOM6yz2UM
 qYwXbz2oxErWi36s2dGaKGtOKPPoSHFjuA5gZv1jMUo30lc69HUWKJOOGbAgop+/KQItkhB0GFl
 GZI6D27BRiJouwOigCuSjzstGo+FhlAjtXerAHh21IV6fsrsAdc6twYcymcGU4bb9/Fqnj5n6pC
 SRtIJkHtli71bDOMcUAm5BELJDMuHwtQTq2WBuRlDCw9T8CRXZ+1RbzvTir0mWaMnaIQfwSJiKP
 6AWPBvu0RtSq7HOcehggh9Do7qcvzbMqVu/VqCoOC9pMGFQPXy/MyD9aqXvjwdNmnQ7f9eig9HD
 pt/u65DhLqsqi6V4jMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXyMGRQpONl1Gb
 1cOAMkJBMCH7TZPULhxhTkehWAD/mEAyhRvTLvbpARbo4kKs+Ytb9I6pTSjPo/FBFpxb26aARmc
 Er2gzDCCH7seSTRGRaKuWzwiNrsB9Q0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:01PM +0800, Qianhui Xu wrote:
> The bonded-DSI command path kept a file-scoped `static bool
> dsi_bonded_cmd_failed` next to the global manager instance, so bonded
> state was split across two storage classes. Move the flag into
> struct msm_dsi_manager (msm_dsim_glb) so the manager owns all of it and
> nothing mutable stays file-scoped. READ_ONCE/WRITE_ONCE use is unchanged,
> so behaviour is identical.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 559c07a8b9..93d636220b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -30,6 +30,7 @@ struct msm_dsi_manager {
>  	bool is_bonded_dsi;
>  	bool is_sync_needed;
>  	bool is_sm8750;
> +	bool bonded_cmd_failed;
>  	int master_dsi_link_id;
>  };
>  
> @@ -37,8 +38,10 @@ static struct msm_dsi_manager msm_dsim_glb = {
>  	.master_dsi_link_id = -1,
>  };
>  
> +/* Serialises bonded command transactions; the failure flag it guards lives in
> + * msm_dsim_glb so no bonded state is file-scoped.
> + */

If all fields guarded by this lock are held in another place, then the
lock should also go. Nit: please check the recommended form for the
block comment.

>  static DEFINE_MUTEX(dsi_bonded_cmd_lock);

Hmm what is your base kernel? I don't see these definitions.

> -static bool dsi_bonded_cmd_failed;
>  
>  #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
>  #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
> @@ -51,7 +54,8 @@ static bool dsi_mgr_uses_bonded_cmd(void)
>  
>  bool msm_dsi_manager_cmd_failed(void)
>  {
> -	return dsi_mgr_uses_bonded_cmd() && READ_ONCE(dsi_bonded_cmd_failed);
> +	return dsi_mgr_uses_bonded_cmd() &&
> +	       READ_ONCE(msm_dsim_glb.bonded_cmd_failed);
>  }
>  
>  static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
> @@ -374,7 +378,7 @@ static void dsi_mgr_bridge_enable(struct drm_bridge *bridge,
>  	if (!panel->prepared) {
>  		dev_err(&msm_dsi->pdev->dev,
>  			"panel is not prepared; refusing video enable\n");
> -		WRITE_ONCE(dsi_bonded_cmd_failed, true);
> +		WRITE_ONCE(msm_dsim_glb.bonded_cmd_failed, true);
>  		return;
>  	}
>  
> @@ -646,7 +650,7 @@ static int dsi_mgr_bonded_cmd_xfer(const struct mipi_dsi_msg *msg)
>  	ret = master_ret < 0 ? master_ret : slave_ret < 0 ? slave_ret : len;
>  	if (ret < 0) {
>  		/* Never reuse a packet buffer while either DMA engine is unresolved. */
> -		WRITE_ONCE(dsi_bonded_cmd_failed, true);
> +		WRITE_ONCE(msm_dsim_glb.bonded_cmd_failed, true);
>  		dev_err(&master_dsi->pdev->dev,
>  			"bonded command DMA failed: master=%d peer=%d\n",
>  			master_ret, slave_ret);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
