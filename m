Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FE54749F3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452852; cv=none; b=qXIX5hBlyY6IlLAGnWaY1GEI+UYiXtESRmPCgoE5tk5ju8ehvHrvrW7PSrvdzchDAU4S6yaofwTJrypaV80jRDR2JbfePdNwH7hi02riLYRuy/BDZfUMOpQ8b+vFMVuiGAzqNQVwE+zEpP8VU/rDX0yga49o+cxzhxhpDRR47a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452852; c=relaxed/simple;
	bh=GR+H9oCzwYidt77KsB0/Uu5pnDITa+rGzx5RFxX4oKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imEETDT+lfW14HtXIe9GGIVDcoDburByQVm/kMJ6QuzXVy0Cf/R7cA8EbhlKk4Ta+kPGDerfTJtRaKp6b1Vj0N/04Ah55S7wPHM/YPbW+OL44nR/018SsF/soqyILNvdNgOji5wOrI4J5x/0mZ+q90t/cxTXcl7WpeQ6ngn+iSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wmp39Y1w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+c+aTuJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wmp39Y1w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+c+aTuJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3Sj2189789
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LADOL3hVYZcuOgoRDbr+9VUKRaoDf0lpVHeS2HKIIdM=; b=Wmp39Y1wpOTjwc4l
	9xUHQuT2Da/uJzbP3ncQJWxbSFAs7tr2EuTHsXxsCWOEIaENIKG9eWA968WDE3Cw
	+vPOBSaz8y6f5EQP6KdVLH2vFHzeHSQr3SBUl5plXbCbx6m1aMbfKuIEGtz5awXJ
	j4YiO/XGOeMmcrP3zFjIMbOxowBqKOd6Bkyk8/rzlC95iEDl7iilVKVaP/uNxUBf
	jFQv563MsR+kr9g2yWhIstU/wxacpgzC74WZS7/cC1gnJFEOF0Ip1LJsebI5XAM0
	/dL4tMJQw1RbYgNsqdkp6p6iKs7IZL5lnmcUxkTC5IHyh1y95+ZeHB7Hav9QlkwB
	pkOHgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a81p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:47:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso566955385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452849; x=1792057649; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LADOL3hVYZcuOgoRDbr+9VUKRaoDf0lpVHeS2HKIIdM=;
        b=C+c+aTuJThV7w7IS25Zy0STyD7llIxWnKmkq0XhNyDLa9/c2jDzJ18Rn/NYIhoPzW4
         6PREc7i5rXQMFo0vAuap7/MMnKtHpC53fGcTOd9DH/UmUMBEe/nsCt7MaEY7o8GXhERr
         DcDIwTRnP5Mgq7BtSdgEBcxuXuzXIOhKZkRB/XQhWr430BRBoDjC55ldbL1HC9F1JdAT
         bwrmZWJmL/JUvwcF/5F2IJIuxOW1BGnXGUyiQTig+k9cQ/n91zvxC+N2k2UcIZhzs1By
         1d7AwEJis8bEvRy1Lfoicuui9LSk4JADA3khXLlloutDJUW3/15QSMwciDC9ylvil36q
         fsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452849; x=1792057649;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LADOL3hVYZcuOgoRDbr+9VUKRaoDf0lpVHeS2HKIIdM=;
        b=dXNeEHtOuM5z4RN+5/q4zytYdDGCgFi+1itRG5ZJuhUmECb/4z132u5RDa5eRioEfg
         xn+OTT0feKj7zWzapj2l13qQEKoLGxx+w5U34w6lJlEfZnga3eAz/hnTvz9yYrqLVbos
         Kp25SxV4orDIAI363lbBf4MvldKV11Te6jb79E2UndiyOSuq6EodxguHyQ8giNTr82vm
         usoXu/aDAYy5kppUSmdMV5zYlFV8Y99ofwHPxhnEE3397KcFRBopzh2LSU7E+dMYwT3D
         N2XPv9SjVzW6v+e3gMzrshxmFoD02ji5VXBxujHz2OHHR5XCnd+4CCGd1pC9pmRDmQxz
         Qi2w==
X-Forwarded-Encrypted: i=1; AKwUvBzu9Z5vhwryIlT+tB5ajkzvm2eeusOfxG+wBfiK4vpPtkwKXYpkFX769OeNs1NBKLJss45xMAiXPJfi3S8=@vger.kernel.org
X-Gm-Message-State: AFuF++lAZ6OAqGSoKTYNYdhpRmhN6qRbx870CsNwGnUwuLrUW33iPDYI
	uEv9PTAUXzyPM676jm7wH3EYebABAtBvDanVq3TxzzTCKKTdFpp1a+rDS6ikBE7N77FqcXOgfEJ
	9OLFNFRE7xaI/pVia4W4ppzKMrpRTpw/m7iiXyysNhPlmIn8uHacr+w2i4e0smZCcUUM=
X-Gm-Gg: AYBFou26pb4NDr8Hq+x9KkfHwSbnF57JZb0RulQguGSBpzRL2Lv2xsUha6RqzUZFrfU
	EexLfSANg7dYqc30ABWkiab7JbeLw71/du2yybcVfPms07/uoXe/T4x8WVtamQK9NfKIfJ8h7Hq
	24a7AbD8b1jFNdqcD8pL6jkKYUhRVEViuougOwUKI0MWOHvrHXu8y/TxjMe1wbprex6c+JusEUJ
	SQIABLFmdK1WR8ijdd+0c75iYtM3aoKrG8i+oE3EVJl7jveE0B3s451+NjZDYiGa8xwjohgHz1e
	xml9K87A5ohVvezV5hDSleAT6jskkfSH2cbZ4UgQJJPEVTpFWGKpNRF0WZ3I4ZcN8CqzZsBihvu
	eU9lRak7n9RT9ISVVEkQlzcC7hRIThtxGih92w8nLe6gdgceA6safoMiojl8nDWLAO0o1voPgWn
	Oo3klhrY4GBIE/
X-Received: by 2002:a05:620a:4011:b0:93e:6c02:d181 with SMTP id af79cd13be357-93e9b71bf0cmr994955985a.14.1791452849136;
        Thu, 08 Oct 2026 02:47:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4011:b0:93e:6c02:d181 with SMTP id af79cd13be357-93e9b71bf0cmr994951685a.14.1791452848445;
        Thu, 08 Oct 2026 02:47:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3074bb0sm1042941e87.21.2026.10.08.02.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:47:27 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:47:25 +0300
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
Message-ID: <d4mel72zic3olxmtf6vx57yajlmjwtrvdcaucfkpmlnkxodqkf@h4yzg6ntqs4r>
References: <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
 <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
 <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
 <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
 <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
 <pyl6bihy4zsyhmblrgvuvov2gi2jz5ktpbcz4u3r53qw7h725y@4wzvce345wwh>
 <b48f9b77-5b11-483d-b031-81da16c5c73a@linaro.org>
 <cqo2n43vq4v7txg6j7ss6dyzpnqdbm265m5xedjtrp5tn7b56c@xlqtrwvpvoly>
 <c23f91fd-a5d5-46a2-b4d7-3e33a87a348e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c23f91fd-a5d5-46a2-b4d7-3e33a87a348e@linaro.org>
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac766b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=vnREMb7VAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ntJHeUTpt5IsPa3yjLsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfX2QGBVC9O9emj
 8JkInc8e6BGMtJau8mQjNdLxWJ/1jYoaP7vMbVti3ordkTKpHxqdv7xTzht/R/Fwzlg2jMxEq8U
 oIuCI1M1RRbFjLZ468ANTOtlypAxC/w=
X-Proofpoint-GUID: lmwbQ2QvTT_ZRd68Qjh-qDAQ5npz9trx
X-Proofpoint-ORIG-GUID: lmwbQ2QvTT_ZRd68Qjh-qDAQ5npz9trx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfX+6CvsCcsYX9l
 oKneOr1OJz7sBp9S9h/cUoZgo986m1ij/u5qfbF5dQ7UADcUTrik4ERD2v9KNI6yBK3vBZnbJek
 fm/8G01Wb6KbdVOp3n8xE8krbahp3eCZTq8iCdCsloU7t8q5zzDORstPOYuk5DshYNrCphm9Yf6
 f28A8Q1oENUaPUu+pkzR9v8f1I1cKmwNAI/ol5O35GLfecKNTzBj0kLUa3ENoQJqV+wPavXjXZu
 nzA+6gpnaiO7zmJ7eU5Bx3vu/uWROPJtCmzyt+fELYX+gCQa2VJf6OMW9OgmeAkCG33EVODBNVR
 uZMYDyuTa+CwP5M/FmBiwwQ86RgZsrxzuWEPzzUgNrMNHdFmvhFx/6gqt4Jt+6/3EvY9vHvl1vH
 4EXW0mJXddDID05kOsreSKo6RklCncKEVOsyGoVZe2FbsFXEwyyJrWhR15VkCc5gUwF5xNEcfjC
 X48UgDQE+E8ngbDEPFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080038

On Thu, Oct 08, 2026 at 10:27:05AM +0200, Neil Armstrong wrote:
> On 10/5/26 13:15, Dmitry Baryshkov wrote:
> > On Mon, Oct 05, 2026 at 10:54:41AM +0200, Neil Armstrong wrote:
> > > On 10/5/26 04:22, Dmitry Baryshkov wrote:
> > > > On Sun, Oct 04, 2026 at 05:51:44PM +0200, Neil Armstrong wrote:
> > > > > On 10/1/26 02:43, Dmitry Baryshkov wrote:
> > > > > > On Wed, Sep 30, 2026 at 09:18:55PM +0200, Neil Armstrong wrote:
> > > > > > > On 9/30/26 21:04, Dmitry Baryshkov wrote:
> > > > > > > > On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
> > > > > > > > > On 9/30/26 09:44, Linus Walleij wrote:
> > > > > > > > > > On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > > > > > > 
> > > > > > > > > > > This entire binding seems like stitching two devices together, which
> > > > > > > > > > > might be fine (I don't even remember this stuff... two months old) or
> > > > > > > > > > > might be artificial grouping of separate devices.
> > > > > > > > > > 
> > > > > > > > > > I think that's a good point and fair pushback.
> > > > > > > > > > 
> > > > > > > > > > Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> > > > > > > > > > https://www.youtube.com/watch?v=6tNGW8PoSzw
> > > > > > > > > > 
> > > > > > > > > > The current binding does not reflect the physical topology of the
> > > > > > > > > > actual device, and the bindings need improvements. I have a feeling
> > > > > > > > > > there is one display controller with two physical panels.
> > > > > > > > > 
> > > > > > > > > No there's really 2 controller and 2 separate panels, but they are not
> > > > > > > > > classic panel, they are a pair of panels+lens which are in front of
> > > > > > > > > the eyes which forms a single "image" for the brain, so they are
> > > > > > > > > technically a single display and requires to be hard synchronized.
> > > > > > > > 
> > > > > > > > Yes. However this approach makes it impossible to share the code between
> > > > > > > > the double-panel drivers and single-panel drivers. I think, that the
> > > > > > > > panel driver should still reference a single glass+DDIC, while letting
> > > > > > > > the DSI host driver to handle the bifurcation.
> > > > > > > 
> > > > > > > Yes, and no, it must really be considered as a "single panel driven by 2 identical controllers",
> > > > > > > and even this is really purely software implementation issue.
> > > > > > 
> > > > > > [...]
> > > > > > 
> > > > > > 
> > > > > > > > > Describing both panels into separate nodes would only be possible
> > > > > > > > > if we described a "VR display complex" nodes linked to both panels
> > > > > > > > > but this would probably be solved by actually describing the "display"
> > > > > > > > > linked to a DDIC controller and is out of subject for this serie,
> > > > > > > > > and can be added later when we properly define things.
> > > > > > > > 
> > > > > > > > I like the VR complex idea. In the end, you have two modes which you
> > > > > > > > most likely might want to support:
> > > > > > > > - L+R, having double-width CRTC scanning over a double-width framebuffer
> > > > > > > > - Mx2, having a single-width CRTC and a single-width framebuffer
> > > > > > > >       displaying the same picture to both eyes. I can imaging that knowing
> > > > > > > >       about L+R might be an explicit opt-in feature of the DRM interface.
> > > > > > > > 
> > > > > > > 
> > > > > > > This makes no sense to support both modes, and this will never be used,
> > > > > > > and anyway this is purely software implementation.
> > > > > > > 
> > > > > > > We're defining bindings here, describing the real reality, not hypothetical
> > > > > > > situation that will never happen.
> > > > > > 
> > > > > > Let's ignore software issues. On the hardware side, you have two
> > > > > > distinct DSI panels, each having its own set of controls, own DSI link
> > > > > > and own backlight control.
> > > > > > 
> > > > > 
> > > > > OK so let's see the problem in another angle, if we had 2 DS links 2 physical
> > > > > controllers, 2 physically distinct panels but forms an unique display.
> > > > 
> > > > Imaging the case: through the time the backlight LEDs on the right eye
> > > > age faster than the ones on the left eye, so we need to apply dynamic
> > > > correction to the backlight, dynamically calibrating the coefficient to
> > > > be applied to the LED brightness (or even worse, dynamically applieing
> > > > the _curve_ to compensate for the brightness difference).
> > > > 
> > > > Note, I don't have any information here, if such a difference can exist
> > > > or if it can appear through the time, or if the xR DDICs can handle it
> > > > on its own via a pre-programmed LUT, so you can totally say that the
> > > > argument is moot and I won't even argue here.
> > > > 
> > > > > 
> > > > > Describing it in separate distincts nodes is wrong since it doesn't reflect
> > > > > that it's an unified display, so either we define :
> > > > > - a "combined-display" bridge defined as:
> > > > >     - a separate top node in / like connectors with a graph from the DSI links to each panel
> > > > >     - a DSI subnode with 2 panels as subnode, port graph from both dsi to both sub-panels
> > > > > - a "R63455" panel bindings with 2 subpanels as Linus shared in https://lore.kernel.org/all/CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com/
> > > > > 
> > > > > I think it would be interesting to have the "combined-display", with a connector-like node,
> > > > > which will do all the split-dsi dual-panel logic for us and leave use implementing simple panel
> > > > > drivers.
> > > > > 
> > > > > The outline would be:
> > > > > 
> > > > > =====><=======================================
> > > > > / {
> > > > > 
> > > > > 	xr-display {
> > > > > 		compatible = "combined-display";
> > > > > 
> > > > > 		ports {
> > > > > 			port@0 {
> > > > > 				combined_dsi0: endpoint {
> > > > > 					remote-endpoint = <&dsi0_out>;
> > > > > 				};
> > > > > 			};
> > > > > 			port@1 {
> > > > > 				combined_dsi1: endpoint {
> > > > > 					remote-endpoint = <&dsi1_out>;
> > > > > 				};
> > > > > 			};
> > > > > 			port@2 {
> > > > > 				combined_panel0: endpoint {
> > > > > 					remote-endpoint = <&r63455_right_in>;
> > > > > 				};
> > > > > 			};
> > > > > 			port@3 {
> > > > > 				combined_panel1: endpoint {
> > > > > 					remote-endpoint = <&r63455_left_in>;
> > > > > 				};
> > > > > 			};
> > > > > 		};
> > > > > 	};
> > > > > };
> > > > 
> > > > This is an interesting approach and it would be a requirement, if we
> > > > ever have a device with 4 DSI hosts which can driver two sets of XR
> > > > panels (there would be no other way to understand, which pairs of panels
> > > > are bundled together). I am not sure if it needs to be an OF graph
> > > > device or if it can simply reference the DSI devices. Or if it can
> > > > reference panels (which is not the same).
> > > 
> > > I mean we could imagine combine any number of panels to form a combined display,
> > > 2 or 4 DSI links would be handled the same.
> > 
> > I was thinking about 2 combined display example. In this case you can't
> > figure it out in software without extra hint.
> > 
> > > 
> > > > 
> > > > Another question, do we need to list any other devices here? regulators?
> > > > sensors? maybe proximity sensor? cameras? I'm thinking from the
> > > > 4-host-2-xr point of view, because if we don't have 4 DSI hosts, we
> > > > don't need to describe anything. We already know all the hardware
> > > > properies and connections, the rest is really just a software plumbing.
> > > 
> > > The regulators would be in the panel nodes, for the associated peripherals
> > > like sensors & cameras they are not physically tied to the display so
> > > it's only software plumbing.
> > 
> > regulators yes, they are described. Think about the 2 XR units being
> > driven by the same "base". I think, you would at least need to link the
> > cameras to the enclosure. Otherwise you will have a 2x number of cameras
> > and no idea which of the enclosures they belong to.
> > 
> 
> This is highly improbable, and I don't think it's the priority right now anyway.

Yes. But if we are trying to define the ABI (and DT is an ABI). I'm
using this usecase as an example of what needs to be defined as a part
of the enclosure. Otherwise the case becomes a bit strange: we are
defining XR enclosure, but only for the sake of defining that there are
two panels and one of them is the left one. From my point of view, if we
are defining the enclosure, it should be a (more or less) complete
definition. If we say that we know all the details for now (because the
whole system is the XR headset), then we also don't seem to require
defining the panels setup.

Having that in mind, I'd still ask you to try the following experiment:

Add two separate panels, each describing one eye. Add msm-specific
connector driver, proxying both panels. If possible proxy bridges
instead of panels. The primary goal would be to handle get_modes() in a
consistent way. I still suggest using a DRM_MODE_FLAG_3D_foo to describe
the mode. Maybe we need to a new 3D_XR flag for the cases where the
panels don't provide an L-R picture without significant additional
processing on the host side. I'd still suggest having a single-eye
resolution mode too, just to let non-XR compositors to display
_something_ on the screen (even if it will be mostly unusable). Use this
connector instead of drm_bridge_connector. This should let MSM DSI
driver to clearly use the dimensions of the panel for DSC calculation
instead of depending on extra flags to derive them from the CRTC mode.

One of the ideas that was briefly discussed during LPC would be to
define ROI for the connector and use two connectors for a single CRTC
(each specifying its own region to be displayed). I think, this might
clean up a lot of the hacky code. For example, each of the connectors
would have its own backlight, each of them will have its own mode and
its own bridge chain. The major drawback is that from the userspace
point of view both connectors are independent. It would be a big
question, how the kernel should behave if the userspace would try
lighting up only a single connector out of two.

-- 
With best wishes
Dmitry
