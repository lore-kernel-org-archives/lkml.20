Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415775;
	b=H7inoZA18Q9rUkHziMQd5O8uQ2RySuZn8bgmmpvwbI5IMtk35OEUCS3/lOxWlu6+TOuB
	 LgsIcGFcPFQJazNYK1Oywrjr0rCsi83aynEDBPMF7iUjM/CjD+DiTaUH//LCZACbz2517
	 1l3e47FFs0XQFJOlZoYkw1EWzrRx3gJUfUY0IixH1AAQqfMHbBi/ShlruvplavpHqk7ht
	 eyfRzn8ckJ8YVRsJHachn5PIzII+cLF8ygXT4ljWL+1jwWAElHBZ29oMgwp734Y4ZN4r8
	 SGAfVFfWsdkzflo+pyLy6Exn3jEdb8I9osb66dJDO6F559kgVDnbop4VT8sX53nHUmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PWoksvMhgq8Q/i4IjWr81D379zG5XlS6MeHSuWn+LKc=;
	b=ce/LQocuBGWrl2k96Ad6gdjdFIzwdlKT0DgLiaMZvSSG2C0IIgaeEThnm9IF9HhWPX/W
	 Qi+2Zb9+XIJbwWofADU5sBq/dqVh8JsUUrb1lZgOs1Ed6FEa2p01LmWUVEBZFDEVhCJoQ
	 QMVyDoxjZfTuRDHDjEWgQUFoKebDMONSyb0fbl4RmPJbruvDWvc5pWsR6WZPwXR3JdFAH
	 +xmn38LukJTMJ6n4DHPFhTdbWt9mHzxTNQ2GY8SrL+A540oAhqt0psC+MZxdv32TbLgYc
	 hUcnhQQ45NfrnMOV6WJZQtj9KAoWLJWUehWOZW4bcuT5pGq/isyCRaKTznBBdmzN55w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdP9hRrD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwPDlX25;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A1606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2A1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdP9hRrD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwPDlX25
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF047M1665582
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PWoksvMhgq8Q/i4IjWr81D37
	9zG5XlS6MeHSuWn+LKc=; b=GdP9hRrDhJwlt6pncn4yrH4QKsDam2bDCxdssInM
	dDYn6PIXVSZb2oZ6Ac39K/7CddAfDqk3qO04WLaL3f91HNoHCHKqL7UI1cNizWVl
	rSz3dPCQGRmIt/PlvtpiZ+yQj8VirA5dPtN5Cff3roh8aHkdlri/S7ySOtCqBcIP
	t6Dys2b2kdGEmxx7VtjaxUFsu423unNPtkpKs0dALtOUoJ2zKuTsfnB7WaIH7Vqu
	xNIuy8iYUJZgPSQOKgytYwfmo5LVWetPBdlv0c1ajhLRGuPBCGHfSTX1ogQDrNlV
	Z+mzEdHFNOSSZD2PkKNW/TsdFWtKeVGZP9eAu6gUrNYrHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pt99r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:49:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so633037285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794415774; x=1795020574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWoksvMhgq8Q/i4IjWr81D379zG5XlS6MeHSuWn+LKc=;
        b=jwPDlX253kbmXBTRlwiqCMKF3u5uYMEB6wOKTC+1vWNZv0BbVpseUeFPqiH+/FomNa
         t7xB5/ohdJ2S8fBnv3vYfW0nGZZJZB6QP7D6VkIOT+f77krSkbol8W0So8vKgCQFy1ZC
         glkAOV1gRghlmwzRyrvn7Tb0Q3vA8/0b7TiqHbFBpJpICVBaqRqq+Z1SEokCKAQ/vFvf
         hms2qYymRu7L22qLrGD8c+yzjOmGfB/3Vp7IMBeKtRdsskBPiH4dzjJL/QMcTHdbkXqu
         PWoXxXGBRr+ETWUrYpm/3u7el/NYUIhnyo1AJlADNGN9kwR2RBiPI9/TXCk/+K/tiJPo
         oZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415774; x=1795020574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWoksvMhgq8Q/i4IjWr81D379zG5XlS6MeHSuWn+LKc=;
        b=y7WPz3pVS0UVBfWlaR7QsovkXEHKlUB5NZw18FqjxD1MLyGwV103AEuIzxwkiz4Zfu
         XP84mjHMTC0vNObSvYpt+fVMfDJfDTugAezO24LCUYds2SNsD+adr36csziul+WNlpFb
         T2j7CmirJMc93GJmcYaQW81AQefSaCaxyMcQnjXixBNhrNkh7D+VYOkCrC2Ba4u9g7CD
         uNzu+tEPiftkbGYIQ0HdfQQBdtNTWz7Y0lkmBv9+eoyxnBJxY5gyv1air8D+J1V4QTKW
         SBiiicMu2heOgfrwNC/dNGX8GB6Bz78fi/lgBZbTIA9wRAIUhTR9K5r2MSez+Uvd4z21
         zhtA==
X-Forwarded-Encrypted: i=1; AL+hErFbHAfovpFOriEjtvlpGksTFrUALKG/yza/88POj9cT3KL+Vu0leCy7nTpVTt+9OrZjWgvNTOVHfuqp1YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qj7WH6mgf/e0gd/6vto455wgM6AMBdqKT3m1jfNzPGu9GnUKT
	1tMbXGNtHVJLkVToSSOV+onp6RyzqqaRLS44CvynD1bssLJRYu0FS4j6ihp9Ii7KermX1c3CY7B
	wpMa3v5ONmmLzmhw3D8ZMbUcJyCLfHSCMWBVbLfGtsfcTLrNg1rj/c9zfBQIisvQcGn8=
X-Gm-Gg: AYBFou1JOK8GHERqKZ0ZrXwgGciOUWMP4ctvte7ugx9b9BTsyED30kGpwLTnI6vJ2K2
	esfOteA+UtLMMCf48jc60jwGeyLJz9BxGLDFl/xjeSQ8CDLzsjniDb2SxjCLqM4mBuInXToDv27
	l9D2k6D59IlTPt3Ghj+SyCQUcQafaHTihmjH9k5J4ZhExZdl9gbb0iJ8gk8BF1FmLJzT+o2IwBI
	DfiWuuy4vRXWT7YBgUtcOQd7OXBqLDd1lYSMdNDpOtnmLQHUpwhWiU/3N8SqNS2ReOryNeUteyk
	FvOKSYneO3n/glvW9MCT9xQGqFeDHlxnI/g1cLcycoF7I6uf21Ky1owezolUkDPV5xQWUPel/3C
	Q1lfgMN8kRN+Wa15NuE5E6BUsreb0UeAFN2PhgNUBDtDg+6ogMNQyXK7rjpmPrFm/+eJIfooiGw
	AfMbUUJPWaW9wJz80ltyJ/u5Ez2vAg4JHp2FRKq5e3sWvLeWmddH1Q2t14DOk5Ig==
X-Received: by 2002:a05:620a:4409:b0:93f:3391:d5a1 with SMTP id af79cd13be357-947b00cbd05mr507383685a.75.1794415773611;
        Wed, 11 Nov 2026 08:49:33 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:93f:3391:d5a1 with SMTP id af79cd13be357-947b00cbd05mr507377285a.75.1794415773092;
        Wed, 11 Nov 2026 08:49:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baf5aasm1038678e87.48.2026.11.11.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:49:30 -0800 (PST)
Date: Wed, 11 Nov 2026 18:49:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com
Subject: Re: [PATCH] drm/msm/dsi: fix AHB clock staying enabled across suspend
Message-ID: <kncxteaifi4atoodx2wqkbxkwwaw2wttmxtxeh5plbl77idwva@fbknoze4ywbd>
References: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
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
In-Reply-To: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfX1A3YIVtJ6A+R
 OYoKbCwc59uUwtTrcJBSqCFKrIeWPgoGMYEHeZ4t+2SNyOVE478hk8JZIOc4rQ5NPMirNF79XcJ
 cGbxrbQkcSLS3cRbexbN1+K4NaYBmsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfXwlDwtu7duxbG
 H6P07Z56QXgT/Uhb3x7wCzydZpSPCIR691FQB2h75SBGNTd0zUWBRn6kZqjySlE4gE7kOnOoZTm
 obxSoS81x4S7CVQ1foesFsXICJv7Cu10gz2JBsMi7mg2XatMZaWK0GRUo1HEoeOfoj1JafYApFn
 zAkg+wklUe2MS849/31h113u8tyVvof1J/gnT5StiyphhY8PChvzJXRQjuxNZc+KWaTckl2eFQZ
 Q37BXDMMVt+2vvYdPCUdrN3JCOHSxFg4oIgOykpFyw7NdJkP+0XOJobpHJsQhLbI0OMSqNC2z4F
 lKJdUteE4ADJvyytzq0KHsZNSDXDLDrR8khRfaO34DSU8bSHOoFZ5CQZVzmjOUS/m+yc3XAMy2H
 1G77VMpUpToejTdR/FR7nheaVn8HKWBtrAJsR2cx75aSMWgv719KF/fPNvztjDZTocqSxNOz7WX
 nsFjB2XQXP533iGH1+Q==
X-Proofpoint-GUID: Q-qJg9j09UWvNRbYaEP2EFrRtlQCbIjB
X-Proofpoint-ORIG-GUID: Q-qJg9j09UWvNRbYaEP2EFrRtlQCbIjB
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af49c9e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=nLvmRgGJZeXqCf0b28oA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110066

On Tue, Oct 06, 2026 at 06:43:53PM +0530, Arpit Saini wrote:
> pm_clk_suspend()/resume() only call clk_disable()/clk_enable() for the
> AHB ("iface") clock, never clk_unprepare(), so prepare_count never
> reaches 0. The clock (and its source) stays reported as enabled
> through s2idle suspend even though the display stack is fully
> suspended:
> 
>   disp_cc_mdss_ahb_clk [19200000] ->
>     disp_cc_mdss_ahb_clk_src [19200000] ->
>     bi_tcxo [19200000] -> xo-board [76800000]
>   disp_cc_mdss_ahb_clk_src [19200000] ->
>     bi_tcxo [19200000] -> xo-board [76800000]
> 
> Calling clk_prepare_enable()/clk_disable_unprepare() directly from the
> PHY's runtime_suspend/runtime_resume is not safe either, since it can
> deadlock against the PHY's own PLL clocks taking the global CCF
> prepare_lock during clk_prepare()/clk_unprepare().
> 
> Fix this by moving clk_prepare()/clk_unprepare() out of the runtime PM
> path. clk_enable()/clk_disable() (spinlock only) stay in
> runtime_suspend/runtime_resume. clk_prepare()/clk_unprepare() move to
> suspend_late/resume_early, avoiding the prepare_lock collision and
> actually dropping prepare_count to 0. DPM_FLAG_NO_DIRECT_COMPLETE
> ensures these hooks always run on sleep.
> 
> Fixes: 0b3ccb76b95b ("drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue")
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 132 +++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |   4 ++
>  2 files changed, 127 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
