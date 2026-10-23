Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743040;
	b=qb9w1KycZ7bQI4ijh5fvLNyeRKS0lW4DfAYwrcMAKRF11n/cU/JJE6UuxgUb3/P1v4sT
	 bBCjFiFEHVbi8h+Y55iXTAbdyzbyW3HBfmh0DxYSg1uTqvcfuccszRiGruiIWFva9/zRd
	 WGBRRSCEeNBOpzkp3dHtJ6yLYljiTwPRV8oQtGEjHXriLc08TDlS3DIWOn09TjBpy+Q0v
	 7LrIJkonizqMWkUvaREjcTAvWJN53gJua3gTNpSX6Udo7LemXUj1aA8YJwHPWXp7d3Omx
	 lv6Xe6O+1xh9q69W2sUKPe9DEYML0A22fkbz5ws9A7oSjDjObW1+Ak9pabvHwf7y3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
	b=VzUq143bwpdNTv0J/rGHTz/HVxXahJqqOvmRBZuwEaovA8cMWhiSHg3jrnv96W0s8e1F
	 bxZYaZIsSF7MkGt10OW+9EcEN8YZWPkkirr2hMNQGETs6bpOTpXf8dAVdiuKcSYpDgWCt
	 e904eJ+ioXyZY2jgKJDQhr7Y/dXQQBmLrkToCud0NLNaBNvXB8ZF9k5jTdHNCteBsjkW1
	 nD5BnR4HLBDJ10YBKNO5anh/EX253hy2UeXi7sSJ5P1Iwfg7tl4OxXC9qH8CmGe0P1jY5
	 VZTT/BuArDP/FGAxWJNWdD3K7TxzPPTRvEYvzrFKe/JozlGOL/cUhzS3+uPIuIE1lCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e45Izuit;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1704606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1704606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e45Izuit
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9na2112120
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=; b=U7fHBr2Zzr5BzR0l
	GZ4p+H51nKm9WVAQPxZtK5Fxkawu2eyIUw8uq1dLaEEiMmoXZzBSEOt1Ca9eoWJh
	Lmldut7xSV7XBgCfpN1LqCL+BlRp56ZaYaSsa4GwxE5GF1t7f/hD6UuuO/Nb3+Ie
	pzBPhe/0u5Dl7/AVXrCPWXw/OJQQoSxrCbRu2YwIGvD6Eh/ZW3w29qV+5Ex5n93u
	V0Ekb2Macw7YJI7/WfuTkPsM2grc2qboRWV1y9a+c6TX6khVSg8MVWZxO16ccf14
	DwWONyUX847Rs1JDb87TeUaYuMA/se/zirkPxWskU8S8qCLB8g+30G4DDdGoCCK/
	zHAsZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyka3fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:10:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso1078171a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743038; x=1793347838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=e45IzuitG6Hw89f+NJpwhNPo7fkPr1mPDbK5eNSuPgeGFFPxZgTihpkaIE5kSnEpm2
         8eEz86Q+00rU62TzH/J89CW09JSQBz7m0+19upcVb4m9kUBJa+n3BFO/MLwkcGm7f9lR
         rG60NjoorCDNbBeaALnYfsrBabFXNiKFOuKXl3v27p9xU2xriQExjJbO2I/7QbQpwNRm
         Pf1H34Rqvvj9b82SyQVVmjbtEB0mosfLqp4v4+vOFwudUv6mXMFKnwOk1Wo+V1YwVn+/
         7rieHIvIXkzENGZXQo4DTI/SDgh40bjscMXXphHeU6/RK/ENh+6Nr4TcXYTVmdARCvBJ
         sJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743038; x=1793347838;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=qbsTtAYnJBjjBA0ahP0SbaUwYpVcAFCEO5TEiVUGbdkp4CRAg26sqkw9zAn4sFD0Ta
         4iDhRVdh+63r28um3idAoXWdW0ITX18QnDAgsWJ3Rp/fU3KHtlNmJ30LqqbppQzM7War
         T/PFSth+SaZuzN9hw3rKgmacxRvNnN3pFr5ET0BZI9RpJTkIst3oEtKvCHobRKtLz57n
         8nJB9q/1a8YXJxXrZLflEA1DqqItLNPXfBoAmaeqbcaZQeibJA4EbEhajSdYj/swcO0v
         A3VvxcqBN7pu9NG31EDr7LmO1PqtNy6Fukeu3P7vcbNO0U/i0STTOKZ5ScN4fRgqphMA
         YMqA==
X-Forwarded-Encrypted: i=1; AKwUvBw1spGXaA+HSzUMyVqQPBVU+YCLppUA4hKS7/cw8LuLJnAyGbHjTm8Q81Buu2UqM+duWLEqkRvme47tMJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+a83gcR2vIQkZ8dShZPEbL2mPkmVmWdsQt98fkcGavcc08BfR
	gfwwAiW6a86nO398rfFZYJPwGLQX+xhRYvwrLC+bm6251tnQgkQEe3ZXbZzXQOOPVHHiJgSTLOO
	sw+rlybFYmpJeGN/Kq4kW13wqfRQjiAv65zTmUx7EQSo5Im8eqb6uTYD577vb9+qqHeU=
X-Gm-Gg: AYBFou0f0S6qwEef4wDi+V9R+Ll1Qc1+QSqUyUasu1xixdrR5O9nB0DadRD54/LII5v
	cF2wvlCMopCA+4ptiv4m8v0+2ZtW3YFXnVXcYqx7ZLvq1pjrECLGu0SdHAR9Z3HMhpMRLTahX5l
	YnTtyFAYSrlA7g50260/c0lWxjeyh6SWXB2awSmwmqh6QkydOe7qzvSHXrmmcIHP/EqRP+cSQ14
	W2rrBMLxXgZXqyznzdU5bqgjo4WJaZvV+7ESHSx2e6pDIN6t3lvGsV3X7mdjqVzQ7F6kPt48jdD
	aYH+01ueMlteDum5v0ZIkrruLXFlr5ycYo/9GEcJz9nPomoA5wV0YT4yRSc6+NjQx4VeCOQuhVf
	qyoSKpOry9B4akRwEhOx7fb3jwYRcGEOWqw==
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162588a91.44.1792743038047;
        Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162541a91.44.1792743037308;
        Fri, 23 Oct 2026 01:10:37 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb0a11fbsm2517749a91.4.2026.10.23.01.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:10:36 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <ae967eb1-cc54-4733-9e89-bc375e1cbfd6@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:40:25 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Language: en-US
In-Reply-To: <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7+M/gAseDQvr
 b+YPglQAABPRfg4kb5+8aG8eHECTG091jWnnxewhu3J7iR/VNT7EzM/QcxwxFjTmTbnmitqibO2
 7MS7LYnsW7twF7zB0agqwZLeQLaiuSHO70hMpnlCtxV+LfOaESMD8rJ7Te1vd1ObHK6UGVXDTcm
 6VBAtRJmRgedFRRQKHrEyl8+Xu9MsKgkbs25hdolE7bHoA/Wm+pDijvRwXiZvJKfuED5GSRCeZ0
 +0o0pyDBbkxFAXwTZBPB7XFWHA0+VlZ+VA74PMPcw0yhisf5xvjYFD0MztByRSJDayrG1T0kv1M
 djHcGqW4MyRx52cg2gUVk7Q/GmrwznFAQE8LQUSqZ9aTdp4D5eyIaTFGJPS7LoAOGFu94vYYRpT
 2mus66jeyFkbTnr+srLReVfodWiaq3+Whey2cGtid2PisG3hmFVhv1euPrVn8T0C9fy2ebR5kLP
 yb6+CCY4UXkGYD56uvQ==
X-Proofpoint-ORIG-GUID: 2tYV2yS08lqcNPC7OKtzY3IzZxunRc2U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXwhi/u/NQJGvn
 S5vjV6ywqHv/6FfiAUq09K3v3uyn9eDcMW3uM9JQAgRr6pK5msds462QenDJTwQa4gt7t22VeHV
 p1gzslycGrBCXU6mSJxucBPUV06q7Fw=
X-Proofpoint-GUID: 2tYV2yS08lqcNPC7OKtzY3IzZxunRc2U
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb167e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CvYCOFMdU_owP9l6gQwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 15-10-2026 16:20, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the firmware transport,
>> display topology, IOMMU contexts, and panel connections.
> Due to dependencies this cannot be tested, so limited review.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>

Thanks, will fix this in v2.


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
> I see slop, I finished here. Mind this maintainers summit words - if you
> use AI, you must use good one, not the shloppy slop.


Will remove this in v2.

Thanks

Jayant


> Best regards,
> Krzysztof
