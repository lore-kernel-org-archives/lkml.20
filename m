Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E7418348
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802944; cv=none; b=mKPheKL/peT5icMMLDk/Y3e9OPyWQfZWoAz1CbLr6T83vj63dnrqD3GbxjPeUMU4xp2ABAO4Dgit1gpB19lkfiqNG1y16A5KGKTQPfY5rO22Z4ejTm501JRnLM/RFuFIi8L7tKXGDQlghVMvC+0RTq2vSKCWIcAuYXDHsSMAkzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802944; c=relaxed/simple;
	bh=QPgwSiH0mcedSxvRcMi47oAiBcdjNi1rXQWQs79QjFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KinScUQG5YtO3KsH554ECUA49092pdXUj+AEO/YRS/TLqcW4eXebllVathaFgbdDNjhtdozy0cbca/abWr1DRWiG5mbeQNGf7UMaqULQP62vWCTQoaP1rgMtRF3gtSdFOsYYuMkDL7EQ4j+VG3CFZFDJR7gm2PQaNXUbADqzu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T32M2onA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lcu1nIrr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T32M2onA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lcu1nIrr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K8O92796117
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ij+QEVhDQngLjMpFriqEE/I9Mak/QvW2kLGvNvP+hg=; b=T32M2onAu5cCyqcO
	pV9iwe5znKbk6q6FhqqEy8JdG4ofFdhOA6NBx9q71UMyCx0wje46seLNEaJdcPgn
	uPVHCWdaG5zzF5PhwPnLrfGinhnUFvDtINJRs0FoeI/mAeox3JiEuNlTtevx8R7j
	ic+7ZSwe65F1UpaUZ8R0NlozciDDK1+YLkzMV/jZdjaPdauwWdCHes2SAsZi127/
	gj1qiS7JsDgq4lE/yrblSGDhE/K5KDi5soMMN8cd+gZ8/XpmJd8j+3jYjh8PgCyw
	VXKz2+D0T6aXrkteTgj97riXtYOXj9nGYVF4iSn/r4REKikRek2Y7k/Zrfd9s/cv
	sCnXXQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3gxa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:02:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso997528e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791802942; x=1792407742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ij+QEVhDQngLjMpFriqEE/I9Mak/QvW2kLGvNvP+hg=;
        b=Lcu1nIrrifIeuQXhSCwIj9BXXXxKlnY/h1luF9x7Sy0qpYC21t8DY0gAPOcd5WskMs
         WajnfMsZPjjc3ryIYwzapngvMBmgxwSa7xN7jAmUuXorozJg7YVU/2oh93boDeRZdTPn
         /uYyeNnEk5aYGMeY3uGUwCDBrRhEYf+sxnceY3MexVLHIyfPf6kfgpjhzN8gbkoSit7H
         k84+FdKuE2mO6eHL2z4GFT4JVTVZZyiqM62bvPaQ4lsNC1mZCmmSXP76IAENZLb0wPiv
         R5kwQ0d6N8lVmz/x/obBMBkD4SPwzCIcJG8Jm5BDiCWNO5qhjJG5pepRbBVD3djr9AoQ
         mQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802942; x=1792407742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ij+QEVhDQngLjMpFriqEE/I9Mak/QvW2kLGvNvP+hg=;
        b=jluyVDFeWiPb5n2q3javJtE7HxYRqQ22zAN9QPc+uyPo1JIgaaYyTuaE6GAdURcKp2
         UAJmSKgVK+hYLKH5oJEZQqJasWnC5SxYGIxJk+TOgxDqq5dLoqk7vGencU5upCObJmbw
         drErFoGWxUl6SGeYiOhudfkmxRUt8BKO3lMLlnG+eMVlCC6F4qonkHX8D9riWsTUkrb9
         zNhAltvhn0qZLLI9wN6JKCQxw9H+BaWD2tY5vGtDVeCqkhj74zpFBGzKTLrr4nXD0Ah4
         eOMmztGaruqqmVI8Awp5yns8Jbq6bkCIdfpFePC5GWmV+yjGj7J46gGXEJWj4zuZ4U/8
         yiDQ==
X-Forwarded-Encrypted: i=1; AKwUvByJhV9rWUiZci09CcaCoAyVPxibtK/4lE47Um9dmuQ2cA13f6gtES8AikCfDUOwld6lhdaaWPrwAB8IXpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMrQwdpNJxw9OzrO7T2bjZ4x22ZyUp95XJnLHjK3mHr3gSPK48
	xWt84HyLYhLCSgbu825N41lFAxcCUI3WHZnV+2TP85yAciszxQc9PxhmUOivTZFpPg0ycJlFREl
	fKfS4Jol1da/+5Ww9HOGVNnB1+1ohbikd+NL29ioc0odLtlzqBuUUOOn1yMwyrNNjLGQ=
X-Gm-Gg: AYBFou2DWQDgF19+IbV8SGPlIGZIMyOIp0ymvLV3+HxJkh5wYUbHid7x9j1AqBgikxh
	IwDIOLzPn10TfTIinhiZNksV1cd4HjlPr6FGtLggvUzF7ruLq9Jk4wETV8ZiiHIMFcgf1hAeKlf
	MfIzq1MyBwmy2Vs3oYGz8gPq6XlKMg4ugKQ8lTiRdvpxQcg93KQM6mdwXcTMteLKDgmSVSC4tj2
	RM0sSZBNSr4XqItv+BCydNJiietmXRsg/Vrqi1ha6QdPXeurBfc5ywzzeSZp/zNmjgEwXCrJtXA
	v4S5vJM7tnLXMvp+ABsQWvbTbG3JkmuF52SYtfMJ33m/YOtnmFNUwljtUSvj0ximXllcdcKOgeq
	bh1UdTkYArkrj94fBZ7dUQZ2lsSFOMwc1/yhd2lg=
X-Received: by 2002:a05:6122:78a:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5e91f250f1amr2399010e0c.3.1791802941664;
        Mon, 12 Oct 2026 04:02:21 -0700 (PDT)
X-Received: by 2002:a05:6122:78a:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5e91f250f1amr2398957e0c.3.1791802941119;
        Mon, 12 Oct 2026 04:02:21 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf09dsm19050569f8f.50.2026.10.12.04.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:02:20 -0700 (PDT)
Message-ID: <ef1d8752-87d0-4d8b-8b34-0f45b66b88cc@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:02:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API
 support
To: Hitesh Patel <hitesh@ebytelogic.com>, bryan.odonoghue@linaro.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <e8be3176-e2df-482f-ae84-bcab3d2f9fa7@oss.qualcomm.com>
 <20261012105442.788513-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261012105442.788513-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX9EUWEhpLbF3l
 qi/cmHsjCTwlwaS1/vaKOKQoNQ/PibhZ2pxpROu8/gR6pVLOr3upv7FSSEGWYdDCU0mYNjzoT5J
 RZESAq8ML9SMsm2zXlX95TGxs1MOgFHP+n6nOajiRcZ62hnyqG3BoFxHjbqbAaa2C58ilNKD5my
 vMt3TH6Gands5qNEqr+f/IbMtLXpjSb6c+SHpr4BX4n/OhPq9S0k8sejz2m9ZyY0/7ubBlZ+1oC
 +w7WFX+5/mInlDnVjYdFRLQE/b1IKW5TLzJqBPNCdvxJ4oD12VA9azxWr7+dzkkE7976N3m20UO
 TklF8z2tCo3jYploudY0hRdbtRo45gU6saUOW1ycy0TThEfB43AhIcadFTE7gEh0yQMsgyoaj6X
 yi+BUh+esIJwPmQDfBwPuhOm+wHYmWCxvigNAP4dL4jjp4wMULjV0/a5hK04StO+RphlWFseTIF
 GVc5uN3c6xVPkcZG21Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX7N5pgeSQmT3d
 ygqQ8/k12kCf8ea8bPTETslYmIfQ31nZJQj5N823f1rCHTPODX4Y29mGPff3Yb7Ut1qEes5MI1+
 /BpAyKoZF7onmJrXRvhQ+dEcMnhoaGE=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accbe3e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LjM-GJKGaAnEeAcpIrsA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: C-2F0DLmMMPdL1QcxibYSFCuGzb6GjX8
X-Proofpoint-GUID: C-2F0DLmMMPdL1QcxibYSFCuGzb6GjX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120043

Hi Hitesh,

On 10/12/2026 1:54 PM, Hitesh Patel wrote:
> Hi Gjorgji, Bryan,
> 
> I have now run this series on RB3 Gen2 (QCS6490 / SC7280) against
> next-20261009 rather than our vendor branch, so these results apply to
> the tree you are submitting against. Four findings, two of them things
> you cannot see without this hardware.
> 
> 1) Only 1/8 needs rebasing; 2/8 to 8/8 apply unchanged.
> 
>    The CSIPHY ops split is the conflict Bryan reported. Resolution as in
>    my earlier reply: a second ops table carrying the legacy core ops, and
>    the lane enable/disable dispatched on camss->legacy_phy.
> 
>    This is not optional for SC7280. With a debug print at probe:
> 
>      qcom-camss acb3000.isp: streams_enable=1 legacy_phy=1 version=4
> 
>    SC7280 has no camss child node named "phy", so
>    camss_detect_legacy_phy() puts it in legacy mode. Without the
>    dispatch the lanes are driven through the generic PHY path that this
>    platform does not have.
> 
> 2) 4/8 no longer builds. v4l2_subdev_pad_ops::set_fmt has gained a
>    const struct v4l2_subdev_client_info * parameter, so
>    csid_streams_set_format() fails with
>    -Werror=incompatible-pointer-types.
> 
> 3) The CSID pad-link guard cannot be dropped.
> 
>    Gjorgji, you suggested my "Do not link CSID source pads the CSID does
>    not have" would probably go away in v2. It cannot: without it camss
>    does not probe at all on SC7280.
> 
>      WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
>      qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
>      qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22
> 
>    Note the pad count in 4/8 is
> 
>      num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;
> 
>    which depends on lite-ness, not on streams_enable. So this hits every
>    platform that links all CSIDs to all VFEs as soon as the series is
>    applied, whether or not the streams API is enabled for it. My own
>    commit message was wrong to describe it as a streams-API consequence.
>    Confirmed on the board: csid0-2 register 4 pads, csid3-4 (lite) 5.
> 
> 4) With the guard applied, the series works.
> 
>      msm_csiphy0-4: flags=0x14  (FL_STREAMS | FL_HAS_DEVNODE)
>      msm_csid0-4:   flags=0x1c  (FL_STREAMS | FL_HAS_EVENTS | FL_HAS_DEVNODE)
> 
>    Routing through the streams API, imx577 -> csiphy3 -> csid0 ->
>    vfe0_rdi0, all SRGGB10_1X10/4056x3040:
> 
>      msm_csiphy3  routes: 0/0 -> 1/0 [ACTIVE]
>      msm_csid0    routes: 0/0 -> 1/0 [ACTIVE]
> 
>    and 10 frames captured off /dev/video0 at 4056x3040 pRAA
>    (15418880 bytes each, 5072 bytes per line), with real sensor content.
> 
> One thing worth flagging for anyone else testing this: the streams uAPI
> is gated at compile time by
> 
>   static bool v4l2_subdev_enable_streams_api;
> 
> in drivers/media/v4l2-core/v4l2-subdev.c. Until that is set to true,
> VIDIOC_SUBDEV_QUERYCAP strips V4L2_SUBDEV_CAP_STREAMS and the routing
> ioctls return early, so media-ctl reports no routes and v4l2-ctl says
> "Streams API not supported" even though the subdevs have
> V4L2_SUBDEV_FL_STREAMS set. I lost a while to that before realising the
> driver was fine and only the uAPI was hidden.
> 
> Bryan, the SoC-level change you asked for is in and tested: streams_enable
> on struct camss_resources, read as camss->res->streams_enable by the
> three subdevs. SM8250 goes from fourteen assignments to one, SC7280 to a
> single line.
> 
> I can post the four patches (set_fmt fix, SoC-level flag, SC7280 enable,
> CSID pad guard) on top of this series, or Gjorgji can fold them into v2 -
> whichever you prefer.

Again thank you for your work and testing the series, please post your changes
and what you have for verification i will include in the v2 and verify on my side.

~Gjorgji

