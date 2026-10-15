Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821165221D1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068258; cv=none; b=oynlDT6XGzIevRlX2MDufxTyiTkrIKummigXM08gjeSVtVE984eXsjKlrzgJ/M45mTiBec4ILmqkhv38Bllu6UhZFZaCu4Rn3pWpMZ+/2fqK7MoL5bSKNNMKpB6uXPCgoMedxMSvcnEOi4ZSFcFE5LUB304SygSVj6y3K8UUQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068258; c=relaxed/simple;
	bh=S3MW9H3wgEOvPP0uhKYDeITR4aJO7iujGxWR+LezJgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvqV/cnQUJ8nZ33PqRv3Zp28+iCnazhcrtzanHlHgLl6oaMvDNqGk1q0k0QIlp5SXqF4TDA22omoIkjLVHfW+rpiEpPDYgzfVoScSSRcVHP/nLTg47odKNvBx7sLP7QHbdc3Fo7WTvF/hgotP+wi0sVdFfD8bZ9R2ueqAv6ygUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Ke54Gg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmmOyAp6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Ke54Gg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmmOyAp6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWqp2416945
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w8o5JafesiRvwaLb/g8OOXSj
	6qim+o/hrusYm3HaIh8=; b=O+Ke54GgUCNZs50ieolXqxwKWZv0GIbzUBWi/mRX
	qAr6Yc9v7NGxFfNxuj1qm+mf68ZVCtMHRN/GHTRMJQiIoKc8h1h84O3NW2NiiT2R
	wLdLcB8PSbHwQqJoTa3n00fLvxuYQ1WxSTJdTbHfVACOEMIJMfTL0kI8f+cId4Uu
	Ofom2YTbY9cCqIN666IL9KBx4fbze9wANQhw2i/msJHFhBaVbRBac+rszrbYC8Kj
	3pL7HzIWeJ9b4zWstuSD75Vu3okjf8sdEngWm5Dyc+K8H69jlyzuQpNzOU38trOO
	TUb4BmS1X2z8hfsvxeljav8v/3aQ/PKwsB4izHosZsRD6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhj3x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:44:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso188090185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068256; x=1792673056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w8o5JafesiRvwaLb/g8OOXSj6qim+o/hrusYm3HaIh8=;
        b=fmmOyAp6VNU81isEBPn0aDWEvZkbTI81fLE0NqNvBoK0EDdUqrYdOfvdB0oZVPbGgM
         RLVuiixXoZG8CNAuAs4F/7hxTvfC2xR3n/uH36iHZH65D74aUokIaxJhvGAuTcNXZOxl
         /o4UWW/cfa4F98HoPSIyF/5N7nNWjRMuzCV7xb0Z7grbG7GwUv05bLHhV94QE9rc6Ebr
         fZhAX+2ai3wKzjCEckEGXgQlFLID7ZS6I6aywvdf+plxJH2vwc5pMTfXdHkd8VOdiUDq
         DmjlT41K1f9BZg3dWpvVs7EUyJOPBAvkCOY1X/2P4ecQFrFoyCVs/rO9/FreZOJgqPLS
         6PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068256; x=1792673056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8o5JafesiRvwaLb/g8OOXSj6qim+o/hrusYm3HaIh8=;
        b=jACCj9+CYfWkrPmW+HjenVo9XIAZqmrw9gskAb/2xcULQHux/5UJLaS1k73bKGhZbr
         QZ9q45tZcCvk/MA6tsbnA2dP+hfUZkZbm+gSxHIXTgbbGyHzLTfGSA+LDE3A5UQF1PX5
         QzJSFTLRPcSJZmzhD0nQKxdHTpPEHr3Eo60Ed8a/RVGSAJYPQ1UPv9eaDdNvCFDtyarq
         iZ2Hkcp9LMCYV5lvg+zcPpX2EAMhM4cXH0+4xffbegXCV53c+p0CDohG6rIwGdPSYC0v
         185sehGwsv6oIvy40p+b88ocfxCoeqNaX4a7LOpcX/ZVXbJsK8239fVtOJ3+5w4O3iEZ
         ksFg==
X-Forwarded-Encrypted: i=1; AKwUvBw/vWDbYZ5TZtPPmLjK1JVLF+ftLFBDm/6UML+Kt0P0Iz4oxhWUm8UXdLBx4pQYVp0eDdWS/4U3RzNXBQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLefpL6pSwL5VfcX9n8L8mej9eQBQ9XD3ohP1/vFsG1d7antdlk
	O+1x1wy06xIVhuCea0ahgZdmzpRCTPPhTOC4IWsY1MiogU2AuBCQlr538j5kVlEao0ksLXMozdy
	Kz3RwzI841t95iTACxT0Ptd/eS2B+BQR0LCbozQB37tGPnM3f8TNfy9nRbBSos59Pe40=
X-Gm-Gg: AYBFou1PO0+xFUl3ckxr5Y0WLiYogrIbbhlHrXvYNgOsWoPFZ+Ri1GHoCAphOXhHMJL
	2b2LSGl1QxJCR0X5X0FpPKP4Ub8lNcUzlbqR7BgcgFQ60QButTAFcGFdm89e64CaaGAdzrPbvuh
	Ad21L1hSC6dU1/phpFRtZaIwXBPRpEkwweJoHBJXzjUyQUW3l9FuIj7GHpRgedlPRm04F5nW36L
	OpR1kf2PEUwBINm/EdFBADOLfKYzTHV+pwqboiDoAo6BxYmZwKBarFTp5sGVWnv7IaGZhZP8OJF
	ftK1qvXLOrw2Ea3rWJxeCG+vdEpYKdEx4t44WvA3YB02maNz3uMJJCSFB+QIYCQ5KjhZho3qFiJ
	uB/KxlVjuBE5oH/PiKtcDQ1FAIApe52Qg/v251OHvGvk05rYXIvCdgdAUzlO6BqHd340sjxt9HE
	YjTvheZ1x0uDJ1
X-Received: by 2002:a05:620a:4041:b0:937:675e:2903 with SMTP id af79cd13be357-93ebd212371mr3197367285a.14.1792068255544;
        Thu, 15 Oct 2026 05:44:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:937:675e:2903 with SMTP id af79cd13be357-93ebd212371mr3197362985a.14.1792068254905;
        Thu, 15 Oct 2026 05:44:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdf2fa18sm5761271fa.36.2026.10.15.05.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:44:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:44:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 07/13] drm/msm/dcp: Add DCP encoder
Message-ID: <bmtabdrtxygyubfmxgvixn5r4rosu4tepopc2ro37heeqzwzgx@mu5wk2stm7yi>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-7-48aad0fe4f72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-7-48aad0fe4f72@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX856J7BSnx3OR
 YKXtwVmgIghSSmm5u2R3prrAr3pnLxG1T+CQofWnXiO5nzm7XLKFTjd/AI8In/Y948weUs4M/Kp
 9+O7fWZDcM1GqoBnKlzYiWCD+maw1KFdVhVXVJJ218NE0cqjsVlex1rEMVE0rV60pOOKIAR+dw+
 Tt5cvl8Jsf94mtIdQRXX3Wffs/mwWnyaPDsGxNNaC/PK9K8WRsm+HhncPjziGgKACoDZ3F3p1LD
 ES5ko2A+oF7hqkPV4zpgGBVJExSWBeb1HNgzMqxXo8EDoCUyYixakTwv/tiRKCn+4UROQmcAe+F
 YgyYSXV45VeyvJwm+CT4RbM1S9wEUVWub4oiGBJBmTHK6kqQc4Fx1J+aTssly+OChoBYtBGSbxw
 spSEusnkRHgz6z7WMdDT8aJZxeJpq8ImwBP5Db2i7i8CUNZn+Yn9SnU324VXUG4mYGH4zUKAl/q
 0gWlx0sxdXBl209+xEA==
X-Proofpoint-GUID: DzTydQqSvC5gDSiUcED5Abt65m_B4YpK
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0caa0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=N3-jI2xQlndCWEcerb8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfXzizJnFXhOG13
 oNctxHcF+xTWVycIL4hgKsd+iTD2NTc/iONxT/HCwR2urgGBz6arA9JZoRzUb9Sc9ZnKAmpOeWq
 cu1wBVRyXLBCxwcpAk1+OnWsxgk9W9E=
X-Proofpoint-ORIG-GUID: DzTydQqSvC5gDSiUcED5Abt65m_B4YpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150050

On Thu, Oct 15, 2026 at 01:08:27PM +0530, Jayant Shekhar wrote:
> The DCP display pipeline needs a DRM encoder to connect a CRTC to its
> firmware-backed output bridge while reusing the existing MSM DRM object
> model.
> 
> Add the DCP encoder wrapper and keep encoder allocation and DRM object
> initialization independent from bridge and KMS registration.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> Assisted-by: LLM
> ---
>  drivers/gpu/drm/msm/Makefile          |  1 +
>  drivers/gpu/drm/msm/dcp/dcp_encoder.c | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dcp/dcp_encoder.h | 16 ++++++++++++++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b7c1a2e9a19e..e7d24be72113 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -81,6 +81,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
>  	dcp/dcp_hfi_plane.o \
>  	dcp/dcp_ipcc.o \
>  	dcp/dcp_plane.o \
> +	dcp/dcp_encoder.o \
>  	dcp/hfi/hfi_packer.o \
>  	dcp/hfi/hfi_unpacker.o \
>  	dcp/hfi/hfi_utils.o
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
> new file mode 100644
> index 000000000000..bc173fffb325
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * DCP encoder wrapper for the CRTC-to-bridge connection.
> + * Hardware programming and mode sequencing are handled by the bridge and HFI.
> + */
> +
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_managed.h>
> +
> +#include "dcp_encoder.h"
> +
> +struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type)
> +{
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drmm_encoder_init(dev, encoder, NULL, enc_type, "encoder%d",
> +				dev->mode_config.num_encoder);
> +	if (ret) {
> +		dev_err(dev->dev, "encoder init failed: %d\n", ret);

Again, ignored feedback. Use drm_foo functions instead of dev_foo().
Also, there is little point in printing an error here.

> +		return ERR_PTR(ret);
> +	}
> +
> +	return encoder;
> +}
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.h b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
> new file mode 100644
> index 000000000000..de40c9bca4bb
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * DCP encoder interface between the CRTC and bridge chain.
> + * Hardware programming is delegated to DCP firmware.
> + */
> +
> +#ifndef __DCP_ENCODER_H__
> +#define __DCP_ENCODER_H__
> +
> +#include <drm/drm_encoder.h>
> +
> +struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type);
> +
> +#endif /* __DCP_ENCODER_H__ */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
