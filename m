Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB202264A7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346966; cv=none; b=VMHMHy58cLz6RGIztJZ4ODpz4Klqu8xDXlv+uUwbNRkFi1rwfMjDyHDmf2UIyj54bq7rV/akmmSEAxDp0Nw1kC7m7PzqgzY3IHpkQeiAnzXgyMMaUqAiZB/QoIu1Y9AZxjbnr3c5GLZzjvAgH248uj9e1sXLsCXFzwEt/NlocQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346966; c=relaxed/simple;
	bh=3cjKVHWORn6ZGEgvMZDwA2bF2hSojbqa1BIxYtZnTmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3iMYVstDZd0A9X4tOYnVDZUa+77644zQvxapHQNfZpi277vfKqqgYxJ/oYV54Oa/IOg8r80Y6O5hSrjhrDY+mShohqEteKLKaOk9Nowje0HDKkKsRD9fD4i94Pye0ZSIkSGepOd1dG1uWM/z5ZZNBKPG33V4iyXVI2W+52vPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivwwbir1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkg44NFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivwwbir1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkg44NFq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E067BK1920452
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8NmfChnxo2IRmwbHnf/kQA3C
	nLeLHIcwhqHWKX+NDPw=; b=ivwwbir1QmoA/WcQUVtfLIY86ofLq1SXvX4BIJup
	0ul2sFFHAp+KiiXI2i705dfQgd4SWlF+RzFaBWlXmf1e5w81EsS8PYPdGH3pr03R
	kDNS6f680wt6BR9ISGBekyLJz66JImkhtvYeh/zWNjZrV9waXTexM+3RtA52CNqY
	rGhxFuv/qE1NmlZyftgQPhqWGzq8CidVnRnoHTc5pYzBUCTx17AnwdRxSnR4YMBy
	GM+xdSOkv7zD9SuGigzd2Y6F5G8EbIyW3bn1rlcr+YlA0dkwoe15fnZ3ClIysVoJ
	p43qKCC0Ce9yWmmtNZf80BX16++RtFkSPJaHI0fHj5TXIQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh4aqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:49:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb8d1b032so169716241.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346963; x=1789951763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8NmfChnxo2IRmwbHnf/kQA3CnLeLHIcwhqHWKX+NDPw=;
        b=kkg44NFq5BdL2/CIFThDGNY7PFGS+HJq6vEJYei0XxAdStLI5ouog8TUdab40Ri5be
         8CrLBZbyQz0smpAvHGesqUgBMBXRV8/vOrbBPDpgvWVr4c/1iX75OaduzTQknMUzscob
         7yUSgKWTieOFUqtuoakTbpnbymZZRsuHnlAN/XLBKXz38wtrCzAkZ5ZCPPlZycnYjkvL
         7m4PMC/nX4b8TqVeQ04k0fiPNXbiEJx4kPzEkKeQzg46p5wxdfUCKmk3RA4hPOCuEUFd
         JW3dgKelAEAFePfBL/Z7uOXuHPN4xpMZXrkPi07yBYqRTFqxPpnxMYB7olpdTO/CFp1z
         s8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346963; x=1789951763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NmfChnxo2IRmwbHnf/kQA3CnLeLHIcwhqHWKX+NDPw=;
        b=by6mUsUNhgLwb2IwDwb4XOYOjKml166hqGplBuoCVCnxdVBS2WwmES4yUVGsDAa4hl
         lDLvP3EykytJTDtETGTN6mCVxXH76sa5gFUrGA4fzy/K3eQEVHJlfZybT2lrf2IZBldu
         a1zVyzQ66qLXfeTuR8MFfaB2U0RO6apxG411MZ2dk51BQhXZbgq+b4VBErMDef6lJBBM
         cnFPP//RFH479l2+tnf5zrFa+oo2oIU3bS0mCM6zuaOxcCTPmWN9yGKD5PhftSIrcd9v
         kdF+Mlxt39CkMaYHo6Zp0V4JkUxG9rOq0fCICmiUePQRZvj7xRn1ZxGEnK4igkETLIU4
         HOsw==
X-Forwarded-Encrypted: i=1; AKwUvByEYWmZ1ugPwmFgbj/fHWB+ecRrqKNKcsFLh1TZ+vVKdEXI8mu1pGNoGT2bqjlKcylVAKvwMJdphlwCCFA=@vger.kernel.org
X-Gm-Message-State: AFuF++mhQaW3WH5qh29NQSff08eFnzOQ42+3F703EQQ5rCOVUuBWWd5o
	L/aeOCTSXJVmpsrKAd1izruIz3avqPG1o3yi0HtDUwMGAxHModdIioMAZrRplL6W4mJsFeNBR+O
	4o8WUHDYzon3u3HnRO5NJAgJKPzFh3HSBXtjIcnb9G6SMhHu5Jcr44UVa1zR78XVAPmw=
X-Gm-Gg: AYBFou13fiI0eDQso5H1izEPw16IK7XIqxHfKMsSNp2i2JXVbcUsnCvnnKsHCePEWrU
	t0+wz/q9rp874uWxdIRnFhCymPmHww4l+tmbPCG6eOsptr8IQ3g1LNEXBSTCNzDYd/6xkY3QAo9
	VmVXmJ42sVoeW6WomgZmDS9ZF1DLpc4ECq0bf1RXFYGeGjca1CNRl/2XWiVZ143qY1RRtuZSsTF
	1hlNI7R7plqJoiFOp4P7mvDGgV5WOsLzbcGb/GA4LOliEnQ13pury+w+mq6clpJBzZfwyPSmUnI
	CTPfWQHF740jdKsOsLzHvMrDkriaTIqYTsACSFoXB+J9/N/dUBaYUGDGqD4vIZED4MTxzo7tTAe
	JFlze8lVRg5cmMcGdacfaAOPY3S//uLUrDLEOXNBtTSQ/i/I6Fua4JfzioL5iepE5h2A2i36O0Q
	LYVqaJCgqgGhpH
X-Received: by 2002:a05:6102:5f07:b0:79b:3059:5a75 with SMTP id ada2fe7eead31-79b56efc485mr108141137.2.1789346962776;
        Sun, 13 Sep 2026 17:49:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:79b:3059:5a75 with SMTP id ada2fe7eead31-79b56efc485mr108121137.2.1789346962362;
        Sun, 13 Sep 2026 17:49:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0457189sm1977356e87.25.2026.09.13.17.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:49:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:49:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without
 name
Message-ID: <cnazznrbqwprv753cmzhevttegxhhkkamsfvullaullyo7jjwv@75lksywtfhmh>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-GUID: eTq9AqrRyEf9S2VQF8_J3Q4Wj2mQEqml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXyFgsavNZ9LpD
 +OWJjXFhu7osAxLQDAcp2/WObK/vbKAEczKMOnQYuaOiXxhRpFDypiBTk4L2MSWehC71sizkXOR
 VPXPuYgK+1KNvjwFD68NBtkFHkH856qqmguW2sZ4Lu7Y19QmRlAS295zwAYHwHIK6t7cewlcvL5
 AZJod1/ZapkHAwR81KRN6FftbZE0YS/MIa9n8QWJUW25ocTb1vVMpYC6acRdKm8oV3KP06mWgri
 wbYqnVLax8Rz32Ytyw9llG3I/WgoJR7reCPq+UebJM3dfc/nMrvzGSOdUQZC8wpN5lvWykjZaDT
 ZQoBxJHUydPxD4BV3h/b8vFtfj9T4dRWOZ2XOW+B2XS2R2b9TAQbGYL7w1+TXLxM5aOeu8NgRJI
 nwPL5yz2g5USUE7lNlPzu+ZHp/6l98Y9Yn6tH71dSLp0daBy6NiQuzAb1oBtPeifXHf24XXBjaU
 KIXu+Mtgxwblw7npP4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXzmPgOktJeFCt
 lUgsvoqdTFJqUJ6OYc0OyJxBZDOx0bJyDfGiaMRhh4PpR3EZD+SdQ4Pkrcn2U6SxZbe2i6igR20
 KcxtmzbRaJvXT2dNw7wDbT98+8/dg4Q=
X-Proofpoint-ORIG-GUID: eTq9AqrRyEf9S2VQF8_J3Q4Wj2mQEqml
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa74493 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=sfZjJuiDFS-vDwBeDzYA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:38PM +0200, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
