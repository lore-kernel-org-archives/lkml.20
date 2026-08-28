Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADF309EE7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925930; cv=none; b=d26ZsQjX18fuUK/iCbXSUCsqOWOGpppx6smfD/vXlmYySWMH9n+cndkV7rSBdpUrt0amGx1q1DDMjsxJLStIqAfLOfa9evjYcd9WEaF9CrRAO3nbOHifG2LsXrt4PnTpRwebSvJ27hgtLHsVhBvTEgRY4fFC5OnS/IT86DGJ3I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925930; c=relaxed/simple;
	bh=vJbhpstV+ttcZLNyRwj3/fWbYL3GtHiutJk3K5SuMGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CnoRESo0C1fjVQUncJ6Dz4QzQTW6PgAiCW70zYvB+yW2OYedkMtEGOKsSilQc24UNd7PR+hVNTxT6nwjjynvgIzomAQoxKTW4TKLkngHQLHABpfZdd312Wc92EarWAkcWn+LtE26elXyrWqDBM3SPIKVKHDzG/bL/wFiW1hBv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lh/V6tc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6OPBCNY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lh/V6tc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6OPBCNY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkcSh3279759
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ESpmF/AoUuQly5eGwpgeHE
	+vjb2a7bz/klJLDshyWoQ=; b=lh/V6tc7Aj9h/4SvQpCNvtmV55kj/n8Hnhba67
	1UzgJOkq4i+DXRjMfa4SFiTGy0jZfH6M050A5UbMo+L2w3M8lmQ0Ait4TZhnYkb+
	pcHKw9T/rViHEMQYXcmqKCC7nbgQAF2ygBD5PBTCzuRNBS2CPFa43nWaqp5lGqRv
	PDBhth+eNMyDlXwgzIML6hRxSMQxI3Cmtw8hGVj7bedlX1090Et5Z0D0puRWCbNP
	Z37ng9z+r5ilPKJMLqlmWd/KGX6xXwTOco2xIjOU4TQBDmGV5CY28Ooruk5j8IOB
	t6ICd6/nk6ahd4M3aOCxgT6mr8S0qC4ovH/X0X5xvF2bF6Og==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h1ghu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738ffe90415so101511137.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925927; x=1788530727; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ESpmF/AoUuQly5eGwpgeHE+vjb2a7bz/klJLDshyWoQ=;
        b=L6OPBCNYf/koqhq1KUr3zN4RzRk5p7vqfP57h4f0Zm8ZPapT0hY7bLrF0UN/kydihA
         HA3f4qFm02ZxTGPjAhF6Ix1SuwaztMxpeBscKAkte/3OyeWd1oflIHWiNfExf/ICLjn3
         PzflBUYXHb+Ip+BjVrxME2iPrifTwtV4sq6PFL7e6KuAgkUXZAi4wvDbLlpbhG+X1fkU
         MFbSTLuuZTtZuyyszWHy3+bDlqo3g0zhkuFg/ePgZ5chJi7fgtOarYx+JnjfG+JirpDU
         FAK7PuRtKlmlPIjE8CG5dsPSA9/QLNIUpV26Wv9lOfxbP6MGOmjHkrPuPiNadaYtQiCB
         tMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925927; x=1788530727;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ESpmF/AoUuQly5eGwpgeHE+vjb2a7bz/klJLDshyWoQ=;
        b=sD7VEV6B6fEvaNseqY8DKOXzN23kIzZtxO84JLq1CIE39+X42W3W3dUlkN4w2t3YLd
         IRro0GNyTY1KuCcxYP7uOdz9W5m3wLbcYwT2ku46rkBCkLZ7Ol9ZBOpIA2t8QNEV/1LE
         XiztspaTx+UUvYu/SkKxgRgCa1TRykRSE9nkOrzupPasDjIfPyPqhobCE1E9wokafWIF
         f5FBEsnPaSAYczf08dkcTK3LUfIU/iWj7/L1ueZejGBMQ78X6RA6BO1zLqLt6GWcKBLg
         zkRZEX3qJj4IIhzTL8uLMmHxoabyNnlvIaYNzZ3cJA7iiuzted+AJ+FrqJzDZo6dPoEZ
         GIzw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3ShkbZsR8Jt1ZHcpk6VWYb2r0Y3hZ6QLu5ri1Jjbc/M7t4qXoC0NGI4LN0qcEspEQwLPXvW8Iuro6WPU=@vger.kernel.org
X-Gm-Message-State: AFuF++n52ift1bewd9U1CUqlq6tHj/uShbSR5vyoE+ZMsrguhp6igZ40
	MvfckZipJTST9jvTxQ0N0q+NpShY/sQDhiVhNJsD6sRWRFO0olt6XYd2B5ylygPnOk0SEakj3tq
	iFmBkNH7eej0GtcsF0/TJbcZhitwYFQmkTRnPDtld/DdGO/MTOrIoKFZxhG//FZmJbBI=
X-Gm-Gg: AR+sD13MnEKJQW8+HHdxgr28nDeNhjTMLc9SZgS3WhKStes8kBpL1sATOO8WKLbH8b8
	YmqzXzZevH7fd7TUK8Lq+4wUMgeNtN+GAO8w59a3rO3zdS9zZ0nmx31bJrpDHbCeEto0ul3LfTM
	2vX9VTIo573xdQbxfgX5M671xOJ5g+1drJ5qVIYA+i+J1v0O6jH26GNiCYZPWLVo1sU6CrssRHj
	iCIga+6T5zH0DrHK45DVNIV9JHToQWXNXO4oe7XoqlaC5TJLIH7VIgwhuynkBd8uGcbMmdI5JXH
	QaUNYqJ49oBHl+ooVeYjAO/WdaDEpsaXkxXFAMAOfjHxzp2pPt9oTVMmlxN4aD/6T6bfNMaPMZ9
	CuxUNIiUpTAeZL0lVKn1cT7M=
X-Received: by 2002:a05:6102:5128:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-7859822155fmr1884410137.1.1787925926811;
        Fri, 28 Aug 2026 07:05:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5128:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-7859822155fmr1884351137.1.1787925926256;
        Fri, 28 Aug 2026 07:05:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFC/DO NOT MERGE 00/12] drm/msm/hdmi: Add Eliza HDMI and
 HDMI PHY
Date: Fri, 28 Aug 2026 16:04:58 +0200
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMT3ZSiXN3c4lzdjJTcTN3UnMyqRN0k45RE07Q0U3MLU0MloMaCotS
 0zAqwodFKQW7O+i7+Cn7+IQq+rkHurkqxEBXFpUlZqcklILOVamsBxh4E04gAAAA=
X-Change-ID: 20260824-drm-msm-hdmi-eliza-b3da5ff57851
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJbhpstV+ttcZLNyRwj3/fWbYL3GtHiutJk3K5SuMGE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWVnzNVHc+lG26q5VD6MUoiPWo4+IJEQmloY
 NARu+bwH9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVlQAKCRDBN2bmhouD
 1ytFD/9hbKOrNeWlLxDmBPlo/nIBIDXI2BK3P/ZzCU6Un51/tyatSsYVJQXke1oILq9TTYQrwRa
 T+ltjftm0bzGloK3PQvumopARUNa3G4rqfmxJ0Zu94zemUlCtN8q+T3OipJKYWmS2EaAd+HS8YY
 QKifEwpnO7ibqhBC19OY8Hiawn71/2ZhdyA4wBZTd39hjVwc0eqO2xPxpPbxAX+dl3CCYY/iO38
 8GEuM/JrsuK00RvXw9rOyr7grpVn4Oqenf1Beo4cJxhE6iKfjGej1luIJPsCxo9Wy+p7jJdVfFV
 vAmAGMuSMlYNi8mEHoDDy0eKo/KArNTvcCuoZa9sFSztf6MKtG2YiZF4ExSO3iSojWMzVQGMw6Z
 YFuWzvJ4qv5WND/rZMXhdqBjw7LykVJcokpLFxYp8tfFa4IEzb9srSjIAfaFhJvwVC7mcafh9Fp
 4TWev0SAlfXWrEAZjlcdtPOimiOruhvOkONSUaCTmxF4QgyEFplXliL0wzZTi6s5EAWSiA2G2jh
 xxGsUpFGV1pFHeSexBm0uRmRUYR4rn+NMLQxqO97j06JVjBI3XceHNqELd/QeRkSA6sNq6Gk9ZE
 rZ1lC5eFQhJobPBBkV2dEdgKwjBNTNCrojmUwtY5gdk7rs4nVrRjAZarf8lrsQA3+HKkgy9ghrV
 8I3UTJFJzEt5b7g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX9ShinuRR1uOC
 spPwl5r+3CNGR5IQsi6sOyW2aF7aNtHYEPrsoE2fD3f1vS1GWSgHaL578dzW1oox8WFlVPMAgHF
 +J43MRmOXBpYYPs8j1PIuFcEj9+VJq4=
X-Proofpoint-GUID: R4Ou2CKJpNZCKNQcLEpxizBDEDGs65Oy
X-Proofpoint-ORIG-GUID: R4Ou2CKJpNZCKNQcLEpxizBDEDGs65Oy
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9195a7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qF0omb1No2WOS10Eni0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX9T2uzziqav92
 X4SId1kf7sUJImtp/DaoxntECoyK3lH7AWIlZrBbK3joCmcb/NSgFkPgpSqiEROTNs7b2LGibcg
 JkHBFs/9ZeagHW9awpoXZ12kkg3phEED7+gb4r7/leV5pW5m62CWsC5LSjMfBDFDPsSQ5n0yZEd
 sRI4+aZODOHu0wC/1naqmdlhUXl36oZBGTdNo2XLQsIJopKE9NFCbn+PuiZUhLVlRJf+hKBXx4Y
 Qa8qU3J8/o/icYOzeE+49LcSDAfRLsucd0+RcfIns9XFiOHHVCxP49mp0lNU/5Rr2su/UzuGl6I
 6GV/m7lNnwbrThZr6yf9TOHEcjgsiQ2ATkUUcjc9bKOyyxfovBX+74lH32+pIRZ3l7h7kZNoNGJ
 jTrpcoomanOGv94+5PRZvi1PxPjx/aPHC5W3llp0GOnRprQly9TDGS29tg80lfA1Ne1vLjsn2Z6
 XM61/NzbWEAVYn3BywA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280122

RFC
===
Posting to get some comments or just for reference if anyone wants to
build on top, because unfortunately HDMI does not work - no signal and
missing TX ACK on HDMI PHY (hdmi_eliza_phy_ready_poll).  The TX ACK
appears for all four TX0-3 lanes only on the first boot configuration.

The MSM cleanups (first four patches) can be taken as is.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      drm/msm/hdmi_bridge: Drop redundant initialization in msm_hdmi_bridge_init()
      drm/msm: Properly handle msm_ioremap() without name
      drm/msm/dsi: Fix indentation of if block in dsi_mgr_bridge_mode_valid()
      dt-bindings: display/msm: hdmi: Correct name of disallowed supplies
      dt-bindings: display/msm: hdmi: Add Eliza HDMI TX
      dt-bindings: display/msm: eliza-hdmi-phy: Add Eliza HDMI PHY
      drm/msm/hdmi: Split PHY init from power up
      drm/msm/hdmi: Add support for PM OPP table
      drm/msm/hdmi: Add HDMI for Eliza SoC
      drm/msm/hdmi_phy_eliza: Add support for Synopsys-based HDMI phy on Eliza
      arm64: dts: qcom: eliza: Add HDMI display with HDMI PHY
      arm64: dts: qcom: eliza-evk: Add native HDMI

 .../devicetree/bindings/display/msm/hdmi.yaml      |  71 +-
 .../bindings/display/msm/qcom,eliza-mdss.yaml      |  96 ++-
 .../bindings/phy/qcom,eliza-hdmi-phy.yaml          |  71 ++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            | 103 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  94 ++-
 drivers/gpu/drm/msm/Makefile                       |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  15 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  40 ++
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  26 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 117 +++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |  28 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c          | 723 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h                      |   5 +
 drivers/gpu/drm/msm/msm_io_utils.c                 |   6 +-
 drivers/gpu/drm/msm/registers/display/hdmi.xml     | 140 ++++
 19 files changed, 1520 insertions(+), 32 deletions(-)
---
base-commit: 448e60718f7b424994fe1a9013b5317e756e18eb
change-id: 20260824-drm-msm-hdmi-eliza-b3da5ff57851

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

