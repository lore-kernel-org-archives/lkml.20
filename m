Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1234B1D03
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732012; cv=none; b=O30Pbnvasr5dNgBzE2Jq70p+8ZSPikUdfoe102NRWNnHKhdHVT89pmGyPVC2tolI8WfjyjsNDw2QDMMdu9FAndVLnuFym+0jq0EbA6iePVDwC1Rg1hCaQIS8q6emCKPF0ulD1KK4Cc7axLqSuNzSaF9i+Vsg/vNXpyvzyQdIWG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732012; c=relaxed/simple;
	bh=N0rm1SiBoXQyZwSBkei+mjB9grlxqYlYsoMGdzQcpq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVYNZQQuqXXTugkIbV/NuOAkleoGLd3zTGNhW7QJJEudIUULZPg9gMhzZy34dWzx/ze419rrmIp5apupH0J+1ZecLABXxq8FOgYMfzDNmxCyvBCuwBNH7RWxmhJ2iN4vpEFDaBHpKzvWPFdqVsQzacXmqqYe/MR6cemi3MQe9VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUHVbaIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjABQsH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUHVbaIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjABQsH+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dXTL3916232
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xSkbYnZzSVkhxO/yj3SW3fACG21geoGWBj6
	0aYFtXII=; b=EUHVbaIgYMTZ1kamL5sbk7DVvvrOQTWDgp1oVjCy24UFfJViZ6V
	rCxqIDcv6QiuWPN4sIVWlmR8/M7gqiPvZP8n5w5fSsH76y24SL+ip/qCMKN3hObb
	aGXxHzGepblzPqVTvHp8PvTEpTYnn1vVjqDcbqaEShVWvY3Vj6ue3jXDmpJZq5uq
	DMJRPBbm1pEGUvCI1WkFkns6cyERyHAYvPAGEemdaNZSxem1kfzLnOaL0KUNylD/
	trdmV4WhI6W5GS4fzcDrqltXUFC0pqpAzg8l08zM8ogzoKiQg/H76r9dvkx69rjD
	X48C8xyoe0XTwao2JxvtvbMGPuih6d/9XIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdty49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:46:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1e564fd5so97159585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789732009; x=1790336809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSkbYnZzSVkhxO/yj3SW3fACG21geoGWBj60aYFtXII=;
        b=BjABQsH+61r99LLxQG2PJvPxHLSfZEesn6iNQMWed60sHE++egWuJVszgGc0Aki6hR
         +dZUYBnZLNglEPJLgJImrlNqXVEF0xePSdXSJuGQudDEuScHPU/5TFvksIqEc8ItUPbb
         tKaSL4gCX3mOwe/hNzo981lxnKYEv1SgY6itFP4eKBE7Jxr3FGaTST1Wm6OS4ct7YY9r
         T5CFA2qv4hVMNCJ0Yrk7yeMSmVJ4wJbhZervD6EBIpxJhEkfnBXIuB8nnB9MvfQl0ONY
         tx04NglSKoB9oIm5YKflKtBbZ8FEO98wAsknLjI78wQUPVfvf8yi2yldXeUnNEuEAYg/
         ogXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732009; x=1790336809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSkbYnZzSVkhxO/yj3SW3fACG21geoGWBj60aYFtXII=;
        b=sVzXmJanCfKlbg6yZV+shPc3megLwE8PyuDe0T/46Ruh4z7F5ct88lPdEniZbqVbrm
         WV1o6awQHWmI8FTCLmnQFDGu6h0edU5mg9xZrDQA9jPvxlxUM8Ou8ri4K5A2nGjzlzzj
         0Q0VN88dpUMvIbh2wGR2FmH9vhFkU1KNDedxfvPYmV7rHJc5+Ovmx6OpTwztypr5RvfB
         b6CMgLovIixJsalD2ZFtH2jOOj1KdRSKHnqOaHcWtknXSY0gp+0jvMekaGGit1wu0XL8
         0oaAY3aHPfrQe2ng9/zJwFwhyvmRxp92RIs+FFcX1cMZ7q6TVT/Ktp1atN3Vi9KyuLx9
         5aTA==
X-Forwarded-Encrypted: i=1; AKwUvBzxURzYB9G/NlBqagfKs18RdJd6oYW0//XtgikAFG4tg9VUrEhyspHLN6L63sJrk30V0ee8DIjzuShBLHY=@vger.kernel.org
X-Gm-Message-State: AFuF++k7gHbiHimEdtfV3Xatj/A/LR/mJl4i9AQzJKWRySS/XOr1n1Ue
	ahe3cWfBroMVBCV5KhwteBTjLta58nmbYDt8Pb/jxddys9mTSy0efbhFaEnVk6w+ltPZzjnObsI
	hJl8BqzSbd3w6vwXIizbgb45ec0UPPv0uVx9wkOM1tx7pjxXTf/KLaIYxw3AoQcWYdZQ=
X-Gm-Gg: AYBFou2khnTyV+VcP68y1NJB6vaf5xDyvB/S0YbdCL+4pvyObHpum/RF2cu6S1tHCg7
	lOnszz1t2rgI1p4XDziaHUZaw4SA4167rSiM+aH+hVKIaLXva/bJPE21bah8L34qS1K7JvgxgxX
	XhQzPXCTFvU0UP/+JBfNmsQmNT4rmC7K7K6jH8ukGuTah0e1PJaGa5unsTbpjex93yfQJO4OCT3
	3dzBbi7OEezTUVjIRhYdj8ywfyLiN099Ef4qxCCW+/76PKQ6oq+qqH0DCrg3BgIkHxTtjyxeaVi
	JGAi43Z8rGIqjvfvfvAgAi5aaPpGcckibFcUWiB/XERGWsj4E+DoVep29xTQxwO7RcmCSdtrhP4
	Bs3wOtnSUS+A2ZTlBWLrTtkugs+xfOwjJZ8Ch50UhlRUfuzWU+EPd6NaZqw==
X-Received: by 2002:a05:620a:2607:b0:93a:9298:1b80 with SMTP id af79cd13be357-93bdc8c7ad3mr284393585a.40.1789732009100;
        Fri, 18 Sep 2026 04:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2607:b0:93a:9298:1b80 with SMTP id af79cd13be357-93bdc8c7ad3mr284390985a.40.1789732008680;
        Fri, 18 Sep 2026 04:46:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm46794566b.53.2026.09.18.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:46:47 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [GIT PULL] MMC/MEMSTICK fixes for v7.3-rc4
Date: Fri, 18 Sep 2026 13:46:45 +0200
Message-ID: <20260918114646.74669-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE2NSBTYWx0ZWRfXx1Qh+XvoC6ig
 74Pv90qM+nDWmws40eJwHFGeoVMBxvqB+hIRkPgMSjEh70Ljdz8HlMkZZFpWUgJfvUmIzXBdByU
 mB4IbSyDk9hPxvHt/2JnDDQyTNAVNUwdYCNiOq0peMcsuTvZXW1FuEHNKwQCJ00cxMceX0iuJBi
 ytpRrZ5RRPfTMd1jk/t+i3B9IIjWwxqTwVqtTEEoPWalJsH04ZHP7OeJyfyax9Um7hPAsGaoXVK
 HqhiQaSKBaepsk/3IgjqFCuT16jLgzap5UEey4lVHbNcsPq01/mYUztldlttJtH73mK0D8MpXqx
 FEdIg5QWbWloT0DqOhTSkgah25+GxWCMyeNstxt1CT3MI1rNtRHJOgy5h9Nr7k3vfPcEeRzA7iA
 CBDwkNOab1zofEUyzQze5f+/x6IZRWY0pA3K79b/F2j4+PCd+ERXovctcoqPB9PLav9D79kaZf6
 TMdQQzbILWv2y6/NgYw==
X-Proofpoint-ORIG-GUID: lt5IW_KoYRwSlrML_Pv3u_2atf6-rHZk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE2NSBTYWx0ZWRfX4hvc5vmYziIt
 yhKCECu9iEno3ROx+7ABB3VdKH1jZjmWUYQ9wCbe0GXyaGDqNxe+kn6y+NVxbXt6anijDKpkauQ
 LkjzSQg9pp6A0FRMNv9CGgcE+AkHuhs=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad24aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=troJrSmf7mxZy0xkckcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lt5IW_KoYRwSlrML_Pv3u_2atf6-rHZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180165

Hi Linus,

Here's a pull-request with some MMC fixes intended for v7.3-rc4. Details about
the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git tags/mmc-v7.3-rc1

for you to fetch changes up to 4396d70bb7fec531bcf934fed016b2f3300c670b:

  mmc: sdhci-of-aspeed: Remove children before releasing SDC resources (2026-09-14 12:04:29 +0200)

----------------------------------------------------------------
MMC core:
 - Prevent potential use-after-free for SDIO IRQ work
 - Fix OF node reference leak on card add failure
 - Fix memory lea when the port table is full for sdio_uart

MMC host:
 - hsq: Fix use-after-free in retry work
 - mmci: Fix use-after-free in busy-timeout work
 - mmc_spi: Reset bytes_xfered before retrying CRC failures
 - mxcmmc: Cancel data work and watchdog on remove
 - rtsx_pci_sdmmc: Ignore broken write-protect on ThinkPad X260
 - sdhci_am654: A couple of fixes for the tuning sequence
 - sdhci-of-aspeed: Remove children before releasing SDC resources
 - sh_mmcif: Initialize IRQ-thread mutex before requesting interrupt

MEMSTICK:
 - ms_block: Destroy io_queue workqueue on removal

----------------------------------------------------------------
Diogo Ivo (Schneider Electric) (4):
      mmc: sdhci_am654: Move tuning_loop to local variable
      mmc: sdhci_am654: Reset command and data lines on failed tuning
      mmc: sdhci_am654: Clear ITAPDLY on tuning failure
      mmc: sdhci_am654: Fallback to DT-provided itap delay on DDR50 tuning failure

Fan Wu (4):
      mmc: core: Cancel SDIO IRQ work before freeing host
      mmc: mmci: Fix use-after-free in busy-timeout work
      mmc: mxcmmc: cancel data work and watchdog on remove
      mmc: hsq: Fix use-after-free in retry work

Felix Gu (1):
      mmc: sdio_uart: fix xmit_fifo leak when the port table is full

Florian Maillard (1):
      mmc: rtsx_pci_sdmmc: ignore broken write-protect on ThinkPad X260

Myeonghun Pak (1):
      mmc: sdhci-of-aspeed: Remove children before releasing SDC resources

Runyu Xiao (1):
      mmc: sh_mmcif: initialize IRQ-thread mutex before requesting interrupt

Xu Rao (1):
      mmc: spi: reset bytes_xfered before retrying CRC failures

Yifei Gao (1):
      memstick: ms_block: destroy io_queue workqueue on removal

Zhu Ling (1):
      mmc: core: Fix OF node reference leak on card add failure

 drivers/memstick/core/ms_block.c   |  2 ++
 drivers/mmc/core/bus.c             |  2 +-
 drivers/mmc/core/host.c            |  1 +
 drivers/mmc/core/sdio_uart.c       |  3 +++
 drivers/mmc/host/mmc_hsq.c         |  8 ++++++-
 drivers/mmc/host/mmc_spi.c         |  1 +
 drivers/mmc/host/mmci.c            |  3 +++
 drivers/mmc/host/mxcmmc.c          |  4 ++++
 drivers/mmc/host/rtsx_pci_sdmmc.c  |  5 +++++
 drivers/mmc/host/sdhci-of-aspeed.c |  5 ++++-
 drivers/mmc/host/sdhci_am654.c     | 43 +++++++++++++++++++++++++-------------
 drivers/mmc/host/sh_mmcif.c        |  3 +--
 12 files changed, 60 insertions(+), 20 deletions(-)
