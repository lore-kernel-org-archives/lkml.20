Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CDF4E3EDB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449920; cv=none; b=j6MlDXkYx7GYlGL9K+pRpUJBfMDyzki6VdZEh91R4lBH7RfZQw8ObkaT9UPEr31y9yVV8dmchi8vgtAp4DicgZObO8z7nUEbbq7bhhpnTWmTXFALETN4lkbwb4gPjepoXOPhPHdxlSiTukMcJXY/gqQ3CJpa+bPyRHT4/1yCCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449920; c=relaxed/simple;
	bh=s4sZw4AHdxTu0WFp+T0OQ8nNXCDEionbV0oSkr7PvTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OXzxVRp5ug2XanllEynj4UXoKYSlSzNMQrF08KhshhKHZruTvvbXU2WRK/i2eSgJFIQYVa7AvsaUHtQhZAS2rFRB9BTFqEahZPYz7WtKTBza8SIAcXWkCCbgNVbiEm5a9qXC9qpTDGMfRu2FiBzsQ3IUUgyxhsqDMSX3SynJ3PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zrvx9TEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P22DBBCb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zrvx9TEy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P22DBBCb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DARbF035598
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m30idRlVPFcMlql3AAMqkjC5QOi5g2e+ZXk
	dSo4fIA4=; b=Zrvx9TEyvFeZFHV8U3JV7Ic9uyrSrb1N4uDY8vMUq06N8eXFxfM
	HTXDcwHu+1ObTQyUWHIckJUxOozlk/0kvDL0riso9ohk2BOFdrgXVLISo4s3QXan
	KKxj1cq5+h2f8xRM10iSsrqOvAE4EOtU8OcpAvMfUBxFtepgjz2lnqPplvl2f+bW
	jCd3/C/BKeGDfDoISneffszNv20PHj9SOIGH28lU3FXfMfTeTvfmHdjXrDKId6nf
	AvI7EEgUv8zVntrLsChH84HC9yybNUN50k79BfOAgznLG1F6rKDlPxwt5u38If/1
	PrfYCiKBsybVbnMCuXcOP0JzsluOqds4pJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m1vmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:38:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-85722fc5a21so3632507b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449916; x=1789054716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m30idRlVPFcMlql3AAMqkjC5QOi5g2e+ZXkdSo4fIA4=;
        b=P22DBBCb2vVPbhYXKSBQVrYbxBYoKOmgYm4Qc0eS8+szUoeW3KWZG1V0ZiiA6Vef72
         WpHynuCoNkEdooO52YwqZHm8AY14kX9zJPe7ldaBkC7nPc046UmKqeLQf7UNSYNdMO7A
         c2wrb0SBHmAX3WQcbRrN6EjF9RsgF6B2KA5toMSWjsBJ1DajquqGiX/+zR0shFfBvcdT
         qQ6WwCW8Mc0/wamVy5c+WH3MYVoz+TL6SrIfqQNxM++HrAvPYw3EWPNnt4eU5hCxmSBN
         tsCTZFf1JV/JUeUj4+xYcaC5faYPhzmW+EWPOmaRPXcpfDZtvIoHjPyXmDNrTVUx71QA
         Glrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449916; x=1789054716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m30idRlVPFcMlql3AAMqkjC5QOi5g2e+ZXkdSo4fIA4=;
        b=Gu36X8kvblcieCu6JfBI4fZRg/Yp8oit8SVh8TsbAkFQT04imtzs3Uc8nyhLwRUWKA
         rAX8KL2XqsiQLLjbnrEC0UUc4uMcy1klkr/LlJGdk+UUG6Kz89Gn7rS7GygY5XmH/DI8
         xBNmDAIJ7cfhgVsfBC8wrXYcHNmq51uFD46teMlrcAS832n4WtCKWGSAw4M8KrXmmzAn
         ICNrHXc4ZOpuNu3czhtM0wzwQKDBJqPUScRD4kzz0iis2dNvAAWRK9kPkaYXIN2hY3yZ
         twwI7J1Wov38NJP70ORwXbeMxLFgrpKtz9XCtkd+oqA5xJbFsqmTeCkvgg2akpJK+Xlf
         3JAg==
X-Forwarded-Encrypted: i=1; AKwUvBwnMlUohZxc01G+hS+154f/4/ysphBswx8wqy/97sITmRsro/dISVT/69I37FzynrsUg/dEcCv4SGXoUaU=@vger.kernel.org
X-Gm-Message-State: AFuF++ktnubdK3GxledyNdO2RhelU5jrnI7/Wwp72glW+vECTDtAxNnA
	MsJGWg8F8ZXlfvHjrcwcIv7VfxgNvSBK7kNUNwvlzjKx9SS40FCSVfGCtHbjIuDcZHDKTIocrWf
	cpgpmuWVIwTYva5n21TeQqSJxtNOqjHv40RkalfvblBIon3bHCG74cNF7caludq2H/Eo=
X-Gm-Gg: AYBFou2V6xcJ5ndfNOfzqvZDZIbDkmoOUUsvody4NIJSR9Ah8rbkcv80QcSl9Gg4Uy6
	Y+axZWcw4mYDzm7R3vAMg3727UfRe1Z9FwFYbD8IZmCZHAR4WLl7BdLNuesb7B08VUemiCH7tYA
	G78cIfzMwqYMv69ETScm3Ks6K1JonuAPcX/9WpXQdGVNA8T1a/Cgb5AAvdmCvOUQyLCq5SHZaTe
	4vclOCTeoSHJSZdEnMNjLjOjsZW/ZpR+9WWutpjuSdM5Ax8NkAFzWxRn80DHJUBwbZU4MuBLQSD
	74F8XxR3Nzc2f9tN3asOWFMfQtqjq5ZQwGYgdr0YrEqCBMYprdVc0Fi8fNtfK1N02HxlJu41q/S
	a1lV82i1JnpHCEdZq/isEyEDCf6NSHufJ
X-Received: by 2002:a05:6a00:4b0f:b0:857:72f8:dc97 with SMTP id d2e1a72fcca58-85ed8bea229mr16729828b3a.24.1788449915600;
        Thu, 03 Sep 2026 08:38:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0f:b0:857:72f8:dc97 with SMTP id d2e1a72fcca58-85ed8bea229mr16729707b3a.24.1788449914798;
        Thu, 03 Sep 2026 08:38:34 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:34 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] usb: dwc3: qcom: Add firmware-managed resource support for SA8255P
Date: Thu,  3 Sep 2026 21:08:20 +0530
Message-Id: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9suPRR9ip-722Xj09MymuTgvXc-sRo0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX8mIQlxS0bxH8
 Rilha2Zzgb6mEcA4uvZikpR47/GPMUNytA+Jcgqg0SpZKgRfM9MXpUUaA9GNxOUXYIqlICsGwmq
 OYPH9A+ovaBX6TQiXgTa+zvvKO+Yl66Dk1NWYlGB91KR+eMM9KcOXKJCmmV88hq7jbhr3mEiPMV
 ucA5E5aPGg+EinqvGDRr5SYaIs/fWhd5wS42pH1kjkR9f15fCufZQ/+REyPJBW0zgfADvrGWQii
 JbvgHWWDLA//erhYh/eXk/+XdnNsW/T6DmQbgUxFK2hq2f0d56cT3sC+73nx2GtbJRgn7TaxPCJ
 oXp5Y7qcs5YPdOuUFUE21t6v3zXY8PgYl1VOcDf9Z9l1m3UwTHcu9KDtgac3z/5jfFGn52pnCGJ
 E293TWEmKn9w//Xkkh5EvLFUv8LQ0Ex71qhk6VoQEV72pamTisWLxWG6lQhkG/ezAOCE4jJfNHY
 /B2TbQVxr2pbosv/YyQ==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99947c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CN6SBz-TmP7jqxkG2eoA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX4TsB0JIt5mh0
 B249Shj4rbTNAk8pezF4tfJWofyTxpA3w/Pb9TyWvL+7Pts4NfX0KvEbu2ZYXB+hqlkGeQ5fARa
 kPi1MiOe73ePi5mRZoArAPr13+vodFc=
X-Proofpoint-ORIG-GUID: 9suPRR9ip-722Xj09MymuTgvXc-sRo0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

On Qualcomm automotive SoCs such as SA8255P, the USB controller runs in
a Linux VM while the platform resources that the controller depends on
(clocks, interconnects, resets, regulators and the GDSC) are owned and
sequenced by firmware running in a separate VM:

    +----------------+          SCMI          +------------------+
    |    Linux VM    |  <------------------>  |    Firmware VM   |
    |                |                        |                  |
    | dwc3-qcom.c    |                        | clocks           |
    |  "power" PD    |----------------------->| interconnects    |
    |  "bus"   PD    |----------------------->| resets           |
    |                |                        | regulators/GDSC  |
    +----------------+                        +------------------+

Linux has no direct access to these resources; it can only vote for
two abstracted power domains exposed over the SCMI power-domain
protocol:

  - "power": gates the power supply (GDSC) to the USB controller
  - "bus":   gates the clocks and interconnects used for data transfer

Register accesses through the controller require "power" to be voted
on; "bus" additionally requires "power". The vote policy implemented
in this series is:

  - Enable order: power, then bus
  - Disable order: bus, then power
  - Runtime suspend/resume vote only "bus" -- "power" stays on so that
    accesses that can legitimately happen while runtime suspended
    keep working.
  - System suspend/resume vote both domains.

The two domains are attached with PD_FLAG_NO_DEV_LINK because runtime
suspend and system suspend require different supplier states for the
same consumer, which a plain device-link cannot express; the driver
manages the runtime PM references for each attached domain explicitly
instead.

SA8255P also requires a few platform-specific fixups on top of this,
handled by this series:

  - "Broken suspend": APPS/system suspend causes the clock controller
    to cut all clocks to the controller, putting it into a Power-On
    Reset state and losing Qscratch programming. Resume must reset the
    controller, reselect the UTMI clock as the PIPE clock when no SS
    PHY is present, and reassert VBUS_VALID so the PHYs don't fall
    back into suspend.
  - The loss of power across system suspend also leaves the xHC in an
    error state on resume, which the existing XHCI_RESET_ON_RESUME
    quirk handles once dwc3 is taught to request it via a device
    property.

Patch overview:

  Patch 1: Re-enable wakeup interrupts if dwc3_qcom_resume() fails
           partway through, fixing a pre-existing leak on the error
           path this series' resume changes build on top of.
  Patch 2: Refactor dwc3_qcom_suspend()/dwc3_qcom_resume() to take a
           pm_message_t instead of a bool, so the runtime-PM vs
           system-PM path can be told apart with PMSG_IS_AUTO(), which
           later patches rely on.
  Patch 3: New devicetree binding, qcom,sa8255p-dwc3.yaml, requiring
           "power"/"bus" power-domains and excluding clocks/
           interconnects for firmware-managed platforms.
  Patch 4: Teach xhci-plat to set XHCI_RESET_ON_RESUME from a device
           property.
  Patch 5: Teach dwc3 core to forward an "xhci-reset-on-resume" device
           property through to the xhci-plat software node.
  Patch 6: SA8255P broken-suspend handling (reset + PIPE_UTMI_CLK_SEL +
           VBUS_VALID fixups on resume, xhci-reset-on-resume enabled
           via software node).
  Patch 7: Firmware-managed "power"/"bus" domain voting for SA8255P,
           wired into probe/remove/suspend/resume, plus hardening of
           dwc3_qcom_remove() and the probe error-unwind path shared by
           all qcom,snps-dwc3 platforms.

Testing:

  Tested on SA8255P:
  - Driver probe, unbind and rebind
  - Runtime suspend and resume
  - System suspend and resume
  - Host mode enumeration across system suspend/resume

Changes in v2:
  - Reworked the resource model from OPP-based performance-state
    voting to plain power-domain ON/OFF voting via "power" and "bus"
    domains, addressing Bjorn's objection that OPP levels conflate
    performance-state selection with power-state signaling. [Bjorn]
  - Documented the PD_FLAG_NO_DEV_LINK rationale (asymmetric runtime
    suspend vs system suspend supplier state) in patch 7.
  - Validate the number of attached domains against what was
    requested instead of assuming attach always returns exactly two.
  - Fixed an unwind bug where a "bus" domain enable failure during
    probe would return without dropping the "power" domain vote.
  - Added the new qcom,sa8255p-dwc3.yaml binding (patch 3).
  - Terminated the broken-suspend software node's property array and
    fixed a bug where the software-property walk in dwc3 core did not
    continue past the first match.
  - Fixed dwc3_qcom_resume()'s broken-suspend reset to only fire on
    system resume, not runtime resume, since runtime suspend now
    deliberately keeps "power" voted on and the controller state that
    reset was meant to recover was never lost on that path.
  - Link to v1: https://lore.kernel.org/r/20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com

Faisal Hassan (7):
  usb: dwc3: qcom: re-enable wakeup interrupts on failed resume
  usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
  dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
  usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
  usb: dwc3: add xhci-reset-on-resume property for power-loss resume
  usb: dwc3: qcom: Support broken suspend for SA8255P
  usb: dwc3: qcom: Support firmware-managed resource states for power
    management

 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 123 +++++
 drivers/usb/dwc3/core.c                       |   4 +
 drivers/usb/dwc3/core.h                       |   5 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 473 +++++++++++++++---
 drivers/usb/dwc3/host.c                       |   5 +-
 drivers/usb/host/xhci-plat.c                  |   3 +
 6 files changed, 552 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

--
2.34.1

