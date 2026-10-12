Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7682345750
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811962; cv=none; b=Lt8WQNipZBtbjtm8tAYHSvNDFWJHO48vcs7QAl+CT+BR2cixvZfZ8J5bvHDgoG4ySbMYU5k2LgrxN6sV6DlshSAMZmONr990DWbPOZudVpshUB+m2WIxAS63m76fp65DXUdRlL8p3vLG7QaNBFcM5TM9N/rtETr6gRDP/FlbXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811962; c=relaxed/simple;
	bh=Oy2vFMavUsEa6xHikhMkIegRjj0JnZoJtqReLysfrm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cy9cZawjsHZxAteZcT+25Ho6xlUi43hBmgJQkkMF1f3k1VQSrIRuX5VPx+z3tAXkyenm5Kdz4YPMRkzabNMg84KsIDtJPvClhX4+Wl71ZBg9SlHiCdbHHmUGDylnSeh/w4NU6oEFyc5V2kwCgy1Te6geN/2OQKn3QII+7245POA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov+Y1iLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dc08r1DC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ov+Y1iLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dc08r1DC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08f93292283
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dx+5DlXOJvegtnA3Kmrrw1
	qJ6BKbC1jFDAUZNCC1dnQ=; b=Ov+Y1iLztTChqp6fYm9U0PUNsYfH79Vdf9GBmP
	vHXgqOtIkmspbWEYwT2xPOfM7ly4OBz2/35RY0mAXr9S5EUKQg/NifPXBpFuuE7d
	PIBC4NLx5hfAfPqtAVIU8pSBjxcl+h1N/VCIh7+MPFwAbDRSSyUp+uBsG64fSVu/
	VLCJB2qFAjicF4h7bASglNABMZm2PT6khALwJM13Gmagv120qnbg7glMac0Oop58
	Kn573MWky0RIqzHMMcEnw1o7SoefmqmlnYJq0D1k9W+HYQBMuqShtIgMRvbfjzzq
	8xO168vqvdqc92DiXBBV8rNRS7EMPwXdEvkxc+x2Ztl1wnsQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hhj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso5213061eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811958; x=1792416758; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dx+5DlXOJvegtnA3Kmrrw1qJ6BKbC1jFDAUZNCC1dnQ=;
        b=Dc08r1DCJEV4ntGlObtMTxHmHcrDoSLpt3F+Of1dWNjFqtXxDjvlO8o+Sd5Aba6gly
         d5J2seI0URCFSL+EIHTXPy/ioYVJbtmN6n7SorneetcVcyikAJbVHak/FUOk+7txRyU9
         x5TNrw0JlAvaxhkxohMBazem18ks+JFwvFuu4vLjfs4zFlZqapy0cpqJhPyNxovTBhsP
         SWl6EUsZqLI7Ax81LjMKdmsaRjl34SDVzNk1QNiOWTdHbhHzIlVbJpUMxYgNidS9aJrg
         czzeVc9XCCQto6kMYsp0qeMS7O/93ZiwRCBJvHr4rbw+YSDNXFCs+B+osy5MPFXXB+Cz
         WnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811958; x=1792416758;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dx+5DlXOJvegtnA3Kmrrw1qJ6BKbC1jFDAUZNCC1dnQ=;
        b=VvWTXW4OIDND3V3VJuouTr/GKeU/W3k/RzuprqQpgELML/JjAttoM7r/elBQFYDEmw
         MTFtJoLjitZSFrOe+jR/aLWOMxJh6HtdXgZuzlFSaC5t/gV5iHGqGNst/mR3e4zvKv//
         VlRoNZNvQSOGByVnQZmyNTWgJTxMi9VHBFWI8HHJseVTRoLHEwx5fB+xFWHWUAmQheay
         diXkhO0PnOruPftbL3Bwof7Wx4xzqZToMw+bO2a6ehmFL6DFa87FFm5eyeh51h5JDZL+
         rkNzjDA9YoLZSleBV9XFWpR+i2JHQlY89/4GrrJfLaJhmhoCle9+rophFzvIhOteEivt
         4tAA==
X-Forwarded-Encrypted: i=1; AKwUvBw4YpQcrow2BuoFIfAn/RGBU3IOizyQnzhu/zAsfQVQMO9vwTl05Lpmo06qVWZJIiiQ5iyp/XEc5EDzO5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/vhsDdb0yjTAesmN/+rxMrsqLGnR1CwdO93mT68wVlBmmzDcs
	FZLE6kM17ptoN84N4rBPm0I/MiwTGyIylF9ZdRnJapNFRmVQr1jkwyQmDqLVyNXZhl0ligbcZ0d
	qcXz3/dAKW+Pmjkn9LiPrb6vOf9xchhnhV3rO+CojNHThUTmmYc19hBMt/iqG+w2rRdc=
X-Gm-Gg: AYBFou0/FyATUq3WguN0dLhJFu73NJuQ3hfyGxP4cC7f2AgV1KJvxxMb37rSiNKaqk5
	eTuCMCPShoyZk1wVKwGV3MUnNhAQ0bK8gSzuy/U42i75X+mfPHPH91G7bjUm/UiZY+krmqWLLb0
	gBumw4NCuPJHRC60WxqMj5o38mIaJwea/Xq/Q5I1p02r9tdfx7IRMtoHkW8DfKbEabeOqV4oj7w
	ec38XQcB2fvDR0J1Oncuws6UwuBd7dx2HANRo+akDYaoaUhN5/9099Lblm3ST62jtH4XdEC6xdz
	KGJ8jiMIyK6hmXw7xKeC2MwAKkA++k3hgGh+jkeP9V1/pov61phJ2i7s2G8NcqD40nAkg1HQev8
	yXAoscXJbI3gZ7V1yKPkKiGKlEVY=
X-Received: by 2002:a05:7300:b293:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3537deccb0fmr13597414eec.4.1791811957890;
        Mon, 12 Oct 2026 06:32:37 -0700 (PDT)
X-Received: by 2002:a05:7300:b293:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3537deccb0fmr13597378eec.4.1791811957167;
        Mon, 12 Oct 2026 06:32:37 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:32:36 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 00/13] Add Qualcomm Nord display and eDP PHY support
Date: Mon, 12 Oct 2026 19:02:10 +0530
Message-Id: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrhzGoC/22NwQ6CMBBEf4Xs2SVtiRA8+R+GQ2kXqRGKXWg0h
 H+34NXLJC+ZebMCU3DEcMlWCBQdOz8mUKcMTK/HO6GziUEJVYpaShx9sGhDRDujFXWrZFdUmmp
 IiylQ596H7db8mJf2QWbeFXujdzz78Dnuotx7/81RokBSZyOqwnSyLa+eOX8t+mn8MOQpoNm27
 QuzrMGivwAAAA==
X-Change-ID: 20260911-nord-drv-dt-d09b21f37ae9
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=4153;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Oy2vFMavUsEa6xHikhMkIegRjj0JnZoJtqReLysfrm4=;
 b=D644PHpCjLdH/Dj6FjK44RlieTC6bfNL+J9F14dTxmv5/r02jogvN+83PcZOABhzJnUGF3F5g
 RPKi+C+4P6kBCEpWO68BDBq27CWTvFv8eWz0yLs+7RcC6h6Lo9qWBNO
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX1Ac8O8qCBEHd
 BMW9kzA+dYUF3EzcQvfRkhnSXk+qqYBCyuA1WMMgn7687jIEIA5a7QFZSqVgFZdmehTbM0ctwNT
 kDVx11aEzF0MMN9g5RsYQeR5SB/3I1qE3mq4gQ21vUa4pov36aPjd33BXkjPx2jZduDPiiCkpyT
 pyw3aGIE8o+lP7iLfQMAoGjnje2W7N2KXon3BWKxhclFDxef02IwQD1MnS1tUoCNwMHzDrq6lNG
 D4RMHHnavZ6Oq+lABXC1iwMbhn+2yCW6TlKm5gMHdOXRkNQbrrvrut1fJof/N/Abvo7jbPfxtmn
 uYFsLyZ2gtvVFxoT2H/I1x9Gsm3ebDisbV6eTFDn4xfdL+aWQmjBkWA0j5haJ2kj5+43GCtSiW2
 EY0GZBT283/TG9mXfiSEIUKqvxpp2lz/WJ2G3YCdwPGVBeiFlOLtp4O69KJN5H59KYISbAi3Aqx
 /wF16BUK3IpneQ+gKoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX3bNpCqX8vbz8
 RdHrWkPycXnwU43kuzfcoN9WIcZtcqGE8UZeHm9aKGyNQ2oSUZo15USaP0QuVc9DMGbpiZxUh3w
 pTM5W1uK0vtfx15IO8WH8sFp0R7TlmQ=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acce176 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=e5mUnYsNAAAA:8 a=VLagYuF82rudLD4T15cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: s-cZm9T2abwDkIkV0kmKAH1ORDBmtAm1
X-Proofpoint-GUID: s-cZm9T2abwDkIkV0kmKAH1ORDBmtAm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

Nord is a Qualcomm SoC with a DP-only display subsystem
(MDSS 12.1 / DPU 1499A) and two independent DP controllers
backed by eDP PHY.  The PHY uses a different register layout,
PLL/SSC coefficients and TX signal parameters compared to
all existing SoCs supported by the qcom-edp driver.

This series enables the display pipeline on Nord by adding
DT bindings for the MDSS, DP controller and eDP PHY, DPU
catalog and driver entries for MDSS and DP, and full eDP
PHY support.

Tested on Nord Ride SX board with one DPU. Both MDSS and
DP controllers probe cleanly and panels render correctly.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Changes in v2:
- Reduced the PHY patches from 11 to 7. (Dmitry) 
- Removed redundent comments. (Dmitry)
- Addressed review feedback from v1. 
- Link to v1: https://patch.msgid.link/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org

---
Mahadevan P (6):
      dt-bindings: phy: qcom,edp-phy: Add DP PHY compatible for Nord
      dt-bindings: display: msm: Document the Nord DiplayPort controller
      dt-bindings: display/msm: Document Nord MDSS
      drm/msm/dpu: Add support for DPU 12.1 on Nord
      drm/msm: mdss: Add support for MDSS on Nord
      drm/msm/dp: Add support for DP controllers on Nord

Ritesh Kumar (7):
      phy: qcom: edp: Add Nord-specific register offsets
      phy: qcom: edp: Generalize power-on path for per-SoC overrides
      phy: qcom: edp: Add Nord voltage-swing and pre-emphasis tables
      phy: qcom: edp: Add Nord spread-spectrum clocking configuration callback
      phy: qcom: edp: Add Nord PLL configuration callback
      phy: qcom: edp: Add Nord PHY configuration data tables
      phy: qcom: edp: Add Nord phy_cfg, ops and OF compatible

 .../bindings/display/msm/dp-controller.yaml        |   3 +
 .../bindings/display/msm/qcom,nord-mdss.yaml       | 396 +++++++++++++++
 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h  | 544 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  20 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/phy/qualcomm/phy-qcom-edp.c                | 350 ++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h  |   3 +
 14 files changed, 1319 insertions(+), 16 deletions(-)
---
base-commit: 693de981a44b0e7e3b6a73f0b0bcbae9c8d068e6
change-id: 20260911-nord-drv-dt-d09b21f37ae9

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

