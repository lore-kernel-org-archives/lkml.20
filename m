Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762A8493626
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788172; cv=none; b=njhZIHF9UX/PdUt2VBTSFqI5AHGU2SCMXcQUVq21KPmDFAWIYCbIptpZqeywORFtyjVUAZFJpJOpVHc/EJEQbWpqmB1pwBBxzOnGqAofkmdWVuSLfeJtHAuMVQDI44JhZBw/Ij510BRj24yKGA6TNul5ToAEEblmz586MscBQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788172; c=relaxed/simple;
	bh=+Yek63hwngBoHzkEu5P22GU6w+61FzkkWtJrWAOnZzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz7OBRNJc7ATWUtan3nWhyGJrb8jdIP47gVXUm1E/DoEJAIRxYB46gnC/p1ZQgP65qFCwzIKLbSEVyjJcJB1vkMgohXZUGz4yB9eg6q1RRGpIOzPkvvWCcwTmcEl1YA0ndNT15vsnwuBolpsP7esOj23fFEVAVo43p7OMH4Tv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH1jhzRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1t7bDuu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH1jhzRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1t7bDuu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnRs9217671
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nuvly24FDGwG7YRRA/F0rHJ3
	9EVW+7Vo3RK8fyPQ74U=; b=nH1jhzRbtI+Me0pUZo4bAJgTrabfxd4do6hTkdzn
	CNSg6oZ+w3dOACONJ5DLmhE51DKP2wUIjEhZNlHpm1NSCs+5J9UWQuun6gbwcNGC
	SMkjg3E9wSo02jH2lDjrPygg9IHsAjtO2aegPRXTqej/GG6ACyJOm2+jGLm+fu7N
	e513f2BElebzGgcJjS7T7MtvplFbO0lwUtvx1dgGx8lTmf79yfGd9lOFngpWz9ZF
	9sZBtbPwehxNQxBWDoFT9CF34x6kmDLRQrAUKw50RfyKztLG3dSswH5o7c7pkFr3
	cuP9ITJbDDhVeuHXQ7GnPJ451ERS7kkkYsOIR0ESsIdLKQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqh0xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:36:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-756261d422dso2629880137.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788170; x=1789392970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nuvly24FDGwG7YRRA/F0rHJ39EVW+7Vo3RK8fyPQ74U=;
        b=C1t7bDuu/jPHKwlM/qiljKRXrNcVQ1ku08EYWs/SqXQdr6Ygq/PymgS2lyU3KJli7u
         w3WHAWbSSBt13VczXDGbapkp3js3QbzGF068c+Kr+GEjV+KL/0EAOlC3xBe91VkEaQi1
         4dEErhQxmn9TOdPjAKHzfZ5QDG4Xx9VLJ+qosPWojBgr7HNMQt4SdEieCcWb36F6DUA7
         epp4VIuDFKSeN957mOY2YI4kLe1keidztqowwhMoGM7NKvFdp2U5ASTZp6PanaAzyG0U
         Oo8cPDUG5g9OX+qTNWQrHVHhl/0uNir4CmMLsmMW2u3jf+8/GvYWGRl3DFk9tzZjU+hD
         7alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788170; x=1789392970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nuvly24FDGwG7YRRA/F0rHJ39EVW+7Vo3RK8fyPQ74U=;
        b=MF5jhmdeAOOxawXg5mLHvR2+3sFDNhZh1i+mEsaeWzH8VV/NudNcXtpQ6iX7hpac0N
         HwQKyl2gydVjcD7ajsa9e1FBYoBhFi/GoLmVpNJZr03vKSHtY8FpfDdgLi7iEBscmvMJ
         r5D+KmRjyVxPRLqPOAmbkMY6WZd6R17oK+xfdQsvB3tjanaRCs8fR8qw+7xP5GgLVVuU
         di1LY5Ldm3q1fvNuck3MVxZQreFyLaAwW05yAhowzYp+SoI6dqFZv9h2MaEzF6ar6u+I
         n+RNPUjD/fTm2k2YFuI1UVFCP26+CUxhmfragIzyxfne9/6rALFqUAXwnOAElEHNGjtB
         R99g==
X-Forwarded-Encrypted: i=1; AKwUvBxHrnFS1ERkZR5QZsAS6xNu96AWPUZ+kyaEQ72jKtneJnEY7BIGkXEZ+cJmJATlcVtwTmrX7D6bLHVtAG4=@vger.kernel.org
X-Gm-Message-State: AFuF++k+00S5oK8wG1v2RvdUiUBw6QGAlmHORSHLbA3+qDHKQSgcYC7z
	NLp1/wyIxWlKNRDIjJjnRPc2Q8vexeA19gHSctmdm9kMUu5Oy3Ug96xQO8PzpWFVdpcOYolJZyH
	D+K8YqZfHNx+clSzJJkrPvDM7pE6bocSfjnnyamufVDr8Vi+ZnuNOEfjpNkgxgONVNgE=
X-Gm-Gg: AYBFou1IW/djCwtH7xgjuDBY1uAA/Gchc3fu4eJEIXohvEg0u3UHxqCW8Lh9KcOawoc
	6/kZlE1oJxPPgjtzLrloykhARPhdPOVBsc+3ESIOeuACbkQoaMzwnCSx3pQhvZas8glZZnAue8F
	EolzT/dtXJxJNkyr6BvmzCqMrLuE1WSFLTRa1Xn5g7a2v9B/l+7nJJIm/rWjsg5MMxRXbErSLAB
	z873BCHebr0k0u+BmZRzf91z11J8rl+U42jCBvCoYBuYZeCjw0G+1msGSgb7GSZPptIe9abJLMx
	9sUVEtWlYZf2N2raenmEO4o7ZtfcRGSHnDpFMaMCympCsyioT7INhvFI+DXK3KvhpfQg2cbFL9s
	LzGpoWb7EWJId
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id ada2fe7eead31-78a4a8b86c6mr9600148137.6.1788788169546;
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id ada2fe7eead31-78a4a8b86c6mr9600123137.6.1788788169077;
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm28060777f8f.32.2026.09.07.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:07 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:36:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/msm: Properly handle msm_ioremap() without
 name
Message-ID: <d256qsfz2rs5rdbfvmrxi5m5oitu4266ybhfx44gd7biuaykxm@tfhjzjxqh644>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-5-b097cf1eac77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-5-b097cf1eac77@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX6ri8+IS8KuGu
 A4q2v0Y6CI/NU4zv1xxFUgb1y4AEFpr0NgZiY4/OfrzusgmOdruZ/pUWdXajKkZxWpbOFMK3pUo
 gvjVpECDFbhSJHMHplRL1Yt5ghbPTvFH2VXgMXc5GNPnfHd1Tuq+LtQJRozsl/D4lXLzdueqgcM
 kDj/wEWul4LXT+peUCLxp+IlN8hmfW4XdCTDr1OeVCtn5AycqSHZFyMHui0is2FFgbcqoOTli/T
 XTtOP7moGMPJFC+ScWvinSBSpyALIdIdGmE25rIM6lyc+JB8jwq79pNlYLPoxretTD9hRjUrUI0
 Oa89GIsUuwgUMdFMAKlVISepyy2D3WVLk9xgr0ELAJQ5NHof4RRiizAutLQLqBwC547dvCCfJi4
 HQsflXvPRYBPAms8uElvQS4mUbVTvpSQOCAJaMu0W9RP+9ceCtcjK1HnM/Uam1QpuyMyzxo6HJF
 ur60Kj2nFkJpjWuIILA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX4FknIavCu+Oj
 CgfafBkq7SjrH464RcRftal7iplak4VoDXFJVEFbDH9b1h5qbP5A+m+XA34bDIY7FHYM2lbuqUL
 4eYnU694m07g345Zri3ezkCqsOJiwRk=
X-Proofpoint-ORIG-GUID: k367Z4CYKtmxXXnTvBkHMLkAsUIsevZR
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9ebdca cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YrmjDuPctlhI2Ist5Y4A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: k367Z4CYKtmxXXnTvBkHMLkAsUIsevZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070150

On 26-09-07 15:00:19, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
