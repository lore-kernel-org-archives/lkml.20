Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478442;
	b=boHgYsQwjbYgn+eS6XXJSeKLpNnlYE3ou6KNvNUuuSbuN34JxaQy6VTulyzzAuVwVz+W
	 X+G5uxmCmiUmSc4bmxqVC61r0TcURf8/klhSFmTB9XlwtNAWfLTW1WJ4QMmRDA6pS+ZjB
	 RAAofPDEPevQ95owrAO+D9dxIVD7h9SFzZXysh8vO4kfJCJje4i//4gsFx3kUuqCdssZU
	 5FhcjNKssakT4drdd8kcCfXaylsTH0FZJpTFi0S8PZOpbowEFefIgU6KO2cPtAAK4NZ7j
	 GCi1uMteGaZ+RDJy1ENXmBVRtJyqUM/1zb7QEeK69GfcFAYRJX1c2+v5PMq1DdShHvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U5YmrFJ9xFF8sJ7me68N1z1NhFM5GxKEjaWMihJs3s8=;
	b=rPjEyXdhvre/THjpQH9OGYyGlWnBUpVdaQGOsyzY9pRQuvNwk6ajFxEI9wKmN8i6scSo
	 e5jSE3R25wf9cx82gh6MfnKuz48A6BTtDo+5jvtei3FhZ5z1ufry7Vjjo8vP5Weg9lUrY
	 d8uigUOCa7xfkLwLnu0o0l8tBRC6PLUFWKk9+Mh+V275Rr7ilHmV7JyC6u8mCa3vW+yzL
	 ZN4CmsVWJuHO3hEUIT5zZFJbao9VF9FYJABfZx/1hTEwYOhmVSFk8GPxMigeXGL2Z4Tlx
	 KfOg1yxu3MLSXk5/c0opfQKgi5n7yFE1dJUzWJH4gmtJOI2yvA08ixNzRqFtZ2su8HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIIzl0sG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6s9FZBR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBDB606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FBDB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIIzl0sG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6s9FZBR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFUpa1997558
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U5YmrFJ9xFF8sJ7me68N1z1N
	hFM5GxKEjaWMihJs3s8=; b=NIIzl0sGSoeqHRvyEzKaGiGSnfBuMhyy48qA5DvE
	FplqLBB6x5XJu+B1+L7nf5shPuAWoT+BpaARqQeqZ/69clzof8BdvDpll9OscVdj
	qz4JSNXcYjUaChxpju62SeHroIxim4zAqoySWCTeT2Cp6Ul4R9d0JAdHiSHikD/b
	CM/pWKpS+keNlsKu9WIkLTHb1nr242axLtGmt4GPB7HqVSoWnscysGDsSrCVUcfd
	JQfjmi76sbygprrMeCQreWmXlJo4OoVQjrGgzj2BpBQ3LVrgfq459DWJEvhvCFqI
	JhzsGzH2+qGgmVVkccXePEKxgqbIi0kwbUOeTMuIqOAvqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m99t9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:27:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so504951485a.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478439; x=1794083239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5YmrFJ9xFF8sJ7me68N1z1NhFM5GxKEjaWMihJs3s8=;
        b=T6s9FZBRnnmqOW7bFwSmLFmd+AnFLx1DNTjdlcPHYKAZoUMBu4/7iNDRuTbRD2WHi8
         aA67D0Zo9iyJ2oj4U5dT8HsNi5F5AaybXXS7fPJNKdb5GFS9TKCuBYIlenjglpI1iZ+0
         lVYnlOF57Yx+8qeMqJIzM3zuycUEi1QnzLRNpZ/sDQ+dBdnNSpuJFGegxk4ZqOK2UPS8
         XNGFADYAzpMy3xUtBXb/RzcRryQki7zCQO0xUvOpnSeoCQlc5ejwC0/zxIwvNF5hPhqD
         cbKutWKrhBRJnY0YMAW0amipzmIMYQxXgm0izDzt5Jm/Rm1lgWGOb6L/9ZppNt3xDpc5
         BZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478439; x=1794083239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5YmrFJ9xFF8sJ7me68N1z1NhFM5GxKEjaWMihJs3s8=;
        b=xqUPI2WVO5oLAzhccwV0Bs932OMYKdxWRXNgrXU5mcxYIvHuCQv362Srsj26tJbz15
         8zlB4QfNGOx6P+bHqGcDeESYX7Cw1O9V+fGrodCzg3ekZYv/d403JDXnBqUEhCLA6pgo
         V6FeA9n8pOA5ddr+oCU+00cJ/WHULW0H7jkn2Nt5MvP1Y6wa+nGvkG4PMxySwyqmcrOz
         wGgRAwO0EJTGJ7cf8PGC0EUHeUUHZomSE1cdjB7U47tllQSjyon+l1yiQg8Z4+aNPriY
         vi8UIU+NKdIC/VorGP+HCk6BlASL8BeUXW6JzHMGU45Q+286m1U+Lbk/9EOTTeYcD6wG
         UAGg==
X-Forwarded-Encrypted: i=1; AKwUvBylhED9Qg2CyZJJoCDzc9fN68AsBpTZOiyIQyJlP+DwYwr4WM59C336kmDPpwnG7vOyigulzJzbDQ3G5bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWc+E3vTja9NMLhJNuvcFr92kvJ8uGBG6XWJgAy3SgN0osiwBS
	i09oAtgHauTJboqoXIgtFc/q/kDPi97T01r9Yo8ZXyv0hgdr+Yg4AhNw7TfmIGq9lItcZ8Ih5Q9
	jo/BKf7FIyRwcspCfS1WBhvOQkJoJOnsB9DbrAlJycHpl16uvHMEOygAblZotxfuARiE=
X-Gm-Gg: AYBFou0RlR2yv9A3zlBpCc2sxNXLjEciz0USl5mCjP8YHXFVrLoXvG1Sm3MQAekPNBN
	7VhgrVAK8c9Xv4xQqoFcpVdzRNzlfyVDfPY5HM3XMYBeK58Pq7g7qW+r6HK0tISEpRKbCJv2L/s
	ANUrx70gEzC5taILqBkbvdaoZAAzlZWLp3UENhnO9XwHe0x7eMbVWaigk7ZaLEBk1XjCOSA1yxy
	4uJFVtNBrzKEgjUcTtu4mS/BlBP46fepGCkQ2gi4xpjV1u7WSRRob+COmqkga0yX7CCgl2Xhaov
	+adxFVdyemprY1wVr69l/65+ZtP2jVjrnLPQOJBu81eOMjVWSDtTQAt++Q6RvQqSdHo04G/SRHG
	8PBnwIk/afNDNSQ4rF0tUhmL4mOv+HYwYKx/va90BjDzX6eMFbCi6yv97kVl3NEPuTkg1l5+9z4
	JbC/qhD6wLJ0fZgTEeJ7vEIWXIC8jGpe8YKivLkgkxiIuXqX24Z+/0ZECYWU8rNA==
X-Received: by 2002:a05:620a:28c5:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-944214dce98mr1001815685a.1.1793478439329;
        Sat, 31 Oct 2026 13:27:19 -0700 (PDT)
X-Received: by 2002:a05:620a:28c5:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-944214dce98mr1001813485a.1.1793478438875;
        Sat, 31 Oct 2026 13:27:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d19csm750618e87.40.2026.10.31.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:27:16 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:27:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dsi: add per-SoC bonded command-path config
Message-ID: <pql25o7nhpmdbwkprsu5b3xurusxmnht3p3xb3425ubdkxnzdy@wguqdarh7h2a>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031150305.1107572-3-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261031150305.1107572-3-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: GYk1jElCs6h9gdDz5efHC3q1J8JupL6f
X-Proofpoint-GUID: GYk1jElCs6h9gdDz5efHC3q1J8JupL6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX21yuzxXAClPh
 7DL6y5psJguMW597b+mi+8q8dg5uVDB+l+YJXIjRaiqKF+3o7NaYgHpIpntG7OPglzY3oGRIitQ
 /Fz0tXRbiVs8kWolHi4OUu+QygxUkMX/f4uxs+Q6AjVCbKOTHHTY/4U+cZ2db5x8fdrOL4XobLS
 qeMlzAW6Shy46uDznJ97kLiMc7VWzaii+55EWRWQJBfij4ruoHYMO2qU1Ya/nMnC8O7yeMBBfp5
 gJcIJErtNCfdxrih8PVoSSO1Fr2w3uVb8SnFKtyct/qKSDOYEZs7RvpOZozXH1qpGjS8Wx9nP2R
 8gUz+TRVe/+Q5AvTVmZAMpMvJY2+1OVnVU3FxnXYkaLC7t6ne3KyAFmoumPGM5mg0jxlFQqKSlY
 oFBefYY/ffgJ9wqwkQmqHqqi8fYOR5RgCdnoldpdEZoq+DxG5YHt6gp1s1YywA7lsFPm4bIzMqc
 1MP3g55R2Y2mhczd+xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXxsErmC7jEwdD
 oushl7kjLa+EAJbZnMX13Z9uBVCdtsMHdzsaE7tzAB5XyPzUwGT0/QrI3lG0AIqnh9ekvcrDX3h
 Shj6Qqgs2S68pgUAgTEM8gsmE+P88vU=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae64f28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=luF8A-hlZe_ITdDpm1sA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:02PM +0800, Qianhui Xu wrote:
> The bonded command path carried its constants inline: the error-mask bits
> in dsi_cmd_error_prepare()/dsi_cmd_error_cleanup(), the CMD_DMA_CTRL bits
> staged before a broadcast and the peer poll budget. Those are controller
> facts, so they belong in the existing per-SoC table next to the regulator
> and bus-clock data rather than in the driver body.

Do they differ from platform to platform?

> 
> Add struct msm_dsi_bonded_cfg and hang it off struct msm_dsi_config.
> SM8750 reports DSI 6G v2.9, which selects the sm8650 cfg entry, so the
> bonded data is attached there with values copied verbatim from the
> current code. Use remains gated on the sm8750 compatible, so behaviour is
> unchanged.

What happens on the other platforms?

> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 22 +++++++++++++++-------
>  3 files changed, 63 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index da3fe68244..640ebe8244 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "dsi_cfg.h"
> +#include "dsi.xml.h"
>  
>  static const char * const dsi_v2_bus_clk_names[] = {
>  	"core_mmss", "iface", "bus",
> @@ -194,6 +195,24 @@ static const struct regulator_bulk_data sm8650_dsi_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 16600 },	/* 1.2 V */
>  };
>  
> +/*
> + * Bonded command-path data. Values are copied verbatim from the vendor-derived
> + * in-tree code; the SM8750 compatible check in dsi_host.c/dsi_manager.c still
> + * gates every use until the master link moves into this table as well.
> + * TODO(doc): err_clear_bits/err_cleanup_bits touch bits that dsi.xml does not
> + * describe (see reports/b5-per-soc-cfg-design-20261027.md, RFC-SCOPE R1).
> + */
> +static const struct msm_dsi_bonded_cfg sm8750_dsi_bonded_cfg = {
> +	.master_link_id = DSI_0,
> +	.cmd_dma_ctrl = DSI_CMD_DMA_CTRL_BROADCAST_EN |
> +			DSI_CMD_DMA_CTRL_FROM_FRAME_BUFFER,
> +	.err_clear_bits = 0x001f0200,
> +	.err_cleanup_bits = 0x44440400,
> +	.poll_timeout_us = 5000,	/* 500 polls, 10 us apart */
> +	.needs_link_clk_bump = true,
> +	.needs_sw_reset = true,
> +};
> +
>  static const struct msm_dsi_config sm8650_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.regulator_data = sm8650_dsi_regulators,
> @@ -203,6 +222,13 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
>  	.io_start = {
>  		{ 0xae94000, 0xae96000 },
>  	},
> +	/*
> +	 * SM8750 reports DSI 6G v2.9, i.e. it selects this very table entry, so
> +	 * the bonded data has to hang off it. Its use is still gated on the
> +	 * "qcom,sm8750-dsi-ctrl" compatible, so an actual SM8650 keeps taking
> +	 * the regular command path.
> +	 */

Huh?

> +	.bonded = &sm8750_dsi_bonded_cfg,

If it's a sm8650 struct all the fields should be sm8650 too.

>  };
>  
>  static const struct msm_dsi_config kaanapali_dsi_cfg = {

-- 
With best wishes
Dmitry
