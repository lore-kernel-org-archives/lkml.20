Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572370;
	b=F8nHOlgjUH7mPe7pOi9FM+IJ1Z1vj9enWZ9cXitVjyvXHTKf+9/Pjn6/xpUrMpyiIJtY
	 EtyoUq0AGLAlW7w/G1lycxwhK3SCb5Z+NVS679ZXs9yMwYC+d7NmV9Vf3EaMix/t3RwcU
	 n6x27ADiUY6rnEpiW0fLsuFMYeOVBsLuuY/kZEd9ZvJ6Ucp3jW7ckMY9eFEyefgY41ZSN
	 vpz0ZtKgO0zPJALaiOZ9QWO+EnJ14LLYHb4+n8vaCCcWxO09kuohKzwA7cupUO+n/FaQE
	 7g1p8tZh1RnxxzquXtgzA2KUPV/6rzRD/AnFV6mqsca9RzcnbB6i5cM3m84vC5V/JFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=;
	b=uZppg15USSIoRL4HokuRzS6yG0YlprVrWWvERANl1cT1AZFBC9J+V0E+WAMBQLzHDa6G
	 HhvbSS7jVooPSnlSFns5qD6W+xWX+bD2IWW5ykEktGuErXdp2B9FmhGN/O5Y0hiHBcPTQ
	 7esbD6RyndwTShrsbYETR7F6YdJgT1i+CmLxdWWmw7IdnvDf/Qo3SifhjQFOHVNVwTnFW
	 M9yewr+264OHltE6/54ogV0Nkh7caZ7wu950jVrNxeuJljp6M8e+uTiMAo2NEt7ybg+4p
	 4SdCkDpGQ3OeNk0wFv9QUzRbkd2HYMYFYr0amE2G48WtaQSLUzZ+fFrb9lHI8psIv+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwC5m0sx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b2/yFMOZ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F20606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwC5m0sx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b2/yFMOZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMuU2848656
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=; b=UwC5m0sxAo9CranQ
	I2wU+VQqqlLBpXX/XorF7YaZxJhNq7sUCkB6IfeCqY03U38I6Ef0cVK+uqRM1xch
	w2Vud5soXpT3FMmGLaY7sSMFoSgE4/Qpzure2JdmOyUJrnqz3qRYit2HILj56kb6
	AC/Szb3w3pnZegQYU8U14VCsPWFWOtUEuJO37i3c+20pZqONT7EXW5AQg5LcclX2
	GnrvAhn4vs/brcWWechVCSZGKF0Q2c6Kn8dVlq/Hb2InR/htWIT/oa8H1D8BnndP
	wziW71SPMwPvgOp6Xg+P3b+kLyWQEL9qgw31ow5uvye5iihyITY/RK3N0SON2X6E
	WEna2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9asyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:46:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-366c279b454so984439eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572367; x=1793177167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=;
        b=b2/yFMOZF3a+SqbA8hDogL2wsLKTVf1MFY22Jxla/NZ4vGpRytENTscOAWR//IpIW5
         TvbHWnDdxRN1gMgPW00m/Og/Sq9meD3OOONX1UG0/2XXjZVgN79xQUOw2HmSBkIMsIeD
         60c+xQuFhrfowDOox/XMghnLx3xfcRzkdZSvhV8E3quAXltn6FwG9OPBH63x8KigDxpw
         R1vEdwnWMfpwO9jp9VXRB1Z4jT9MOi/h5+dSSOoqA+ytWJPoBDT8hlpsNq/z9QyFRl2l
         cCnM4d7ngNOEx+DnlSdDfokUkPXgTnqWBvgPraltwOnm4Kym7MgXRFYjW7RWEFb7OvMv
         9YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572367; x=1793177167;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=;
        b=betMRRfqC7VGomQbzlMUonPQpTlB/mK9ge0FQV1kql5kPNJScj+L9ieNTPzSNbm2pF
         hmAwKRlx6YQYvN8lupf7F+ry/N40+nScnXJbFYfvEoxs3wEqNRUXU5fOVCaoTbOyJTby
         NtlsXB46U4sD22C/01l83p0ntRgbTjJFUYtl1SpkbFV49eOAQ2vNdU/5swyPokVlzCJl
         TUvJPgQamH7RALq5xh6T1QD5auewPJrAjF3Ru7da5cX0bu5ISOMUNd/Z4I/gtn8cDx0K
         Ct+8J0D1mTShzqhnHwP2DCedi2BJPRyr/6oOhkoRUL4X2Bgu/uqhAGZdBoJca7UZ6xEU
         FdfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD/NXMmB2ILt/hn6Ncr9FA0egdUYbXkOZDRF1nds49bgR2s3hSica4cAnDTfp4UdzfS/3k2Q1+Cn1RHu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXnwhpZYe/IAGFRtTSBhY5aRs/MvAxKtCgXMN3ogsy6jdKMXbc
	9qu1OrX0CEoCXXapbLSnuVmLXGRhGrgd9mtIPUITuzjUsz2+LC0ZT9rk/YbSL270+DCmp1MhB0P
	i0Rpczx9gmclkmDvyr7k3YduEXDhbAlGzXfhhwl8VeigsVh2swwr5S7gQ/5xDFb2GFWE=
X-Gm-Gg: AYBFou1Ack1SVYbOY6uduYmqLmZYvzKtw6umg6/4PKTpWs2804DIAZkKEDFdjvPaNpb
	PvaSfCg252OE4tCuL4Rwz5MFXqdC0ku/LOOHmR2Q/V4LlBOpce9yuzreqoxoclrqVuzE6A7uUb8
	HLzG3B3sv9WxV2BIXGphrekZEnedspohdg9RAk5HlMG3FJ6uvDQvA2+qlyxYvqjghdm3Cm4eW4O
	zGa/TBoF0vEMIRWiIEZIHY3ts57FCDPZs6ioy6hmG+R+QuzM8yX0XulqN6P3t7koGm+0YvyF0H9
	sywAcO1deLNtJsePQJdmF7d1FvfG+17Dw5RyXd2Bq/98UqSO9L7MMp8pL+j46Kj5IHuWYDoJVVS
	ieyNg9yEtryMYo6SRkB/3J63wHiXxYXq4vg==
X-Received: by 2002:a05:7022:eb55:10b0:187:cf46:4c51 with SMTP id a92af1059eb24-190a728a309mr1916588c88.31.1792572367006;
        Wed, 21 Oct 2026 01:46:07 -0700 (PDT)
X-Received: by 2002:a05:7022:eb55:10b0:187:cf46:4c51 with SMTP id a92af1059eb24-190a728a309mr1916523c88.31.1792572366229;
        Wed, 21 Oct 2026 01:46:06 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm4271323c88.13.2026.10.21.01.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:46:05 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <ea81fcc1-c7e4-4b80-b65e-f483487bd1a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:15:53 +0530
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
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
 <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
Content-Language: en-US
In-Reply-To: <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX0mmK0GYdQN3w
 ZIUUCtwUJ1s9H64y0QPSXGrhvrXyobGAYOWbVn0kCMffg7c1hRyUwA0mTrKvJY6FdtdsxyP4xVH
 ubQGYvGJMHWUkKjBMFuFvQi4EwMSb7U=
X-Proofpoint-GUID: VbVClGKLj5M3gmZFGZHIIRjDpb9QcVH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXwexkjme75oDv
 88X88r7qXmJ2iGwinFGsPoYTjAH6S5ph2UAFm9akL0ieOAvWL3j7RQCaXUodIa6DUOvug8gfsQp
 WUrUdp9NKxpIsYPEb0vv9jb6gyIpB+0JXiSmCPZfzKcKIcerAuRvXGx+aZtGVpBlU2XM3yvBZTg
 trJItHDvQq2IP+rNhcx/1TAeskmie0g9ojr4ZIrpTVipiKX6mD3VQ8YElCfaBlw5tEjlLkCp7fH
 E8lv4JIixRvpG2wPf4QDuEKcFoESh3JHmgE8XVhhUSdVYHIY2dbESxEcWbmQd8mcyI02l5hVvbw
 xTyHnGUG2wli/uNocWlxaUHVxiYJ8qLkfIYPbQZE/gV8ae7Yw9hCAfK8p/NEMlXPKu++Jn2Vl9J
 crLaiy1bP7pqn3Y92FBV8ts7+nges4KroF62NA+DoGltwE2vG/taypOVmW3dB3w26PKmyv4yFdg
 siDkgKBGPRcXaykGfCA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87bd0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GUqRGlKH2whgtnOLMxAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: VbVClGKLj5M3gmZFGZHIIRjDpb9QcVH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034


On 15-10-2026 17:47, Dmitry Baryshkov wrote:
> On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the firmware transport,
>> display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP VirtIO display function, including the
>> INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
>> IPCC power-notify mailbox and interrupts, firmware display topology, and
>> firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
>>   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
>>   3 files changed, 307 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> new file mode 100644
>> index 000000000000..f7178c66c09e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DCP DSI host
>> +
>> +maintainers:
>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> +
>> +description: |
>> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
>> +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
>> +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
>> +  platform. The DSI host and its connection to a panel are described
>> +  using the standard DSI controller and OF graph properties.
>> +
>> +allOf:
>> +  - $ref: /schemas/display/dsi-controller.yaml#
>> +
>> +properties:
>> +  reg:
>> +    maxItems: 1
>> +    description: Index of this DSI host among its siblings.
>> +
>> +  status: true
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: |
>> +      port@0: Input from the DCP virtio device's DPU INTF output port.
>> +      port@1: Output to the attached panel.
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
> Why do we need OF graph here? Would it be enough to link one of the
> ports of the root node with the panel's input?
>
>> +
>> +required:
>> +  - reg
>> +  - ports
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    dcp-subsystem {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dsi@0 {
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    dcp_dsi0_in: endpoint {
>> +                        remote-endpoint = <&dcp_intf1_out>;
>> +                    };
>> +                };
>> +
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
>> new file mode 100644
>> index 000000000000..018694310dfb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
>> @@ -0,0 +1,113 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DCP VirtIO host
>> +
>> +maintainers:
>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO transport and
>> +  the host-side IPCC channel used to wake the DCP firmware.
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: qcom,dcp-virtio
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  iommu-ranges:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>> +  interrupts-extended:
>> +    minItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: virtio
>> +      - const: dcp_power_notify_irq
>> +
>> +  dma-coherent: true
>> +
>> +  mboxes:
>> +    maxItems: 1
>> +
>> +  mbox-names:
>> +    const: dcp-power-tx
>> +
>> +  dcp-subsystem:
>> +    $ref: qcom,dcp.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts-extended
>> +  - interrupt-names
>> +  - iommus
>> +  - dcp-subsystem
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +
>> +    virtio@9be8000 {
>> +        compatible = "qcom,dcp-virtio", "virtio,mmio";
> Is it really compatible with virtio,mmio? Can it be handled completely
> by virtio,mmio?


There are two possible approaches:

Option 1 — Use the standard VirtIO-MMIO parent (preferred)

Keep the parent as:

compatible = "virtio,mmio";
reg = <...>;
interrupts = <...>;
iommus = <...>;
iommu-ranges = <...>;
dma-coherent;

The generic virtio/mmio.yaml binding would be extended only to document 
the generic iommu-ranges property.

The DCP-specific resources would be placed on the virtio,deviceXX child:

dcp-subsystem {
     compatible = "virtio,deviceXX";
     iommus = <...>;
     interrupts-extended = <&ipcc ...>;
     mboxes = <&ipcc ...>;
     mbox-names = "dcp-power-tx";
};

The parent uses the standard VirtIO-MMIO interrupts property. The child 
has one DCP-specific interrupt, so interrupt-names is unnecessary and 
the driver uses interrupt index 0.

Option 2 — Add a Qualcomm-specific VirtIO-MMIO parent binding

Keep a Qualcomm-specific compatible such as:

compatible = "qcom,dcp-virtio", "virtio,mmio";

and extend the parent binding to describe iommu-ranges, the additional 
IPCC interrupt, mailbox, and related DCP resources.

However, this approach duplicates the generic VirtIO-MMIO binding and is 
only justified if the transport requires Qualcomm-specific handling. 
Since the DCP transport is handled completely by the standard 
VirtIO-MMIO driver.

Which one do you prefer?

I will be addressing other comments in v2.


Thanks

Jayant


>> +        reg = <0x09be8000 0x1000>;
>> +        interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
>> +                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "virtio", "dcp_power_notify_irq";
> Why do you need names? Can they be dropped in favour of using indices?
>
>> +        iommus = <&apps_smmu 0x15a3 0x0>;
>> +        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
>> +        dma-coherent;
>> +        mboxes = <&ipcc 13 5>;
>> +        mbox-names = "dcp-power-tx";
>> +
>> +        dcp-subsystem {
>> +            compatible = "virtio,device34";
>> +            iommus = <&apps_smmu 0x400 0x2>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    dcp_intf1_out: endpoint {
>> +                        remote-endpoint = <&dcp_dsi0_in>;
> Can this point directly to the panel_in? What's the point of describing
> internal paths in the DT?
>
>> +                    };
>> +                };
>> +            };
>> +
>> +            dsi@0 {
>> +                reg = <0>;
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                ports {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +
>> +                    port@0 {
>> +                        reg = <0>;
>> +                        dcp_dsi0_in: endpoint {
>> +                            remote-endpoint = <&dcp_intf1_out>;
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
