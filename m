Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190920;
	b=XZBBAtVPnCL8bZhSsnRIR+3+eqpV3yYPKTQkCzBkSWwOg5TJ5uawSnDWPsEzXzupIaqn
	 IZk/7ewdI3YUCqAMDGJ50KytrjzEk0ZjqxouOxFsjhi6yV1RAkdoWhoEcCp2jZZ2g7sBf
	 M92W1hUhrag9oEOk8T0GEKCXPXz96ZBTsyZmlxOFz8TQRnB0djxzABRiKkxAyX95CCZTR
	 8WyFiXE7eNJsFLmUXEH80Ba/Yz6k36Dn3RFXPDIyQLQOjaIHi8+hMjz1d3pAzVaITXyPG
	 3cfamd7ODpNuYlas+zxabEZgpYxZnrJvRWo+Ix+wRp/a2tlynqrKOv7bldqjpnrDF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
	b=V7JiQvZLil0IPgnLvp/teDLxIq8jKnfBtHosZm+9u9kH6lJ/z5WBc8TEccrVmENf0rrI
	 DFgQaBLT6ZtOaw/LWriPHWe0dKmCOt5BD569HjNSeeer68OhGg01FPmCgauY0n4mt+nqS
	 dgVBAHd3IpU/TJVTmcxV6LtjgvSE5EwUYn33jS4VcUO2PhtGFKk3VcQMzZlfGpmDR9RR6
	 1aYOz1mWoa1kOGrh4pG9B+t4kEuK7yUD0vf+SpXe5dwFL/VvjX93tWJ8bsp0uQK4qAL4D
	 dy7Y9nhF2D2nR6IgHSMb9yb0PNs/uyZYuJnCWA8CgaZQPEZlKW/3OzfaQv7CGHak0Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DifZ4nd7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EzdbG4Y6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03C8606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03C8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DifZ4nd7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EzdbG4Y6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2GE994523
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/
	1ufgNTKQ=; b=DifZ4nd7xLUYeDvzNICOmecl0hoCpcyKrkXvz81QYTBpJq+CoCX
	tad7BLQaFaRZoSuxiskGePCE3eUbHiYVZW0DuFSJxn24mekIbJVYkxT1lkflOh/x
	yVFKBpgwMERa1ygzX6TBNMMAEJ35E/46Q/Fcj5tpd54rVISmuw2MP3YAISVWelM4
	nSfr1ugJgmN8J4nIH3MFOjq/qFrmjLV/yXxcHb7RdL8KRkPkwMUpNkDY9nEqG/5z
	ELcJShxzF92aTRpfDwaZZPKRaLUnvwsUPuHQxMF6gzOQNAPS8VZICe8rNLVe5328
	dZjN5zAFVikO8sUBtgURmFfjlEmuHJcbX0Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt242-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so3820486eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190918; x=1793795718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
        b=EzdbG4Y6u1xgczrXnhSBRTByv1qz9DS/xbrl9kBLndFvD5ZcfBX/Bxz8xjggrn1fMn
         VqdyzYns32YXO2R3CcmQvlR8IRKNaCkbxYMnUaz6tjjudKlO801tGXmqm7Awy+taPk0h
         yUPSkAy8Jok4RvaSpo7cpwPcgGSU2KJb1vp8rTwdetPe0jy8fFXd7DemtmVXsHFFJ4Vv
         tmtmWEGn+wKekkDUhiPFVro0CfpfuH+HJSt4+7t3brlausoGGtYM5CAZATru4c3nkmHG
         CBQqtY0TxmGidtmgBq5aeyWHIm+BQj1CkcafN8MJ7qSdqjjIBLFodlgv/9tGsXzwkFqM
         Kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190918; x=1793795718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaHudrnpE8XtpurMvbDQCfiS6gfRCYIhXZ/1ufgNTKQ=;
        b=JCsLoLXol/fd0FJ0RM5LvydCqPiL5GKfpQRwAkfmspnxLxVa2hmG6dv6Sd9Lam5x2G
         kUnyqJoymNl07RC4bMRs0t/vz+RWuMvliMcTKpWgYp1uXT2GDD21bXan++MXB3MHaiC8
         z3dhl2o4AOuxANLGc0fq+4FnGRQKp98dHxHZ0cVCbNopZ1nO54sV7VbhsYSrDUskFR6p
         XGVTmk48E8r+LbRPy8VD27f6RIvTOOKhSRfr1XE4oPRbZhSmKonQ9YcTdzH/fwc3xuPh
         RsSahH7ul72s8CSIxMs5z4mKIsXSo0RirjRNwFC7y2+WBNFWCIdiFORPzkFa/0zqZqjj
         g78g==
X-Forwarded-Encrypted: i=1; AKwUvBwT8L6gn0SjQsLqNpr/jL/LOhkmDJd/zVs7D/ZQmJJXFTCqA/JKzOrvbeJ9Su8n7W00iL+ndEwMahrDzDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo8jUmJ2y5VKpRkKyoDj2AeRRS6eRRsLmM/Ho4NE7578jENihu
	P1wkqEw01m+mQQXwlgW+lT4lTFURvpA0nyX4dIlpb+BDSDDW6cbkhBt6A5mP0JZm5H11ped9OnV
	x1geQmVIAh91cUej1cy3E9zELlOA0TTrFxtAPKChBRGBZ5zYSy91K4OHmLtSlTR9cRP8=
X-Gm-Gg: AYBFou0fLpmL1hYzltgacyzUiXyyqljjBZTLm2svzszAzKTRdT9L/RmDh5MSmCBEjvK
	VlENN2NP+skLItxGoY7QTNcdSgTlVTaP+X8Bg6JVpAVLFjj3cJB7qP6rYekzN3HwLJbqEOpEbQt
	Oc629LY3DMl+4bxeZvIk81QJqOc6JYWGvH24oWu0/FyawGM8OGHtCsGuz5UG1fc2xeBv0zAry3y
	vexg4CUw0Ezbl6D5/9Tsr6VEem5yaGgh3FV+wXgYw597QmzcnQvKX0Wz0VeBM9tGKDYGRlyOhOr
	0Ox/3rfTEhAUbneEN5IULmJcaqCPVsxOoKWMDL7usZlDfSCnYWudjJR+ifhpaLWvwlBKsQYoD6g
	d9R5pg+rx10r+opyWAKbn4WeYLo0Qkr7R8Yhh0+DDDzxQmNmYMtg6qWJ+IRsuwP/iQfVvKoqB1Q
	M9ZeBPrWBc3BhbFMxj6Q9VLo5Gplhha1rr
X-Received: by 2002:a05:7300:c391:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a20419d8dmr3825896eec.27.1793190917611;
        Wed, 28 Oct 2026 05:35:17 -0700 (PDT)
X-Received: by 2002:a05:7300:c391:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a20419d8dmr3825853eec.27.1793190916977;
        Wed, 28 Oct 2026 05:35:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/4] gpio: shared-proxy: Fix line accounting
Date: Wed, 28 Oct 2026 20:34:44 +0800
Message-ID: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Okf3BLjOICJm2I4pFujnaXppXMPcpmby
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX84Z+PAiwzsPm
 4flelO7OeoTYxSQ0R3zHj9+1nJGwnkPTE5/lHviTJ5zazrqOuznZ0lom8SUaOe1uLZs/D+ITVX1
 ljAYV68DfhLqldNEVZu65DBctV8pgKo=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1ec06 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m3B8FXdnuE4ZOOmS3hUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Okf3BLjOICJm2I4pFujnaXppXMPcpmby
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX4e6leLISuy/q
 fiqWGYYeTCu3Fju0YcFx36ctjN+XVAeXKVBg39C2UHccAcHJKSmD5PsKc6vh/pOYkNqhGDuJOXh
 2vBkw3IaCBy7huezgsTho2+kpKDpnkaR9DFauBrDYkJ2P3BLvHQWeEQgca2ZBRSRR6A6010JOt+
 sP9JZrrI3lxxemsz82CU8rgqgJrqLfykrm1UK7lylP0QUZ+DWW1Sr4YGqy9y5D9hnJ22Oqz+Xxu
 dqg258/+q2t3NP4jCTxB+PWkqX0Mh9lIGaKeGv9p5BOi5Blx8u6ejMicwbqY7nFgG69nCzWcixO
 HgvOj1mh6ZBsVM0YmdNHONTmQEWXZKKsjLvEOsSbOWQ0rbnLSMUZhPFiw18SrLzne8lKh2mipqn
 fWZJu/sd6EJ7dZqESAYKLSluF8ZQZGa5pni7RWUHD+QQMpS5K0V2sq0bTFHT7Cp2Rf9+AG5bf9n
 VZw8OfDLyFCMjRw21oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

Four fixes for how the shared GPIO proxy accounts for users and
votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Patch 3 fixes gpiod_set_value() to the default value doing nothing on
a line that was requested with GPIOD_ASIS and left at the opposite
value, e.g. by the bootloader.

Patch 4 drops a proxy's vote when it switches the line to input, so
releasing the line no longer fails trying to write the default value
to an input

Changes in v5:
- Drop Assisted-by: LLM trailer
- Patch 1: Add lockdep_assert_held() to gpio_shared_proxy_may_init() and
  gpio_shared_proxy_mark_configured()
- Patch 3: Explain in the commit message why the default value is
  written for all lines and not only GPIOD_ASIS ones
- Link to v4: https://lore.kernel.org/all/20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com/

Changes in v4:
- Patch 4: New. Clear the vote when reinitializing the line as input.
  It predates patch 1 (Sashiko)
- Link to v3: https://lore.kernel.org/all/20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com/

Changes in v3:
- Patch 3: New. Drive the default value to the hardware when no votes
  are outstanding. It predates patch 1 (Sashiko)
- Link to v2: https://lore.kernel.org/all/20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (4):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure
  gpio: shared-proxy: Drive the default value when no votes are cast
  gpio: shared-proxy: Drop the vote when switching to input

 drivers/gpio/gpio-shared-proxy.c | 98 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 87 insertions(+), 12 deletions(-)

-- 
2.43.0

