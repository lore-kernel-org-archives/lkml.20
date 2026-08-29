Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1933BBC5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030495; cv=none; b=dnX5dSwAct/Lwo3aV7EXWy29paqXUQiOsfXqy/eTLI3nM+CWONj1QRkOUgncmXAijk4zDZ1N42neJGxy9OtCRO7N00dpfn3xnzM/UczXZHqTQbU8JEQ1PoW0osJbszp8vbMAgomHectuiJhSf8bJ92sUxxzQ0BfyDIqb9c87ulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030495; c=relaxed/simple;
	bh=SGfDjsecwR9u5vX8MdDxHG1TB82/XXTRCshHLZXATXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hwlHrY9YQJDFLWakjpqJ0nov/BHEowOZmeNGfpRjUWiPabhFS0SMqX9EOUrirqHWDxUntoFSEB1Tq+6t6bt0iFN75bQrKoCDyU0EpQnL50vzud5GBUodiP2+PsW3rDDETylhxMwCY9ADrKO1QWTOKrglHVGWNbTmZGOrO6kQcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlVyPv+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFAsbmk3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlVyPv+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFAsbmk3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxTLf2457166
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eou0ZmVNA4ERY2pys+B8C0
	iazu+Yp7hGkGpZoTcQFqU=; b=XlVyPv+RAxo41ZxLFLUKMUT+n7vQELcD9O02DA
	x3lror1ETJcls8lc88AhNZyQtofWf8TGTjidLwP2Q0opuvRcrXQDLTMLaBJHtx3j
	0oTWROFBGG48KThnmhtFfddT3kk2SzbXNwBNsD9l0QygYLiaYywt6vmvVaKivc3M
	LLH92Lgn22ru6+BxA4nQRbM6K5PRfPS77IrbkAC+SpKXCVQoBYTdOvyhD9Ord6qA
	wBHd7hrkUHFk8Wy9ajBzhI3joyCm0CLqtwq3hPjbi1evxlNydc4EeU1e+548MJNO
	u6sREIXTgWdj/+t++kgTAcQKSOVnQ7mRBGZI4URb/hZGXDCw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhw9mav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:12 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-857f88e7b3fso48243437b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788030492; x=1788635292; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eou0ZmVNA4ERY2pys+B8C0iazu+Yp7hGkGpZoTcQFqU=;
        b=iFAsbmk30OcXrXNAMmT1JzAZNMqqHXgw5WAeOMELbBhg6FmJpyTghZpVV+F4o7/XTo
         Pf3be0WjVAJMwAOw1+GCUAdH2pxOHy+9pBdMhMWjvsaw2AqJUATCz7J2IvFyemE+8QqW
         LVKO5/AJq00nnqIXH/+k+6sBwi0Cc6oqr7ghORGhOaNKdAquQs3zoeTZVrY/X4+LHszs
         vjLmWsCY/IOLB8M7j91je9o7zNdJ/NtLqjT3fMS5x5lNeohzOJJbJobGj3ALQhm4Hkfc
         CAWmdz8w/k/Ihokgwj2/DEsQR/fcMSwwSlYdEn19yrci7Sy7byVKEmVC2aFOyPlOZKoE
         Copw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030492; x=1788635292;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eou0ZmVNA4ERY2pys+B8C0iazu+Yp7hGkGpZoTcQFqU=;
        b=JFHcxufCk00MDm+mt1tId8s4YzQ5WJi9wqNC2vOgePjfCfSdeOi9Y0PmrWTvZzJIl6
         l+ty6E6WRjacaM/8wx1KZyv3hhOoMQNcWtRHKxjwssyJr+D08bId0hfXFkX1y+xc4SOs
         xBW1ON3iUeclQubwFTkYEyHQgLY+SG89Kc/xcf+6OW5MFwm9NkUoKZfD1I5xDbxCCb1q
         0R9SwDGIK3B3j9M933rT65oZNu+bQRlcE4P2yHcXZsSw9t6dpLBFvdgu16GFPtSxxNzb
         Pa9Nf/CZ9wh3m9QL5CTIZ3SWSClkkGd5urx/Pd+FM7S0J8qAPQY9lM/N7PebpNahkdzu
         xFfg==
X-Forwarded-Encrypted: i=1; AKwUvBxTCr3AQntDqhLk9W4LgEkRFIWO2zFhCgHBpktFKB2cHd5gKMCQVQGSAA2d3y7CxoY2mhoFf9c/FCkODzw=@vger.kernel.org
X-Gm-Message-State: AFuF++l2D3Zq3R8TUnQQrMxsWmfjU+kR8ZAqK4VgZZZU8nBHoSzHvvCD
	Kv1xvH5MmNaR2qwf8iqW8Qc2Bwp05i6e2I/G8LiCfKTKELgsH4jgDPokjRryIEXzWFmHjrvaTsk
	npUbNTS8Eb0LnsirRymeDk6WrZx/ALuheDuY5fISmEtgGgz4IWuyaTRCF7iL3He7orDA=
X-Gm-Gg: AYBFou3SB2IKB/QqtYOlzlwyt+bMStJLu+xDJM7dmwda8QYWzwb/AG4fqTsgXVvWd2Q
	ccho4sXXmBv6XsOEDLWZTDGL0AxmwLnQQJBcZmQY9qj5HTDXajcTpHwsG6voBM2pwgQ+n6UdPQk
	Q+fvslCEGZ3lA2YisDgXKH84ed+CRYm097JrvNRHmMnlbuHjyvCX1e0e2KT6Tyc9XJJCAszsgJ5
	FvTarbfZJ5HW4yArOD+dZoG3IrsA/FWb9x9PUnMQzU9nld2OEPnIvEMQpKbpODxtrM8DW/cUFdF
	aLeo3kobMq6i3g20/uqHpNC1jt0MJWvVCwV4oZ7cXTsoxduYIism/oC5hYAEzIusPCHd+hAmFUX
	RAUKuqpxNBGLi0xpIm5nZSu0lfh9yr7lVF2maj3oaixrdLnPo
X-Received: by 2002:a05:690e:4891:20b0:66e:4df8:2d6f with SMTP id 956f58d0204a3-66e4df82dadmr3302736d50.22.1788030491774;
        Sat, 29 Aug 2026 12:08:11 -0700 (PDT)
X-Received: by 2002:a05:690e:4891:20b0:66e:4df8:2d6f with SMTP id 956f58d0204a3-66e4df82dadmr3302720d50.22.1788030491274;
        Sat, 29 Aug 2026 12:08:11 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:44f5:f599:5679:b5a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm3013945d50.13.2026.08.29.12.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:08:10 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v5 0/3] X2 Elite HP EliteBook X G2q support
Date: Sat, 29 Aug 2026 12:08:07 -0700
Message-Id: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABcuk2oC/3XQQW6DMBAF0Ksgr+toPDYGsuo9qi6MPU5cBUgwo
 EYRd6+BSg1Ss7H0pfGbr3mwSH2gyI7Zg/U0hRi6NoX8LWP2bNoT8eBSZgioQYuKny73Zux5pNZ
 xIaR2qKQRCCz9uPbkw/eqfXxuOY71F9lhIX4nerqNac2wjbHaROK2a5owHDOSoFGXKI0CXWBuC
 avaFrmtS7JKF06SIImaLfo5xKHr72v1SazY1hJh13ISHLi3yqD1TkBh37sYD7fRXJa1h/Ss3IT
 PRL4nMBEAFeQSlfe1f0HIP6KE/a0mmQh0glIFkqasXhDqiRDFnlCJkL4uK0u2AEn/EPM8/wD6u
 5r51AEAAA==
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: ucv6d6orLdH4nYzF_keG_9Kwjx6qlIIv
X-Proofpoint-ORIG-GUID: ucv6d6orLdH4nYzF_keG_9Kwjx6qlIIv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXz/LRvL++et0Z
 y+2Bn/ETXJGjOi43c/+4+45yBBFjVU1a7gTCQ/aVgtSQUpEMrCFiN4CDM07ySmCFX0ZEcEjAjcV
 QOKi/PCPJwAXcxLHYrBWkoX62UqA2Q0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXwF3djbyktXqK
 vpGwl8vOKxCYkybMMLSTlgzl4H6Q/bF/LF/uQPw+dwgWs7eobOSDfiOEvWN3XOvXr8vtzBxAxZK
 bwEe0eCfkTXGMZrmmeEBQMiBl/51jxa9vh/v3f811F0RfuiL6RrVlheJPhey8lMNSrspdcMr7zh
 UUbSySMcXeW9aPC2XdoWVTpbJQsEj6JBytZ+JYI1giA97ouAfSY2PN70vkFrEJyz1JWpLSlnZGm
 zq1GIcE41HijiLFjKBIqytJxJBRRrfaV2OU2I4+aCWM9+VH7dZWWCM53n52vh3za7TfcvFx+X9w
 zCGxStpjKQM2eFCn7Kih1wB5ovpi4GlQpE9PpI1k4SV6m3mQW0qs/FsoZWRzIAdIZeygMwtHMhi
 uN9wMyeL7KBXWCtv4Nwf8pmA+n957rhm7mK/NYuEV0oFA1ioOus3KZXd8SZNqCtWA1WvbyLY/Hc
 YZBObDQwS6PVM6yISkw==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a932e1c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8 a=N0R_qAP9jCjoCUmMprsA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290165

This series adds initial device-tree support for the HP EliteBook X G2q 14"
Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite
(Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies) was verified against the live unit
rather than copied from a Glymur CRD.

Working on this laptop with this series and the Glymur DP PHY series
applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - Compute DSP (cDSP)

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

The audio, GPU and SoCCP series this board previously depended on have
since merged. One runtime dependency remains, the Glymur DP PHY series:

  https://lore.kernel.org/all/20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com/

It is not needed to apply or build this series. With no PHY patches
applied, this series applies cleanly to the base commit below and
qcom/glymur-hp-elitebook-x-g2q.dtb builds without error. The dependency is
runtime only. Without it the DP PHY fails link training and the DisplayPort
outputs do not come up.

The chassis HDMI jack is removed in v5. It is driven from the usb_2 combo
PHY as a DisplayPort-only instance, and that path does not come up on
Glymur. The driver enables the USB half's com_aux clock even on a
DisplayPort-only instance, where nothing powers the block that clock lives
in, so it never ungates and DP init fails with -EBUSY.

This is not specific to this board. The same failure was reported against
the already-merged Asus Zenbook A16 (UX3607OA), which describes its usb_2
combo PHY the same way:

  https://lore.kernel.org/all/20260808164148.123057-1-jesse.casco@gmail.com/

A fix is in progress but not yet available.

arm64 defconfig builds the CPUCP mailbox as a module. SCMI needs it built
in (=y) on Glymur. As a module it loads too late, every SCMI transaction
times out, and cpufreq does not come up on any CPU.

The ADSP and cDSP auto-boot before the rootfs is mounted and do not retry,
so their firmware has to be reachable from the initramfs. With it only on
the rootfs both remoteprocs stay offline and audio does not come up.

The bindings patch 1/3 is independent and can be reviewed/applied on its
own.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v5:
- Rebased onto next-20260828.
- Correct the usb_0, usb_1 and usb_mp combo PHY supplies.
- Remove the HDMI path pending a combo PHY driver fix.
- Add the SoCCP firmware names. Drop the redundant status override on that
  node, which glymur.dtsi already leaves enabled.
- Link to v4: https://patch.msgid.link/20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com

Changes in v4:
- Rebased onto next-20260814. The Glymur combo-PHY configuration patch
  remains the one declared prerequisite.
- Fix the touchpad interrupt. TPAD_INT_N is GPIO 3, not GPIO 66.
- Describe only the microphones this board has. GPIO 200 and GPIO 201, the
  second DMIC clock/data pair, are not connected and are removed in v4.
- Addressed comments received on v3 as reflected in the next two items.
- Use the firmware names from the vendor package (qcadsp8480.mbn,
  adsp_dtbs.elf, qccdsp8480.mbn, cdsp_dtbs.elf)
- Drop the smb2370_l_e2 status override; SMB2370_2 is already disabled by
  "arm64: dts: qcom: smb2370: Disable SMB2370_2 by default".
- Link to v3: https://patch.msgid.link/20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com

Changes in v3:
- Rebased onto next-20260807; the audio, GPU and SoCCP prerequisites have
  merged, leaving only the combo-PHY configuration patch.
- Added the TCSR reference-generator supplies (vdda-qref*/vdda-refgen*) and
  the vreg_l1f_e1_0p88 LDO they reference.
- Set dr_mode = "host" on usb_hs; glymur.dtsi dropped it from that node.
- Reworded the usb_2 and smb2370_l override comments.
- Link to v2: https://patch.msgid.link/20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com

Changes in v2:
- Enable the PMIC RTC (qcom,no-alarm + qcom,uefi-rtc-info)
- Add the SMB2370 eUSB2 repeaters on usb_0/usb_1
- Enable the compute DSP (remoteproc_cdsp / fastrpc)
- Addressed comments from reviewers on v1
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com

---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 940 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 943 insertions(+)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260619-glymur-send-1136d243a120

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

