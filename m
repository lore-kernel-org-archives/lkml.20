Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B18E36EAA4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343248; cv=none; b=pHjZ1sMxm+3Zy3fvwwkEkkr888xAnkGCx2Y4ZmSiPO+DB55ir/IeBDb1DCrmVOp4N97by0FOCjSjkBYaSrfpHK+SHl0BkGBYgNmjaEgsDpdbGghGDwn4nThbcMogXfpDbCmv9xM12+gw/fPF4uWpphifqIAtY/CvXYloRtuaZLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343248; c=relaxed/simple;
	bh=zANzVCAprn9b4vOB7ZnqBQISuHyZ8f0zuVKXch8qKcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQ0lW9eX5IWN5bSGqktjMR4YoGxNd6b11IRxILEjuT9fS+WHzaoyf0OWDSQZvgsfcakkl6hf4f+Ww7lK+6rrJmjpgBWpYmbz+ChGPpn0kyQXb6xXuBXJ0WSqO6MIbjdmqBT0+kDrmjcZ4EpJyp21ohB9GZ7qQP1+c4ORSQK6UsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx+8GYib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdaqPbiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx+8GYib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdaqPbiZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNYYLp3652204
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cmOd/wtJBwDY+aB9upH1uIT8
	B7lNgLS/AKryTS4QZfQ=; b=hx+8GYib+ZSJR2XplPITMr2FMSVazDbcRgI1G5C0
	MZrAOyPg3Ub5sE3XWE/7QYp8XUCb65kofTRdd6UyY7xmGpOQNq+mtAXV406YoN8t
	sRAEub4enFRNX5Eqo0WoHPOUw7QAzSEJMoy6wJgvsmPjOVlq1GH0FsheffvcZO+y
	iMIFhMq/lahMqvzqGo/fdcgtsCxWOb3SAXMXxiHlsOjxJFH5IlMQX4bi79k6ERdu
	LGdxL0N4r3p8g3aUZzl5EWgg0Pv1y9z6UD/9Ta5dJ7HMEd23WlxWPOzcN4s42R5Y
	fc3RuWZIK1QdPn21WPFCWnPKGwipDY0JsOpSq1j6qSQaAw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmcen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:47:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb9f59781so2406676137.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789343245; x=1789948045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cmOd/wtJBwDY+aB9upH1uIT8B7lNgLS/AKryTS4QZfQ=;
        b=VdaqPbiZIZZ3ZPB611qfKMvbVAEbqEVz3zIwPXR6e1v5g8WKnVXmZSdh1/4wB7z/GW
         Wao5wSZ9I5PrrUvZ6DE8kSM5tZ0kWg8Yawx5Nfd65hJCDuNXDwlqTJAtFG2hugA42ErQ
         KSTs0PBUSJZQRhRbZM6XHAIMh803ivcNDXUMVKxSauZFY7U2RIyrY0ulUU/C6mWsQPdG
         PIxpuPvS+nKk5WuvZLMiYLQMDSyCV1EmjHYbbgznCZbmEbHbKVuYcuRjPQ0w6rP3xrsn
         W7Qb9txwfa6NrqnL7m4/xGhuB0CEYW65NOLm3aVp5hF1iO6mP+AB6I/E43lckEa18cB4
         8E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343245; x=1789948045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmOd/wtJBwDY+aB9upH1uIT8B7lNgLS/AKryTS4QZfQ=;
        b=i1oNAZYbtMoomkXVZvyJU+Ed8L5dbddPW815tT9+fUs0GujxoR6AmlUhFlDZUUXo2T
         JuluveB3HmZiWGGxXYCUvtgLMEuHStU+sYhb5zFHYYjlR4aNVGJWX4qfiM7j3g4WMAw4
         zOVeZF16lpMrZS3zhOj5nGRvecBO8ullsu+UZIv2kcmv3UUiDqPWiJUMztRiF2QY/U9O
         xCCpw3Mm+EAkXi79BFXhbao8SjJHSenLBH4ZLr7goz+HXMhjrYNZNYKDE6tSuFpV+P5l
         g8bt4Z2Qmbw6NeetBGQ8ePvWlaR5PPm8+XShoAplp+GyrHiiJQDqxvK5jKmoCYmUbaxV
         9UHA==
X-Forwarded-Encrypted: i=1; AKwUvBxSSpQFuBoJli+H0sn45NhGhg3bISlAtjwE3KNkTtLmn0QlgeNptB4/zBB8koqY++uq94OmI2KsGPRwoRA=@vger.kernel.org
X-Gm-Message-State: AFuF++mD1RdtSexSTdOLueJZOxTZhZCn7stGCJ1rEhvIt42NGl+Zhv4n
	1wZoXCdvwunme98/cUi9eNROexc65tPepgLWuJIKO1EaGhmvXedoBpXy/hInW6rO/psrX5prmt1
	A8lKLmPMNXK4bKUQsWmW6yko2CRnBiTMFqxbDE6G2aqOit9jube3WByg0VyFheGnxBJ0=
X-Gm-Gg: AYBFou3SB+3gr/ss3xrB2GR5dhWMrBTl3x5TB7GtVrXatRarrv/ZmHECYTvQ5vbwTXd
	C1l4tbUkO6DYTBvWMAX9O1UyTcH3rzcx58Vy+DPp9rzjC8QBYs8XIBDwwIZgA71WU183IRVnI5Y
	/O+F1vNzpOPIXHly7oIDTHdWtRXFJr+torw7aPzd4quoHFQHDpsOBM9R/8VR9wyTnSEKkAgOuFg
	AZo+prX4PLlbMPuRFYo3l3rVvcFfHxDX9m71N2EUw7a4LcFDlXyc5aaD0eodLy92q3xN7yUbLyR
	83U2dp6eZu16LSe8FfDS2MseLohDJc6m4Hyk6SilE31YRA3oNicyWwxCLvsSdWKojm8u3nntpoD
	0rocd3/sb83IGJiWGmAW5T58QEjwmeGGyXCNn7MsBG35SOmfA9KNWh3IaqyjZCjXgYy7VWLqyHK
	4kyUjqKPMwg5Si
X-Received: by 2002:a05:6102:918:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79b57cb42f6mr40901137.5.1789343244862;
        Sun, 13 Sep 2026 16:47:24 -0700 (PDT)
X-Received: by 2002:a05:6102:918:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79b57cb42f6mr40887137.5.1789343244498;
        Sun, 13 Sep 2026 16:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263e0sm21888431fa.15.2026.09.13.16.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:47:21 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:47:18 +0300
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
Subject: Re: [PATCH 05/17] drm/msm: mdss: Add support for MDSS on Nord
Message-ID: <xmrrgh62hk4kdhfxt4xa5ngn7kc4f3p44dpvf2yfqdhkoxlis6@iftzpwpcc3qk>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-5-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-5-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-GUID: E2NKO7bnEgkXegutxsKveZawutqqidJd
X-Proofpoint-ORIG-GUID: E2NKO7bnEgkXegutxsKveZawutqqidJd
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7360d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ReDZFTIDzEE4zWO0opkA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0MSBTYWx0ZWRfX+BjWtlCp9UZl
 xVF6sHJs+3eG7vf3qBmgCug7gRQdiQXdCYHYs6viZeioWR1mq+7h8PbyU9+luuz3hDk5uzenvbG
 3FCZbYsyL7XW57PQXN4dq58vSjetr0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0MSBTYWx0ZWRfX12c7hk0AyKc7
 B329gsiuGT6rxNGRmdJD5l/E3ZouwiySAnLdIt18uroH0pzU8jwFGup+dW9dLZ50Ua4wOZyXBi5
 oqMZcz514m8P5wZiYaJkaEtIdG7bdTp2lgwTQ+FxPTRkwiOhhFefj/KEqZR6sIEhz3HHO91abWZ
 UwSQcwKCrNPqFCJ9rCLAmyg5EO071UK0brKgK2f3ZEgdpJVk9d6dEOR+aAIHODvFOQ/IAGdRulW
 /Oy5aXBk++ozrLOgf9AZAiy1Bl2OpEEtEMioGyjCdE536YUyILxIRKUJHfNcL6GTNrIzAEEJOwE
 /pGslDox6JT8EAgsZ56AtsLpTm8vVx1DOLEBMf0Na0H46CZPAICXOk2ExmYPlWqOYNKcmaMdYX0
 V5giCce6t0ppEJmJhOvYcqdME2UBBel1RbknWxZfeYJsNTIykevpHNxT5yNdTUDYRq/eSgnGNU5
 4i95SvE2JMBSFD7D2cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130341

On Fri, Sep 11, 2026 at 09:06:36PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the MDSS compatible for the Qualcomm Nord SoC, reusing the 57 MBps
> register bus bandwidth setting shared with the other recent platforms.

Why?

> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9087c4b290db..90bcc8c28dc2 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> +	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
>  	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
>  	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
