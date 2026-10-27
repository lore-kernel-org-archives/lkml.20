Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098641;
	b=BR4oMtqOxrYc2SA9LxHRZeM11nmfl9Inb7WdEQr5Hsp90otb8pDje02caccLrSnOYNKK
	 TMeMVp1cUAJya2nN5GGKuWMaBurH0evIx1fbxTCVy2GMcOOJ9QY9tgi+61fThBaG6yszl
	 61YuvLoVe46OxTZQFNjHX9QAQCe138xTmGUOw91F//ncmMbzEBDuUCmTrgLQQnBMu7y/m
	 4VJfmY5dl3hamazg0RqggLdvsjqSe7itTk50EhQK+5EDtv8b9KKBrYTM/IvaXuSCWDnir
	 0yCL1vwiBeAV6wyCV+znRU4F3fbQ6Z9lSlOutYTOwhtOcL4qnqPrZ0ur+RmyZB82CQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098641;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6Xs7gTw0KvqYciU+Kau1HiI8SAmkgSoonHql5kcru7s=;
	b=4rKI4Onl0OGU9o/pbU6esm+2n7/fdTm3h09xQ+ew9Ams8HtVPytckr9c78jbTAxr5X2E
	 VrHpXtkbFXgSZX++ipP+kiDDg/qn1ja8N7eyvkBr6uldpNN5Dchtr6B95uePqWdVoGcj4
	 OnaFeFG/J1MDhdgPaL5qQMK8GZ44lJgEL3tUe5X9GzeehqmPAEwtkQcHsLokvUQgTRbsB
	 nlzakrqpoS/LkMWrSqFnLa0C2ZYMgGdgWGv8WIWIVWyaH06HVmwrufqQCDJIub6p5pz/T
	 qLySNeBoNj5tfcvd4fLyRWFp8/zEcLC0v2oDclwitIhxduYQpUfNEqn91ysOjeCkfJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k1/6mUXN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Le4gKRQS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA3C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1/6mUXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Le4gKRQS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxXb2523923
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Xs7gTw0KvqYciU+Kau1HiI8
	SAmkgSoonHql5kcru7s=; b=k1/6mUXNIgFhNYWqNZoqANg+0ig/u1xWRNSyuVej
	XRQar8CaJAP3chXDH4ger/M175PrTQbAFr256q7GkNvpfPKxJChrwSkwzp5LbOre
	dM2gZZaL7Fcoyfz5snUxxFYGRAIFH3R42Chio1Zan72Agh+9L7yIyaJhEc2GNHHT
	fSVY1fArNbdhpdI1VeKWrCNmRICZzqSaohodEZOFwAlV/e/W7oOZ0L9buVdCZYOm
	97EdESnmayAtt8801jagnQ7drcjxqyEZNKTwPVHBlxuJvY8uxSQ4QaxnzooghZ4N
	dJGDoi9NTZ6jCYMNBlg6DCQFiz8JqNYYsznBsWNI+cPH+Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20qbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:57:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86f102230eeso430035b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098634; x=1793703434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Xs7gTw0KvqYciU+Kau1HiI8SAmkgSoonHql5kcru7s=;
        b=Le4gKRQSBUQNovSdMhiUYb/cQXUdOu6az5LxovQhe4/RG5JWqcr6+kelfTnsSlPSJO
         rt+X/k4zpiUgUNyLFRPwiPeITbnDLT++rinblRQ3iAp2FZ8pNpeSzG67tQ7dcRvgIAIg
         uUGTX0//91ksmuItHJWjc+gOmWm1GtQ+XPoG8i+jb1i1poxutOJrLS8EGP53zGEKutiR
         xRhHlSZbtJJx1znYNXyofZZLedhPqrz8TQn7/Q5QnNZ72bca19DCu1LJy3DAz5V0Uz5t
         f8aAtdL1YBEjs45FfB9HmLk8bG/jou3jf3MN3s3KehbOD9dVMhcFWJY84/N9q3nEwFCU
         DYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098634; x=1793703434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Xs7gTw0KvqYciU+Kau1HiI8SAmkgSoonHql5kcru7s=;
        b=oyTCnO3N7L/NzvhLksmdfDDCAXTzyWDQxtP+3z/rJqmDON+rQr/8nrhGpymu0WS/Sb
         CQpGhhRco+evLG6mTWx/CBKSboj0vdeLiik19GVuVZcwlMsY16PXrRi1M3yMOKxqRgou
         hWQsF8lRtt+Pu5EmGuOjQNE48nUbi2rf6n7ZhCxMwP5topS7ddT7eJUINIVUV1+sborP
         fgLTru6YX6AUo4QFKLzLHGwOjSHaG2kpyi2L8u5mUg4wluXcGlDM20KslV2LwgcPOEs2
         5hcvvVVAKnt++lY+e2GIYN3nCdy9ckT5b+Shg09v1u0oTREbgb+HuzJ1qDtkQE2v22H0
         M26w==
X-Forwarded-Encrypted: i=1; AKwUvBxJepvcHwRT3QmuEq/i+3CAh0UFd/ldIaTM0gqfAOo7lrqoR8termhVurNfnHPRKGm3FQtH1dkmgcXZ7Sk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCJ4l51mUsLv6BDlB1oJ4Ynuo1gr7pYEfJrA9CWK2HfUuI1/sq
	GHO3EGs/BPiBIIczvIt/Qm6sItqYJZSHiUp52DqNge7AhmqCvfo7PLZrfdt1o+pETy1at+canqX
	gYUSB68ABQ0HN6T0GNhIHTLSWatRD4tSzHDRp2p0EvrdAMdvMA5CVSd0bYv+lqVS/Bec=
X-Gm-Gg: AYBFou3SRdbV0o7brL0sg/KB/X0MAmamzRdWQ/VgoUPPJ4iBPgE3OKhcvuWPW4dfIo6
	XowDVJLBJ5jy2MaAkIRHMSA9y1X6Vd3Id4W3HFgUx/+os8uwJ5/iy1rMXYLDsm+EkUvTdED/M/Q
	UoQ0k1gTf97WS2s9F9bc5ayGDmesHZ8gmTdMHbq38ILTW46wOsGbG2V6M2VHymd0UoTPysjNMQU
	qwWMoiukwqrmbMrZHCPL1C6I0YL1pVPbff6HYlFFAOj3e11I1Lc1jMZfBl+9gUScZ+YqBsBGbId
	2GvN+ByiTjc/Pqvl0vjR0ZHUSSkwXLsoQFjZL6+vN/veyaq6ui3rXE23aY/5I/HOU8bfFqfwf0L
	MUawhSDsXt4TQpYAgmCyRQoKOnUZpFbKs+wfnIrtUKiqxrhZBPoSfUJ6n+92pPcC78stSIi181L
	KqXHQY5C9iNnEmCPet0y87dh+ZmeJDMYGMLqYSfr2E6KbxI2o5In8y
X-Received: by 2002:a05:6a00:348d:b0:8a5:866d:d5b with SMTP id d2e1a72fcca58-8a5866d0dcamr9445081b3a.1.1793098633658;
        Tue, 27 Oct 2026 03:57:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:348d:b0:8a5:866d:d5b with SMTP id d2e1a72fcca58-8a5866d0dcamr9445059b3a.1.1793098633216;
        Tue, 27 Oct 2026 03:57:13 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm2190344b3a.44.2026.10.27.03.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:57:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:27:05 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Message-ID: <auCDgewe04WKbamD@hu-vishsain-blr.qualcomm.com>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
 <20261027-fantastic-benevolent-boobook-272a9a@quoll>
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
In-Reply-To: <20261027-fantastic-benevolent-boobook-272a9a@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX07GtjfuuXKyq
 tmlyFT6fRA5Gqy5oFEXsRuKdU7MJSe2Gd3r5o6WPFhqd7Ulc8LGt05CDCq7cSs/sfoMe9sOJI6L
 afqvaQq2fYf77T4INDAunZTgdFV4X4cZN8zNddIsp47sur3g4WY5br14JhWpTItDOxH9tKusqf0
 981jOivis5A2UWKSwdUuAR+/G45Stu289Xdr4iih9XDr6xpGfDiSOwQaihZPLFr/7sk8r/bu7Kx
 eCFc/svaGpAWsFl/9Zku9nmuixynBMGViXUegVTyKfp5Q1mdBFfYIz6MQkOPtqe0H/c8Ztdq6n1
 fD45IPDmTXTBx4gB3n5TJ2N+z2AUzmFojRtRZr1g7VFLAVV8kUabd2cbeLskx/ouF5Y94eUxB7+
 D8nMzAXGFU6hpZN6DuOJz7bIKOLXTyG29It/4PCguXxwZFjXgmPKj6ErP515wjfNPo4gBytR3Ri
 OwVTnOW0pmRBAvS4BMw==
X-Proofpoint-GUID: y8-3OL5DgTG56sqnQj7QqVfOGWorHtMd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX1/Uf9wrH1u07
 rTUOa244/Zwi1FGbTuIz89nIGUj+5GRsR/jEXjMVSwo36Fjj4Z+pL/JrgB2lFWfPqET5Ofi1Arg
 VIfgSoZ3CY6y5bbLyPPnOJHJICDs8uc=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0838a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a2tH-4IN5IZEDPfwvVoA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: y8-3OL5DgTG56sqnQj7QqVfOGWorHtMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On Tue, Oct 27, 2026 at 09:12:27AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Oct 25, 2026 at 12:18:17PM +0530, Vishnu Saini wrote:
> > The DLC0697 panel is lit by a separate backlight device, which is
> > referenced from the panel node through the common 'backlight'
> > property.
> > 
> > Declare 'backlight: true' so the property is explicitly allowed by the
> > schema.
> 
> Why do you need to explicitly allow it? Since when?
> 
> I see no benefit of this patch and commit msg does not explain me what
> that benefit would be.
It is required for below DLC panel, when enabling backlight using gpio-backlight driver,
Apologies, missed to add this in dependency there.
https://lore.kernel.org/all/20261021-shikra_display_overlays-v1-2-adaea735999f@oss.qualcomm.com/
> Best regards,
> Krzysztof
> 
