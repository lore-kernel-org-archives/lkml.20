Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284930C60F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224446; cv=none; b=gTe+bSApL8j0QrY2vzNK7sKsxmVwOfGzDo7mYBRJdWnWoG3NIOX8nDFNMFFxjCWVdPrN7zri3pmAziJ4sHtcNZKdUH659/DQwTh6hKce1KdpinJwC/ALzZXOF6R+ZLJFioe4CQAKPakKoax0aQ3oYejXhHwGc6dzMBLM4BoQhXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224446; c=relaxed/simple;
	bh=5krW5Et/tiAldox4dzmZqrKcvKwNsM04JjUZx4bH4vY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AXBKg2oplNr8Ohi5VVr44qm6Xg0kuYPvWGwxpSl9GVmCGtO5TcSRHtuLB7bNZm/jrtv564WF8HwjDyJabO++7F4kqQc+0BsDhwIM+UpUF+IYZL9UcLLv0myr9V0vD1dvaH3PdSyiadVoFV5p04C01q1Fv6HRiixCjD8FAAAhfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7N9S5gV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLIflH3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7N9S5gV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLIflH3E"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEduZU2607494
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2k6MkLzYKHJ5Uosmubx6+
	STv87/Tf/oU7QicZYandA=; b=f7N9S5gV+OXbdDYF+EdSiLEeHzJe3IOXX10GCi
	dakUBpRgu06D1/y+1LnvdDQdBu1IbvWhVn4tWZ91e/nJALHTGgQxDRohGJMLxhNr
	AazBJeuEmgW45TBPcQhXfIsUpyJfD+V44X2TzuQucMqvr9yfhHO43Q4qq1MQIhGm
	E5An25qHPuqwZuAlPGgvaI7pexzS7hZQCAuQeHMBeA20x13rvqN5CF+m0BKYFmYt
	QTUwT1CLccVA/AT58oG2W6LHeFRf++Dy22vYZcq7Tx7HdmBQn7+4VJIXS5FHG8PC
	cxNKS1D0UGCClPzO6nycYaD1dQhKzMH5oG/UNh7loctgfqxw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c9556-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso3400315a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789224442; x=1789829242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s2k6MkLzYKHJ5Uosmubx6+STv87/Tf/oU7QicZYandA=;
        b=SLIflH3E2E7zCdv+MJY1ACSqx6uMKuZlwPCZZjVXvXa6UeGFVhxys8W7HdBBxUhcEq
         5UFQIm4K+Zdj4auQX+EvUxBm1ANDBij1Cf9Nr8RtbzXSpk/i8qQ11hXcsT1Qh661pjZd
         0E7NruS/I1J16APbrsq1GpQhI+KGQYRrRQkL4GHDX1Gn8uyjyec0MkaCD3+CSciaW+vc
         p+RW4UsE3OmfT86aeDH4VjF3S1H2U7/YdBmtxGbUhWjpaKGuCeFoT3Y/Zb0S1KjKkFFy
         0kQQEUyImULJy5eap+3Vvcq9WJCM8b9nD774NuDup9GXNA1OLcQsB2OiaQwoQ2l/Z7Sa
         cZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224442; x=1789829242;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s2k6MkLzYKHJ5Uosmubx6+STv87/Tf/oU7QicZYandA=;
        b=cOdpBFdogcNUpLkJbC51I81CWOWWrxWuFP6JKKUuso9JFnhEeUQQpMOSzlZeIycsgv
         7lUu/vQA5YZRZpIDeIgyXRYgUisbXrf0SZvsKBe4ITnSZqtG0aicuUe8WGWlvbHcu3uv
         4BnFijR49Pz5K2nIrsmiRJciyRqDtybMPpLYbZWqJemLiZBa5p6OzEOFRTC2yuf4nOwB
         aD8RZ2Kd4pwoQlGVjtVm2+b61r/iNXUk2aQFzA9p3t81AHCXLTSG35R0iQmkY/EWEvEA
         bq2CUadkXC5Mo4noQzBRCe9WtJXnnrPMmXLp5OvF+wI3S0873lWomJhYjvLEpL5OIeFp
         jBlw==
X-Forwarded-Encrypted: i=1; AKwUvBwexkXVwpMJcrWrzs6ujKy97QKqy5JrALMQtzyDfBZTcy2JEmqHfxnuexQe31GqrT5nuz3cpIeLmYwNoNc=@vger.kernel.org
X-Gm-Message-State: AFuF++ka9TDTFy0vWYOPZxs3cIXcXPMhNtbU+Z4dWZ8k9QOhjbxv47GG
	jXfAuWCJwE3JDTF6bNzyLyW95j+hHkJHi+bDIdsmhAWQG/YH3AJmbuAqmUX+fIygK0kBLhYtWtt
	DdmSn3Vgs5a80YlkifOPnMWHQipag3I7lx9r+v/dwhjIZKTl2jJbhJrP2pQmQTXG2f+Y=
X-Gm-Gg: AYBFou3gk1nodllDEYin0sFiJ1ToSIOJgVkRNwRxHPAx9HkeSZTo01ZoNNXTOmTtY9/
	CltKwgBarMs1D9L7JSCNfN4yP6FSiON+di+Ixezgc3DsX+0GstnNz1q7vhnBTLnqREb/zhKPh85
	zHLL1yiBMBvvaFLZTj81X5ZauplVrBsbTAMAFqhxtwBBfZOa+lt/khek0ymIDps2biJ5mbcwaK7
	VPk6xKQPNpR9SUBcW64IGpJC5YusRlRARUaS2AjjCVCtVHPIB3aGbO/0VdoDuUsX9ZHjIfCo8Ta
	nkAEi6dffca0Z11Unj19dHqoLIo9EXc84UBcEeXrJ2dO+XPuRfZhp9YYpuU1rD1BOx9I3NXYuDO
	nCi464T3LnBdGJtQ=
X-Received: by 2002:a05:6a21:113:b0:3d2:2afa:d77 with SMTP id adf61e73a8af0-3daed68139fmr15874625637.14.1789224441845;
        Sat, 12 Sep 2026 07:47:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3d2:2afa:d77 with SMTP id adf61e73a8af0-3daed68139fmr15874559637.14.1789224441354;
        Sat, 12 Sep 2026 07:47:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm14344833eec.26.2026.09.12.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:47:20 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v9 0/3] Add DT Support for USB on Shikra
Date: Sat, 12 Sep 2026 20:17:00 +0530
Message-Id: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAORlpWoC/2WNzQ6CMBCEX8Xs2ZLyoxZPvofhULaLVIVqFxoN4
 d0tcPQyyZfMfDMBk7fEcN5N4ClYtq6PUO53gK3ubySsiQyZzI5SpakYuRbc2ofXIpxEZlCaXDe
 YmwLi5uWpsZ/Vd6025rG+Ew6LZGm0lgfnv+thUEtvc5d/7qCEFOqQEhU1SiK8OObkPeonuq5LY
 kA1z/MPuw/L1cMAAAA=
X-Change-ID: 20260811-usb-shikra-v7-2dc0d3afc3d4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789224435; l=3853;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5krW5Et/tiAldox4dzmZqrKcvKwNsM04JjUZx4bH4vY=;
 b=yoSPDV0Fo3WYuskJaGfqJcFQSziihrDj87XyMP2PY5EkbfKmEq5UEH2hNXowXyGYN+EuV5WeT
 Z7C3edCcKx6CnRMAiXmLDEpjKxIDPfQ9zPlM14FAJ49WSUhzLAN6mZQ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: TklhzSO81Go6nMCurCcxwoKVo9cpe2Kz
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa565fa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=t1oMc6EiptJ9flWhJMEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX1SLMcsWtlzT7
 loXsA14IjuqpCVhbmzRBmUdLAN2v42lLcHNK9yAXk4ufBLhlu90C58uhyqt/6FcDtJDIdKIaeR6
 Gl+0T3EWM0SUJZ8bFcMLb1gqbLviT4w=
X-Proofpoint-ORIG-GUID: TklhzSO81Go6nMCurCcxwoKVo9cpe2Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfXz04VnIwjAwpU
 9CmTK1o/XqDx9T0tjPczJskyPw9zctr0nWtKhTiulghPxzpz1zV+K502eaLZpCSpdaN4ZrEb/5W
 XU/s7ywN1dfQBXe00Bx1RkOZYESli7c45LBXlOwPNy+t7XBWHr8BuyUcQ9f3hWDaM9ovzFbg24r
 cPGTV5LipICRkMDjZsep05Ln4GG+HCypTExMpmNUnAUt8eqwlb0mZQ5Zi1qoIJ+g1VZSYzUXcyx
 3Lif2XSfA2jZ8RgfhsvtoL9SmUqRuH/Dsv1iZiiArZDGF2xNih/veBneL90LszVuo1TxqW55VqM
 MZYdXJhscQBAMO+ydK6Ps4vRUmD7E3NXNeG4lH1sntgR+LWyFYR1g8gtmfPdlV8LpJoLlsu7MVc
 amGtq7hgw1jwLpHxQQFpbBSEvXSSARb72R3VHLSCaXgP3liKjgzIQf1udIr4J0nrM2HHBXaY9cY
 ZeZk20m80nT5OCEWc2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120213

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series. Also squashing Type-C enablement on
CQS/CQM platforms [1] into base USB enablement changes on these
platforms [2] based on feedback to squash related subsystem changes.

While at it, also sorting subnodes under soc@0 for consistency.

[1]: https://lore.kernel.org/all/20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/

Changes in v9:
- Move usb_2_hsphy above usb_qmpphy to maintain alphabetical ordering

Link to v8:
https://lore.kernel.org/r/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com

Changes in v8:
 - Rebase on top of latest linux-next branch
 - Sort /soc@0 subnodes in ascending order of unit address 
 - Squashed with Type-C support change
 - Individual patches were previously reviewed by Abel, Dmitry, Konrad and
   Mani; however, those reviews do not apply to the squashed commit and
   are therefore being dropped

 Link to v7:
 https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/

Changes in v7:
- Rebased on top of latest for-next branch
- Added Mani's tag from cover letter to both the induvidual patches.

Link to v6:
https://lore.kernel.org/all/20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com/

Changes in v6:
- Moved dr_mode property to shikra-evk.dtsi
- Merged platform specific changes into one patch

Link to v5:
https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/

Changes in v5:
- Added interconnects and sorted nodes alphanumerically - Dmitry
- Updated commit text mentioning that device mode is being enabled
  since role switching changes are not yet present.

Link to v4:
https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (1):
      arm64: dts: qcom: shikra: sort /soc@0 nodes by unit address

Krishna Kurapati (2):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: shikra: Enable USB controllers and primary Type-C support

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  43 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  41 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  43 +++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     |  12 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |  23 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 515 +++++++++++++++++++--------
 6 files changed, 536 insertions(+), 141 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260811-usb-shikra-v7-2dc0d3afc3d4

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

