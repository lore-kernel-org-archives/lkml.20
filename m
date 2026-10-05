Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD66154425
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791165787; cv=none; b=ej4B5rTnm1zHeD3ZqxRMzyFp/XIG4V7/9kuwMRxkk2yJCBuZPRWQMIeIb568qaztB4X+vBAFRV9EayMUSHQmcm8BFdMy5nP+uTMa50o+ZsGyu+8grUn6KUJWp479dDNnWVHX2R0Tv0Csy8tXAJz/XswFbXeBHy52AOZvTxaaXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791165787; c=relaxed/simple;
	bh=D9Qf7wHcoSWAHeYCtWzkYP8+JyMuhb1U18c/RLSREWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH+9LIC1YHdpVZDSNzfeTu2CyOjhRKc2E5rbZopgssJZkb3ebdknCEZ22KTRsT4sW+7UTaTnHek/QIhWuBk5F9qUQehpBD6EOZsrFBo5GqhEkZJ4gOjaWryhbuoNAgru8qt+19CvPEbPp5S+PCQ4q+B+Ukk3ECqB65XubL9uxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2/Iak2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idLuTzQC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2/Iak2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idLuTzQC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103si3688170
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 02:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SgEIltGQkRfnBLbDG2XrKCaH5AEd8lzeFZSn/DYU0I=; b=b2/Iak2rzA16AFBz
	USndGqFKkXIMGYosQRob8pP0CWF9a11zSNM9emK/3l/j6TJvqyJ1c3cLocMTG/g6
	j+9uthC16d5RUwxtlv10XQYwVlXYbviB6a8Wdcn9A5bAQtSrekD4yVHBHxNoE7bj
	9wDWVf2yWrFg7lHj9RChbuf+OrZpZBJB8EbA4DvRcmbVk4sbAHfezXuzXkePQkOl
	3k9zlGo11K4h4wnJKGf0rHdu9pGKJVMmWa/JcflHRXNwGGsSdYqwFT30Tq296+0o
	Z0FJ1NqWKzlBL2pYR2algI9XLxKyAQjYuhp/NzSO8yBut6LD3yKTVSm9OLH3oFlA
	DnbOzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfj2vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:03:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso214611785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791165784; x=1791770584; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SgEIltGQkRfnBLbDG2XrKCaH5AEd8lzeFZSn/DYU0I=;
        b=idLuTzQCD6Pf5yY1oseiNUote8aB4YZngDQE5dIbwMgPGnrc/4a45S7VHTLWBFiOVt
         SI8bCJ/sMDbti91Wug/2EP4ESM86zT7WOoObZB8nek9HHVE2cB6rSoLMJDlMjw0vx9I+
         QUdZGprfCCp0QOv8yIdhgMu8quQXLpk2JEfALzC9Er+u54YNFTldCAiNv4NmupOg8S+o
         y1yAWLhyy4BSqVnKQkaGjnwxluCsZ781MTtTLgj/QwLssQ6b/Po6G3uFtN3085zr0VmG
         R2buUKszUN9jQKLPshUITNoHwbNtQtXduPUwKaYLP0x/cVIHJ9xfGMfX17cqPu2rQ7lL
         cgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791165784; x=1791770584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+SgEIltGQkRfnBLbDG2XrKCaH5AEd8lzeFZSn/DYU0I=;
        b=ElIwg1JAjYGQl/iPnc6ImSyjF2/KcFhbgpff19w4j8XApfGOMNgrckD5pHj4ugQfzg
         Wce3e1QENsbBryxJ46OJlCJQ+AZXHIg0tUxCEgBpYRlJEMXMu500gYhxdMsG0GfDoVDb
         qELhiOyRHRtaeYRhWTnicSWtNWyWY9D8cqexOb/kiG5yIzcaZeN9CM0eX5q0PKNUFy3h
         lN1qvqEsdQe4ppbWAg5yYVGVNsjmRuyfcvGmV/u/f1mv6VZGyutcSOWvpROon7s8/pM6
         g6yA2R2ESzdywZ1EA4BsKjnU7piOlYxDNHFXrHdFZ6kp3lWiCAjJkCmxea0Wk6ZVTTuH
         R6JA==
X-Forwarded-Encrypted: i=1; AKwUvBybrj7QCSbYEvhVb2gU2Z8yzv+YzOovD/XUNxRZ6v/u78If2pxbiqglMnE8lJ/56xTelO8QcXgOroazDTs=@vger.kernel.org
X-Gm-Message-State: AFuF++meLbe8VW283keoT3NF5CkxMhXIOEwkyaGeZ3g40girNUz02Dax
	YnheStBWIuA1qPPmz3CNUrawSyRR8v2vv3wVZxa73tBlwgwlVUUX03fnsHnxDLWSeuz0HtMu/+5
	DxGNakZU2UVc48UmyUaGh85JrqlriYIbSllyIDXScm2dsV74W8MFGQiZwqpi4C/BbUK0=
X-Gm-Gg: AYBFou1x2XqLj6zUqcTCO7yZtgjARRJozRWnUaqAHvGdnHelUolrKkDG1RI1DrJgZD+
	fNS/8V+b8rcV7KIEwNKO7e0F5lfVMDEbxuT7mYj+wq++iu+ppufNCtAXt7ObbrHftFFsZkIz9Ej
	Nwhz5JCe4LAbgad5q5exc16Yqi4VggpPJPkwEV2AsRvkUokLwPmrxdn4IDyHVSbizLyD5fqwKD3
	TghFXLZOoUov5PWLqoEFOVd9Rkm5qx6njcLDa8wwIrzF9uu27JKc/Avzezz9o64H2u8xTeTJLsT
	WhEWnmTQKGDV2Vn7urMM27xZv29Grtbh2CXQavHXTFRt6WGYKwW92caAtM7GWldsIjc+YwiVJU7
	vJfad0ShMFnRFQKd4xfJVkZ9TQuo1hefiN4BPqfBLRVXtiunuikVdTyuwqQuThbbFkGLdcsXKzI
	p8bV2gUpn8IFPT
X-Received: by 2002:a05:620a:271c:b0:93c:3863:ff7f with SMTP id af79cd13be357-93cb54376f0mr2312052685a.0.1791165783970;
        Sun, 04 Oct 2026 19:03:03 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:93c:3863:ff7f with SMTP id af79cd13be357-93cb54376f0mr2312050785a.0.1791165783480;
        Sun, 04 Oct 2026 19:03:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb70fsm2877427e87.76.2026.10.04.19.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 19:03:02 -0700 (PDT)
Date: Mon, 5 Oct 2026 05:03:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <m46353a3ikqtkv3ycevnpzg77z32jickl7hophmehlot4sjj56@bbh7kjb4td7z>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
 <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
 <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
 <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
 <CABymUCMGT32A5gE+a3u7=-3scH_Nu7Amb22-FRfWiNrcEOnAgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMGT32A5gE+a3u7=-3scH_Nu7Amb22-FRfWiNrcEOnAgw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: MPK0lqK6gw2SdpVS4RXhd376KuUOwFpF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwNyBTYWx0ZWRfX22gW/4rqAiRP
 9pITFHvExOLBqP5DZtMfHfYnVgaKvL49k6Cv+z0xgfF2qJkeztIE2wbx8il16auSEqgywlarmoN
 ZhsEdILc26db2JIihawglayebqORFp0=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac30558 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=kAmi71hXjrz3IqBiEUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MPK0lqK6gw2SdpVS4RXhd376KuUOwFpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwNyBTYWx0ZWRfX3H/hoLkBVnAU
 SI+QS6o6lRLX2WyJcT+kaDdvv2I5+ff2ETQ9we6X+IJb0bzu8JQ8qhD8WpecIO68FXY7EsXOl1A
 3u4RLvJvFBZQiaqg8CQupHtWlCnOpGFQlDy4eczTpzkIDEfVrAYPx2yEu6lqrWQd82bSfDFYx3B
 zvHHPn44o9K18afM8/NDGNFdxSAjyVEjHXwMdHJnMVlkPnQlJdzHsdSuZpNJEnEn+JGlY8hHIfp
 EfPMHZGbPdaq03pk7AHsjSRmEwKdcjm4bDx/Pvi6VWDZIAkEiVhmc1hYBkui4K/azZW0FmBubfK
 krCJ8HgC4WZp1iGENbYwKeWKqQavJmWevglsZCTWajIyLotyMd4i5D6SqMADVn0d4x1x74+Er5i
 5cFEcNUZJi4x2kYJ56T59SK4BE97JsEFmyrW8f6YSDUEj8QjvRiQc6DUu8lPGedMaLGzb48Tp/F
 vVqPwHylS6fDsok4TQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050007

On Sun, Oct 04, 2026 at 09:58:04PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年10月1日周四 03:43写道：
> >
> > On Wed, Sep 30, 2026 at 09:52:48PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年9月30日周三 00:05写道：
> > > >
> > > > On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > > > > Some devices treat two independent physical DSI panels as a single
> > > > > logical panel from the CRTC's perspective. However, two separate DSI
> > > > > hosts are still required to drive the panels individually.
> > > > >
> > > > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > > > allows a panel driver to inform the DSI host that it is part of a
> > > > > dual-panel setup, enabling the host to coordinate both physical
> > > > > displays as one.
> > > > >
> > > > > This change does not force individual panel driver to manage
> > > > > system-level display topology if the driver does not intended to
> > > > > support dual panel topology. Only the driver that set the flag to
> > > > > true need to take care of panel topology.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  include/drm/drm_mipi_dsi.h | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > >
> > > > Do you have a single MIPI DSI device, or are there two independent MIPI
> > > > DSI devices? In the latter case, the flag is wrongly placed.
> > >
> > > Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
> > > mipi device
> > > to notify host they are one of dual panels, so that horizontal
> > > configuration(width)
> > > in mipi host can be handled correctly. Where do you suggest to put this flag?
> > > Thanks!
> >
> > Into the msm DSI structures. We already have several Qualcomm-specific
> > flags. I'm thinking from the 'generic device' point of view. The
> > 'dual_panel' doesn't mean anything if the device has more than two DSI
> > hosts. You need to specify which hosts are mapped to L or R channels, etc.
> 
> How about to add below 3 members regarding multiple physical panels in
> single logic panel. We have h*v panels in a panel wall. The index start from
> 0 when we iterate panel from left to right of the top array of panel wall. In
> XR case, we have num_panel_h = 2;  num_panel_v = 1; and
> panel_index = 0 for left channel, panel_index = 1 for right channel. The
> original framebuffer is divided into width/num_panel_h and
> height/num_panel_v for each panel's DSI link.
> 
> u32 num_panel_h;
> u32 num_panel_v;
> u32 panel_index;

You have seen drm_connector's tile-related fields used by
drm_connector_set_tile_property(), haven't you? If we are to use num_h
and num_v, I'd also use h_loc an v_loc instead of a single panel_index.

The driver needs to distinguish (for the DSC params) if it's a single
panel spanning two DSI links or if there are several DSI panels, bundled
together, so you also have to add h_size / v_size style of params.

But then the real question becomes, do we really need this complexity?
Will there be any use for it other than representing the XR vs non-XR
cases? This all doesn't concern userspace or uAPI, so, if anybody needs
actual DSI panel walls (maybe also using DSI subchannels to driver more
than two pannels), we can extend the solution on the kernel side.

If we take the dual-LVDS panels in mind, I can propose the following
API:

struct drm_panel {
	/**
	  * @dual_channel: set for the DSI or LVDS panels which use two
	  * host interfaces to be driven
	  */
	bool dual_channel;
};

struct drm_bridge {
	/**
	  * @dual_channel: set for the bridges which use two host
	  * interfaces to be driven, e.g. dual LVDS panel or bonded DSI
	  * bridge.
	  */
	bool dual_channel;
};

Devices like LT9611/LT9611UXC or panels like hx8279 will set that flag.
The DSI host driver can use it to determine whether to use width or
2*width in the DSI calculation.

At the same time, in your case, you won't set this flag. The DSI host
driver, fidning bonded DSI link and non-dual-channel bridge will
determine that it's a panel bifurcation case and handle it
appropriately.

What do you think?

-- 
With best wishes
Dmitry
