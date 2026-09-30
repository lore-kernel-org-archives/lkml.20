Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876153CFF66
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795078; cv=none; b=Mz4923aSfut8exMKEB7ionthb2HrJE1jFFXq8RSMwdfbwQqu/+YN7jhbSulro6bfLN3HWTwnCfMmk0fq6EJiZRqShXYZd2+wk1FUY5AzrrdXCPyfODVOK5HWLpd0ZsGMi1ZwmuJIKUuf+4I0M/WZVrQD1CaDakHNfHhuSlWIboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795078; c=relaxed/simple;
	bh=aQDTmzZkNtfi9M4WvijRvmcfH1g1CjNfc24/4SY1nHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcScAOwui+1lsjxnybpUdx8WTTEYUia/NOsW+kvnpknEdci6NXqGFz6Hd1V6NY7hQqPWExLj78SR1FJDw5yTm6h+cXedBTu6vRTqiUrYseFYwKWztV+JQZuK4gg6jQt1xRnbImuMa2l3kr2D/kBwV6Yb5EejWdVci/6vRchTQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwt9pseH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6o0Xmx4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwt9pseH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6o0Xmx4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UIPGkT3881744
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+yNVJmf6N6JAqx65mEM5Tj02xGBuXskr0wTh+rjirk=; b=bwt9pseHMIHAfkSc
	bn+n0tlrDMTjIlSMiibMFrTlfErRB3rTVKgiJlIPiWi53RIObkXBTmBIJyBbnqKo
	j3FdIl7rMcrCLMKsmaXi/OWwgL8eP5ZuW5MFqmURc/AHBeK84hdPBggrCGo9pCrB
	CdMk0MFbSvlvZYwSu7cpvE1LA9pd36V/LosmsvjfxxxrqUJO18HyRq9MXzhd3QT4
	plHf5a21LnytTrUUg0w5KcpFwVx6I9DKspAU5WdDWZ5TjVJUT2Dl8csmOeXiEBrm
	822cmtag5qdNaRnVKs7YVubmb5HWKCio+W20lsaB0UT9lgK3zy85rWInNFuEo6yG
	EJIAyw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pj85t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:04:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b335ce0f18so797689137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790795074; x=1791399874; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+yNVJmf6N6JAqx65mEM5Tj02xGBuXskr0wTh+rjirk=;
        b=b6o0Xmx4u5HFmqDCnLYh4YMi+vIWON0c40wJOrwZJLp82TBjryvEDFy+CAGsv1Vjsd
         5x6qyvZkRy49mqnhnv8l1LbLsBU8OeUZvstU3IzB4nwaLLCmv4WUzWSw6nP8exTHuZ5E
         Wm5UZny4LGRGw2t/N4bDns1+GRAvND4fi5K3ehVtwlnaecVuztuekoUwvDuZr6TEPrBk
         94yiPwJ00sxzt94E9DSGLSnUMUuuzAkBQO4nO4Xox72ErxeGLWiLfynEGEiI9rcaMuCx
         RlXFeWq5rSj0HVeuO6+O7/gA7dPQUowCMts9AMLvWDR+59tTvvva1cO3qrQtNjqhG/9k
         DT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795074; x=1791399874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+yNVJmf6N6JAqx65mEM5Tj02xGBuXskr0wTh+rjirk=;
        b=mNY2UdY0f2ct74gSlNfzPLVa6aCbOvNOYxKR5Q0gyl9xSQlJ+02yeWOK1JYxeUMfN9
         D0wds3ayywxb5Uo0cmFfJkIdvm6iuU+pAJpbgZ+Xs+0k+kt4Ri0/3ieXRHhJiSDZ4+l6
         lWO73I5q9aY1lUy6r6M7nN/V5kgjObkxjWlF/Da6T0SvbEj7iADw4wtFkdwTMbRKya23
         O2Xt/ebE6uj63li4c9zuhfKWThqPXbBZcTLMYGEkA+EK25h8vG7THOCgd1HoT4PxKTIe
         YAgxUfjxwPxx3l/zH/8gsCnj8RaYiu+ykmtr9kONxd7JFLIHYWHx8LXJlUPqbS2mudEN
         Rlvw==
X-Forwarded-Encrypted: i=1; AKwUvByHqqE96XiUkQl+wVtbp0orYGuDoDlROIkvqK02LSM0tUHb7qLISFeQ6S9oS34HVUX5YZ/fr7jZU9xRTv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrbThiO+jF2iup2Eh0ZHC6J+65kkL/1+GhT7NNYhxYour7e5vd
	DSvI8Gyvj97Rv810jQOTGhRqe0Ppob9QEfmb/POoDZfoamaxMvDUBC14nJVLYp9RXCPLD0TA77H
	uUn+wGmmD6XsKHWlQI9tVtLZy28OvuV0iSsY20qPtAROdbVfqBtkqMQMJ0WmLJb28cUg=
X-Gm-Gg: AYBFou0Uj0kSTcMyJhmNU5KFRfeUVQR99LgYCOyAGhLy9DRDDc6vw9WGOB5H/AbkRey
	6PX5YkYP9Le3STEyV0/c3bl6bLQz/p8q3WVgr1L+vHNmFwuDWN2/2rvYu3iXZtQCFOhv/0eGZDq
	bc1fz7YY9uRfesuukZjJSGjXiaP2vyvOmFHjerolActu1A3NV/m1rR0v+5xsphjFRg1f923fM45
	CjDGIZ9C1zt0MRPsjxvPMisIqhacKXMickjmxbksfixdNhSnx1scC4R/QW6zqU2qOsWFbrzGw/o
	/Z+x9UNBpLXhLhmgoJqQlKdlAwJBwTA45eoGeSn5jM5F6+J//RNyXmf5Jw2hc/WqwqdVCjBMEQn
	drSgpkInK1zBwCQgGrESP57Hime2fWnpCOxN+4dTT53P6ycMOQ51vJ5ExPQuTLof9o8i7UkSW9e
	JQm5oBYvw8atPQ
X-Received: by 2002:a05:6102:41a8:b0:7a8:f2be:9517 with SMTP id ada2fe7eead31-7be733a564cmr586798137.23.1790795073927;
        Wed, 30 Sep 2026 12:04:33 -0700 (PDT)
X-Received: by 2002:a05:6102:41a8:b0:7a8:f2be:9517 with SMTP id ada2fe7eead31-7be733a564cmr586784137.23.1790795073234;
        Wed, 30 Sep 2026 12:04:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbc4a5sm174124e87.63.2026.09.30.12.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:04:32 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:04:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Jun Nie <jun.nie@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
Message-ID: <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abd5d43 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=vnREMb7VAAAA:8
 a=VwQbUJbxAAAA:8 a=twE6rBcdgA2BTABM_JsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: fshc65URR4Q6Q_AePxLGdg9gjlIAxya6
X-Proofpoint-ORIG-GUID: fshc65URR4Q6Q_AePxLGdg9gjlIAxya6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfXzSqbm1I1tdHH
 13wARJhidbrBQCakGv8gyLvsKJDvR9ZFlGe3pKuuYLYHbqisrdi3dZRcpxryh2pSFhA0EcBMPXG
 yoODFSFBH9eARBJ5RLCf44r9mxewnFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfX1TOkb/t+wjP5
 7mE9MKkKqpFJ+XKSDEXTFDoOGsd5NjXeS7t3mY/mjpxFtBU4Ez+9KAWRbw7sOW9JroxTF4bkc6F
 w5fykYWiLdEqJYg2B0prFc6QYxdGrcSxOvgvGirW7+XAlDgY9mMMRh/kTfphe2S5gg6OMC8p6eC
 mQAOzYsjZSztVcvfAAZB7qILVaFFtYmNb07uzYddH5BSdVAi6UT763CBjuUfrxN5vT9ZRAs3xhH
 POGHwHYsAdwdu0PRVJBwKUepWz9dP1X6M7aKSxygMSSRYiP/UY9ZOjphU9/ZK+XNbo/XRpIXYD+
 jduUDZr51idQkvSfmdUf2tk8AFel6405Bmt7jdmPZixokzD4rD9R52hu/DCh9WaJ3OWaCkGNeYa
 jpqONgO85yVRcDWw8PZcyz6l2HUimzLdbuagR28sZbMneFYvRrt+lc9AbFg/aVAIygJr2Sygk2j
 r+E6oCV1gPV1nPlhwiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300078

On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
> On 9/30/26 09:44, Linus Walleij wrote:
> > On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> > > This entire binding seems like stitching two devices together, which
> > > might be fine (I don't even remember this stuff... two months old) or
> > > might be artificial grouping of separate devices.
> > 
> > I think that's a good point and fair pushback.
> > 
> > Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> > https://www.youtube.com/watch?v=6tNGW8PoSzw
> > 
> > The current binding does not reflect the physical topology of the
> > actual device, and the bindings need improvements. I have a feeling
> > there is one display controller with two physical panels.
> 
> No there's really 2 controller and 2 separate panels, but they are not
> classic panel, they are a pair of panels+lens which are in front of
> the eyes which forms a single "image" for the brain, so they are
> technically a single display and requires to be hard synchronized.

Yes. However this approach makes it impossible to share the code between
the double-panel drivers and single-panel drivers. I think, that the
panel driver should still reference a single glass+DDIC, while letting
the DSI host driver to handle the bifurcation.

> The R63455 is designed for this exact use case and are only supposed
> to be use in XR application in pair.

yes, but no, but yes, but no. I mean, nothing prevents one from using
this DDIC in some other usecase.

> See it like a single physical panel with 2 controllers which
> shouldn't be used separately. While technically a controller could
> be used to driver single panel, it's likely impossible Synaptics
> would sell this IC for non XR applications.

I think, this was causing an issue with the DSC too. A normal
bonded-DSI-panel-with-DSC and this-double-panel require different widths
to be programmed. Having a panel report real resolution would drop that
quirk from the DSI host driver.

> We want the both panels to be seen at a single big panel because
> physically the human eye will see it as a single display.

That's the CRTC side.

> Describing both panels into separate nodes would only be possible
> if we described a "VR display complex" nodes linked to both panels
> but this would probably be solved by actually describing the "display"
> linked to a DDIC controller and is out of subject for this serie,
> and can be added later when we properly define things.

I like the VR complex idea. In the end, you have two modes which you
most likely might want to support:
- L+R, having double-width CRTC scanning over a double-width framebuffer
- Mx2, having a single-width CRTC and a single-width framebuffer
  displaying the same picture to both eyes. I can imaging that knowing
  about L+R might be an explicit opt-in feature of the DRM interface.

-- 
With best wishes
Dmitry
