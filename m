Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39B48FF88
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214200; cv=none; b=BeiCm7R+Jg9PR/cMnew+3tKsmdqYSF8t+gIUIeA5/JDsJu4IK9CooryhTEz1RuoqEKMkOovzE4kCSqPBBtK874r4ZnRiMNNcdnsJf07tc3nDcyqEPQteqfpq9Xi0COWBPbLVeaAsh5dCxSiCQoNaDIqCBvPcMc/SAxSozYl9pqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214200; c=relaxed/simple;
	bh=0rZMtbqx4OJH/ZRZnVtsTEJfbEO8f/Oy8uSFfMNquXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3xMqZ5ZhZcTo+CXR1Kelj1WkE8NyfT0YTOTJDtpS9Rx4RC6C8AG4aGaO4SnZEUKCVpZEZSDBOj3Y7p/00iYtGsmMHt2VW7dGZqQahma5XhUfs+zQr5bmrLnntSvTeN4MR8XnX/FhVZ/662cCaK1NZeDYgC26Q0g5wV+V0KtxXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKtfxl2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyVDRvtV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKtfxl2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyVDRvtV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP13q1195542
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 15:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rCXw8A2I1UeDoK1QSfdJN0
	EuaLobUdXeGbqPzaAGUk4=; b=QKtfxl2B5MEPWQPK/JhdHjkpmV6cfy2eE9mmrn
	umzA+SXBw+eL9JGvBdsBacHrXg5xlIu00YrZjyPijB9ZFQXcE2ZSEvY2uAvIBMO+
	qW5UKs3H6QJnNeu4EBZqDSPkOgABECXe2bhIpRxQPr326jKFF/4os+vf1lwhOQIg
	HTjkKa2wvhFEtdYjgWL2YaUjSswYMHtxubz23JYz1ObI//9RcgSdU+peaU9gwFmd
	GmIxwEQJVQkoCWUNEUFA7Ph3i+4N7WGtg89iWQQRF/v/FkDgQOGqrwRJu7j5Z9QL
	uPJkuiNvmQhVAkz9tLiD2xeNjs42ID/kjokmvjG+cH6IXLlQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfmd1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:29:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-887e45c7063so1482529b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214194; x=1791818994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rCXw8A2I1UeDoK1QSfdJN0EuaLobUdXeGbqPzaAGUk4=;
        b=jyVDRvtV6cuhqiZ4DihK+rM7RxdLl/acsJov3KjHqNnl5YzFWyyFof12++hILSFe8A
         UOXB0GX3NUPLDbN21gtm3f19XraBbKpp7vl83Hx00/tIsPbACjAVugM7JOBy05LGZjD/
         0JcUt3q5d+r523Jt3OtLssgOyo7GMNDbAxy4GlzGtpd/fWLMMz4lROU8XPxhD3mrB/DB
         VB+X9lBPtHGo9eygoP+yl07Uz5vGnzFJZvl6cvrM4y8eNSV7SBekOX+LXVKZ96AawX6y
         8ByN+brj7+RXwv4uWihesBvLAjXtiyJM99DRqQUUkEZm7GBFd2Q6WIHVv6NAlcbCp2Fx
         Nw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214194; x=1791818994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rCXw8A2I1UeDoK1QSfdJN0EuaLobUdXeGbqPzaAGUk4=;
        b=TREcFdU6AEnKNSJnzR7eRLRkkLBfYXozQDoX4PhbvLrEWKgj8p5q8gwnATR2AG0N9b
         yOzX85LH1f56XyuszfAwkdmHQ1x3Pth6z8Ss+JFnVW66ZNzXOfpU3lvQDhJWGD4s05Oi
         6lvhWtqaGLIRKxI0sYROmzikM4Kuzph98RbK4b9wbh9rfoVtvEMsY5jWE21dG63yyZWc
         xma7PtiE2dg6HImw0AW/13AQxtaUw22/ayYkjFMQYTWdF1SZj80aVGWzImgDPKmCtROk
         1j24FR7kkYBO8pFLphRA36Y/prDHHPmLzx2uTlrcrs307nIUHhK3v1aYmhs4WFg56XeD
         nCBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxet/ldhBvR8qbGQJPAR/Du1V5uujPWZqyMeDV6lRd6FpA+3lrlXIB7gsW3zdoyr93fxQxM8796KDq700k=@vger.kernel.org
X-Gm-Message-State: AFuF++lNcfQ/zPryvWDKaPg2LB023wqt8QD1hZNtSYEyFYP2STLwmS2Y
	w5aHjPj31jMAWTC68B430fGZ4UkMAAXUlGPdQR6SX/BWNLRLb6pxbhDnzgGCVFSc7Qfua7JrUCi
	IO1gMdAnexs3SK46/t7agqi6XeO8sOzYCX0Wo7TNw6kbCT33D5/sxCY+TorBJVNosw3U=
X-Gm-Gg: AYBFou0JO8BAItKQFum6PJJaRMeE9ya7CU2rqyiAkygtEYmYc5DLM3QFeip0owRRJrG
	dF4fGlUc2uij8+7S3wiLZiTt18A2aVk7kUoNaQAGVbmHRznBr5c/Dx6Of6D/2OjDhLNBHuaTi6U
	B3iUs5WwAB9PDTD9duROFT5tUwmmw7z+zWUewXyCPe/3JOsUHgsxGcA3oZTV22KiMLQehbYNUmn
	t5CLajmE8dOSx0pCrZcFCCecw+ny/6HhYF1idm1uvqg3bec4IpdNakzx25++T6JLh1rOFXYATnM
	FwAaZ7uQzscSB3eh/WC5O7WApGuZ7H05gixkzDlaqBOPho4Onovg0gXZaHaWAJjDaRBX5lPcZE5
	jBKa5Sh+tjF1zmTZQjx6jh3HsTjjM
X-Received: by 2002:a05:6a00:f87:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-88af59ca53cmr10814028b3a.52.1791214193852;
        Mon, 05 Oct 2026 08:29:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:f87:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-88af59ca53cmr10813997b3a.52.1791214193388;
        Mon, 05 Oct 2026 08:29:53 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm3681528b3a.41.2026.10.05.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/3] pmdomain: Support system-suspend-only domain idle
 states
Date: Mon, 05 Oct 2026 20:59:41 +0530
Message-Id: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXCw2oC/yXMQQrDIBBA0avIrCuoSAi9SgnFScZ2SjHBMaEg3
 r02Xb7F/xWEMpPAVVXIdLDwmjrsRcH8DOlBmpducMYN1hirxfHypruUUEgPfvSIGP0YEXqyZYr
 8OXe36W/Z8UVz+T2gtS915QdEcAAAAA==
X-Change-ID: 20261001-s2idle_state-6484bbbf48fb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214188; l=3514;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=0rZMtbqx4OJH/ZRZnVtsTEJfbEO8f/Oy8uSFfMNquXQ=;
 b=NXMdRjPVdkOUnvkOhaWn8LlA7qSPqn6e0LdgcJn7ZsRyAQYK7Yn9r9hCj6ymhwui4iheXc7QH
 jjC6DXrjIZLD+pRghWt75RLPFmT1twrqOr24XA5x6nWVKNoIF0CIdf+
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: Z1iZRMxQoq1TBNP9yRTVlD20X9dvfsmC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX4DqlLLsQzXNn
 u5lF6dfAn5XugLAA5ueIqFXdCoQng+/fYTkANXR9blq3oVA75gmAD5NOwaWyYzensx1PsA18SOj
 TjpyyH93pmxPtX0osVNNSODjFZtlyD8=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3c272 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CdNNJpWm79WUBrjYsGcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Z1iZRMxQoq1TBNP9yRTVlD20X9dvfsmC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX3+K5s8mYrQH6
 aGjz1Y4XmHXFxBvKf2Js03R5r8FFE1+HzTbAc3SGr5zr+RaxCsJJbNLbWRZ37F7rI1TXnr7u5m4
 bixUhs7yC1a9hgyTUmkWw/GaKVB15wo0RZbBvpBmasIYQJkkmdYkcPtDbE0uIzwkVBRcPrkSbta
 3pbGjKvbFcTJ0HPMZrANGlYRVVrMmRWdQ3dCqwyiuBvxztrSUpCqoatYHk76hDP+L3SxsmRZiI8
 bkXDPFlB+VgsJ1X7elXBNV7EjZdU/DQO8WkNCLYncL4efT6goeAS427jzGe3TQxpr0nJhOUhOfn
 JsyK1M8HD/uIza4myJG35YQ2DbAn+qKPrl7kDuZXLclhtdGH6Rg4v3N1bOwWozrdEvqMnSXVdy3
 vgGq+VvcUwkIApO/q5pIz3WAQFcbu2M2M74wdt3FfI8oZ46pfHKg/SXWg6EvGvGHqVO2FvE2fh5
 KfO98ZoZvLxKpwk4sqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050060

To achieve the deepest CPUSS low power state, which can lead to chip
rail power collapse (CxPC) on SoCs such as Lemans, Monaco and Nord, the CPU
subsystem (CPUSS) and the Safety Island (SAIL) subsystem must be powered
down together in a coordinated sequence. The Safety Island (SAIL) is a
dedicated subsystem responsible for safety-critical monitoring and control
functions, and can operate independently from the main CPU subsystem.

This transition is divided into two stages. First, firmware requests SAIL
power-down through IPC, after which SAIL waits for hardware low power
handshakes from CPUSS. If an interrupt or another condition aborts CPUSS
entry into the deepest low power mode after the IPC request, firmware must
bring SAIL back out of its low power sequence before any CPU can resume
execution in the OS. This recovery can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause
substantial wakeup delays and repeatedly interrupt SAIL operation whenever
the CPUs become idle. SAIL must remain operational during normal system
activity, so this coordinated power-down state should be reserved for
system-wide suspend such as suspend-to-idle. Shallower domain states
remain available for regular CPU and cluster idle power management.

This restriction concerns when SAIL may stop its work, in addition to the
transition latency. Idle-state latency and residency values alone do not
express that requirement. System suspend does not eliminate interrupts or
aborted entry, but provides the context in which coordinated SAIL
power-down is appropriate.

All domain idle states described in devicetree are currently considered
during the regular idle path. This limits which states can be described in
devicetree. Due to hardware constraints, some domain idle states are only
applicable to system-wide suspend, including suspend-to-idle (s2idle).

To allow these states to be described in DT and used only during system
suspend, this series adds a boolean system-state property to domain idle
state bindings and a corresponding system_state boolean in genpd. The
genpd governors skip these states during normal operation. The system
suspend selection path remains unchanged, allowing these states during
suspend while retaining the existing wakeup latency checks for s2idle.

This series applies to cluster idle states with the "domain-idle-state"
compatible string managed by genpd and its governors, but can be extended
to CPU idle states with the "arm,idle-state" compatible string if the same
restriction is needed for CPUidle states too.

Assisted-by: Codex:GPT-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (3):
      dt-bindings: power: domain-idle-state: Add system-state
      pmdomain: Add support for system-suspend-only states
      arm64: dts: qcom: monaco-evk: Add suspend-only power collapse state

 .../devicetree/bindings/power/domain-idle-state.yaml    | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts                 | 17 +++++++++++++++++
 drivers/pmdomain/core.c                                 |  2 ++
 drivers/pmdomain/governor.c                             |  6 ++++++
 include/linux/pm_domain.h                               |  1 +
 5 files changed, 40 insertions(+)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-s2idle_state-6484bbbf48fb

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

