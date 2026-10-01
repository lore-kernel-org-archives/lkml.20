Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D12FE56F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822107; cv=none; b=FNW2fCNsFrXQ9pJC0vB+VJizVFIm1YGYui1GhvJCRSeG4NH3Mv28zuAR+BCN/g3B6JfcGTPJZ5qPoo9ZnpnCwRy1wsvYdc3irrMg+o6aCC+KxS/kJ08agkBNBR/zeEkPwCEwLNjqRXwpJycQbEZ7rgIVu1PsOzFns9Fs9d8c9zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822107; c=relaxed/simple;
	bh=+QoZPkyzGKNe2aEV12Su2uMmYhE94FAo/6zYxDaBkEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlhRvayxOHgUPs2ofuK65qEe+Z4cBEidYQ8kWIqcQwD4AbbbGfFEhTj6ZQrZZ2DAukxGC6mMCeYIOqbzF8bgvptp0mxEMp3cQiI0kaMxLzwuB++8UCpM3GpwMsbmjkiyDnGi863XC9LI4AJkoC2dJDCOSGDz+J2GXiDDWpgORXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRdP1ylR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlUUKXH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRdP1ylR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlUUKXH4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910kDbX720140
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=htg6wDlN38DdW2E5SbXi6aX/
	Ov2gAq5Dj5yDzZtrY9k=; b=nRdP1ylRLq0X7V6uMTE9XSHIb39aoFGl4thT7L09
	5TKyYdzUGslF0cJk1ADxYz8m3ZOQcpAdCFyR3dCLW3jHUrgkQp0lRVUaFYq5LPz0
	xiLGxETO9TPuHn8vFlA7qA84RzNXVxHbSOHuKp76GedFCk+3NxgrZ6H5V5n5Yb3p
	SSbia/uot3oaHbXkpX6MhjrHkje+3huqFJU3X62WW6FzrTPIZgzsAvgjATMlXx/P
	+wHYZ3SuWq71CgGK4V9xGnZN5uHBB5m5aChAB5IrXIHFxjFXGmFb59WGH79Ob6Pg
	DBygFE1kA3tOeq+gmQIf8pMKJQ3DNoNfpljc+CPVqMqFGQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188ssd12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso926507eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790822103; x=1791426903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htg6wDlN38DdW2E5SbXi6aX/Ov2gAq5Dj5yDzZtrY9k=;
        b=IlUUKXH4mDNlueaNa71x7cS8ZGCaipmEhUv+7i7dIX7OCPu8wBoP2e9/x3y3NNewL8
         LlTebwPP0xy0qR5Pl/r7lHb/slvqCF3dhK4QuaJjr7jqUNdzhxm2baIVFz3iFkbEGsHB
         1Y2pXWot0wcvs0eETPfH5SOAqKHCO7fVHQL/5r5zPabckb0o92pwLELbJ7eOFjf019XE
         23bmGQIEKLTixbBJqMndoQh+asS22VpZXP+yBGJuWg78cGvFfCKPsU5ymXCZzmM1Hop1
         ehXJE1hnhhFsoMTd1ZPcz8OwH0yAwL4tHrEAFST0TpBERn6F48yWtWKBlU0Fxj2hNHBg
         EBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822103; x=1791426903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htg6wDlN38DdW2E5SbXi6aX/Ov2gAq5Dj5yDzZtrY9k=;
        b=sBpFDfwmnfQtxwtCbzZTjKPyBEGPQ7OqAzNbW+Y0mjbmSGvme8jyJh3wLb7XWa442C
         HZC6X5vkJ7sNe4aLpmdFz0zc1BRwQLFde5RB4J/+dnXS5KgNA+9tToKS1U3JqRE62gdz
         SXgkmhC9dj3j8Bcv20DJ3GBK4f070a9Tvj66l+EKoGpeZL5fcFJQi13fxBz49HsHM6qF
         NV1iVhuNa2AqPAeQ+AL1gKxwz7nzhJw8tbQgWOt+A1Mj7Lt8UoqgV273uz30ngTwxh7K
         r+1zZ0J806cMwJbPzIAyiU52mIGLevlqVVnK5o2AkyzohbMA7PddMQsoZ1wgfOfNvfGz
         bOxg==
X-Forwarded-Encrypted: i=1; AKwUvBwHs18++5cGGc7zs494ni814xgpSnIs159d7zdXnyVbA1szwkesn8UFZaSmhNaVXciB0JAN65CDO3EAa8I=@vger.kernel.org
X-Gm-Message-State: AFuF++ltDUuDoHofu6jktsxnUO+mz5zh8yrXbeNH6bFENClFx7NV/AOz
	7dep0kO03Gmd4EbQJjtvQwBXjnVj6SM1XvemZG5DmOwmLeu7eI/TyGr9IWjLWHJ9g0kT06QxBQH
	MrcTTJrZN6pDUdA3NaPbvT/MNQio9LSFqxfV1ivfm/36jgY1DJcgZx8818JixcpLQoyY=
X-Gm-Gg: AYBFou1ehe2gJEwFendDtWYGQgKoXuRQQa6Ca7QbrXFaHZ7v71zSkYL7KBAVXc8ghtU
	7VZenSPamlSgAInXNN+zoU3vjr8knqYtuVf45YRm1QlkFMyoOvWQiwQC+n4R/YG6BJMl/ezoyaR
	Ilh7tn0hVjL5urpg/7m+iYP7Ii1A18d/h/Pe+xF6bt0zfX0YJnYQbfy4im1MWYJPriR8NK9AtZp
	BYmzsLqMmsuDFEz6AYUy2I8V0k72yQYfiTD9ZaWwFTXGuiZqrqjRk8iF8fjaYu2EsoZVeYWSBpZ
	Z7DWrKekXKG/Fzrolu+GOofvs3pMpUZeT1nmj6u5vxgiVNdat3EaSiR3WlMBz2jDu3KJV2DBbvC
	3HRjbbHQ6em7ZIhOAvcXXPEV4HaQU4FIXtt4+hJLl1UMPGGI1Y/4JbGj0jAIu4WrkZl3EzbDVqW
	iSdkjvP9aOjbCh4w4lxHQ=
X-Received: by 2002:a05:7300:b54b:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34cdd9900bfmr6742034eec.2.1790822103304;
        Wed, 30 Sep 2026 19:35:03 -0700 (PDT)
X-Received: by 2002:a05:7300:b54b:b0:343:fdea:9a0 with SMTP id 5a478bee46e88-34cdd9900bfmr6741984eec.2.1790822102643;
        Wed, 30 Sep 2026 19:35:02 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df3bb4a2fsm2427281c88.8.2026.09.30.19.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:35:01 -0700 (PDT)
Date: Thu, 1 Oct 2026 08:04:51 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v9 2/2] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <ar3Gy4F1Ym3KNuaV@hu-vishsain-blr.qualcomm.com>
References: <20260924-add-lt9211c-bridge-v9-0-d78b39677a61@oss.qualcomm.com>
 <20260924-add-lt9211c-bridge-v9-2-d78b39677a61@oss.qualcomm.com>
 <61aa851b26f9aa85a3ec1dc4bc8f46d7f1fbd24e.camel@pengutronix.de>
 <d924369a2f907aa796d7eba692001593ef1e6d0d.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d924369a2f907aa796d7eba692001593ef1e6d0d.camel@pengutronix.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX4SsK7n04Jpwj
 yvQY2DIhe4xdgFMBIPTFHwB8bCuJQ2tasHPq0RjAttYOaXoDTCgxoojudtKZjMPbT2dWWkj78r6
 9bQ9TX4MKlF8zoJJAL7LyXw4KS0ebiE=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdc6d8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jvwfOezYHQUHBwXlzkIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Miz1w47OUkVcEWAobsw1xuLIYpiRfKGL
X-Proofpoint-GUID: Miz1w47OUkVcEWAobsw1xuLIYpiRfKGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX330sFGPLvSbq
 gGSRIaLpzRIcSjLVSZQqx9pbfus6XmbXOFA961ZAtWU9rMB/L5LntZVm7hzrXOU2kfau7penkyg
 u4G32caG4Oq6oHLkqH5IA3PkCEedRXjRCXhB61OjYJhSpAvQn+yZNeZf1tTESeHuo6uvu21fVH4
 lF+vDhTlhvH2Q2LiQH6VhDf3QBAuiRoJGG9kfw85WTTM+45xSoeVcc1UWIZmho8HiXpjxgBAkEQ
 lm7IHOEVV5usrXfazeO45To3m14e2tYDW8vmW1olLNkI0ozzgyQZLm1nIQQ+58tBT/mnsOk+c6Z
 moQEZZmBzz5i4KMI/GSmtXY7OXjDwK7j9zoDl4/AHCkKe7y1SuoHLcJC+NLErOSy583O9vPS4/I
 Z2vqSNxccVxpQx0AhhT/6V4t9tHNDNWJTeF+Ek6154rCTuVpnEwXvfmn8gtcsspZZCcLkbs0U99
 EI+j5XvIzjXQB3iIZMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010010

On Mon, Sep 28, 2026 at 12:13:42PM +0200, Philipp Zabel wrote:
> On Fr, 2026-09-25 at 15:23 +0200, Philipp Zabel wrote:
> > On Do, 2026-09-24 at 21:29 +0530, vishnu.saini@oss.qualcomm.com wrote:
> > > From: Yi Zhang <zhanyi@qti.qualcomm.com>
> > > 
> > > LT9211C is a Single/Dual-Link DSI/LVDS or Single DPI input to
> > > Single-Link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> > > Extend the existing lontium-lt9211 driver to support DSI-to-LVDS
> > > bridge configuration by detecting and handling both LT9211 and LT9211C
> > > variants from a single driver.
> > > 
> > > Chip detection in lt9211_read_chipid() is extended to identify the
> > > LT9211C by its distinct chip ID registers, and cross-checked against
> > > the chip type requested by the DT compatible string to catch a
> > > mismatched board/compatible combination.
> > > 
> > > Add LT9211C-specific regmap support and use lt9211_chip_data with
> > > i2c_get_match_data() to provide per-chip configuration.
> > > 
> > > Five new functions implement the LT9211C DSI-to-LVDS initialisation
> > > sequence: lt9211c_configure_rx(), lt9211c_autodetect_rx(),
> > > lt9211c_configure_timing(), lt9211c_configure_plls() and
> > > lt9211c_configure_tx().
> > > 
> > > Defer the remaining LT9211C initialization to a work item scheduled
> > > from atomic_enable(), since RX auto-detection requires an active DSI
> > > stream.
> > 
> > This is still wrong, and I don't understand why you need it.
> > 
> > All scheduling initialization as a work item should allow is for
> > downstream bridges and/or panels to be atomic_enabled while
> > lt9211_work_func() is waiting for a vblank interrupt.
> > They expect the LVDS signal to be active at this point. If LVDS is
> > enabled at some unknown later point in time by the work item, any
> > startup timing requirements the panel might have can not be applied
> > correctly.
> > 
> > Also, deferring initialization as a work item shouldn't have any
> > influence on the upstream DSI signal. That should already be active
> > when lt9211c atomic_enable is called. Could it be that there is a bug
> > in your display controller or DSI bridge driver that causes the DSI
> > signal to still not be completely active at this point?
> > 
> > > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > > Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> > > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > 
> > I have not tested this version (yet).
> 
> I have now retested this on RK3576 - both as-is and with the
> "drm/bridge: lt9211: drop delayed work" patch I just sent.
Thank you i will see how atomic_enable is handled in RK3576
   
> I still think we have to figure out why the DSI signal doesn't appear
> to be streaming as it should when lt9211_atomic_enable is called in
> your setup.

> When enabling the lt9211c synchronously, is there any error?
> Is just the Sot/RX: debug output incorrect?
Yes, few details were mentioned in our v6 discussion.
droping delayed work is not working as expected. lt9211_autodetect_rx failed to read the format,
Tried increasing the delay upto 3s before reading the format buf, did not help:

With synchronous approach,
i defined a dummy drm hook, hw_enable_timing which is called after enabling the timing engine in drm/msm dsi host driver, and it starts working (bridge configuration was synchronously but in this dummy drm hook). So to remove delayed work, changes required in dsi host driver. Shall i defer bridge level atomic_enable callback from drm/msm/dsi host till timing engine is enabled?

> Which display controller / DSI bridge drivers are used to send the DSI
> signal?
I used drm/msm/dsi host driver on qcom lemans/kodiak/monaco evk platforms.

> regards
> Philipp
