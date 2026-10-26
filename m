Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025481;
	b=ngkpdj/FsT6adZ2Cu6W7FAtaMDR7taOMZiKqP/rdy6xmcRWf2NvtBg9Y+p/4qExUpZMZ
	 9xvEoBjowvscJ6Xm6vGtzF8R/kLKyNchnWkl/qYtFA91e4KRBvWKAfCS/W1MfGrS9DYxj
	 FtEH/5be0hbsRl/Yojx394M8B+oy+hMaUeogNd4zk2Tz2bWbtc0zIYgxfAVTa1FEh8vqN
	 UGKHg0oozRJpXRejmI4Hvn/2H4zTPcIM1jDht1umpJ3kYSKn4ZFpuzOdF9+BlRu/hilXD
	 598GmDZ6MXmUTAnIsi/V3BGUAdgaEywd988ZaHN9yvMG8UcPNVKp9T47L36Yv0AMIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vye2QojP6EGv6J8Kkl73mdS48Ovuumpgs4z8jA+t2C4=;
	b=Lbg95R8W+uVVNiYGTOeKgoFXbHbv//vDL9Q9kk93xuv4Dpgnc2glWG3ziDtyMg6D5xHy
	 wCNjAMsYlpP8MnJk+4xdPstuocHcLBQ/CsL5Bv9RVJGCrMH79g/YrZS9ca8VcvlJ5B4+u
	 kkV0AyH6MthxZwsV9yMJRJwJ0Dp1WVbZh25Hz2TA21UQq9Nc3kZpiSPya3Fhx14RUGDSW
	 EuVqON+/zXw1srsn2SIyXLsErR7N47oAc1+XKhye0JZT7DS5sl0Q8JNnGldsnux051148
	 e1f/6je+ZP3dODRpKtqDldB4wW63Xx+rZA5waBdUiGkD4G1cm1jBRCKsBFfpTrALQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIpEEz2e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCpbZYWQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E95606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIpEEz2e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCpbZYWQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt27j2733255
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vye2QojP6EGv6J8Kkl73mdS48Ovuumpgs4z8jA+t2C4=; b=SIpEEz2eZw98yKhH
	fgoxNVcUqPhWnBenUcNvlM4tR2g6tnvu+Cy9rjUlQRqx+HxZ+Ypw1NDuFimrNKWa
	6TDG9tR70RKm+ncoDuTWu1AKThuIwlPv8L0w1HuMu4c9Itym3jLs63j9rAQF6t8m
	c1pULjxtauFDk/TM7m9xkTJIf5WwMMQXNwf4DVO/k0z2kqiHiGkOwQ2EhNUON/zr
	mzU5rIqqrm90hakqYSCh2skec2XWyrvE4wZj6npoTFwM3FW+SqJwOw1DBRZT/oPh
	7gmAmZfeH8IyhT28lecl1VU5mpl4jOPiEBLqztUXfKXoGlRLCmyolyGLmsJKILOW
	9dxgcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9501-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:37:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso646908385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025479; x=1793630279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vye2QojP6EGv6J8Kkl73mdS48Ovuumpgs4z8jA+t2C4=;
        b=UCpbZYWQgvOg13z5R1QmKBjrHRnqqwX3lxXLDWfOffh6ZADOLl9ArHXwYvp2vyL5BC
         /bGQrqdznLiXPBqN7wr5yqacYwGg2nbKfdM+CdXeWl3jTD2i8m4tIO/fTuIPTsBWOQm1
         UV3ReOI41UAh+ZmbyWNivMkxR4+vee9D6Fum7Y8mTBcjz2ibitUvr+kNzsb4acNlg+LQ
         zdZpNh/BrDHoD0DHPRICUBAaW7Ei+L71boOoYVcxQZUMPFi0+/9q7kejnZkLWstOkoXH
         v9erBaTxzNajLnj0eKnMxWkdHd9f2D3DNutSyz2PTb/gvki0whwezpnTEbrrYVAM5VvR
         maSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025479; x=1793630279;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vye2QojP6EGv6J8Kkl73mdS48Ovuumpgs4z8jA+t2C4=;
        b=SmNvNsflaZgE/xZEVpnsQy8PR2f75FmxZnQl5AabkZsLU1oKLFgMvWbbphyN0wYcED
         k/YNuOBtBvL0Tl7CdiAo5K9n5NvtY5ffTQwkKOAl7F16i+cEkuQq2zT5uVQ5cGrPlSNU
         9Ee795eJEBn0t3CMEC9kN6+4HjNRsA0+q35XiDGTY+QpA26YzhkPjUq3kixx2AbFXJrf
         Y9MlYdSmrvcWPVaDu7eQ8gXAtD7jDM1LWbdfpLrhqWrc3SPJJ0o5bvKcmUFOyHqHXQbC
         3SL/pH4KyLIK7Lwj1wnIWuuz5Rn1ubXg0wp/hEFNch2WWyVsWZXFk48gKUjWM1/qA0zw
         yOaw==
X-Forwarded-Encrypted: i=1; AKwUvBzEdY/MUlNJ9GDhU/xjFCD7T7TtX5s/wbFDFQV32AE98vrnQ1bF91AnmqEz7Dn/dzJL//00RJEVzpzzaLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9/2NMNXGmNSs97mQJRrl6U3/e5T92EusqNPHMMFYvaYWlkMKf
	N2J+umS9MB0kKp4yWHTXseu1p43m3+bRTJeXMZT83R5xWJPGB3QKd9szUqWuf5AHih+++sJW+d2
	sT/pv4oNM0oKBUUMm463jyeRd4QtxRX4IwwMMvBXM7ocTvUw9r54qcAzwnH0znM3UZDA=
X-Gm-Gg: AYBFou3LivhfGssrdfjDBZMKyNbFkFYrcRljx+TyKlPyJ7XVVyawFrjQptDGAhZHkZE
	alvVmtRvXNzIOF36VbWjcVRb0VKsNbTebHWy2vCF1d4XY0m5k4Pzu4Z8F2YXS66UsZVoevCQn4K
	3E7V6t/Vnn1ZnQEhQPEcJzEtxYAOLVaQP++mH1eDwaf83FIgi5iizFCLIO6sMruTQYn73hof2CG
	AXc4qF7/cI+yEGcUdDtknOG4RVmf9kQZ7CXVfvqcGrlttpsamLQ8ul2ZfMELinwy5u9bSaMyZoN
	XPZTWlQIqnyWD3PVRJZw7/BxS3kIKodYAEbWgaUg5Jgj8C0LNvWVTAT5FcxkQRhyxP/Z7CCIx2I
	66AdYHi4nI2zPmD3mFb0=
X-Received: by 2002:a05:620a:6187:b0:93e:9508:8360 with SMTP id af79cd13be357-940ef914a88mr1135332285a.27.1793025478500;
        Mon, 26 Oct 2026 07:37:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:93e:9508:8360 with SMTP id af79cd13be357-940ef914a88mr1135325685a.27.1793025477836;
        Mon, 26 Oct 2026 07:37:57 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d7c8sm3777243a12.8.2026.10.26.07.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:37:56 -0700 (PDT)
Message-ID: <272c9cff-608c-49e7-bfe0-c41e600c60fc@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:37:54 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v11 4/9] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-4-0c2937195298@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261023-camss-isp-ope-v11-4-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX0Xz/jvrNDzLi
 d/YxGswO+ZnJ1rEsxTF/to5mx024uw4LTGUao52LmljA2n5oaQR0MMeNVPyxMkvC6IU7jvIi/Tn
 0hJmNtlfYFiMrcyzfkf0KLExepPizUiVo4PqrwCNYWL7XhY0ZMIHby3QiD4SkW2XQUkr7SfXmRh
 4J3wj3AiMz1vx1paLXo5UQ6r6C/NPs3sDxFzGZvF4h5qQIO1xhanPNjznxD5j+0Zm5lu9J8NqfI
 ERlytSIVxiWzaQ+1nHaSElTAlatcWx/TZ6L/lXZsDGe9BgBudSwY0lqAcHisoIadSqDX+tQuoF7
 ft9q1um3mmQVuWJmcoyDPPMXiDJCFuzXc1tlXBDGsKFBJnJzhz8ZCDE0+dy6Iv9i8fosM23TGNf
 +3i29s09V4zmTaN6/EWwS+8VvS0dvCSJPFhfCiBE4Lq4nBYm+7Ab5wmTi/2Z9jgTnt8Vgf6DVwG
 HJIrwa2LyRdsxGJqlvQ==
X-Proofpoint-GUID: QZ9Dwd4XWeQuTvPThlHeXjpwQFab0Lvh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfXy80a+Rwnrokc
 GU0VLOW2L1iIl0wWZOg2RzLr6uEjqCEHi46c838tfuA5uomp4AhA9aE6yBg9p2A0Lg9XWEwh7i9
 y71YUpLeUTrVW0+OqVvAjmj1KxMa6vI=
X-Proofpoint-ORIG-GUID: QZ9Dwd4XWeQuTvPThlHeXjpwQFab0Lvh
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf65c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Lucp4ZlCNH_4nIn85hAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260058

On 23-Oct-26 5:09 PM, Loic Poulain wrote:
> Add the uapi header qcom-camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> The block type enum is shared across CAMSS ISPs so that userspace only
> has to deal with a single set of block identifiers.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Also I've a test camss pipeline handler exercising the wb-gain,
color-correct and gamma parameters, as demo-ed at LPC 2026 :)

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
>  1 file changed, 212 insertions(+)
> 
> diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..5756d165e7e873a6d268909da077acb6f5f56054
> --- /dev/null
> +++ b/include/uapi/linux/qcom-camss-config.h
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Qualcomm CAMSS ISP Driver - Userspace API
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <linux/media/v4l2-isp.h>
> +
> +/**
> + * enum camss_params_block_type - CAMSS ISP parameter block identifiers
> + *
> + * Each value identifies one ISP processing block.  The value is placed in
> + * the @type field of &struct v4l2_isp_block_header.
> + *
> + * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
> + *	&struct camss_params_wb_gain
> + * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> + *	(CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
> + * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
> + *	&struct camss_params_color_correct
> + * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
> + *	&struct camss_params_gamma
> + */
> +enum camss_params_block_type {
> +	CAMSS_PARAMS_WB_GAIN = 1,
> +	CAMSS_PARAMS_CHROMA_ENHAN = 2,
> +	CAMSS_PARAMS_COLOR_CORRECT = 3,
> +	CAMSS_PARAMS_GAMMA = 4,
> +};
> +
> +/* Number of entries in each gamma channel LUT. */
> +#define CAMSS_GAMMA_LUT_SIZE	256
> +
> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * Implements the CLC_WB pipeline module.  The pipeline applies three
> + * sequential operations per channel:
> + *   1. Subtract sub-offset (black-level subtraction)
> + *   2. Multiply by gain    (colour balance)
> + *   3. Add add-offset      (output pedestal)
> + *
> + * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
> + * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
> + *
> + * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
> + * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
> + * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
> + * @g_sub:    green sub-offset, subtracted before gain (16u)
> + * @b_sub:    blue  sub-offset, subtracted before gain (16u)
> + * @r_sub:    red   sub-offset, subtracted before gain (16u)
> + * @g_add:    green add-offset, added after gain (16u)
> + * @b_add:    blue  add-offset, added after gain (16u)
> + * @r_add:    red   add-offset, added after gain (16u)
> + * @_pad:     padding for 64-bit alignment, must be zero
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 g_sub;
> +	__u16 b_sub;
> +	__u16 r_sub;
> +	__u16 g_add;
> +	__u16 b_add;
> +	__u16 r_add;
> +	__u16 _pad[3];
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
> + *
> + * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
> + * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
> + *
> + * RGB2Y - Luma (Y) coefficients
> + * Y = v0 * R + v1 * G + v2 * B
> + *
> + * @luma_v0:  R-to-Y coefficient (12sQ8)
> + * @luma_v1:  G-to-Y coefficient (12sQ8)
> + * @luma_v2:  B-to-Y coefficient (12sQ8)
> + * @luma_k:   Y output offset    (9s,  0 = no offset)
> + *
> + * RGB2Cb - Chroma (Cb) coefficients
> + * Cb = a x ((B - G) + b(R - G)) + KCb
> + * with:
> + *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
> + *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
> + *
> + * @coeff_ap: Cb positive coefficient (12sQ8)
> + * @coeff_am: Cb negative coefficient (12sQ8)
> + * @coeff_bp: Cb positive coefficient (12sQ8)
> + * @coeff_bm: Cb negative coefficient (12sQ8)
> + * @kcb:      Cb output offset        (11s)
> + *
> + * RGB2Cr - Chroma (Cr) coefficients:
> + * Cr = c x ((R - G) + d(B - G)) + KCr
> + * with:
> + *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
> + *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
> + *
> + * @coeff_cp: Cr positive coefficient (12sQ8)
> + * @coeff_cm: Cr negative coefficient (12sQ8)
> + * @coeff_dp: Cr positive coefficient (12sQ8)
> + * @coeff_dm: Cr negative coefficient (12sQ8)
> + * @kcr:      Cr output offset        (11s)
> + *
> + * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
> + * @_pad:   padding for 64-bit alignment, must be zero
> + */
> +struct camss_params_chroma_enhan {
> +	struct v4l2_isp_block_header header;
> +	__s16 luma_v0;
> +	__s16 luma_v1;
> +	__s16 luma_v2;
> +	__s16 luma_k;
> +	__s16 coeff_ap;
> +	__s16 coeff_am;
> +	__s16 coeff_bp;
> +	__s16 coeff_bm;
> +	__s16 coeff_cp;
> +	__s16 coeff_cm;
> +	__s16 coeff_dp;
> +	__s16 coeff_dm;
> +	__s16 kcb;
> +	__s16 kcr;
> +	__u16 _pad[2];
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct camss_params_color_correct - colour correction matrix
> + *
> + * Implements the CLC_CC pipeline module.  The matrix computes:
> + *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
> + *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
> + *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
> + *
> + * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
> + * @a:       G-input coefficients per output channel (12s;
> + *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
> + * @b:       B-input coefficients (12s)
> + * @c:       R-input coefficients (12s)
> + * @k:       per-output-channel offsets (typically 9s effective)
> + * @qfactor: Q-format selector (2u):
> + *           0 = 12sQ7  (range ~-16.0 .. +15.992)
> + *           1 = 12sQ8  (range  ~-8.0 ..  +7.996)
> + *           2 = 12sQ9  (range  ~-4.0 ..  +3.998)
> + *           3 = 12sQ10 (range  ~-2.0 ..  +1.999)
> + * @_pad:    padding for 64-bit alignment, must be zero
> + */
> +struct camss_params_color_correct {
> +	struct v4l2_isp_block_header header;
> +	__s16 a[3];
> +	__s16 b[3];
> +	__s16 c[3];
> +	__s16 k[3];
> +	__u16 qfactor;
> +	__u16 _pad[3];
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct camss_params_gamma - per-channel gamma correction curves
> + *
> + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
> + * holds one independent lookup table per colour channel. Each table is a
> + * direct (not segmented) map of input level to output level.
> + *
> + * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
> + * output. The number of significant output bits follows the width of the
> + * engine's internal bus; the upper bits are ignored by the hardware.
> + *
> + * The module maps a 12-bit input to an 8-bit output: the top 8 input bits
> + * index the table and the low 4 bits are used to linearly interpolate
> + * between adjacent entries. Entry i therefore represents the output for
> + * input level i/255 of full scale.
> + * Output range: 0x00 = black, 0xFF = white.
> + *
> + * How to fill a curve (same on all three channels for pure luminance
> + * gamma; different curves per channel additionally shift colour balance):
> + *
> + *   Identity (pass-through, gamma 1.0):
> + *     lut[i] = i;                                // i = 0..255
> + *
> + *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
> + *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
> + *
> + * @header:  block header; @header.type = CAMSS_PARAMS_GAMMA
> + * @glut:    green channel gamma curve
> + * @blut:    blue  channel gamma curve
> + * @rlut:    red   channel gamma curve
> + */
> +struct camss_params_gamma {
> +	struct v4l2_isp_block_header header;
> +	__u16 glut[CAMSS_GAMMA_LUT_SIZE];
> +	__u16 blut[CAMSS_GAMMA_LUT_SIZE];
> +	__u16 rlut[CAMSS_GAMMA_LUT_SIZE];
> +} __attribute__((aligned(8)));
> +
> +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
> +	(sizeof(struct camss_params_wb_gain)	+\
> +	 sizeof(struct camss_params_chroma_enhan)	+\
> +	 sizeof(struct camss_params_color_correct)	+\
> +	 sizeof(struct camss_params_gamma))
> +
> +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> 

