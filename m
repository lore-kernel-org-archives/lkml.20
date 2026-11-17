Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912170;
	b=UwyFTPrg0ctAuTxA6CbILLAXM/e2rwZHTahbbRsKztrM050m3mlhI/LNT2IKxpVmL1TJ
	 dJKecq7LBNTCSmQYx6FGWWAjkF5ppPmyY+6NbbpIhpvuhK6KjJxqQCuOmFGPQBGU62PBd
	 YlzaDmNHMIP3LT2+ydn//xDMiVCKSU0Z+AoREp52i3alz0i9jrXbqfV8C047NJnOPc9Sr
	 F6sKuVgI/Yhl5/awJgC5mPam4qMS1XFnsDyoVuD3H/3iN02BLQJAHKPZVfIsD/YojEpHQ
	 NPw1p+QH22Ncmb0IfL6iKfaEXxjls7Tc8R2W7EJ54b0KFGoG64khGm7TBuvXK8ZXqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=;
	b=c1RUyyOamrOUUAJxkwZ+9StakC5XGj+WuoFHaLj5Z/jM2PhdueH/t6joLQmGAKsduf3k
	 1xVF1bERmPDp1XVmkHHY4BxAE5Fn3NdkDsQ+QwoZ/oW2T1p+GA1z6vRWVkp1Go7lLobIV
	 GUN/PV1CMZSQqVNqUDPkdM9KMQQC88yiaInSrPghMEy0GAe0+AqKVB7/+2QnZN0BjbqRk
	 AL8S8rJdWf8/vjPgjKCHXRZncZuo1wui+WHbwwumMElxC8+Jj/6YtbH8n7+coJzTRqfGl
	 lYAHlB9uxPZjlJeoeZ5JNAPXwm47JnBwXMONpTHxnKoHgsUqOgCxAXnBnqsFA/pGyuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cl6mn4UM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By0VwDQ0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF1606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AF1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cl6mn4UM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By0VwDQ0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAdUc11279101
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=; b=cl6mn4UMn5QT1Ff6
	Zh0lNn+9huO+FxILQf7OVc2u27OZtFD9GDqbplGkLnRYG9wapRCXOWibhS3bLXZA
	g8LPogilqww7GKevyWzJ/QAwMsZNPlPrjyEoeBIN8RyY5Y3Dwn37r2nYe1aOV6ap
	stQ6wnUcEwFhhrO471QgHk63SS8vbI5wCEkbOJE1qQdRSZG9MOKwqKh1htTstaFG
	hxyk+a6g5KZqudjYkw35OXQg2HVktffFPhKuTXbpvDKNxZO16IQ4aJFXWQLopEne
	bW+JbwqvPHfjj3LCPj5Q2Nl3LO3i2rtsfPLtiAkHQgGDDUgv56jkFpcdArC5Ohfd
	e3SUSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc800cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:42:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso4284747eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912169; x=1795516969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=;
        b=By0VwDQ0eA03930TTi0zwl7qXvHF1gTisiDIY/cgNbsCr2FU5WUMUOa79HvGF7xXoP
         tl0CsumInO+syBWzl/a4VsOnPiJRf6Sx2FXHQBzLxpMZtz4KTXX8En/OFm8jSK7wDnTQ
         j7HwlPA99hrBALPR9qlsGWL9RrZpZpmRLeBRjhMSd7gc8O+1ocQT6BUJNOR0RK2lukyB
         fO0lMpOEIY817gbjF02QI1hB6NzccCJCfp5/pF0v2PX4+y/cJTIFVsNilka+9JSWrdd6
         qbS/umN5Fg6jtnMtB/21zcPLMiAYZlPh9S/TnW1AEGdSCTKRqwBZ55MnxdGZnGZ/nOlZ
         uQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912169; x=1795516969;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=;
        b=ZFAPs3qWSNEET668zkPu/9gjbMRMRWRjilXtbhdFEBBB1o1IGKYudFE4F/qy7Bp92P
         JGM/9BSG5Plohl7EkiCqriWbr1zYrqrpN0Vl0tQcz31CtZQXEWXzl/nPN4eKz9xCSpzB
         E5Rgf/psB8QAM6LvODk0FoDXextht1wz53Gw7eEaauoDwwulEWjjlsSVwCv/eCCsMgCq
         uuAmJI2aCzNR9MhM72TWVNMTHsNzBUQI567pJu4+Pk06OJXJF8e+jqEt+yEKFlfH+itp
         8mKoMF0Y4e1qXwXcDiJuj58n0lJYl9eOzKP5LnaG6cFqAFBrObgQ8Jd8P0huE1z0LMuH
         3SMw==
X-Forwarded-Encrypted: i=1; AL+hErEqfebUl7MU/p3nFGfKbKgjclMGG2FAax+fj1SMcz8CRa1h/+a+Nm+ZRpxywrFzX3lsOcFaCX5W+3YCssk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8sK26EvErym4wwPQT15URDFzRTCpd+MLIwngzAS4nF1FhLsAN
	+oTg7pocfC+jlKy54nG8CmAm8wpDegMtel4NcohQnNUiMMV95mbnpSP4ST+tAIOfK/9zetuh54b
	dXnU5Ou5BY6QTfm7WmvqncZJLSLOXaagb2sqEI5w863u+c7phDINiIK0BTGFI1P1q/gU=
X-Gm-Gg: AYBFou2IfX20/T8J/hs/1BFFrt+ZAk6XBygsjjPOeZ29GJZ8tojreUzC04S0nSo7n/Z
	EWqGM3AQ7uTAjxvOwFkwFeLS+uPBb9c3zaqUuGo3tc7SQZ39Xmjw2Tjii/Z6aP48XetxflpX5Hw
	UdZf5KZjUaYdu7ZrtJtoJXRWHLNf+9nZVsUjJmESEoYNaTPp8zsWld1xI8I4jyQOh2D7VsJMDJB
	ilIPfvdD8hSEGOv+4rZOdB1jimxzkZ6P1qh2vQjaOaB+CdeZ6aG1fj4uWr8BWB/B7z7jB+XkV5K
	oyaxvu7Tqtq/6GVc0NcgREJBryVdP4jeJ99/34OnfcKWqRnixYPW3fgKJM2P9Cs+Wlf9COKx3KH
	MnhqTH8KZL3uL1BMwLIuGe74H9hYXPZLGHEnNgap0sFwETpM8mEWeidSgeBqn53HA1WUgxJ3O8s
	Qoz/b4
X-Received: by 2002:a05:701b:2402:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b5030eb09amr10946729c88.34.1794912168664;
        Tue, 17 Nov 2026 02:42:48 -0800 (PST)
X-Received: by 2002:a05:701b:2402:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b5030eb09amr10946714c88.34.1794912168051;
        Tue, 17 Nov 2026 02:42:48 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm43918360c88.14.2026.11.17.02.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:42:47 -0800 (PST)
Message-ID: <e693b076-39b9-46d5-468b-800159a47f76@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:12:40 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua video
 codec
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc2fa9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QknTHhjYaj74atS0PrEA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX0UQW7S8Nw87n
 Zwf6TnjG7AqlpfbNXAzFySl1JHXrhj5QwIdQp0vfhlXrmUGS96fWVuhIeREFDv0x2X/XE9dWy4H
 CJOF0OgkKECAXa9+xnmkvnIPBRcxr2U=
X-Proofpoint-GUID: 0yn-Q0ICwwLoME1PItBVrqV1pz-M230v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXy5bJWZdH85FH
 BvPg85r54kcIMV9lA5kDK+lhWtTAycRToAX+HmLbmB2fskVhHErounaErnUHxA0XWk+2u+nlhYt
 QJZlD+HsvToyyGv/rYR5fVtEecAjx49QJFYDs/MOVvRXK9nz8S/IcAzjPtmgfGwcL8u6EFDAdo7
 3AoQqpB5Rjbpkgx17kLNDUtt/0jbl2io1dP7TA0dn19KHBDBG6ugz/GTg3e8QcaGdL3CrpZzSeY
 RkD1Uc8DbQhhsVZq7UGfdKkIejRfXfuiBFH76c8dAtoESImcBVA6U9ArBjoa6ODqUaUwDbtb2RV
 X2YgLuLT7eHwmg/+re8P0UUgDBYKYMvtKwQg7zmGmSR/5fWY6pvFF8aNJjC7i0Z5kd3Gr+k397y
 uny9nMUu7JlqF+4xqJuYUvA7X0E+v+QjEwOF+cHym+EdKx8fPq612ocMgP5OD0Xf0X7Y7jkOYJ1
 9Jkf7Rc73+PgSdN8NVw==
X-Proofpoint-ORIG-GUID: 0yn-Q0ICwwLoME1PItBVrqV1pz-M230v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042


On 11/14/2026 8:39 AM, Deepa Guthyappa Madivalara wrote:
> Add a devicetree binding for the Iris3.9 video encoder and decoder block
> found on the Qualcomm Mahua SoC. This is a single core derivative,
> leveraging most of Glymur data with the clks, resets present only
> for vcodec0 core.
>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
>  1 file changed, 243 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..cbae6bddf7fd4b67330ce47033874f3d349e5a3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> @@ -0,0 +1,243 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Mahua SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: qcom,mahua-iris
> +          - const: qcom,glymur-iris
> +      - const: qcom,mahua-iris
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core_iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: vcodec0_iface
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +
> +  dma-coherent: true
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
> +    properties:
> +      iommus:
> +        maxItems: 3
> +      memory-region:
> +        maxItems: 1

The use of memory-region for specifying carveout regions was discussed
previously and was not considered the preferred approach [1].

There is also an active series introducing iommu-ranges support for this use
case [2]. Please consider using iommu-ranges instead of relying on memory-region
here.

[1] https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

[2]
https://lore.kernel.org/all/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com

> +    required:
> +      - iommus
> +      - memory-region
> +    additionalProperties: false
> +
> +  pixel:
> +    type: object
> +    description:
> +      Context bank for VPU pixel buffers containing uncompressed video data.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
> +  video-firmware:
> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 5
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: core_bus
> +      - const: vcodec0_bus
> +      - const: core
> +      - const: vcodec0_core
> +
> +required:
> +  - clocks
> +  - clock-names
> +  - compatible
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - non-pixel
> +  - pixel
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    video-codec@aa00000 {
> +        compatible = "qcom,mahua-iris";
> +        reg = <0x0aa00000 0xf0000>;
> +
> +        clocks = <&gcc_video_axi0c_clk>,
> +                 <&videocc_mvs0c_clk>,
> +                 <&videocc_mvs0_clk>,
> +                 <&gcc_video_axi0_clk>,
> +                 <&videocc_mvs0c_freerun_clk>,
> +                 <&videocc_mvs0_freerun_clk>,
> +
> +        clock-names = "core_iface",
> +                      "core",
> +                      "vcodec0_core",
> +                      "vcodec0_iface",
> +                      "core_freerun",
> +                      "vcodec0_core_freerun",
> +
> +        dma-coherent;
> +
> +        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
> +                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem";
> +
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        memory-region = <&video_mem>;
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        power-domains = <&videocc_mvs0c_gdsc>,
> +                        <&videocc_mvs0_gdsc>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mxc",
> +                             "mmcx";
> +
> +        resets = <&gcc_video_axi0c_clk_ares>,
> +                 <&gcc_video_axi0_clk_ares>,
> +                 <&videocc_mvs0c_freerun_clk_ares>,
> +                 <&videocc_mvs0_freerun_clk_ares>;
> +        reset-names = "core_bus",
> +                      "vcodec0_bus",
> +                      "core",
> +                      "vcodec0_core";
> +
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        non-pixel {
> +            iommus = <&apps_smmu 0x1940 0x0000>,
> +                     <&apps_smmu 0x1944 0x0000>,
> +                     <&apps_smmu 0x19e0 0x0000>;
> +            memory-region = <&iris_resv>;
> +        };
> +
> +        pixel {
> +            iommus = <&apps_smmu 0x1943 0x0000>;
> +        };
> +
> +        firmware {
> +            iommus = <&apps_smmu 0x19e2 0x0000>;
> +        };
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000 360000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000 507000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-366000000 {
> +                opp-hz = /bits/ 64 <366000000 549000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000 666000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-533333334 {
> +                opp-hz = /bits/ 64 <533333334 800000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-655000000 {
> +                opp-hz = /bits/ 64 <655000000 982000000>;
> +                required-opps = <&rpmhpd_opp_nom>,
> +                                <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
>
