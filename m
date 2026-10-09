Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713873D9526
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529132; cv=none; b=EvlOPUSrbyu7jiUN1nBtkvbMWr7HwmgQTQQH17RCB2Ld4HSAXcpRchBQK19BbxWwb2ji7n3UpPlqjeLuR/tDKSGBL+Vr5fxz5ZaLurXrCUg2Xd1xsIVBZZ6Sufa7jcUbrApDApUhytwdVHZgCzjxEjx+0LswqPWsiigNgH4Jb7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529132; c=relaxed/simple;
	bh=eKy7aW5cGjwegx4nzL/W7tmnNG2iMKFhFizCpsDBd1w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TkR+IMBXTWlHAxUvrikOsPWU7iR3fnrs4XTGnsf12ob2pPOQlJx4yUVqXfNrF62hUt0OL21Lf5AT90nFPOCGqi3XgBUojGVXbTENOXCF4IHTX1ycE3ETaj+aWOq/06O47iDBpeYjg7fGaMEj3LdlAuaM0heNTcSoaCGDrdV+U8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y30A0ZqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iliolux5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y30A0ZqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iliolux5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HJ2E564687
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4EYWCqhhTUL7OpT9NVgvbM
	UnffT1MdTryqJzCFDDtL8=; b=Y30A0ZqYdd/gkzx6Orn0/OWeJBI9y+DesxeSeq
	bsLFBcqYTUWPT3/XaUeKsCrxVnVefwJyYnEAYMDbt4g7KORXWfehhAI9S+a7epT5
	bFcDtNnQOs1IERAavPRKBxJj+vR2E5XBEdUPzqro/rZWcMeV3FLwwipP6qtKZUPt
	nMBgzgSABJINDa2W01ylJzuLrJEDADxXt6v+kNKnZd1553uyDmQUNCH2u7YSZwoG
	3j91sxK+LDC0xyiP3RbTb3+1kZO2dVQ2oaHNfjTkZGqO6ZoI/7gyM5nKEr/agXtI
	0s8KF6PeQ5b0hYfpviyS7VpqFqCbuHAYOlxs54SaPcOW/dhg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxka8um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:58:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8884a02ee85so6429151b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529129; x=1792133929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4EYWCqhhTUL7OpT9NVgvbMUnffT1MdTryqJzCFDDtL8=;
        b=iliolux5QcY8/cwrtEcZC5dcsQiY3efXw2fBUdZhEbQhcK/dJOTVMwLq2XEqAiE17B
         4XlS4Ph0EbUxWzA6N8GkoU8sO+yoJpLJHohu75Ap5Pk0wlQw+OE+l7YQFB43uuFOJsRA
         2QDQpIe0TIsl7PB+FHBDh9Ynfmzmj1xmxr4nx3F7Y3sI2uBmquF1YZZfwqttgL7fa9vC
         qB+XpxVVJ4uStdzzs5FUtWYR/EKjVsLQh2sdxm8HfoItSaw6cSTJ8cxOO+jJD5AWwQt3
         pfKDRTPBWPOumlUizEoTAL1ZLO/9Nj4V5/ZTG6qb9k7xz5BYZN7LIQ3ckFWvBstKkD4/
         dmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529129; x=1792133929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4EYWCqhhTUL7OpT9NVgvbMUnffT1MdTryqJzCFDDtL8=;
        b=VPBtm7KkH6yta5p5ycGnA6LioI05xDQn0pEGyLGaD38VzjYSSUYPczYeGbaMbXeuYS
         lAYot/pe9amlXDiEF0ZeJ6a1YCTLsMu0eCCIXLonCPRC0S0H/rUcJN/VSX1Z+lY+80yy
         sZgFQpkGmH48MYhp/nq4U2qJ0BHsjqMEl42Gf3LDRlEjwFLxpEMasYe4R7e3icgOYVHX
         WOwStvuNZz/QDLk3CJqRm8GhtY5aYrTO99nmEPm3hb42gQQBQ/pHUrQeUZinaGjUAouQ
         Tm9W9Ikdq1cUK+at7QvJ4V7aCRyRENt8qpk9qk/zIv+uOziiIIYZQorycxfWy2IbkCTa
         JAfg==
X-Forwarded-Encrypted: i=1; AKwUvBxdtFqcVDGZW18lGMA4+XnVzOs9GJ+QUndHJi62ucUxbkdb+Y5u9zyvJ/zH4x+F9PK2IS6PmLFT6+Sg9VQ=@vger.kernel.org
X-Gm-Message-State: AFuF++npkxUl59vYB/wf9ZtX5nXgSLhcLkKq8IFDx44LAR/7h/Fc+FT7
	g6SXtBINJsFe1Cu9gYnYF/NuKUJL8ExlIJDt0DEvBe4q0eLB1y75y8/0iDF4xQ0S9wZNQ8fU+EU
	1iTpsU7Mn/Kjx19TBak6t9/jBZIcjl6TXOYtRNWVoYBCatq93EGPpXh9rPQpmqDF9EdM=
X-Gm-Gg: AYBFou0WFx5OXISBhFHxi41Mvbjv4z2ITvF2DZxkQtop+7vzFABukIq0hyXeCPzEh2d
	iWaVqoHpS/2HFaVtGvCt5ZchN7DApFS/bZRE8k0el0XAoztQZhDmMJdhLVHiIW6dmcfn6rkWo7u
	VZiKZYwTcieOtD3hMHLij5Fwjlb3HXY/h+veNvgL6tS0r5RL//Z/w2rHrOFDeoZHdVEmcBufc0B
	CqCs37pBb2wqhxu308oH3q5hxq6Gd6M29Y0Sd/0ptEvC2CPlkFCw4AbJMWozFAiO1uWiEyr94pX
	3DB5mtJusWdmiDlIvyszHyanq7r1/YcLrqlOMn7gM6i4QNkP0Yoj1X5rouoZjyc2dLhvOPT3ff7
	20QVBeJ8eV3vv/5oVQ+WL
X-Received: by 2002:a05:6300:2290:b0:3dd:a007:cb2d with SMTP id adf61e73a8af0-3e16be44435mr752863637.41.1791529129175;
        Thu, 08 Oct 2026 23:58:49 -0700 (PDT)
X-Received: by 2002:a05:6300:2290:b0:3dd:a007:cb2d with SMTP id adf61e73a8af0-3e16be44435mr752839637.41.1791529128689;
        Thu, 08 Oct 2026 23:58:48 -0700 (PDT)
Received: from [10.213.103.163] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e088efsm499980a12.11.2026.10.08.23.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:58:48 -0700 (PDT)
From: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Subject: [PATCH 0/4] tty: serial: qcom_geni_serial: Add GPI DMA support
Date: Fri, 09 Oct 2026 12:27:52 +0530
Message-Id: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCQyGoC/yXMwQrCMAyA4VcZORvIOlaGryIe6pLOCK6lWUUYe
 3er3v7v8u9gUlQMzt0ORV5qmtaG/tTBfA/rIqjcDI6c74kmDMy4ZEV+BrSacyobxlSwhhbjEN1
 INPiJPbRFLhL1/dtfrn9bvT1k3r5POI4P6CsuDYAAAAA=
X-Change-ID: 20261008-add-gpi-dma-support-for-uart-53f2500368d6
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791529122; l=1956;
 i=naresh.maramaina@oss.qualcomm.com; s=20260316; h=from:subject:message-id;
 bh=eKy7aW5cGjwegx4nzL/W7tmnNG2iMKFhFizCpsDBd1w=;
 b=l5g/hTqngweTjeXJIqJaTcnNRfYdVfYBFtN7DqdkZc4UXHijLsdkAC3AjuumT3OhIdAiqJ6ZU
 Plx4SATFpBkD29JmeH6qNbeWpJrS/0Fvs3e5ThsUDEZhULKSLlwF3A1
X-Developer-Key: i=naresh.maramaina@oss.qualcomm.com; a=ed25519;
 pk=j7iST9yrLbsgWcWrqdlUNIOWl2WBl4wV1q35/n9SCkg=
X-Proofpoint-GUID: ZzY1BhhKFwVv0zt1yu5hqtaPh14ZbrEO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXwGnMVgbKOiW4
 LKRlY0CB/fYnP01rVEXJUBjcZABrTWgdoRC9K8q+9893BhivkbL1YKe9HTRjxsI3T+/OUD1Adyh
 E7W+u0vT9ChRnxqvQqc9v/Vns0AUd0M=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac890aa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CXWnIO0hCF0je_3tyHEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX9MmU9xWQa3Tf
 oPEJkT4yJhjuUqxGOTqhjdhcjZvKBusAFOLRuBBLsp3ios+0h94TO+W8N1WwiG0vus8J1IDhp3f
 6Rm8b6AkfNGod5Nsr08DxlixCXDDPQFHYu5QQU6dn7kW1rqSBAVtSZim1xiQYYFFaieF7uPvs2k
 M3/HtCb5iSRiC0js0o7EJFTa3Ox2B+MGuVCzDn5QDlaWXNNyBEojCrj06AGa9geJFy+rzlHpF3o
 kvjbIE0/YMgH2MJ2e8fePVGzxgcZBu4DL1kEdvtkXfGofuHAshbVyhW2opi3PCTMyyzv1KyUQLO
 nDtMjCa8RSL1bPNnq5iKRWkBP6sSKxsbqFqTFJB4druOCwo/Gdf24cP87yf1OrF9j6iZPT6wVgY
 smoEqJFAUHRSF5y9inlPytzK4giaWu8ajZEhsuoNDEejDJbejwlxb2oQhCJgKWTJAu1C8JPGDtJ
 EOaK38uYoJvGr1gEX0w==
X-Proofpoint-ORIG-GUID: ZzY1BhhKFwVv0zt1yu5hqtaPh14ZbrEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090027

QUP serial engines support FIFO, SE DMA and GPI DMA transfer modes.
The qcom_geni_serial driver currently supports FIFO and SE DMA modes.

Add support for serial engines configured to operate in GPI DMA mode.

The Qualcomm GPI DMA driver is extended with UART transfer support,
UART-specific TRE accounting and handling for transfer-completion
events generated during channel cancellation.

The qcom_geni_serial driver is updated to detect GPI DMA operation,
manage UART transfers through DMAengine and program UART parameters
through GPI peripheral configuration.

This series currently supports 2-wire UART operation (TX/RX) and has
been validated across multiple baud rates and transfer sizes.
4-wire UART operation with CTS/RTS flow control is not included in
this series. GPI DMA support for CTS/RTS will be added separately
after implementation and validation.

The series is organized as follows:

1. Add UART transfer support to the GPI DMA driver
2. Calculate UART TRE count per direction
3. Ignore cancelled transfer-completion events
4. Add GPI DMA support to qcom_geni_serial

Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
---
Naresh Maramaina (4):
      dmaengine: qcom: gpi: Add UART transfer support
      dmaengine: qcom: gpi: Calculate UART TRE count per direction
      dmaengine: qcom: gpi: Ignore cancelled transfer-completion events
      tty: serial: qcom_geni_serial: Add GPI DMA support

 drivers/dma/qcom/gpi.c                | 153 ++++++++-
 drivers/soc/qcom/qcom-geni-se.c       |   4 -
 drivers/tty/serial/qcom_geni_serial.c | 576 ++++++++++++++++++++++++++++++++--
 include/linux/dma/qcom-gpi-dma.h      |  33 ++
 4 files changed, 732 insertions(+), 34 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261008-add-gpi-dma-support-for-uart-53f2500368d6

Best regards,
--  
Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>

