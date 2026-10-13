Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775DA3EA97E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886758; cv=none; b=Eq0ATE7CEFentXWq7HaEKGlU7V69NAmAHDe6BjPJlhA+8eEIl5ndnrVDaimvCmbEF92AmdYHuv7fTDid7K1SEqUdrccIBRoRCI9340+AeqjcOeV/CIinLPdJcVFspkjReg6RMPXA8oPduJKcf0pXI80IEURr/fi511/3R9l8EKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886758; c=relaxed/simple;
	bh=3xSL9LPTGLgFsEJgy6ZzYNM745Z+ZyKzpW4+6bkDYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUhOrics7QS1+/cMzpTC8EwYKGo5BJiiXVxQght2twDpnJk7RAXiWV3pZ7gnLao+z6Vd5E09BO8hhfQvysTntXC4veTPpkWEkMPUYqnWcUd0jKRfZ4DJww+YcDNNy1A3zERoXY2NeVJU6RGugfYnt+llYSCpGTH5u/UF0fMIdwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+SsL8wG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IffmXmL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+SsL8wG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IffmXmL1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8IQK7922903
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Hhfq7fiw28ZkDfvmDF1BDlx
	jnaYKRw6TyjN4JrVX4g=; b=g+SsL8wG0HIRiVNkfIddsxB99Jn0oQla+0oDMREd
	rxMP5t6pwMbbuo83h6PuLoOT7kn7YDI0oK6C3XcnmZX0WGxNe305I3U+KJYc8xBj
	jBEM732rBJMa3TVw1wPuwaMus54MJa9KblXoI5u6WE1OrbwoxhTpYSCWruiu/s+n
	Z94zeoPiTilNEsFbF3f9bYFWFpyBh5heV8wzJNRFrGKJHmV6jjd2alQUPBnSXnFC
	CO7DCf2clXltf7sxLa1c5y0ur4ihe5OngyWKt/DV9TnLxaaXHLZcsHDuHTyJJo39
	9tXB9FyZoQOkAoG6dxU3GMARsIH+6Z1bAeE0/GHAxslnlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tdje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:19:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8067974so716434185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886754; x=1792491554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Hhfq7fiw28ZkDfvmDF1BDlxjnaYKRw6TyjN4JrVX4g=;
        b=IffmXmL196GpZYYhpoBu0XqCES0gQWLtrSJVmwToVor5hQS681qImCvtMP5hsMlQxd
         PFk1ITozzpXihARC1BdJXvbc9dH97Q7aLcufwtGz2y9vIGuPmvnOfYSKMXQ6QajlZ/fT
         9rZK7mvNXT5sXg1GuBBUBGOWnM55FipovGXqnwwsBh96XSNS8EB6YrIFsBibxEb9G0aD
         Fzj7Ru0Qk8eQSuhE5ddEulHD6nbmeo0zAiDPoNqhTGMr0mGeFXjOOIDo1qE1lIPBklrl
         YUeJVKF1m570A+07YqtJFY3uS21Z5D9Npia/DPJNINKwPAQy9G03PRUcWDMg5o3OAeul
         rfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886754; x=1792491554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Hhfq7fiw28ZkDfvmDF1BDlxjnaYKRw6TyjN4JrVX4g=;
        b=oIxyfBEiXdyOluZ7Z72g6nucrS+wTr4RkbhV39DHzXIOCHswBCfpuFAx04MX7r3wZO
         +xiq7sHCD1LLJcpqyPrwsOVlLSlozVwPDl2nyfRj0R4U2m62MWynCIP0p5XsHeyfoG0k
         TzNZgv1aOvWAtHYwG1RHHEAE2JrSWd4e3fX2XAl3scq2Awn1Pv8xKo7wDgRbMEZ7P8Y5
         kat40VvsyxPPtTuNT1XGfkUl3Ll2ZtWio7w2SFwB2YNSyAG7vu+mkCqPSU8WEGvJFH59
         t2WeU2RlrNmvEA/fcrwC3C9tq9XEdNSFO9v+06rnbIk3zQDHogxRcTfRA0M4/eb5dyiL
         HGzA==
X-Forwarded-Encrypted: i=1; AKwUvBwx/oo0Mby7wB5pP28ytiPCo3rCD+zdygyN+urYlI+THg6CFy4U3Dumr6DEEAYZFUy8d1+Pu/1HFgCNWP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNycKx9DCp4xJmuudu/KdAST/yCClyQSbMdHGVqJqNG4Xr3FOM
	X6no04ngvKII0UdQtyjHGN17+rweMJmhUvfmagcjqCu6XqClbtHI1qW2bIo2rcxvT/03+ROtCwQ
	mlCa+6hDsTmQzzprK+p2EBYjEHgNPm37bZ3QfIMDJcOFbaEO/mWmqXGSB0OioB3lWtK4=
X-Gm-Gg: AYBFou13UbTM/sjZ5U+lrGJchcrhao70AHRFaQqfM4jDw/ulL4yCshxZMZy5NSdeb+m
	QUV7DcDoa14pXvSvS9mw/dbWkToyfD8C24GwHxuhbN8MJmq1v+BfVqElo28q6BepKxR7Vr2x8k0
	iqYfPUYIfIaWoq7FcJivs7JHBZ2T2/7Twh3K+McDWY+sFIrEVom7xcAMrse9PkNBoHFzMQYWIu3
	cAOZ7/jAqngtjYBBphcseVFd9wrhTDGPBjnYzI6vm+t7pNPYVxwUrbCzphsw9pa+j6KBpIpvFyH
	b3gY+ytlDG7rR/ig0maUCKCJKoKNm3w2K+NK588H7qa99wrZV/wDTe7K5DtOT2gi+SqDFr2VFzJ
	zVkGgEbr1snXqvkIphOlnj08JsSc/3gMSO1UmMlx0Hmih5fdKrxC5EPAM6ZkaVV3HMOEXvnN6xT
	ixgjf2BtsZ19Sz
X-Received: by 2002:a05:620a:6405:b0:93d:e031:5ad with SMTP id af79cd13be357-93ebd224911mr1904654085a.17.1791886754573;
        Tue, 13 Oct 2026 03:19:14 -0700 (PDT)
X-Received: by 2002:a05:620a:6405:b0:93d:e031:5ad with SMTP id af79cd13be357-93ebd224911mr1904649885a.17.1791886753984;
        Tue, 13 Oct 2026 03:19:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf282952dsm1594993e87.7.2026.10.13.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:19:12 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:19:10 +0300
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
Message-ID: <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace05a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zGc1Ob07GAFFi9FfrWcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GR_idljn8ZF8-X_1wtYdamwLAOIDeRmB
X-Proofpoint-ORIG-GUID: GR_idljn8ZF8-X_1wtYdamwLAOIDeRmB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX8JIPtVa6kp53
 gnu6VfQ/Ikb2hRuL1sb8uyZA6XbnCtZw388jUeWx42evtxX8nUegcG6RbQWwR1DFJgIyINWUjaR
 4VwW2ne+RFfg9zcrlJSyMNhUCvOEWIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXwLunFTM2dAnl
 RwbVV0qFK47xU3VdCSQi/vMGSPN31aMK8sGldjHy1P++/ayCAxi5YY2JskD12K5BMXKB94HMEHF
 Xqdn3xwKj8CovNZpENR6YoRsE/BOT4LqL+K/J9lQQ9XdfwsnLJwnz4a6sPxxnQwFYv3RzUM1rGe
 x2lk0GDtxSfCQRYVAsAZ+Ro2AJwpQ7EujCYrqDPRty0ngbretMGOYe8r77GB+FCera3mTykonKI
 JvfeKH+lFgHRBZC90vDMWqXgELbG7CB6H/mrwbtvSwas2f5rhcAMfW7LACbdMgwEsx3NKsFM9Bz
 cKMdA6GnZu3/vV7qq0TQQ0afUmnCWsQq1JQ+bHsdq7ZWWwhP31VyikUfhx6BW0wtWOxNDDZlSKY
 xBH8Rh3j2fhJ55kT14L+WKLN0uVItO55/+6IJfH22cJU46brzwHufBmMKoXaMbWChHxnee/LrWO
 UntXB9Nurq7cx6syhgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On Mon, Oct 12, 2026 at 07:02:17PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates several DP PHY and QSERDES v8 COM registers relative
> to existing SoCs.

Why?

> Add Nord-specific defines for the relocated and
> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
> phy-qcom-edp.c so Nord sequences can reference them by name.

Typically we don't do it, If something differs, it should get its own
set of headers, describing all necessary offsets (especially for the
QSERDES). Otherwise it's not obvious if other regs (without the _NORD
counterpart) are valid or not.

> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c                   | 7 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index a3c893f72908..d5c6835b6c70 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -42,8 +42,15 @@
>  #define DP_PHY_VCO_DIV                          0x0074
>  #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
>  #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>  
>  #define DP_PHY_STATUS                           0x00e0
> +#define DP_PHY_STATUS_NORD                      0x0110
> +#define DP_PHY_LDO_CFG_NORD                     0x00f0
> +
> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
> +#define TXn_TX_BAND_NORD                        0x0024
>  
>  /* LANE_TXn registers */
>  #define TXn_CLKBUF_ENABLE                       0x0000

I'd suggest adding these together with the actual users.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> index 93edabb830af..008b17222a8d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> @@ -48,5 +48,8 @@
>  #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>  #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>  #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
