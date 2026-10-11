Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC21A682C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685712; cv=none; b=UfFkrORWQ0zk7G4+sVblFIYNSLsXWGzvBYemcUX68JrFzUZmIq7SjMm0pcJrqFCS3sBbHqwOfHsLqVRzjcChmAgYT4bHyN0yp80f0mxMCq0+Mhnz86cM+AmojiG7KV1vRmCqjjbLX7rZRA9zUJBGBw4SzfNuLxPhG+9MfneJke4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685712; c=relaxed/simple;
	bh=KQeTnlYiykR8Lc5gE5kzVLsW99X/R/AWY8C23t4vnYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dLP4BYG5Pl24CMy3BCOFMuvfXNU7+hjtCxslRTNFh2aTZwf+n54HKvqfEzMixGSvDJrDrinv9WRRWtq+lIo7I9pGewP9IEZAD9+4t+/SwAx3rlPqWQkGxRVf0tP+m+9sFhLa0L5R5XsXoLSZWjg6zVhw1WHTwd0CNuViYOTF/7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/SkMkaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWeH03bC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/SkMkaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWeH03bC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1qaeG3236316
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JHFTHFZAy++tAZKYDPmzVhUUq8RBe5Nt8GA
	8v855s5o=; b=o/SkMkaXE1iywmuKnhLGMweSReuI2b0Lr0eje/PRaSXWdXuVyGk
	p6B4H9U1xx3SeiD+i2KaX5K4egEx7s1f3OCRwmDYpOCTdsEdZ4VQD8H7gng92lsZ
	XP9w18OtmQ3TBeMX8ueatK30xfIuWRzZi0Ho+8KAgbLF1Suq5wTLpi1eolbj/pOb
	wGtDKMLwMgqxFXdz0bvA+j2KIbcYX+Ta5whju5OrmmkdXbp3h5mwzv5ZoIyD51jE
	xSVrFldsY5dXoZq8RPHbLF9mBGrMG2HQ9P/FBRI9CQ2TTjjVtxELO2eB+wW/SNBl
	stkz9YSs5WWAvXfzKoiDMa1ca2HD3wluMrQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7casac25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:28:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359d11365bfso230234eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791685709; x=1792290509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHFTHFZAy++tAZKYDPmzVhUUq8RBe5Nt8GA8v855s5o=;
        b=GWeH03bC7h9prw1CF0VXzjPIDaLflGaxN1BMmoIQhkYMPCeMvcte9gRXgbzh5u3arN
         CYoJoN5lOCR0EFeJI+sY94N35OYbRiW7oieyxuoZ6XIEp5QaqBOBfsmjzC2tIPeJAAKS
         1PxivJ4zTMZwKvHoNE+rha5N7dIm/9xxOybNrK2LO5LsHPN2SHgLrxGn6zBDgdmKtpLg
         eJdDD8BSHXu821NyZGaWtuGAT5crXYKwSeieiUdYMMOru0LMPe5OOgFS6mBpxQ6DIdAn
         sz2+ee1AGj10BiD/fZInKGQpAsBg14J6xFlNarCc/kdmFFfC4rLvioRwT0yP62ZQQfo2
         Nluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685709; x=1792290509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHFTHFZAy++tAZKYDPmzVhUUq8RBe5Nt8GA8v855s5o=;
        b=ZX9zRDdbUf81GVi4uGzGK2S7dSOVBEets98FxLZc5QRX0bKt7BgwxIHJagbzL+5QHr
         kbArkUdWBnw2GcNh/p3M+z44vFsNXRDwXqo6ruAKDPFX+3FK3ugci3seAG+B4kHJBNSI
         x/lUTgS1jYq32hYsIfaxAlz2J04Gu2boYigX6oxS3C3KY1bxBHFAimiPyTXJ8yb4eH14
         vEdsXhYIb1qe1SnPBKwZSPW85weJKFkt844BYSdfdPtaYfzAsUVIuxtJa3U5bj2sAsvd
         zsJTzdd5TJ58aLK/Y5vx8plLzN2gZ4KeTgkbELnkuaBJsG2NbGEneifK0Ijkf3iHqDo8
         66/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/P5nUh6ZPMxmUmLT+sMdB29uLK+s38KNdi6nPwEOIjSxib/Czla3Ue0aRzBSxVLZyDkl7q0GJAMtiOoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLykyLpcNVadwNmmK9qUnPHvB2Ms4YjbSMxUXH6tVLqplXKwPpA
	hVzQ6bwz1F9p/KCLYmUnVvJg/oGWeFLWt9Ay8PI0DUQskg36WxDL/U6vKtV7NIvkXmSrgGdcXPD
	TxYtkDjW0uWSRLxUdJuzMrUfSkCjPTGQK3ylzn0mK4quGJWmTRcZhxM13Q5lgyqsXrRM=
X-Gm-Gg: AYBFou0nxhWTM0W8tLEuxZaB4NgNNsq/VER2TeRjhTGqjJBX5oIs8jnWpHcOuXNVe8e
	Lp4PbfRxc5+yuM/3KpaYbFh7SG31sBTN0/EV16uv/AB9gkZI4tnkxWL96NLLe/GcMVXCVPX/Llw
	gnLCRXoHdEs4K2zvFImc049mSt+6+3GSHH5jws2VA4yPWzieFFLhXUybXQsdV1QxZRW2qD7uAAU
	QinJV0mvx39zUDNBgo68EgLRSKq2xIPpw5m4gsdBCJ2p4GzwdhXNE2ETB3M79dHlgB+YfiygVjh
	3mDAanGoYnNPzDyXJvH58FwLM98qzpx0bJP0vuaztk/VFn3ldq5EQia/p1LyHTlIT29tn/k0QiW
	K1pEmZtOuDsPY6oNPIrJqrfVjueITf3fC08EX0ba57WwTP18fzWWzSerItKY=
X-Received: by 2002:a05:7301:d195:b0:351:6409:25c9 with SMTP id 5a478bee46e88-3537e11c9afmr7214885eec.35.1791685709215;
        Sat, 10 Oct 2026 19:28:29 -0700 (PDT)
X-Received: by 2002:a05:7301:d195:b0:351:6409:25c9 with SMTP id 5a478bee46e88-3537e11c9afmr7214862eec.35.1791685708578;
        Sat, 10 Oct 2026 19:28:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm22068243eec.3.2026.10.10.19.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:28:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] remoteproc: qcom: pas: Fix early_boot attach for not running and crashed remotes
Date: Sun, 11 Oct 2026 10:28:00 +0800
Message-ID: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX+Yv/ZKhtmFZ8
 vqVT/odFthumDMztEsHPLFgVEp5P09PoCRanF4pENtjFOVQlmYy86DkEQh5oP/BbBImAeTAerGW
 jNlRH2vJR4PtEdPobcQkC9aNnotBvzA=
X-Proofpoint-ORIG-GUID: j1rQEUL5ojN9aR008kgLgEZ4qmFqhIbR
X-Proofpoint-GUID: j1rQEUL5ojN9aR008kgLgEZ4qmFqhIbR
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6acaf44e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4g9CDqq4PbN_pkt7hJQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX9P/OpouOJKgp
 9Ee+K452FnJkXqs6tw8sYH5pmfQzFcXoiHGj9j6en+yjyGj11DbUNd2pBE9ZQtPAMvkTDyiG7au
 Q+JJhWoQVmvgM8ofUyM2qBgG3Zu1YZo2NZoPiQzayxDc3V/CBCJT8OXMjyFM70Qcl8+JM8T6NsC
 NUueLGoCZp9+LzI08IkWozbgY7R67qrROCyuHXvyjODKFQNmezVv5o3yea6Ymgq/gpyTzbgoiKP
 +Pumw9ckOax73GRogL4VWsdSHBeNVNuS5w0yr3zPSl2Szrn34teLzzZJAupjSZA7Y2axn1MY7rn
 4WZBaKA3MJ2YCc2TmmEvPvUjZulDfNCIF+CDRAzHqWEA8DotcKjidhvSq/+IwcQfaJ7PgOjplu6
 vOnpIg+WJ9I8Ysj6dPn86LZqZ8Q1xnNw+T4DXXBdX/chcQAC5jj1ye15XeLz9D4r41yWtY4pIvF
 2xG60FDM2U93k+N4/ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110009

The late attach support for early_boot subsystems has two problems.

1) A remote that the bootloader did not start is never booted. The
   checks for that case live in qcom_pas_attach(), which marks the rproc
   RPROC_OFFLINE and fails, but the core treats the failure as fatal and
   never loads the firmware. This shows up on Nord, where newer XBL
   firmware for the IoT variant leaves ADSP in reset for Linux to boot:

     remoteproc remoteproc0: can't attach to rproc adsp: -19

   Patch 1 moves the ready/stop-ack/shutdown-ack checks into probe, as
   these signals are static until Linux interacts with the remote, and
   only marks the rproc RPROC_DETACHED if the remote is running.

2) A remote found crashed at attach is recovered on top of the state the
   failed attach has already unwound. Recovery leaves the rproc running
   with a zero power refcount, so a following sysfs stop is a no-op and
   start boots the firmware again on the running remote. Patch 2 lets
   the attach succeed after reporting the crash, as the fatal interrupt
   handler does, so recovery runs from the attached state.

This replaces the earlier patch dropping the early_boot flag from Nord
ADSP, following Konrad's and Stephan's comments [1]. With this series
the flag is kept, since the Nord Auto variant still has ADSP started by
XBL.

Changes for v2: 
- Reword the "not attaching" info messages, as early_boot doesn't imply
  auto_boot
- Factor crash handling out of q6v5_fatal_interrupt() into
  qcom_q6v5_report_fatal() and use it in qcom_pas_attach() so the SMEM
  crash reason is logged
- Link to v1: https://lore.kernel.org/all/20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/r/20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  remoteproc: qcom: pas: Decide early_boot attach at probe time
  remoteproc: qcom: pas: Don't fail attach if the remote has crashed

 drivers/remoteproc/qcom_q6v5.c     | 22 ++++++---
 drivers/remoteproc/qcom_q6v5.h     |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 71 ++++++++++++++++--------------
 3 files changed, 56 insertions(+), 38 deletions(-)

-- 
2.43.0

