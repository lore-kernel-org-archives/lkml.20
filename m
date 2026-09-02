Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C244CCDE5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359970; cv=none; b=PhXJrfb/Oy9okJFRrZ5JwHBW0TG/QhzsEPKuNNFNxieZ/ijOevYHCI3NiYKOVsNqFkabLc1CZ8TrzTVrcWfnMR1lmzpSRcLe8Vz2dlfOyUbcpHLFcJSXaTjTeUJAMHwkqbuTnG0mfhuv0YQsv8uYJGaQxndFENWhCLDR1xdQ7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359970; c=relaxed/simple;
	bh=V4z6pzEm4WdOtOaVMMD8VExZjegi74wTKedBZUUwy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1Gvn8M7JF9BFm3NqgL+BwIwZ8cI26nrxAd8S+p2TJyvm8nUJB4sjoCQYxyTZWXaPe6nPj0JQjT0L9aYR+uWEcHmXCDcK5znnD5dMzTKecD8emyHTDxS58+XRRYyz0Y0a3B6Ad4hm2ClsqBvi9fdZ8lReucQKTqX7qbK21sWhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdiKrmlD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFCZ8pTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdiKrmlD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFCZ8pTU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR8Wm1549926
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 14:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pvJaW1PmY06p/riBfvSZ/r0i
	tt6WPTapRiIe1XOVAS8=; b=LdiKrmlD6esXbaH36R6WqNdNETL5ptVqj6QkLncO
	RSx71t9J1UZipQHpCDo9FcLoQGSJ8u7KY2VvetMLVd7EcpW8bgAYwKDRcQTS5B/c
	Yw+a2Na6mFScGJonka7exW6cCNlzp5SoG+gv7JTM3jDWX9NPguKBykkekdy+euxG
	7mtCSo6Gs+O/AVE8A202KnKzXkWIYOk8mdMrqp+ldX7eh2600iypiOkdWpwcaSRt
	O5uwO5+aM6FSbBGjLFmpJ+7SV1Vjmjmkgv+AtAjY0io7bvBYZK4yYljpub0d0z7K
	87Eg/iUrjTuiZi42Ww0guB5EVfXDf0ucsVnnbOtoAmPtVw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c8y0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:39:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4f9788909so19034a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788359967; x=1788964767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pvJaW1PmY06p/riBfvSZ/r0itt6WPTapRiIe1XOVAS8=;
        b=VFCZ8pTUE0kqNRLuyePekurDzGw4hMGBMPZMMwmwsVCXA5PSfkZ7yVfnLJhm0YJi+P
         Ksv5Akjz14VoIl6IdYEhuE82J+ST7oV6f5EzOhATJzCMYLFLtIp6UIQGQ6RgBKz/FsLX
         Qj4lcJp4JdbHF2IizIemFNhith15U+CwY4/zdpfYhdtknD+Hd/dSlvPavjj1Nx0zLtm0
         3qhWgUCw8qHYCyF3w0W5LITefnCmsBfHTAHmY/Q2uGcIsUkul3iARVOcg36V57vGc8po
         yKwS/gdbAuFm0SWxjry92ZUPND9uMBGjCRz3qNqORE62bz9eK3qneygn3rwClcD3ZRM3
         Q5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359967; x=1788964767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvJaW1PmY06p/riBfvSZ/r0itt6WPTapRiIe1XOVAS8=;
        b=YPkyg6VdzXK45hcOX5YWzH5zWCKiYgNVk1rrKcbltz4OMqHFLnusxK5ftbgPfmRpZP
         RQii3Z3mCr6hiP5ADjAw0DlpF9wQfjWtlYUVIgGlJmbEdTYszV7XllH/lHU4e9aTZTo/
         U8us3s2J0hSXMAfyirn2CIwtlJHVW1Ah+P2WYRP6xcU66o4K0PW35h7fSQOG0J+lI1PV
         1SCzVM7GVRnyawCWPd4EqdHOZvyYPWk/AyW4LOLeG8noHQSI04dPljpN7VpOQSGSxdMx
         dsY6PPqo2IAc6TK1mniC5iP8mYdiobI/CdOdvtJXHj+GvEXIfxN8ZaofbyRVODnHBvE5
         Ro9g==
X-Forwarded-Encrypted: i=1; AHgh+RofxqinUp+CXHD7zUzd6YCjgRk6+bmb9jBK+aWRMy64vvq92RorNzzQfFVCXIZgAVcYNkdlOkALld9eD2k=@vger.kernel.org
X-Gm-Message-State: AFuF++n/Fi5wMoMzkfgYfW5dNLzb4jVt2orBq+plMtDVsW0I1JXdTj5V
	xeG6T0dsYQ7F6wWPHe8Y3GUDubvk2LTd0by9gozoeaEYyo3sws+Krn9TqHMi18rDHbWdd+jMS/9
	b/8BgxQ/Frd+pdzbwe1t25c56MOTAJ7Ibe8h8Np41Y2kyT28U0qcEbfc7GW/9J79mROo=
X-Gm-Gg: AR+sD11lsc+dxw8Mrs+WD8EMAIyCZjcoAYrLgOuQS6HLnu5zowmWuLSLFwZw1O9kOuj
	FhWfUU3RLGxIugAVMQAEhWF2RDKNfX7BRiepBn1i2T0CUzsLEMVZUcG5qf71Vqa//vqqMxWzFJu
	iAHbNH6w5Flm1G0xrh7bi62I9AAikUnPgLwJVOSB1HCsACwmMhgEJChkyoB7f3u8ftR/QP3IvlN
	I0Nmzfyj6iw0Wpi85iaKaJ4nXBaD/t3CFFb36BWv1mvCA7x0L2GRk98v5OANQpFOrHoGwsuZVPs
	tjhy6f50UrzcSpDorzYaoXalI1Z0GrbwmEcrTwsGHe/HOGiHSrT7K85DT0BdhDQWhazHTjICKJ6
	uaWPqCpoWVXNnoVsCtCG/zxbn/Ee9hr7v6ct5JZAePpqYHOo5CD11VBQpQBcbZvbSww6iTgI7z3
	ZYO64Jbp+k1lJs/Y7bKlPV
X-Received: by 2002:a05:6830:6d50:b0:7f6:6618:e558 with SMTP id 46e09a7af769-7f7812824a8mr2753210a34.2.1788359967306;
        Wed, 02 Sep 2026 07:39:27 -0700 (PDT)
X-Received: by 2002:a05:6830:6d50:b0:7f6:6618:e558 with SMTP id 46e09a7af769-7f7812824a8mr2753170a34.2.1788359966746;
        Wed, 02 Sep 2026 07:39:26 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74caadea3sm2318459a34.5.2026.09.02.07.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:39:26 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:09:17 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
Message-ID: <apg1FV3HtU0c+hVF@hu-vishsain-blr.qualcomm.com>
References: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
 <20260814-b4-lvds-panel-doc-v3-2-1ad152a4d3ec@oss.qualcomm.com>
 <1021133b-454a-4f49-965b-a71e065e556f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1021133b-454a-4f49-965b-a71e065e556f@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyOSBTYWx0ZWRfX2rM47deM5jFL
 lVBWTGm2KBgPnOojS1LtlmQGxNpb0GHdwryeo6oHh/dFLpDu4vvqp5jLcg4lgcIDB9q+luDLGHd
 GeBZOQIS9cKYuDry0W0igCPlcKVMGng=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a983520 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=F1Ix_FWfVmdgE0jxJrQA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FM1ZnZ-3BPNASXUbF1o-YiqO2IXgNvs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyOSBTYWx0ZWRfX13KcRZ6wVzU2
 ip1MqSRxMSY4m9I0dAT06lF/Hbc1OKmgkiHdv4YBUl4ZRgx57zUVkWZO+YKyJHSQTxI+niktRvf
 zSojQtb7pWvdX7GKV3m9+TeDsS1174gYxHnqeHrPhQiyzoZbda7YPUXzNScQ79Mc7byV0US4c2w
 njebFVoEOt4MlCtQMEwuzlPOdtFFK9iZMAGvVUn7OABQGAZReiRVvyunU+prh1pNv+59LxIpe+W
 frkw2JIolBlhU59XJ9pjhCibRNMlRHgSWld5spTKtQrno+feBMPlMknEW++FDd4w57nQnAJ4KRD
 VaaQij4MWDvjt7ZMyOghj02cw5ua/IoburKrk6lJx6k+23FfTZ4yyrS/JP9R1y58OaKIVV7Gqjw
 0nxS04+ym8t3ZrdNaH+jIoMoVoLscxAT2w38PlwJrnIKPYilv7izdpWXZMsHOni3s0jxoAe3Hn3
 RDiw9wMer1s8qOiVMqA==
X-Proofpoint-ORIG-GUID: FM1ZnZ-3BPNASXUbF1o-YiqO2IXgNvs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020129

On Wed, Aug 26, 2026 at 12:01:17PM +0200, Neil Armstrong wrote:
> On 8/14/26 07:25, Vishnu Saini wrote:
> > Add the BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel
> > LVDS panel.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 5c169fdf265c..d95f842c8980 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1563,6 +1563,31 @@ static const struct panel_desc boe_bp101wx1_100 = {
> >   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >   };
> > +static const struct display_timing boe_dv215fhm_r01_timing = {
> > +	.pixelclock = { 148500000, 148500000, 148500000 },
> > +	.hactive = { 1920, 1920, 1920 },
> > +	.hfront_porch = { 88, 88, 88 },
> > +	.hback_porch = { 148, 148, 148 },
> > +	.hsync_len = { 44, 44, 44 },
> > +	.vactive = { 1080, 1080, 1080 },
> > +	.vfront_porch = { 4, 4, 4 },
> > +	.vback_porch = { 36, 36, 36 },
> > +	.vsync_len = { 5, 5, 5 },
> > +	.flags = DISPLAY_FLAGS_DE_HIGH,
> > +};
> > +
> > +static const struct panel_desc boe_dv215fhm_r01 = {
> > +	.timings = &boe_dv215fhm_r01_timing,
> > +	.num_timings = 1,
> > +	.bpc = 8,
> > +	.size = {
> > +		.width = 476,
> > +		.height = 268,
> > +	},
> > +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> > +};
> > +
> >   static const struct display_timing boe_ev121wxm_n10_1850_timing = {
> >   	.pixelclock = { 69922000, 71000000, 72293000 },
> >   	.hactive = { 1280, 1280, 1280 },
> > @@ -5726,6 +5751,9 @@ static const struct of_device_id platform_of_match[] = {
> >   	}, {
> >   		.compatible = "boe,bp101wx1-100",
> >   		.data = &boe_bp101wx1_100,
> > +	}, {
> > +		.compatible = "boe,dv215fhm-r01",
> > +		.data = &boe_dv215fhm_r01,
> >   	}, {
> >   		.compatible = "boe,ev121wxm-n10-1850",
> >   		.data = &boe_ev121wxm_n10_1850,
> > 
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thank you, will rebase it and submit next revision. 
> Thanks,
> Neil
