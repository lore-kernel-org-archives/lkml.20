Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F8F3C09ED
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531220; cv=none; b=O5drM5z4nIvz4lYscsB6uFtddWZdiL7Eeblw3B+83eUbAGmqTTdilLMb320ThZN35KPYQVlYeRNIPJPJ/oE4yvBfW8zvnM/l/wXVLVuUb4BcC+CZoe1CmkU72y64t6rarlF+2ntT3DghlmvtUXpLhifzdeiIXKA8V+b/I5UJTug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531220; c=relaxed/simple;
	bh=DNeUKDQc6MOqH1ADnGtMgjyCzwqfg807JsDXZXD8PdE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UwbF7FUvJXjcbX63brXUfrbuTCmbWT7zSXigQEzbHru7+egWOMoT/WLPFIhv1CNP8EqcoPgwpHzUjLBhx4YO0rntQMLC9AwILR/XVlSZiSJDQvf0lX00/m01MPuhylgiOXFsQBSuQLLkPusYWdCLwvlMefX7NIYqoLDiota8y8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmEO44SE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmEO44SE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so32031045e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531217; x=1792136017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxQ45OeQSc5IyxmrCu5z0MqBw+JjYn7NVXImWxo9iSQ=;
        b=WmEO44SEUdt2owfjB9YzQUatK8n2baFMrDOnhEHIU0pts+OSglFWH4l00AqJ7kiqqZ
         0mCb3GF19TXkzwtpEd/9hotq7VKKSeQ2YmMtxHUBPydWWrJM1l6ZeG4Dlx0YhAQRXkDj
         juhg7d9BN+Y9vacAkr9kIMSLJdDuETNB63YccKnAhA9wXX0y0S0z2l9gG285C7M+ETOH
         /YdTtvmZs2J6msVcHf3yOgEpfdHYB3JrnZiJyRfpfdAEjPafsZWtikiyVn6qPfXC/ejb
         OeJbkC/Rtnkg53MsLOfs0QeW438LZk1MrUNMPiBb1qJsJwZL1V2PMdFGU87PMKPWkZMk
         i/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531217; x=1792136017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kxQ45OeQSc5IyxmrCu5z0MqBw+JjYn7NVXImWxo9iSQ=;
        b=hcWHyyDiRGJVJYRDfMM6KBuwyoz+PQlc6BCT/iZM8eekgW39mDJl5Ny09FRG5xrVv7
         ckd+TJ55uJL5Pe+5fYbbdHbl2crehf/BX2j3H9ml8H7o0LWkCsZfiElMmb3kvScnfH8I
         lFn6iw70zPsgrUcNiCGFeEEYLZi17Xigvtq10aKqpbtQo9G8tU9xp4xIpIguboiCsG1l
         fjx6u9ql1NiCRNnCQGptUl5hqe630acROBReV84zRyTqfVnoiZTIW7E9+iklg5jwu/cN
         RDIvzTB5/e3nvlbXWd0gdRi9XjtNE5soPLMoo6TVufWG+JZp5tiF6KKi8oq30tKyWheM
         6nXw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4HKqVmgJaYokmhmiuUjY0QruATtOz0iHmDwcBaNw0TvKQg3byfSfiB3S8ViRGUe0W21oBHCZQ+bCMHE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXEwFJoMkLGz8+aLfQZzZmemYVglX1IWcba1mHAFGCClSE/7ig
	5wWGLnSdhlT84CJcvwJYc/UQ9wr1qsVre5YNzJf5voIZ9TWAhRJaQmsr
X-Gm-Gg: AYBFou0Z1oVvtKOVqdqjLRNpOYJoOXB4iL3B6v+hi3fy/naoJIHJTEdPYN//nGDc22t
	OlOgr41GL9Su34AIKxLvHj5o+lLNXbOvwHS5Fle9S3+YSi/L4e62jEHu6jHDCAR1SbQYajyb+aw
	nJnBoVpUd4jr1nE6XDwq4sEkQfZ9/kJfYMTgpHkERvsSk07rlNVtnpYdVMD14uMZrF7VPVg5WZb
	I2XUJKHXKZ4pgI8ERPM+LbGfEtgX5yoUeuH+TDJGPo2vwhWmwyhnrE0h7gVt2z9zbQY3bTu+Mz3
	gKUPQwI+y4dWYWVscpwyHx5Dyj4lS49A4q1bDhDPsIiyXlM9dFqjqDyLbcyBCsRpO9WFXeZh7QP
	3zVuvZYcE4ITyYTOYAhHbofOrOlEyn88nLZUoQ1YJeI5tVYUC2G8yUCHIUhF0p+EL2IoWx0+saN
	8YK/paTLxp/AuAXKOp/KOqwLNHaFakRTZOi9jip4M0qgcPGEcA0FJ+wIoUzsRBOW1mapNKpuol1
	HimpN1toQW9NvX1iiK4H3/9dcJd8jDPKRJV3P0nzpfPYEOTranEJiERz/8EwQFmWLIN6elDA3L7
	pgzGeZOGh2AHx7wrKw==
X-Received: by 2002:a05:600c:3b29:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a18e49c420mr17004555e9.18.1791531217099;
        Fri, 09 Oct 2026 00:33:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm55116365e9.6.2026.10.09.00.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:33:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] PM / devfreq: add Airoha SoC Subsystem scale support
Date: Fri,  9 Oct 2026 09:33:27 +0200
Message-ID: <20261009073330.18175-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC contains multiple subsystem that are scaled to a
specific OPP taking the CPU clock as reference. Such sybsystem
can enter idle or performance state based on the system load
and power consumption conditions.

Example of such subsystem are GSW (Gigabit Switch), NPU (Custom
Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...

Changes v2:
- Rename to a more symbolic name
- Address some sashiko bot warning
- Better describe the use of this devfreq driver

Christian Marangi (2):
  dt-bindings: devfreq: Document support for Airoha Subsystem Scale
  PM / devfreq: add Airoha SoC Subsystem devfreq driver

 .../devfreq/airoha,subsystem-scale.yaml       | 114 ++++++++++++++++++
 drivers/devfreq/Kconfig                       |  10 ++
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/airoha-subsystem-devfreq.c    | 100 +++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
 create mode 100644 drivers/devfreq/airoha-subsystem-devfreq.c

-- 
2.55.0

