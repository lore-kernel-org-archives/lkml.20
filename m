Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C233030F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126979; cv=none; b=TmV037raHUKfjsZ8evW7yGQmLznVCE280w82jfW0Wz+EqeoTNzIIRjMtnzSPnYtprTgyUcco1kMCKCTyApHdRGPuPiRSXCzoQaZRl/kwG7hkRCWjFUr8Gpqc65Lc8ZTE8V72j32pEyjVn6RrGaTuj2RNUrJhLqYIut4e0SPbGC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126979; c=relaxed/simple;
	bh=b41LH8Q0VHNe5ISSpa+XKfmUTqDo5w1NWBuvgDd/VYg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rxm29aEMKt/0VTBSZI7G/Rq068LftlDkYqlcTJnQmLqgKU53/RVMjDdeBu0zUgHGGbq4JS964AKG/G2rhbhMDBp9CPdSZGYqHSFTa4EIr7aNdnlvWOrKOdk3rPn3MGLOEPAEhEGrR49tbSFHYJa87KpZrAshCDWmcKq8I0uB/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGsZffOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6ycWPLU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGsZffOZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6ycWPLU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJTZt1816190
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O0kI653kiujwIVcF6i1VLr
	NjAMxjwlxoU4ZcOafJB5w=; b=WGsZffOZMkOX48SAp9hCv1QjpI8lRpFgNHKTcr
	fZsIODpUPpEf8VNC1SHV4NZItRjtjzFq9S97K+NrnB8IPWbATapVX1xKZjFi2zDi
	fOHEcladz7BoG4nRubErqYTQcv6Sj1KztD7kZDRxLAElcWCs0Dt4ovUeBbqlNUMG
	6IsB5eDdeXe3/zVmr0dFX34IFKQE1W8H6Dekjnn6Lz0lLsVj9DVh43fM0Oxc/FwF
	S/xDaFjvzQm5guZrJ270+CaPSuZckJjpyAh/sGPbxPG38uV3D/CaTFPBLCDi6ITp
	GqzKivCk2pEn346bwOiz03EyY7AckQBiHUWs1kpDCXiQlmvw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvkre1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-845f687dfa2so59137467b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788126976; x=1788731776; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O0kI653kiujwIVcF6i1VLrNjAMxjwlxoU4ZcOafJB5w=;
        b=E6ycWPLUg1ldokkXaB+esT/4oVMf3jWleXj2Ugq2yLhkkbn5o8ZHr6BfWeSeR+Cucb
         3vqfRW5gNNzQ0p+SyNUvznWgz5ACeZEvHDGnnLSh2QQDoQ/d19H1OT2qlp7LN3CuX53J
         XnzS53dDb8RmwYMGYmaYEV1Cu1YXLGUPhrgcOEPUJnZwm1rdDXqSoA3qaogRDJFlyDZM
         hlPjyYyoF0lsaHVZRIk3lj6xYC8/91Ce4OooNhhGcVzGOch54VAHjzJsDjJSVWSuLuzv
         nc0PZV8+MF3/WAo3Zn2LIA8+w12m0xWZhtdLrckKkj/TYWWxucRQqHDI5u+9Fc+L3sXc
         8ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788126976; x=1788731776;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O0kI653kiujwIVcF6i1VLrNjAMxjwlxoU4ZcOafJB5w=;
        b=fW+9kmdf90eaDiIwlh/dhaeugS/XDYhBq5MvqIrKRpHCOFM7g71sZt6wfqhLh/ld8Q
         s+ifsdCRrwE0QafN4cwPvDf9S1YvibghpsdTsSGMjY91eib1788V+AQ+7iNefAp7z6Qn
         tS2PTvfw7WhNb90yOb4QhsNFsSW3DGS2/Z1yKMvMcmv53YN2TLx0CBnNSGxDSKagllSA
         dUGXSexfoR06si3uKQpWmvX7uMjh/PlvAg7ByuttEgiISlz6CukhLkM36v2dbZ7arNC3
         uecBvyW6IHSosG4o1oYjYpnVjUBoVtKajPti6uCMCRfeQ0DwV9NV1x5Otw7ZkxF/Y/QP
         NZ1A==
X-Forwarded-Encrypted: i=1; AKwUvBzyorA0hmzl0QQU6sbBqE9N8HMg1akk4Y9j+2O6M+HucPBxMQ1OKd8OJaqW1V3Z08I79x7DWmY2uxNaF6I=@vger.kernel.org
X-Gm-Message-State: AFuF++lVHxQkZkTqZr6ENCNlqo1qQFGB6KEWHULS4/DSdRKwbkP2oei7
	12lDpwXT5pvZwY5PEXc4oVQzhh/7R2CkcGIZuxb6EiOaFO+7TQyNhrrTiPETbQ/vEVg6+ii6NaR
	642TgHwW5/1GOQAWYyszmLxsgjM9dtpaxuUUWNwERzBR1sDTI0UTkxxhMBJu7WM/aMdE=
X-Gm-Gg: AYBFou1aaZ3afoE9TxruN95c8tqbwGsDNDf7kzovG9nSyMy03P+kywrzdJqUEoyunIX
	yKdsCoaEo+2SR8E9x9yBnr/dh3cYiMSrxz3IvVzOfloKENrJvUZz6PgSMoOlmjY9PKQeFvb9P68
	78wwc+lwvgujr/ILr1DO+GK6D6LtksGLP4Ujt0tdKahYfxP4puDSOfZZPRs/sDAhPS2yKGFiMtf
	z4C8pw0Yu9ZKQ1P2xrHsLJgqS6S3T4iNhyf9ILCLhOHTVrDmKihvMfpyFhrDpg4I28cNjkooyoc
	ajEqOiBI2uq7gyYNMG8Y5ntLUjRKWvv0LjpcAIHbCoLlSJb47MgDFwmlvTxCaRpyPoWaptlGD9I
	0tRY9M3liloJaQJCilw==
X-Received: by 2002:a05:690c:9e:b0:841:8f97:e898 with SMTP id 00721157ae682-85d6da7afd7mr78230957b3.32.1788126976049;
        Sun, 30 Aug 2026 14:56:16 -0700 (PDT)
X-Received: by 2002:a05:690c:9e:b0:841:8f97:e898 with SMTP id 00721157ae682-85d6da7afd7mr78230867b3.32.1788126975656;
        Sun, 30 Aug 2026 14:56:15 -0700 (PDT)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1dc88sm38268857b3.19.2026.08.30.14.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:56:15 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add HP OmniBook Ultra 14-kg0xxx
Date: Sun, 30 Aug 2026 14:56:13 -0700
Message-Id: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2mlGoC/12OS27DMAxEr2JoHQEyZf18lSILiqJjJbDlWk4RI
 MjdqzZddTV4wPBxnqLynrmKsXuKnb9yzWVt0J86QTOuF5Y5NRagwCqvlXyAnDdZljXHUm6yznm
 T2iACGRU0TqJdbjtP+fFr/Ti/ud7jlen4Uf01dv68t3fHuyYiVpZUliUfY8daWbAeNA7KOjDEE
 CI5Q9EzDdYlzT1rsP9VcsOD5jZ57Dw7Cr0K4E2CSJimlkP0k1GDgZCSIXDYK3F+vb4Bgqn3UgY
 BAAA=
X-Change-ID: 20260830-x2-hp-omnibook-ship-35aa2c5093af
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: myQvppzixdldqMD27OpdnEfvE16zqGfH
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a94a700 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qAnisubTZjjuGKT3hPQA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX0OBFo0qzkrP6
 srgMYxPU7jkC8o4/Ojx+NdrQhlRwlXdHJPF3LEt6msbFWQfUdDfXBDBeDnmyvmRRoAtd9Q+Bfjt
 CJSqipAgEsYPfytijwPXgIHa+d39doga3MY1D6rJvFX69gh7CYskq9zKbkhJQ7cHw0ZZU9K4OuR
 Zanb3mX0sLGnX8q9Jy/9j7Xzn5lubNndHDX8k3hGdCS9cyYQC2tZpQZqx/ZUoBN5BCpN0GqtU+q
 es/0RK4fp37jxNxlLPdmYE8MiU9zXB2OE/N0aja0XJJlBpf/VqQrTfOiiUVg4VZRbnU1FbRRgtY
 HOserwy1WPlOtw109wbsEW/Zi1Qfcim6fcLsrqH/wbtZnVeSMuA97jArPqvexZ1vK9Yoo7Sv5zf
 YB0sKSICQXRyYpyxKpJn4yIZG81RaVa0aRJpe6YDUhC4kz54iXx/S10t68RCFoIJY5NZKTi0ZIT
 WyvZNaURcAe/TvGrnLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX6H/dWvThmOr9
 CFCZbDswe0jp3cTelveCvD+Mdnpx8eDn3PMF3R118s7MKfE/JNy+W4hbO5Bv8G7qXhPpWeeAqud
 WuIJJDL14AQ35X+6IQ0tG4vK7Bmbt2E=
X-Proofpoint-ORIG-GUID: myQvppzixdldqMD27OpdnEfvE16zqGfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300191

This series adds initial device tree support for the HP OmniBook Ultra 14"
Next Gen AI PC (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite
(Glymur) laptop.

With this series and the Glymur DP PHY series applied, the following work on this laptop:
  - Internal eDP panel (2880 x 1800)
  - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
  - NVMe SSD on PCIe (pcie3b)
  - Wi-Fi and Bluetooth
  - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - ADSP and CDSP
  - 5MP USB RGB Camera + IR Camera

Dependencies (not part of this series):

  * PCIe3 PHY and PCIe3a controller nodes for glymur (Qiang Yu).
    This series' device tree references &pcie3_phy (the NVMe root disk
    hangs off pcie3b, which needs that PHY); without it the DTB does not
    even compile.  Required to build.
      https://lore.kernel.org/all/20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com/

  * qmp-combo DisplayPort PHY table updates for glymur (Nabige Aala et al.).
    Needed at runtime for USB-C DisplayPort output; this device tree
    builds and boots without it.
      https://lore.kernel.org/all/20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com/

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Jason Pettit (3):
      dt-bindings: arm: qcom: add HP OmniBook Ultra 14-kg0xxx
      arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
      firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx to QSEECOM allowlist

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 1012 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1015 insertions(+)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260830-x2-hp-omnibook-ship-35aa2c5093af

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

