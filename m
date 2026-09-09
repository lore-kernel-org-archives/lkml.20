Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3733546FC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936200; cv=none; b=Ss0wQiRT4RbQzU3DfWSDDJfLL01NOpAWKmZejLHcBVAaI7ZTVg0hf6w7hfrqWFhDTvmKQN2xuFhvqUzckp5YY/hsMMJd7+ZX1hNxu1OG5oRFjCUz2DBNeND25BWCyVnjq8Uy+CKZfqMuLz4y7siR4aUAnTR87vGP7VEXDIDuF14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936200; c=relaxed/simple;
	bh=JACPY1/VqHX7t/8PTGyxIGJ14SnlTCkBQMSf/3ExT9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMkriLs3Sl/Fs1mvqB8VQ6y45mKJXFbe/yxucPTzArC739tve7t7zp87A3M7GvDoBQ8tRWmHMClrwmClaudF62Uqbq6/CyOCNRRJm2j7atQKHyvp6GANLF2EX/jhJuFuYORK1PoxE9vSRngXKFmJIRhedTsT9ly1tRNmA7Ldbso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwrWLGVP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REDtxELx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwrWLGVP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REDtxELx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6892a2Q11189167
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gSncg/waZOalwozhN7BaaqXJIs1BmymYB48sb8DdCY=; b=AwrWLGVP94aUuV3K
	Hdare4o4nEt5w3hZb7m0fFUhfo8DINdyHhP9UvThc2mu1L+0VljvKVP6hqw92ubx
	pyI/YyWWSm8IKhGDQmHnfQSppP7H7KMD0eJwzWaGD7AhRYt1ehn9CYRbe9qo+Fjz
	R9NInUrtLnrHrQtx80Mjwun+LeIyQQpAsBRkQPt1F/qfJWLMq+saFbja4lSZ0f3T
	gkx9Xtu00KRlC4/Gk+vXPkFLkeoewwC/3uV1u+cexSj2frXS4QK7JJzXm4X4WZdN
	5qoeFcF6SSqAfqU4WTkcVmUcKTpvno4sbtm3bxPobXCEe4ZMm9Ex3v/2zVnEnhgN
	/7uPLA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm0u3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:43:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so6407665a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936197; x=1789540997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gSncg/waZOalwozhN7BaaqXJIs1BmymYB48sb8DdCY=;
        b=REDtxELxBs1yZ5wgrTL5uSesJB7wB4SYfa0VUaFCvSokGEU+T35IFQTa/7kxw7jqS5
         Ch3mj39/UCaMX43WlrSZQQlYzjwj0q5kDcZdB/GhAiwcnmuASA+hVngVJm9BjPbjtUd6
         6fdsa+Z9Vs+SOunfZ+NDynngFUgtSPQfO2yoEEjejJgdC1a/TghgOsL2wKXXv0R+6H/x
         0FusCfqZ8S0ROd6oSO1OZm3UpEI7qaayG7fDP3c5OJ2/Dl32n4bLCOsd27krsHYkQjYg
         JS5+nH3wb0KFprWHpWK/l4xeBDgtl4TbCI40V8IoJId1bIhMQrBrG3GdKiBy6vIilWDP
         gO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936197; x=1789540997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gSncg/waZOalwozhN7BaaqXJIs1BmymYB48sb8DdCY=;
        b=k7iKxt/DKZ+nsNJNdhhBaBF+9SKqqDO6wL6J+hcSTK7y9hr1p2SOWGMIogOGHRyjiU
         3wMD3PCw7bjaxBo9xFyQSI21dvVNRrLeu1iTy9O7F/Y3h5V7QauOEj6v0V/vriZxVQcs
         os52+fib0+uw8YOEOq6V08DFIcb6+/g9tHqHmh3/llHu+SoFXP500fRF3a6URVQ7XJYu
         D/L102AF+4K/B2OB0RHzFxhFLzT7U0OHje8wkN6ukbTztBIO2QPVjTXSPEwGCnSR7W2X
         zPqvGNhALcikUd8z+Qlmn4T39Sxcvpzguq6M//UaeFa3J36BWvNrrlLI7Ol5YTbY6/s5
         q/Xg==
X-Forwarded-Encrypted: i=1; AKwUvBw5qg7BEvje8SJcuB+7k7xWvtwO8lVDU6KmpVbM1gotJRIwaj4clvq3t4Ikcl8jH/mUrmuPHc0HHNr5Rkg=@vger.kernel.org
X-Gm-Message-State: AFuF++kcwJV9mc0xO11jpnMb20wI3NdbRdNbFSGm1K+KTIn4mvALxMdN
	zzlvomYX1rJlSKxZsFjRJKZQrv1RTCIZfEUidtXy2G+dGsgjeRrktMKtDumOUJTOfRfJOkpzAYj
	Y1OHOMjkdi/04/AH8/h2NKxi/PxITKxjHRPZOsUK2ocbdNsmMFwI3MLDaCgciHW/iU8M=
X-Gm-Gg: AYBFou0QR//9sQpnp47MmCSfHfL+rfeF9f7NMd/6ZaY8HFOnzzu4QpWRooMke2mIjZK
	qpVAmos2RdLEiosC7MLVQyEnDt/cw3KYiFI2X5SpoxrPA09LvwGlkmUebB4UiKhmfSjSB8cOXer
	mb2KhXQrFC+f/Y9c0UHQP1FkitSb7l4xcm+mP1l2dI3XBTvSix1dADznIzdZqXQzMsH9AtiGGsg
	Ktrj0xphNXdM2rmP8iXSgd04iOQGJwj1o+JfPR0vJ2iJbNjp5CnDLyOd2FkvygdQgsSXTzbpMSZ
	9XEHTy9t+NXylab53g/pFLLeM/Bjw27NLzizXLf3BMX1NzogD5je1HfDuRhpi1SuREp4QFl0NGa
	nNy2tue1tDrYaNnFzcV19ILAaHOw0TW7D7Hg69JRDd1bk14YMOl8nW3RjgbRbSI8DA9qUUfk+zd
	WE42IfWOEOihH7DnnGlOqUKA==
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr49609297a91.4.1788936196540;
        Tue, 08 Sep 2026 23:43:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr49609246a91.4.1788936195929;
        Tue, 08 Sep 2026 23:43:15 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm39523941eec.0.2026.09.08.23.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 23:43:15 -0700 (PDT)
Message-ID: <ac236a52-1293-4a70-b5ea-ec6118cb02e1@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:13:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3NCBTYWx0ZWRfXwxWU6o6HLCLR
 IJNbW0mlxOpoSPXKa0BSSIM9Yn/5ooUB9jokCeZa+y8tHzN/tNbNLe7hnYosHNesizqdWvAMvoI
 TNkbEDESTLUqt/1dOcyx/+K2U4nah2E=
X-Proofpoint-GUID: MCYo9lgB8JDuLeXJzA3nIZ_elRTVYeZ_
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa10005 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sism7-CWozsur6xqZRkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: MCYo9lgB8JDuLeXJzA3nIZ_elRTVYeZ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3NCBTYWx0ZWRfXxoIH7aEj3O3d
 ze81seofvv6NjENGqX4dELE+fZZdjYXzxXZpiBGkfS7lYXEMB4w6ZvImfuXZxPx4qjRqE5+sDBC
 I8TR/dw0DQ7ViyAKvUkTq3kkJhttpDnT/9KThmbztulUoZJjCsXTobDObo3aoo778HWNDkjVqF/
 yHvgRcTgxTD+gKdthSm/4M2A3x3q45+BEMZFRM3UqieYdy+C85JMMB4R5DYLmYp9UoM+qK6rwne
 W8L62Qk4tsxl/EEfzpUZr3isWQtxE3O++KNgXdWjESiN1kQn1SdfUoWRlM1KSn/NJxmL91+npTs
 VxiapiVhmSVYRfA1dEqa6sc5btz9lP6BfPVmKLT5x0hHYTgjsUQvFaH7HaYHO3Tund1mpDpSxMO
 xFk7B1WoQFn8p3oFaprK2UkVrfsDEKGYrzJq5vycoQywLeXwqXS+3kzA0mA89O6yDF4ptS8GjWe
 Vg+r0OyXHIDA5G5n3sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090074


On 8/27/2026 11:21 PM, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>    - Global Clock Controller (GCC) and RPMh clock controller
>    - RPMh power domains
>    - Interconnect (NoC) provider
>    - TLMM pin controller
>    - PDC interrupt controller and SCM firmware interface
>    - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>    (added in v4), so like the other Qualcomm GCC drivers it must select
>    QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>    (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
>    -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/
>
> Changes in v4:
> - Addressed v3 review feedback:
>    - Registered the interconnect NoC provider from an explicit
>      core_initcall() instead of module_platform_driver(), matching the
>      established qcom interconnect driver convention.
>    - Replaced the NA mux-slot placeholder with _ across the pinctrl
>      PINGROUP table, matching the upstream qcom pinctrl convention.
>    - Added minItems: 1 to the interconnect binding clocks property so a
>      single clock is valid (system-noc), and aligned the binding
>      examples with the sdx75 labelled-node style.
>    - Added GDSC power-domain support to the Kuno GCC: the binding now
>      defines GDSC macros and the driver registers the EMAC0, PCIe and
>      USB20 GDSCs, so #power-domain-cells has real backing providers.
>    - Split the cpu-idle-states phandle list so each phandle is on its
>      own line.
>    - Collected Acked-by / Reviewed-by tags from v3.
> - Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/
>
> Changes in v3:
> - Addressed v2 review feedback:
>    - Reworked the interconnect binding clocks: dropped clock-names and
>      replaced the flexible min/maxItems list with fixed per-compatible
>      clocks (aggre-noc: 2, system-noc: 1), required where present and
>      disallowed otherwise, matching the sdx75/glymur shape.
>    - Made #power-domain-cells required on the Kuno GCC binding and
>      declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
>      is a power-domain provider (following qcom,sdx75-gcc); the driver's
>      GDSC support will follow separately.
>    - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
>      a distinct qdss_cti_trig1_mire pin function (and allowed it in the
>      TLMM binding enum), as the duplicate funcsel-2/3 entry left
>      funcsel-3 unreachable.
>    - Collected Acked-by / Reviewed-by tags from v2.
> - Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/
>
> Changes in v2:
> - Addressed v1 review feedback:
>    - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
>    - Reworded dt-bindings commit messages to the "Document X for the
>      Qualcomm Kuno SoC" one-liner form.
>    - Canonicalized copyright headers on interconnect binding / driver /
>      NoC ID header to the single-line Qualcomm Technologies form.
>    - Dropped unused <linux/mod_devicetable.h> from the interconnect
>      driver.
>    - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
>      driver.
>    - Extended interconnect binding to optionally allow up to four QoS AHB
>      clocks (matches sdx75/glymur shape).
>    - Cleaned up brace/space style in gcc-kuno.c to match peer clock
>      drivers.
>    - Reworked initial DTS: moved idle-states / domain-idle-states inside
>      cpus{}, wrapped fixed clocks in a clocks{} container with peer node
>      names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
>      stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
>      idiom; the YAML example uses a named placeholder), dropped the
>      RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
>      no corner votes / no pm_runtime, so the reference was inert), and
>      added a bootloader hand-off comment on the memory node.
>    - Collected Acked-by / Reviewed-by tags from v1.
> - Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/
>
> ---
> Hardeep Sharma (15):
>        soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
>        dt-bindings: power: rpmpd: Document Kuno RPMh power domains
>        pmdomain: qcom: rpmhpd: Add power domains for Kuno
>        dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>        clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>        dt-bindings: interconnect: Add Qualcomm Kuno NoC
>        interconnect: qcom: Add Kuno interconnect provider driver
>        dt-bindings: pinctrl: qcom: Add Kuno TLMM
>        pinctrl: qcom: Add Kuno pinctrl driver
>        dt-bindings: clock: qcom: Add Kuno Global Clock Controller
>        clk: qcom: Add Global Clock Controller driver for Kuno
>        dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
>        dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
>        dt-bindings: arm: qcom: Document Kuno IDP board
>        ARM: dts: qcom: Add initial device tree for Kuno SoC
>
>   .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
>   Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
>   .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
>   .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
>   .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
>   .../bindings/interconnect/qcom,kuno-rpmh.yaml      |  118 ++
>   .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
>   .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
>   .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
>   arch/arm/boot/dts/qcom/Makefile                    |    1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  423 ++++++
>   drivers/clk/qcom/Kconfig                           |   11 +
>   drivers/clk/qcom/Makefile                          |    1 +
>   drivers/clk/qcom/clk-rpmh.c                        |   15 +
>   drivers/clk/qcom/gcc-kuno.c                        | 1483 ++++++++++++++++++++
>   drivers/interconnect/qcom/Kconfig                  |   13 +
>   drivers/interconnect/qcom/Makefile                 |    2 +
>   drivers/interconnect/qcom/kuno.c                   |  988 +++++++++++++
>   drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
>   drivers/pinctrl/qcom/Makefile                      |    1 +
>   drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++
>   drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
>   drivers/soc/qcom/Kconfig                           |    1 -
>   include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 ++
>   include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
>   26 files changed, 4271 insertions(+), 3 deletions(-)
> ---
> base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
> change-id: 20260809-kuno-soc-support-1dab826de0bf
>
> Best regards,
> --
> Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Hello All,

Several patches from the series have already been picked up and applied
through their respective subsystem trees.

The remaining patches listed below are ready to be picked up as well:

  [PATCH v5 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
  [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect provider driver
  [PATCH v5 14/15] dt-bindings: arm: qcom: Document Kuno IDP board

Since the majority of the series has already been applied, I would
appreciate it if the remaining patches could also be considered for
inclusion.

Please let me know if there are any outstanding concerns or additional
changes required from my side.

Thank you for your time and review.

Best Wishes,
Hardeep Sharma

