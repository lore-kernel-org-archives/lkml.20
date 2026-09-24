Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56743E8323
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242772; cv=none; b=UlftGLcNe/x2/V+4pyqzTKNsVgBZpXl1B8RopEnv3kCGBzijYb/0RPhNNtqUiKamd/TBSMckI7hVVkD1epPR6cucjIuneYPjNHPB+BZ+w+0Rzuod30q0exjxPF5R91EgQkMljlG1/KZQHvDEJLK1poexSMG/72dd4gY8AthXqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242772; c=relaxed/simple;
	bh=o43mUDqE5BdB0tF7FP0+xJSK7S34crz7c3l8Biqeqh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQ8G4TEkaQN2IPiX3F9Tb4se+JihLaazTAVBPlDCmMOqvsI+xl8Vw1e/z+g/Otc0BdeOfA4OB0Xs60zKVzKdka9DZfIMr59fyj7gBL5aTENve+e89gtnfEyNhB5S3cxdZjH4jNqGg0h1nbAv/iSyYnNhmsjBMXcpLs9BS2TPF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHzo38+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mo9G6Io2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHzo38+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mo9G6Io2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PhRm1270223
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jp2raTZUtG3uHXnDsMOnQNob
	40yCM+rjrGHtABixf7U=; b=HHzo38+Yvvx1CtiPUoWwqH7SZOCPaKF7K/NjyTNn
	AOeCQS3JLWILkv22Rqejws/tnQ/G8mXEy/apOwZice+rxhV2H3P4LkvwUqWnFIeH
	44Nrj30f9JLVkpKf83UqbdRZjcssolY5yikzaBdkYqUGs8Rm5Zf+AsOxd6fhm8+0
	QF7uOnIeivRC0vH9J0xlceVHjP7sVVN+wXTbP8PZTzPwNj/TjYufBlUbFfpwWqOA
	fswapZ2W0HICXTj2+jPb7n+zB3jjdU436fPoSFj2t/tustL/6cuLZ+4l2rBjmt4M
	Gc4px/L0O7JCdmESlJm5Rh6CGj/vD2DbRpycBSsUd0d6VA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90a4sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:39:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-333543ac378so2193739eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790242760; x=1790847560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jp2raTZUtG3uHXnDsMOnQNob40yCM+rjrGHtABixf7U=;
        b=Mo9G6Io23gj6csjIccOvlo32gd1FboQVxomybq/nyZs08kbbEJaeJunrhlx6BsNAur
         PFcOPIy0O5Rctz/tlQM1MJLZs9j04q7LHf3P4gh3EkL9EZw10SqIukUjcsUbXLjwgOHP
         zsTizJAC15B/ewjpxjTkRlho3DBvOcjx9EcsRwvVciHm6E1NaPTKzJLRpMYV2EhGC+r/
         Y7ThPORdjk3E/XhlSpgFdv07w3wL6jhkBza7wytuN4ZCyoKYEZNLKqgLagGukAjYClg2
         KykMAPVmmBlPuOY/sG5wuucetcyzDWUnbO5oD736h6KGCpU1lznEZfkOh9qSWV1fnATu
         IbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242760; x=1790847560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jp2raTZUtG3uHXnDsMOnQNob40yCM+rjrGHtABixf7U=;
        b=PUA9+Nn8tOqD5ANDjI1MI8fHqoJw8CzWT7j8jZSV9eHpIItjMQjpVpzzriwDMQQXip
         ZuHVdqs3sv9wwGSJH/11MdWWi6JTFdnUJTAKDLKdT7HNaaPXBiAdzivDLa5D99jjeg+H
         DHQ4AqGLyQVfGe8XuRKqGbmAiuaDb4IgK/Hd8Wp8tCUk7KwQpI9/h9OOqYOR8gwb+Ov7
         zaX2AEo4g75EbYMg+9Kpp7Kty2nYMxPYwxWv4cfcHoLCNGU2+Ee2rcyZjYnee+fNBg4h
         ZV9/cc1M1O1gA4AGCkcuQSuEfQGEwExE6JCj6ci4nyLELDurs6++hsK+sXABiDXNimfD
         zOXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmGUjC6XTkeLp11v0wG3cZoDv1mYHcOzdJ8ZZJaZHpQOiaIcf4OQmnTXGWtjsdzkVvNZn9/YqLtgs2xWg=@vger.kernel.org
X-Gm-Message-State: AFuF++kJRlAMpXqpyjTP0M59GKaoZl+ApX+Ug0MF71VLRRiEMA2KklB+
	/8mfyWp+zjc6x9H1y9FLvz4YA3mALdVBj26ah+KoSQO+7DOZJEO+EM0czuYfga70f2cxyS0GFrI
	t9rXvPgOeZtVsCU3smEQ+v5OOuj5kGI3cmo1I/b6k8NXgIRjWMq1jNgs1V9wK/YmbLVo=
X-Gm-Gg: AYBFou2YJz+HobwgMPwqZWR4dRF5M+WtbHGcVUsQmxMeKVsO90jEImpoA0CQCYixe7G
	SmfeQgvxE5nOmQyfU5wEdiPW/kdFUmuyYIi4lOaCIpl5UVdTgwjuE5A7zISd9h78xG+Wx/Y2J+I
	2MiBNNdXzMANNGDiPBff5nS+jHGiBO20q93xRgpzYbZ6JCaVB91BFJWp8lW/49TEUjXS7MTP/gD
	5Y/B8eD/ga/Gd+g66dYoPNNdMWeyKmqhAk6f27YydsjvpuaO3e6PpRn4jpdiLPDATabdw2sdu/C
	MYcSb2EcpMN7fA3F/eVx7n6Dlp+xpVXxciaZh5w7Fwh6Xo30HovMYD3fflQmT05lNyfEPNEHeJd
	vyFvKmNP/AHLmuNe4oQQSZuhEPtLDYlXquol4axMDkg==
X-Received: by 2002:a05:7300:7a0c:b0:33b:5b1b:134c with SMTP id 5a478bee46e88-3400566b548mr1525409eec.38.1790242755542;
        Thu, 24 Sep 2026 02:39:15 -0700 (PDT)
X-Received: by 2002:a05:7300:7a0c:b0:33b:5b1b:134c with SMTP id 5a478bee46e88-3400566b548mr1525368eec.38.1790242754671;
        Thu, 24 Sep 2026 02:39:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm11647648eec.9.2026.09.24.02.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:39:14 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:39:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <arTvvYoak2v_S9ts@QCOM-aGQu4IUr3Y>
References: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
 <arDvejBVDThdga5C@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arDvejBVDThdga5C@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX/cKBQ/CiVum6
 7OV0Q6kYWHi0hcB7+ybRE6tBCQHeS3My27WdUwNMjay48Qr7GZ/sbiDSst+RAXkD52DFR4/Szoj
 dmoU/cxhtCPsBT4AqaIanbR+Exxh2lU=
X-Proofpoint-GUID: 4qCGytLZ30ZQJpmWCwKGZ63tDVL7aoE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX+CZNENxISwvo
 zOV0p3o69chv2dB9CGAYHBuvCzntr4TSlyJOdDCSTdhta2x6/zTdD1h7w5lHcLc5JuLOpSIDApF
 hemFmKuAJR7K0LyNseSSfFxavayBPtCgbFntNFtkg77iEivADsqhzowwrGrV0KUENmqUDtk5xYX
 7z3Zkpz3TQ4wVXIKvus8SoY4IEg5j7d+sYcQsYTsL2oz9+eIdN3WZPmve8XkF7IqWHFuXbXtpWB
 0PBPeJmNv6DxkMh/DWzmBGl/YcXiUARquw2d8PuOX2pDYnB0/N0famTFJhETXPmz/KKkQF/0C0o
 IcF4LWbLWZXxYv6SZVO3Gwy8AsGaP9G6aBa6OzlFNxft0z3ZBbt9Opx3d/w/q4kzI6hhqqG4rW+
 85d5YvzmLA/zj4DH1UdqDMUz2bk0eF+Y6uVemTiPP2rZ39n8MH/FtLdUxDYEUNcKDYQEhywG6j+
 fFQHIM/+02sIJRyC8/w==
X-Proofpoint-ORIG-GUID: 4qCGytLZ30ZQJpmWCwKGZ63tDVL7aoE3
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4efc9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2mB2RfzVG-M0PQ__098A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040

On Mon, Sep 21, 2026 at 04:48:58PM +0800, Shawn Guo wrote:
> On Sun, Sep 20, 2026 at 04:10:49PM +0800, Shawn Guo wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add the GPU, camera, video, and display clock controller nodes for
> > the Qualcomm Nord SoC, along with their required dt-bindings includes.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Resend to separate from Nord display DTS series.
> > 
> > Dependencies:
> > - Nord base DTS: https://lore.kernel.org/all/20260914031412.140856-1-shengchao.guo@oss.qualcomm.com/
> 
> The dependency is cleared, so the patch is ready to be applied.

Will send v2 to drop Dependencies and add review tags.

Shawn
