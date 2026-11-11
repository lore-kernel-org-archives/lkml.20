Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400661;
	b=QyxAtqMKmPerg59zi1kjPSW0awpATk+N0ZUvSY+3KxS9X30c1VPk+G9VBp7qx0DWK0fi
	 IMg975b1Eynnwlr8d5M67qjRuXbXMTF+Q2p4iPZEwcHpYHCamFcj4KZ4xXVSXaerBSzqw
	 780d80niuYSZoBrdtGCsIM9vgk7+OT3bbXnDlGHdl81mBAvvIdekAKrL3NYetuklruXvS
	 +0h5oVzDq/wdKg0JeploR6ZI3kEvSDil/82H+YqKklK9Ep9eKlo77/BUZtyHbRCtsAxsM
	 nA68QCWaduH28OXPDpp9aRL3AOWgP/NvAuyjs4PYm0Td3WwkJfZD0B5APsCpZkEL1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j7Eov7QCrd5XGLBKc9xY69NQW70wVEQfOB1xyPudY0M=;
	b=cUHX8eYYbr4hPqu13Nrpbw6g6yV61BKh5m8AJFZDkyT+UsJEVcxzRft+HUw/YWenCyUO
	 J0vh3T7eyFgvf+usRvZ8VhkExGTQb3N7xkWzC3HcauvOmZnTtdwZIl4XHszGe0saSdCLT
	 4ygLCaroBB8rM7UDaJ3+auKhVIrdgM/nVki3rJm1b0Eux6TOo+mVD15le6MId91TBbyG/
	 A+PowLhmEDLnOKXcWzlV94pRVPh96QQIiRFckWrbEt5H3ua1+TDML5m+cia/VdYaGfmaD
	 b2774TJ2hymW+usW+KdUC4GZxnGZM9hgn5y3rx8U4QGlNdd8276G3w7B6D1FQ6xdSGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFHZ8li5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgrUyAIS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513E4606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFHZ8li5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgrUyAIS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZRSr1250819
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7Eov7QCrd5XGLBKc9xY69NQ
	W70wVEQfOB1xyPudY0M=; b=YFHZ8li5L4X9140/AZUrRCb8X38ZctH0/QEhSMvb
	7ODW3rWz/hQ/Km2Q4gsTNJ7uW09FggFfhpmYZiOP74/jEgDG7+sbYk9Ryp8CleEj
	O4hehlMqkEs8irOFwd8egTprRksuaWKMIA0T3Cf4x1izcl4zpPPaDKhauHG2lxbu
	opDD9nQtEIHel1L5PsM92NBt+Fitt/2aZ5msIfevKiZoUFVbOvRZL8WSzz2HQgTY
	4+qgE+TTY1ESp1wwL8qAF6L+GverVjB8WBxTZJyZvog5u4fgvfxdJSqBVfdOs5Vw
	eTzBwhzaHrWyg2w6Xpq08VyEDHRT52LXsjOPipJ20KKRDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5ma0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:37:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea39a2f8eso56597176d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400659; x=1795005459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7Eov7QCrd5XGLBKc9xY69NQW70wVEQfOB1xyPudY0M=;
        b=dgrUyAIS+s5bhugUUZVftZZuyKjZi1+D64e9/b752BoXcQ1In9TH1n68EpfPyHrlFT
         ShvcL4AXDtAEdV3Yyo/KYLk5SOGZYnVRfn9Rs0BhsgnBNZJGJVhyw3hPKYzKZ2UgVHH/
         pQ3jxqHA/zFbny+cBgtqxTLNrzY2inkcyWPq0Mm6isUkK/teS8gyw7ecydtXlPQ51YEb
         dB9Dz3tk9Ddj5WqmJ0x0S5Shj10mb5AlRZqG0fstOfbugj5C7DTCDziNzqrZ5w/zZc87
         LZcN/ndl9hgXceZO6wlJRtarX3MKs2be8w+ZkL1hvsWblQzahyotSBJSEV0HwNtxXuSD
         lhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400659; x=1795005459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7Eov7QCrd5XGLBKc9xY69NQW70wVEQfOB1xyPudY0M=;
        b=KBImKZxrLeB3jFB2O+M3r5Yy3lpXI3wdDZcEzjn86So4crRXyQ5rILJrdRnyJ55OrM
         0WyFbn8zxf+7a/8D/1MoCXf2+SNk7qDCzTps5nzjlgNpS+8r3c1mZ6GgaQDUxkxgHPmS
         teSVYTK9EbtzAdJ3bE1/P4GxzBB+saIYYJu+hpyKlGtdwIuMxFqD7UyVQkriOCpjoPmZ
         MyczJUmHAzj4G4QpRHTQOlAd84D732OlwtbwC/K7dqeXIyPdo3QC16zen2CLq/jhZnfQ
         Nj2PRCICuf/V74uTWH1WrX7hnOXKjc9/PjgKgjYcuv2+YnlO/hCJgJuMMWyH2Q2Ar8bk
         zP3Q==
X-Forwarded-Encrypted: i=1; AL+hErGEu5M6vhkiS02okLXsFRrnroUBHhyPDkt2fpBAbq+CE+3JB9v67UGqS1mvsHZq9Nk+BizM4XoE2Khelyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0WB52Lc5JAsbyXAEzzGghcRsGISecjHiwVXiv7BsSjgw/QLqU
	ej+Nt83cwwpNYABep3ur37Eo4dqV+YeF+LvvmxYAKuZA//Iyu0dJyVDrPgqjujga8wlVUhi1grQ
	o16kks+DcIGX2w3sL/EV+c8bbvqnFDYF/Ava9Hh/kvxLOa+wtAw8Q4rifM56f8PduLjQ=
X-Gm-Gg: AYBFou2frgZsUBdjf8WAQ80+JrnEj59YV4EI1N1ehDBH2z4/A2AcVwqkFHVhoMVvQXu
	nwZJdV8D8iIbC7VRI+nkLEHS5JKypSkUuxiZOixiDPmT3pvMcCp1NeN0+sY3saL3USNtQWxsOqi
	5BMoQSJweHvhz/h08ixvDBElRjJIiUrBhUXHSTXaMq0KoYHKVshHOHe0uBQitC9mqlYaoEtTI1w
	M5v1or+EChlrMfNkbTcFwzpxZM0p2OfFsa/jHhRN9IXYIiVVyYIYqn3a8HfufHJEmbVP8/tt62I
	WWGSyq32YzX/GMvgA/yedSaQhwtMIRVXPHkjOiw5ZX/JyKaNDHQx7wCJTCN8jkSDfvHJVhnME1j
	/06siUjEOz/DST/Lm2UV0cFuLh0pCGA1idN8GH6miwqmNYjPObY0zFA1p9dSEt0UwFSRaBjdkdV
	N40PqOf6u7jPHH3rb8cN60Og7EnfZqrBq8MKjs2DmbeLWsO1iwrOD3FOgjC+sS7w==
X-Received: by 2002:a05:6214:20eb:b0:91c:63a1:1432 with SMTP id 6a1803df08f44-91f03e0068dmr39814936d6.6.1794400659391;
        Wed, 11 Nov 2026 04:37:39 -0800 (PST)
X-Received: by 2002:a05:6214:20eb:b0:91c:63a1:1432 with SMTP id 6a1803df08f44-91f03e0068dmr39814136d6.6.1794400658706;
        Wed, 11 Nov 2026 04:37:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0928bd0asm10461021fa.36.2026.11.11.04.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:37:37 -0800 (PST)
Date: Wed, 11 Nov 2026 14:37:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
Message-ID: <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
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
In-Reply-To: <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX64Fq1o5pj28X
 ztSErEHB1WshxP3djn2LLioeE/1OobSIKDIatUqp1SQlgeT03YQSWOyRlqEbdAgpnwJlZ3axzza
 byGoGl0WYWsAVgCcgnOcshwkzKYJ2wxwzQ53SGO9NnG0CfrJy0kQas2l69hVCYbXbEZaxRqRh2d
 FaBs3dinMUIp1jO+vJ29fXUAXyTpZgM/Nc5DtcEB1LxJIM9N1VcYcOHKnyeqltdhs7Ubb4/zKkd
 zf9GVzOXhv36T+5vNdD/jvGNhIlh9EqwfHNEWF7kPdDuJ4jHZJkBZuPNe/jsaYC2ty5FiiM5c9k
 DWdmx0yREo6gal60faBkjUFxd5XtSyY20OL26if11Xyy6brGuGKhBdzMOkwNx0Vhf3H7Ak7YU80
 YB0WNFO9qqMq90Zj10XSTf5PMujsVOhdJtz1131SFV2KfzALK9M+jTk/AcfZ4B+Z7RUuX2s2ou8
 DGZHkyXy+bk/9tW5Ugw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX3A3qAJK0Nnm5
 dITmm6sZ+5a3gD/0f5n2/NcKCgl4azZKjLq4b9M6GGlCj2grOZc15mccCxDIKLwmEwtdvblT6na
 v4gDgaN+n7POVN3i0kwwINNAqJXEE+w=
X-Proofpoint-ORIG-GUID: coIcJCek5tmcRd36mpiqg64u-4_UFIzL
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af46194 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1dMmzAFpFYDdDQwHOzYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: coIcJCek5tmcRd36mpiqg64u-4_UFIzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Wed, Nov 11, 2026 at 01:31:39PM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
> > On 11/11/2026 12:13, Maxime Ripard wrote:
> >> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
> >>> DSI panels can be placed under DSI bus directly and many Linux DRM
> >>> drivers will work fine with it: mipi_dsi_host_register() adds device for
> >>> such panel and DRM driver does not use OF graph to configure lanes.
> >>
> >> That's not true. We do use the endpoints to configure the lanes through
> >> the data-lanes property. See drm_of_get_data_lanes*
> > 
> > Some drivers use endpoints, some not. As discussed on other thread,
> > there are more than which do not.
> 
> "there are more than one which do not."

Which means that those should be fixed. We have legacy cases where the
drivers assumed that, but we should not target legacy.

> 
> > 
> >>
> >>> The affected here Linux panel drivers do not use OF graph, either.
> >>>
> >>> Requiring graph port for such panels is tying the binding to one
> >>> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> >>> requires the port.  The port is not needed for the hardware to operate
> >>> and for some of the Linux drivers, so it should be optional.
> >>>
> >>> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> DSI busses can handle multiple devices, and multiple data types. If we
> >> were to drop the port node, how does the upstream video device know
> >> which device it should send its video output to?
> >>
> > 
> > We do not drop the port node, who suggested that?
> > 
> > You do get, that we are not talking about the DSI host, but the panel?

The panel might be driven by the host directly or there can be other
chips on the bus (someboby has been asking about the retimer or
something else sitting on the DSI bus between the host and the panel).

-- 
With best wishes
Dmitry
