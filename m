Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617258;
	b=AXNOHXJ/wuoltSUk2vEKgzZv8qIiUmA757Srs4XisQkytWrKV5CAFfu0mRDBKinMfQlh
	 LkbzrVgloUfGTZwGtlxoat7nnuN0GrLtuGDdX/aZwOScYklHbJttTojXL/rzrBqibRpiK
	 QqNixt6iCWemEMXWBzFRUGB7Txy55WxLWJyckZuzyE+rAqxwmRj7fGwc6mfYP4y+3oRk3
	 65j+UxtSevhAPTvK2im+go/D3brnEfzJmNd7gBmE0KxBGOkngsAZpYK0sfEcivO1vKw2g
	 mj+xmKX+E/WucBZB+K8zI2DgmcWncVHRAz7fdbHn7cZYivk2QC7+NFADclc1sWinsug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AXcAJiYjhnAAhHPPZuaZuaZYSgCJ50oa2Ib690f7nTQ=;
	b=Cwvb+RbGHhbn34oRAd3frT8saJrt4w9r+dRgKh+IUFOdbb8/Ge3fGJBL0lBDuoFwqtym
	 pnYFwOtOp6oWGbWhVaunICdQ8Qk3xNZEsko4UKcN9M8eMqB0XYz1KQmh4DRnNNv2suBZS
	 JL8XcPKSfkd0ct2d3s6jUnsyyigmq5+zxIOEcS/X064IUJyb12Msot63S/hx2QQaJd+g2
	 2ELXQGI5JPt+EZtqGyuZCNq/A4Jqg2ZXnaw6NNjCGBrt85OW7jN7JvSlyWlHzDhYWqeU8
	 O3Hq/ucdg58vQ/HS1wgvB+wUfiSSnzHARAiGjSU/pFbUFg9ihKM6QfhA5MPvmqja5Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GZm0wZmY;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF8A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GZm0wZmY
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so17500475e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617256; x=1794222056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXcAJiYjhnAAhHPPZuaZuaZYSgCJ50oa2Ib690f7nTQ=;
        b=GZm0wZmYDtbojUgtw7QKwO5u0Spw4gcCkBn7glHJnS1zUaSksUJf7RKkLvfYkWZjlI
         LhopI53C4wq5nc9ijxl59WFITMlSBh4Pfh1RZDEywyGeH3+SP2kjONAqGeo+L/+TIJgi
         uU0ZFwGr1Yj6dxuvOGm569XcZPOb5fvmIbBFroyj80tX+MWocpymunicDlzCKJeEUoMz
         IywXf2FX/uNkWCeqg033+duhA2NhgN/yPYJjvYkCzJH1VNehRH5eEmZ1GcACCF9zQ7tx
         ncx6/dLXMM6rHSZMvDuAhg1mcDY3NLvnG0nc/4UB3+VVmMHX+a1wK/00C1NpmFhIwsl6
         nIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617256; x=1794222056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXcAJiYjhnAAhHPPZuaZuaZYSgCJ50oa2Ib690f7nTQ=;
        b=UOW0eYWHKRgSOl0rotfdrT8N4trEjP/BGbgoDp+D1cV313GlaZIjShkKKFiGaNhSC5
         nRTEbLWMIhcOvsGY+25+NV5t+Jobg3SyWCt9wMyh4Q4jn7LmpSPQ50gZxbEP5TIRXly9
         Q92ZrcvVNuYpriRw8chJgyfJroBYgwICgevm+XHSAa9yTByxtn/tOqVRbiYqGvWRKTY+
         Nuih80J9PxDKnqhYyC/9g2WQdGZP3XNNTuJhonjocVqvHynClj9WhTFihNNq+uWOsgvw
         mjlfcZEHSlqtUlnGbpc2AIq/rnM9r43+vX0SY1UaJcMYG9YijzqwOCI+eriCRlK+l+KH
         by8A==
X-Gm-Message-State: AFq9FYKKIT4vyJGRZ0ouIbYPTNDwt6pZ+W/2im/8STbCfIc9GTTtVbOz
	uNgg8rjpgQylWz7Dsd2nOdhs9pa9IwiJ8hPwD65UV0p5zgnNW/4QUbyCaNbHdNboqlbHG2KpAP5
	rEgkbAnE=
X-Gm-Gg: AYBFou3xQjYqLm7FtlIEP2hGFEf2u718usGKbL4bCvZZXBfWfp8uyuOhl7mCl36fmic
	FlS9XfOlWoLu4NKqJZ6s4KFmbiFelMoFVdTZP1qhkYMCGmW9MJTWDbLL9Jui59rVpA3w27kcXVs
	0qIBVwjSf9ztTD9PoZ6IbBwZ3x7jaKiwRW+isIXbOvI3c2Xaws2yZtwSH3WAlKF8sRNjih1zHHw
	lsSOTW4jL8NqCvJQC8HQQfcEOiJ3NCsOYdt0/CKquxzBenCkJdgIli42gfeEssL5M6mJU62DOGP
	XFzyrMLKDC19LBQ8W3IC9kZibJPZqSf5OfWhungeFZbWjoio7owv2SM6Gf1x7yiiGGjrGcmXsL8
	C7RBgzc/0tZk00/HC3Q419ERQREmO1QWVp/0IdTZmRahGiubLVvQ0lwUO0doFtv2M9ucCnNWSya
	QncKwf7r6t+SkC0Uh+GsoS7/jHLqNH/q/IV5wjTUHRY4JTxl7nW/SAeexYWInU7aa/gFw/O4LM1
	PfG5E3s93fHeCQb9e3++QUIerlmeWWfQwUu9gy28kXUSThnEpp2IXJ+e1q2RPkHf4YV+WbIwmde
	YPO7YuYQwSFtQmby2HONottqNDMAkIrDfmpRm1Z2Idq5XYyhxDET
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr223272545e9.3.1793617255437;
        Mon, 02 Nov 2026 03:00:55 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm266236305e9.1.2026.11.02.03.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:00:54 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v5 0/2] workqueue: Make WQ_UNBOUND the default behavior
Date: Mon,  2 Nov 2026 12:00:45 +0100
Message-ID: <20261102110047.115375-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

Currently alloc_workqueue() make sure one among WQ_UNBOUND or WQ_PERCPU is
present with the current default being WQ_PERCPU.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they're needed and
reducing noise when CPUs are isolated.

This series changes this behavior as follows:

[ P1 ]

  - keep WARN_ON() if WQ_PERCPU and WQ_UNBOUND are present and drop
    WQ_PERCPU.

  - defaults to WQ_UNBOUND except for WQ_BH, that it is always per-CPU.

[ P2 ]

  Documentation updated accordingly.

Thanks!

---
Changes in v5:
From Tejun / Breno:

- Dropped the pr_warn_once() when neither among WQ_PERCPU | WQ_UNBOUND is
  present and add WQ_UNBOUND.

- move wq_dropped_percpu declaration on top

- improve comments and commit log, so that it better describe also the
  reasons of this change.

- prefix "workqueue: doc:" on documentation improving descriptions about
  the flags.

Link to v4: https://lore.kernel.org/all/20261015140148.231126-1-marco.crivellari@suse.com/

Changes in v4:
- WQ_BH: add documentation about BH workqueue implying WQ_PERCPU

Link to v3: https://lore.kernel.org/all/20260904141421.287647-1-marco.crivellari@suse.com/

Changes in v3:
- WQ_BH require WQ_PERCPU

Link to v2: https://lore.kernel.org/all/20260903165251.481362-1-marco.crivellari@suse.com/

Changes in v2:
- if/else to add/drop WQ_UNBOUND/WQ_PERCPU moved before wq_size assignment

Link to v1: https://lore.kernel.org/all/20260903152204.401638-1-marco.crivellari@suse.com/


Marco Crivellari (2):
  workqueue: Make alloc_workqueue() unbound by default
  workqueue: doc: Update WQ_UNBOUND and WQ_BH documentation

 Documentation/core-api/workqueue.rst | 14 +++++++-----
 include/linux/workqueue.h            |  4 ++--
 kernel/workqueue.c                   | 32 ++++++++++++++--------------
 3 files changed, 27 insertions(+), 23 deletions(-)

-- 
2.56.0

