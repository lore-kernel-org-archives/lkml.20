Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009877;
	b=DzhsWFt7EvGoKem1UlUwXIsHP0HnBLEZHgJrLnA4/5qjfORyLMvuXG9Su/SBxzYhcxNr
	 X62sndkwtc1xn07qeBg223Lr9jEtS7k83kCkFYtFuPS3GSPJ6A+vgudW2+0bOEo0ZyLe3
	 PXmETCtowYwelg3ldOy6i1rtbUtb3nGiX67L84BZd52wdmxO05Lj3uit/4QtjQIdQJsAo
	 Mf+jvA9m7F2QsE03jFdLLk9n/nYkxCPhiP3TbnEE+oEj14UyWr1G6b5lZbZgdqQZCN9uA
	 uIlkaRPy/yieFbRQSdxYdd1U3CgDJ2M4HmMKbYTVivAWwF2jRZncGfSCO9ijO2gB+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
	b=LIpNzCaiCpav+eTvKublIQ2SBjwb/AGMtT1bVAYv4UMTD5hn09fCTxQUJBXx6nylt6Oq
	 kLv0ucF0orzb0evxvrcL68xlj/sn5gcqXbG4KCfptYYCiqNmJOTrcTEdAOqHPICqXo4te
	 q0dr0IIeCdkBFPoIUunMdxfPn+hbIpF9pRYaNRdTFrYprP1v/vrUyFwXfD7wDzg2A8z86
	 EdCBqBYxAWI0y5d5Kd/KiCoEULM4dzHQ0bqbjW1+HKj0OJ2EB6DtoJyMnCxn8SaGHw5Cp
	 e1knnggX4OBvv8Vm/kwrFPZ36ljcPN1iZElV9L3SL8FbCjq5JoWa/Yu3piADG9rBl6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSx13RSA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUBWnrJo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCF4606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSx13RSA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUBWnrJo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3qBp3521815
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78XFvnCPVHn0LabnIkSaSmfw
	7iCeIi7jK9513VDUmZ0=; b=dSx13RSAlAAD4EUSzR9AAOMLfIHAGtEyMLOfHTRS
	pN1Vr8xV5aPEqcZmnOE3vw7Xw9+63iVXiEiPsBrFbnxmiJwqMyMPdo/DqFUzAqr8
	RFjb/wlh3sKurhr2fnnUukWrR3BZhHqQ6XmUmStb8r82aNvCS/EiKDAI0q/nGBuc
	ZpksdOnmhTL6RGYy2D8KTRlt85jKkJcXOjJlVwUsZmrGJK03ka8ft6g80aQJRAlM
	H0Uquj7iyHtk8J6zPfdK47S6h2LwhINz8FAes8aYQWRTbDKcJDFZcoXeqZIbKY+c
	nhWGRw78uQYZcMREksvGT+NUr0ZnHfX7P86zYTo0o7/STA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf01nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:17:55 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0467c89so3775539e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009875; x=1793614675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
        b=KUBWnrJoZ2+GAYbUzhOAcOheUGlYn9ERCmfYzKVaG/djJbOSGTKbot0fg+EhlL64G6
         xwrBrq52sdWF3ywP7RtZ8ahYdYpRTDPtrPei4nSGC7bUimnOcLHwxB9Cawi6hExPoY60
         RwnkEqS/UySqXjg4bAb+OBqusISzDluS/hwavC/ShMdxgVLWrwV+/xcBaBWqKwNVSxmj
         ILhcnSsdX4fFS1nA8moprNbWegg4DUd93+Bu1PgGOCmyRM3H1MGCXACPGBhp4eJWvkt/
         XPOJdSgPg9Z1JEuuORk6zUMkJEGu/h3aoBMz7yICCsu1LdwTzIrfDek/6nTghXy+fiOr
         /ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009875; x=1793614675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
        b=AQvMDZZX88cKtFPiYL2gXL/fwCMmQl8XDHlRQhcx1wvHgM0SEppPJtNPPeK1+hki3i
         uelEuMvEmZOOW974fVZhTwl4DYJ8/RQuMvgQ/a3atoGGCqR9fTl2RSa78D6+MN9HQV5J
         kWkhJXYd8tLmDIReyjD4S1CkVqEWpepqqmGV4jBSHyN2MZTRYSzgQdPlLTdoH9owf/ay
         9CpzBIs7s5JbRRKib3bbWuuyMYSjGhGKNO3DiQ3MRYYuA42i6WnrKUsgUFO71FWZjLOp
         Pe+veCVfgu6NNywk2E7+6iUCHtYWYSH0f7GFq+tlOTMTflKCpUP+UlPiDSHzvUoseZ7k
         SWug==
X-Forwarded-Encrypted: i=1; AKwUvByoAw40suxK/4XtELI0ED6cQK5Q82hnZFTrNwXEmi+0JNJT2rIlNZ5wX7E4E9W2vf5h+aFI/0KoIMhgJCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHPcW6bzNfbHaq152MUzVSm0H7HGnXlwlWaT7cpKkCOdKPNSEe
	pIG+DHj3KmzNQLtYJAvAB4Z4uPrh0XGI4XaE++rSLADjWqCqkfHigTa9tbc+Qyih3mywreWr/FZ
	zBUHi+zm9p17cPJ/VBxmyxrRLUOPfSVdtHlTPqQSwGWZraMPoAWhy3whD78qdWbsfUGs=
X-Gm-Gg: AYBFou3C4Km4H/NA9QrALCRpQ3AE5myAi6mVV8u21PuXo0J8ayzoLnzvNxDK8/q7Yc4
	SwibjrS5A2ZblFwy6OCzzHlj8XAZ+jIPLYZHNBujE0KlECthWjceNlDfspS+Pw8Y9zrZFw6aAkm
	c8cXLuF109965Jit/i1hfovpvM0zrwcQy2o+qDtTktH8EFE4kO8Thre658+nPQPhe0W/caB8iBB
	pMH0HuFT4gxNmmsk+jLIMlawgHmBGR/qJptC4cRthIxsbRFAcp7pBy/jLAepj3dK0sgjnP7nbDG
	/bzE0sBk452sWrDcSNcFOpj2VsiQcC+jcNuUzRDBE5/mX8nYWC4kmgjpSCQP6lg1oKFFVADEWvS
	6IL19bfbCdRH1XTMsepduk34EIZ12vn8J5AeWmofijV3hVnBolI65dT1aBi9rsl2FAhOP/cWz6z
	UbqGlFIJzPyw7Y
X-Received: by 2002:a05:6122:130e:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ec23319c0amr2162221e0c.21.1793009874668;
        Mon, 26 Oct 2026 03:17:54 -0700 (PDT)
X-Received: by 2002:a05:6122:130e:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ec23319c0amr2162205e0c.21.1793009874219;
        Mon, 26 Oct 2026 03:17:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d0606sm17076351fa.14.2026.10.26.03.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:17:53 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:17:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 06/13] drm/msm/dcp: Add planes, CRTCs, and HFI event
 routing
Message-ID: <rdaviyavkytkblgqjqp334mtluji4t6ybron73wm3uv5hdbvjf@5uxq5hb4fclw>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-6-48aad0fe4f72@oss.qualcomm.com>
 <x2ppnksfdan6yehawencv53qttcxznr367iuaw3ltwttkoffkx@ccrzx7alvdpm>
 <7ea3f000-086c-49d2-8409-04d5aa6e9ded@oss.qualcomm.com>
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
In-Reply-To: <7ea3f000-086c-49d2-8409-04d5aa6e9ded@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXwvTlvshUhlpC
 4imMmablcCoG1/KAmGQGkxnwcW1emwPoyKzbZiCzUTXH7S3cxGjWFfzahkD6PZ2P8uxmBe0vHl+
 nfQCNmvuTFj7HplIEReCyUMCVSmNJv0=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf28d3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_9fECkkFWEdeBB18FusA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: eYvtY9SnuS-tnPCF74Hl1LLQr7bT41jZ
X-Proofpoint-ORIG-GUID: eYvtY9SnuS-tnPCF74Hl1LLQr7bT41jZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX3pprRkhbrsHw
 SLc8N98FzHVpotOVRxaYC6e0A+XK/G/sfRGf+0JXAhSV/W2GTHuSAo2ItvaT/WBpUS8OgH4j12H
 HaJBE4KyehSpBKh0w6p/Z1lb065BAdWt3HcHnNtCvpHL3tQMIysAohyUWhxiE/apbf5jspCtQrz
 unYlSTVUFl6PE5MxAW6JL0uDrk4a/ILZzycK4JQEWSW1F0YC0fErmDmLU0kzSovfnC1VF0sa4sc
 maZB0UFA4WyXbVeJLzN2ks1cWRLy34fN6EtkGKhLEhMZhx2sLc8H4QV3nCI6C/Zt+x50/Xz0elE
 DY/Bxu0A7xzB7HE9sZ0X8e+qDDlrYmMcYSW5K6DQU24a1RHNdx4Q2d35aVh5Tnih/LwBq2/PZoe
 6wc9DaHJhwHtjwTKtDHio/z5doPTmmgZoGqUOyjMpr2ly/xyqjPvo0PrxyvsmLMdu7lkl4AH9b9
 XRz6ogVN/h1kGfBgGvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On Fri, Oct 23, 2026 at 12:41:15PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:48, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:26PM +0530, Jayant Shekhar wrote:
> > > The firmware-owned DCP pipeline still needs normal DRM atomic objects and
> > > event handling so it can participate in the MSM DRM device.
> > > 
> > > Add DCP plane and CRTC objects, validate framebuffer and plane state,
> > > allocate firmware display pipes, calculate bandwidth and clock votes, and
> > > translate visible planes and CRTC state into HFI commands. Route VSYNC and
> > > frame-scan completion events back to DRM and retain CRTC-local display
> > > session state.
> > > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile           |    3 +
> > >   drivers/gpu/drm/msm/dcp/dcp_crtc.c     |  733 ++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_crtc.h     |  104 ++++
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c  |   27 +
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h  |   49 ++
> > >   drivers/gpu/drm/msm/dcp/dcp_hfi.h      |    2 +
> > >   drivers/gpu/drm/msm/dcp/dcp_hfi_core.c |   21 +
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.c    | 1073 ++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.h    |   60 ++
> > >   9 files changed, 2072 insertions(+)
> > > 

> > > *p++ = lid;
> > > +	for (i = 0; i < HFI_MAX_PLANES; i++)
> > > +		*p++ = lower_32_bits(iova[i]);
> > > +	for (i = 0; i < HFI_MAX_PLANES; i++)
> > > +		*p++ = upper_32_bits(iova[i]);
> > Who has invented this? Splitting addresses into two distinct arrays.
> > 
> 
> The field order is defined by the firmware HFI ABI, not chosen by the
> driver. struct hfi_plane_buff defines the wire layout as:
> 
> u32 addr_l[HFI_MAX_PLANES];
> u32 addr_h[HFI_MAX_PLANES];
> ..

can it be fixed before it is landed? If somebody made a strange decision
it doesn't mean that it can't be changed.


-- 
With best wishes
Dmitry
