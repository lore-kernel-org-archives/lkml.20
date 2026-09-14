Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E25285058
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346729; cv=none; b=tnI2wAj5gCuItACDr6NauxBQ/18cdQ+IXOzsPOlplXi1F5iwfZH+zIDOP5AX8jhWw2N1qmE2b+BdUZLgZ03XuEac/nMCkuY61v3KY7M/omdKbaNCr3VVaBlMtOXeqiL6YWZklBgYYHBXu/Iq8Obc3C2wpE7HJjZn4QXbA5enKs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346729; c=relaxed/simple;
	bh=XzMeoPZutr59xPBNvG3H53GR1/lgdd7UgAsCi8EaT4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRyx9M5IR4Pm/fgAf3/ZHd3dY8ZUJnFEHCOvj8K28Mh+I5YC482QkWZ8eDeAAvZZlGQtR6PC/JjfeyZPheFSAfdpg6qav+w/dkpxXnX77iqETjaW7haxMfPMgE+STG1Ffx3oo0MYm4BnVem8YJRPeEsAWfgpm5CtEmP0Sz2G59M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV4RbnyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCNVqMQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV4RbnyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCNVqMQU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06OYV3348700
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m6cyjb8rvJgjpNHcKIGuyrR4
	K/63avLkOqM4IYNdfLc=; b=pV4RbnyS+ZKMb067rnZasHmxkw5OKRNsqUexRM0r
	gLmXg/DXevHf8mGodUB8QyzZnDZAl02+F11Egy56d6rdUCAAa9uUjkPH+V5cnMMD
	LpzwTrQPNMqLPQYuh3X/II0l1XNsoqDcONm/QPB5tnJcfUMSBD9zNkOFlMMXTJkw
	23U2BvVhNUfIWJNjRTDirs8izA22ZC8pLKGW9Jnc4evYRParlF1JMO6GOm50qzgk
	2pYq5r28xIWBLmOoKtkCVf8jnP2DS4IGYlYeUVfxcAgZYquIG9DtPRje95zrslnW
	ZXwtac6UuS5talmniY68gJZTDeGKbxay3bZDh8DMd9lR6w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsr9pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-798c310ebb9so640867137.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346726; x=1789951526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6cyjb8rvJgjpNHcKIGuyrR4K/63avLkOqM4IYNdfLc=;
        b=TCNVqMQUKZoyYuzKEzScBitp45NAjnY1aesVrVabg/Zd984XiPz+yBtqap/0z8Qngt
         VHmS0QWX6cRh4jG/lVcDu0RNe63Z5shvVwiePmDVUmwku4Zm0XPnMJcU9d7haQS6Jl8L
         tn1NNd8Y2ItXltqtJ9GGQTVVvfQuYpK9YzxzixLBP9Hoip6MCTJY4d7IESCIc2gIAs/K
         sBSJCA9ZNbi/7Gfb2PsXu/RBuRfYtBXlkTo3gmEHx3Jm5GY6IbpuyYdg29SeLfIWVpIU
         iHltM/0KMiBGnehgtSc6SjEFVllf+UxVM/wzz9UmBZyUWskgvtXjxFLagIlumRmUd4AA
         dE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346726; x=1789951526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6cyjb8rvJgjpNHcKIGuyrR4K/63avLkOqM4IYNdfLc=;
        b=PCh8Wcpvf3c1QONgIv1Hd4WO7Uy4+jQtK6agUTBXdHvJEMCOz5C6LxpKVlCLUFeeDk
         Lo7UDNp0HYpQ2yHorZfJql5oqnpTkZf9PC3tcCeyejwJeMtzvWpWkIFdIG6JQAEsllqj
         5E9IAAoqBrAKWWORqsLXItvyuhDivI3eUdeTp7bAcdYeWCWcyDBCgOs7nAf2QvaoMC/S
         WHWOJskwz6CDjWl7PezL3EM6nzbX4DExRKlD5PhP2QgJcN3Lo4VAWlxrGFPYaIZCorYk
         SgCHYDllpT6H9XLKLT/Nq+EzGJqQFwBeYXFjmptEGmR74b+0GI8crTaC/dLo5XCHS5Fq
         lZpA==
X-Forwarded-Encrypted: i=1; AKwUvByR5/wnxzQrCv85gf/8OGDZF7VDVnHgglFTbzTVP2NX2hJ3vLrBCGuk9xWmfx9libgGkiz7LS6uTplmIng=@vger.kernel.org
X-Gm-Message-State: AFuF++kkPVI3zekkI6xe16DMColHP6O2P9E8k3FYvxgPX5oZf9obRRBh
	5IXUIo5VprKZS7ZdT0uR9021mHWkmlaFG2M3AC1LpWCrbrA9rPiU8H5doZCHsJiIpbtK5gR2W9q
	XCn+KWC6wAB63XBZDEmjdVnqWoSkdb7TOR6m6u7HfhAYrJNqmn14TuIRJ/QGCsKA/Cj0=
X-Gm-Gg: AYBFou2rt/WlS3xblkxiXWVTlon1lnNwjvuwYdqdGPGq1RhXk3zto5FKzYc2vKPMubp
	fmrHdeJQKO1BH2Hk3bfpYRxbrjUQ6OD1KfSlX8VS5UzbnxFf75ygnY+AhmgUd4Ryaq/uqUuH7dF
	TuOkKz8Y5w94wGQc7Ul1kLJWVJTATAJmzOZqmqDA2aXPrl/2pWwYhMGJkS+Du7jYZN1fG/WQjan
	U1ILAh2SUzNKDeEac5694oFQOxRwdYIDD2mQRRMTzFZmKBiGY6w7dERr6t14cin83KpKRiEaAix
	vJh0xdltwF6hMSMnFIowwCjJN6m6mHdS7lO3hAYUo/MiplJpWGZ1VuF9Ma02+P8dneUWKpymkJo
	C2RBwBzG29QubqCkLfrNWEihNXN2MnKYdsOUOChdMotP8Cvf6yjLH14H05Qbxpc5g2Ko/444yXn
	mAXY9W5kKXXGgW
X-Received: by 2002:a05:6102:f09:b0:784:b882:9567 with SMTP id ada2fe7eead31-79b5838eb62mr114034137.6.1789346726004;
        Sun, 13 Sep 2026 17:45:26 -0700 (PDT)
X-Received: by 2002:a05:6102:f09:b0:784:b882:9567 with SMTP id ada2fe7eead31-79b5838eb62mr114008137.6.1789346725637;
        Sun, 13 Sep 2026 17:45:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04795d2sm2093901e87.68.2026.09.13.17.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:45:20 +0300
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
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
Message-ID: <uw3yo7jli2pv7byofdezzhklr62fegzsxdb4l6umq26nt72r6a@5cetzwxi7cvn>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-3-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-3-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfX4YVWUKibC/uC
 XfuY7RZh6GF5Z9b273rwlk2o1Kd6yihwX5KVakIOhtFlFF0RtZ6zEoSmPnEV63EuAZM9dASZzGL
 8Qcxp8hEdy2BPQ5KNUOrYhHYmvGHdG+yXA/4GRfKK4A+w+tI5KmKtM2cwLuZ1J9HItODf0YUDGU
 ETYAlRfvc73Qxyvd6lfcWkLuS1BI6i3AoesjPhgUyBr3FSxGzkHGqROakKrnm/BqVKPDlE1ae++
 UNlqIW8ne6BZXyVl1QkEDv4YPGsfbia1G8hF44mzcMAwdk5PweHr8+56UDy7m2KF1pJhbsKuhhw
 dIJIXOzmr7GHFyxA5K784dCdMlTss9uEpEgd8z/J3+3nG9RyruCY0JaKKqixsWADwXrTIxDhdMl
 Rp7usv7856P5vilG+r0TDNqq+PrH6OuR0vR4JcUmOU1QWrSjR4mGSmazvj1aAV6WFoAmVN5Ra10
 dGZ315W9i+DeDHGq8qA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa743a6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1VKk1TRdkn99K7eK9r0A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: RIgIQtmdOv5ApbasEohHasYEYnRXO8FJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfX5xwbr6cRK+9E
 IvsjEYYKrUls1V1Y1Ew8gbEfqCws/9GzO95/X+mqF09iH0/Nt9vASCUnJuvi47hMQ8i86XiD/k5
 XFq5FslPnHA/FSp/C7GTv9gVbEOvaZk=
X-Proofpoint-ORIG-GUID: RIgIQtmdOv5ApbasEohHasYEYnRXO8FJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140007

On Fri, Sep 11, 2026 at 12:29:36PM +0200, Krzysztof Kozlowski wrote:
> Turning off the power in msm_hdmi_bridge_atomic_post_disable() should
> follow reverse order of powering up, not only because it is logical, but
> also because msm_hdmi_audio_update() accesses registers thus block
> should still be powered on.
> 
> Depending on specific timing, existing code could have accesses to MMIO
> of powered off block.
> 
> Cc: stable@vger.kernel.org
> Fixes: c0c0d9eeeb8d ("drm/msm: hdmi audio support")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
