Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071C048032F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789218298; cv=none; b=UFSSHX1R777Jt36wEVryRJi+rH3bfkNnfws13/8lqd3dQvGbegxaiMl2tof0eedn9YAR05eOE4sjZd8E3jzofotmZsFPEPglqoR4lJrP5rIWQqqVIpAZXr2L4a9eabsCMqFy64hboDcLS/A0di8DdOg/ryY+fIRQOagRuXZgwGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789218298; c=relaxed/simple;
	bh=DkkEzQFnQCcvHnMLCKFA3jA92+aSOLwvVO7CiE/RI9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U83Oyme2TPKMpW+6yziiFN4EsXZ0ku9KBbosfj/0uc+Djz77IfkG4EPWqMuOzWpCs6SgNXlonFvLJOmu35ythCy95sup+xpwLsbVOgRYsHJVMq6PGthQK9IGwSrcsPDG7iFuo9bjqlivOwQZGsXnmRQ1yzXnVB7s0gPGEz8QJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EM5d+Z/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8JX7HKd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EM5d+Z/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8JX7HKd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdZqX3101692
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DQkvfoLaS5EsxGhnG4IY4K
	FoplS1RraTacfV3jWzacY=; b=EM5d+Z/5bAxLv6Pf3ZqKoTC0wDDeFQH+r63XLy
	SGGUqwbkQepj/R0wv7kE1xQD7JR5iUw6X6PLai6QX9W/M44xq2sYvE6ZjjfIvLl1
	w6DAy0iXpp+/QDpTGORPD9ng1SowpeoQYpBDo78RMRuThhMVhKg3hK1iZovN3oFa
	8MlGK/DYSzNDszD1OgLQSUV6z5HVoR/LgC+0wzrTbgT9f5iyad1lcuNPT2sls0cs
	BezZxDhDdwtv2Ovx6N8TlxAuHcOK4PECNZW5HZFdnzX0zmD7pyqvFB5gHJ7DVUJw
	hJWkOWKuaZk42HQu93D1nTRK9Ok0QxJMPTzX59Z/W5pjdHbw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c906r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:04:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso3634576a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789218295; x=1789823095; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQkvfoLaS5EsxGhnG4IY4KFoplS1RraTacfV3jWzacY=;
        b=I8JX7HKd0TWofsUl8+3wRkAmd9r5Q7rdxkq90rddw5Jt6nM7s5qTQhkAeTrP9GxJoP
         hEmhGreA2ACtrfksHoCrpYvWlAS+BNSMdec0a9/xGYU+hNSTZEWRfYnmmNQaMhUASWV2
         Cj1NdGskqfU3qQeEb0WG68Ynz68t+U25s0LFTB1F6yTxSewatkLNLBNqrtSumBGVu/8l
         sTINMgWvd5Rc5Md8PLHykCR6nh1T00bs8IDk/brdcEwoIAoxpvr8go5F1PFBal9mgnEj
         B6Qi3XjQ2/J7BGhskMN4BZDmfqrcrMkw5u5ZIRZkjEDfmBEc9eMtyPJvp3IIfprKEbHD
         ujJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789218295; x=1789823095;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQkvfoLaS5EsxGhnG4IY4KFoplS1RraTacfV3jWzacY=;
        b=rekVJkaSYUuj54cXFduLd/ic0UXXiHu25ONzuExuVFKbFv8JKl9YCz28fa1LSyTZvh
         yFWRvyxlFms2yJ3oMuGp+OWx1wpAK4mHdHKKN88cY1wYteHTJbStAW82GSTGcysGbGkN
         EDcSV24mZdHhNNgTNlMi5hkTfyR0uIh4mFYXHsJ2pGhGBE1kiFyVsSHOa9kZrNV5aooY
         T4ECIGpDocjuzJZMQentJASVwTM2UEAX4HTVFmQ0nzbxkWhBkBQgYT9xmW9d9pSeRCSh
         bPy830yTUCX3IE/74Y6iMLW6K4O9NxSlFdJitIoVvYNo4ojt9YVrvleozXj0bNuDn5kv
         qwiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2XQOh4bW0H+pnGUs4PLSao1bi6cTm9I/8x3aDDQGT54ORnAIvgG1tWuxIvqWniDRJpCr+B49cGjAejLA=@vger.kernel.org
X-Gm-Message-State: AFuF++njrS4A4/8BHWpZMytWHs/6CNUSqMpLTNvSbDoBEWRvY4LnvfD6
	bf3779WXJ8UaLiAiliJr+2Q1svanaYJUq7G+mfIhz22vFpsNL2TRxvtZtWNmPZlzhmeXFsWiE2N
	uF7mzvLTW+G9JSaqHRIWJpOlxInRjIBb63e5fzkLS1ncLuncybjVurXk4Z4ruesTQ8di0Wcq+MO
	0=
X-Gm-Gg: AYBFou3dMmft0qdRVUnMwVvMQij1HFflFt8F4SyWQnktmvt7pYnq9yOVOKrFgzStKQm
	KAG2h8/S0HyS8yh3G+bDQECrgEQv6gTpV9q6HMDno4ipfQg+4hmw6Sr1LsbyPlJyLagjuodSZfR
	KG2lXnYUkqj5r4XeBkfKSnXyqQWDURQ3DNHDUYjb2OkuGCbbLrmNvKZfF6jnXsH9k3ZFUVd4H10
	Z/vtvgwOVVmVzfMTbIl4XAo+CI7Iin1O08XLZSOm0MtuiB9ogXKdyLimTeK/xGI7aKOzJnOJol3
	yN97ykRIonoNrEjQL0gh8KXU0W+GMsrNzOypA6hRfE4oUEDl2dSWQJRy3YUTS5mYHCZSey2OyN1
	De6JP7m9gKkmKqMK+BVOU3ybZ9tDRCInSluM=
X-Received: by 2002:a17:90b:57ce:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39d9c1dbb3emr16516949a91.12.1789218294591;
        Sat, 12 Sep 2026 06:04:54 -0700 (PDT)
X-Received: by 2002:a17:90b:57ce:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39d9c1dbb3emr16516874a91.12.1789218294184;
        Sat, 12 Sep 2026 06:04:54 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm13665036eec.22.2026.09.12.06.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:04:53 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] i2c: Add I2C High-Speed mode support for qcom-geni
Date: Sat, 12 Sep 2026 18:34:21 +0530
Message-Id: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVNpWoC/zWNQQ6CMBBFr0JmbUlboRZW3sOwwDLKGKHaAaIh3
 N2CYTPJS95/MwNjIGQokxkCTsTk+wj6kIBr6/6OgprIoKU20molSDvRssikPRmby8KaHKL8Cni
 jzxa6VH/m8fpAN6zr1WiJBx++26dJrd4ezfbopIQUtmmKDHNnlDqePXP6Huun812XxgPVsiw/W
 We8qbUAAAA=
X-Change-ID: 20260821-i2c-hs-408768509865
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789218290; l=2065;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=DkkEzQFnQCcvHnMLCKFA3jA92+aSOLwvVO7CiE/RI9M=;
 b=k4QwrthsYIV9aqQ3hDCmxAiD9GjvFuZJqZIK/piYk2VDnUseWJnUakoiuc/LRv6EUfZrhnqd+
 YhaPKFtr7x2BBg+M+BPMkDQac6yUzZURGrgbqIqA6bWrfWJFsQc2qPK
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa54df7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0Vh9vUVPWsnviaz4y0EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4OSBTYWx0ZWRfX1NjQQKf4Dgys
 ru6IBS958J0x9i9lSNqDzUXHtWcr9KvVgEA9YeQy18D2MiieYCpmSKWjuhS3lwIDHMJjX7smqKw
 Hta/9t0DFLfHelI2P1dCJkJBBoV3YRU=
X-Proofpoint-ORIG-GUID: mAfUjRQ-nJ4gBo_ujX58X-lyl-64D8OQ
X-Proofpoint-GUID: mAfUjRQ-nJ4gBo_ujX58X-lyl-64D8OQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4OSBTYWx0ZWRfX2sz9PzE+OJPm
 RKT4dP2sU7CmJJmooB0wL182sRvSlBXkMhB+LXYgc6b0YzIpciA5gQ1FztVW8k2n9O5nwBdFRpn
 ZL4nj0GMA8MoaGTh6DQL+pMbSgm5SO6FUCeo9uBP7xMz+BPdbMYQdBsQLEKctEz3JuzXioRMUX6
 w/6A5tu8Oo1dxLUdMCD6kHlvAhno7B/2UiY+oiPmed1iswzngKENCQHsls4S+/fb512UMG1U0uv
 RuyZ5zMuEkigjUKGgIS5Vfkju7YvfXSkKwPHoipvv4reBkw9SVsH3jNki9xTDbbGncVSciNPgLn
 evv5Tl1c5HITtkexDM43+cS6EmW2NiWCYm6y/entNJT0qffT8/g0OSBp2CYsKybMfJ1DfY7GwAN
 Ch66do9lHAq0oGlT5vX5GoA65gReZymLh6KCgyKulZfvD29A8x3ZEuE0iBD3flu1INZLJpE8E+8
 OFQIqsnIgzatabpRV2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120189

The GENI I2C driver currently supports Standard (100 KHz), Fast
(400 KHz), and Fast Mode Plus (1 MHz) speeds, but not High-Speed
(HS) mode (3.4 MHz).

The underlying QUP hardware supports I2C HS mode starting with QUPv3
core version 4.3, per the GENI/QUP Hardware Programming Guide. Add
driver support to enable HS-mode transfers based on that QUP core
version.

Patch 1 (dmaengine: qcom-gpi) adds a CONFIG1 TRE to convey HS-mode
timing parameters (tcycle_cnt/tlow_cnt) for GPI DMA transfers.

Patch 2 (i2c: qcom-geni) adds HS-mode support for FIFO/SE-DMA
transfers, including the required clock/timing configuration and
master-code preamble.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
Changes in v2:
- Update commit descriptions across the series.
- Refine code comments in the qcom-gpi DMA and i2c-qcom drivers based on review feedback.
- Fix issues reported by the Sashiko bot.
- Optimize geni_se_setup_m_cmd or I2C HS mode condition in I2C QCOM driver.
- Link to v1: https://lore.kernel.org/all/20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com/

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org

---
Jyothi Kumar Seerapu (2):
      dmaengine: qcom-gpi: Add I2C High-Speed mode configuration support
      i2c: qcom-geni: Add support for I2C High-Speed mode

 drivers/dma/qcom/gpi.c             |  56 ++++++++++++++--
 drivers/i2c/busses/i2c-qcom-geni.c | 127 +++++++++++++++++++++++++++++++++----
 include/linux/dma/qcom-gpi-dma.h   |  28 +++++++-
 3 files changed, 189 insertions(+), 22 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260821-i2c-hs-408768509865

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

