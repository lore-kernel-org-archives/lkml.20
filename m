Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9594825B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046953; cv=none; b=GezxlXHjA6ZQna0sFwn7/JTt0m1pjgUvt6hSISJGbDPm8BEGjiJm6lR6YOqXWZT2/r6EkPyHEzdGHuxqNIyDZFvMQ8mfWMZ9pKp8A/fjnP22NyaN8k4KMs+Oc/2mTFcED6egnx4uW4TKSSz8Id6mflds6CkNwdYpmu4X7PDmp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046953; c=relaxed/simple;
	bh=XOUIPQ26ojc/TFlH1T2oQfIVuOrooQJnVVOaB6jjc04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gpvJ9FKzOnbDwIHSJFXdppuinhexI4vZ2zMpNZgZyPDvgqssYRl1C4DmbdyWyNw6ZhPqOHh/7IolPPB6KtqgHSL+kjtnkAvijdjC2BNriEG6znD1kqgp6n9ZYaEBE8HlAbKzkW/S2phcgD6KgsqT2JEJIU7DLMKHU2wXdY337VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZSYgCAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXkVLycR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZSYgCAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXkVLycR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7kY4918799
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gsUFBJEn31eWUk6ArRqWY7
	vathBEX8AHIZdCCyYK9Zk=; b=GZSYgCAoKbYNtvz4ngSB1WlAMtcHnFdfBqH0Fk
	dcOCMbMpjIeq2KefaMBjA4SFC6XDQ9hbBHe7PaMDZWp5SA52nFbHJIM81M6w1hF/
	HAPGvxG+nE1eRb08NFjxNyN2dTqkDcYLpisBuLicLavsbxZPRtXPSDld30Cs0GN8
	uefaFK8DKoGfQWAeDLSHFey8NxFJohKvLQKW2THCPLK6rMHT2B44OtPLFWxJGjlj
	Nkpg7toR9xaTCH8KJXYvs671AZifAQIRv56BiQ1eb2Z7AceGafj1GaBwZA18tYVS
	enlBHMdkfGdZEP5UI/6NkZ3hnqsDKa1/e2ROE7w7VUFmOrqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so3014292a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046950; x=1789651750; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gsUFBJEn31eWUk6ArRqWY7vathBEX8AHIZdCCyYK9Zk=;
        b=eXkVLycRf0JONKmtWii5zxsJovXpzemQL1YwJNVZviTj//H29XSb6BhQ6xAhGUSMSf
         D/N/LUseG0wB2XAAGdUV4NrAl0LQ7oNQ9Xa4+/qksX0HR0Cta9bJgGnI2w8+SroN8flV
         wPar1pIVADGVSxxIp5QBpLHPq8f1AyrQYWttpzaE4TEfzUmPVHmHsx/50DVKBvh7Zubh
         gYy7pwtHgAs66oFoitg5ou2y+Uz5S4HZG0M7PxlhI3KcAKIsgUbZ1XKAQmpxjoj2XN2w
         D0W8rArBR3mND0S0fhkgD48/STj1MakSb4VmVUV5y8sNOLEp0+AitZrv026k1C8r5Il1
         YNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046950; x=1789651750;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gsUFBJEn31eWUk6ArRqWY7vathBEX8AHIZdCCyYK9Zk=;
        b=lm/5hchVzQYR2g4s5ska+trxQ76wS07v2TplbrSsMd02uDh+TIRL4XZZq7ZiZqSAEu
         JIgtZZE48LXt2dS0FBxLXXJhhqSUdtc0kA3umxy8TO7QNSQgIfsUNcoxgTiUq4+Bv3oc
         WKTBs8zhgF6q4voLLKAVBiUEG+CP0LaarLje+owhf6EYSeUyXPQtKreiKQJlmDYVSswn
         QqCMpU5wWS61YEtIOmkwaZmi/mAKJTWEsqbuKQpoez1wzc71/aznJ2GxQLfyVYd854dj
         B5pIdEvOLD4bhMQ6twsbsuM9Z/tIMh80LM4x23MPsTOmeSAqAYQT0mfBaIgxNydP7OGE
         t3ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAytmSdXQxxLIEpJXydMBF7mi5cVbzwaaL7p08sbzmUttmjJpkSw2JHhHT6oQLcNIXyKji+xX81x+eRrU=@vger.kernel.org
X-Gm-Message-State: AFuF++ngC5FFaVUutlgzQoi1iGgqeryy/Xx9hFHxjXTdQTrmp3wGlusT
	lIr4w0proIti5qEGikGwINMq7IfgVXuikkDzLTOT2rCVQcAcrRigtwKPGWBp3YLcoWvciF1vsR2
	o0lWs9BpwisOTlVsQyiCJCvfKZsQbOOdewyGFOq8HpdzVDmPNFK6oQ4A8A/OY6+dbKLA=
X-Gm-Gg: AYBFou11IZ6fgCj1cWxaYolTXqQ83y1HqW9j48FBbihQQ15msHvx2xavyjnN0AJ+/XH
	TtXWq3y3U+gq2Fo8wKykv3CEmOgZafacZnxezASsxwNxtBn/tm01Z/dqGtil5wSR3+sutdWE/RI
	fu8nRxwIbk55jDtYHBVhejaCnSMy304QSXltbWi801A1ucGVr+ewZQwrnInfiuCu/fvPs8nPcZG
	XikbaeQHJMmRyisZ4HyLK4INnFY0fOInWDksD5EWG6+S1g56DXPyjYXQFgJgNXC01PtuKRE4icy
	ywUFu/9IApEBAFwg89TqEU4+0jG5+mt9PM79j5NQ6Q3IfZv6ly8z/eiGgrX/SE5T1BGMKBsEhcv
	NORl5rqaIDyGKdsp/KE3DKNYMCxG9xuGnYpE=
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12714217a91.3.1789046949739;
        Thu, 10 Sep 2026 06:29:09 -0700 (PDT)
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12714129a91.3.1789046949155;
        Thu, 10 Sep 2026 06:29:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 00/34] arm64: dts: qcom: Move PCIe phy/GPIOs to root port
 nodes and fix wake-gpios polarity
Date: Thu, 10 Sep 2026 18:58:49 +0530
Message-Id: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJGwomoC/yXM3wpAMBSA8VfRubbaJn9fRRJzcFyYzkZK3t1w+
 auv7wKHTOigii5gPMiRXQNUHIGZu3VCQUMwaKkzWSop2Frfbpa9KHSS92mZqNEYCP3GONL5ver
 mt9v7BY1/B3DfDwa4kuxtAAAA
X-Change-ID: 20260910-root_port-8237b5931fcc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=8123;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XOUIPQ26ojc/TFlH1T2oQfIVuOrooQJnVVOaB6jjc04=;
 b=pNyw9jGjHtqLBR2dt4Kf/+r3zB2QOeXp/qg7pzD9yn83L8pP4FRwHiz4pnWU+4WK6KGGd7O5f
 WFcZkTxaHdiBVocLJwNcxuoRLkss64mejD5oAx4QQkMHs0ik5itLLwv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1hVyYUHeGPGV
 AQT1wq8XinOBayoCfNJFkbYqpwg0SNRPJC4JZZBsL6Z9J3+Wtgd2B9zdsWvE4Lz1vCgKxiRC69O
 0jFYPw1Os1GZ+fhXC2SzQLqAkM/NK1Z6BRd1p83wYZcyWH2dF0DxmfRjpTf1rEK6fXbd6nKnlfr
 LlZmZWsX1AylXcs5zGoEPAINbPYp49lasxZxCc3gLzMisk0dQx/VzJg0wYn12ZaAGytMFn4Mjo2
 IpUNFKxKF3EYpKZIbBVooriEnv9kKblOCmXNbEd6/Qqpgk4adpnWoa24GpGazrBg9Mx5R6J9qoy
 gEPqPfnRHmuyBM0Wb5+cYnTn/pXRWdy1YdakPmlchWLIr2dlIe29gqLzvWKVf80/VNkZWwtp0aq
 mnXVw+IxM1ke75GaJKGkp3QsUMKEM6bGvcvKOZmy3vXI3XQ+66t1mB7sY4yhJEoIqrTpMeTwxwS
 FtI6C5acaausqVc2Axg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1/WLwBaZD8GX
 maIz/qwqGFuXb7cctAXN9ki46dV50ANeYhe1Oico9C1fzdiGEZ/LnmOoXevhH+vvpw6KVgeaLb+
 TdTD3J/AwInNFn+7aVrdtMqdkBpv7rQ=
X-Proofpoint-ORIG-GUID: 08jFTF5wb_QM_99tYQjvr9U6zabM9n04
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b0a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=kFW3sJ3c6eZMPR0ECUAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 08jFTF5wb_QM_99tYQjvr9U6zabM9n04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

PCIe wake is active low signal as per the PCIe base spec, Several Qualcomm
platform devicetrees incorrectly describe wake-gpios as GPIO_ACTIVE_HIGH.

The PCIe PHY references and PERST/WAKE GPIO properties are defined on a
per-root-port basis and do not belong to the PCIe controller (RC)
node. Keeping these properties at the controller level makes the
description less accurate and prevents clean per-port customization.

This series moves the PHY references (phys, phy-names) from the PCIe
controller node to the corresponding root port nodes (pcie@0), namely
pcie0_port0, pcie1_port0, and pcie2_port0. Labels are added to these
port nodes to enable board-level overrides where required.

Additionally, the PERST and WAKE GPIO properties are relocated from
controller-level board overrides to their respective root port nodes
in the board DTS files. As part of this change, 'perst-gpios' is renamed
to 'reset-gpios' to align with the binding used in the PCIe root port
context.

This restructuring improves DT correctness by properly associating
resources with their respective hardware blocks and aligns with the
expectations defined in the PCIe binding.

Tested on Talos Ride & lemans evk platform.

No Fixes tag is added as no functional issue has been observed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Rebased the code
- keep phy property in between bus-range and address-cells (Konrad)
- Link to v2: https://lore.kernel.org/all/20260611-wake-v2-0-2744251b1181@oss.qualcomm.com/

Changes in v2:
- Move phy, perst & wake properties to the root port node.
- Rebased the code 
- Link to v1: https://patch.msgid.link/20260521-wake-v1-0-d822567be258@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: konrad.dybcio@oss.qualcomm.com
Cc: mani@kernel.org

---
Krishna Chaitanya Chundru (34):
      ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: msm8996: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sdm845: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8150: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8250: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8350: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8450: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8550: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: qcs8550-rb5gen2: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8650: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8750: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: monaco: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: lemans: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kodiak: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node

 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |  2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 15 ++++++++--
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  2 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts            | 13 +++++----
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   | 13 +++++----
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 12 ++++----
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  4 +--
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |  5 +++-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |  7 +++--
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  6 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 21 ++++++-------
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  8 ++---
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |  3 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |  6 ++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  7 ++---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  8 +++--
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  4 +--
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  4 +--
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  2 +-
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   | 16 ++++++----
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  4 +--
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       | 16 ++++++----
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       | 12 ++++----
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  4 +--
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  6 ++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 12 ++++----
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++--------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 13 ++++++---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            | 12 +++++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 14 ++++-----
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 21 ++++++-------
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 34 +++++++++-------------
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 16 ++++++----
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 14 ++++-----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 22 ++++++--------
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 14 +++++----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            | 16 ++++++----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  6 ++--
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |  7 +++--
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |  8 +++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 +++----
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 14 +++++----
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 14 +++++----
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            | 16 ++++++----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  6 ++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 +++----
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  8 +++--
 arch/arm64/boot/dts/qcom/talos.dtsi                |  8 ++---
 51 files changed, 289 insertions(+), 246 deletions(-)
---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-root_port-8237b5931fcc

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

