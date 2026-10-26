Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010024;
	b=foeLSHIHbeDDMSWSf6RxnI/Gvqv/oVbpraJOIUll7SvSDekLORLsuKpLv8Qx2MunzHfO
	 Hbx7EPgnDt1hiUm9qPZAaoepeUB8479hXzfcXCkBWdMt/UkhZHB1ybABFEYp9cA4GcMrO
	 MfDGdmQG4fugcijYWOG2KtlpEbLQsNyGSxGMwjEo657KJol7bEeufuJ7zM5FdBnVxCkXg
	 6FYNqhvQoepyzfvGFMSPafujO+RW0g+0NwRFFxY/8yNFWz7wdgaCWSo5ojaxtAbYTzksJ
	 zlRyPe8kA77uTJ3KXOLsIWuFMQtUGEIVIDdiFA0lNaGyWScrbBa3i8RYZvW8CQgysTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
	b=NdpRzMkkidQnxfqAAMs13WGeeV3/OVkwdj13+eMGJzHDi/clPrjtzsQiEFlWlKxTYshl
	 VrIiNWb31AQjfg0SD9DDizRxlLJhxkwwFitVK56vTYQWHDiwZ/d7ZcHmeAHIeVZZARBmh
	 qMqISlcs4ElI5QdTd+xa9Z2+2sSUMJ143wefMKgXEjj9pAlpZuYDWy2b6xDiBBu0ikCuh
	 xVj33MPXris+hRhtp9JBjyokYWjXpgGAY34h9xefM9PIO7adU5KEHsMW76iB/2G2oiTBL
	 N7nLnfWwSH+R2xdY4yZhI2R0JuGDralaFvun5Pd2itV7oRnQaSOFjnVRoFibSihYBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBa5R6DO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo7kzBOn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56EF60A2608
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56EF60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBa5R6DO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo7kzBOn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPq72222520
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=; b=WBa5R6DOTbjnjhg6
	oR+yaDocepQyyKbFvCO8gL6By+UFGT9Xohprkgdmh7jPeGBhZAFyjKNzaOkuOypT
	ygzkq3W3+P2AB2eBq0ri/8gOaObnxIJZbgBCgl7T4MBG7s6FV7bY0VSnSZwv4NF5
	binG9KB7KqKnNomvsStayo0oaocFxa7jCR/BVD064JVSxlhcVi8cKS7vvnu6EY4b
	GSN0Ee60XYevX2wC0LUHkZQfp40FkLpgI0o0Sc4KPoXwqP332NqnWvsKeTPSH/8/
	WX6l2wAtYXEdbplrkbwhypaNUQBMopXZofmInDGYDmvKKslYj1LcLb9bEiebykoC
	v9AuwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9ngu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:20:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so639181985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010017; x=1793614817; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
        b=Eo7kzBOnfE9nj63lRNDeCCx/2zXQFBWATqVXNDJtVg8QO6LhuD77GnKlHOK5qR7+FW
         zEnJLaXV/a+ZY4Icw+89xbU8kL+VE/m0ekQPMs5EqdZrHWtTg0eKU5CsT1ttJkSc9FEq
         vgzsACxbydYauiPvBIs/ckmV/cyDCtrHGwWyqAFCNBiTS+pg/5DvxTc7WA1gxFAQrW9q
         LuBYohScr4/tNL5jtR+rJw1lrUNsDgOqVsLLvU5NpvALrYefxpAAT7PtSZrtbU42I6Id
         3uoF5IF8LKT1UZtcln7W9ObN/ANLHh3ftaIHR2RW33xII/o/FlvfAajCjHettkpma48D
         uy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010017; x=1793614817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
        b=JW2D+6hy3mrZO9j8DWlcPiHKK/kdwVCSSC/ohg+PLXvSUE/3TP/usLe/VbXlIMJeyw
         cv7b2TZXwjMkKzIlXm74tj3YnejSGlG2OVSUqalLQB6a32faAeX1eASl3qsEOCmhkd5Z
         T1IiCX5m8wx9M161xk/e5MjhYtTjFBozRGpuIZHFD33dRNbL22JHafWNxchykSqQQQR0
         u6YpExT7U0qP2W0oPGD38mCAPDQNhf7la6wpXaR9FH4G0z0jokIi/nTa5goYbLcicNRF
         bemIqlyFHGAFK7hhXoHLQpGxQE2Jik5iII4booRZVFeDCCe/IIjRXK4r/5ukYInjC9nh
         VP6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2fQtgvar+UVnGEUXkWipRMM7TCfnXQSQki2CchGVWEMlwlR8XqLqXdf7WibpSwlv8TRlF3OV+WHn5iv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1jXNG12BYOyFDT13QAFpLiorUKx7FoY7DgWnZUysRzHrEq9Xr
	sm5XCZMG3hEFZRCwVjw7dLbCztofGr6lDN/CaL7/4OfhNpPnCN64oqLb2j/e3br3i7sbAGrkKc0
	5nwh984ZrkUI9kXMrxT6xELwiVG/vOm0fPg0l0Kf+p1ugBviNBgeX/dZXQlIbEA3V8Fw=
X-Gm-Gg: AYBFou2sQqZUByANzlMCYjL7YI5NScOy8iJxw0T9gq4faYYi86h8OtJB2AWJv4VF32x
	fbX3fU/uJq8T4olPPVr6q9Q4kN49v2M6IYwFejbWgW6gY75Izt+wpOuuldVFWqVcEqUSR4niuQq
	XTG8evT/s3VGUxmnR3q5P+aeszpn8qME1/hEofMbj0xhPDR2aDArqaqtAMtKi9DEaQSOzxJigj+
	ERF2kUiDzERgVN7uLaZN084tuNITzTlstAzNnAFV4mXObAv/NB96dLxLAdZ5u/zcaxRAScflGLl
	xxe/uKBdQ2sNUyhtCXdPPJV8tBsXg0XxhgpChKYBb1mnu+LsfNLDRP7ZWLTrYsKcElEG6OnR2pX
	zODdlshxBkAD8IOlUWSGpEoNqgoyQDsBjE77fWh/mNxmYhiugZoNemypn4yqv6mLkk9fbxskZFx
	77MHFBDwIAptmV
X-Received: by 2002:a05:620a:4002:b0:93e:910c:5fbd with SMTP id af79cd13be357-940ef9a6dabmr876605585a.63.1793010017171;
        Mon, 26 Oct 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93e:910c:5fbd with SMTP id af79cd13be357-940ef9a6dabmr876600685a.63.1793010016682;
        Mon, 26 Oct 2026 03:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6ac6asm1437302e87.22.2026.10.26.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:20:15 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:20:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
Message-ID: <vd6e7jr4ciipj6ork5i36att6bamm4gpzxjdeqoqof3rdj2m4q@rtg7jop2bfwf>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
 <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
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
In-Reply-To: <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JkFXAy2WTnkNvvlZGpmuafZXHpSnhcif
X-Proofpoint-GUID: JkFXAy2WTnkNvvlZGpmuafZXHpSnhcif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX8yTk6w+7H/Rb
 VCU9tVDnswYdijhnuZMmR8x1/DGPncJrQS2GGFBLLpbntTMFbDvOztx/vjcGCs/rpiGcM9R9AG9
 pWbDWqZhUiVyJ3HDc0fuvia+8pvmIyEKVJjIsonBoEyxuMEqBY5KYsjg8p2FW4aL/JQiN+XjFtj
 QSJE0bN+ftOQ/XvEYBJ6eQVcId8mJ51DrXVMkure3qQNYurkrW159yUcpT1FT1IQXTyV6ccvlYM
 QVoExjFjsSFhb6upLWUoQQFHB4M2v77zMlgKUo8rOknJPzBnpbMOf+tTw08bKzY3QcWGjxUuoow
 LyYMi659yWtmg4iO10n37yJNxpCYXBqxBELDNefn2gCR/Yw17PIo4D9nlH/gkUrDt2qG8kZ7wfI
 3hXDOJ/xpVWdppIUP7OVM8ClZRzDP9Puz0tBpN/PRxxNOPuBxKiZLiLK+ytkCZd/jVHXCRdbqCT
 l4AoChlA9YHe89hip8A==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf2961 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=XPLrJM8uNFvCFI0Cpc4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX4AE6P5D9MwYJ
 KelWV3aGweDidRLuZTij7w+TXfrSwuOmg3dqkXfO5onkLZNRjy/X7UhWwTSZScDgjq909n2t03M
 ZefEUygoGqBA2DJ9k9/HdcMX5nuCp9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On Fri, Oct 23, 2026 at 01:42:43PM +0530, Jayant Shekhar wrote:
> 
> On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> > On 15/10/2026 09:38, Jayant Shekhar wrote:
> > > The DCP firmware exposes display resources through capabilities rather than
> > > through host-visible display registers. The MSM DRM backend therefore needs
> > > to build its KMS objects from the firmware capabilities and device-tree
> > > display graph.
> > > 
> > > Complete DCP KMS registration, including power and IOMMU integration,
> > > capability handling, display-graph parsing, and creation of DRM planes,
> > > CRTCs, encoders, bridges, and connectors.
> > > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > 
> > Your tag is the last one.
> 
> Sure, but I notice there are checkpatch errors, should we keep this or
> remove?

Read the docs?

> 
>   ● env: :3: WARNING: Non-standard signature: Assisted-by:
>   ● env: :3: ERROR: Unrecognized email address: 'LLM'
> 
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry
