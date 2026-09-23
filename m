Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD84A92FA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165481; cv=none; b=kw9hvGutB8MWhyEzNY1aJj6Z8V9pVqXdJWOpcdfFBO0MgnNwc7pwch2rPBXzED5JpyOEOL8o8nqr2+hVLf2fN5dORiE5ycj8XcEihqs7yRh4JWfbThERZuVcGgtBmJII9YWC9d/gEvFSTjPxIkgvOkQTJsKY+ifW7gKXvKH3snA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165481; c=relaxed/simple;
	bh=huFl7zPpoNDi3ZejUCdFgfxAsa+ZPgCrVcmlJh38yNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJp+fcsFC+3sD5BbQ1KojO9PZ++LiSiSgHQaa4e7hEHRlt+eI7B3D4DJcgbPBI/vEUZj6GbVfWiSzgNVm7eH1+yeC22K0F9ugas2qjK/ZekANq0k2o43ZUhqlGa8holEM6JM5u8yJ131Xp3WdzpWMpvD2p9ifkkdplhaBp7Rm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCOGI/Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnQNvrtz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCOGI/Nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnQNvrtz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbXKt3028019
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8A0MKVbKWmnlKbzQw920PSpP
	eoOO0tpdgW2Ug9tAy0I=; b=SCOGI/NfAWRAzhh7yBTj8bqPb5Iyp90UuKn+E4DO
	6Fwcdm1hrjLMfKkZb9S5sRywkXQpkV5FzrE7gpGfK8U2FxZ5AGTn7FOcPQI+q1vZ
	3EOpN/KXOlzGso2YnsPnrk2cE2Oc6ptH7Ok3wcT8M0e2doxQ4niTbsAXP+gVkL0D
	L+6gueUd9RDWgJwOkLsL85fjblNDciYggzKkTLY76kiPoWTFgiVTXwRcDRJpYSDB
	csPZ5Nt8SCgXjVAn06+3O6eiydCq1+xgqLDBxfJ7uAOuv6+xUb4XdPOs95GeGADh
	ZIln7ZkzAW8FgFSFSySNrKi/aRbIg2L/38ZLMmGQWOM1QQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarqbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:11:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e8d95121cso227552241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165476; x=1790770276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8A0MKVbKWmnlKbzQw920PSpPeoOO0tpdgW2Ug9tAy0I=;
        b=TnQNvrtzjDaIp+lZ7Y4/sPCbnqiL69QRShXcLefFpYQ49rnB/TxsSvABleVnfwagNl
         BzSW+2XfVcNzMVtfDYHvgQ8GCBEF0GTUyoy2plUzihuPy/yXFJzX9AM/J/aLDwamk4KX
         lf6QK+ygFITHGdXToGiO7eQzr4GlV6v8CtZ1iM+ApS8crvvXpMRnAmiX60WTz/PiZvL+
         o9o7SExbc/A+rSUA8Utd7CINWJpTdZJT74ntQM1E0i6oRGTgLYty8DaGAXZhkjl3dO3U
         ij8XlH79psRtMfMa4UQruKxVpX3K5Z3LsZTJrzCSzzRNuSLBNzuc1X8WjZ/VG9sWbQK/
         weKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165476; x=1790770276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8A0MKVbKWmnlKbzQw920PSpPeoOO0tpdgW2Ug9tAy0I=;
        b=PO8YxLZvrtq0yggx5DSPjdSEZg6xNt0axf45FaZxPYFyu6a57FfCz0UJUcXQkLjc3W
         OEcxCiTD29WBn8gwYoycCtrZ7755tPTPGCpBxZ1eOx36cidcVjLdZHSYTbRegMPQWw9x
         YUJXbQ+uQScKUapB3JZ3zxSS0c94t8CB10qbk3RnKOqH5Z9vQydiKHi9pNSefYQWpYNa
         hy2ed3vSQntChEWCLA8IbdVFedqJVqXaOSZod8DuJHSsh8VcwqbIhIP0ANsDi2S+ePL5
         93SNMdsm9e7wcn+6a/NpqN68IMW3BLcGVMQG3fjuND4kMTKbSg6uYWkQnr7gCQDjVK9b
         lyyg==
X-Forwarded-Encrypted: i=1; AKwUvBxdJfjU8+rEFoQ4pZ+71aSWavvm1aAbzzoYk07yGzBsn67hMamUNMtpiE4TGiCCTBlWj6HTo9P57g1+gSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ktBINu0LQTHPXpds3+EmGpWWJT8BS8GgtHVoRvThVyoj7+qPzn
	soE4j130z+YxAhOn6+oV28QLeexd8gTq2Z99CdDWJM4GtGWvxJBi2EWjMpUlupanNyFjbsmjGoR
	RjouDFwEZCwmhzqRN3qjyTOXEow2uKpDPCz8O1LwI3zHyHeHT9qTzmOES88Ar6FpGy5Y=
X-Gm-Gg: AYBFou2ORGUEs8yeOrC+kgO1vSfkcAjPLSYn1caLFMBgEwmW2YCTbDAAgpRULAF/F1U
	1pLJbaowkpXdsMCq7Hh75nMadPMUkEu5MGKRF1LZLc/uYd66q4m7+8k46M7vbGKVdid2e7q8cl1
	QptJKzRscPPd5QZZkZgUFezMPQEvtsXM3PNdqzNoOL2u1A56q5iDi5vkFRR23u/W/wm3Uy+d0F4
	rslBWK+V4STIfvOKGywPm/HxzejgN/cAtbvMVaAKizpvIAg4hoIvZz9KczgIkVKS2o61Fo1zj89
	uYC5rveU20gFMM0JbtqhFrccYNZqpued0QgpwZKbC8WUxsunVRe7mZ/ZUOoeHSx1rvCHZ50uIsK
	9GdDBL7jGqfHyyu3sVeLDzGFZVmC3n8f6MB/NQZbb6HJkxGEjn/8BivxaE5KBL15ijY1Qoep3bQ
	jnlclIBOqEDvWL
X-Received: by 2002:a05:6102:2c82:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7ac1ea99e8fmr1676844137.36.1790165475572;
        Wed, 23 Sep 2026 05:11:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2c82:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7ac1ea99e8fmr1676817137.36.1790165475048;
        Wed, 23 Sep 2026 05:11:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8590237sm555422e87.69.2026.09.23.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:11:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:11:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
Message-ID: <yfpkgdcf3c366giiec6p4bjoutwepvtkjf3yushbgzeqe4uygw@pnddu3mbsmlb>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX3pIlP7lOlYtD
 QylKpgA8zzm+GTBhQ9FdavjZF9G+0na4MJfxEQRWR6/7ZuZOTD8r9y8SAGEmzuwd19zczCqyVAd
 PFZJ4VoJ3WpIjkR08jeSBiD/9ph3TNr0QJuKb6RgtuCdwBzjonSxa51gnlY4CYtOEzBCSv2dpE4
 /VeGgRUA1kpPmCNHuLO5ogpztAQjXcpVv6ixwh7f6frjZGtOIR0WAOpjAiQMUnBOfXnQam8emr3
 yTs07Ncsz49dCkHq/VtJa9fcOJIMBDcujI96GeGa6KcMgz4P/8eh4I8UeHDtf0BGm+ESZR0ZTjg
 wzM4NUjJ/Fnz5wCBFbeGzuzM6+mzK6FyzOiY+tqAOOw+t1NpEOBnTEsA2P4yqA7EgZu+19KH2id
 78Vkz5xD/mBjrZl5yICgbWJ0ydvbjHWuYDqbXJzIgJhBFp43ryl2iuCUp85VvzL4blCF9/hEb1P
 mRjYrQG92z5eDWlb+Mw==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3c1e4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=YJv5aonfaXPMDC4gfg4A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: _sF19w0Vl9fRjxJWVdLWdVolNkCdg--8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX/y3/may+WXZE
 ev99VU/uiCzXxqnZ7T1Gq1RKLIf6YjmfOBxtkRaO+5cHvCvWfVkSDmDtCifRDgKHV9cOc9tY5X0
 s/e5rVayNIiQs+CfWxwH8MFBeMmTIT8=
X-Proofpoint-ORIG-GUID: _sF19w0Vl9fRjxJWVdLWdVolNkCdg--8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 03:55:41PM +0530, Akhil P Oommen wrote:
> Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
> votes above the perfmode_bw threshold, similar to the A7x GPUs.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 8 ++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
