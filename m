Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A538DC5A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339886; cv=none; b=f1JrWTjUujJahjSDympDx5SSKU8X5TDVjVRWny/59uaV4vKbJt3NxO0vAdp0HrFGkf4rZUg26aW66OgdGtrpozEXmSfI9DRz00wW+Xtmqd8dstodBCie4WpUj5fwv7bx+iZQUeIbZbfISMqGExGObhOTeY0w1HTp+hs8yrW6WDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339886; c=relaxed/simple;
	bh=xPoaboMMdHnZFam4HfRn3NpLX7dSPbRXi6l5ULEulr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex4xagP3hCeGtis/cl+1mUVMRE9I1dJuIMRP2ZRaE7Yk99UEs4Yl5ngKln3cxS5Ka3Aya4LKcWQVyTx+NKJljJ/shCqo75HF+FTbAWkbdSRW1xGxS0YRgmYm1UmGNNgUzt2UxiiG2P0k3j4+1tWeVe3L/j39EcmLug46XbDN8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSN3ULp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1Sc1wSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSN3ULp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1Sc1wSn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxcl31926297
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btDF+i2KLcySKsRDG04ke9EX
	GqLGBKkYRlkEl3KSsbc=; b=cSN3ULp/jmbD+RpqhvAi7G4b8xI5NHqzdYnUZhQk
	pqRdi8OFg4yp6abdziJVVvNQxLPekTUoi2qzD+Hf6CUBJY52mICx0i+Ild//Ou35
	cv3WwDThVV+NN299SEV0hpMYpHSNwQ+6XYCpWNzK4diPVU90zzLYiejU8LUXjatK
	ocOuYsNom8HvdaXAbadzhrtybdJLnz2OcOF3OP2UVbplsG85bTwkdndc1wOrUOsi
	22pcbkOiL3fe+wZJUqic9K/G/UBZx7yiNiVjQhvqDoPqLjxph6Z24wMWk4g2d559
	0vUESeSvhT7fybc3nCMhBJN4uPKQrfSJ3Ye7FY765JOdIg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018m5c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:51:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78a686d205cso2256008137.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339882; x=1789944682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=P1Sc1wSnPDl35ZSV1Lue9vuK8UguS/EA/s7MQl5tDnjJz8vDAdNjfuVFtuBcLymMeq
         +Nu1hafQukMJ27ENnkRJzWQVQc1q5oJPcAhzIDoNIHTq/trgiDtgGn+a2wqcENYq4ZVz
         W2YnlKfmrtsjYWnUTru8Oz0aiV964K4drlZ3mRd1aFCqmiLGbCr6sgbRtz/7PevOW70F
         Nxutw5bjf4L7Z0nN32laPVLHHeB3bBMqfGZGuLmA2HWCjPlWRKun3P+e3hLVGm2uIzkI
         uGCRnTRr0Fr0FDKwlvn93dNHy/YkDOv6Oslfx45aCMoEx5QJJK6yTTzQdNR7jgf2wLDE
         BUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339882; x=1789944682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=rCqJSLBI5+akfxcN653fS2Cu1OIRwDSVrELSFUD7jAfMTTd/ZRV7MSvt7mVcFxtzk9
         H0KuvIEmHSzolyLrI56ZCwyxocWhbi2ynyrOlgpkatZAr0nFlYQ9YxWWIyT3OTW+jSoI
         YbW+9wuca223uqn/tbP1k8WkTd64VAkNymCbfBsOMYfM8bP5ajxdkmhgOwzvYQFGY3nn
         tYmE9LmlKB/4bL1MTRYWlOLrXLZMl5YOftfUxxk3/saidYiwJGufjkLZiZnKCTvRfJE9
         To3ITVIp60aErbkA8rpnDYKm+ISSTcsNhR24YPT8EHhZM4dkc8XWTRRD7GuFA55VVV+a
         AoPA==
X-Forwarded-Encrypted: i=1; AKwUvBxURbJwyeCdyS0i/jMvJzmx4bEyO9Xl0eIp3vHvDAxT4Axpq7H2kkBQ6rCSVJkBBR1rDHfyzCd76Ji222o=@vger.kernel.org
X-Gm-Message-State: AFuF++m0hE++rkyLAY6aZpaCpSBsAagedeX5PHJZImXtdsmSkcwEig/H
	k0B5WfGZj7nm3kf2bYbg7C32N8DoE+wDjLCgTYkRIwUaAg8ichsIwYO8PNFkwVHZUJon6XwyzIc
	6jBuvFi/Ol84yyqc4S07gTsdSt5OehoS1KXpTL0I/pSfDlvOHzd9ouYvyQynFAeyCM9s=
X-Gm-Gg: AYBFou2DA/mdAkny01+URzl9lu8eRShMNNx3wfP8QEbOggIBS/gpjG2TGgU0Cxnats8
	cGTBN537x10psw7nUSBWTWqXsFV0aztK/5RVH7qSiyf1idGDOYcmgcfhPWgY2iWeB1ibjtytbAC
	zb+trxTtBkVaowyyUrKXsb3H957G/RP/DPsf1L0WsztDD6FaOaPBLTPZ3T+ZGV6B67LAYQTtIaA
	ey0QtAAw0sUjciNT3pt3fT0nDJEEWOJUYfJYaZAiD3mXEfAZxmItbsjNR1xJHDDFz7LVuy42LpC
	ly1PweU5NsUWLj26tztGn8gaPjfe81faqT/Xmblwb5trKlXWpathvYm2RymuTy85QFKKsI8gTHW
	YSd3Upc5E5Cs/mZUXATUeVCBcg4hFKD5LhDUKtlxw/WGQ0toJE2lTejN/pZ92m32k28Vk/zYxrp
	HNWuTu/PA+JUu6
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888841137.2.1789339882086;
        Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888827137.2.1789339881698;
        Sun, 13 Sep 2026 15:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm2086254e87.80.2026.09.13.15.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:51:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation
 in the example
Message-ID: <acryik4zjxxt76ldqk46a3wymgettocilimua4tlm7wl3tvfo7@yrh36odg6fju>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa728eb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX9I3RWwz25csF
 cm6OXiz4KgGBGD8fqeRabTgFaQbmmErU0yfbbhgiFtbOqkNvkS5wLIrzjNyfnfTdgPMjd2nHgrM
 7K/tL2PLFADdpjZM4n/1fUSSya/YQ+s=
X-Proofpoint-GUID: 6d22QEyC8-I_JmoA4g1KEHM-nLZ8Bgh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX1BZcoUWwLC1q
 mF/zhgN3OhcurDL3Yy1adnA+ktQXJW4F/zJO7XgseGW+W89wnTXYj04709szv1n0Dn5DBj5jig9
 +TSOYEQ4ASdDBs4nIvaA7c3RFpki71QjAzDlQHU8XxS7WmJo/hTSc4dBG/1sFKBDLDCU/Rk8JyV
 Y+9LTvbiGLCgsgbvLrGgJVzWscU1liGZiQqHqEnOlFaoZb6/VTMHnjMp7CgHsjrGC+woBp6OCY0
 FoYTuVaO1ZnT6hcNdPVO2shExOn0ur6z+e/7D+cjlL2dAxFDiTrBX8BQrieD4fGQ6ZCuOosONiR
 SISepeXlsz2tNRZTQ9zucXlN+SEjYB4GJvBtEWHnrteQl3v7ghDbKHq6JbFcjRwKie5z4xe7ccD
 Jd7r/V4LEQhe+i76gcLbdkDHB7AQiTVQA+jfStvFW1nCbmRi+AMF1Yl/5e1bTP1Q4yApoEQm7Cv
 hugT3cj7hZzABkD8MDQ==
X-Proofpoint-ORIG-GUID: 6d22QEyC8-I_JmoA4g1KEHM-nLZ8Bgh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130327

On Sun, Sep 13, 2026 at 02:33:33PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
>  .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
>  .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
>  .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
>  5 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
