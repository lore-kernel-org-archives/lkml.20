Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2222D0620
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664421; cv=none; b=VrEl29SElTCEYGb91CSNXeu6CxdLRfuGTxPaQKBMLobxKhxQ7OSgnU8LzWU79ftIMzlKEDI4NbwsPn/IhvALfo9HoPeuFdGK6gxOHxF+a7YNKCHVy3MRf0+TR5sfQv2acPhAX8pJ9xrNHUDWaKv9XJ5noyNlDlyaWGac942CkIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664421; c=relaxed/simple;
	bh=jhns9o1aH6iPdPgD0g0yWgPCvBalx7FdHab0wXlB0r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qQxR1MFs0LO5e7+dPFMRkGeMremJwb6l5JtyYf2InSnm7/oYUN8pkFrzoK8u792Sr5wiL7minLS/Ui9NbBJLs3116eweSl8S5EeakgdXJQeHvpusBoHtKWif+wQpN+YX95M8J1JKSJWgky75h/j3Akt6+0QhudUoNM6SJ7EcPTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wq3wr02g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za0bxilp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wq3wr02g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za0bxilp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Y0Q3242098
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lW8nBIPQgKpoeVqtnGIYJJ
	k+7q10YrOHEh13uDJuKkE=; b=Wq3wr02gpP54WQYB9lUkLiI+L8IitP91T2OAsw
	Y+mkKsnhpwiL9w+0TDtaITpXJm6sxUlHYaYYrbdBG9G5HM/KLOYPr39gAqCh2By8
	s7yi7Ae2xNXEB09FRD1iq2H7TIdlUQtwGOyuiJTZKrKy0D2G4AOQqW0ipK3E0t9c
	bzfvBSe1re17GF8hrmSYej45o4qkm1JYAT3qaUp1ICLkrZ/ibujNuaf1L4G2R4/Q
	sBZEzUN06OhWnAzhoHSaMFnSfDHeeU0VUpvLQ8Ck2J477lC2jFbDuCEyzVLuA7tX
	qc0aE88FbpIIlNMgo46MQge17/rrxyWgWL1UzjuECFCKohEA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144shqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2168274c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664416; x=1791269216; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lW8nBIPQgKpoeVqtnGIYJJk+7q10YrOHEh13uDJuKkE=;
        b=Za0bxilpdGzwaucsmUMWHFXOOuy4c0Voym7AMFDYgaB3ggnupWimf0x/FlTEnw+TPV
         IOZjx4EutBl5acPrqFFIN+SZvPb6Hv38nQ6BqBoI0XjiAaRRibfJQAnP2wYbbP5dRtPS
         YV7cu0vex138SLv9AAiMUBBae9BjOwyrlFs4H6EH5HUjz6U2Zk1TSfno4EvFPQDb6HPL
         pS+HEyzBpE5g6BfhCtuR6WTpUCpP8z62VryG60hhMDBAq0Bjqbhg12Ul8Chp3wahdyXh
         Eb9o7FnnLNbVs58oi7Na+lsak8sg/ejRRNJ/zu96MqurEDmQBD0IZ8NX8vRQ0US9RQUi
         ZGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664416; x=1791269216;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lW8nBIPQgKpoeVqtnGIYJJk+7q10YrOHEh13uDJuKkE=;
        b=iCkymOTMrvdPwWbY9e/WVLi2iVhhAhFbAbbuB+GnmeMPsA3kNTHORoltotDjFgmPCl
         Ukr6X7f8hgFMz7Ui8cgp0tX/iQOiioQt9wXg6oVHjSwkRYaD5SJ3CdYjoZW0KQ4xnykb
         ekPyquB7Lc5j/ISZAGlPbOARHOrtPvZGZlYTy0BnsA7mU0c647x7ZV7HG1E+7aIbU1RF
         V//cPMqJkxzQ7R7/HA1Gho/aRgQQivv94xxKXhOdvSHnV6e+3e55V57nTUa6EYqE6IJX
         9vuXFeBYRzd9M2J/qyVFrhaAFXJF4q2i05v8dd7495mBAOKeJMWEIKwjqMfZjD+o7eEI
         vQrw==
X-Forwarded-Encrypted: i=1; AKwUvBwmmnBW223IC842bVf9ZmXtPoZ4PyCu6gbW/msbvpwUndH+7PCiiTGiNWvrCR5m7kQbBNEMwTRS4MD+AUc=@vger.kernel.org
X-Gm-Message-State: AFuF++kGF/csle0675CCCT8sALeq6DvRPUtGD9q/pilJUM7PzVsZY++H
	ri2iRXd6mHV1lrW0vwiwbvUVUXhhM9NviwOFYGQ4LjipuhCuiKUxXX6mVTziG4lCqCpJk/GUN6c
	gZ7u+7tDKFcbo8U9XSN6TwkA/fQpkfdx9EawUdZ+47i9oxiCoVGpglm92e0S1hXGNdeA=
X-Gm-Gg: AYBFou3Md8aVCKQPHFf5f1QnXWMP8s7suiK9N6qlNdlxUMh5kbvO92Y7L6xXiXZFBP1
	e0s7w5TDYYtYgsNefNOYWmXfO65Jn6p4lDZPXlPpvYdo2WUzXbW5+1kCOcENecNYGuNMzyCSVcI
	nN6/gLf3PcYAdrQIk4HQGgI+tugH4LNaPyXvLqD1yTzdX/1peVG4zTdf0716u1KLAAqjNkZmrvb
	PKVisqPdPZ71waXU/eBLKdve+PL/c0p/Pk48kaGVC3jTfb8vCjI2zbb++u5WUI9Us8PEECUCAtG
	huJ/bnU1fL2zf33c1EkNy4idPuM1jCaC5SwVJFqbp66XFQdy2Ar22eCYbO1q2RnkHZPdlK/A3Ty
	QMkXA36o+16jRN0IbUsFFwPNx8AgXRx4VwiJlAX43rP6tg/xCPV3OECKFH2Q6VCYcw+L5dCQDoZ
	RGQtoh3+jbVYLSTjsU9PBoZQ==
X-Received: by 2002:a05:701b:424d:20b0:143:5266:48ee with SMTP id a92af1059eb24-146d0b58811mr13176835c88.42.1790664415431;
        Mon, 28 Sep 2026 23:46:55 -0700 (PDT)
X-Received: by 2002:a05:701b:424d:20b0:143:5266:48ee with SMTP id a92af1059eb24-146d0b58811mr13176801c88.42.1790664414678;
        Mon, 28 Sep 2026 23:46:54 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm27515182c88.17.2026.09.28.23.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:46:54 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:16:46 +0530
Subject: [PATCH v6] ARM: dts: qcom: Add initial device tree for Kuno SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANVeu2oC/4XOz07EIBAG8FfZcJbN8KdQPPkexgOFwUXdUqFtN
 Ju+u3S99NDqZZIv+eY3cyMFc8RCHk83knGOJaa+BvVwIu5i+1ek0ddMOHAFLRj6PvWJluRomYY
 h5ZEyb7uWK4/QBVLXhowhft3J55ffXKbuDd24OmvjEsuY8vf95szW3h/8zCjQBgE9SgtO86dUy
 vlzsh8uXa/nOsh6ZeYbh8kdh1dHgDbayABBiwNHbBzOdhxRHWYU8k6AEqo9cOTW0TuOrI73QgY
 umuCYPXCa/5ymOspLXX+xbQCz4yzL8gOxx2pp6QEAAA==
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790664409; l=17868;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=jhns9o1aH6iPdPgD0g0yWgPCvBalx7FdHab0wXlB0r8=;
 b=mOuxg4XEywDzVmAIiWKQmIBN0Wr178ef9yUViAIrx5LKkm5rMfDrMeBx/UnakPratokq8myl9
 ECENzVDgHlzBwhoDe5I2bPL7wBVtK5PRuHXpdywJ6Jw5Fg1dYPAaZi2
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX/mZTAqVdm56u
 G+GyrFJ2vz5EaBzeWHLwhonjcAWekvG8fsLJfePVVwq2lQ5V0C2GG1gFj8Jp/MZsJAlbm0c2rMW
 ShlkuF5AIdneSmdT40iOaNqBKCbxsHW5Il0dpLPtthfqnHkP5cWy/S6Yd6o6EhBWchx7AOMB1A/
 NB7lZoYGdwsnKpMep/6zhrvTQqA0rxJ8YrtpomLcZYDMCTrMJWbuwABiA4kInh1Y9wFCkC/lDuV
 WUMBkXzjcTC0QDsD9gIjhzPkl6RaBpmNXQwqpkT4iJogISGmDvRQvEVSBuSHTRXFCg194KpSYUv
 TXyexagmDRNu3JKUlGBWhvyFl9LsLPf0TrG79uErhow/BMFPlYRmUy21IfDVaGiua0XA3s5AWvp
 c530E7gTGEtZ8pPaX7Kl/MSjiROPnQPP5wrMgGZj1R8bovw5AqerLJYFYH4yeZAZ7nhSsDCH/fZ
 kOgf5asDMX7R8l0qvCg==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb5ee0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wSlALqp9qOdmPLHSED8A:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: eQn7FUqK2AWUOs6b2_g-zNu-j1Ffkjns
X-Proofpoint-GUID: eQn7FUqK2AWUOs6b2_g-zNu-j1Ffkjns
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX1pry9lEUtsrr
 SzDHVxa2JY/+mxAvznJRvF3F2bugkFIzS9Hly0FqmkwLRj+cgnXoR5kgfOu5xIrAwUuhMCqDbMD
 7dJDZjV9+iYQbBa147pCBk5QGjLyM+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290026

Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
(qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.

Peripherals included in this initial set:
  - Single Cortex-A7 CPU with PSCI idle states
  - RPMh RSC with clock controller, power domains, and BCM voter
  - GCC (Global Clock Controller)
  - TLMM pin controller (110 GPIOs)
  - Interconnect (aggre-noc, cnoc-main)
  - GENI UART console (QUP SE3)
  - SMEM, hardware spinlocks (TCSR mutex)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
series (bindings, GCC, RPMh clocks and power domains, interconnect,
pinctrl, geni-se) has been applied and is in linux-next, so v6 carries
only the SoC and IDP board devicetree.
---
Changes in v6:
- Rebased on next-20260928. The rest of the series has been applied,
  so only the devicetree patch remains.
- Addressed v5 review feedback:
  - Added the full qcom,pdc-ranges map (22 ranges instead of 3), so
    that all PDC-routed wakeup GPIOs can wake the system.
  - Added wakeup-parent = <&pdc> to the TLMM node.
  - Replaced the explicit soc ranges with an empty ranges and named the
    node soc, matching the other 32-bit Qualcomm SoCs.
  - Widened the QUP wrapper ranges to cover the whole 32-bit address
    space instead of a 16 MiB window.
- Link to v5: https://lore.kernel.org/all/20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com/

Changes in v5:
- Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
  (added in v4), so like the other Qualcomm GCC drivers it must select
  QCOM_GDSC; otherwise, in a configuration where nothing else enables it
  (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
  -ENOSYS and the clock controller fails to probe.
- Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Changes in v4:
- Addressed v3 review feedback:
  - Registered the interconnect NoC provider from an explicit
    core_initcall() instead of module_platform_driver(), matching the
    established qcom interconnect driver convention.
  - Replaced the NA mux-slot placeholder with _ across the pinctrl
    PINGROUP table, matching the upstream qcom pinctrl convention.
  - Added minItems: 1 to the interconnect binding clocks property so a
    single clock is valid (system-noc), and aligned the binding
    examples with the sdx75 labelled-node style.
  - Added GDSC power-domain support to the Kuno GCC: the binding now
    defines GDSC macros and the driver registers the EMAC0, PCIe and
    USB20 GDSCs, so #power-domain-cells has real backing providers.
  - Split the cpu-idle-states phandle list so each phandle is on its
    own line.
  - Collected Acked-by / Reviewed-by tags from v3.
- Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Changes in v3:
- Addressed v2 review feedback:
  - Reworked the interconnect binding clocks: dropped clock-names and
    replaced the flexible min/maxItems list with fixed per-compatible
    clocks (aggre-noc: 2, system-noc: 1), required where present and
    disallowed otherwise, matching the sdx75/glymur shape.
  - Made #power-domain-cells required on the Kuno GCC binding and
    declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
    is a power-domain provider (following qcom,sdx75-gcc); the driver's
    GDSC support will follow separately.
  - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
    a distinct qdss_cti_trig1_mire pin function (and allowed it in the
    TLMM binding enum), as the duplicate funcsel-2/3 entry left
    funcsel-3 unreachable.
  - Collected Acked-by / Reviewed-by tags from v2.
- Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Changes in v2:
- Addressed v1 review feedback:
  - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
  - Reworded dt-bindings commit messages to the "Document X for the
    Qualcomm Kuno SoC" one-liner form.
  - Canonicalized copyright headers on interconnect binding / driver /
    NoC ID header to the single-line Qualcomm Technologies form.
  - Dropped unused <linux/mod_devicetable.h> from the interconnect
    driver.
  - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
    driver.
  - Extended interconnect binding to optionally allow up to four QoS AHB
    clocks (matches sdx75/glymur shape).
  - Cleaned up brace/space style in gcc-kuno.c to match peer clock
    drivers.
  - Reworked initial DTS: moved idle-states / domain-idle-states inside
    cpus{}, wrapped fixed clocks in a clocks{} container with peer node
    names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
    stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
    idiom; the YAML example uses a named placeholder), dropped the
    RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
    no corner votes / no pm_runtime, so the reference was inert), and
    added a bootloader hand-off comment on the memory node.
  - Collected Acked-by / Reviewed-by tags from v1.
- Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/
---
 arch/arm/boot/dts/qcom/Makefile          |   1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 444 +++++++++++++++++++++++++++++++
 3 files changed, 470 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 026d5b682b2b..7327a7b8180e 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
+	qcom-kuno-idp.dtb \
 	qcom-msm8226-microsoft-dempsey.dtb \
 	qcom-msm8226-microsoft-makepeace.dtb \
 	qcom-msm8226-microsoft-moneypenny.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
new file mode 100644
index 000000000000..c2f6650d3fe6
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "qcom-kuno.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kuno IDP";
+	compatible = "qcom,kuno-idp", "qcom,kuno";
+
+	aliases {
+		serial0 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
new file mode 100644
index 000000000000..82bb4c20dc34
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,kuno-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep_0>,
+					  <&little_cpu_sleep_1>;
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "standalone-pc";
+				entry-latency-us = <350>;
+				exit-latency-us = <450>;
+				min-residency-us = <1774>;
+				arm,psci-suspend-param = <0x40000003>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pc";
+				entry-latency-us = <550>;
+				exit-latency-us = <750>;
+				min-residency-us = <6700>;
+				arm,psci-suspend-param = <0x40000004>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			cluster_sleep_0: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cx-min";
+				entry-latency-us = <750>;
+				exit-latency-us = <2350>;
+				min-residency-us = <9144>;
+				arm,psci-suspend-param = <0x40000008>;
+			};
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-kuno", "qcom,scm";
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* Bootloader will fill base and size */
+		reg = <0x0 0x0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_0>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		quickboot@82100000 {
+			reg = <0x82100000 0x100000>;
+			no-map;
+		};
+
+		aop-image@82200000 {
+			reg = <0x82200000 0x20000>;
+			no-map;
+		};
+
+		aop-cmd-db@82220000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x82220000 0x20000>;
+			no-map;
+		};
+
+		aop-config@82240000 {
+			reg = <0x82240000 0x20000>;
+			no-map;
+		};
+
+		uefi-log@82260000 {
+			reg = <0x82260000 0x10000>;
+			no-map;
+		};
+
+		ipa-fw@82270000 {
+			reg = <0x82270000 0x10000>;
+			no-map;
+		};
+
+		smem@82280000 {
+			compatible = "qcom,smem";
+			reg = <0x82280000 0xc0000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		tme-crashdump@82340000 {
+			reg = <0x82340000 0x40000>;
+			no-map;
+		};
+
+		tme-log@82380000 {
+			reg = <0x82380000 0x4000>;
+			no-map;
+		};
+
+		access-control-db@82384000 {
+			reg = <0x82384000 0x40000>;
+			no-map;
+		};
+
+		secdata@823c4000 {
+			reg = <0x823c4000 0x1000>;
+			no-map;
+		};
+
+		modem-efs@823c5000 {
+			reg = <0x823c5000 0x10000>;
+			no-map;
+		};
+
+		cpucp-fw@82400000 {
+			reg = <0x82400000 0x80000>;
+			no-map;
+		};
+
+		xbl-dt-log@824c0000 {
+			reg = <0x824c0000 0x20000>;
+			no-map;
+		};
+
+		qtee@82500000 {
+			reg = <0x82500000 0x180000>;
+			no-map;
+		};
+
+		trusted-apps@82680000 {
+			reg = <0x82680000 0x600000>;
+			no-map;
+		};
+
+		mpss-audio@82e00000 {
+			reg = <0x82e00000 0x5a00000>;
+			no-map;
+		};
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gcc: clock-controller@80000 {
+			compatible = "qcom,kuno-gcc";
+			reg = <0x00080000 0x1f4200>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qup0: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x009c0000 0x2000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0x1 0x0>;
+
+			uart3: serial@98c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x0098c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&uart_console_active>;
+				pinctrl-1 = <&uart_console_sleep>;
+				pinctrl-names = "default", "sleep";
+
+				status = "disabled";
+			};
+		};
+
+		cnoc_main: interconnect@1580000 {
+			compatible = "qcom,kuno-cnoc-main";
+			reg = <0x01580000 0x19200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre_noc: interconnect@1640000 {
+			compatible = "qcom,kuno-aggre-noc";
+			reg = <0x01640000 0x33400>;
+			clocks = <&gcc GCC_SYS_NOC_USB_SF_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x01f40000 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,kuno-pdc", "qcom,pdc";
+			reg = <0x0b220000 0x10000>;
+			qcom,pdc-ranges = <1 148 6>,
+					  <9 156 2>,
+					  <17 164 7>,
+					  <26 173 1>,
+					  <29 176 1>,
+					  <40 187 1>,
+					  <46 193 6>,
+					  <52 266 32>,
+					  <84 249 1>,
+					  <85 256 1>,
+					  <86 315 4>,
+					  <90 43 1>,
+					  <91 45 1>,
+					  <92 154 2>,
+					  <94 158 6>,
+					  <100 171 2>,
+					  <102 174 1>,
+					  <103 23 7>,
+					  <110 147 1>,
+					  <111 31 4>,
+					  <115 175 1>,
+					  <116 177 10>,
+					  <126 188 5>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		restart@c264000 {
+			compatible = "qcom,pshold";
+			reg = <0x0c264000 0x1000>;
+		};
+
+		tlmm: pinctrl@f000000 {
+			compatible = "qcom,kuno-tlmm";
+			reg = <0x0f000000 0x400000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 110>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			wakeup-parent = <&pdc>;
+
+			uart_console_active: uart-console-active-state {
+				pins = "gpio8", "gpio9";
+				function = "qup0_se3_mira";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			uart_console_sleep: uart-console-sleep-state {
+				pins = "gpio8", "gpio9";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+
+		intc: interrupt-controller@17000000 {
+			compatible = "qcom,msm-qgic2";
+			reg = <0x17000000 0x1000>,
+			      <0x17002000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		timer@17020000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x17020000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			frame@17021000 {
+				reg = <0x17021000 0x1000>,
+				      <0x17022000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		apps_rsc: rsc@17040000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x17040000 0x10000>,
+			      <0x17050000 0x10000>,
+			      <0x17060000 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     /* drv-1: placeholder (unused) */
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS 2>,
+					  <SLEEP_TCS 3>,
+					  <WAKE_TCS 3>,
+					  <CONTROL_TCS 1>;
+			power-domains = <&cluster_pd>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,kuno-rpmh-clk";
+				clocks = <&xo_board>;
+				clock-names = "xo";
+				#clock-cells = <1>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,kuno-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};

---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

