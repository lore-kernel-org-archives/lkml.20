Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA093563E8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002921; cv=none; b=dHPzygUEcQoxs+EUIbaH20CM3ANvb8yXxGfd9PXOnKvlDcdfRvbSnnjPhw87IBs0Vb5iwczGTbm8TNphmNKfnW/y6zRoPxLgzh+EJFjEQInvJ9Guvpd5CaeaZQPYvu50G6td4shdYYJmVTKkLOY1T0o6m3jjhtAF3V/Ys/ob6Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002921; c=relaxed/simple;
	bh=SDq3/nEQKBMZ1T3IskkmMPRXQQna8pvfKHYVrixlIKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKYhf/MoJnQhkXMDJOJNTkgAAGpMAZjuKc/AtKgMBTqz5b341htGq1Ga3V0DIhqhHJY1elouYtMLuou7NzCYKhYY9P/NJRbq+7hRAOASxMHQTq30KzwJtOWpqXv1e/eKF8rlss6s3e3Sj0+opUm7gZsxGz8RP1I8SIDYigz4U3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plEDX3iA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zxdv7Gkv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plEDX3iA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zxdv7Gkv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9TI14076007
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TcyNSAMZC//xVH9qquYthMcknQJKP5aSIvO
	Zl1B3/Ps=; b=plEDX3iAFsnzhJmWyJ++S8JZUnR4XWzeaRxjgXtdik05k1g8xwr
	Br2ybuzcldZFGvla8dby0kAM+7HjhtSghqYjOmA1MY4FT8mIeu/9AnOeh4e5Umai
	67RLkS5PFsjLyny0fb10BV4uTgHolZQcM+4Yf4olkkZ933dwmWGRIGKxrDnw8VSw
	srhvjcAOO4plsscsOT22V6SyyfeqMhzuOYNO48JM2wnf3jDQ/JmIuJ7XJrc6jsSe
	mHRWjsbKjvQ4Q+tca/5quQPWjkIWMGdvdBGhEo7cOLAi+qgKaRzuYgc97GZrKGqJ
	qmm2jfxWtcKj07TurP9InBdtfvw3C+zTmGw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydhe6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:15:14 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b19eab8bso3910420eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789002913; x=1789607713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcyNSAMZC//xVH9qquYthMcknQJKP5aSIvOZl1B3/Ps=;
        b=Zxdv7GkvoEajGVShxLZdvm7qCd+JYLPHxAvOA58UPidrXB8cgMR1SSgzpmPqQtioU4
         CPztk20QtQbAp4rnJdFHT5ZQ4qEDNPHKikqaFhhnkP2w1P97ba2FaoCAigqcUpLwra6D
         Iex0HuzgrA1abfIut9sOUVE7dOUOLjrO3CANUeGXWdEP9N90P0DW0UrU73id0SNi2LAz
         8Uu9x2usKoMbTet5l1FGNnmvtmhjKBPayerjinQoGsijlvI0+2LkRaUmknsiomRqu+pF
         Jop/rWjSA7ux9CacfZZi61nN4BEk0GsA9hT9A0tVJT9rbkxk7BLvQVWBgwND1MfPIlID
         MkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002913; x=1789607713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcyNSAMZC//xVH9qquYthMcknQJKP5aSIvOZl1B3/Ps=;
        b=lKXjqVGijRMJuDApbWDvt54EpKH/ihc6oAxUDPEGlrM6hTPyOBx6UUtRuv4cT8+FIp
         uEYhEIjCAar8pPSixo/EEHJYf9pDPLtV1cup2PYU4O087FmfJIyfNXN1PU33JfOkNkAf
         G9gr6vjEXRkzZPypAz6uIFb7tIhb2yLsAyzP9K0lJMTCxVLVh1UVdiNHvfXnq+VKTZ3+
         Eg/0ZRq9UHkWQuv1JFSYCj7zZfcBDU+NGgJ2vvDw2bl2vz86OidaE9Gp/ck5OBGHKU7c
         Dqp4OwCsaIDlIMZfr1lku6bI1J4FiD2sthii9nhW7bbZQFoGoti73arbdSyV20ThhhLx
         vKaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1/kKWNRvnq33Lxt2LIouJS8URj8fJFKboVSWKMw/kka8bXa7m4Tv+HYUnJRfXxZjGwF3k/AykFQLDOXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kRMsE6lZuZtbKq5M3humcAz+gWWMJn9yroSq1px0+/IsiNVR63
	o3Hc7ZTSK85KENxScKeVu1eNXIC9yATEYR1YBRFuWrBhh3qJNdMheD/kQ63stnjaQD6syWv9MkL
	zq8UfrExiQL9spO4Q1Wgh1aM4Lu/7s3uB9E3yK5igdwoajtxTxLk/7X17Ook2GisUD1A=
X-Gm-Gg: AYBFou0AR7jfRcMjSfVkNj4CExHAXU/XwNvmaYrhy/h5kcnFYA99A68r5WYzUpzLKAr
	Ol4RwFHYnGqSEXl222FXAC9g1LArwIpbNgvMWIR7jglLE7dQeIrYKJAng0PB8Y1bHCrvowJcfEj
	UArD2TKXYoXWfrypE+o8ubl9vFkQLLdttcg7qTDt3vBCIEAm2Wv5Nhm/9br1liJAFdA7FYaUO9o
	m3SztgqEAwVvYjnpwzrnVulKQFXVi3vsALKGg+yHBYW+2pJr2WT0rdMRMKvBVr2bsbpjpZ37dAq
	Dnp54JrgeS6nb00asulWcgMRzZKhSQRzuPRkiRTLHnkmhi9ONmIV8Z7gB6muC/MFnlZbsChuW3B
	2aydlReVDrzjIuEx9etE/lxIDxb1CGs5CgbRYrHI/JCQa6EWe++sp77wOZr35
X-Received: by 2002:a05:6820:f02c:b0:6b7:8396:f3ca with SMTP id 006d021491bc7-6b78396f950mr20792487eaf.44.1789002913605;
        Wed, 09 Sep 2026 18:15:13 -0700 (PDT)
X-Received: by 2002:a05:6820:f02c:b0:6b7:8396:f3ca with SMTP id 006d021491bc7-6b78396f950mr20792462eaf.44.1789002913243;
        Wed, 09 Sep 2026 18:15:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm15284220c88.7.2026.09.09.18.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:15:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: qmp: Fix alignment in pcs-v8_50 register header
Date: Thu, 10 Sep 2026 09:15:00 +0800
Message-ID: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxMSBTYWx0ZWRfX2+sI62K89yU/
 4frN7K3yBRc70Iq9b+IsSd4QxNDcFsLr5Vgs9JTiUZ1WKv/sgy/muO9hJHNFfquqtUIuLLQmqQ2
 bSpTqsp+SMwiuC3ohPCXacTyJad4Y2U=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa204a2 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dxXbasm6c_75TwCK60EA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: ksSX0uUK5-HV75LU39nkvsiKVxs4d5a0
X-Proofpoint-ORIG-GUID: ksSX0uUK5-HV75LU39nkvsiKVxs4d5a0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxMSBTYWx0ZWRfX+yCgPyK9ovtJ
 d7V5pPABoaeDawNAkYjHNARFmN1MSQKS0oMzGjuxxWuPdo8Zllx28ZTgFZ5rUDZeSparNdDRmyT
 gPlYgH8Nap+SX3rsSa7sMIMPnsuCPCkWkZ4IleHrDJ+pFhe1SV15vHlxKOe6OBfndRcmUGiEUay
 NvVpSvp5wg1Cast06thhlYxOxU99cEOfRDztXiLnF/O3sM9721p5Lv9j4NwIXOVbJmw91M9gtK/
 HtK8zb1Y2JB3XJkjI+0HCjaVFzh9okrCUpBt/VTIslnT7rmBi2+kYTXweKabZ3n93MHZElnEmvq
 XTL0a6p42fJwaj6AzfElgeqpw2JL6miw7TMRROY6aEgF6DHejUyANhsMM55xYBiQDLcwXoRwMJm
 PkcY+v5U2z/pJ0eApIwJZUHrhG5bFg0yonM7OsY7xU3/7tqFZs2qz7GbCUSCPcdf+zRTFQmjPSb
 O8DkC8Xlc5JutiYY0mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100011

Fix up the whitespace so all offsets align. No functional change.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
index 325c127e8eb7..f094517ae3c1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
@@ -7,7 +7,7 @@
 #define QCOM_PHY_QMP_PCS_V8_50_H_
 
 #define QPHY_V8_50_PCS_STATUS1			0x010
-#define QPHY_V8_50_PCS_START_CONTROL			0x05c
-#define QPHY_V8_50_PCS_POWER_DOWN_CONTROL			0x64
+#define QPHY_V8_50_PCS_START_CONTROL		0x05c
+#define QPHY_V8_50_PCS_POWER_DOWN_CONTROL	0x64
 
 #endif
-- 
2.43.0

