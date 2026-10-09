Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73D3D34B3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534559; cv=none; b=etg1S7BNR0gVv0+4LKTW7YeGoHLZzU69dQOLXRE/f7DeEvk0muXBEMB1SWa7WgDO5J9OOpOSUwKLnxdC2HQuGRHo080cb6j2si52DjU+4u1QIxplRh25C0pgENlDKXZAZDsRUmHYEaq8/8xyihdIph73ZBq4Zb0+TydF7lciIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534559; c=relaxed/simple;
	bh=/SOBR0Ps2BnUTRiVud7w3FAIdcUaSqQ8Mu+izs62k5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hwggr4I/R3EFp5iZpy8IlupGp1jVbNsdL5Y/lD06uRe3GwZLqHVr62y1cUgMb4uIK4888a0X+N0Uym1nKs6RliVxVrXpbTS4KQub2U9bCo5lQNBXd8wlROEZvsaHCWz4B6dzXRon8/Ok52y/71KBXn5570ZhR/QNfyvaIuMmPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwbGWNR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7fWI+y3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwbGWNR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7fWI+y3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KK9e2369583
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 08:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXGhk/a8780ZR6oMz9Rsju0v
	1tiLizXrFKOLc8mUmHM=; b=ZwbGWNR6D867cmEY0fujoxLXXXMdO9GZAdrDv8/+
	e0SNERucHwLT383fDLSthPXNF1KAzFyvNhpQJhUBAHsaS1eGMckECBE7r894XQQk
	Hf8rFodpCNW3gHgJDjdoNX1LSzr3ij1M30w0HEd85UsXcuScuTVqri5o+TBEZumM
	9PtTghEn+2LgCbzKbix7XtgLs3CLFmBWNbsGZfOHxaRcTJghYulP70xg88KJRKQg
	riZl51lXyfJoHW12Jk9lZkgES4oFXNX2aq5hxnlCE/3hCvN7N15IEZlNVSAWJNH4
	Xci8lMxRItpQyQ+eog1RXbPullYLbdbfnT93pQ2GRngLww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwapft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:29:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-914321eb48eso96291456d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534556; x=1792139356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXGhk/a8780ZR6oMz9Rsju0v1tiLizXrFKOLc8mUmHM=;
        b=D7fWI+y3/fIqxduMitPaHyEEUGN83TeEZ4QwiaDixyf9Sgse5saZwmtGBYbk1CejPm
         HwSl/+3Mz0uRTGycvRTuXqzct9f6AB3OCaAM35f9aQjL//dbwqNWGAaKHdj53tYzilAH
         mjCrPPSfOZPlsXDy/Zed+whH03bQ1sX9qijt1MKdlzPR9Mz65gTFHEYRUXotMoYzciYA
         M4JNgReGHFimsX4gU8dlD1408G0yIw1xX+FcU20FHw/UdiRdabUdv56jrUsLUpvjHjSg
         TWEEtmvdB7BEAUnh+81pq05PFMiIrsnsX0YBxkfWa70BHuJuOnqUEFq+13S9s3Lp5ImL
         REVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534556; x=1792139356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXGhk/a8780ZR6oMz9Rsju0v1tiLizXrFKOLc8mUmHM=;
        b=S2O574Q7QngA97urDZj1MRGA2HeR5S4QERdYw6AlK97TpTNeGLyBUsLmvAl3Ny6SfH
         43LdGH0It00AG4/NaG3ojv6mCPBGAOTVyhasjgLbt9iB3ILsqLAaMGlbZmkJx9INNSOs
         ZtqVtW2yRWosUycAGkYd2EEQ7usjcqR+hEAkquyhfauWdy9iuyFA0QK5owk5WKBBqKEx
         Qx237aOjR3dLeUJOUkMHQhbXyUYqfNqSgESRVpA8/6ufinV8KbUZ+kTCFFUjL7ronLGq
         DpHhZgfgDxnTGNftSfWQa7NmrcqioXzvJUHLRFh2LRJSB1CX5gjQGzXsKUYQDlsImNik
         7NYw==
X-Forwarded-Encrypted: i=1; AKwUvBzI9tFMG1mfChlT7ugyKx+lXw1SURXvpeI12uEn14fJvoNSmsNMXw8BBXggV9Qj2JXU+vZb8fNhKgUJvFU=@vger.kernel.org
X-Gm-Message-State: AFuF++lC5u9PBS3EbZNNrUhpEMjzoaNv3W0jpg5gccs5ynQ6C2c9ZG0y
	ky90AdcowAuBqtlSNzJboeyzlXabZBLRHfvep352WbLeOCZ4mIa8hw7qabNZYDD+WDp0fpswpy7
	EJ1G6rsvrvD63t2DEMJYfnWLtitm2USuqr6VB9jlKP0WHENntIdiAxYLhpq1910tzzxg=
X-Gm-Gg: AYBFou3bWRDbAZCpAhJUcwtFAkIgRTUkpt7wRczbnzgBU9pEq2mC+yoZt3eWnyxMCX/
	80CGwQFJAwYrzes9GjQI4Nyi914qVqX1CRyNocmwF93S73sYEkqiqFHqsSYt90R+9MQ+Tuud/uM
	viUc0swI5E9jgQS0fKRn1dYx2Uj1RzVKcSrjaONVz9ewoG7mrZG0nwTlGweJxd/K8fVHRzwSrZX
	YsIFF6wZ5R+LJX3lHA03icKFx9FbRnM+y32RHCvfWkx+D1g6HMFM63Qx6MIHvbFQWavhZ9Hc6RM
	bWzKmPOk9/67DYxeQTJ3C6gU6tpECyALNzKTbean1R9Li/4fwRMyhnpWjs0Q3+HeaFdpW97p5VH
	GWYauKjXoBM+DbHXy8USjr5hiTxrTKdj8vqDP7wrSTzwUbaF+xNNifYWW1MrO4N4RRsBaNcV96U
	GG9p9kZdURJ5iy
X-Received: by 2002:a05:620a:2985:b0:93c:9d56:a860 with SMTP id af79cd13be357-93ebd228f3dmr162556185a.19.1791534555557;
        Fri, 09 Oct 2026 01:29:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93c:9d56:a860 with SMTP id af79cd13be357-93ebd228f3dmr162546085a.19.1791534554149;
        Fri, 09 Oct 2026 01:29:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde9bde3sm435232e87.42.2026.10.09.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:29:12 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:29:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dp: Add DisplayPort controller for Kaanapali
Message-ID: <ayqjh5syjbnayfu7wp647tclaer6vd3jbtfuoj32tlpqjyhfal@2uh543ydchm3>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX0frXSWawoWIQ
 S5gFAZeNDiZbUaGruWxw6OWoGl3MH74n3yp7q2oCG8fNkPDQF+Ew/dBMF6O5m+RFOts7EY4SMzM
 3behNLbx3A7jvQCT4dSR33GKbdBu8QoJ60c1yS+QPuPwNWbS9PTup+kQMB7D/ae7Z659l3Qs7hx
 2N5Y9mZTwKzAO/85lB5oqd5392CRMoNd0j+9XBVirHc+5NiyZygBy9LrYP+gtLTGLfExQvqF02r
 cwf2miUbcSx4NL/e8Bb8OZ+a4JuF+oz2vhXNVSP7qebdvTvhLfoKjjDI9A00UXQt3K7dBKnRDQl
 2hjbJt0cCeQJF3nyG0qGKJVMQFhXy/UL3nIF2KTLPCv7uJIvMFhWMbHZlSqoROUTFMm207r9jqt
 vjg+zQBG75KHFgY55meczj7NYxXkYfbAZg642GBbt9FU1riUpdBFtTBM/HadtTHXDHqq+FKytut
 V71CaUE/XClVqeAqZnQ==
X-Proofpoint-GUID: HOek-RxQK0B2FNU1DY73p-pjz16F9iFB
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8a5dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OHVtJ8ySOF6wsxM0GN0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX4fiyTLlHDtnC
 LSYjfThAhGMdviYJIfgTtzIX4Hamoub06AlUdSPvZAjjLzAW2CbAoUnYGIRVCUW28hapT1zMrKG
 qu9gb57i/1rA+Tj69lCpfThEc3or8e4=
X-Proofpoint-ORIG-GUID: HOek-RxQK0B2FNU1DY73p-pjz16F9iFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

On Mon, Oct 05, 2026 at 12:54:27PM +0530, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
