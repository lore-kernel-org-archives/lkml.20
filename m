Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA42471CED
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766932; cv=none; b=Igt75sA3+e8+V5GGoWdBcqwZk7tpTGUhdNI8f2/cXkkXIV7rw3G2E5gCNEL38ZnSbUYUzdT2W/pRjxDwJC2tltTqTgITXIUdbB1TcLX1V+0AH2TKpNJzyCQDCu3f7SyGuar7wKqhhij6361Osu56CPYxZkLANryTBYBCTqD9QKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766932; c=relaxed/simple;
	bh=xxGEWTdsmAJC2nKzZe1zQGwJEPDMPsI9D8m9GJgmAqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZN+qkFYCUMQflja4kEWpQ9PndthQm7Q4DbxFjoNwgzCa3Ai2GuLz1vTYznLxcDZb4kHA7fZvnFWGwchx9XyG+vLvfjS9DpPFJl1MJZbjMK8Sn9wYo63nHId+LbldlCrx7Jniks3KN8KCT63+ArSHDI8RaE8+HzB59Ypnr0P9QEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTk2y7J8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgbhIC9O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTk2y7J8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgbhIC9O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7pXB3955056
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u6+I+yuS2a15nDN8Y1nUVV
	bPwsYqwaUA2Jm/SoUnvgQ=; b=KTk2y7J8LS2Q2yZwUqzlh8g8YfbyuTDKN98RdU
	CXUoH0R9HnKCHPchB99a5ahHsks+UhRI3R39AsjrxWn6XXrz4nwC5XZ01IoS6kku
	suGcQsvvZmzokOTYqFAq18DN35Yo/vWnVnPegWzwIrfXpNWdAKM8yDjgkISaBtYp
	+L94mL/OuERHZPuUjjIWCLbFtLFWjNOkOrUEya4qQe0CAtBHKU5DOirJa+SaQS4N
	Iyjk75oIi56KmE0NucQXaMyO/65xREIQp25h9mNGKHSGCuzP0wXDpxa+z1/C5MID
	S2XULKabZcDfsgkIJRMCrk4mdBIfFHKsBylOunfcZHezMipg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97uynb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8d1e91c9so78250805ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766929; x=1791371729; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u6+I+yuS2a15nDN8Y1nUVVbPwsYqwaUA2Jm/SoUnvgQ=;
        b=BgbhIC9OTMAZcA4mboA4EzY45fSXWZhRD1ugu1lRBZ6B/7EuMq77U+49dYtw3exXOR
         wd9XfMAdvEzFXciuV2a5TpftLwYhd5a4uiY1fHZvt7muY07tC34AkaAKs+eb3BBcM8wb
         e52BfGA/bQlkdXlVZdsU4Avax/qJETOzvl9v6JfYpbVnmcdJawPUTnjw2pB2WgywHm1x
         BYzXWU3avvPawLF8/tjhqJdHW5Ok2tVjwPJrD4KQsl/r9viTG3pTN08S20qUkot75WG/
         aVwZfBEQTMuSwlAlS6dUbiPL9vlefr7MjuoB4p7VbxRJyPR7kl3jY65dE+2CwvrU2Vgy
         iM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766929; x=1791371729;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u6+I+yuS2a15nDN8Y1nUVVbPwsYqwaUA2Jm/SoUnvgQ=;
        b=q/9Dba7NslN2rCyqHZXMywjvWUOdvTvRxTz9EE2/XPe8VTUNxSGbSRdD+y1FflbyRQ
         S3fdhpXG0DuiS/K87/qEZ6HY0DPRuf8Ne7NflE99TK8jY25BkfNQgsvYkTdlpbVBsos/
         w0HRCRr4J9WPhPn5uUsTL2VCibAR1qvzp8manGGvVaZhkLUSCI+/94s9FuIBhCHUj9Jj
         1rrhKsEWovMHhFXOXtWZ39WIThyDHlrmyXhccx5VR17MSxBTY5VoKL4DC1+e8eTT/9gb
         WCx1/QRMdxzj2rFK9FClVAaZzOsyqw/RwiKidFKXELYy90kUr8qUjfWsLG8QfpfDcl5l
         quhw==
X-Forwarded-Encrypted: i=1; AKwUvByxtdV3xF8s0plqnzzPrGe18ecabBuo3vSJlohOH/vHVsNoRM9v88xazRUaCGeP4QQezF6xdrm/kqNwp38=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS/dZEdWYigowGlKTwsDPPrLpN6YGi6qMSoF9dwN/SWQrA0Di/
	Wt0HkOB9l224HekVIy6vBE3VeSIdBgg5MVmyA07emiK6DNdpj+IILGBG0BSe6UItsI758t6QhAv
	65GXH5t5Qkz+mQQu8dI26/A/BUUyqzpuTE5qcc0DJ+9PXYEwJgtbyI31kwOVJoFyMKTlHQlxPn+
	w=
X-Gm-Gg: AYBFou3G5am3ZFdJiHBr1cWQLzsyDvCZvenOO2sqpUZzNy+pHS3pZbxVgWqSmKZ1u1d
	xfevkyV7L/u4hkKcKuQYeW0x40h/qOy46CXf3XpSXoVkD0XK2Ssb2LpX9D+RaacRUzygroTPN49
	zJthk+xQlYK3geqEs39dWS+03DWoNT5DXISPo45Pjt1a1wwf97d+nLVUs4cUlBtaAXc6f7sUrEQ
	y6UValSFRIjlDh/9/aQDOMUMEBxneOh7Kep7GyFq7GKr84XJg5gTz6QwA2rMNwOH1+7UrOYK1Pg
	sF1JgDUyPX23WcLFTe1RZ6jZbS9volwVzKE0vnKlRNBENgzRFwDHf+fvLH5BbUYG2xrbZTkHYyU
	rsyHuagdXhF2xRXSivZXCZf3CzoE=
X-Received: by 2002:a17:903:1b65:b0:2df:9257:80a0 with SMTP id d9443c01a7336-2e2e4ba3df7mr8876545ad.52.1790766928634;
        Wed, 30 Sep 2026 04:15:28 -0700 (PDT)
X-Received: by 2002:a17:903:1b65:b0:2df:9257:80a0 with SMTP id d9443c01a7336-2e2e4ba3df7mr8876235ad.52.1790766928100;
        Wed, 30 Sep 2026 04:15:28 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b136sm5505465ad.71.2026.09.30.04.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:24 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v5 0/4] arm64: qcom: dts: Add display support for Qualcomm
 Shikra
Date: Wed, 30 Sep 2026 16:45:10 +0530
Message-Id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/vvGoC/22OQQ6CMBBFr0K6tqSttBVX3sO4KG2RqlDtQKMh3
 N0CMW7YTPIzb96fEYENzgI6ZiMKNjpwvkuB7zKkG9VdLXYmZcQIE0QwgaFx96Cw6fG6B3wwlMn
 KlpwajtLdM9javRfn+bJmGKqb1f0smonGQe/DZymNdOZ+frnhjxQTXBSlKhIj94acPED+GtRD+
 7bN00BzTWR/kSRbj0aWRFzU2lDBS6uKDdE0TV/bNFQ9FAEAAA==
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790766920; l=3567;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=xxGEWTdsmAJC2nKzZe1zQGwJEPDMPsI9D8m9GJgmAqI=;
 b=Bu0Ll5ugurB0jatHbFGx9auuJoF9sxNOoFJlHYtgXoqRuPVBnhBZwhN2eXGJd9iqnrS/Nvugq
 zY0jPnisIY5ABUQPylKq+UyM7DUsole64kqAZlvBgyS960W02L/m7wm
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: tkRjyWkcnSViEMd9wmchzoS4HkDzKNX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX01XqH7YE2yR/
 H1Xzx5QLJc3bthLBlGCMqsXOd35mxBEoWMGeAhO+GnrfjNi4/JFiEcA1iyGX5nocexQE5Sgg88j
 m79MMdIIfq/FaUdhQFDfIBGUxmeXklxw2kuzyRmlUUVYExVHWItNArKmzLzNPl1n1sWdVksiGAd
 4Qs5vqnocBksUU2H8tNraU5eDWG6Fh2CfqcKVQ8I1NyqG7DEkmHWww/W4DWkWnlGy3MlHP6eenS
 G+g0bNob/yz5xrUbAT6Ta4dJGWTZyIjBvNXLuS+l6+eVa3tCEo1iESDGAuYVo2lAMT3cWOPKfi5
 RwYIw6AjhTutEbrqFd7PaDKxP7jojOi+IrZGKAZrrC6lWUXdSc6mRwPsBL2Y/VPZ7rgatf3UncE
 A2T8/4GYSO5rUJjJDoy3yKU279Trah9cB3j+f4yoK30ohCWccNBqiYdjhkNhJCGAPTVzkZNx3Cu
 axP2Q19A16PZDV8WsCg==
X-Proofpoint-ORIG-GUID: tkRjyWkcnSViEMd9wmchzoS4HkDzKNX0
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcef51 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=hOcAhXLu4TPP6eDJ8ssA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX6Xf8l3uGJOhY
 6TPT8uztgmm7+XHFLHAk+WWT+DNGwSs2EwKD7BIWkoKwknntEXUcLynqtfAVBW/AiV5QH+t9J4V
 rjvalgHFc2owSWcVhEtyrMNeBDB5IA0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

This series adds display support for the Qualcomm Shikra platform.

It introduces the Qualcomm Shikra MDSS display subsystem support
at the SoC level, and enables display on the Qualcomm Shikra CQS
EVK and CQM EVK boards with the required DSI panel nodes.

Dependencies:
https://lore.kernel.org/all/20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com/

---
Changes in v5:
- Drive the panel backlight from an external WLED driver whose enable
  input is wired to GPIO91, modeled as a fixed regulator (vreg_wled)
  (Dmitry)
- Wire it up as the panel's wled-supply and drop the now-unused
  panel_bl_en/panel_bl_en_suspend pinctrl states(Dmitry)
- Link to v4:
  https://lore.kernel.org/all/20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com/

Changes in v4:
- Rebased on top of next-20260915 tag.
- Dropped all prerequisite-message-id references since the dependent
  patches have been merged.
- Link to v3:
  https://lore.kernel.org/all/20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com/

Changes in v3:
- Drop redundant vph_pwr fixed-regulator node (Krzysztof Kozlowski)
- Remove vin-supply = <&vph_pwr> from lcd_bias node (Krzysztof
  Kozlowski).
- Add the new line between the last property and the following
  subnodes in mdss block(Konrad).
- Link to v2: https://patch.msgid.link/20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com

Changes in v2:
- Replace QCM2290-specific RPM power domain identifiers with generic
  RPMPD_VDDCX/VDDMX macros in Shikra display and DSI nodes.
- Add missing blank line before status = "okay" in &mdss_dsi0 node(Dmitry).
- Split avdd-supply and avee-supply into separate regulators vreg_disp_p
  and vreg_disp_n instead of sharing the same lcd_bias regulator(Dmitry).
- Sort tlmm pin state entries by pin number: gpio3, gpio86, gpio91,
  gpio151 (Dmitry).
- Add vph_pwr as an always-on fixed regulator representing the main
  board power supply, used as vin-supply for lcd_bias.
- Droped the 5th patch "Shikra LT9611UXD support". NAK by Dmitry. Once
  the hdmi-dsi driver is fixed then we will post DT changes.
- Link to v1: https://patch.msgid.link/20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com

---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 110 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 110 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 206 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 4 files changed, 425 insertions(+), 2 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

