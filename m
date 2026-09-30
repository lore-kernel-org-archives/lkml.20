Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512740F73D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797402; cv=none; b=kf5LjBoF+ZrWdV/0wCbnjiuncApZBWf8okPqUsHnD75dpvjnWYpUVL3t5LQtGNPI3Z3GB/uEzKhVcfFUYyW1Iw6JmEOQR/S1mkIgbxREyUA/YfnEHdvT+lIfNbsjwSj8gBp/gJm7g25hZFdwRU0dwqaOMfzIunbUDXCi/9Csx1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797402; c=relaxed/simple;
	bh=2dC9A9LB/DC0XhjvaBbr6vG0m60dUwffQrb9zaIDjwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/TJMMV2JmfMJCLHHxMZajtuWu1KBtKEZK3hPBo9N84RI6cLQV1PRD9qbKCvy7XIe1sC2JdJGx8ccRz2VGm3s6jpRIJ7Ls+2AuyVvQxXQhE0IIfgBysWGMSBy51ERQcwFx9cqJczilNuPBYwi9Sncaf7/R+FXyH71n3ydKQAuU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHZLvR+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qktn4+59; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHZLvR+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qktn4+59"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHf8GR1110244
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	007PSKl5xLWMYdPRP2bDBtZ6gH/PmdJJeMhutR+eJOA=; b=MHZLvR+lJBkqEsIZ
	Zs/mnDoPFEP6EiqWdJtGzMF52HeZLRW2KXrPLQciTRjzKqomyUnMry4XKgbuVqWX
	eMK6bPuEYd+NOqe0CYLjR7rokFmy5StvslTdRKpoU0Bgs+2R+P1k+nKbuFkYbrxM
	bl9YZ3PIOZYVmFHOFvE0lAF75gqDOTh/mxpNb/lyf1KvtqT0F2UkTYUfC+cGaW0x
	Sau5pNyCk7VuPEJ4rZode64wBcZg8mNu96+Z+JHAKXM3/a0Tu3jDKf+02a01avL3
	J6Ab2+O/9cwgCe4/i8TURpLAtFv82pCcmSedUAZxrcdTsxUmBVQrUhfvQHTIwp+B
	ILN4nQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh82rce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:43:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso1057886985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790797399; x=1791402199; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=007PSKl5xLWMYdPRP2bDBtZ6gH/PmdJJeMhutR+eJOA=;
        b=Qktn4+59NHf2UdFRg6VmXBwxaoywB8zKKcBC6bVUp8hB3LPHQwCuBY/fmtRkIiuaK9
         qsRO6MoY5LIBlI/NAV9D83HfQ1+eE5NYfaMPDB/hScBfitlXBjV5J4SmEoNn13OutZOy
         0X4TG+Agg26bWAQSLsgKtMFng21h7+R5jNZl0n/sH92pBMW9PR6Ny9vBVeyO5Squ5Upn
         ZrkSDJqWOZQM1CR51RZouFEdZWiS33Q72fxKVf1JdFj/Wt/BIRZjhLG6tC7eayoTFr0S
         XUuHko4g1QstcbQV9RKgQglmVd+A1eebXdF0tlTE0P5QJN0LUNNCcAHc562Hs4G0bbZh
         haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797399; x=1791402199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=007PSKl5xLWMYdPRP2bDBtZ6gH/PmdJJeMhutR+eJOA=;
        b=stAir+LBxhSFCu9Vq0Deh+X6gps+GhvatXNCTNZa3gRYKITpkDVCPLbPn9nvdFzrat
         H5rgGYbp21Ry1gxJdMyTEBloiBViikNnsYj5llrEmoBvh7B+0RDMpciwdbHqex7SEy1Q
         9avXuvbDv7ndzz21lCeCmjeCQbjB6bKmN/MnjFk9Cay3CuaRGQ1m9NKmuFFFEnnlMA5D
         Zs4H/1K7FDHMD3Zz0BbSP5pwWX20TQL1q2H2wbu+6QN7WU7NvWQjDKpcA27Dm1qhUNp1
         rUJ3npUsVBrCeLY0K5SHK2BQxi1OcWe0D2vEbRbsciXuqdrG6Hp9ywyD0t8p04uPS8j7
         f/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeQZ7xB1m93b5gYPvb3I9PQzU4CpWCpDhaEKqB1vCRKjlpamT9RteNKAfGEaG0YUiN/BHcwumn84iWGMw=@vger.kernel.org
X-Gm-Message-State: AFuF++mf8mJLE1Dc5UzLccAZ/0D06gNK32JHFCvGftGJyA7IVkOLVuGh
	rZdljcLRtBCETF2hveGZQ31PyU/kvsGKMTvmvrvv+NCH62F3vZmaUes6xN+n1vZpycFgveWVgRH
	JB+sGiiBF2M1gihWa+SWVh6WR34aGFFn+Avm3vP9SHnjwHPS+uC3EU7ED1K0DUEjStoA=
X-Gm-Gg: AYBFou2MdBV8nWKEaScISRPZzYznV6kSDOL2OU880TH1776qyB+eT1q6flRwRs8k5of
	ZRA0q6ZpsUv3crMJi8TjoOTJO/GsxXgxlLzw00kWFeLeZR9y+npzuA0KzbqYzvNbDttjjrDOhCv
	SflmDC3VQY7wN4c5PEsXthK5qWfB5C6pJxznaynd1D7XObv07RCSu+fd02w/4Hvxpbob9sP723C
	3U7xQk3wpKYwd32NmzK3FM+/+QWvGgTtAdzC0j1nZr7ODUnyUIb2ATfG5qcQF3ArRehP3EqEnbA
	oj5qAZGAqgpgH+hQx74uVvpCkGn9csyTmrsJU3bvyMYSBbDS5TBHlwoFr75pQVG1VAa2mQC5tw2
	SXgis6jfwLJYAIr3GP6g4Stdh/MpIol+SOBuPbCwp8Uy51gqV7AcLICSuf7kOFVoVbBLcbDq6u2
	0XjswXdigG/eK5
X-Received: by 2002:a05:620a:880a:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-93ca98aec8fmr429664185a.64.1790797399135;
        Wed, 30 Sep 2026 12:43:19 -0700 (PDT)
X-Received: by 2002:a05:620a:880a:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-93ca98aec8fmr429658785a.64.1790797398603;
        Wed, 30 Sep 2026 12:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba44059773sm18477e87.11.2026.09.30.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:43:17 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:43:15 +0300
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
Message-ID: <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
 <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
 <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX8D9epi9X2QF+
 QO8a7T4yN1Yc16MITbIY3N5uYl3k+ie8mXjOu6jJdYBdF+yE5kTbQ6tr+y6NRF4e3PogChquz/o
 y2k8V9tzIxa4h6XYF4l4wNJtEPVvpwAXS/M7SwXfc7/9waQ4GGvQVokLG47WNDrE3PWl3RNPmGC
 zhihx2OpjyNUwSJStfG/Lk/46ZVG0+za5ThL2LflTRrcd/oRLCvh5+25w+TqPVBYAuf1gO++dAc
 lGHT1XfhwZb5ReU9JMymGSNebNI2rmBFgNSdQofaHHbNWg5c9G1GbHpbws9cWQn0mhGw3SR35Zw
 y488/PncFePg0QqkCvWBFhYthcCYknUO4WK+HbxZ8qdXW+cVMRb8WTE2EPs4/dniXRBixqjL3/j
 W4vuszCM+eQ4ktX3K/4ihNs80RJHO5MPvRJT9F7fWmN9dO/EHufBv6ri1ozkgrx2WnbxidKu5Vx
 TiB8pm49PX8Uhpkqtgw==
X-Proofpoint-ORIG-GUID: PBIIxhriVNdUIRwBdPL_jKe6g4DlPmDw
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd6658 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=gnaAZu_HdrVRTMOkdIcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PBIIxhriVNdUIRwBdPL_jKe6g4DlPmDw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfXww1yDQ07zOez
 hyeVXXcuHhOCsCs91la8hqKd+TARY/tEeA0LMWUjk5MA21/VXZep0H74l1I+jXgm4QXPNfhY0gu
 kQJMseVskeuSX/E9+i5wk2ceJMRTVYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300080

On Wed, Sep 30, 2026 at 09:52:48PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年9月30日周三 00:05写道：
> >
> > On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > > Some devices treat two independent physical DSI panels as a single
> > > logical panel from the CRTC's perspective. However, two separate DSI
> > > hosts are still required to drive the panels individually.
> > >
> > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > allows a panel driver to inform the DSI host that it is part of a
> > > dual-panel setup, enabling the host to coordinate both physical
> > > displays as one.
> > >
> > > This change does not force individual panel driver to manage
> > > system-level display topology if the driver does not intended to
> > > support dual panel topology. Only the driver that set the flag to
> > > true need to take care of panel topology.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  include/drm/drm_mipi_dsi.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > Do you have a single MIPI DSI device, or are there two independent MIPI
> > DSI devices? In the latter case, the flag is wrongly placed.
> 
> Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
> mipi device
> to notify host they are one of dual panels, so that horizontal
> configuration(width)
> in mipi host can be handled correctly. Where do you suggest to put this flag?
> Thanks!

Into the msm DSI structures. We already have several Qualcomm-specific
flags. I'm thinking from the 'generic device' point of view. The
'dual_panel' doesn't mean anything if the device has more than two DSI
hosts. You need to specify which hosts are mapped to L or R channels, etc.

-- 
With best wishes
Dmitry
