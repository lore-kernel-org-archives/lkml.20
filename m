Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88E3ADBB4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161176; cv=none; b=k9w3OpqOZ0m92ogDXx74o4Rcthmt64zPZE1wO7szMcSf7vnRfJvIyneiiVzudpM6Fi7+L0l9pJ4Vy8xkvHCbZyFYDFJGhZRZqEibOI/lOnR5puuDUVnZdBOWX5CHgov8jKESudIpX86W3WHWGjZdW5mbN0RvN/aAwzahc22+GAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161176; c=relaxed/simple;
	bh=gdQedCkV93rIvkShkP/AJbX+V4bQlHvBZyvJpQ0UB+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XX4DD5BirnfT/4MsbWUd9JkbkN5w2rlC3IH7igOztLiLXUTknuyo4olOtkYwQdJ4DN5n7QP0jxAS0mi7cHy0FQgKkwlzTFmM4T2DBgVCQg4PZ+nuKli3Bkc23/SK+PibThaN56hoVmv54/pzzNklNeHK0KAdMH+dxhHPjWTMQd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcEE8Rie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFejcbaW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcEE8Rie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFejcbaW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52bLT2764546
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VEO4lYRnJbCn8tXtqxTTZT
	izUjU4GdautbEOyyKJZB4=; b=mcEE8RieQz5cVZUYqxu84b+9e5S8QhJPlYOUmK
	eLwV4xsa8vspE/V1NgOmt4pRRnEv42mSmLRex5YegVWkHnV3IY6oJxwkBUWy4Vz9
	AEJmzBaUqiZ7rKm891FcZ+vJFiVTVhGe/gKEuGJL7o1Qc4GBchxkF+orQ3tHTuRa
	myHNdCs1UoCgSQM39SdMzGtxqW/I5QsON66KKXg25YuVDRxGY469dy8y+lWW2Oay
	Vm48vn/39FUJjS0l05AeZodtEU9t87dRRPdKhirZ1EjFhDseEWGJ5iEMMWvquPQD
	VQ47LC6Le6hdJH1MrQhL+a/G6ROozosUWNcegWZSApaR2QLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyn6w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4459811a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161171; x=1788765971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VEO4lYRnJbCn8tXtqxTTZTizUjU4GdautbEOyyKJZB4=;
        b=SFejcbaWCiQnRvqk/MqrJzS1WH6LFBVQOVplDXmQSZGsfnidXjPPoWunvboKuzq+u2
         a4eq7TLjJ/fwhXSc5lScQLKRwin3dG8/ftZw9V6IK9ew0EL9K/HCcjWD4x/TumuYlpCx
         CX6FREoAORhlaja8g6PDExoexByo94gNICQ/PtKqFMHXqi67nZUQOuR0mUgtp/Th7Yhp
         5ImhjBTmCRnorGMKGM6DlqQQLQYSE8YWQ2F+ro5EyU1wfSGmgIlxJDANEc22Asd/QhtB
         GUEc+k7FW2zdKsmYFKUyF4+HVpTOWWf1yrY4026Sy8oI3iGD7gpLAaSWQZlDB+B5+g8J
         OnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161171; x=1788765971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VEO4lYRnJbCn8tXtqxTTZTizUjU4GdautbEOyyKJZB4=;
        b=R4WoaKa5dlYJ1OxVWV2KyMFxOWk4orOBKt5DBolDYd75sOT7nwSSwRsGf/hDRGNwmD
         5Zj1Tl/SptD28hYFie3+oK/ANIwqNaWaYO7htYVrWH7N6YqVVsAOgv0qP/JpeyxDvn0T
         8tI0gaM9E3p8nx8Xq23Q+Tnh1jjod+Mks49yP4XORyJLD3GTVX9iCJH/E5Pe21rSmj38
         i/SbW7TJosJVkPYg93VKdrxUgWMjA4XlNYKgErStVJWHzs075nPG7prnf8CmxbWy7ALa
         W04gtZGq/9+diLJ1tM4XT4MrlyRBhRzOB34vbyT5GXXf63sgoMIwfnWAA/h49xracvcg
         6N1A==
X-Forwarded-Encrypted: i=1; AKwUvBzjtcZA7G35bAR3lci66UyDmPvjnStPo0o06eLj/xta2n8PGf2+zCAVucPPmZ6srzfB4yG0gXqbCIzVl3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mhChgp9xLX1huek0PGsB0nxqELmUsYQ+BnYzyF+OvT2y4ZdLhl
	pr7zs9CpqbpGEHx0xjAL4iXPY5UXpcO8EiKmdxVBGnQi6DzMCQOjJY8wsWhvqG69CuXq7uItTRj
	1EWoW9acgPG4wfNg/L1miNyTz4IbaIeSbAsPSWktLGI2hKv2xWHxYqS8imtLsvKwx0CQ=
X-Gm-Gg: AYBFou0QJR+yv/oL8IgXmg3r3XsDQOP6ib/cH+A94lrlfFPj0wNQsfW32Yencmf0Qug
	vUPioq8pOhX62SVR8+Vaqzd7zGh0k+u1R/njA07LAbJ9ZYdFx8Em/Fmcd9J+NaqyQTejdWdXoE/
	CPZeD6L4T34594WLpE2SAwtWhq4ByUnm4Waa5FVxft2r+TZPgLhm3goHD94xVxxt0B3M8gMYbbN
	YKEo0BZgYHzs24u6nOPEUC+u4EEIq3nz2IqZfa3i64/dQPWHYX7crpZW82VIklC3R4per59Hjze
	W9b45SA2JhW/Xz/yB2mRDSJNlQ0b2YJXS5M6h+Yn3pNYcjbybhS9m6zO0XpWtu2cZlrPGSTlvJJ
	RK80BrMydifrTCNqGL8S2YxQsCXKFNqHGwXpz
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr39580843a91.13.1788161171352;
        Mon, 31 Aug 2026 00:26:11 -0700 (PDT)
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr39580761a91.13.1788161170828;
        Mon, 31 Aug 2026 00:26:10 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:10 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Subject: [PATCH v2 0/5] PCI: qcom: Add PCIe support for Shikra SoC
Date: Mon, 31 Aug 2026 12:56:00 +0530
Message-Id: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgslWoC/3WNwQ6CMBBEf4Xs2ZJuJVA9+R+GQ8HFbhSKXSAaw
 r9buXuZ5E0yb1YQikwC52yFSAsLhyGBOWTQejfcSfEtMRhtSl1pVOL5EZ2aR5kiuV5h0diytB1
 qjZBWY6SO37vxWif2LFOIn/1gwV/737Wg0orQVQapsafieAki+Wt2zzb0fZ4C6m3bvtPHkb21A
 AAA
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=2281;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=gdQedCkV93rIvkShkP/AJbX+V4bQlHvBZyvJpQ0UB+Y=;
 b=njUKXKbzQO8YBIBqQe/hQ6XaAc7ksR9yP+XHwecFuXAIWcDKhY1N4cp0tggVG/AR8os7ClUoH
 QRkWoXvyZWCDP1mSfaj183/+7CsTZ7fo9HCjkRi6HBt5knOgPL1Ql7t
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX5fNjy/h1cbPa
 s81Xz3Wr3oscV0lyOu5ptb+olNAgmZ8FNBG//BGwNslBnI88gHWP0GswNqDNTN2AFWQ08YY06I+
 TXv6azPuFmtX8AXeBrXukCHDCDNg33A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX+qCTM4PjUiZT
 W4WWlI0Gv8vUg7qD4mUANe6WgdDcwi5GHSrdwMcDOn+ZuEbheQuGffPdTXwq91btrXJ5zmgzG/m
 seGWw4NgRz68zJeaNMx7NR22xgPuMx37+tl2HwzcHuo4Rs87WGALDPVgniBa+hCAnRlTFuYYvyM
 0+Y7OY/hGs5p8kn5ugGwttFbjZcxrFSZ7Q8RQh5o4W9zOz6kwYF/fTTtYZk7gsMnO+FOhg64Psu
 IzPE90FzYkerQwjY3xJsmcdU622gpE1pA0vItbFk1mTXXARvO9Qczed18jFrB0iaElzbh0IAPm3
 Ev6eMHBOWqmvZjNBq93ze2hWX9dOBHa3cIhl1pqpNxwfUXtXpuxkr/dLAQ5Q3wb6RG/knvnShMV
 qmQcEeyQI3B32FEwWDV3BRQez4dnmZt5vI4y58t+vCx66Thi/eOffxCB7VX85kIvDnLzTJg8CPH
 IiGrwo/6ngROjmykvSg==
X-Proofpoint-ORIG-GUID: pZNZmelpj7PvR34LcRyVuz_5CQgd9QcS
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a952c94 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0S22rWqy9xk-ZxXqdxcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: pZNZmelpj7PvR34LcRyVuz_5CQgd9QcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310062

Add PCIe support for Shikra target, by adding dt-bindings for phy,
controller and corresponding phy & controller drivers/device-tree
changes.

Shikra RC is connected to TC9563 PCIe switch on all three
EVK variants: CQS, CQM and IQS. The individual downstream ports
of TC9563 connect like below:

DSP1: M.2 B-Key for 5G Modem
DSP2: M.2 M-Key for NVMe
DSP3: Embedded ethernet device

Power and reset to M.2 B and M.2 M slot are controlled via
TC9563 GPIO's. Since TC9563 GPIO driver from Alex is still
under active review, current series only contains basic PCIe
enablement for the controller / PHY. TC9563 enablement changes
would be posted as a separate series once the GPIO driver is
ready.

[1] https://lore.kernel.org/all/e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf/

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
Changes in v2:
- Remove TC9563 specific changes [Mani]
- Fix commit descriptions/subjects [Bjorn Helgaas]
- Fix PCIe controller dt-binding errors [Krzysztof Kozlowski / Mani]
- Document PCIe Gen2 limitation in controller node & commit msg [Konrad Dybcio / Mani]
- Add GCC_PCIE_SLEEP_CLK (which is actually PHY AUX CLK) in PCIe PHY
  node.
- Link to v1: https://lore.kernel.org/r/20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com

---
Sushrut Shree Trivedi (5):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Shikra PCIe phy
      dt-bindings: PCI: qcom,shikra-pcie: Document the Shikra PCIe Controller
      PCI: qcom: Add support for Shikra
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Shikra
      arm64: dts: qcom: shikra: Add PCIe PHY and controller nodes

 .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 218 +++++++++++++++++++++
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   2 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 159 ++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  73 +++++++
 5 files changed, 452 insertions(+), 1 deletion(-)
---
base-commit: 565fa02f75448ce1ddd18bda6b31ad985cf75411
change-id: 20260701-shikra-upstream-14b8668f1001

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

