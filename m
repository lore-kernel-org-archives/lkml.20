Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420768;
	b=YUO4yaBsvtr0csjwa9MbS9/Of/WYn+MbLAbPuN3OFmWGV7heyPix5tNgRm3w3MTRCi6M
	 PjNiKi6Z6fMUy+mgp0HDprR6ekJFIz++LmUiVag79C5E/ihB5UWqbvWcT7kAbC7DY0kmw
	 VRxuW0spArP/APZ0S1mKCwm4lDhiDKz+LCNc6/5L4nz4f3U75foasvhgaxAIqyJWBDiw8
	 0ZLk6rKnb1PpxlaoSVfaIxGJmYCaK2lfIdnjIJCu3NA1/kLF1IK2gBloQ44EMnjbSZY+6
	 MKR/OUKfhGvsrb3Yezojrv0jJlih6zntW1sQRYTg/7/FfCg6NJVw6ICmkMHS5OOQtdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
	b=hkjAhmtJMabJ+ZSH0BVzaaFEk9NgRHXO9foFbqQNnIMeF8YxPqcsSUmmkn5sKkVyhnCS
	 qaoJnqUkafUNCX11CGByXdNLmYj1gkYfepbXq3AYeEr//e1tSRTteOAe0ZpH6xzFKSN3r
	 YrytjIv8VxXP5o1M2eyM6slO5Q39Hdt8TV/TaXWd9ZrEAlnsyQ/4Bl0hfPR7PqhVm8tit
	 9bmkeV++plWhbwSh43pccIYZ+hyZypOiGAShCzP4gozs67nbTwykMIXhwv+vn4pB7D/K1
	 pkrmAIWmdhO6tIeYwRuTkI0HlOnJrHw8fRRPk7qlm6pGlDjFpWKQnQnLWIwwOIPMc5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ARLkfSdQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wus2ig0h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9336C606C146
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9336C606C146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ARLkfSdQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wus2ig0h
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtH3Q1952668
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TpPJpMAeykiKgpS6Mi0eAQJ5
	tovbRl/3UVD0DVrSzfI=; b=ARLkfSdQVS2TC9m6CkNI798Zv9qBSMWtcTE2iZn5
	SDFjKpoOZxE5RE9jg18lKnNpM+YjZu4VFePK18NW5XOYAaFQzMjuB07KVSELqchO
	gRYClwlEK7Vhsk75GfiG7XOvQpbNp/ZM4BVCzO9OV2RWST+oOilqAEGh5omut/jM
	rQ7FIOc1238CCxui37iRvEm1QPePj9ZbMc+qCUXNOExHpSelMuQ7m7ApuTGBo60y
	TdCUmuBjUsrvXZhaUjTvB6dgPgzQ4OchwCPtEi0baTEkWSUmhr+ECWdkoE9Ge0DL
	aPkUXsIH0myPC1b2z9T1K6rQKptfUvgPBM3im/p0rb8Hqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m1bex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:12:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9440b27c1feso563517485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420766; x=1795025566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
        b=Wus2ig0htXxL2ImJ+M0Qqn9vdzbSiHk6XK5+srYC66DcjjSszkqpaAk17+HWKo+0KH
         T6gHFkHkMjRszsMCPfNSZuKD4e5UG6Lq+3smsfU1nJ353wTMg9EjUw+sXnRw/x7VPfyj
         f27Bv9RABd4VSY73d/mPTyTaYaC+J3xBUaNJCpkCrFnYBHlq2UN3iAFGadRTcN/0khmD
         1/LzAiXewuy7cgI9MBlKx741i61j7oE/PU+kj4MXuM+VvjaNIaJV+USQ1u5u7qji5a1F
         RDPuKPz/iST5H6/N0gBRHq62kjlIeTS56DDm7sMqypErKsPEAfHxZIhS4hiG7hfr2Msi
         VPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420766; x=1795025566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpPJpMAeykiKgpS6Mi0eAQJ5tovbRl/3UVD0DVrSzfI=;
        b=NN71t6kA3HXBHq7NO8sPhnYgCM0UmSzJoAd0DJ0JSqr0kXWNS/BYWxaa3YdjL7Ov5c
         u7ZDkyUOghawJkxICFza/7vz0cF45WRnaJptQu7GEcnlSF0FimD4Go6eTn5A89mSjqZE
         sExKZc8crNmA3urFEcu8jwH1R2nmUvWBOYq3A51kcY86QcNMVc6ZFLld1Vt6spMkD6zy
         WgVnL3aKVX5a6BdHMW0SZTmjhftPBtyQMKgh1S86a/YqyCL9g/BBvO6IR2QCsZV9S77D
         ziGRf3E6zIOGeRCI2V5SF9aX6N69KvlbVHbNI54XmJfeHTbIQh9mRmnxqX/LcMPQE90R
         qF4A==
X-Forwarded-Encrypted: i=1; AL+hErEjShrybqDxqVVsbHxtYSLeK8EuKT9G2+bstV2Do9pu9kphRTjgU6CC1AG0eOQNs3CScVSrNUSMlbKTm8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5DEj2vsGGK36iS1dbLx5cJxQIGNZqnLbenlrqbrynB11Y51y+
	ldq7zrWHSsEvmMj1xGroVR1KwaDPxiaxVu1Uj6O3mE85VY0kwk0QHOj/WdZjPYHcI0Xo1wzrriF
	VTW7Mi/58Js2XeGABXRYySr1kJT5JvlDOfRBt/hRCEstU5ZRVr+XG9rJpCg1MirF5Q+k=
X-Gm-Gg: AYBFou38u9Y/jx9jfWrJ2rPJNuY0boNIHB9wxTp3HKx2aG/BDhuTZNat37QftYo48DT
	SNztRaIwOwo+X4jcMxZH/wm/HgL+LZ6xFbPzMjUyoLNVOmQ5gU3XUVRRYERXi6pbaXXIQA17ubM
	awzlnW/qJ1RRxmNYMcQDhsXkgxf/Eg/VqQQVMNFkiVcr1zMQkHF9ODUHxxB3Q5NdwWFjMBN3DSn
	38RBybyzz4fXc9mJg9ExJ6Dgp1DxFcZWH4NPhKEYqMABSXKX56EGbM4mpd8RstG3Z+JsXEL2veJ
	JkZ3ef606Gh8xS9MLrOtrDLm5lipDCSr/D4EFClk5ny/zhxk1kLqBHa1B5YOwb0CC+7ktdsMAw/
	aJAW+hDyCNrwmx+EjULuUeOcJssyseVt7GW77Dnb0ioWZITmg0V3sTHFQRtmd6MRSXUz+1LKJ0d
	/vTeXqDaoRM1s3IsmMrqjExLXbQcMIVWxeonwXwWAIkdgjFmB9GHp7Y36MtKdLPQ==
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr487873385a.59.1794420765761;
        Wed, 11 Nov 2026 10:12:45 -0800 (PST)
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr487864685a.59.1794420765248;
        Wed, 11 Nov 2026 10:12:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm6544391fa.19.2026.11.11.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:12:44 -0800 (PST)
Date: Wed, 11 Nov 2026 20:12:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] dt-bindings: display/msm: Require DSI graph endpoint
Message-ID: <wtwyi4b4s2mynolj7pqk465cugahmtklhodmg7yehdmvubusbx@p6dhg7iwon2h>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
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
In-Reply-To: <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cLvQcK-5AcMz8BZZVuN4cw6tRhPJ0lE-
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4b01e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=T4xdjuEbw3p0ivj6QRwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cLvQcK-5AcMz8BZZVuN4cw6tRhPJ0lE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8hyboGphDPed
 am+vMNXjNPOHueMGtkSpejW5pKdfE3dVGsspzkiMPuvlB8ahdWoCNWQGd2kppqQ20+UBE0BhfxV
 ZhKja4pbqOiAK+hZbnY67XVLaUR4KMoppsRTv/nfP3USQQZBKK5P/JxTcfLYgJ9TopcQaNowlnC
 xGfL3zrfnu6+VM9bVCQIHMRGObOgI5DY8Ey52CAKa3zGmFiUfN5FKjxN0qJZU6BcCPlwcNMOLR6
 cvEBO7up0pF/9KSNFpTqfBPKFE+tZK8tN1YGsRjZuRFRm2k5g0W+HcaE7UQ84yhiAoXVSO6cz9F
 QfEw+hlQe6E4y9SKJXPgNX5TnqGzk5CDCuNEl05rROUqc4R1h4LqDayp8Cl+e+yBafNPZ2i7a93
 jhspCCkaO7m6xwUXyjnKd6054tiHLeelnn7UTyy0e9DBeXrvP1v905jDDr/d62gPPClaZ2p7bbw
 z8VHcAyzJk87BspQldA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX6Jvdg9zn3YnE
 zkVe7il+Pn0dGS8iM33VTu26s6nV0ZC50v7OKLSKxC39+7GUuW6Yg0Ns55531E5LJOkvIULoOBC
 7mCdIrXzYmC7K1i86JU8ld89lQurptU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Tue, Nov 10, 2026 at 01:57:44PM +0100, Krzysztof Kozlowski wrote:
> Technically, DSI controllers do not need OF graphs with endpoint to the
> panel and could rely directly on their child node (when panel is the
> child of DSI).
> 
> However Linux Qualcomm MSM DRM DSI driver never implemented such
> approach and it requires a valid graph endpoint pointing to the panel.
> If it is missing, the drivers will silently accept such DTS in
> dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
> of lanes is not initialized.  The number of lanes is initialized to safe
> default only when there is a valid endpoint which is missing data-lanes.
> 
> Extend the bindings to validate existing DTS to match expected ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
>  .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
>  .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
>  .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
>  25 files changed, 48 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Note to myself: per Rob's request this should be applied only after the
DTS changes.

-- 
With best wishes
Dmitry
