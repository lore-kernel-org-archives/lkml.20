Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F547DFBF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198931; cv=none; b=a4ipT9Z4fKvOTge5XD5lls8J1o7scdF6+RRuXRg8TrioxQ/VYvS0HN0rWJtjrfWX31gKE1DKJ4U3s4Q1y/cL569YaBnc9X+W+hQ5GpEuSy5IIYQV1oWFRYaWDaacjZdpf5CSgWELR0hOT8ZJLCigUAK2B88iUL5zsnKg5a22y1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198931; c=relaxed/simple;
	bh=FXte9VjmJdRgk041EaelSinDEsLR7XtDycTvBo7xfuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goGdciXZeRKlPhHjF9MGNXQzObC/8lAUVPdti/vbu5oI4DCL7QRPvOQgC44kXwmePprq043QgWjVY5jlmKPeyEF6F5/9BdRoHTN1+kcrMEsnnd16bzlggsV1Fsc+ETkQz1zEtbNTWv+RYdqYVpEnJzJvugzyP4KIrYjZrLDeafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6x5hJa0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/vXeBPV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6x5hJa0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/vXeBPV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AohOq2715008
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 11:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5otblZiCz5/7vKJfHZeFvIIjrwMZlIScMBsgpeIWfz4=; b=E6x5hJa06piNsa27
	BbhTOVYlHW9MfPwrd25nJA8wpgrBcJzNzxwcOnKEDCyDO2PiuHlZ8zewpifS2Wpn
	il5qhYnpInICmAuBNi9Ggh4FLJwFBCSblB0hPa1Ld39BlVCS6s2Qto0YDPwH2uEU
	XEPn71L6PYDm078GBg6ejAENsxKvUezbbtVSfklUGExFoZZxAg/ZMBM0siz38tlq
	Xy3Hye3unC3DqmfmjOozYDMgM1zj+9f9SUsUA+ofJz7WEiGTPhfqF2UXxz+9zMlC
	uhdTcwNXosVE6Uahd5QLBg+f2F7osM9hxl1WIUvrfoxapcRK2TdqlZFxqw9nD70T
	ArjSFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssnjkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:15:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso368347985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198927; x=1791803727; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5otblZiCz5/7vKJfHZeFvIIjrwMZlIScMBsgpeIWfz4=;
        b=b/vXeBPVA09Qlg7NbDwcAVpkkmWsn3zSevu4B8aIXgFB5n7kM4dOgjEnogs7c7AgZJ
         f51gGleMG0vGWZsdEW2GaOUnzXk+u9S39yYANPptxHyy5vt6v2N0GyOJSopNM5JWoHcj
         3t2l7T+OONm2sXJXzSqsnqF6b3Cn9ocEoato3V8oQAUfmPtXh4BxsO1fi2FpjNJ0MYa2
         QN3fPaBuLlUSv1MZT8ssg2sbwEnTDgytrvh14BGn56+vJJfQhNhTViouXa167Kfx6uOs
         pr2Jmdx+9yRpG/uikgxvLZTFky8FnsaPbXUjZIWMLQfhp5EDtWapxeG1Pi6b5Y5IteMB
         e5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198927; x=1791803727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5otblZiCz5/7vKJfHZeFvIIjrwMZlIScMBsgpeIWfz4=;
        b=qaA8fqZUHtXUMY5eR2eXb1ifcCvExzlc7I9LbNFY8atb/9NC7WQJVqP1DwQn0+JLmH
         3qLhhtXF3prB5LEnt40jqEWTbmJ7trg7vBOs54ZSHt9xJ1IcbykSNWQDQZnHMojMozDE
         Me2tIRUYtNfaY2gZWE8LokJ5LY/nI0TADjd41Xe8XX28XYeza3G/xn5xCGzI7nQihrFz
         cfOU1Jy3lYd6RbiVlhCHA0rWPO0bNQ+pDGs4n40eaSQdjErHw7VKi98jJ6sXrNFBwmmO
         sUPV8GCjDiYI1oGYkrgwxt6xDraaaJ9hbF/Y2IOKCawLSzJ5nkKEiW5jCkKtBz8pOqo2
         uvDA==
X-Forwarded-Encrypted: i=1; AKwUvBxic2yeg/mRm2RdAZ/8tlivkKwHi5zwnASHSEkKQGRVLAu2/UMiO2zwR+xHSfe82iXduPRIxCIJ0eHFPQA=@vger.kernel.org
X-Gm-Message-State: AFuF++l/o5P+a4pweOhMnTy8DCful8Eb3J+JcxQjH5g+eWpg7MbnO4Vi
	XAozcyUOsv7wV7jcHggglKEwk3X4bt3Obw5Y7uWSwMbXxm58QLVKfP5SJJWpdR82ErJXawj9Zb5
	Re7r2YJwMmVQUGaQYuYoXNhx1X0LFt1iSpjS9xP9XB3o2IU8IBVTOF4hPxZGi/4F+hAw=
X-Gm-Gg: AYBFou1Cp0qAUygSn6+tOQg4xD0xVM6SlZVT+UXnGVjoQTUmWbcsgYfUd9rz4iaCdXM
	dzzjORpFSGsqu1Hny4qQtE7OsvsEoRncjeWYt0Jr96f16O4KZihfFjkZLKTWSl2PRgxy1PhOFP/
	B4HD/zcyBEkkEGyoDYDFcanH8mvkUcDfJ5VgEDZIk4bdTtEgQezeVBN+EIGeCAC293N6ISuQl1d
	U/3fOjmeV6kKHVDaC/JC77cT+RW8ZTNfuUDG+ggGWyyQC9tTEA5eZdtsDLTuB0amGszRHgkHBaA
	IWW2HyaFceWT425E6TpOHmgpdYs900nkTNPwLDbaYz28/VHsYnQznz0DTy++YkNZmD2N5IISNSl
	AFLGbOd3wXHu5A+jQJ1etK/YzxcPR0GhpxBsOdPgAwXhnAhYGPeGrUpYLs01FXyJQ1qthRMrSG1
	o4r9xWkux6ho22
X-Received: by 2002:a05:620a:7001:b0:93e:495d:2140 with SMTP id af79cd13be357-93e50e239b0mr1041107785a.4.1791198926592;
        Mon, 05 Oct 2026 04:15:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7001:b0:93e:495d:2140 with SMTP id af79cd13be357-93e50e239b0mr1041096585a.4.1791198925352;
        Mon, 05 Oct 2026 04:15:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957b6sm3108672e87.30.2026.10.05.04.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:24 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:15:21 +0300
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
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics panel support
Message-ID: <cqo2n43vq4v7txg6j7ss6dyzpnqdbm265m5xedjtrp5tn7b56c@xlqtrwvpvoly>
References: <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
 <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
 <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
 <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
 <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
 <pyl6bihy4zsyhmblrgvuvov2gi2jz5ktpbcz4u3r53qw7h725y@4wzvce345wwh>
 <b48f9b77-5b11-483d-b031-81da16c5c73a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b48f9b77-5b11-483d-b031-81da16c5c73a@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX4WVFLiy14JXH
 GweAitnq9PxIBjFsY2+l4Joaf8kktNseUXnW7UgMl056Ij+13ChA31lwb6/qwNRHUXcCDDShsKC
 +IBfKqRh6+tHIk+ZrM3OoSe9aIRlz1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX1RRkI0kTAQFo
 Oirg/3+Cg2b3NlQGhx247BXjxjZHhU9ROYQAELYSq+ATopGE0zHKg9Afc6I3eGv9QQxLbtKOSZZ
 ou9rK9IZjTScmr+W3F4wksZjogjD+Zv482b+BnfrLEpHtMAsdTSnDRIHGHAlKaZJ9WjDkINYt/F
 um/fEpoXLpEIF0miLL2VDGYBO25rmgvpsgO9AtmnIqeD4oB5RL8yRDkaBwGqIRGkB0C1phnup0Y
 0bRqdMHWmd4lNFbaWPPmPhwkaefcpaFzNx1tMjKBKLwxOZxazYb+upEqPSRTZ3T3jrEl06VMTPZ
 SlAmoFnyAAsdDUqXcYu2Von631Lbok70+27+1Fv2vzGN3U5bLnPH8mYKlmCtAtSdp+rH4iTRGzH
 6z4EnSVm8H1eRyzSfgtvRm7HnVN+TUk2s+YrlKSRy09JaYROb6LRsV8rpSqEk8IiB5Eh6MqGhlG
 61fHQVh3gre4A7J4sfw==
X-Proofpoint-GUID: gxGLYGE_eFIv0nKXf5rYYZdFyogoao5a
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac386d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=vnREMb7VAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=iVn84C5udlQUea5KrTcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: gxGLYGE_eFIv0nKXf5rYYZdFyogoao5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

On Mon, Oct 05, 2026 at 10:54:41AM +0200, Neil Armstrong wrote:
> On 10/5/26 04:22, Dmitry Baryshkov wrote:
> > On Sun, Oct 04, 2026 at 05:51:44PM +0200, Neil Armstrong wrote:
> > > On 10/1/26 02:43, Dmitry Baryshkov wrote:
> > > > On Wed, Sep 30, 2026 at 09:18:55PM +0200, Neil Armstrong wrote:
> > > > > On 9/30/26 21:04, Dmitry Baryshkov wrote:
> > > > > > On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
> > > > > > > On 9/30/26 09:44, Linus Walleij wrote:
> > > > > > > > On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > > > > 
> > > > > > > > > This entire binding seems like stitching two devices together, which
> > > > > > > > > might be fine (I don't even remember this stuff... two months old) or
> > > > > > > > > might be artificial grouping of separate devices.
> > > > > > > > 
> > > > > > > > I think that's a good point and fair pushback.
> > > > > > > > 
> > > > > > > > Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> > > > > > > > https://www.youtube.com/watch?v=6tNGW8PoSzw
> > > > > > > > 
> > > > > > > > The current binding does not reflect the physical topology of the
> > > > > > > > actual device, and the bindings need improvements. I have a feeling
> > > > > > > > there is one display controller with two physical panels.
> > > > > > > 
> > > > > > > No there's really 2 controller and 2 separate panels, but they are not
> > > > > > > classic panel, they are a pair of panels+lens which are in front of
> > > > > > > the eyes which forms a single "image" for the brain, so they are
> > > > > > > technically a single display and requires to be hard synchronized.
> > > > > > 
> > > > > > Yes. However this approach makes it impossible to share the code between
> > > > > > the double-panel drivers and single-panel drivers. I think, that the
> > > > > > panel driver should still reference a single glass+DDIC, while letting
> > > > > > the DSI host driver to handle the bifurcation.
> > > > > 
> > > > > Yes, and no, it must really be considered as a "single panel driven by 2 identical controllers",
> > > > > and even this is really purely software implementation issue.
> > > > 
> > > > [...]
> > > > 
> > > > 
> > > > > > > Describing both panels into separate nodes would only be possible
> > > > > > > if we described a "VR display complex" nodes linked to both panels
> > > > > > > but this would probably be solved by actually describing the "display"
> > > > > > > linked to a DDIC controller and is out of subject for this serie,
> > > > > > > and can be added later when we properly define things.
> > > > > > 
> > > > > > I like the VR complex idea. In the end, you have two modes which you
> > > > > > most likely might want to support:
> > > > > > - L+R, having double-width CRTC scanning over a double-width framebuffer
> > > > > > - Mx2, having a single-width CRTC and a single-width framebuffer
> > > > > >      displaying the same picture to both eyes. I can imaging that knowing
> > > > > >      about L+R might be an explicit opt-in feature of the DRM interface.
> > > > > > 
> > > > > 
> > > > > This makes no sense to support both modes, and this will never be used,
> > > > > and anyway this is purely software implementation.
> > > > > 
> > > > > We're defining bindings here, describing the real reality, not hypothetical
> > > > > situation that will never happen.
> > > > 
> > > > Let's ignore software issues. On the hardware side, you have two
> > > > distinct DSI panels, each having its own set of controls, own DSI link
> > > > and own backlight control.
> > > > 
> > > 
> > > OK so let's see the problem in another angle, if we had 2 DS links 2 physical
> > > controllers, 2 physically distinct panels but forms an unique display.
> > 
> > Imaging the case: through the time the backlight LEDs on the right eye
> > age faster than the ones on the left eye, so we need to apply dynamic
> > correction to the backlight, dynamically calibrating the coefficient to
> > be applied to the LED brightness (or even worse, dynamically applieing
> > the _curve_ to compensate for the brightness difference).
> > 
> > Note, I don't have any information here, if such a difference can exist
> > or if it can appear through the time, or if the xR DDICs can handle it
> > on its own via a pre-programmed LUT, so you can totally say that the
> > argument is moot and I won't even argue here.
> > 
> > > 
> > > Describing it in separate distincts nodes is wrong since it doesn't reflect
> > > that it's an unified display, so either we define :
> > > - a "combined-display" bridge defined as:
> > >    - a separate top node in / like connectors with a graph from the DSI links to each panel
> > >    - a DSI subnode with 2 panels as subnode, port graph from both dsi to both sub-panels
> > > - a "R63455" panel bindings with 2 subpanels as Linus shared in https://lore.kernel.org/all/CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com/
> > > 
> > > I think it would be interesting to have the "combined-display", with a connector-like node,
> > > which will do all the split-dsi dual-panel logic for us and leave use implementing simple panel
> > > drivers.
> > > 
> > > The outline would be:
> > > 
> > > =====><=======================================
> > > / {
> > > 
> > > 	xr-display {
> > > 		compatible = "combined-display";
> > > 
> > > 		ports {
> > > 			port@0 {
> > > 				combined_dsi0: endpoint {
> > > 					remote-endpoint = <&dsi0_out>;
> > > 				};
> > > 			};
> > > 			port@1 {
> > > 				combined_dsi1: endpoint {
> > > 					remote-endpoint = <&dsi1_out>;
> > > 				};
> > > 			};
> > > 			port@2 {
> > > 				combined_panel0: endpoint {
> > > 					remote-endpoint = <&r63455_right_in>;
> > > 				};
> > > 			};
> > > 			port@3 {
> > > 				combined_panel1: endpoint {
> > > 					remote-endpoint = <&r63455_left_in>;
> > > 				};
> > > 			};
> > > 		};
> > > 	};
> > > };
> > 
> > This is an interesting approach and it would be a requirement, if we
> > ever have a device with 4 DSI hosts which can driver two sets of XR
> > panels (there would be no other way to understand, which pairs of panels
> > are bundled together). I am not sure if it needs to be an OF graph
> > device or if it can simply reference the DSI devices. Or if it can
> > reference panels (which is not the same).
> 
> I mean we could imagine combine any number of panels to form a combined display,
> 2 or 4 DSI links would be handled the same.

I was thinking about 2 combined display example. In this case you can't
figure it out in software without extra hint.

> 
> > 
> > Another question, do we need to list any other devices here? regulators?
> > sensors? maybe proximity sensor? cameras? I'm thinking from the
> > 4-host-2-xr point of view, because if we don't have 4 DSI hosts, we
> > don't need to describe anything. We already know all the hardware
> > properies and connections, the rest is really just a software plumbing.
> 
> The regulators would be in the panel nodes, for the associated peripherals
> like sensors & cameras they are not physically tied to the display so
> it's only software plumbing.

regulators yes, they are described. Think about the 2 XR units being
driven by the same "base". I think, you would at least need to link the
cameras to the enclosure. Otherwise you will have a 2x number of cameras
and no idea which of the enclosures they belong to.

-- 
With best wishes
Dmitry
