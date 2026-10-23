Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798614;
	b=BImC8kzP/UvL4FQRvDkVTtLIBjPnqJIsoxfElRH6Y1eXDNNKDmAzuN3PuK0my8DDOfUj
	 CFVFNJsHS21h0ogvOwuhhis0qeBcAJInLzUIgbyLPUUhhJKZA/uLsU2FIsjmRV0MFzXdv
	 pCLZph2gI5KWuqVXHVSnZ6aKfVnj48bB45j3+9TM5+mnHV8qAgQyF+R6qmE7BzYBlWMqm
	 nvMUI0pC0ys5UfECNP2Y/a3Jkdb4X+hw9YXLKIDf/fn9NOShpuHR3rAEFOELYTiQ8b1qx
	 eaGQoimWJBZ9ARLcqXoUKFucV2gEAJpNbgaP6OWTzjLykUmvlsnPjPjMjrxslw5DxOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
	b=KIz6Cbg5h8qkfrqXscTUVRYSl+Wj/dDratoiglIvATypiFWkF9RAIKcz1LZlF/0PdzNV
	 ipl0Y0ak/iDAlgxgtEhAK9VSRPDxrxUDyeVNzAaSprvf4c9p5cXC00wTRRCkwNa+4NaUV
	 +oTdHrgKPCu6cEm2VhdmObqpusbTBw9HXT073VXzhjq5DHY168ZlWuYSUzIjz8vAMQ8ju
	 V6fuJzgjBVWjD2O08inqs/hNEMMAKT3cwBLFRJaVSp+X5GfxlPa+FZDT3B8ozGOo4JJIl
	 0eqJET1V+8651g0l9IwjC3adniWbdW9BlS0n3kc/YzgHKBR7pjNwTAqVzN7TZRBiV0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moYOHMFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4I47cja;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44D606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F44D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moYOHMFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4I47cja
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuxGt877197
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=; b=moYOHMFI/3MRcJDz
	ZA8WnN7yEfSkWsyYp8v9+QFucDkTCQC8SKcTMqg6RzdAtSjs3QzyZzQWJj0B/Ck0
	RUVQ95Vua/zwF3kcxhebMt86PgFMZy42QbaGG1wXhzJI9u5QVSOEYPxzcdwRGL5g
	v8e/Cwpg5r/HTWQirguGNfljG9bsB9eUsY068Ty7mtfFWZ0WCbFD0USBCprfm2Cv
	tP4D5MY2tkdIdOtYAMZUXZa5Di76LOUTGCgvyc8GSjD9Fx7Ln0TieTpXRURC96qg
	+UKV4UvxmqsF+PWNhqI2HT9ElC6Wn/6oWhECs9FABEYmXr70LNHco9j/K0M4FKGi
	fs/lwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr68wab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:36:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so150120285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792798612; x=1793403412; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
        b=c4I47cjap9cm8QKDpMAe44buBkGC0RmgyOJxfnqJy/P6NQTR/NvdfBXC/UZbiCcVcZ
         cswdAQ23gXOMs4spvSMdjP8zz9BOh2+lfHs9l+5XwjzP5i5RHXwWmTPrjO/KUMsSfrLK
         dzPzXNDcNheRRG9P+kcdjK6ymP2xmlyoYvEzIwRU3pxT4gadeAobSGFRsSS0sMX/N1ph
         ojyKlvK1f7jiWEPkfzAx+yDCyWjBvotgmoZihZVmDNSndiCZypAw4OapBMiRa9ksjGNi
         5N7w70Og+N+PSEUcUWRbUtmyvWHD0vj/sAJexDvWT+oX3aQTt47yPwl6wbx1Z0x+cBc4
         yPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798612; x=1793403412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
        b=Uo1nCybbxSEvhX6eZTjbZWGf4rNq1yd7kIZMwQ3J3kkL1uHjmJmzxxAxZSn8FmfwJz
         X/i3kBJz6fuc8LSyJqZcoRwsmazpH6S15VJ5hLBu/PrIEjmfSF5ftON5B9f5F7NVNv8O
         33WuYowZXMTDpcdaCXtcKtTFVX5DNm8P8qffRkkZi11VP3bpdWOfinC5bF8uDOkZgEul
         gVHVD45ZTMsB4Gt8vLHdL//S+6FxtbR+kaxi2jCyYhD3vZH9tu4uAURNKYyLPKIsw6Cj
         YPTT1OT7bXBrSjJ2rS23nJd2auzamu/Vl5WVAy6OJvDDW6zMWfk/KsGQqczsxCKeZsMR
         7kWw==
X-Forwarded-Encrypted: i=1; AKwUvBwUrftXaQ3Tutd9bSc0pELSmZjnb1NWhFM+KeJXsxiM4mTIHrfKYMba6lkEPatywUobYDQ9fLu6ffF3z5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Q149wgclwScS4WAZ7UM4cU+oEY+jveSeVtTqbsHQU7Z+9Bnp
	kV0i6cygDE91JSPwx92SqMPz41Nk0acYeq1ofDVM6o+wTgVXRW5VPoOzpiKTnWy8bat5aMW0U/r
	RQlACXalytCs5u48DXBfuB3KDuFFNRQcbz409If2bgInVgbGLXQJrP3aJxkb0Nc6gwJU=
X-Gm-Gg: AYBFou3YlUeAVtmUsKEfpTzFBElKpT4o/1tNoxCtBpvnnF+2CQ53SDr5zeh93Q8QpOK
	RbO0N4ZAPvJIp5lna6b9eAPPgUNeiHC92wr1ZablIWtkbrQQyOedt60CEA8Y4DuxF61qjyxVsrs
	ZgGxC5EE0nrS5ConoDAHyt23RMSOWM/woEj1HtZyal50PBj+t8SXGoFiOSL3va3HJkmFMqv8W56
	WCoLvxXYuY2U+lLPDObLnXxwLWY8RNOpnssVCgkaiE2CusNVsGXpYzylwBHvywQPaeoZy8I08A/
	iPKQVtJhVrDsir5e+6jD+DpH2WD98vQe1Pr2HX41NgD5udp/BH/Hf5mfeZ7lir8zPsViWBDxCFl
	5xUi5eb9cBitFEg8Qv6Xh8gfMw3A1R40lMOq6Tr6MuQH3Tq+vxvwnkaOQDJODcLN77sg/eHRrmV
	EGzExbq0Su/sKp
X-Received: by 2002:a05:620a:370b:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-940ef938f5fmr84045985a.31.1792798611980;
        Fri, 23 Oct 2026 16:36:51 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-940ef938f5fmr84041285a.31.1792798611386;
        Fri, 23 Oct 2026 16:36:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6b051sm67463e87.14.2026.10.23.16.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:36:49 -0700 (PDT)
Date: Sat, 24 Oct 2026 02:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6adbef95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=s7fkfekX88plzggl2-cA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfX4UgmLVXyF/KP
 aqqdnFJUjqou8aBAuYYhTDF1sPAt293sreIqy8HoKuiDaWepen8VM5y2qp8jYezRlB35NgzX04P
 nDoyYjoARns1iiZqfa/w0OzJ+fGKf2L976chHvUDmoZabxU+pHEe7YVw1zcxgtOeOcc0VHVR2Am
 EyCFnwWqIIxS3FqKF5hSU9U8NG6SucUEDkeQ7sqAfRlKItZMTaFNbc9UztD7P3PxMHefkXsV+5C
 s0G1IXkznfnu6QTrmpb1FM/C5iKERFOXCmT5pUyHmpUTfSi+5iDzqrtUGDiyfMHheyPPTUi2dd4
 ZvJAPFZqgRgppq5Y75mqTCwVzayeUrS6gWH3yekNWk9pJKpT9E1gToBX3sIBmH5nxZ1xK1/ngad
 48TAMFlfIzB7tEZPhEQvRqvJe8yfM42fgE9gD77A9eovsTKwIgougm4hIMLyHv/lzmuXZGAM3kx
 j6L84UDlssCg1wmVXOw==
X-Proofpoint-ORIG-GUID: hcKE3A2-8rQWvOOfWXVr2Y5ttt-nmI5t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfXwc01GkCu3P8Z
 U7rvsMVSSW3elKmvGwuYiXYOovn59ZZAJQtKSstFmlHHPrLi59/sedU7pC2LSoKwWtxlz5wYc+V
 TmGHehB9IRWbFOlKP375De+i635kjQQ=
X-Proofpoint-GUID: hcKE3A2-8rQWvOOfWXVr2Y5ttt-nmI5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230093

On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:
> 
> 
> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
> > On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
> >>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> >>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> >>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> >>>>>>>> In order to associate the SID used by LPAC to it's own domain and
> >>>>>>>> context bank we need a separate node on the DTS.
> >>>>>>> Can we use iommu-map instead of adding a new device using the same
> >>>>>>> addresses? You provide zero explanations, but it seems like you are
> >>>>>>> trying to separate a part of the GPU into a separate device, but it's
> >>>>>>> unnecessary.
> >>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
> >>>>>> context banks.
> >>>>>>
> >>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
> >>>>>> provides no way of doing this.
> >>>>>>
> >>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> >>>>>> and secure.
> >>>>>>
> >>>>>> The address on the lpac device doesn't really matter. I have very limted
> >>>>>> knowledge of DTSs but I think we could just leave it out altogether?
> >>>>> I think, you were poined to the Glymur Iris patches. Another option is
> >>>>> the QDA driver being submitted too. Both ot them use iommu-map to
> >>>>> describe the same usecase - a set of SIDs which are used by the device
> >>>>> but which should not be a part of the defaut set. With it in place you
> >>>>> don't need to have separate qcom,lpac devices, no additional properties,
> >>>>> etc.
> >>>>>
> >>>>> I'd recommend following the same approach.
> >>>> iiuc, the conclusion in this recent thread is to use child nodes for a
> >>>> similar case:
> >>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
> >>> Let me check internally.
> >> After a brief discussion: it can be either, depending on what suites
> >> better (and if you can persuade DMA / IOMMU maintainers to let one extra
> >> bus or not).
> >>
> > One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.

The rule is the opposite: new kernels must continue to work with the old
DTs. If the new DT breaks with the older kernel, just specify it in the
cover letter so that Bjorn doesn't merge DT changes before the driver
changes find the way into his tree.

> > 
> 
> + Bjorn/Konrad
> 
> Not sure how strict is the requirement for compatibility with older kernel version. An
> option in your case could be just do an override in the board dts file of the
> Steam Frame.

Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
only used by the LPAC?

> 
> -Akhil.
> 
> > Not sure how to address this.
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
