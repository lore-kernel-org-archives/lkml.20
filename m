Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763907;
	b=ZxGLYKxkEnkWnbUcYQQRKy7mOKvs5NbJVOwCfa6I+Fg6aPhNmVxLA3Bh9X65GbbRoo+z
	 D7WWIOYbYzan3/w6l0Dodgx8ntwhkFXEs/uJcxfD/K83UDpd26/mPfumzrPsBFumxdJhZ
	 RoDvt8GPtI6w7J0RlxFHkIf3WGxVXnjhnxS8smhDDMjj6BI8MllsOUwNJDjk01Nmv90Jg
	 wE3Jxlzjz1Ul01L+GwbxJXf8p96ZQwvwjHiLq38HDAt4R9FyTZepj07X1F7olIsD/xelE
	 BYOGANmtPSLwI9kp73nN7AYHBYCmaQHAuzvPJQqUwFvAdqO6B3WMkxwMdVTXAi+Po/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
	b=kpwjQqaEDOeWqiKk84vjAEks2EezA85tsL/g0zE5OQaWEbqhysgiiFqeNK/LPxZxT6Mb
	 fLiUP6wMeb5NMqMC0ctksOufkaTcWPRbbQf8Q5w0tNSsKBDNrDXVAJXg7xQiegdB7+YIZ
	 p4z0JAZYH7Nl2LdIrn4fuLxRyPaJN0rMOAGz05iACPTkN4+XEKvCJPSV+MtEFfrsCydRK
	 iB4sqyatwgYHDoWn7+2JVCbmrkiEmDHKrH8s7S/p/TCle0JTGbTB09alVmMHXXQGMhFN9
	 ROy4h4aCHIOoo+QOLVFDf4nC39G8pPMmLKMvaCh05Hj6qdMTeg+msyEjm/+V9/TysYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKZn6itY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWlKYO5o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCD606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKZn6itY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWlKYO5o
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUQG2164238
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7Lokafbtj5YFNefAbCjS5Pj
	lLoXzpnAAjQItwYXw84=; b=eKZn6itYuZIK1NC+9xHZfchb8KTvAyZ4XOZFYKW3
	0+eTAk+I5XmKxB2IVs6XMk3Q4p/ByPrf1ZTnpvQHFTOeI1KGya6D0PwH2ZIYkgrC
	7/7GGI4RqWTsbZhM5FFlTpPlspHcsdoo0xAMW3mvg4cF340wjMk+EcguNR7RBcnB
	Zo5LqK4fOujLdPenSVOkz7Oj7zyEgjkhOSYGBWpROdPrzaVvRMXhrDPDG6O1uF0e
	bCJhqZmO7E20D9jboC3u2wZEW8oVDDYtHRQAW0FVHWH1+eE70DXGzC1uBMkSDGj9
	vH7u0yaK7343vdgcpUEcNsip5r2jE9+ZdhE4dhen2LK7YQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahvdd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:58:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so167936685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792763905; x=1793368705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=hWlKYO5oEtq7x5DkNW0yhUM3nDf+bpgmmTOYp4gjTy928N8jQ8oUFYRvWtaXV80Mjm
         4f5gfdsLsZUxByjpoDemOOyvgyhh5W4kDhxHWbORVpJkMy2fKxikplLOVeCwP4bdGU08
         Ted5JMbYATZGBeZlv1b9/fyfsh3BXd1rGKM3XrQCdVHnezYRwDNwzZONriiRqIJjujUO
         OB2jH19nKjs6NN7B2OulHD/wBf0NzU1MR9tb7K9RC5Ltzy2BHTS6r24O0Z5HTbAq/GG+
         3HlqQxg6uPhPwYy1z9PkGXrO/0iIfx4d/zqn4BDR+15mITZ6DOiCWK636JJGk4O08SM+
         vP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763905; x=1793368705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=Z4SdTX58vBVRofIQuOO5SVwUvuw9Omkf+CN3L/u/3znPptlpJm3lMN+pHDEstN+QcX
         Os1gtU6UR0kuOekRF4lGfci2tW8uyiULgSi+AxEJsKW0hZe3RSV6EE21d+6/v/fYGxNe
         fce+/GslKbVxX7Z5e0Upr5iNi7TzWuC6dpwZe7znRF77P9aXrM05wL1I2uPoORbbl1Gb
         5d2zBJ8J128/DzB2x5Bbb3daJTGkiiAdpk8dyid+eT1QqAqd2cTqmXDyoC/RsE/GHFBz
         a0ioIAEDLNyq3D02hRbQOlXJfL1FfQiyyWVONoJldPwhr2+faIbmcViZNe2gSw79K2wV
         xivQ==
X-Forwarded-Encrypted: i=1; AKwUvByQldw/ZR6bA/pXhEjsqEyuamMehMkjbCdDtR8pF2ZnEfJMN6Hjp7Vo0Uu502MAZk6bXqgq3yZHQd/XJlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrJCK6YAA5whnNHh0alo9DNtdhhXFctJknwkc2bwBxUGFf4KuL
	JVfkVnx/jF0k/knjM62bvEO5IXtREXfLwnOxGl1ZrCCNa/WaCfRUBWk1M5MVJKQXNzQLgvPkR/S
	bH+gkO3oBPVk54tQMLXYG/5S5OIcQOZm4EbWk57PxWJkOn7MZ8R+gHPlu//VZw5rIaDA=
X-Gm-Gg: AYBFou3f5D0U4K9wY8hdS/+wdB8Mr6LgYka3uFDdLXsqaFcekVd7dCWWAZ6xfproXOO
	r8s/Tg9e75jQ5fLQagsh0R24ifNm8+QSYfZPHKg4I5YiGpw3Y0ZAPm1K2Y4ae1tvbzmfsZbnwJa
	q8MbzZds1LSHFSdkEwgXQHI5zPBkx8bX8tP/3QU8MDSw7wYpqjAcUkieo6p+MZbMMCgUmG0GS0x
	tLBLWG6nd9PeY/SLCHSm73u7o46ur2NCt2nkqfEp0wNaIUx0fnl90ByohTKZTV5aLoye3oAquKw
	LwygGz2k6aqqJ4vV57rztkT9VzHsloXV30OxYiWf1CqVparck9Md94EgLiHLPf4NJGuxK0IPj/1
	sZJKu5JAYwPaQazaH0zeY7vcOOtS+S/5AAFSbM9YJ4wgg2vbu5VD+pdnl+h3pypgMnIHkJfWDSi
	ix9WlEb/XgG5Wh
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398212485a.32.1792763905174;
        Fri, 23 Oct 2026 06:58:25 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398207285a.32.1792763904719;
        Fri, 23 Oct 2026 06:58:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a2033sm389578e87.77.2026.10.23.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:58:23 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:58:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v7 4/9] drm/bridge: pass extra events to the HPD callback
Message-ID: <g5jbcwga22grufhguvkmq7scyd7ur6kxqeii24bedzli7nihfi@4hg5tcvlftnv>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
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
In-Reply-To: <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX29ifF0gnanTU
 ohWJ0uDLX0/qu7yFr74H2HvOe5W24wBtw1wZUoHpJpiw8Cuy6h5F2IHJ2hmeid/FNi9722PoU0t
 kN58JCJIrX7irm7iFKC5AozuMCFti90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXwuHE0MHUA68T
 1Lzhv7IXT7/7O3qgCSCwDGBv0jzZYbs/StOu1vz15hZIl9185F1VFY3q1s7dpGHukijEWopFfPR
 lDwZHstDMXGidBeigRsrMnyImXLRhejflXU2aarj1J0oztSLH4VzmsX4E8BPTvaEpjU3/xZYhmX
 bpgFqf7/zVlqVFtbGig5m9x6YqFicW6AjHpozbkr1fvtldvAvRMvkaiSX8aMyglnCKMZF3YaG1y
 FcAeGOM1ikIMD9fA0Hb7xMYQ/81mPo7beXeXLqHTY4NIR2WH9EAMEIY6zcndY66eXgDKypBLnRn
 0rNcFNffUab5MVSRuvJAP3FNSvm7bPAH63Sfp5fok88sZtX75nqYFbPPxSxFivDvO89gniZ23Su
 INYkBl9j1meuCVGZ8w7UCP2623UYGSRO6EUjMQ5HCFsp8NjlTrAP9Wz0ilaWrVlfXX3In4SUaA1
 /D7PFZRCjhLkMe5tpHA==
X-Proofpoint-GUID: s8G7xaD1NiBZgEbcEFWLDLyiqj-3DzeH
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb6801 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=FczUWju-UfBOor4io5QA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: s8G7xaD1NiBZgEbcEFWLDLyiqj-3DzeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On Fri, Oct 23, 2026 at 04:39:44PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Bridge drivers report these events through the
> drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
> callback, specified during the drm_bridge_hpd_enable(), letting
> underlying drivers (e.g. drm_bridge_connector) to receive these events.
> 
> Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
>  drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
>  drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
>  include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
>  7 files changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index c542ba6ce7d3..a21f9355594c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
>  
>  static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>  

This chunk needs to go into the previous patch. I will update it
tomorrow.

-- 
With best wishes
Dmitry
