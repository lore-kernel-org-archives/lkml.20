Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC314E13EE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021890; cv=none; b=pAEcmQSDgnbvYEh08l4bsHRCwZGlSWnHIcctIJq1durNQOo6DUYhspWHBQiZotMksA+Kv8HaVeRsGD5AJtqWFjjCfAuOoNThFl3hcp5EQDqGDoeXmGBtiaiJG7VPTmnSF2egikosl4pbYZwiC7kSjghhW36iGTZd9jLx7dSlEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021890; c=relaxed/simple;
	bh=RP7WTrwAPt6xLoUSEeNrq3/jN4TYEWno3wYkzoYf07I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cYNOoKGL7gNTmfNOs9p1u+r87rmvFzWW40C7jYkS0Cr1Rxwxg6zqAK8bHakJegd60EDEY/EjvNbePbquslFDSkGQBM3gDe2+Q3VDqcKrVCg07geejsa+mLjejS6AZ/vwBWS72uCqcAc40xyiKJkwL25dKgKMb4QNCbB69suRnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0KUcVxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSN2QYAa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0KUcVxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSN2QYAa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EM1MNs500409
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LmbkMsHPiT3BBG3ZeJHnzx
	QOZZxaOSDnnOlylj3EKhg=; b=a0KUcVxTRKjRJt03yTKS/lmKIBinCps5dyUSph
	PgkzVgrQqMzqMA1vA7n+DhN44U1Y1kOeLZlliEWDwXjlCxE1A3fk5EwCffryva/2
	wYyVfpVdlq0Wb3U4ATwv8n8/OqsFWBum0GqjuewmjNP7VlrUjDRX1RbHY7P2rzBV
	fQVqZII6NheoZxCbJD+EnZq6fG/4vLM2XEzZOP2bRkwiPkWNuqz5hm+g+F3Y4fkb
	p0xEDtt9EKIKyiPrFsHqP00qUig7JJ2K/C1DjUFwZ7ue/AtQjkawvlmih9w6c6X3
	smdWPHgDBHa0r7nscCd+rRT5ZqIc1w9LF0wtpMm3ksRF/sDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf28uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:51:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so1019545885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021887; x=1792626687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LmbkMsHPiT3BBG3ZeJHnzxQOZZxaOSDnnOlylj3EKhg=;
        b=kSN2QYAazX0jj12KI79xsGr/VcIx/7puSMdMqFbMa0MUGyakO43hVR5KcgzBWFl4Ac
         GKL6Niv000Jw8XMSnCyugYMHu+Are64M5/Xu2lB6JC51eVVShgpZcrUTbUa1CwVKAS25
         tr2U6Mq9OmXNSWFWjN429ktIPmoTnI1LxKlNbbOuynT96j9vjtSXSt5iSgY/dNBr84ma
         LtidW+ID0hYs9kpVtOy7Ao2j0hu9OZ5cH5ylVEkmUTcRe4Qq5zGUvfdyFpZJS6heqwjH
         FTGLP5DkJytPAsjumtEeYhaQhMaUxY5Hzb4WovdeKuW7W9GgkuEBbLQvqMVGmUqokxvl
         rwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021887; x=1792626687;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmbkMsHPiT3BBG3ZeJHnzxQOZZxaOSDnnOlylj3EKhg=;
        b=0d9pBleYelTuR9Io8FCDDDTKWzO6wDPFrC4JFdNYt/R7HTw3e0JZ9PJ1mD4FvwouUt
         qEaWB/W7N3AKRJWWVhgYl9ZcCMn9IkHpj7aKM1I7bGYFkKDed3GgvZN2Lg/Z2Dh+Ww6F
         Xl3MdCgDXuFSYCapQwhqdLT9h/rN+rEpqB84Vci3vP4ShZxTPikOLp2dRSo+XGoVvQK+
         PFeFkpncV+YLgw5AiRU8VBHvkRzMkeXQ/xdhL1gQEod1HhDUB99AMXZ8Xk7MbY/vSAaW
         NzarCZrOus61umK4KUgSSQCgUtdCmh+tvYeRtyb3m07UCJs6DpsdkCOLbSdf47R4BvCr
         zLlw==
X-Forwarded-Encrypted: i=1; AKwUvBzvBOkl+bx3+p3fgVNZlNdZpsb1JDcbIs+eER2LsTlnINeoDwpMiSYxqto3KK4vrbQojPUQ5KolaYaEvjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhEM9stSvYC5dRtpETTl+BF3J9FIrLU2XTiwBQW+7YWnm9I+fQ
	h0nacX4hvDa1nus8jonNnLnUGDK0yiNqeI561IxpVtw20J6+FM0ZxCJZI6tFBs7Piwxou/96cTo
	CVCX19xT025Vs0B7aIb4Im+Jqvw/Ako0+Xoa1yJY2W9fEByDR5Je+GU7B55HGhn9gV0E=
X-Gm-Gg: AYBFou1UHgHCbBL7Tv4DYurFoERzpcK6lJHv7iHrkMDTVRovRWznJfXO+oDyOadU28L
	IqWcM4SFL3TIX/sCEUfPFXPmEZUUQ3JVhT35p55sS+3SDAs6ds3n5rGlgYJ2UjNBVfs306FfXV+
	9BtTFryJRp73iQe7PH/5P8L5N5Kwy4kSldZ5YAyjoIwbBdbKwEUyEJJ1wKHeWxqt8lVAsEqQvoJ
	XbWxyQchDAPHmMXlcloCvp7NEX7yoJCVcqULNhics0ZHzv98ibilY761Mua3QEbzLBj0Chw3ca3
	SR96dUsaQ12vaA18B/tBWYzwPp45Ij6s4D8NiHHJMhYGv6KwG2GcNHFfW445f2SRTtQxL0qrBWp
	8WMKtD6/+k82A+4tnduA/gL8tDMZIKveBIExvF6JL/ELRMEnj28fpNndNb6OFpv2UsWVwSx8FkA
	Dmnd/GHBAp0uHr
X-Received: by 2002:a05:620a:6cc3:b0:93e:c12c:f128 with SMTP id af79cd13be357-93ec12d059dmr2761716485a.67.1792021886664;
        Wed, 14 Oct 2026 16:51:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc3:b0:93e:c12c:f128 with SMTP id af79cd13be357-93ec12d059dmr2761713685a.67.1792021886184;
        Wed, 14 Oct 2026 16:51:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Thu, 15 Oct 2026 02:51:12 +0300
Message-Id: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAV0GoC/23OSwrCMBCA4auUrE1Jpum0deU9xEWbhw3aRhMNS
 undTSuIgpuBf2A+ZiJBe6sD2WYT8TraYN2YothkRPbteNTUqtQEGCDjADSooRYl7dWJNgKxLJg
 UgBVJBxevjX2s2P6Qurfh5vxztSNftm8GePXNRE4ZrRENb7A02lQ7F0J+vbdn6YYhT4MsWoSPw
 BkXPwIkARXrRCfApG/+CPM8vwCrvqJ+7QAAAA==
X-Change-ID: 20260122-sdm845-hdk-9466530c4267
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RP7WTrwAPt6xLoUSEeNrq3/jN4TYEWno3wYkzoYf07I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0BV1C2bhr93FymPWgE8pLAQxduOhlAe8Ec7rl
 oEbFE3/5iyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatAVdQAKCRCLPIo+Aiko
 1fU5B/9EQtqAkzf2qdc1i8rt4O/Z1ucIW8ZYZRV9y1fwjJK55oSjCDiiQVbvMdZdC0kmB9zn12A
 XiQAsg1i4PTCWWmctEQok0A0MhuC+qs9sxOxeVgjlkTfQWu0Hm3yRMiA7zDQmH0wrmgfHzaVj0h
 0QS92wvtu9dcrbG/4WYhw/PU3G23q72owT/KbZtGu7LaifX73BYrKeOYFAhD7LAtuqegBUsQUqX
 3i8ZGo+LFJUHNE3MfrgZl2trBnP/GhzmFYl2Gcm5umdSKRTwiKs6d6Xw72Za/4K/f0doVUOxR2J
 xr+f5rdhEnSu+GFsqydNiKjnZ5QOKMCQVv5fB/i4YYjid8ND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX4cdnLa2gdUzl
 nFZZOvn0hACCB+EqAQTQ/F1GVPLc3ESpxb0d4zOFqtfZ8FTCZ9FYG2MEDOwvWVqAY0OmKyzfsGc
 +wgCMx/eB8j5pbVe9wIRCzCZ2jPYlq+xAHXvYYeKhR83Ln98NYGXpyyTRH1cE/+e39RkaFE9UF6
 w4R1dn89zDk6UaJgVlISAETgGpgHnBb2n8HeTAE+YoLVYX46o9lKwQz6jMGcijsyUzof7tu6EDO
 Hvr/AO0xRUVJZAgvX12tQhAZTorzwPnerpERP0xYhsdg3Nh+TY8lC3LlFkPSVQH8eDIZENCg3Gq
 Wr2FpCA2gkn7unoEcVU/47+4aqYE7hORYe8r2NDW3hQTYrtqo1vUPsOIwj6s9xv578ykHGa+tPy
 V2B0W15XZB3VR0pBP8KCrhL8GKaaQMWwfd0OzBz58AcwhO7YwuT+pMs5W8s8EfQDsl2BRY90oUA
 PjTbdunk6WwwVEPWqoQ==
X-Proofpoint-GUID: q5maS3m08XjswOzlIINBSJbH_TUgGtRc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX5dFh6WId1Mw3
 BgztPxVUlcqmQzhsC1rkItSpa3lrfG+2ud1L+Bf8E6LGYM79G1G5chGNEcjC1OZ7hZYo23dzVt/
 6LOM/fTWRg4PSr2GbLzbBHlu5JNSW8Y=
X-Proofpoint-ORIG-GUID: q5maS3m08XjswOzlIINBSJbH_TUgGtRc
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad0157f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=S_NnZ3hT_RIKTG7XCKUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140095

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors. The DSI panel is an optional addon, so it is being split
to a separate overlay. To (hopefully) ease merging, the overlay is split
to a separate patch as it depends on the panel. The base DT doesn't have
external dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped mipi_dsi_device_info from panel_desc (Sashiko)
- Added comment to SYS_BOB (Sashiko)
- Corrected commit message for the display card, dropping mention of
  mode select line (Sashiko)
- Link to v2: https://patch.msgid.link/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com

Changes in v2:
- Dropped MDSS reset patch (Konrad)
- Added panel driver and the display card overlay.
- Link to v1: https://lore.kernel.org/r/20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Dmitry Baryshkov (5):
      dt-bindings: display: panel: add Truly NT36850 WQHD panel
      drm/panel: add Novatek NT36850 panel driver
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: add device tree for SDM845-HDK
      arm64: dts: qcom: sdm845-hdk: add display card overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../display/panel/truly,wqhd60-nt36850.yaml        |  98 +++
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            | 824 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c      | 344 +++++++++
 8 files changed, 1392 insertions(+)
---
base-commit: a7d52d51b31a58da686320f5e4edac74e2dad682
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
--  
With best wishes
Dmitry

