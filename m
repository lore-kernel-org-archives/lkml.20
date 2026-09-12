Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F8299920
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789207660; cv=none; b=TqVUXU7ryyE6WJWLwi5WlxG//yfFNM3S9rHeYAVSE8crWkyXWDMi3lD7Tv70PorMqBfLhUQWWN+J+zq+FwruLL7c+fJ+mf5oUhWwwFvqU/kgIYbXHP7LLYTtCfhM8GZq6VxQ7n6PxxyaW+8ZrQ+2eOWyJLqU2lO4JDH+QC9Zfec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789207660; c=relaxed/simple;
	bh=hjWyHqnt4kcz9w/PUNO3gQLvUPkwlPB/MGH1/V5pCoM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lp8bJO1Ws4rZFgfe/WIAFhB3aNmc6J6Ea+mE0nNL9Itdb0uHsdDMY8XsQwvb/zDX0qXEyVc2GHM2u1EOwEgQeD+h5J+IKsSPnBguHLEQPwiPbcA53JzTQ1LjTMZz2N3wPGqXD+38AjPJcTV5uODzzrmX+3RY2UAdzfgP3ihpGGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbiP6mof; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbiP6mof"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so3119685e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207657; x=1789812457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hOyG2nrHECF3VQfVstDdXpYoOnMejT29j+W3a7NumM=;
        b=GbiP6moftlPPj9KCbK09958yfm5y9offPVmKVZMryQyCbBpB4hGmirZPsPW3/SMxW9
         6mot2TL1PdkTQ/eXn/e0yzL8jizC9HP27drBHNjsIKgN2uKqy5UZHvhGI+/jguJmFf2q
         um/MiOa6BwcUqALogXvhlcp92oKybMY+WxXlTvdvjU/IG71n8l7EivDBaAOXNiO8yD8A
         lGJWvuTyCBWCmXmiXwfn+mY4ZzYRr3Hq+9dEAxM4vohuc27XoNlu0/7Q4J0+BJQyieb3
         vk58N7rk5bujf5thRj/kGDuqxfuVmBKZvLivruzKge/dN2PCNI6eIVPZQpHxF+mw7BsC
         7lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207657; x=1789812457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hOyG2nrHECF3VQfVstDdXpYoOnMejT29j+W3a7NumM=;
        b=jWHOjKpZ705TrRrBjazftPZlrbc2uZbDrRSMji0dHd3nYoPuiP/JKF+TYjo4UQE9T6
         rDrKoI3ZkSi2mRYB0EWXa3OQcvvWipLW34VB4hplrXx91cP91XVZSjHmBj8Uc+1oHFTi
         uLn5J3OP2hri6O9iUHaLkl+c9wJSXxyy3Lu1hNOreMoNNhL27fJZ64d1SPbjbuYt9Fus
         qzNZ9U0EcjB4TbfvpIxG1w8YFldo1PSZqT0tNlriVpuynZILmg1lS9umm6rpcXJ149ch
         MgS4Ob3ydlhLN+9a1xVxIhaD8LDYSTGu8EgACy7ig62KLgj74b4Xft36SStkmd0YnEjN
         JT1g==
X-Forwarded-Encrypted: i=1; AKwUvBxEA8Idol2SCoggMLPSrjQCd+jEW1T6SSaFZP52fMbr3xlpIcQa88koQNJLUg0u5Cgtxkr5BA4Z1kv+dBs=@vger.kernel.org
X-Gm-Message-State: AFuF++nb1oSPaXkIZxt5xzcn15IUuD4n7BPri0F+jKjvE7PwF4cDmaAH
	OYXDyifRGKhGkyPE8kWEn/Xm/3ai3hd+B70e7gOe0aqbsGxlt5CLic5U
X-Gm-Gg: AYBFou14vW3RrjotH/lE7vwTt040JhPiJJr5nHZSyLjHj+mEyyBNurUndnXSQQon4jv
	lKC7I/wboP37DvPldI59JgAbSUdZLHrHt4G/Qs3lOtwf7eSqdppvWO76LhAetGjtYS0lHOAxOu0
	XeI8XR/79/hHQL5vSxTaPsSOmZ1cddbNdIkmhue+ZKig8JXBeViN2JhPa129/j5f2eXkazrSKin
	k3naBleX2GMWKOxcdg5ex+O6JChus0SB1FDPPY48ApiQadZ/iImQeaD9n2eVy4i3XKQAZ87tv0F
	WOd4bl8c8wY/NoUrXBya024yMZY3jOeMBtTSpxxtWcZl6aDbBVkLTdJ8mkvHPDAU/V4eBvvFH+N
	1Sm5LwU+aDIzTD/Z7iDmyMzqU3uoC1dwTXvtaBlw+d9MkJminZzfIelKY+/8DLaFQJ2NCEs4W2w
	hhXvaA1i/PZGpg8fXb6PBOIyNxKTDoCWmeoDU1BrMN0hgBQxMFjBlsf2ftolABqN2yK30Q0NqLS
	zeE0YktqFRO7qFDhzFjdAbQIdxLmw73FnHTD2eHTJmfKMSOgujw1MwReyPrANPNI1u73azYz/nv
	45Nj1hR2s1bG+zNmuvPcrpjF4Qid9cUR1US2xfrwjiY4so6htHYZJSoBVrZFtSJjPFxD6a75SQG
	HuA==
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr157482605e9.14.1789207657237;
        Sat, 12 Sep 2026 03:07:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm164341085e9.2.2026.09.12.03.07.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:07:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ABI: coresight: tpda: Correct the kernel version to 7.0
Date: Sat, 12 Sep 2026 12:07:33 +0200
Message-Id: <20260912100733.86226-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nine TPDA sysfs ABI entries name kernel version 6.20. All four commits
introducing these attributes first appeared in v7.0-rc1, after the
release following 6.19 was numbered 7.0.

Correct all nine KernelVersion fields to 7.0.

Fixes: f9cc5b5a9e9a ("coresight: tpda: add sysfs nodes for tpda cross-trigger configuration")
Fixes: 8e1c358a3b0e ("coresight: tpda: add global_flush_req sysfs node")
Fixes: 33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR register")
Fixes: a089d585a7f4 ("coresight: tpda: add sysfs node to flush specific port")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index 650431feae45e725d4cdcc5f029a5d2a908ca2ed..0140ac97725e063c89a5d36a2ea5ae918ffb606c 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -1,34 +1,34 @@
 What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable cross trigger synchronization sequence interface.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable cross trigger FLAG packet request interface.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable cross trigger FREQ packet request interface.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Enable/disable the timestamp for all FREQ packets.
 
 What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
@@ -36,7 +36,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Set global (all ports) flush request bit. The bit remains set until a
@@ -44,7 +44,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/syncr_mode
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Set mode the of the syncr counter.
@@ -54,7 +54,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/syncr_count
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Set value the of the syncr counter.
@@ -62,7 +62,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
 Date:		December 2025
-KernelVersion:	6.20
+KernelVersion:	7.0
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
 Description:
 		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
-- 
2.39.5 (Apple Git-154)

