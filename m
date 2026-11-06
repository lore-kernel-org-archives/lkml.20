Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972379;
	b=IFzSZErbkSYLBaZN56u9AdOIlzJpxNvUhOVzVn9kDs8/He3MQ0k/CAPzoN2AsI/I6N/4
	 xHKjmXMgcixQSrx38J1xl5bmpKD2OqPA33OlSp6yNWnOgy6mC1s1TsFNHyYj+ZY6dkUfP
	 FsugcWoUxMt+Zas2phbKohxXSYVmu4lCFDitnW3veusvn5s3v/nuPdN3s5/YF9Ef1P363
	 j3aHBPY5v+s6O2RfnPnLRn/TaQnrt/w58Nys+D25b0o21fiPy1UakoD1N9ZYR2pzdUlsZ
	 jYPb9Ux7uijbpuKc91o1G8/V8JuNr7v0KL0e9PwPBvdTQMivdDRxdP3lFLkH076qY3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=;
	b=0ey0dJBiQ+VJ2rd559Oj6xbUdEaQaQzm7OSL2iwiCaNlsZREwEM25h/pl+g8tEAms98Z
	 OsllmmX72tDsA+Qp6sxsuBTJiTm/TQuUge5B8U8GK92C+yogLZ5v6Ie9DcgxMdBWn4/2+
	 8XMh94vE0EAZlZZErf7/K5j+wsaVCWA+FlTy+NP98m0l3DGZdjEVlUOfAqFjnvobDpDbG
	 v5gsTvLExfLtRBy0tCuiVITN7Xur6zgxKk3tub+I+vai6blZ+vp40otpucDJYuifVSXsG
	 c6BW2LobpJ9VbvWeLAUhyM7MLotP9ARppHQboVwgDYWLHBUFeUEyrAnnQ/FSbmqfBpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R5TjOCec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZaU///b7";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B6606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 762B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R5TjOCec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaU///b7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCVe3704132
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=; b=R5TjOCecc9muQl8R
	h26h/Le07HzjtoUp+wJVOCRFnN2h4FaExz8ijnLLxuDxS5fOilpDu9BBf0IHLAAj
	jQ9j3v+y0/blM8qgXtI1WF5Sd16R3NRpzCvFjDvdZYn+PDpB8am0hwZm5YP8Xnf0
	M6uxhfR/z9Y1s9qlj45CYGxV6ovnvXL5kmvqitK6mIzXoyl1sj8zUjicwl/AFUyS
	VW314nC3v9GHAtC3/2NLDf57x22ygKRhGWi4LzCoCpkLJZLGORxLghFNd/k04f+o
	44NN01JxIaeV9WMVS+tY2TNLCouWX31vX34aCL1h8zRGdrbqfqilLBZMH4nhokqT
	WN1Kkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa317q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:39:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so121052985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972376; x=1794577176; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=;
        b=ZaU///b7O7HiBTaQ3y4PX6SFJJChgg031LFI3yqwbT7nn2Q5rX5b03GW+AvOGreCtr
         L7fDU/PLx0NdgwhjE4pBDyotZH2rzq49775a868A7qfroCpnzrA1Nxr4uVlLTifnUDql
         LnUx7lT9iY2n1y9Q26JivOjYwfLxYxZGWiEn587tzGFv4hlDqDhN3V4lXqa/BNVmOQwL
         xB+s/vgSLtkC2d6oJPxheXkM31eRpV1D26CxZifNYUd6P3t5bjdF/bfbTdHJ0J0JVTlN
         rmlBjlp0+tU17134hxRkb00XsWp2mJ3s8UC71epOYZAxSzwdyUS0reKm4NODfWaaMzW4
         LnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972376; x=1794577176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=;
        b=MGOwIeYHgAQf0Ntmw01mzE+uGQcIE26T1BTu3oGcANBXg/akZdbmWIcuoUsb8wjf3E
         WTzxs1KHQ00JjBwIBYgUxtICK290GIF/YF5HDlQG/ij9Se62/yQzpCXPCojEnpxlJXyk
         59uXTzIetOe53F4nSzjt+bIrnRPFeXXLt4tQCveDIukG0FWiGOpg0Md1cRJr3v410yIL
         uA/uk/IzNFTymwyMOtPJozQz2b4xz8N8v5076+oqJYdhwQRsqC6C2z3I2XXtiqT6/gzC
         aGHZDM7lTjWOz6nxSnBTN04aK6bZNfd2riYlmzjCThzBtoIvRjeuJxZX+xQQUy0BlC5m
         sXSg==
X-Forwarded-Encrypted: i=1; AKwUvBzu2tIGH7NrEUL3tiqUfKXd9f0wdZ34GgK9hMmBh6R0G8fQDCh3ntQcjEs7+yfQ8vo1FyM0oMQ9KJbtOns=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+UeLVhqM/qiop2za75bMimRE6jGqvblDMh5x68iK7gg+V33Kg
	q8ZUimr0aW+3wZGvQOxexYcDr4C/iEgwMGiMtIe3DIG8UphQG2g7V87DjHX21q2phJEkBJtCTvc
	XHuKRG5Fa81DRTjATq5GgLRSps7D7pT7hbTTvkEY3fAXKw7556YJfxhI8SKeglJn0XDY=
X-Gm-Gg: AYBFou3U2r+u3KDbpCk8cKngA922gSgp/fnOCb02qrCiQw/ZEt6x2AVkmtjzdA0rWFb
	vruJ4vRVTm10Ut6Ekjf3BLiOG7UWYYMav0VymItskh2B9rhNEuTjaOdiQbsPmoLQEF4BGU+Dub5
	DxprVl54qE+8nqADxfbFqNdBUT7Ud4wqlMKQ4WTGzMewDAtI04MshdcyBbhB+R6B5X7JRoZhckQ
	Cw9B00eUY0ET+qRQApkcliCEmym8F2/tylAHLyI9/qJtweLMeh/LAXTqqV1OTlqk7Nu22ubk/4C
	Wnlv9f9jSR+TQM+wSzM6qIeToiqMRrbjpRfovKBJRP1THPrF26jsoxSOeSQVtUkPorL56JZBEln
	A5zwYtx88yYe6fLTVJmM9fvg2lo+lpBnS9F2TymDHoNMOSylmEJ4seov67cEk19mN/C+ZN6afy8
	yfi2UYAhh9pkgNMn7IyoKbweUvweoKVSXJo7XtiWIeKkMh2I05OWyTaMGx5Uat
X-Received: by 2002:a05:620a:a91a:b0:945:fcd7:7823 with SMTP id af79cd13be357-945fcd77e03mr112039885a.63.1793972376391;
        Fri, 06 Nov 2026 05:39:36 -0800 (PST)
X-Received: by 2002:a05:620a:a91a:b0:945:fcd7:7823 with SMTP id af79cd13be357-945fcd77e03mr112037185a.63.1793972375910;
        Fri, 06 Nov 2026 05:39:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c0030a3b50sm369070e87.79.2026.11.06.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:39:33 -0800 (PST)
Date: Fri, 6 Nov 2026 15:39:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>, rob.clark@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
Message-ID: <se7js4dwankc53n4jxmmi5qzcav6xbkrztrtdae3wcj537qtqd@syrjvxuv3apf>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
 <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com>
 <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX1za9SE4d3rrW
 scByN3iZJ0ieO3OeBolwcUDCp+EDW/k3bBPxSHxs3bbGoCfTvDst3WA1e2vV9U2Zv+6whajCOMv
 b5YWExMX30TH61muo5ptNlwD+AMFV/+n1x45pxHEouRqI7R/i3lojGJdR0hQokyVsEbY1z1438U
 ozW21KQqY8f6AAREJ6qTWcBH2109ibcr09nwNEAmk8cjGfxOi+ZikdT6EOUmG6Pb/rFzEqMi/g1
 SI/v6lKh+c91YHftPDIf02QpyX4GinXk8ADpRKV1DyvuDVeB1KjnoCTNfIxsWtE1n1MnyDRVYff
 wKygyNUW69oHKPjIovQPA8u1a2gwo/d1Ly4kpVODSQGw0tmro2TftoHpsw9fSJ+2LClbLXIETmu
 +t1AdSXQTDtmTIdzC24D3XTOvSmc6M18mRQIBAZzDx75JX02TMfATD3z0gpqCkk7DYhSao7JY4o
 9zVzyt/o1jge4XlJYaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX6YGPMeCyo8Ly
 MCP99YII4B8rqsdaQU1IH8we+hwmjABq7laB3YP2yqLC7KgUd0H5QSEuBXp23b1bQYMCj0G9hZB
 TYbYJM4OZepRVlIvxr9O4gYyE2iZZLU=
X-Proofpoint-ORIG-GUID: Vuca71IykY4huaDQFZHzZ0e54pY5NKgN
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aedd899 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=g_Gk0hPVKUWBytyV-9IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Vuca71IykY4huaDQFZHzZ0e54pY5NKgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

On Thu, Nov 05, 2026 at 03:34:55PM -0500, Nicolas Dufresne wrote:
> Le jeudi 05 novembre 2026 à 13:35 +0100, Robert Mader a écrit :
> > On 04.11.26 23:11, Rob Clark wrote:
> > > On Wed, Nov 4, 2026 at 11:00 AM Robert Mader <robert.mader@collabora.com> wrote:
> > > > Nice, very happy to see the series!
> > > > 
> > > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > > The comment describing the QC10C buffer layout calls it a compressed
> > > > > P010. It is not:
> > > > If I'm not mistaken the display engine / the DRM side (including Mesa)
> > > > describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> > > > Gstreamer MR [1] . So if we can't pretend that QC10C ==
> > > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire that
> > > > up everywhere etc. OTOH if we want to keep the DRM side as is, then the
> > > > comment should reflect that, IMO.
> > > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > > as distinct formats, both with and without UBWC.  I'm not sure if the
> > > same is true on video side but P010+UBWC was never exposed, or if it
> > > truely only supports linear P010 and UBWC TP10.
> > 
> > Oh, do I understand you correctly that the P010+UBWC implementation is 
> > not compatible with QC10C, meaning on the GPU side (Mesa and display) we 
> > don't yet have any support for QC10C exposed to userspace? If that's so 
> > then we don't have a choice but to introduce DRM_FORMAT_TP10 I guess?

Yes.

> > 
> > On the plus side - this would allow us to make the format single plane, 
> > matching what we get on the V4L2 side.
> 
> Since its single plane, we should aim for a variation of
> DRM_FORMAT_YUV420_10BIT. Similar to YUV420_10BIT, there is no obvious linear
> single plane packing for that, it would only be there to support the
> compression. Or maybe this one is abstract enough to be used anyway?

We have DRM_FORMAT_P030, describing this semi-planar packing. I will
describe P030 + QCOM_COMPRESSED for v2. P010 + QCOM_COMPRESSED will be
repurposed for the actual P010 compressed by the GPU.

> 
> Nicolas
> 
> > 
> > > 
> > > BR,
> > > -R
> > > 
> > > > Best regards,
> > > > 
> > > > Robert
> > > > 
> > > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
> > > > 
> > > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > > 10-bit samples in each 32-bit word, which is what the stride computed
> > > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
> > > > > 
> > > > >    /*
> > > > >     * QC10C:
> > > > > - * UBWC-compressed format for P010.
> > > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in 32 bits.
> > > > >     * Contains 4 planes in the following order -
> > > > >     * (A) Y_Meta_Plane
> > > > >     * (B) Y_UBWC_Plane
> > > > > 



-- 
With best wishes
Dmitry
