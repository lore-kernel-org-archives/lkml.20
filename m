Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674603;
	b=AMVR/NRyteUzPvDJo3tDfTLn+jJWiubLsTDZkPwwi5nZaAoiZI+Xk1f6Dv3jC18rYq4q
	 d0uf8gFMlkdS13TLfxfBHPf3WDwkz0csYx+RJ0kXCPcbA2/6sonHs4m4XGtpk5gIVu5Kq
	 bgtCcrbSFP9zmP3FFx5wMXFkcFWhNQEVR4scZ82MjxbzKEnjrBmVGoS61d3Mvcg9BMFYn
	 WEUNSzxA4M8lqWbYJRZ662u2/JEz1f4ZoHzxX2qNfIaCsxT31/C+ffKUeTrF6PvefBAKE
	 pUic++MSoeWBYXLPoRyorJJawixpg75mOWO9Q1e5Q+2+YivckaUyay7/Z5kl6/j0dMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
	b=wbDE49mdoeCN6Fil/cPQI4T1Khk2mBA80GlbFh1otydPY0psMIzba3unXA2zeuhuT7yv
	 B6OYs2oIhJLNPd2Up4VuVmihGhfKM66dHS9XmPxGUPi/gWTk+rsheBiUJN4DmpWx2pTQV
	 6qdGypuqzwzeL2sIrVQEuCAFTGbU3C5auc2QjD+pCvHELObAOkxKnPLmi8w1GPwS/6Fqw
	 IFxbQ+MdOdu+n3mPoMc1UpQ1xtzOG//w72wJTCNHZO1EPdDI7xHpQTj86kMlSjhLOjHHe
	 6yj3XtwNSJgK4xXtvgj2hZs4n2tq6/uQI+NboOmeoS+pBB0ShbSaD7TUNVpMRjxWDrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4kWjHHp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XfOBk4kY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF76606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF76606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4kWjHHp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XfOBk4kY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xphJ346094
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X71VhERMLk9X4yX6oZKoIWZ1
	HUd6drCTkrXIPj5i+40=; b=h4kWjHHp2vQbs7FvHIG3d+zB/9hpThcUAdfi//Kx
	lHQMH9vEM6g/E9b9N2pDrJHNk9G6T90OAYdz8+F60MgY8MuMvPr8nDZhP5eTUl9i
	6oV5tW4+SUoYgUfJuoKQfOHAUv8avm3bVlcT8Z5vH54BGXzunjNOP7P7M9XndaJW
	4R0L6fjgA+khWUgH2DNpSbkAZ2TPpTjXJde1dzqTXIR+wowz5sSREPa7jtRjbkVr
	3wUhdECgFAlstvlduFnVdLXEILlECEh5HeObxXyF7MqoiGvDisCB4QTYknJ0I7l7
	nN9QjCi0F9HwgoaFPKjvmTcdjTU4Z5YuOEl8MS6yteLb1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93dbhv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:10:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so400966285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792674600; x=1793279400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
        b=XfOBk4kYZ2mSb5v9FGnXA9+hEhelNQtojd1pHilJYa+tCWkyTl1Xs8FlGe42DtT/9M
         Fu1MPoexSJlA8FHxCODYe8FBRzLj6HqyWcNW1NCbd7csuB0sH9XJbGnd9EYV57spCIA8
         1sHbcd9MLDg6GQTem0tvjs4A0t59/5bkgvoA9mTY9DifPAPHIjRjd+6+ZwpDw/ONsfyX
         l8H1/xfEkUbIbzfqxKgUZyv3HdRvov61Yky9h8+oUn9YHimLMKuAItXbK/KFAs6ocyIQ
         9DklOPsD8cMuWsTzkIIDWChPDVDDFttoscmHmvqolcZqDwU9e5f4Rm8kw+Jm9pMcO0lX
         c8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674600; x=1793279400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
        b=Qfg0g5r1uLmO0ajt9fPxnnCtTXzkYgBr93tavkRCUuzE6eXd0IErVMqS46b7tGtGPv
         sFQY1QyZCN7Q5hvX79x+xRKSTqWo/Tl5q5FsnKHKjk3XdUpWlUoxlYxIEY0PPqKIcO0R
         jmgtOy6aJ2a4S+6BmMIseV0cWPovup3U8VnPM1F5HlqGY+3vp4vdx4kQUXLSZrtykDzC
         dWkmM4TrvPO0WctAoaC5bVWmg6JQmgUDJUudQnKgWwpE3amWPM7vdLNiKtrKLpC8X9K1
         0Ugt4uqEuRBJrKMnH/GarvMRLc1CwPgK3mXh9s/Lyo46Zf41fQY5dhA8aCS2IHEhcqeg
         mFPA==
X-Forwarded-Encrypted: i=1; AKwUvBxkH83k3k9UWq5rUmdy45f9v4hfIHxCO782AlVR2Zgl8LQNujNcNe1hds65L1tIYKMNVKlsFbDUP2mzWYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOtlOjFVML/mwMYgcQw7IgFDqXpuxmpwspjks4LsAZsBRAp4l7
	A1gjEST21aC6dF9d7AN12OiWCSfr1V88BUGZrwgw4OSqEM6DsItlnEDQbETW1LWEIUX6Pf6TV6p
	l8xEJD9d0M2kI4VH4ItkncxzpJgsH3mw7ydF1pI0/yNdrtmbnSPAzAX6zTjFTFavjWXU=
X-Gm-Gg: AYBFou2yeXM6Pgmn6F18kaVAogRCCaevzLzRWj5No/6sDjK/SaeNrG1/JgU8m05mLQ5
	qzZe9VQ8Ii6HZ1EhSLYwQ63LRigyBJtwC71KtaqlOj8SqwjE+gvOqJhaxls1Z9fOflUg60SyRYw
	7u4jyjoVQeoTRNyLR/0iglyOEhwQLUDVcdPmX6XiMHassSEedkXS4HaLvSJYcbuQ2mCLQuULlNF
	PIjpnCgX1Pwa1IFcgPwt6BXua/IUxOtFsalXGwv5lDatwq+hxNyRRINaqlNgfEAo5lP3XdTkfys
	Y9liE/nTtrz+2ttemM1sj572D/zeGolGQ3AEnNhM7OIzSYfNncXK2+8GDI2HlcO2ECvINV3vcc/
	Oeu9qS5spfWMopfkGzKyuVR3zSi84m3+PCjJumA0AsdMK88G05TLKJm4X+L+wWpDuvkHZws1Jy2
	JfsKHH0vsoJBcH
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id af79cd13be357-93f57e5e1dfmr891282585a.10.1792674600173;
        Thu, 22 Oct 2026 06:10:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id af79cd13be357-93f57e5e1dfmr891275485a.10.1792674599660;
        Thu, 22 Oct 2026 06:09:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1b94eb2sm1024058e87.45.2026.10.22.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:09:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:09:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
Message-ID: <mdmxy4u5vz7xt6e524l3ghcy7b7yx63lirrnk4s7qzs4pm3oti@wucyw3rgooyk>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
 <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
 <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
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
In-Reply-To: <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX3oEMr8vHv8KI
 Ea1955P/7f1+c/krNWirn+E+skZNgRNruDMxqyKHZDUHITIDhTRGd6q7wdNDwZtbrWfViLB8zyD
 FT9Vmb0SK0ZeLneKz9w6qoiA8DEZzAc=
X-Proofpoint-ORIG-GUID: 2K7TLZqPLg7Zg1nu4sWhsEnmg6tOYFUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX3SSeXdey0vD4
 OpKMvrdtUoWGg2ywN1JyaweFmAyzPhLftbTBku4M9zsfqtlwIt21bMHdtoDh7Ot168shx+jQIVC
 9wy7V5vudGexHcavJp6Hg748NmeWR+BSl5Fw4+me7x8+wSszSjct3a44A5F3A0cCwJwL950MfGK
 G60CFh57LTcEvbqPtuTPZxts3L+fO6jwg5p3Qp49gQfL8F/0G+Hr+OYCGolyeNnmysTVug/xAvK
 r2pw0Uqxn2zohIdoxQ5z7nsX/LXD9I8rEVxpo3CwbxARQCAcmfyisUxs7U3R3T+mwEAHKxTUTCG
 1tQiuV5efb8fVeiXoXJ7/Hr5/3xqX0e+GveWnI0hp18HkWN19bXB3XFq3laFUQYVduUB7oU0bFE
 2KFjZMJ+jlgV7hPZKwe1szuzW8o8TyVuN5sUtDGKo3vOvPQ82Atmzzs6Et5Gf3Eact/rwpVT/Lh
 yFLYTc4Q+lsUEarZD6A==
X-Proofpoint-GUID: 2K7TLZqPLg7Zg1nu4sWhsEnmg6tOYFUO
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ada0b29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=qswy0Ei35aWKpRDCTP8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220052

On Mon, Sep 21, 2026 at 09:53:12AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 9/20/2026 11:01 PM, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> > 
> > Extend drm_connector_funcs::oob_hotplug_event() to pass the
> > notifications about the IRQ_HPD events down to the individual drivers,
> > letting them handle those as required.
> > 
> > Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
> >  drivers/gpu/drm/drm_connector.c                |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
> >  include/drm/drm_connector.h                    |  3 ++-
> >  4 files changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 00feb73e63d7..a51567d19550 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -141,7 +141,8 @@ struct drm_bridge_connector {
> >   */
> >  
> >  static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> > -					    enum drm_connector_status status)
> > +					    enum drm_connector_status status,
> > +					    enum drm_connector_dp_event event)
> >  {
> >  	struct drm_bridge_connector *bridge_connector =
> >  		to_drm_bridge_connector(connector);
> > @@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> >  }
> >  
> 
> It looks like you only changed the function signature. 
> Don't the "bridge->funcs->hpd_notify" inside this function need to pass the event?

This is being handled in one of the next patches. Indeed, maybe I should
squash the patch into this one.

> 
> 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
> 		if (bridge->funcs->hpd_notify)
> 			bridge->funcs->hpd_notify(bridge, connector, status);
> 	}
> 
> 

-- 
With best wishes
Dmitry
