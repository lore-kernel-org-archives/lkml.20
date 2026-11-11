Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406391;
	b=tJ+oWG1xt/WK741yyxOB2WnnQJzexI9JQzKjRpjITEym6FIVxP+1VtNza/PB6UZLEbe/
	 Pc2u8PERxOuI155YMNRG3n8NQ5wBY8TUSsan/Uz5qq6q0T3EKnUVlJ5CYZ1FRA02GEhhm
	 nVzwOikiF7f+6Wtp++Irkl6qHRBAJMbZZ8o+0AMuoyzD8AmzF+PGcCjnetxSFrurZ2trp
	 HO8oBHf9HbwVEt2QeiUd/kMQyv64kGk0VoftueYUGIyKouHv33+4HiOW9DwTAW3ev1MB6
	 VWv+rz8xLPtkWGVDEhhFHk+D281RgcRFSMs1lI9H1xw8EBiAuoLoVKc3pD/b07Dg7qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
	b=zYRAMvnsVUgx7jn4/iqHWQ8C907MZ7WBQ1eTq11UN4EU3zh+JriltAGaDOLYoIPXqrOl
	 1T6LPjNjER6qW5aSfRnycVN+lMzrbnAwCFpUvBJ/suZGbgedyVrDpOwwaGKd9QbPza1HN
	 KTKVDsYfqMzPaw31+fuDG2bOItPbCgkTUeW+DEN9+AUpkJUxAGk8QK3SpjaIED7Dyf3Gt
	 SEfQq05u94fn8wYBxC9CHkwhqGZNwa/SJ0yyPQbB+VqdPEWHNG+317Iluj4rwDPT75T0E
	 05GwGiVncS9kOlfKIqX5ZQbmCHeAJ6XZTjh/khoGSqVGaVL2Cd91qovEEGv3r4SBvZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ZCbj/bq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D66606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D66606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCbj/bq/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ8SU2338385
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=llfh8etuwqMEBoatS7BG9atT
	A4vpv1pJNPCbkPuzpyI=; b=ZCbj/bq/7etR5mduMsXYp0jpAwQ/AZdMzdYdASci
	VmMJONZ+iJEIUbANBiDjtZphcWabwse7wGo9h645cixX6XcXKZ/uGGfPLJ4JCERB
	e8I7/d5uvjtX6Fw9P/v8ncTMUJg6MECCmrpbVV9qB8RiuOe8CAEq5tV0DSgzvrXS
	ey5Gg1BPNsa8KT+NcxPxPlnh+AJcYxc7TyWgZXzrM+P5SfYUHqybWuG1ftpAHVZW
	5w25MerOy+XYX+KP/GioZbvtfeBkosizv8g9POZL/G7BWgPNt+jueA+IlNyGQM38
	I9qm7lpjucG7INeL2Za54FsOjajj4386I+7u307pJIeOXw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmayq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99c3b473613so27857241.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406389; x=1795011189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=WTD4xvlimwMrg0z+1mJjTCXHFIUaicF2Qp7y0bhilWeVCOAyP4dGnKk1LjpvQEqb0K
         mKGyLWJY+McuA8+6xUgewkZsD80mnA8jX5OMvBY1LDF5Z6TH53K9v4fnUGdnyZnbBKhf
         dRfafsWkFDBJ9TlhzuRfcudpB7IBDdsZ6/ZGWUiS3Ht7HL9KA/SBfTmCpZBSL1CP7iSS
         G1WoO1o3qrPDToUWad/WpmUKlL4mvBg3dVizS+fH1eguutNuO0rlwJ2hiEuc3Y7hoF03
         T2n31CpVHeQiTKGr0IYARsxSQIDwqSLKDXLmdUVG43AyE/EmSZZxmv1eJ7azpoGy64QL
         vtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406389; x=1795011189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=neJlssWbyzKGaBA9EnkPEKhpfl5hd6DjVCvb5ja66xOmyE9YnW36R7ImJ1+f8nVPzX
         n1fBr3nuiMA3ziZ+KYTMu88t5WBcVmgMSnAqYp5QGNoOPXUk1pDrKVirky2Fv4H/BZGl
         BXCy+Z8NkEQ/iwgUl0rm6gezxmPekrQ8qf31UlwvX2QStilsXPjfQeFMGc+4OYoz7Ns7
         0VbYNfiSfDm6OONewe8cwyu8ZB0cha93pnRWWALNh+mZTRUqCdZ/74euqJbU/Fn1pEdn
         bNSdhBFr1DfP669a+VGnyIRPBmiC19Znm7WyT2DlOjhvXON6bDRBbQd4NEniUiC6ZZjW
         +HnQ==
X-Forwarded-Encrypted: i=1; AL+hErEp/YRBAuJD22FyQ5yEMHik0/kdO8hy3SMwuI3sFmKxRHkRdEtKnrSbeG0fQbRcJ3l6NMKyKH54SRP51J4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AcLp8k4Yzf+VrDX1EXFhK0HpCNm+T+YelJS90E8gvtW6kkMth
	RAXzLGc6Ik59LFdOgZiXM4veHroZR0an+hRqX91hrzSP/7H7XCkGQ6xGSR4Cz9Ppy59gBRK9aWD
	5RLO0sryQJmSAnxOZIHfdVJHt2LOuAY1lIwYIWcue2Kp62dq0Rm1ffoOT+Y39IAkm4Es=
X-Gm-Gg: AYBFou2daA2WMRjbMiLuMnsP/1Q03mKnUFIomdP1cT2xxGNIi5tyJ4jCh1b8+DahPO+
	FRKeGHDniFnZ98G3CI4AVC7lFDqDtK0cGQtWcmbHKUehm5rvc+gmL3UqQwx6mlJ24gCGrSxuHhW
	spoOzUIGNAl86NE9v5EuGzo5bruuff2to/M49JkDTmto1mSx6cm77E82QKlF/VgqgvTmjpQsuyZ
	485CzG3Z7XKk1L5J1OUCfra1MqZiAqU0u6SKt4mqXqwWgzRKXszim0X68Kc/oZ57tIHGX4Uu+HY
	htnjXqZnBFGDzCdTQRzesorlqW8PjQBNHcRXPv2WxQ9JxQyhkjTfo1TPk34W9Dt9OOgZ2MdLNBd
	ubhpJuchIXe4XK6phj3BmrPzo8ZmKxNml0JOYRThqTNdA8gHsNiMfc6XA7wh5SLSLm9NQSyuZ2n
	Vqq3YGSstd8G3pzGkAzn4aeTElvHKR75JRoKN5gkJ2NApScw6iblg+K5VqkKHfSg==
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791603e0c.16.1794406388910;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791529e0c.16.1794406388144;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7839sm956114e87.74.2026.11.11.06.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:13:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
Message-ID: <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
 <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
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
In-Reply-To: <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -kRSEEYm-K0eQ6cDC8D0vAo1QS3kZkCV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX1ntx3foQWMVm
 d4oPVLEOrHzHbCv1IZYKrKNEmaDuEdkSsywm71dMfC3mc2Kr+8RsSPocgZ+yHVGHF5iEhZAKlsx
 rJ3lNrJbyOWRYdp80nTvkCLT5S/Ea9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX8+8ZvnkxISJv
 WcP+Jg40x09sO2W1oudGwUPoqMEAsiy0sCdGnTonJ7KRNXwJpIwtwr0am3cClhCEbbQk0CfXMnR
 5SvVgZjeoBMlja0LiTI2GsHBwLM51RT6HVxBikrVL5S+id0y684M14CkY6svCohssuy2p7Qv+a2
 +tl/5hJRevYw9u5tMCQeGOUOm5iHqQ2YAFbvCP013ju4d+5wKCqfEtj0xjEU/yP/5l0NrkYq1+z
 IGbxBzHfhcV4tG82uC0Dayye37SzziTHBmXUhU57E6W9BmohFYjfdcPG8m93cY52f/+eB0HfsFR
 6eD/XcP2tELHBScAq9PqL+6tVp02/G/I2dtF+9Nd8wc7W9Sk24WOshMLNcPnLwKcBp3KkxNPLBp
 CTgBKknjA3jASbubz6ZK8T9mm9UWZXnEZJr+FD1PjBImfbd9w2Wdst0mxexj+PPbkBDhtuC0qhI
 wSf5H5J2WEuPkurmqYA==
X-Proofpoint-GUID: -kRSEEYm-K0eQ6cDC8D0vAo1QS3kZkCV
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af477f5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=XCsYekLr3cgse1I9aysA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 12:38:54PM +0530, Jayant Shekhar wrote:
> 
> On 26-10-2026 15:27, Dmitry Baryshkov wrote:
> > On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
> > > DCP platforms place the display pipeline under firmware control, so Linux
> > > cannot discover display resources through direct register access. The DRM
> > > driver therefore needs device-tree descriptions of the Qualcomm transport
> > > wrapper, display topology, IOMMU contexts, and panel connections.
> > > 
> > > Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
> > > subsystem. Document the IPCC power-notify resources, transport and
> > > framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
> > > DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
> > > after the IPCC power-notify sequence has completed.
> > > 
> > > Assisted-by: LLM
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
> > >   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
> > >   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
> > >   3 files changed, 334 insertions(+)
> > > 



> > > +
> > > +patternProperties:
> > > +  "^dsi@[0-9a-f]+$":
> > > +    $ref: qcom,dcp-dsi.yaml#
> > When adding DP support, would you add more devices at the same level? If
> > so, we risk getting a warning about multiple devices using the same
> > address.
> > 
> 
> Is it good to model each firmware INTF as a single interface@N node carrying
> the INTF reg, with the protocol-specific DSI or DP description nested
> beneath it?
> The driver can then obtain the INTF index from the common parent, avoiding
> duplicate addresses across protocol types.

Yes, it might be good, but it's not what is happening here. You are
adding dsi@0, although, I guess, INTF is 1.

> > > 

-- 
With best wishes
Dmitry
