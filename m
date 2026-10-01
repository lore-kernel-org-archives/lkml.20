Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961C36C588
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790815418; cv=none; b=V6N6+nO0Im5nOG1qtw7v+jrvLxgUJE7gotNjyLP3H4xeqVP0nvPNcoyOr1SoujCOLhw0xKxvmUSnM5tRg+XnlxyTVuRH9ZDNStPlZrLnrRfbFb/dBUEXyzyY/T232Xj+FZmY1GfgVsuIWCPOupkWxUv6tT3TgOtN6OEJYalWm1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790815418; c=relaxed/simple;
	bh=cyLUkHDw0rOteiZ0d9G56/3XyJ40Ceebpxn64MLmNd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJQkTZ4pjJ7QhVuBhyHuW/vQ/+mkVZBWdTlmE6Cia4ecpTNgvH49u3U7vqLW+gXuOoFKDTlt/qGgyjb3IiCZ/A9oMdkQMRgOj+/ewYkCA+c4Yjk4G4aiX1Xcj317UEPKhsDBTr1CCVLHDGH7+LC/IrSgaQ2X+31nifMULsPP+mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtKAsRXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CetEcrZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtKAsRXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CetEcrZI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UMkrFc893247
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 00:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/YjcEN7BDbe1iCeqE6MfpaqcpTrbhOInw48Y0omQ9g=; b=ZtKAsRXLvhfaowk1
	fl3P+MjUdwjsYT4zBYuV/SxekN9B1MluKLMDWrvZ+r6vzuC+1orOZyObIK1CDr5d
	AyKdwi8vMclA+1J50tXc6w/Oo1g2Cu1xwmLQ5RoF9pi/7br20bv4EpOPykSmK61n
	cC8JXgZtEY9W0oEcbLPq040v2kCM0YtrTl6K9ImJFAWa+xj2Ug/7cWg/fbAHYNAx
	50WjiyR/6tDT9Ee9W9HjbYiRCIDeAtu+ZrdGNh2oiTq19hjtdzqGfkHws2dSeCaK
	wtD2xrCDPHI399ocLKuBqimXyqsoLJBys3EOBM3tFlR0itWO9w3xp2o8eWf3cPFr
	IgrBRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh58cqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:43:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0c7126e7so1052948585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790815411; x=1791420211; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/YjcEN7BDbe1iCeqE6MfpaqcpTrbhOInw48Y0omQ9g=;
        b=CetEcrZIh12oqxTt/xl0L7ealXCsLYWIbBsO2m5kzBTSED2jMBnrrfGPxAPWbshN7x
         SJaC9cybuvPF51Dd6nxABpyJ65NkDsep/LxgGwTp0yIFKkJSRNCgZN7zDm+c4yPrfwcP
         Dp1yYRe9EeYxDYa1XMrIkyStQeeg4rEOd6XjzW5/Jt2O7IMcc4KtYSslRw4O1Dan0UVo
         XKwYctlOMvoW+6tMz9QaThKrGmPHIcf7LF0q8o+sgViT1qFepB9aIV+H2AHbXDOuONq1
         7c334XvaysKI++hPsofDniVnYiYHLD7LxIoaO5nqnH4ExSpRvdSnPwMsDfpTh9CjCqu8
         tozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790815411; x=1791420211;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6/YjcEN7BDbe1iCeqE6MfpaqcpTrbhOInw48Y0omQ9g=;
        b=arrT6eI+Y5HxVfvzmANrdnxJlQHMyqUNFVHdlU4cj159tt3+0WUgEzrZfuQ7k+d2cB
         A4o4PWPzfPHV0WuU6lSIgJfE/XkIOqjvaL2+ZAUi5rn2X8GkgtLDLQnwptRx7xkPBALv
         KTou3pEeDdmkAt57g/3rOPYhLMmHppKPXKMKIPMGcA3JUyyOs9n/S9FZCEh17A+6oj9B
         48BbycQMxdZX55hw5ulGMdYQw7NizBS8a3uMMRRBqoq0RNrpKlHB6SZYp7XGccJerG0y
         xcTcW2OilMmsg4jucsXP9Sm3SM+lHZ4BjdX429zKPpUY9HRLoVKrbq0tqVQz7KEYI4na
         PLEg==
X-Forwarded-Encrypted: i=1; AKwUvBxwgI22ytvJdgr2/e1Uhy92ZB9RAKBTiu73y/U6dcNePGI6SGDJsrrPC+8fSS964Gax+1lIhN8mfaCzrq0=@vger.kernel.org
X-Gm-Message-State: AFuF++mgw8zq04r4gdJV5nkBNopVJkQ33FLcERyti8phZGlluqKzw7EQ
	JlMwNXlpIVXntjxbl8wJiZLVR9A+YVTvknfeFoJ7wwN6U1VNmV0pLIG2eHPLM0WRDM+wxqf3EWh
	lvFsLCmJaM6TFG1iYOPuTcg0fWpzfexqE28sZCJOcvsrpXmiM+x+0b9lulLetVlcC4dlct2BxPM
	4=
X-Gm-Gg: AYBFou1czgldtGOZgsFvHkjX+tVO6VzIozJ9jaHtbVxahl22btOFhLpMhszD5LdvXH/
	4srYv+vTkLdY40qF3fUXxTu2leskc9syxsGsCqp5WrTu6wezjsmC7bH5Uzzlc7scz0vd7cH/QI6
	K52PJIVFManGk6Is+uoCSGoisGFrM2dfvPu56JTGKFiONtZuWBjucncvuKdcl7rZWnY+ZZoh90e
	kIcXI4rMpUTSFyEqUzx54/DCyBszyVx+0UlApAS9g8DFqNUoYPvsyN7KeOEJf57PYFXUWT7dq7K
	FWeLWt/3xpxacUYz+TvPBUIxkvYb+R0hgYavnWEdYqPSsbSyKW/JY7AlSygCtJxdkoNvcTta3qe
	9c5CevqJpBUjbog4cD8l5UtpERdy7WX8bddKoBTT3bxcBEWfENUWgpT6F77lp3K/zFKbrV0tWTi
	2Vr+eiVjbYgotl
X-Received: by 2002:a05:620a:8906:b0:939:de6c:cb45 with SMTP id af79cd13be357-93ca980e5ccmr626384985a.47.1790815411412;
        Wed, 30 Sep 2026 17:43:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8906:b0:939:de6c:cb45 with SMTP id af79cd13be357-93ca980e5ccmr626381885a.47.1790815410920;
        Wed, 30 Sep 2026 17:43:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf047sm332884e87.76.2026.09.30.17.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:43:29 -0700 (PDT)
Date: Thu, 1 Oct 2026 03:43:28 +0300
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
Message-ID: <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
 <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
 <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
X-Proofpoint-GUID: h2z6IdzycYwEP_jusDXWA6o-cqaX7yiV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwMSBTYWx0ZWRfX8+Mrst/w3Mwn
 6H8JQ/1O192pHyufyJgID0Tb/40vg3UX4NZqF1A4HfdoJcXQarJVNFO5j0DVtDkUSBKK1AprfEd
 HvEit4yyj4BhNkDDTMAcZB3IG67lTnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwMSBTYWx0ZWRfX6AjfQLFlBZr3
 Ey+mfMHMp9hlblj1ywQsT31zRrZS8Ahm+MTx0Mash+ZNzQ8b02MLsMuj1tGZi/iEOnDd+x0QfKj
 JztkvZVeLyzbuvXttAB4ONLptMZnnlQHx3wnJhp9Cqc9oWcO2RwAQF8wBYohhLDEeOWgee4J8vO
 uxwhXUav7AEIKgVU+wcOefSTsxasRt70DClF48+ZzcTz5xtpli5MiKg70hEg1xgPd9yPgBNlS0R
 AVZe2UBosCEr8uROUtuIWS4Eu8FcO1UTUoKsDsO149jRK269ynEOTjrdpPM37JsJV8m63mkSpzJ
 f9jNGjvIiW4q0Fu7tR4ZpKeGk4Nin39/dV2JvUiDTkFTglzlpbqaaktGtOm8gayREOnhpDEG/uj
 d9qAPb9PyyPVUGxAG8CZzHdcSM5jnPvcYOd0JLZBiQAEV+B0DKB7lr+nlHB43zpxFajsnLX47RO
 jxIbSHee+VjBhCeW21w==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abdacb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=vnREMb7VAAAA:8
 a=VwQbUJbxAAAA:8 a=T0OYp5YwtksmxRz7AhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: h2z6IdzycYwEP_jusDXWA6o-cqaX7yiV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010001

On Wed, Sep 30, 2026 at 09:18:55PM +0200, Neil Armstrong wrote:
> On 9/30/26 21:04, Dmitry Baryshkov wrote:
> > On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
> > > On 9/30/26 09:44, Linus Walleij wrote:
> > > > On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > 
> > > > > This entire binding seems like stitching two devices together, which
> > > > > might be fine (I don't even remember this stuff... two months old) or
> > > > > might be artificial grouping of separate devices.
> > > > 
> > > > I think that's a good point and fair pushback.
> > > > 
> > > > Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> > > > https://www.youtube.com/watch?v=6tNGW8PoSzw
> > > > 
> > > > The current binding does not reflect the physical topology of the
> > > > actual device, and the bindings need improvements. I have a feeling
> > > > there is one display controller with two physical panels.
> > > 
> > > No there's really 2 controller and 2 separate panels, but they are not
> > > classic panel, they are a pair of panels+lens which are in front of
> > > the eyes which forms a single "image" for the brain, so they are
> > > technically a single display and requires to be hard synchronized.
> > 
> > Yes. However this approach makes it impossible to share the code between
> > the double-panel drivers and single-panel drivers. I think, that the
> > panel driver should still reference a single glass+DDIC, while letting
> > the DSI host driver to handle the bifurcation.
> 
> Yes, and no, it must really be considered as a "single panel driven by 2 identical controllers",
> and even this is really purely software implementation issue.

[...]


> > > Describing both panels into separate nodes would only be possible
> > > if we described a "VR display complex" nodes linked to both panels
> > > but this would probably be solved by actually describing the "display"
> > > linked to a DDIC controller and is out of subject for this serie,
> > > and can be added later when we properly define things.
> > 
> > I like the VR complex idea. In the end, you have two modes which you
> > most likely might want to support:
> > - L+R, having double-width CRTC scanning over a double-width framebuffer
> > - Mx2, having a single-width CRTC and a single-width framebuffer
> >    displaying the same picture to both eyes. I can imaging that knowing
> >    about L+R might be an explicit opt-in feature of the DRM interface.
> > 
> 
> This makes no sense to support both modes, and this will never be used,
> and anyway this is purely software implementation.
> 
> We're defining bindings here, describing the real reality, not hypothetical
> situation that will never happen.

Let's ignore software issues. On the hardware side, you have two
distinct DSI panels, each having its own set of controls, own DSI link
and own backlight control. 

-- 
With best wishes
Dmitry
