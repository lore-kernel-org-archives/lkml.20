Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4925B082
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623773; cv=none; b=lyqDoaDDsebTcdG9BjY+2xc6KVtOHRo9lbBtTSA+nkqsAymcf94lVkJE/p1O+gUIRUkZsWpWpI8WqEQvnLHyy7t1DQtssFWpTfu/KTHzRUtqO+I/pdsCuizqipfAHzUr+o+jYbn/lwEcc9hjaPqhIfW49LYuOYOhH2XZBb4Cg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623773; c=relaxed/simple;
	bh=qglo1qgSqvpKcfXUwbHrKpztUmqRkGBYvY7E1ws0TUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cd5xmqa6HO/phlt9vFUjfxj/rspRRWq5Izhul6UltZ46MXgRivgfNvQWQ1DoJ5N+HuzIsUdx1U68n6FcYaXFyyd9ZD4aGKw6ie1+G9pAM3H+tgaj+Rr1e2j+ezfUObLUSxDSHHtL+HoJWj8sn3zZ7gcN0HLFZLIBJx+vwZIMQFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcKf4THM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wy3Tleze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcKf4THM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wy3Tleze"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1O1ai3897809
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=; b=hcKf4THMRAh/vmJp
	BubSj/LyppmFhIkPNTS2wErU1g/5Gghmmau6DFxcsRpUN7AjOgn2remCMZ7XXhS4
	5r40cva5vmvuMtGQvUmnccAAHKgfHf2LgKXnP02J3JxR6sad7hK/jWJMJwgkx3nN
	7cyEuEedo67hpT7UckiTX35NydDQ+ut+5jA4ZJ5vqpbwfmHyxFxQQ2Vgqk/ZJvRv
	8vvzW6MIHIH3fG+PHLJvVmnso1m8V2jIyidtv8Kz3dZKDTEyLWRutSLu4MJle0Et
	KweAGkFLF3a+z+PJjpR+T3NAA6OIcdX2oHxQ0jlF8Y4e4S0oueuu+uuLKmZL/jVS
	6nRd2w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6atja4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:42:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8710450f731so658602b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789623768; x=1790228568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=;
        b=Wy3TlezeVsC4kFilPbO8xt/f/kkNmc5Rlxmp2OarNLkS3AruSIG4a+hGZGwZhreM2e
         e6kt1CXuYHugLAw7jQclyK1pvhuz4nZRdL2n/1epCSLaW836Gy6ATgBD8p6swWfaz/hc
         8f5OELcG8/uxzhwfhRtJ9Yob6stV42oE52UMr3rMyROncRYoxtGzmDcaqAH47W554fNR
         ZBGyEoX7IWHu4+OnhE5NtTXVS69ZMVbO+mZMXP0ZYjsbICIITH8JjJMKaRqHDVvMxuTu
         xHewrinZFrsoqhp6SYW1XXrlsk+rnZWtA1q85FxMziyWsN7b/LHV2zS12fEfvdpDOIax
         mkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623768; x=1790228568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1NtjGOsgxTer/ktLWGwA754RLEQUuhJE+6j0sZd88w=;
        b=a5X8NPChyQUve9CoLSVqpT4d6x2j0a9YuSPdwJO9ftKO7tEwhrZtFY5GGjq5TcX6sd
         q9JDyb/SbJ4OlPVheE+Ub4gPhEDOV5ZKwvHmpk6o39X0CFX21q1k5i8jWKub54wrk+lh
         xi+zd/4er+dfvsQRbrKfawECZPWAVof/8h2EWM4CkrglntWYb4H125jBnsn2Uet+DMS2
         NTtdbeLVvzZrJfAFV+v+ES8ozgFYkkJImXaoWMbx89o4MhLKT/wsEbiNbBc1oJEHrigp
         qi2v9F2lf9FJNk5suT+nGGaOGXN1gPh5U0zRtnXsQD3GCnjvXm93RHNQG8wS7/L9w6RN
         Nijw==
X-Forwarded-Encrypted: i=1; AKwUvBy+XOZTD2isX+OlpTPkAQ12Bsk2zPfnprlvvyUiFR8GXv88DUCFtstfLyYpwySaOUPjbk7QDHWsS9ufDcM=@vger.kernel.org
X-Gm-Message-State: AFuF++ks589v395Mwqs8u2Ozd0Dsjbc2vRFeDA6HIXkL8MgSQzr7F4Cf
	C6LGn9VED2QEQjiJiLynbqjfdjy7Kuma2N5c7ge9sBf4Fnf2VMMX9j4D+FNjWpBeua0MUw8eiM8
	83KqBkftk544wF3s7lSjIBa9N9/tbNPKPqVj04YnB7jQGDNVKtkPLnHO5/vTHGngn7Uobd/hdff
	Q=
X-Gm-Gg: AYBFou2wiJS72+CNXN1ykwJcrtilnwZp+UT1xi7JfnlTI7Cm63FnSNYPNUc1fBYD94u
	+Gv6TNyVdcrbme9g0oFsHEFifW3tnmO3H/qQhxXRle10Ml6hRn09LtNrNl1rmqAoAMeGmmkptKa
	ZFJafboVia1nvXwbXUul36tB/pZCNkwULq8mTZudQApwgjjKSlFLjtVZL8Dy2EeJC/YRPNLbwyE
	gOXHEEZrvNCHeSUk4g2e6I7ACatHoZDfkK3u/VY6KK4wS7teNjK1SykRgCFVnMBI88ERlo6DGzH
	Zl497/yUc38L3P7GKX8S9eIIyCcaQYQ1/h0sjKVE8lCooLe4YSGgXORFpQ5b+nBeOpX+JGzCxj/
	BS/CJHvis7rxWGT++M2IiWS2sgVUL
X-Received: by 2002:a05:6a21:514:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3dd5f5ab211mr15101549637.17.1789623768385;
        Wed, 16 Sep 2026 22:42:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3dd5f5ab211mr15101484637.17.1789623767817;
        Wed, 16 Sep 2026 22:42:47 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af4f0bsm14466679eec.24.2026.09.16.22.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:42:47 -0700 (PDT)
Message-ID: <7d2611bb-532f-4553-9d16-66c4b9c495c9@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:12:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
 <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n7_OLOTOiWEQkkHz-Yt_sGA2Bd-M3ZGd
X-Proofpoint-ORIG-GUID: n7_OLOTOiWEQkkHz-Yt_sGA2Bd-M3ZGd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA3MyBTYWx0ZWRfX42wc0UXCv2K6
 2OElG55lqVo+7fCmgWp+wI3jOUZml9/Yf/rElavbJjyTg+YXXll8hGOQs1YWT7ICYxe6A4X9TfO
 kRfeEGkocD3b3MvepqkaFacR1dx7scD4a355+CtM2iBDv2HxGFBmObi3PgZOGzBVxaj3L886/8V
 GKFoVvn4i52YN0wF+ZodUenihHcgIxJTfBalvbawZpu7Uf9rXoT8b/3grcAnY84c3imEQ0SYIrf
 GgjezKq2UbyIJUrF8Pmjw4h60vq1KLdXx/LDhZDhItDM9guiKsNqTpRRHmsGr4aF+83/oIbnx2w
 469yQ4gM38JdPeOera3VelfgCzHO0eb4sLnvJ/0/JHMOS13X5Qj2uXetqUCE/aBGf4dQUuM9gHM
 mzXFpy7SJLUYPuZ4wV8ubuzfEkJTrniWiv/PIa6jMVmtBA2S//5XT80Mhm9ectrvF6a6+WtCmPU
 giMi21BpyztWu39blww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA3MyBTYWx0ZWRfX2EzB8v8vfhpR
 FzSpRlsfupm042C0V/VXveMHFxcuYq77LOrAjOubUL92TJpA0s+8FNz8HRbLgJ0cvm5ee5OnDhV
 30IiaMr0mVddSKnQ2icPECkRP/yuF+E=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab7dd9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=T1TI9GLrlG5TBy_zXBgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170073


On 9/17/2026 7:06 AM, Shawn Guo wrote:
> On Fri, Sep 11, 2026 at 09:06:34PM +0530, Nabige Aala wrote:
>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>
>> Add the binding for the display subsystem (MDSS) found on the Qualcomm
>> Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
>> controllers.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/qcom,nord-mdss.yaml       | 98 ++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
>> new file mode 100644
>> index 000000000000..0b0cacdca9db
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Nord display subsystem (MDSS)
>> +
>> +maintainers:
>> +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> +
>> +description:
>> +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
>> +  (display processing unit), and display interface controllers (DP only, no DSI).
>> +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,nord-mdss
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB
>> +      - description: Display hf AXI
>> +      - description: Display core
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: core
>> +
>> +  iommus:
>> +    maxItems: 1
> The DTS in downstream repository doesn't seem to agree. There is two
> items for iommus.

I checked the Nord IPCAT. the resulted SID is same for both the SID 
(i.e.  0x03e0) in downstream repository.

I think we should update the downstream DT and use a single SID entry.

>> +
>> +  interconnects:
>> +    items:
>> +      - description: Interconnect path from mdp0 port to the data bus
>> +      - description: Interconnect path from CPU to the reg bus
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: mdp0-mem
>> +      - const: cpu-cfg
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dpu
>> +
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dp
>> +
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        const: qcom,nord-dp-phy
>> +
>> +required:
>> +  - compatible
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,dispcc-nord.h>
> Please run dt_binding_check against mainline kernel where the header is
> actually qcom,nord-dispcc.h.

Ack, I will update according to mainline kernel.

Thanks,

Nabige

>
> Shawn
>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    display-subsystem@ae00000 {
>> +        compatible = "qcom,nord-mdss";
>> +        reg = <0x0ae00000 0x1000>;
>> +        reg-names = "mdss";
>> +        power-domains = <&dispcc_gdsc>;
>> +        clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                 <&dispcc DISPCC_MDSS_MDP_CLK>;
>> +        clock-names = "iface", "bus", "core";
>> +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +        iommus = <&apps_smmu 0x800 0x420>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +    };
>>
>> -- 
>> 2.34.1
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
