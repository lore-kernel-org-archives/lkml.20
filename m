Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852159;
	b=TCihZgPgImRTiwUOJT0HN5Gnryz+7lfvCcZRqO1zzW+TvVOskANeiUNOh6Iln8ZWkN7H
	 VmXsoO/lc7HQfzhjpTl0MtvJT5Hvj0tln/Lwl9tLTvycGSllSfJLECINtYjSwJDXZNN6R
	 nKkQRHzK84OWb4XTA9aWIk0QVclTW6peJGEynqNMH5ysEswVdh53LIP7vc4KOe8OK3GuO
	 QRT6/FzCB1Yq9IdhRJNwyHfX83c7hpbc0R8pvnRpfEPONVhpxOj75zN2KxQuzWUEs1x7W
	 n1Ef7yZVHI8SJ6FsQvTMEccw1Z7z35RL+KKaRmXsBRo2RlpvQlVk8XKVeB8l2BU0Nqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7H5gZDQnZLUnQwufsW/B7B2I+KRZ29ox1TdgnxIuLws=;
	b=jBC9PpOF/XQFzfiE+cb7CHOgYaBHWBxehXkkPskSBIUn3h2+NeaPeAeCcoDQmyOvPE7Y
	 M1UVPVmkakeL7qKEyQCKiEaiDQsyDY4ychaqvSYQYl640UnPTFN30XpEGowam0nub6QWV
	 Vvi2m6cFxNCgPXgyYBSBXLKGXv9gQTeHtJkvIBP7QvacGYFU1K77b6wonMgPCwO+uuKU7
	 I0EW8me4XJu0Aq5AQ8WyDUwfT4BEMSn/mEGPjWdmtYo5ORyG2WT0uPAtx0ab0e5vq610W
	 N4UMNWBnoteOr7/y4lWRLod0f5jN/msNSupBRqb4ld6YLnbApZHMO/xobP0cFC0iVwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RboJqHis;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vhd4b2+7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C919606A884
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C919606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RboJqHis;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vhd4b2+7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIb8g154582
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7H5gZDQnZLUnQwufsW/B7B2I
	+KRZ29ox1TdgnxIuLws=; b=RboJqHisBqVUiZ1AvmU46OU4UNBEEi6vareCc3oK
	elkrdUEaR+XsNuP5qbqSZsF3AezTZV3v1qcEMub5GnGMfWfWRTjSGztuQkUrCkWD
	8UYuula+I+Kl48mWQJAtCynHFFB9Ze8r1dLoRG2a5yusU5FNeCQczlViqJKEBHzC
	GAjYKzUX2+uSrV4l+DqbXUyMCdujkkXoIbsHhVC+4JPCCSeh6sDyidshWfAjlqmC
	h15fKEUp+LPjux+pAl7++1pLZQp0KyVB0Ug5yJFSqpICRsgEimodo0GDvYIIPiP8
	9iEzmOqCm5VKwCJ2P+yC6dWLCMew/6PxYXPt6AMTIAeivg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ghys6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:02:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so3581240eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794852154; x=1795456954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H5gZDQnZLUnQwufsW/B7B2I+KRZ29ox1TdgnxIuLws=;
        b=Vhd4b2+7dPOc18AQpBiC6F+VnXFRarszxmc+AbR8QXOpYswfotunWZHJLBMmHrQb7m
         QBSyRBwxStThYGs0xIwd/T94+LWJmBYakpEI7aTDwmaE8HSZMYTJv3WAMUp6gETRm3nY
         Xsd12ON26OsTme1f2Gkb4vmLYleEYmBZPu2RnhlxLzTu5ijBhfhLuys/2PiaSEMw83fj
         KzDLgBzFFABAmOPY6UjXAGXzc6pNyAnx5Z2S1ijxc54hsYYprzMXhEIXCwOylqW9lCEm
         YWyrJO2kQFoS+4myFOpfaxPe2pwBw0GJkOyfr4u3TmCZ2I/tuebifi3Lg9TlZITM7ai/
         LvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852154; x=1795456954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H5gZDQnZLUnQwufsW/B7B2I+KRZ29ox1TdgnxIuLws=;
        b=U3gFZnIrcRIlCy0+2J4jMp/yHdi/05UMacKFAp58VMO59oy/FuXtZ7u0LWvlD7zpgN
         YIEDNLE6cSyYGS6MV1gF3VVLeaCIAsb/MKQlzLkmkrvRKrLqoKfy6GqMQPoELNQbEfgQ
         F+buG0i0cweow5w7WWncd0K1wwTnpm/fFV+qD+eyZvoZ9dChaQnSYLKb79EAPVENNPyQ
         MX7Xs2qdmkhWOCzcU0T2JZqc94e0ppQ05lVUgBurv9r26pJ6beS7Hy66ym0AQlDIpfVe
         uEVnQ4RMjDJW/RSo+zHZ9oISe1t9v9XRGE0BLfb6b4zOgHx0GQwifzRMUQjFk8uWgLBs
         zN8A==
X-Forwarded-Encrypted: i=1; AL+hErFg9OzTjvM9dQr+YlrEhdKX8rXEAGGK7fTg6Fcgu+myW/6rT7oAK2YT3/AVRdF5G03xzNXPpNQ/N7iK5fQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p6FgRzmPuTVAQ11aa8tyelz0cRwYmWjLOtkGytLK/+hf0f3Vv
	bsj4DHlgjVV1/1txY2vSphLYQKcyfr7PUPkeNNRReAvvEXsYJTI7IRPkIw3jEhpyOl9YSLbs4ml
	XaMJXKf6cGK0vGPfKH7STWX0ObhAThGbudL7gfoMtkJmceCsDsg53dMVyMGZDcLC1LfM=
X-Gm-Gg: AZFdTZcWBB7DBklATDg0mDBm+TbSbzens1RPuOeS4g608ID4xQaRLzPsGd3RxvKOaix
	79QJX+JreSeY/+aQukYtZFxLr8raD3yTuv1AO4Y7vcQbTcJWQQCWXp54NJ+OA6dn7B2GygIxq4R
	Lzifd7T9Couxd4tzgw9gBQCcv8ZAXt+znplBNF7Zrnyfx82PuFxhDR811j+VnM441UUCvS2nXZS
	zgxedXA4AH8mVNy5a8FpWdboJsQPhLJEx6vlk9bwknRurFewnFAYh+75sexyMyFKKTQnshlJFfi
	B+F6lPenDAk0E7OOyDPNQdmCLzukvLocxoiwmd1Betx6hjgYe2aFkC3mTy6wGVgUcmWYJL0goJd
	0mKt2khTvwIoDYRI/gI9meIE1I3xtvJ7xPkek7eZHCnHYb3Kjjxucfg8KdvdvZvj5PhJBk5v3SU
	Pk
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr11357645eec.2.1794852153724;
        Mon, 16 Nov 2026 10:02:33 -0800 (PST)
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr11357595eec.2.1794852152910;
        Mon, 16 Nov 2026 10:02:32 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm36470150eec.7.2026.11.16.10.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:02:31 -0800 (PST)
Date: Mon, 16 Nov 2026 23:32:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
Message-ID: <20261116180223.qk2k4zabk6tp6ihx@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
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
In-Reply-To: <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3MSBTYWx0ZWRfX3PS+f6qI7Qv/
 cCElsZMOhaDSOHrDQjIb+jhuGx7Id/yTX7rMZrcZrX64B3O+WpXQkVvrnVdUGPJXOYj4ljWFn3w
 N3qnL1LqYwj1Y1El5dIw+O2Xj85T+uIuNgRADpAdn0e4vG8aUm/y8ujauwHkb1okHgTN9YcZcbX
 4oJKpr+2g463Ewk3SRsoP9CYZIfhDb71gaYUEum6B+pXsI/7t0RVIGjhyKSDy5QeuMraMTz+V8f
 /Fh7eC4TWv9RsbkCNn2x+yaAGgJGDYBHost05n9OyAUPZ/x6IWyjowpJKfl0gbgyOmZxrdg3x2T
 7KBpR7f5hcFG8EeJbNe9OuSLZUcW7FGz37x6tmqycLLHIXiEk0BzsDFPszzK0PNhpBxO/aYkec3
 ci+b5JECltO1k47SYrZC/0yypXlUqk09uw7msx3MtQdC+/PQtx5l7OkeIjxBhshcbTVv/OTKERh
 Y9dhGsr/5fX8KPBg5GQ==
X-Proofpoint-GUID: V4TFCDpKZ203PEjOpEybEgWuDlRdYE1_
X-Proofpoint-ORIG-GUID: V4TFCDpKZ203PEjOpEybEgWuDlRdYE1_
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb453a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZE97AlTrE_lL4XMxLYgA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3MSBTYWx0ZWRfX6nEV4TRyn4EM
 Ug85OIr9K3SE5zmxTr5EtAF5RZzPNiavX1YxEZ4khkGssk5cbXUe/khaiHlIOWM57thcXz309gZ
 4VWRwDNy6SKRmi/mBFMxFUtaCuxytkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160071

On Thu, Oct 15, 2026 at 11:25:49AM +0530, Anvesh Jain P wrote:
> Document the Glymur OOBMSS PAS node with its secure GLink edge,
> shared-memory signaling, firmware carveouts, and power resources.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
>  1 file changed, 154 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
> new file mode 100644
> index 000000000000..3aa96d2262f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
> +
> +maintainers:
> +  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
> +  processors running Zephyr, managed together as one remoteproc instance.
> +  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
> +  processor. The OOB-Non-Secure processor is an auxiliary processor that
> +  depends on the primary processor and cannot function independently.
> +
> +  The primary processor runs the primary image, while the auxiliary
> +  processor runs the secondary image. Each processor has its own DTB.
> +  The two images and their DTBs have separate PAS identifiers for
> +  authentication and dedicated reserved-memory carveouts.
> +
> +  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
> +  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
> +  boot, shutdown, handover and ping/pong signaling, as well as fatal error
> +  notifications. The subsystem exposes a secure GLink edge to the host,
> +  with doorbell interrupts provided by the Inter-Processor Communication
> +  Controller (IPCC).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-oobmss-pas
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Pong interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: pong
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  power-domains:
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: mx
> +
> +  memory-region:
> +    items:
> +      - description: Secure firmware carveout
> +      - description: Secure device tree carveout
> +      - description: Non-secure firmware carveout
> +      - description: Non-secure device tree carveout
> +
> +  firmware-name:
> +    items:
> +      - description: Secure firmware
> +      - description: Secure device tree firmware
> +      - description: Non-secure firmware
> +      - description: Non-secure device tree firmware
> +
> +  qcom,smem-states:
> +    minItems: 2
> +    description: States used by the AP to signal OOBMSS
> +
> +  qcom,smem-state-names:
> +    minItems: 2
> +    description: The names of the state bits used for SMP2P output
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - power-domain-names
> +  - memory-region
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    remoteproc@1f000000 {
> +        compatible = "qcom,glymur-oobmss-pas";
> +        reg = <0x1f000000 0x30000>;
> +
> +        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "xo";
> +        power-domains = <&rpmhpd RPMHPD_CX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "cx", "mx";
> +
> +        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
> +                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
> +        firmware-name = "qcom/glymur/oobmss_tee.mbn",
> +                        "qcom/glymur/oobmss_qc_dtb.mbn",
> +                        "qcom/glymur/oobmss_ns.mbn",
> +                        "qcom/glymur/oobmss_oem_dtb.mbn";
> +        qcom,smem-states = <&smp2p_oobmss_out 1>,
                                                 ^
Normally, it is                                  0 ?

is it different here ?

> +                           <&smp2p_oobmss_out 8>;
> +        qcom,smem-state-names = "stop", "ping";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc 56
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +            label = "oobmss";
> +            qcom,remote-pid = <20>;
> +        };
> +
> +    };
> 


-Mukesh

-- 
-Mukesh Ojha
