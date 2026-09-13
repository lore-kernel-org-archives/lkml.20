Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C78C382292
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342312; cv=none; b=mUffCUGBBBslC1Xv9uVRPBQJ+xFJgdG3jtQ2nWagleAT+PPoXHAI74ok9nsaZBIeegU8gVg9qQnRnZ8oSxB0PEqD3I23EVTx9WyHYfHg5qyBBAnjYzSCd259dvx/QvmTEqGnhz8GXFMBR6swwUyYOavZJouf6bbj6u3NlRhtidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342312; c=relaxed/simple;
	bh=AOQibO3zCakCz0zaMqITR/TcjsTnN+4wc6IfZGWqgLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYr8PzvPjRgSG0WRVf/OajZcYjEPTR6I8ZNKHApOyA/YUHDQ6tUd2a0F//i/IrzS6ZdtyZVASx+sNC/V9LFOoubvOwcrpP4991B7+9ihDO++ojSRtXSZke6y3nftOX3Pmz52etZ7S/6Q/3YB1bH5SO/0g4+3mK++ZO3OG+BDtXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtbwsMPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeyoPv1A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtbwsMPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeyoPv1A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DLDEqC2997407
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Yheiyhi3WlnjH2Jpbi31UKC
	puZDDkybu8z16cN4/BU=; b=JtbwsMPsJmvf+dZsFgRQcBsixwMCVlMrCEY3J5ca
	q0y0pjULPeXwoZm6Oroee7nNFfYyPr+68ohuacU5QvFbGYxiqvM3JV0DF9KrTMLr
	IY9F4Q7mmneVaEoKmhXO6dYaFokLpHwj0FWy9wtOxZ/MZMfGqBmrlKJF6bRBtUbl
	sBi5rZxM4o5qOAPVPJ4fiQNi26iApO5D2fm3QDHXtczwlJ8T80EbIUjVRFDpQrw9
	wjiRRYj9sr9NunZbXNkhpmToMdfK5YD3ZVnn55eQ3FUKoOY4yTqGfMZGYM91oCE+
	nRo6nbTHk1zOJr6GV0vVp7DHqPjuKAjAt+KXA4RRUkFwOQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsr6ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:31:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c96449cbb2so339570e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789342309; x=1789947109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Yheiyhi3WlnjH2Jpbi31UKCpuZDDkybu8z16cN4/BU=;
        b=TeyoPv1AIQCiaj5/t6FRDewmT3G7Ht5OjxmG8qeYI6n6B/3uHBCujI84EhJA7PVFHK
         fNJRvjCVKs/B9TwTgI/wJENHXuOhRGu/W8K+mWF/Z0mq+W9TpvHhLqJhoAMjqvPkXivo
         elpDYFzIVXSeHp9xwNGfCxH9hL7/CakzpqRmKZoIU2hNBGWao8jfx7bhbaAMIWYN3VNC
         fguBZuqooH8fEME676zTRSHWjcaVQFlZmpZZ9ZMQ4c7U/qKwMyodVBjAd5KNKIxneb6l
         HPQPG2hooQF0+5CvMA5IDnmiuTxKqRkN9YRQzFLOq/QYoON9svrimshGgTHOx3Kc6Ye0
         xfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342309; x=1789947109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Yheiyhi3WlnjH2Jpbi31UKCpuZDDkybu8z16cN4/BU=;
        b=DoTf+jUeLAUNIy4j4Dtp5AFVMrV7IrY4NaSfIxY+xiE5CYVa0Tb2KpqS/g/lo6hjIm
         yxKRuAwGsOjnIV8dgvmzcg/EDY+ju5m/2JDGbHqN46J1wKUOoil7mdHHwwQsjJMIg2gc
         gKVKtog9Ru5auvybZUM/6MNiAjOZsxgP7kOPGSnhfDhn2tkf3bqNo/ZL6BrPr/ONDEff
         AI3CGwRRngUW90JBrPXmak/bvd5vj5cYwNcA1gkukPyA2ncCwIYOsw9q0bDqX2+swIMT
         /oTHWY0ux66TGuafA60Vt6V2iI7lcbmL5vztzbdXf6zfW0Br3IqouYoqV1rJPq4Ejb0t
         Ki1g==
X-Forwarded-Encrypted: i=1; AKwUvBykRqurdivW1DRpW+qn+Sby8tgVLOg/3XVtSczX+4p+TKz2SWgYrSL8xBU18+Go1aXMGE4iZ8YK+uN3Iq8=@vger.kernel.org
X-Gm-Message-State: AFuF++mH38SOZhdZZ87oCxCGQhU4bzRM7wglG6ymg7022sta3ji2tlyd
	4aDUG/qD1mF/F12BVCrcwW1drbjcjP6sBTdpD1kr8EqLOyyKClhSCS7/NqcncsIFlBXrVE0BrmT
	2p7pbKPersJsQ7pKzjelbCPmFgFpWKlpsSsJNjjUnn1QzDPQIPZ2H+j9qA7kkzfv/37k=
X-Gm-Gg: AYBFou3ceXRupqg3O8Pjj2D6wC90Hqjt3hhXAnhi8n3wRgQZHBFq6iPjAjoxaYtJMMQ
	xZCpO55rrbQQjpOybqBYSWq6XmzLVMxeNfcxwBweb1aWQEoV8tLbri65MZkKN3rp5OlpthEei/5
	lqPnop2eG66KQx4vZlETNm+y7PsnZst3RfcqF/r/LIvKpZk2YXQV2Rl7+WZIsQGJkI0u2zHpKp/
	O6np+v2LAzt04/QezGjKIWDtMxS5qAGtVbCVsG7UmKlXHZYNQRcwRm5WkuzjlkK4GlUoWjmdX9+
	PxhKfe4qdVFvj8xG3j9HoGyenhSlhAhOAeofoA764L0wCcWR6dKXo42D1MRWmKJx2OnMycyvecG
	1INhLKXyvwk7Xpasez9H2CoS+l76TEVZEr1iyS9+0B4SIA9zwVEmNdlNTw1GEq/xCOmO1WEFGrY
	2lXpi4okOYmRY4
X-Received: by 2002:a05:6102:50ab:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-79b56df0dfamr17553137.3.1789342308674;
        Sun, 13 Sep 2026 16:31:48 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-79b56df0dfamr17547137.3.1789342308261;
        Sun, 13 Sep 2026 16:31:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5fcsm1989692e87.52.2026.09.13.16.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:31:45 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:31:43 +0300
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
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
Message-ID: <gfqmo7exo363iyg2q32s7iczl3ctt7yjejtekehbirbkrtmfdl@pui6tpk5c443>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX4g2j8ACZ8tYy
 RPY/jh1B7wlEdYu1yUm12dOXcifDtLbHYoeUGKx248ET9SgIRkqcLcHU7ltT20folwcJe0qBRpY
 Q12ScSYVGyJm4OsihGG4K4pRLrcPHuO7NpBC33pnAsdVQdoR8rK/3JxD3DJLevSdsopfCIdrdIV
 9QzsQcjGUPaVYCfOVkJEftK/qpdwJ4KkljLJPdpcwJFPVz/GeoTMpj5R6HdB/Q1WklAtn1CEIxL
 PILK8Ok29AEiNT/enIX5O5hDWwgZwP9N7I289z4E9K9So2trfdTVmTIsWjZxzOCRLvhj15Avt+G
 lCaYvoZ/xFVuH/L3uXKe2iHehtQPBB3/LwHs0larvDlc/WPn/alutbVhwah1Kaqg7NU6Cvw0CLN
 hK0cy/lPpfomNAbrGJuxeNKjJrBdKc0J+xlH2Msr5osI30e2jGCbLsmC7Kcjb8Msxa1oKuFilqL
 RKhyZC66a3xgmbTbwAw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa73265 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=jN8BCOdiAmMTBh1ippcA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: pnUJ4MVRzthYnLYNS2SZJiPLJjxHDVqo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfXzox4A7Jsutmb
 2agC0++xFHb6kYfcdFXd9csTMnHA2m3dF3TuQni7fzKHH/txfaSvIW2xJPuw+8FzLW31A545HWp
 dN05Cqng6hZNqD778sn9rEL5P1XqfUg=
X-Proofpoint-ORIG-GUID: pnUJ4MVRzthYnLYNS2SZJiPLJjxHDVqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130337

On Fri, Sep 11, 2026 at 09:06:34PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the binding for the display subsystem (MDSS) found on the Qualcomm
> Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
> controllers.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,nord-mdss.yaml       | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> new file mode 100644
> index 000000000000..0b0cacdca9db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord display subsystem (MDSS)
> +
> +maintainers:
> +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
> +
> +description:
> +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
> +  (display processing unit), and display interface controllers (DP only, no DSI).
> +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,nord-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path from mdp0 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp-phy
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-nord.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    display-subsystem@ae00000 {
> +        compatible = "qcom,nord-mdss";
> +        reg = <0x0ae00000 0x1000>;
> +        reg-names = "mdss";
> +        power-domains = <&dispcc_gdsc>;
> +        clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISPCC_MDSS_MDP_CLK>;
> +        clock-names = "iface", "bus", "core";
> +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        iommus = <&apps_smmu 0x800 0x420>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;

No subdevices? Not even a DPU?

> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
