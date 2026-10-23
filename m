Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756743;
	b=r6G23l1ow56w4elG/5ws1AfiJn8H4xgyWTy7tiS5zdwCO6JRMjkpStJQhf1xsUrR5ZwA
	 KZpdycPEon6oQyyQpUDbCc158rQb0G1S0IM96IfszyOseBvu72pVynX+lI2eW612tB/8J
	 Hh++HFnykFb/0qJKD9BcMGNL2NtMhXPopVLKxsXQzCLH6fHeeDCSUFATCEvUDITpEesI0
	 M5QaggkwCmROg7v/3vROQMYBfCvIEnsUbeZ9Z0m/dd+KXUSK1hhmuEhTVfvcL0bco7znr
	 j1KzkCDWJSX6Y0ewVB+zH0kxmDElx4p9XiVKaZe8nvBZ2SVg8CLjBOjQfUnBbfswA4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2bw9E17RXi+krJiTDPyGtQPi52S/lX069ydJNo7pBSY=;
	b=2l1xTYc4J736bRujbQjbr1vOoKVaMRutH5wmZNMAJFyoedHAqdhCyXwj99wHIt6SdZ5K
	 9Za3EdjT6tiapOVP8qK4s8g8p4SKbMHsbjKGMMDpPHeVF74QWYK4m1X7ebKfTWdvEiJl5
	 QzmRmy6VuU6icVMa1WeS4g+fI+00AJdmmLbkRID8LidaTmB5a0xkOdNmqr5W+Uonawjr4
	 dfrYcnhvQWrjnt9MkqVWg3ehPV2mzvY/3SSyGup3sjMvi9RI6JSUlG/9OH5fjgtGjZvPx
	 znx2mh1itifYd9vQD0q3FQ3/pRFl6pKNQFmDc2XJ0wVpAXAKwH/yMQLY1xsdQi+68pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l3wfenE2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo65iNhT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83970606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83970606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l3wfenE2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo65iNhT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYTg2489870
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2bw9E17RXi+krJiTDPyGtQ
	Pi52S/lX069ydJNo7pBSY=; b=l3wfenE2ZHB60CPyIma8/VkDkD7J+qYUwMli2w
	frXoKqLyTiIByg4qLJyEZ+iYf/uJErnM63B/V7qDmJYkzYJC1oOvGRkPMG30iBzz
	OcEDvUQtsd17psLytKADqiIMFJQ4Sb4ceJbRbESEtkjO22ljBqSn5ZifvawquF0M
	kJMpSpMkAhDi0SUBjBCzvL3cNiRUTFaX6AG+TWkiEFXGZICDOOkrixEi9nvhbbf0
	I46LwY11VUTX9qbWR+rYvE2HVoMXAbZ6Q58YXNhZFuQRWtCW/skcbTU2V5xc2QFW
	66GNldT5z7FTCLhXh+7Im5HPUQVQV5ealMOMvddKXTM3HTjg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygar1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1422803eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756740; x=1793361540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2bw9E17RXi+krJiTDPyGtQPi52S/lX069ydJNo7pBSY=;
        b=Jo65iNhTn/zYFm/xYxmvcjShWFzKZpIefghGhTA41xUlU1qPwKOE2GS9WVOyq1WmPx
         ZnWG3Kfp5VMa4GR8aP3F5ku9yIpQxlJVUCclDNSSpoYCc7PpM1D8Al6qmxO8DoJQ2iIb
         GpqrSDXyRQzWyCvUCRn1/O2HrUZycs5J2HlPVx0kga2+yEd1BvZQN/mBckKIrT2v2wpr
         7NuaVpHa04+G6ig5poxgQi+TKFBW1hazn4xqryEtRqriSbxQywrO8dSbF81lhjgn9l+4
         CWkv//hoN5Mlc4WDZv53nSUirATixTEyaTFpyc0NL94J01/x8nG5iVU5nvrEHJJHGLU0
         Mucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756740; x=1793361540;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bw9E17RXi+krJiTDPyGtQPi52S/lX069ydJNo7pBSY=;
        b=1muosh/MT47mPo0UlDfRQXUuv4WIgwP3qvThj2OY1YpBT0uQIr0BNh0fh975dRb7i8
         AnVdW1a1QvE+up7EqgLXQ6qOg/Vj941U9osuaUGazQ7sXQ7Dami+Po+DvJlBCM+CUkJu
         VOTY7PsajTvrymCjKsWh3vQcugl7iBZ+wq+FJaZAxWkcDb0YiZzpFbNJM31X6/srEKsH
         tZlVeIYk0DV/PijgfD5Hsw1nSFaAugFDItldVgSnhtt6pkI2GuH/l7NOI32DkyQ/Yohf
         NZ4UtqpaqQrzMHxfvBJwF6+7xXStp6CClF6bGhbDztvor+xz//z6SqLHBeYlJRT6rUiF
         vgPA==
X-Forwarded-Encrypted: i=1; AKwUvBxdzSOgKqwaqIFGNQwVcrkMG8p2xlg28liDT0Z5fTVB4r+pqrBBQS3sQv6wso7ld2g7Z/kK1xATJZeymsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp389u3eAROeeD//E6+gplGjQUJC5mSVND/KO1eKlg8wMWpRY1
	GsjfkEZLp6R1vlkv/4wEhGFBLp/MVnjUG3Fum130MhrYWsYnkKmpHYVwZF/hNRDnWpmdOocjNe7
	29JfP/i9FDPGAJLIw7G44593ErWHvFg/lQisNDa2F/bivKz+2cMq19VwChwXblreUJEU=
X-Gm-Gg: AYBFou23VWjzaBuVPdf7cwL4wzPaxGllIFHKD3DHub2WzOS/XhNX5tSH1bbSUXdjhES
	r5W8VVgpAkhlbxbFp0T/MzBbMTRJFx5JwriaPBeO1pNBeJZGJ24K12Mp6UuBPdxQu7SI067Ei8P
	L0ebj9Te7GEzTrsOGZwvcTTqA5f2N1opx/F3vDPfImFh8T42ndEu5RTvBj5pLTEzTDpgMtFAifF
	unudLUacvHnFESJtCxAXoHF7aslNG5WaGVS2CJ5BApfbQivTwpRJrMl5u6HivbbSAoyqAvlMzul
	1bN/RENgWrnYBlHZMclOlOr/Ty9T0cxM1HJSbYN1Lwc9zhwP2Qg2C2xAo1wRT/fzrzijk1vAbrW
	JjX42Ligt+E8oi3i7MgA74newe8/s+0u5Zg==
X-Received: by 2002:a05:7022:3c8c:b0:195:33be:15af with SMTP id a92af1059eb24-195c77a5924mr2026543c88.40.1792756740025;
        Fri, 23 Oct 2026 04:59:00 -0700 (PDT)
X-Received: by 2002:a05:7022:3c8c:b0:195:33be:15af with SMTP id a92af1059eb24-195c77a5924mr2026513c88.40.1792756739414;
        Fri, 23 Oct 2026 04:58:59 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm8786134eec.5.2026.10.23.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:58:58 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v2 0/3] i2c: qcom-geni: Add I2C bus recovery support
Date: Fri, 23 Oct 2026 17:27:56 +0530
Message-Id: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVL22oC/zWOTQqDMBSEryJZNxLjT6Wr3qNIiPGlvrYmbaKhI
 t690eJmmIFh5luIB4fgySVZiIOAHq2JgZ8Sonpp7kCxi5lwxquMsZpuhtW8EtLgE0bhpOkwgLD
 ei88kX8oOg4hC60KXusyrnPGOxLm3A43f/erW/LOf2geocdvfGj360bp5ZwnZ1iPHG0WuRDt54
 UDZAG6mIaMswuSagTpXui6ukSA9CNIopFnX9QdCRrzm4QAAAA==
X-Change-ID: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792756735; l=2244;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=NmJjBHDfXQz62IkV9SBv65bKmP9Q1LBo7h4nvQNn7oA=;
 b=+NBv1W2TilmwVmT33/qPxlpLi4rZUaDAKzGTntjNTDeSkbsS3gR96OtBtECoYIXQjJnVOjDOs
 /1Bh+N+mxK3BPH4Mg9AKbkoq4MWXVlAntyCorflikJBfTGwixQaEaPh
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb4c05 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5qjwvz7LsgNgZhFB2CoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX6U0IwzYWqH7W
 4XsbetIv2zGXWOrBnb+s85UNS05kM+mY8FKsf4hn23bkazhelw6vZuCxJJwhH8uNQgNcZU/Zkfz
 cTTPxZm5IM7FRjTq6Z8Fubm7XHFABVs=
X-Proofpoint-GUID: vQ9aN_hrer1vpcQRh_SkIEXVE21SJ7rV
X-Proofpoint-ORIG-GUID: vQ9aN_hrer1vpcQRh_SkIEXVE21SJ7rV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX13yl2u5LGStV
 18iHShSc8K44nPsps0orfmbQUi77YBLcojMEwPBG+66R+VOaDUvu8rgLE6W16yivGtv4SLqj+p7
 Mfxm4FDbzBFYWIIEIougKg4DfI7Oa18zZhCvcFkDFc57H6CyJibM4cF0QtiC6Og98uiNwFPIv4C
 WbWH4ZVfC6huZnyunvVzpj286ch4QxUNMOdJd2YFy34mhYlDqMgzhofGnvRfHSrOaHWxqpnKAoX
 IEVnOiUu3dXfSoLF4Sa+K9EiL7McZj/rm9yncjPxJvHQH6J3Nb7pjirQgz6atzeDS26QKoBnEdL
 99cSe16aUyB+i2AKB+kmSE0maiMhGgu/j979cEJJVrOnCUjj07kDwwG4NaNk3wM0SK9x4eHeL6m
 peazdJ5uNYvqcnj03zsW96S4iYt7FbDhjsQRu9ybcTo1vVegnX3QBblgONsi5D9NghfVbbL9TIf
 Zsv4vrWx4xSk+crK84Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

An interrupted I2C transaction can leave a target holding SDA low and
prevent subsequent transfers. Add recovery using the GENI I2C_BUS_CLEAR
and I2C_STOP_ON_BUS opcodes in both FIFO and GPI DMA modes.

The series adds zero-payload recovery opcode support to the GPI DMA
driver, registers an I2C bus recovery callback, and triggers recovery
following relevant transfer errors when the bus is not free. Recovery
checks both SDA and SCL and preserves the original transfer error.

---
Changes in v2:
- Rebase onto next-20261006.
- Move the recovery opcode macro removal into the DMA opcode patch.
- Check both SDA and SCL for bus idle and reject recovery with SCL low.
- Share the bus-state and recovery-trigger checks between both modes.
- Guard the current message pointer when checking data NACK status.
- Reuse the FIFO transfer abort helper for recovery command timeouts.
- Use the adapter timeout for FIFO and GPI recovery commands.
- Preserve the DMA configuration error code in GPI recovery.
- Link to v1: https://lore.kernel.org/r/20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>

---
Aniket Randive (3):
      dmaengine: qcom: gpi: Add I2C bus recovery opcode support
      i2c: qcom-geni: Add bus recovery support for FIFO mode
      i2c: qcom-geni: Add bus recovery support for GPI DMA mode

 drivers/dma/qcom/gpi.c             |  30 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c | 197 ++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 226 insertions(+), 3 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

