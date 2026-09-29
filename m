Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B029852BE2A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688870; cv=pass; b=WSjHLzjeYN/lLws5ySUrqvzyeaDrTLyLlmQoRlXqFOdtM9xah5O7ZIL/yWR3miy8zbkAAvgHE1qcct1pU09agCZVuuHOad9o47g9aJ7kBXUIzHu8klPRblHWnq10m0kwWSLAnK0sQAzKSSnl6qrcoXy6EuMb+h2t8mTVJvzh6Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688870; c=relaxed/simple;
	bh=aatIQCpb5b6E18tOT607YiK+lREgF4JTQbKPFrO+iVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbOkNIt7FBGfRbNW8SkHfCyv3XqeBHa0+J+x2nURHupgY9qEWskuOYDcB9v4FbzH0vMpQ1m2SA+vf6FtFvtFiSN5/x+5+qnRjkiwafEL8RNxgu/V7M1UvvToYly9/npbYi47HwRNVzn+SdWknMTbUFdnuJU2U5l2/yt46OCDZAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk6mvLlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnW5UteW; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk6mvLlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnW5UteW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfq7611555
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=; b=hk6mvLlVWv66MepN
	iXjqUBQgGPOer5qnBJte12x4wjPvxOCEYL7J06CYjn0EHwKp/mQIZhzGf/7PTCrr
	JPVMRa5P31yNjd0syZbjgMb1SqSQl0EhM88wLqYun1EFTHMdFhjcUQaYctLQJvLB
	m8rrLNP8N82Uo9R+rz0dot2NO2Ag+BRrRZy3QHNaATzsOSBlDlmyQoF67xxVYAwr
	6AvhbgJpiztMCqAaEVjfmc1yrAp8Qnex8FnEzTZH2Oi00Q9D6r5JmaAxiFebRClG
	r3l0ApPic+NoNoV0+qGAVh5h3Rn6Nx3BILxnO83SaAFd/J++STdI9TWC1odBWbQy
	41skTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4uar8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9336581a2so62301095ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688867; cv=none;
        d=google.com; s=arc-20260327;
        b=GwXcuc1LqfV3BmyTE6Qe0dxWiY6tqnYZ40mlQ2IDnmAlMOpPiQx70IYgJAN2rs5TiT
         ZSQoOyI93m44KiuzX3y81T0e9OwO9T/Xr8etUMfp82aNYly4ZHRSyWB86cjE3birJ4us
         OFu23Z6Y8GeDs2n4mlUw/IJ1iEsNTkyWvflp95KTtzrdpeu2G1UdoOzxCcyXrLOEKZiP
         6aFnM8zCHJ/P9jgoCEuDUEu2WojfcI4/wjXKrbGp3Uv5LP+L/A5k4zsGVxL0ndJspuR1
         m97PS8vZ/whiYaZHdDnGnIP2Ykfi7yCqdEAUphRVROlMQwCOpg7GroHe8GlwPqH3kMau
         gkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        fh=M1jt7A2Btln/oyejZydIG9WP4x9kNGJ6fP9uwwVHCyI=;
        b=P237Tmb6Se9Go4ofn1FfQYG37KJjF8/BlkaDSuEiuqWG+Y5sS6BsKIa2xMK7unY9+q
         NE4m5GjrzIh5XJ56j+pMDMzeIUgxux9szOFIzaHC/N7dwwHm/THFhHZ/taVe0r04AM3Y
         9EgQMDX1rEW5TG8umHn2M/lEQu9r6RKrSYKFLQT0IqerSjSR034IzEfHsb2BkRu5Upci
         2D1MJDEuo5t50P4++MPTUmIcqHim4++MJ70qpe34ngmfUcUy9AiHra4ISPpXJb83ed/v
         w3uFweiD7840T2ri3QnvD3fDH1qyvkWBf3BnGOW99UXqAy0w86OUudAe6cLnY26E+VNB
         LG1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688867; x=1791293667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=MnW5UteW5tCkE0domqFe0WMEddVoAo24BrHbfCGicKqHJ7zswfoA07vSpvD8NfqOnE
         fF8ELmym2xBwXyl8/OfGKwGsoqqQxQokZj3gd+Dq32ZPO3DRhsUh73z2LfN2tdHpGy/H
         EPBeds6ekZJPCl8GDtF9YdK/apasEgcCZd5m+U8eKxUnzX94w6I8HytVWl5AvvjGs3zR
         DpK+qksSdODDf/RHW+WZU/BkBWAdIHCAI/QR4tzPiMQzi530jEw/yRRLhlCn3CDzzxlv
         lqWsAjIxiU5+U2yWw0xsJgp1V2E0KCF+z32vgJSxHnU3S1tTCcTS6PAXS2gHKiJQLrhb
         2M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688867; x=1791293667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=RDck7W9S9TaS8CL8jNvoCGcItiZjVAV380T4LmqbM76U+Z53Rd/JXdcgbchLTaE0jp
         Lne9NPqI0QqTDJOoGiJBj+pSZiGo7Hx7TX4X46qopoBgUDL2cU4J00AUCXptqf2/addI
         iWbfuPyBZmFNtADK+TvMvFkTFFc/66JQ2E2xpEZxKuwSTKgjpoTMz+QzpIwQjYlvgL71
         RmxIqCtelQYl4lAFwcydAbwGmf3mFM/vhpPBk4O8IFUaaNVyGwkajKJrorzThyrUJg9x
         C389Bk+QfVWgVFUVgIsARlEqCSWxRA788rQQDoJy/NzDM2t6L/0qwUZc3sMOsAVdJPBN
         vn7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbGi015q23DnUPsWTmKGaHDavsNh8x4HKzLZYCSyynhWweHemNMUPL7fX4D0tAPfuiF61A29Ayg0CBShg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7qDZ8Gt0j+fMugSnTyvPU7FR4jLb6VNRP3DhW3JKENsl2LIyU
	6qtwi/mLH68AjAIWcM2q0R05dp6L3UQ4xt13KZ1p/Ooy9WdZIMdP6T5RkmV7SVzaDknBe5lpRyh
	4g4su8OG5suocpIm6eFe0s1p0gMuUGmWOTLNJUMLPsxP/4+kuFxI7Qb6M0YyijgktNBNwDdTIkm
	TJpawBmncHfQWAjdObu8bfoeE7TyXZ14tb+64fviI4lQ==
X-Gm-Gg: AYBFou0WlCxyKZdYsWFCVyjG0wmnKSz160/2ELsBX7w0RaLZhw3XErzIIpch0GK9y5o
	1RFpleLQTjghMRVOgLvbxI3HoCxdpgIXHO84LhEqIy9sSn2jNt6+uzIlYdysXGkNouDews1VEw+
	2a10vQXjReMlt1o5DSdVbM53zpKIj7c2eaLrH2SM8Nvo08ClsEZoA1Vp3gmQ==
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0bb60e74cmr11071552a91.39.1790688867366;
        Tue, 29 Sep 2026 06:34:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id
 98e67ed59e1d1-3a0bb60e74cmr11071507a91.39.1790688866886; Tue, 29 Sep 2026
 06:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:34:16 +0200
X-Gm-Features: AclHuK_IsoMVZ8jA--KFIskLK5LDOvw3Q0lyiLyhAEn2l6B1awM5w3Hl8Ax8gbg
Message-ID: <CAPx+jO9qPRgae_VqWrGQ8bhDOHBf+zDzw3A-BxCMa25XfPaa7Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] dt-bindings: mmc: sdhci-msm: Add MSM8952 compatible
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfXygKObyHnswqN
 CCpbySz8uT7NCgyvAvYI44NR7SvkwB2cg5rLQY4rlVolWTBGJNnfbvsEwspoSbs3S4mURojy7YQ
 XZlDnwgxYWzx42iXR7+O5B7oy4Io8Ns=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbbe64 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=wO7LUizMVtHDz2nkp9wA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX8xykHJ6U+JaJ
 JRtQ345BEvc8ftH/huaTemcwfW2oxvSLlODhkfws5rc+8Ws+7WhUlH9Ume6mjWhfV4/SmRCAVUF
 xhGSS4mNFmeSXhvvGOwwQaIJo8CNY3VllYPLP6VgXtnbW01KSEDNIzB+hVZrj0CuuplzctUBZzq
 sDwYk80I/71e/hQMKUa3GnIgzdKD8vBBlcKSk3OS1iI8c6/NIvm82SRTF4dpBogHpFnb4dS18lP
 WuJuDzVijBGVlABJRf6Kqlwa0J3NWsmdloGP3QNSA6ZqDVm6m9NzCjhgvSORm/ELP3M/k3LRtYK
 8p3ZvobQbqYPp7JDZfvSIbvJ385FLBC7XLmT8erVFn7i99gXAYwRI9X4wKaz28W1LggdKQn9MlA
 i6OnOEpBBF47V3jRg47vGpHNuao4f1G4WuK0iG+WxQ0mzLvCeEczOeq2Z6QDjaybL6tOfNDCnmS
 3sM4w75+GHaeqCmA6Eg==
X-Proofpoint-GUID: 32sFhHIqe1RYy3_1uQRU6LME6wA1M7y7
X-Proofpoint-ORIG-GUID: 32sFhHIqe1RYy3_1uQRU6LME6wA1M7y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290054

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible string for the SDHCI controller on the
> MSM8952 platform.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index 69bd44e65ad7..9d4409c958fa 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -26,6 +26,7 @@ properties:
>                - qcom,ipq4019-sdhci
>                - qcom,ipq8074-sdhci
>                - qcom,msm8226-sdhci
> +              - qcom,msm8952-sdhci
>                - qcom,msm8953-sdhci
>                - qcom,msm8974-sdhci
>                - qcom,msm8976-sdhci
>
> --
> 2.55.0
>
>
