Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744345;
	b=M3ROFh4EeVaSSECh0wOkDQcYWRgl88kwBHkVn8BAP6ouSF+WB+UPrAzVwNZPxfCxqCkL
	 BZaTzGAfCus7uLSCL0QEH2FqAC9uYz4WwDRQL+ZHegNNdayhBC9Qk/1PqAdw/MVGtL7LG
	 tZuPVGHuOsv2hJG79RRydYrXDXyhvPO+CO46vcTbtfVRr1SppbVeA1WB0vRm4EUDeRhaW
	 b4iCgjLylkSgb4SwhcwWl0a52kws8D82qua6ORKiqRTyPz3uWHUfKtNA8BjFARfrsW9DA
	 21XBEshn+5C2SEfAFZxS+hIVkABTXQ7oIVm4nCTEZMLFldm3frkv8ESVC9JBKMvCTeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=;
	b=v4aUXU/df9akuse7tsc6zkVO05PbiaeLbNW+iqMcOMX5le4PmhScScYoi1t2s40WnaqC
	 4YiExwM+x7JA5N3TOFraD1orJYls34J0jQ4IM9ZWk+B4RxlN67TLjFKiRWPvYVMg4t4c2
	 +4HVJwEZJYVEu2uRkmOhigIzr77A1eR64Z5pEt9tg4D1JQXKVbDYNBcp2PDU1unuj2lmt
	 ekUXc72V1TRjz0xRuRmuuXXjljQ/m58FG2L95wrTk8S3eY1rd6M4g/O+Y5L0PPDaAsDVq
	 DHC8W0+xhUjn+QM4hjylkQFeBbaUDUfziCMznpZc9lWD3AugnYfZhGjcD2iZRoo/ujQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JglFhSEp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRsH0UTN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A57606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A57606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JglFhSEp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRsH0UTN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FT522650391
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=; b=JglFhSEpN/463j+0
	h9Q7fxiikFUpCb1mOWbGbX55shsWg+75t0La1Ctrv9XWte5rq22Y9eG56Gzam/u3
	C7PhBBu0uIFFqTjFSSXwmRKjTuYlsZ2fW+Uvhfr8eZP3VfvTu8tKyDaBBYdRRvFN
	JmAhCmEVn/9NKLk0fjloCCqL9kTm02pebHvvcegUAEyJq+27AlP9RzOQaTvwgnec
	2c2au3mR+Ali2k9WF1zNLxB3n4yhB52hPo5c2dLFp+5/5Iqcsf61mkRziR92lNjt
	vTBg9ZZuy+oMSb9NqrnGW0HjTyRaGlt1AFGXjQKdQT6gmn4zv6LH8LilUyczlnwV
	7AhggQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjasnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e58614290so14150585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792744344; x=1793349144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=;
        b=SRsH0UTNH+ZxhsMkcvmLUsalbdbmtRtPIWdav/6XCjlKg8IbpMw+m7QFeb2hmJEeRj
         mC4yKp+FE1gJQPBFTRdpiy4UxQAqumwq+YxES+W57xPDg006/wz5zqG4gi8HQi/gTYr5
         J+K/ofJDagXkARsMajD7HFzWRPwJY/If4yeM85ECwwiEl2W4ccS6Cfrri36IVejNjH5s
         vQeDYAs7qOVAwDgVQ8TBxM8DZglO973qiGVCb6A/P+t2mgOAAkLLTx/a2IsLE/T9Fo8K
         TXQAw56nFZGZZ1PJiovn0DUzQq84GWHxsBPdnUm0cedacJweA/9ETWVLxo4x2gtc1CBW
         q7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744344; x=1793349144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWDa8pTB10NwUg70R0bD58or3FOQoW7MLVqNJx2zkck=;
        b=SOtPA0Bdkcgkj60ksBFLu8cVnVPuXl5KewdQn2BQy1F8OHJn3w5NKz6mz7agVFTj5Q
         K3ggAhDxSTSh07v/KoA8d6Mb7MVC5d+hZyo4emc3d7LyQXIaFiv9UpV93Kj8v/ZujV0v
         LR9Usx8/8B+QCMKA3Cva/a1XnY+ctmNmvkfjAHXfBqZr7IZXmLTyOBHYlhoxywMhfhv3
         QQgqpIlUKhGhrqV4ZeqxcX/epvYGK3bjeUWGfueNWo23Eta+ddHyQQX2gfRuLCxHh7fT
         hWuMZyzL7+J6f/qLKxr9Z9KROp7rCV5ZAHEObrUZIDKpodTRLJ+AvB0pdUXeNgLluCgk
         U6qg==
X-Forwarded-Encrypted: i=1; AKwUvBxcQD3Ub7U8ihL8nccwbtFNJ7F4c0Se/DeX9QPtTEw+djWKtOcFA020zAEUEs/h/VsJh24CCp5/+zJwe7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2/brAf3yguqZOqSdkY8zvIcISc3iPIGzWKAWYqlOXfn1dlONP
	LXVTP/w0waawoevWFdgYD6qtyqhiDWgTPj0+JkvxdpamNc5Lj2312pddaT7so+Oi1uQPWT/GVYP
	6ChNov2Iz5W5XhNcCH3kTdtHmbzE1Ru9iHDT1MJQPiwP5ctKoxUzxwORJOeepAsHJoYQ=
X-Gm-Gg: AYBFou3zAuPSlnGEkqSiCejbtayUoixCf8vS4/QQIg76qA0/xdl7W9REdyWEZ805+os
	HY18voJisBg+uLbwmH8U3Qh3byCBxR7jRE9c3twedcx3LPttA6pYD7YNr75WkRxX+ib6P0wvERP
	fQDCDB3UwqcbfJVNX88cMQPGz6vqsA/t6sLtE8/UWe7H3d85KM79KKycjv581Qg9HfAWsi3NW4D
	3FJQqI4gZzN4nq/cfXY6XLpuNtLyBtg/Zt9m3PbFtzn4IuYCoOPJouz0MJ8X4nN1U9PrbJQ9W+/
	jfDgUo/iVFJ4xwmEX4vaa90d+mZI9Q1ut3OaCB4++uYD+WqrsZs31v60F7p4QrCTD8Y/oKBn8gw
	Tj4yF4D3SAQ1qqKY9tw3xsA==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr310820785a.0.1792744343401;
        Fri, 23 Oct 2026 01:32:23 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr310817985a.0.1792744342945;
        Fri, 23 Oct 2026 01:32:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c81c1bsm75481866b.44.2026.10.23.01.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:32:21 -0700 (PDT)
Message-ID: <ee86c401-5e1b-4c1c-9f43-fac90fb303d0@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:32:19 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Motorola Moto G10
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792703903.git.me@michaelmcallister.org>
 <9d30c98a7eb0e57b09f239e8276f6d84422d9fd4.1792703903.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9d30c98a7eb0e57b09f239e8276f6d84422d9fd4.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 36ZMbz9qZwHubIz1PqN_6lcfeXrHZ8hm
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb1b98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JwJ85b4fAAAA:8 a=pGLkceISAAAA:8
 a=oW6_BwkcVB5HKUzH1HsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMyBTYWx0ZWRfX+QKBA7n6whtz
 ED9GYCjBUg4LzNoatjcj/MTOzMAzwrm0SfUJwvSj+2CH8LabX8koES+8tqVyHn/g0OgAskr5wcj
 0Ah6ZURrQlI/8KW785QBroK7QfrspNo=
X-Proofpoint-ORIG-GUID: 36ZMbz9qZwHubIz1PqN_6lcfeXrHZ8hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMyBTYWx0ZWRfX1cIOOruVa8iO
 2ClhfQH36FmCBLmjydEKs8/RQnV0m/3WZxVpebkxXfENW0Pou5jtnlT4oGS730or/jjew779Bo0
 tsooBuLCcMXN5NgCpc7611rUEnqrjlb4NIUsBIn38qw6x2M6uXbtFJXzBKsN0gZeH9YzF+XUVzG
 o0vCgQLIgUIJSo6pTPB3laBUuAbkpHuBJqL1C0iFaXK6MphXZW+3ueDFX/Wyi1uZJe4QVaDJNW0
 21wYrYozJi+ftZgXLYb/plJRHKiyLDaNQYo0XeS27YJOvyWeheryf2iI8L2evOs4qssUCaH0bFo
 HUd2k6Pzu0pxoGBGAs5mFlAP2rYP5RRdrSGldRc7vsVp/HWIrAxqOp1hGkjgaqHSfVOE4Cybdpn
 kzo+aQ3WeDjpGJDCyPz8Sj7kwe7Gz4oG6Iccvwbo8d5WvwAmsNOJ4mJb0GXagv462820ds1oat0
 W2byzH5/QmFE4DnqZfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230033

On 10/22/26 10:40 PM, Michael McAllister wrote:
> Add an initial board description for the SM4250-based Motorola Moto G10
> (codenamed capri), including eMMC, USB-C, buttons, GPU, Wi-Fi and
> Bluetooth. Use the firmware framebuffer until native panel support is
> available.

[...]

> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026 Michael McAllister <me@michaelmcallister.org>
> + *
> + * PM6125 regulator definitions derived from sm4250-oneplus-billie2.dts:
> + * Copyright (c) 2021 Iskren Chernev <iskren.chernev@gmail.com>

Did you adjust them to match your specific device? Otherwise you risk
some magic smoke..

> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "sm4250.dtsi"
> +#include "pm6125.dtsi"
> +#include "pmi632.dtsi"
> +
> +/ {
> +	model = "Motorola Moto G10";
> +	compatible = "motorola,capri", "qcom,sm4250";
> +
> +	/* Used by the bootloader to select the board. */
> +	qcom,msm-id = <0x1a1 0x10000>;

Please add a line to socinfo (this is SM4250 as you said), include that
header and use the define here

[...]

> +/* The stock firmware uses CPU mode 3 and affinity level 1 for these states. */
> +&cluster_0_sleep_0 {
> +	arm,psci-suspend-param = <0x41000023>;
> +};
> +
> +&cluster_0_sleep_1 {
> +	arm,psci-suspend-param = <0x41000043>;
> +};
> +
> +&cluster_1_sleep_0 {
> +	arm,psci-suspend-param = <0x41000023>;
> +};
> +
> +&cluster_1_sleep_1 {
> +	arm,psci-suspend-param = <0x41000043>;
> +};

This isn't customized per-device. I've confirmed these values are
right, please update them in the SoC DTSI in a preceding patch.

We also have this state:

system_sleep_0: system-sleep-0 {
	compatible = "domain-idle-state";
	arm,psci-suspend-param = <0x42000343>;
	entry-latency-us = <10831>;
	exit-latency-us = <4506>;
	min-residency-us = <15338>;
};

but this is definitely going to stay pending on this series:

https://lore.kernel.org/linux-arm-msm/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

[...]

> +&reserved_memory {
> +	/delete-node/ memory@53800000;
> +	/delete-node/ memory@56100000;
> +	/delete-node/ memory@56110000;
> +	/delete-node/ memory@56115000;

Please remove these nodes via a &label_reference at the top of the
file instead, so the compiler will do some more checking

[...]

> +	/* Bootloader debug data. */

Ultra nit: usually comments don't end in a period

[...]

> +		vreg_l8a: l8 {
> +			/* Handset ICNSS DT overrides CX/MX to 640 mV. */

This is presumably CX/MX for the bluetooth chip?
I find this comment a bit more on the confusing side rather than helping

> +			regulator-min-microvolt = <640000>;
> +			regulator-max-microvolt = <640000>;
> +		};
> +
> +		vreg_l9a: l9 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			/* Display and touch share this rail with Bluetooth. */

This will become self-evident as you add support for these pieces

[...]

> +		vreg_l16a: l16 {
> +			/* ICNSS WCN3990 XO supply setting. */

This comment feels likewise a little strange

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <14 4>;

Do we know what these map to? Usually that's NFC eSE or a fingerprint
scanner. If you do, please add a comment, like in glymur-crd.dtsi

[...]

> +&usb_dwc3 {
> +	dr_mode = "otg";

OTG is the default, you can drop this line


> +	maximum-speed = "high-speed";
> +	phy-names = "usb2-phy";
> +	phys = <&usb_hsphy>;
> +	role-switch-default-mode = "peripheral";

And this is the default too

Konrad
