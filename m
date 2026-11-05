Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885710;
	b=DPjFCFVVl8tMmbp8sp9f5pM4fPFyI/B4MbDQdjaDTI+1p3Glwe2Slyhi+9NZqf1uLyvq
	 PM6RwNkhUtT8mmnoGdYVFk446VK7uFIInsyS3mlu22v+gocdREY3G9J/MlGLPI7uXCVy6
	 AuRe7+uYQV6Dex3w1IENmkhHAftH0xqwpBueAt9mas80dlzThPsCCtN50mQhe/LQzko4Y
	 Rjr/8yI5ZJI86iHuyuqjkwEw9Zr4e++bPgWuZgEWE7SuyfCRhHUGNlf5cXAZM7JsmvKaE
	 g1OeGBbFHdf6KFtJBWLS11ZAMqZja9GI/Gs0gsmEtqqsHITqJlHJaJFI8jFsgXl0t/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
	b=QrNijKb1G7ESB//QqKt0p02jKFR0vsYb06a+eDmWb3Jv76+7USAR/x5PgN24xYq8J6Ow
	 8okYppWxvxiuKcTWEfDTdR8ZsChomfssR9xD0rPt36uoR7VjfUpqbwVzcE1cpHJItMxGj
	 GJipJhqP4/CdzXe8E4cmfBIIJDQ7FFVRNiW0HaE+l1M3IP3T0nP5/7mdqIYqIBnWAtSIB
	 zST+iUo7MmceqkfKMduaKlgZGj8UPSGAcTFOQmnmUM8+XLleTPCzluyueO2tdywyuz6/P
	 nseE121qEifXmBIPCquSK1OYMgVDrgMQUUfh014Ww5wRlz9iuxsjCRW3BasHVv5d6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sff8DYwC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2D606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D2D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sff8DYwC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tRAJ406642
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C6les2P6C3VYvsc8kD6y8hS8
	7HftniHxNnR9mHrsnsE=; b=fzfhnCGS61R5KeLTKzhUcDeAl/a29wFH1O5NR8ZL
	Iw6z2btcm6+JaEDnK9eSRH8JWClTBhbiW1AFYg/luuhSwwunNo2lkKeM8EYe8rvZ
	TV7x7CaQX3OrmcH16RuJqyNZaCGDINouoX1PTlszEStB77ayp7XVqjs4moIZ4Xso
	E6/GKvXrqnzlh6tuy2aaE4RkQ/asZV+KBiDYP4qK9qy4XiIAloPmt7N3Uj5FTN0f
	HCbfzWU/oCCQ7Jmpz8VKhvc9YoBR8esCIXqkfvzL9IGE8Mvw/QTBa0j286UPKh9Y
	aM/5s7PwOIzIj6WL90/6ma44jvKpdaijgodIthb/ysITBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v1t87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:35:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so384939485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885708; x=1794490508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=Sff8DYwCXaZESHDiWF/DLcsetFFHsRTXHO++rGe2bQH3aAzGd/mMmU6E1g3KwYiqTm
         GXWfnoB+DaoQW+v5QYiI7hCgKkpCzOZBaT3mq+7rLFZj5ljiRgGpuFM3bj87xOckKt+S
         o1wpar/lkJRRpcOfTHwi3R3CWrUE06ylpytjBBcn4cEhLRF6QuMLQ56vDWA5PeL7oS4o
         /GUfYoNGB0yxN8qUtSh/TMH9rDHWDRTMIOqni2VQ06leZN5mn2CTryO9TyZ/XdrzCrqL
         AOK6qcKNKgURH4ARn269kP/RZwBS7FACAW9PmNmwAzI4ObqR3miNdEKupjM+zxBKKlYI
         BnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885708; x=1794490508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=EUC7Sc8mFhZNk1PhAb/TvYV0JV7DQZxDzaulkGzPtEhniwf4P+ckmZ5v57heGZ4noq
         A9HAT4kQECqt/rb2xmTyU4Z2YrD2waN0FFtj/OfLjCaoLGqQKVjYzUSQanS3KewN6jmg
         2PSJ/fwBHnr9IucbHsoivxCZYNxPXS9QMmpjpOUAhCHLJU0yU+E30HfYNTSTC6qTg1uJ
         ZMLUdX5XHFI78s6OhA8SxWtPYns+DwnDox1w5LwhZCpBaKErBPp/yKOIP6oO9VtUUG1m
         m5DYGnhsodZgjI9d40wca4RavCtEiK/2LzMmDJK6Ur/zwqMOUksnaWgmT/ji5iPLexf4
         mcTA==
X-Forwarded-Encrypted: i=1; AKwUvBxl/fP+8miAYw7n3OdAEMXztZ7EfpWmww+BiSujg7gVOuHu6xwyXwr+I72ghHNz7UB0ATLyX5BvqCRKTJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I/b1l4BEkA3xzIR7qrkMrdw7gOJny3qWUq+kFZTzqz+/RHd9H
	p3AxhmroADbxk+4Qkkesmn8u1m1f46lJRXQwghjnKhmzQacpejw07E8X0rCaqIF+7+BD1kbcp1y
	9tGRyXr1LYvMFLIfXWUsr7m2n17dhzwprNg3JpfZTDe6bEcDFsChFiQg+gt9Dklqh9oY=
X-Gm-Gg: AYBFou0m9sVVK9DY8+v1qI91YJoHin2GbBUU403oPlwShitNj9mk9sFck2GHOTR2oLG
	xKSOvOWQ8bfBBk9VAdsek8cBy0ZMSN2RakmOFPI3i6/ueuvKhVdUV7m7/IHxe0hBStcw2Th7kHm
	1M/rTH3a0KPLMuISlxF1Ol6tSWHEyofG43xh+iKiPEO/j+gHjgB3s2Xiz+Y1L5DnFThKHB1R3Qx
	1pPspp5ycimp+VqxIVROGj4jm9Kl+5erex5yeSOJjJ/AI6bgznDjFJW2TDj7xL3panbA1O0GJDP
	dwU4/Rh9rumxUfXWf7d9vejxUt9McyP3Oc5+L7xERpv2DawE9VQimXol9sbmTdvfwp+tAGVtWfI
	2H8Rbhfj+HaY2OQ7XnBpX4jLcrTUrxRg61QS7Nc2qq2C1vNOdC+iCCIjH1u3ncmfPB1a68DWaG8
	NkQmr1pHE58E4RB6VGFh+A48kzZoLO07fei03dXxptvxNEEBZxtuToD4nof2sF
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578451785a.20.1793885707701;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578445985a.20.1793885707078;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e07fdsm10695471fa.28.2026.11.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:35:05 -0800 (PST)
Date: Thu, 5 Nov 2026 15:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Message-ID: <6x7dtyvhbk22ri6nnpuo5jpk2ijphaebgbbchoramc4fhnvgjl@slhivetxacte>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
 <179387924494.1025980.3024349339803589757.b4-review@b4>
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
In-Reply-To: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfXze6xw9k94Tj8
 20QnosGFNx8Kwmr5yQ5baxzAVeLcAQHHIqrR1UYeTaMlDUPmGfpMsfxfuKpgR+8kUp8G2UOrLZW
 R1ZCQsd297T/OhNZk2IsZa0CMRarx1M=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec860c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=oSBH3dYeosbuySqTTykA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX9QMxthUhSXq7
 ud12aTeKQugh8Y2VysguqJ9iEpfLVX8vTH8ZdpojGZLPiaIMSsy6q0pxJ5sJeav8s8sEc27bQrE
 Lk5rIs/4/KIXb+DozLYkP7UZ1J8EzjX6RDUVPejHPRyh3EVGsZJDljjk0m6/8VMs6gacwdXjLkg
 kSmTVc6fyNAgb2te3pVweq7/t/Mv3/ZPck22loDB7THGdiXc+IhSH3wrvT4WX2+SdfRIlsXC47O
 t2XaFf7lN9KOxpI6tPKhfg6uKbGUUUyIjj4j6yIoZaGJgc46MIesE9njZMOabI4s4gvniPJcKpC
 0JgYU0eIqJjfiTvdTCgsw1WJlcuq+zOUl+hbom4PSdFyO0BjhyrPIDOPuDW+Ss1tVwmjTQ/qXJ3
 ZbbDaHZz7my260zhHC/7ZaVEirSnJzGRZyWE1Dj3Nk5/fsgB4Crnrtq3DaDE1G+c2c4BocA+0NJ
 jbJLJquWrF3tEojgpDg==
X-Proofpoint-GUID: ZQHSJkZs-YxzTqAFyC8mAPA2DrZNG8TC
X-Proofpoint-ORIG-GUID: ZQHSJkZs-YxzTqAFyC8mAPA2DrZNG8TC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054

On Thu, Nov 05, 2026 at 12:47:24PM +0100, Luca Ceresoli wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> >
> > Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> > events to the DisplayPort drivers.
> >
> > The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> > preventing extra cross-tree merges. It will be removed once all
> > drivers are converted. The drm_bridge_hpd_notify() function is kept for
> > the drivers which only care about the connector status and will always
> > pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
> 
> Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
> _extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
> drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

I'd say, only if they require the extra status. Otherwise, it's just a
noise which is perfectly handled by the wrapper.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
With best wishes
Dmitry
