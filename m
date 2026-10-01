Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387BE35C188
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822722; cv=none; b=kSamXuyI8ghf+xNGGWCKhknVl42725xl9p5atMelFBsubdjlHgtlPp73i9kDreA3S1vGoPoMBmrKr8KNlYnVJhO1cC4ucZ8JgWUEI6Iu4KKcPQmsl175m6en4Ml4RTiBx6e5HDWbKtkudXLAtNbbc0Og0MQvONiE9H76agjna/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822722; c=relaxed/simple;
	bh=4Z28J42zOLgCoMkeHrJK4IrIytpp6EaS+jVzgXfDY6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6N/Gapjw+NlyW5MpnKUjygLn1/wJ3fceKY4gWPJo4bxYvEKtCJxvXHVEh2sAsoXSe8CqBOOdf5N7lJLXQzk1sS97GYcVvkI8llO4p2DWawovmGfTFuYNZzuIwHI+L4WZ3w+fpjQSZUNFdN8kS4E5NT4krzLynZ3Mh6BsKKeBS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTKFzCum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+Rf/P0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTKFzCum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+Rf/P0v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jvaI1545598
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Ol1nfVGYFnGbDrY614OUc6R
	zJCOeVGBluvM0xZNXmY=; b=GTKFzCumBRrV0y2mly2vCB8Wm3knCgVMjMKC1chI
	3HjBPCmkOUXrwHOgqprIOPtCkcuAPIGrO4aBvBbGa8rye88d55aNEVM5JABsLXII
	3NWVfSfKEJ9xlzorppNGZGyjMXBcYaxNyDoURKDLRUq/44+ZsLBdPATNTKvoVKEQ
	4CbfLRQmc7byRS/NnhEoT2nqjwJ0JDzXR0kUIix+96G3CKja/DVRFGfi8zaUre/G
	5e0kzWWrF7XcR+oVC+7xp2HwgxJLK199EENhm4iQp7c8Ihbn1ZvUDFYKDl21mtRm
	WJh1P4tZgW8IBizwxhs1dIuK+51P8OpQmnAmhKDO+X3z9w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n22m8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:45:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d749e0e0fso147942eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790822719; x=1791427519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ol1nfVGYFnGbDrY614OUc6RzJCOeVGBluvM0xZNXmY=;
        b=i+Rf/P0vtaQlZzgqW1wvhG3uYP6jXwfm/krqxOZEITfLbAixvauLeOzt52mZyXrXLR
         07sRPvqWYtemCDcbTUCH0tsfow+QofD2olVIkK1ezte/J8kHTcINi5Vmb/IE5FnQX82L
         Zt+vFcBO4aeHqvmjLU6NMijpZiJejpRVJg+FgJzLfzI/uH/Xm/tnV9xP09Ynqk7YBamd
         /9OiZ2siiUKvTtMjIu4+5Qg/fLLcTcdtUil7tXq+91F71i2jAm2x4GkvpxPrrokxU0LS
         7e97VVguHHvdEjYIu97ZS20iQwsVTZkNmzZK1Ah23H3iP28N9FgIzObjzwtKbzrQdgkJ
         oA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822719; x=1791427519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ol1nfVGYFnGbDrY614OUc6RzJCOeVGBluvM0xZNXmY=;
        b=WdNZmymHDmjeC48vidOaCFOiMAu5iOTN01zneLiBuHFQSHanYRCqxDpSpKOu1Q6bcv
         sk6f00CVIxZA0DK5g3JZvg+lQGU0xka4otzq7viYzC1MC1RwFRfhURMRe4QLfSavY2QL
         uouKNcpq0sl692u1+VROJeP1JmPI5BXl2AKZiEQ3bE/k0HTQgs+mCyzpjhr90Vwy/QiF
         LxgNTal95fs809ss93ESqX/nlhp6PDC4jra7DsfHw9AQf9aXAHCf2EeO4QKvB/9ALhF3
         vZenguqzJoZly4PH4fTvCGDiqBJPCve9N2onKaVW0uWm7ZOGZgVu+/c3bPsTBCj7Cm3a
         d6+g==
X-Forwarded-Encrypted: i=1; AKwUvByK/TBWoPcazEPYDvpGB6hF8Zhk5txvOikweQCtk3/R3e6IMQhopP7fpi33c7oHQTm5ESCD0AoiBNjqg5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpKzTR+p+XMCNZnakmFkb7u7rYbBg38L2HikYMisw4rma0FVbm
	9F5JsnbzRr5R/Sprnjfan2K289LDeDtDToVB8ntyqVkQcmzIteszxtg7ibv718cCRFR7Y+q8m0t
	hblnpK1DOhdj5B0phKuiNS/3SGvADcFEiFw156MiiOOQ2P4ZOuq1LvWZ9VYUcqv37qy0=
X-Gm-Gg: AYBFou0O3ziobGnXdmsLq8zRVDREFE7LZQ5k1FWkZJgPuAb+zDpYPI6O4J18awTUjBA
	22hiJW9wS/sN9xfuy1c1miup6HMupxvR4vLUxekrDZFy+RtbSsCab9LAAwTGYLqjxgpuP0tia9t
	fQA9RbxqtE6WLbvZdcdly+uAsk8TwR1gDzy2BV+HqCJVRQM8Gkcq67o/RKh0NEyzWoVZBq3Mo9A
	EFqzsHnp3c8uisRSjcWlDFsV6q7vHpC4RbtWAu2am4fKIkkQskLXKjXwQK/hXRygvzFT6P4o+yR
	d324ZzKXcEJlBXwgToswbMj67WPRa+uS8X1E9Kw0vJmPiSB4bzmopANlTR/fRh8O3WdTowYJurg
	UggBI1uSUmvWP8gEh1312ftF6/GjTtPfov6M9IQMigkjbNOP1/VqmRQjrZegTybnERZv12dgdLO
	a5HDPKTJMDQEycahaffiQ=
X-Received: by 2002:a05:693c:41d0:10b0:34c:15b5:b4e7 with SMTP id 5a478bee46e88-34cdbcd280emr6207112eec.2.1790822718546;
        Wed, 30 Sep 2026 19:45:18 -0700 (PDT)
X-Received: by 2002:a05:693c:41d0:10b0:34c:15b5:b4e7 with SMTP id 5a478bee46e88-34cdbcd280emr6207045eec.2.1790822717785;
        Wed, 30 Sep 2026 19:45:17 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4c1ef93sm3065432eec.28.2026.09.30.19.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:45:17 -0700 (PDT)
Date: Thu, 1 Oct 2026 08:15:07 +0530
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
Message-ID: <ar3JM7CHzLZgT4xB@hu-vishsain-blr.qualcomm.com>
References: <20260924-add-lt9211c-bridge-v9-0-d78b39677a61@oss.qualcomm.com>
 <20260924-add-lt9211c-bridge-v9-2-d78b39677a61@oss.qualcomm.com>
 <61aa851b26f9aa85a3ec1dc4bc8f46d7f1fbd24e.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61aa851b26f9aa85a3ec1dc4bc8f46d7f1fbd24e.camel@pengutronix.de>
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abdc93f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=10iAqneoWiIgQKNWSb8A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX0n1bXt6HU6RG
 51U6Y9rn74Ejc1jBpy7Oxax72BqwJoXYAvkYEBWrNCO+S+7hJW3Jjh61TX1dSbjPlzXglU8KdzX
 HSHFPsREnZlrbvknruuHDW32b+zoke0=
X-Proofpoint-GUID: bMwBOrEHRckyzdTd99E7G2M91hzF2rQV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfXzyl/WQv941FX
 Q2xncXQ4l0xodv1lVG+Z3+DFUwDBhG0Tevbfn+M3OdL5EWJqHkzSmQ/Rv4jOW82yuDBprTcVcGK
 yNE6pRkT2D5O3xlf2Cj8E2tjvHW73wbPJU+7/oM9jW/daH7XcZqr8KmKW8Q8tGYnHVJdaoSXFDf
 74ADe7VWqBF5l+VEjh/5lMwb4Ul2Jmy92UrQQZhmaZZmdre9DFhyMQ5KG2bARIrYRWdeHXQoy/G
 KjTX06jaH5wbva4vknynj5B3PGEq65xylu4KppvfiglvHvXj2odz11dKpfKYDobW1w+XBRUyGUi
 4pPjGNpdyr93wMZ7AA+dXZkl/blcc/Gz9KlqIIp3m8+joW2zu+S1YXIdejYr0Sc3YXkubX+GqI8
 kTypdMmHN94PGnzhn/x/gRtO7anveQlGApmP1mIcn3VoWbM+KZdXM6XiHlDfumKmrx2uimBcXuR
 VzzXIbioF1xNQs3v9dw==
X-Proofpoint-ORIG-GUID: bMwBOrEHRckyzdTd99E7G2M91hzF2rQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010010

On Fri, Sep 25, 2026 at 03:23:28PM +0200, Philipp Zabel wrote:
> On Do, 2026-09-24 at 21:29 +0530, vishnu.saini@oss.qualcomm.com wrote:
> > From: Yi Zhang <zhanyi@qti.qualcomm.com>
> > 
> > LT9211C is a Single/Dual-Link DSI/LVDS or Single DPI input to
> > Single-Link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> > Extend the existing lontium-lt9211 driver to support DSI-to-LVDS
> > bridge configuration by detecting and handling both LT9211 and LT9211C
> > variants from a single driver.
> > 
> > Chip detection in lt9211_read_chipid() is extended to identify the
> > LT9211C by its distinct chip ID registers, and cross-checked against
> > the chip type requested by the DT compatible string to catch a
> > mismatched board/compatible combination.
> > 
> > Add LT9211C-specific regmap support and use lt9211_chip_data with
> > i2c_get_match_data() to provide per-chip configuration.
> > 
> > Five new functions implement the LT9211C DSI-to-LVDS initialisation
> > sequence: lt9211c_configure_rx(), lt9211c_autodetect_rx(),
> > lt9211c_configure_timing(), lt9211c_configure_plls() and
> > lt9211c_configure_tx().
> > 
> > Defer the remaining LT9211C initialization to a work item scheduled
> > from atomic_enable(), since RX auto-detection requires an active DSI
> > stream.
> 
> This is still wrong, and I don't understand why you need it.
> 
> All scheduling initialization as a work item should allow is for
> downstream bridges and/or panels to be atomic_enabled while
> lt9211_work_func() is waiting for a vblank interrupt.
> They expect the LVDS signal to be active at this point. If LVDS is
> enabled at some unknown later point in time by the work item, any
> startup timing requirements the panel might have can not be applied
> correctly.

Sorry for late, delayed work is now called at first vblank irq itself. I think it will
not miss the initial few frames. But i will check more on DSI host side.
 
> Also, deferring initialization as a work item shouldn't have any
> influence on the upstream DSI signal. That should already be active
> when lt9211c atomic_enable is called. Could it be that there is a bug
> in your display controller or DSI bridge driver that causes the DSI
> signal to still not be completely active at this point?

yes there is some issue in msm/dsi host driver as DSI signal is not active at atomic_enable

> > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> I have not tested this version (yet).
Ok, i will remove in next revision.
> 
> regards
> Philipp
