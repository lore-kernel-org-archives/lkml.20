Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BD130D402
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354063; cv=none; b=rtda0CzcIHNwtGeUPFOaSNZ7W9n8Z5hfcgVVK7inLwrbpl7W5T+gIeIvcDx6toAStT31uIBxqoxJbgm69HYQGqG3ScSa1bqI2jOaQI6F/+Gnqu1ipM2/PURO5Bx4BruUDw4NxcaXYcJFsLXhqFJPn6UliUCjyopO2vYS/sPH5AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354063; c=relaxed/simple;
	bh=a6Yno54nqHU7cYDlu6Q0S8ox9MzBTtsgFRIu4xEYyqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bmk2U6IsjuaqIBLcLQPmw/Xw3JdZrQVdpyJE0DtlNCmBF9NDHgxO/VWo/RUERoYaXx5pQE/7Sxo8OnvZJRy0XtGYlgrMQCaFxXaT9O+enALzqhD/s2J0w/+upZem/bPAW+P9ORyErBTFXjm5m+wRN+aRa9QTBTNvDrcXaTNCxmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1AHyY3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB7cEFd1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1AHyY3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB7cEFd1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2f0sK3349270
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fXIWh2otWlZ1HqNX2hTmG3
	Ruod79Zf3T797/xBE0vMk=; b=Q1AHyY3wsr1nJmTuT6T4Rv9xsHj/s0kApSncWb
	leAZy2rXrQLLVDL8v7az2DJtgUYTNmNSrHKXfuaNcZgNpHuve0rZcrZzJ3P2GNLy
	z+AEWnZoVnp9uniLlT5UjE/ysBgRy4P4O8fJVTLK0ZnSg3VpLjYvqn4CwCi/15+M
	ssuUGdIsBYgWwi55rhKOXpbSeaThHayw15kydc+2ms6euwqyFv73eNFQtIo9EjkP
	5XrWl0rw/m5FajhXp7HwQC3r0bNwwsKYHeFH1fW9TzEn+m2y+dGTtUs/tI80twzH
	u/4d+PenReG6OER2uBcJXi8QwPjo3zA8gjvOM6S26V0hh0Pw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dcq0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af306c795so729208a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789354059; x=1789958859; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fXIWh2otWlZ1HqNX2hTmG3Ruod79Zf3T797/xBE0vMk=;
        b=FB7cEFd172IA+PJIntxLCqVl8jckMA8Ek9+PYL1glRc+8ZNEWm+Od2OYVrmyM7IXur
         h9Hc0bimYL16+AfbR45H16XOFdm0XmYFrCZ3nq+c9z2QRfXSIF9EPCCVZItIAn872bT3
         C5sM6AGzKLl4QTv7iDyz24hEKsNmux0qKio/hNaI0CqlozutK5nKXMC2kG7x23xGvUON
         +wa1azT2C3QB1WGD6uu2a2xXijp3S/IBcqBiKq3TbzvMGAy4uybZeGWSm8k0qbiBRPTa
         sT6d0xIXg/WwnQKdBVVZYXmE4Tx7SBU0fT96CteJejXkCfx6DMJuUz0dFL+yOSfqowzW
         ziNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354059; x=1789958859;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fXIWh2otWlZ1HqNX2hTmG3Ruod79Zf3T797/xBE0vMk=;
        b=FKIxHqPSnhG8gGe/hc2T3nA+dZ9JXeKwBWDKotKkq+5vwGPfRT/v+Lqo5xNGNc/JI4
         8+Qk65kWfDSlctZRPLnvRD3JFvjjSYPiWZADklTzOqQBPWe1byt5BVKuSYQjH+W2f1C3
         UScJ9wgO1eID7nyfzSRSWxVcJUvZetTXp+xz5w6zuutACa2XilNu4mNHHublyT9QjEHp
         t6PAxOwOSe8gV27dCLOvDWabMSqmp5kE2581jAQgGfq09FJIKAPLy5cV538ICAsCsgEQ
         kpM7XdLOuw0IlUxV5ou7sYE7/6uw9cBks5+IpxJ+m6ZKmkxVw2fwNWDRrRrmrHeEgLsy
         wf7w==
X-Forwarded-Encrypted: i=1; AKwUvBz2qGBu4ygMZyU2AvAR9W8DUZD5hmElysdqaGS4BP4k4ldGIPETtVuGViz4EJ/LO1etPyp3q2HCrYHJF+c=@vger.kernel.org
X-Gm-Message-State: AFuF++lmdHHXEUUXru1adp2RP5SF/rT1CuZwYqMGJ2zhzC0o+QrK3tM+
	p2PIDPQmGttoCeF2lJ3QNjuIJ0hrboRx4a/oPBrDn/kCwvjshponHGRBj5WdnKbgiRZncz2tUZy
	dOh5ub+rso+O6LC2+QGOlOIxkOpSPG6SEHgn8xCNFEjnPDqxhPdVjqg+WMAltnqoDPZzM5Ys3vZ
	4=
X-Gm-Gg: AYBFou3u2xPqcwhzMrjAQr+toLDq3T1P+wHvk99MCj8bf4lqdO42WvfLxeMVdT2b+tx
	T+oI2oF6d+GitW4b9h2PZrhLucXWug3UwUBiZDEvBb13ujUZYEoPRM+TNh5DrHTBmWFKUlOtDHh
	Zko9TrTKYaanL3xXaqSyLYG88TaW/q61dHl6BoA42OPwZYkr6KZGpE3nGqjAIsyWP+HtHsNzcwD
	x2U5maGaRPH5c3jyIx57VHhOG+8ovH6UuyPCoLzGaxDOiqr4zkM6IKAEp+bX06T/6Pjm2OHjb7P
	iC7U7EuBX8539im+5axpXwi/tnO+8mn1PSxAgij9LuRpauYsJxMUxliJNrTuWmbC88Ox3PjbU+x
	lp/lrb22ZeCBaQWgL2R8/wmWvzDElnA3s6rUSxbTXDlvQllo=
X-Received: by 2002:a17:90b:440c:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39dec137c0emr909943a91.3.1789354058906;
        Sun, 13 Sep 2026 19:47:38 -0700 (PDT)
X-Received: by 2002:a17:90b:440c:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39dec137c0emr909916a91.3.1789354058403;
        Sun, 13 Sep 2026 19:47:38 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm25945014eec.15.2026.09.13.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:47:37 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem
 QCC2072
Date: Sun, 13 Sep 2026 19:46:42 -0700
Message-Id: <20260913-btusb_qcc2072-v6-0-137898715844@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJgp2oC/3XNTQ6CMBAF4KuYri0ptT/gynsYY0oZpEaotNBoC
 He3xY0xupnkJW++NyMPzoBH+82MHATjje1jENsN0q3qL4BNHTOihApS5gRX4+Sr86A1JZJiqWo
 hODAuiELx5+6gMY/VO57e2U/VFfSYkNRojR+te66DgaXePzswTDDIoiGskkJyOFjvs2FSN227L
 osHpYnAP5H8G+ERYZRKzhoG5a74gSzL8gJzqYVCCAEAAA==
X-Change-ID: 20260910-btusb_qcc2072-7ad665e4560a
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Pauli Virtanen <pav@iki.fi>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXwijaDJhULO9C
 U+UE5umJ1q9NIF59Ta8dO3ggTzTE2udQs242eXy0g2Xcet52lUl84RZSEpvLp7+WoNY/iWYcXi8
 zEAoWP+vy12MEwNJyPZu49PhRedZfzatHrAW5TkM6nYNidOXnAhtkbLr3hlgR1ZwAYAveOTAITo
 qMOC7JkmPGrTYVocIVlNl5RxFGETGKU8TMKRZGHsw3iiJ+NDIn4Oj7l7F9B2eSW9D4Uh2IQ2sXd
 GvtmhuuobGXtnhuXHKCOj2SC8mE28fUzqdLEkbVEsdb22buK1mPiZ3O6hthXbgOKkqQ6MtYDBM8
 HNMpf8/KxNM/LiCniGavvweGl9Kjkq9qFktBKM6bhi8txeUlfOzT5b61+vWoTDacNP/RAvesH+o
 afLBZUZwcqS1FnbPH/lVxKYnXd4ajF5TgvqqoKFpboiniNIIqz7vRRSbRdSIvzRWkMdjAA9J+eQ
 NZ915Z4W+nXpwLUIPmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXx2Ueqc71vWZw
 vbT20jUtVfVixfLka1xqMxJ5AaGUbJ8lP0H8ZGOarwjW/7PCRrl6my6HJgb7CBKYEH4qqfPCkyQ
 wb1YOQq/7M/Uk+7UzKqN9SwWpSbqrK4=
X-Proofpoint-GUID: bMGIMB4_1kOT7LqWrQLhgb8w7hZ8fP5w
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7604c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=GzXLaGhZt5Xyy9u-jrcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: bMGIMB4_1kOT7LqWrQLhgb8w7hZ8fP5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035

Hi Luiz,

Thanks for the several rounds of review.

This revision only adds a minor annotation to avoid LLVM 23 warnings.

Could you take a look at this new revision when you get a chance, and
let me know if you have any further comments?

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Changes in v6:
- Add a __context_unsafe() annotation to avoid LLVM 23 warnings
- Link to v5: https://patch.msgid.link/20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com

Changes in v5:
- Fix status masking in qperi_get_subsys_build_info()
- Add inline comments addressing Sashiko false positives
- Link to v4: https://patch.msgid.link/20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com

Changes in v4:
- Fix memdump timeout blocking btusb_qcom_reset()
- Fix missing build information on driver rebind or resume
- Link to v3: https://patch.msgid.link/20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com

Changes in v3:
- Remove socket option BT_RECV_VENDOR_PKT
- Fix heap overflow in hci_send_vendor_frame()
- Fix a stray NUL byte in the memdump file header
- Fix PM reference leak in btusb_do_reset_work()
- Don't mix goto with scoped_guard() in __qperi_tx_sync_evt()
- Don't mix goto with scoped_guard() in qperi_handle_evt()
- Prepare btusb_qcom for bulk serialization mode support.
- Link to v2: https://patch.msgid.link/20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com

---
Zijun Hu (4):
      Bluetooth: btusb: Add recv_intr() hook to btusb_data
      Bluetooth: Add generic support for vendor packets
      Bluetooth: btusb: Build the driver from multiple source files
      Bluetooth: btusb: Add support for Qualcomm multi-subsystem QCC2072

 drivers/bluetooth/Kconfig                   |   14 +
 drivers/bluetooth/Makefile                  |    3 +
 drivers/bluetooth/{btusb.c => btusb_main.c} |  127 +-
 drivers/bluetooth/btusb_qcom.c              | 4557 +++++++++++++++++++++++++++
 drivers/bluetooth/btusb_qcom.h              |   99 +
 include/net/bluetooth/hci_core.h            |    5 +
 include/net/bluetooth/hci_mon.h             |    2 +
 net/bluetooth/hci_core.c                    |   45 +
 net/bluetooth/hci_sock.c                    |    8 +
 9 files changed, 4858 insertions(+), 2 deletions(-)
---
base-commit: e40edfa049b967f0b9379bf549c59431302ad181
change-id: 20260910-btusb_qcc2072-7ad665e4560a

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

