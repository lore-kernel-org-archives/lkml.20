Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB57382292
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342267; cv=none; b=ICXcjsxG8E1NNSRZG2Yflga24hHJetmRh6xELaaci6Yvv4xIskEEDENWm7RGFMUJIygSpmrQByWf/J9Uhb/B4i6a3ck8YyZQJnHL8s3aIrPxdZpYNu0xpxy7jNvquPFPFhCabt9031KSS0VPh+QLQsU9PrzLj04hz2D1v6t70rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342267; c=relaxed/simple;
	bh=9ExU84slyAwDQlKmqAhicl+Xj5XhAq8i24BFAYfIM1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6FlhWpRdPZT1ibnAzhKzr4ywUwg4/GFqXQ/Ch4Pjtsf7PKGElgPyXQMMi48Q8jaw+lPkZLGPt7iHFRQ2WgfO198JuHa4dRh/IwED2sDYNRyKAEeg+wnNh70Q7lcpm+GSI7o5gjxeH9YlD/cNNyait0+TuM0NOOeZvyI0iOsqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Z0H9Hc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIEeG6mV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Z0H9Hc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIEeG6mV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0Y3N3218650
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DNWkY13/F7vQQirOcn7RyLrj
	8L/7ZC6/5Neaz+9VVak=; b=h6Z0H9HcHEhQBaja6fkvXBbrNNPS9rFg+FpgaM6/
	faehEqp0/cj9WrrcglZi+FVs6s3GYk0m6/+uh1ySJ07HvMB9MEqfit0uNbrdX2Hj
	FbpF6MJp6HX2y24ZL5YMGg3eCdleotfk3u/QpjwLSqfKthfQG5Cc5a4V00a/APr5
	xFe7nQLUoPu6uX+UH21axp829CT3l3M5Jgs4LFdDd5wDqRSc4ozYOz4qxaAplHAr
	EPGPTpEnRSk2ynvKstsuPuhFxntWtXu+P+89BLO1YYZfaijKFL5XD1Mt02aOHfbJ
	6usUxLdxxWYJaRBX9IvzbRjiuNZplDAoZ/CLJbOPe5xw8w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmbua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:31:05 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c683ca769dso948525e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789342264; x=1789947064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DNWkY13/F7vQQirOcn7RyLrj8L/7ZC6/5Neaz+9VVak=;
        b=SIEeG6mVzvSQa2MmtfDyupL3Q8jyeApcXtGl0AUqCYN2oxfMsBRC8y/fxSo0glVfxG
         apPxjZwdwTxRqfEzLyPM7xsB8iiX1ZTtezQeT66J3b0wayZHsirawUMZpADKu9HDMVwp
         uzs1Z++plAMSSHY1dUiVmamyuG/lr6pvNheAknk9u+AVRGnUy8dMldOBGfiXLA1aZ3Ij
         +pGAm4qXDX3LOoMVkL2t5YmdQukzb30/+Y0WtDCRbVTNmFase40Hx6rtyXvsLK2wudMY
         FjZoNRqMBArj8UNPtlFMD8n1dWPomQKtId8qSVWxZ+7JMko4/wHwF5VIs8JZVqE6Q7X8
         QHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342264; x=1789947064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNWkY13/F7vQQirOcn7RyLrj8L/7ZC6/5Neaz+9VVak=;
        b=Ta1Ik9dS4h0vd+7SCqu4t3bYGe+61O/6XN+Lvv/734Y4zR0oCgJX90XP/8q4HXhni4
         v90LCnwjZM61R0cnT8Woi8fEE0U4+thX0+SOeHE2Sizmxxya46bO0DKL7unbdWiJsAwn
         GR/cybXo1qhssmV6/eBzoONlUpEs3mkFT3U7MFYUe7JqB1xeuzDbCq01HU2Q0jeIqkET
         LToBxX3NmQpX0AlvSoFFyhTLqOLDSVLkz1esKdm99dlelVwcEcAhDE1nSoj1jtyW/fe6
         X85XXhvjHPaxiognXOy0emxnI/iy+Xb/3CIq6RJ2AAVVUdjKXSWBOqmxpg70LhRurotG
         qpTA==
X-Forwarded-Encrypted: i=1; AKwUvBzpXbEkqoDY1nfh0Ew38qNr7OQi+el9LV6KMXc4MviVnv1FS6OxdxT8MLWjSzA+TYS+2phhzQvb7bQZcAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nqkQsaiQNE4amAegR3ZzdCX4fr6aVqpdd2qOwr3Ro52I9onmDR
	pO82ql9klsngv/AK0FoboRq96Co50gjaCMPw8tk5Dve+cxvsgX7dbGVDMZIsg+jL4M+h1azn9ot
	/aBp8WRElDGHgYKPtqHomOh+XevCjJesak7YmxWAfMjvaBeu2LhVd4spSdOUMtxtiWTo=
X-Gm-Gg: AYBFou2d30eTih68le7SeIWXNC6eoHPWHeQTUrxdBmLinjrFZPmiKZ3MuL8Qa9pL/Eq
	awFIxhmgxD8/lDcbU0oq7JFJUOXgrKP1H3DXdcve8C5KrMvqAPYw+7HyY+/fQhVzCuOTarH1Sx5
	ytu5ZNWjGxVyuvazGIm0zvq9nq/uLkWW6fyRDvdPRMi7/tlSlvXMWReNmOXB3jKmHHMwNoP3fwn
	Xnxvb14ediya8H2KUTktJq//nYUkW69clL4zIGZvTmeUjBocHjOy9lqRTnaKkDLm4hWlENhVJQp
	5O6G9B+AdG/SFKq6D09NOeNYKWjK+U3djqOB3B9EOHfNYgQyMhgFnU2/1iTK2eihytna1piqzNh
	44Lmr6ioQaP/BWbOaFnAGkweMPHIxwSlLMEEHn07VcprRjaYeh5yH0RJfHZrJQnNSm8yco2QGBe
	qdgDz7snxqiBYk
X-Received: by 2002:a05:6102:32cd:b0:79a:47f7:6cfb with SMTP id ada2fe7eead31-79b5c700894mr1554137.12.1789342264420;
        Sun, 13 Sep 2026 16:31:04 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:79a:47f7:6cfb with SMTP id ada2fe7eead31-79b5c700894mr1537137.12.1789342263937;
        Sun, 13 Sep 2026 16:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456f85sm2019892e87.29.2026.09.13.16.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:31:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:30:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 02/17] dt-bindings: display/msm: dp-controller: Document
 Nord DP
Message-ID: <pxrdizcozxstimw6qortyrhyqdeicgdir5stjqxridexmeehes@wytomwupuxnq>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-GUID: -YA0d-YWXsF7J5Dwed2hDrEuiOpCGDDh
X-Proofpoint-ORIG-GUID: -YA0d-YWXsF7J5Dwed2hDrEuiOpCGDDh
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa73239 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=07SeQkCZaLl9qT1boBYA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX25Cdb2SYhjmL
 kjB6k5Lf4HTvmXi3E1QIBiXxAhTkv1OS7ctjtOVrIDw+9eyt3McUMkiu8P/OTpBBhfq3ziNYq+W
 u7udP9JDaFD4+/aE4saOvUYlYEkGn9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX6rHX7Ol/MF2Y
 xyuMa3vRlyrNcKYA/fHUM/x2mFBwbEMN5Kv91y8DHkjgtyjPgS8/WW279MyrS6S2sNK7WKGPsyR
 6Wepw+D6MHVEoxMTk8oQ+0C6k5X6UmOwYSX5l7S9uXJCUYYpT+bS5x+tZ+pDezlsw6Dj80C00Qi
 CnDIjhQ+3hqS/nCHfGACv2MRnNjhel3AWUB59BoJi+i/GczVtjn94+QzQzrWuI18+I1SQknWDdO
 +Sz7WBhLUZIjCEQGNJw7wnV6kufofOWOFZQ4P05/dtT8Cqf7Y4bBHIUbAQzx6V89vaAOb6VnliL
 3GLeDIw8ricNbt7PgjbxiRRCIaVb44s+9OHeFIw3N4aqLGMMq+nbrXGEtiMA88gQle46STA1lgh
 vfg/PSM9NGMt6782OdazFQNTz7kN8SAU7LLQxwtM/avTfIjCQ2/L+E3hVs9m6jfdXFgUMSJWHcV
 sLDHhGbufl9R6YHUSmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130337

On Fri, Sep 11, 2026 at 09:06:33PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the compatible for the DisplayPort controller found on the
> Qualcomm Nord SoC.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Incomplete bindings. Check the conditions in the second part of the file

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 094a6383bb77..8d980acb1a16 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp
> +          - qcom,nord-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
