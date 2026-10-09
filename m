Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7842AFBB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552062; cv=none; b=QYwuqU8tIazCVFHz5cAW70Z6As6mNHTYaQQtW9uJgSwksghm2p/7yq96obdpkDNzHyFr8RyIrrUUtX6zZhOkGzt7s/n8Udm38XIS6ODMvBSHdvQnvtlOgCb9T/Tzf75D92kmYYYtapbDqbjyqx7T/yNoxpEsCeQP3F+5NrasYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552062; c=relaxed/simple;
	bh=aOo6YgfBkBJLB/5h2kLP8CwBUiJTIszfFlbWEOM24xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsNmprwtsTkR2mBzbQp5GSF2n0w/pugQzN85Ulmz8Hbq9Rf41yPtIq0Q0aIzvBx62FrQSNJck7qLx7Mg1w/hMp12h2t+pi74EQtWcMZBmq3xP3gTUPd3SGZWwsRSm2X0uxS3OOSJ+8yCN2KBzsPtCSQQ3TipgzQ2OklRzBmsWcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T67QzMw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPVW+DsI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T67QzMw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPVW+DsI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKK7G2916635
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4YcAJRG+vmBRk0xarN2r7ef8
	cFkDQcBJMpll1oXOAUs=; b=T67QzMw0FQyLGsTJz7dQho7dDIHV9HEaB4EBDqYf
	a51F6zFkzlh0uiRLYofyJwM5MV0zLu50ZfQw/ptPKGp6oM8MQJi/Pg+HrrE2EjZ6
	wA5LsayQ1tvNIVBgAofgOtbYEKUWxREW3230W/7ayHVl6YaJowDBjOBM9UTNucrq
	idZtlzsYkcIJJ4M3/C98Feq2bjWKzhffG/CKJTQOdfEV4hCJP3SnYdBQOA+NlFNr
	Wk7IzuP65i8AXiUdXP2ljuVr5jLjelfh3dW79AYSxQWYmhRfHwj7YqRUDMD3/Ra1
	7oJkhLxFBOzjKbS8/ae+JDCkDmUK56y4Knk62dY/XjIx/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuftg28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:21:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso1244057885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791552059; x=1792156859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4YcAJRG+vmBRk0xarN2r7ef8cFkDQcBJMpll1oXOAUs=;
        b=SPVW+DsIyIMV3aE7z7D/H6qtOc0TSVaEkGJmwQAvTb9kY4KFM7wuYaD5PTeY2egcPz
         irf8SIYRO4jOw+1p2ltCGrBVfavQGWcMf4l275CM/b8GIvoioR/sRf8wE2t2FGloJjZw
         5urKn2MD7uBIM/epA+Djos/irdbH8080nk/V5EQVrsz4GQklrF1ezYerfvdX1VwNqEGL
         yPhi6wBctj0DYj4Pi+20/umY4IJ2xlWx98eK9BZxRsBZO9RIHtILWKOYu0TktPFUoO4d
         noZ0dBaqsvUjMJo8KW45VmLTi8tfNbll7u12CMQLPOJcePTg1SWCUhe2TBmJsBmbgY+X
         J/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552059; x=1792156859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YcAJRG+vmBRk0xarN2r7ef8cFkDQcBJMpll1oXOAUs=;
        b=x5/Y5UCCRoYeMLjAwQM6X2KQP2ds4XGm8dHAQD6ycO+xXJhamWzskzsdDNGL/twsYI
         U4WGCZSLqYE/BKGQo0dDwYuRIrTfYk2Yvi+VRRMdATAH9eYYPrskbmafBsoJf38yoanr
         Y4wbIEY6Q18LNLxh28aeuJR1HFBrb9ucoSvHFBdqKYsIMccqjfZPug6P+F2KVbns5Is+
         obndMiLo1bQaHGzXrzR6weiJ5+7w42BN1hn+5S4RfpLQ/MKTPrKdLmDignOquDCYLbrv
         vED0qe9uvPlHmEl+dsglme42nPbIsutlx04wdqHcplRCyj9yxNr5z2QpdDS2ZrhAXGMG
         Xjow==
X-Forwarded-Encrypted: i=1; AKwUvBwGpZaA26igkdOaP0Fc9wqSkllOvyDG/n3FiWngCV1IRLG0yib38pkGSIjI0MmN+3umhp+RkW7ZB7bqGGU=@vger.kernel.org
X-Gm-Message-State: AFuF++nAOocoURJJeszbTwPQ3/NKBpQeoqnVMgHsYFB8mRTGQ2FEEbWr
	fZ0jL6W1lXsWMMZZgDfSFxlR7swW+gBRIgX2+yol7SLubHnnSVcg2aiIe1H2JTeiyIft5uxGcz7
	xXhZgw8PpVudrPsOlcgDZNLBjsIOElIKPTCXzNXZWCmODfKW5NxwpeZv4VBVrwBOUFFo=
X-Gm-Gg: AYBFou0QOnWuN+Uk+IXzPNEc03YnVk5sbF7ghXN1gKOZKiMOOP5i2ct5Jmk3CabcENT
	I36ACe1L5zb39Swo0hafaUs7kp2oITldMY9USSmZuR/QDSQX3eSF+o2F9/r86myqTJutzw8xQoP
	xQQiZt6o7ukaxd34GRIclLbXeNbM0y5GyqEUisOHIPxW0zuUapfj13JzK6VR1NPVSjf4DNPTxmD
	a4Z0RnvJqCPJrspFCiHzpPAnlRBV4m9rV7UHtqSFxX7ZdfMawrplAGhCaGQcWWLh4kL+UetPW8c
	LeZ/dfOzAdx1PW3fEEHVuEoOy+L1EmwqeL2inyPEszWwxXKa+4IOpJbC1OB150mirRwT/1L6Tou
	A+ApFyA+d1IfF7H/BW9NGu1++L/aSrYL76yrN5wwVlbz+My/afXemSQmmNE3oFMYwldpgSB+/HL
	LQbZ4Ax4mi1scM
X-Received: by 2002:a05:620a:6489:b0:939:3885:3131 with SMTP id af79cd13be357-93ebd0c2fc7mr254208285a.3.1791552059302;
        Fri, 09 Oct 2026 06:20:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6489:b0:939:3885:3131 with SMTP id af79cd13be357-93ebd0c2fc7mr254202885a.3.1791552058789;
        Fri, 09 Oct 2026 06:20:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befae8sm6442831fa.4.2026.10.09.06.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:20:57 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:20:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Xilin Wu <sophon@radxa.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: Add support for Radxa
 Dragon Q8B
Message-ID: <zzl3xo6njlmuujbscy3djy37vwbs46uzborf7zpziwfegkgdy5@x5jybhyqpwny>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <179153455955.2970577.14103639336377928226.b4-ty@b4>
 <b8cc8683-d114-48c8-af60-ecd8e16bdf46@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8cc8683-d114-48c8-af60-ecd8e16bdf46@kernel.org>
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8ea3c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=WytUIncG4urx4L10ewwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX+DdbXZqv+TY3
 Lgeua9NImSYzvrzPOEQEHIwAlOlyRWJo3MmcfRFOgNmAN0h9ipdcOVuDZ1A+bmyVm3lXQ7I/ZGi
 +nGOMkyEEJ0kOsmCNz8OtPq72KqTPtU=
X-Proofpoint-GUID: X7-33cTM5Ei8w2volOOE2qnoBUdwRupT
X-Proofpoint-ORIG-GUID: X7-33cTM5Ei8w2volOOE2qnoBUdwRupT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX5nC3cwJ23mFV
 k9elZdOruyRFQJQXtYGvxPUj/lacXR0gBoPrlGhSpV0PbeThB3juqTy9SdJOf3oLDpuITGJsY0/
 Lc1ZcERyk8khqlkeO8rKvp02B/CpQbH3vR4qoPSpfjs/0TmvMMKedYDM5+v3ljqqD6EvhklOBCE
 rKe6Q6lha3DpZLwQxnSjFhntUibNGPvOaKeAe7ok8Y6BABlrhsWnLOpQZqjbE2CTPr4OFVrB+W+
 1Oz0epry61CzFs1HFTqDqdGv0BkfpMiaOfUSY/3cQFjqJcVOLMhKSx9KCTBLhZvxBxN/uMERmMA
 jBipT8hwvs7QBytAnbKV6yIlOAW+FdH2fpKdl6cW102SIsNMb3b+DzpQHA1c2+8vk5OfJ+3CexC
 O7rC+7c4qB9P7QHs2aW6VnQKZqIo/hWFz12eXap88Nfqr1q/yNYEfo2p3e+92BB41pVV12OfLJh
 WY7FVzU6aoLd78GJmqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090053

On Fri, Oct 09, 2026 at 01:43:09PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 10:29, Dmitry Baryshkov wrote:
> > On Fri, 09 Oct 2026 15:55:05 +0800, Xilin Wu wrote:
> >> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> >> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> >>
> >> The board provides UFS and microSD storage, two M.2 M-key slots, an M.2
> >> E-key slot, a QPS615/TC9563 PCIe switch, USB Type-C ports with DisplayPort
> >> alternate mode, USB Type-A ports, HDMI 2.1 output, headset audio and
> >> a 40-pin expansion header.
> >>
> >> [...]
> > 
> > Applied to drm-misc-next, thanks!
> > 
> > [1/4] dt-bindings: display: bridge: simple: document Chrontel CH7218A
> >       commit: 377682cf917027396211426c509cae5785305ba8
> 
> So the fake tag gets applied. Having 12 minutes to respond to this
> posting is NOT enough.

It had your a-b.


-- 
With best wishes
Dmitry
