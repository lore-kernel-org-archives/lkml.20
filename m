Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844276;
	b=Wm4TMLRauChSo6yXf6p+nS/m7JdFxXe8DdtnyVXWm6rTdN7kyvP4k9Hkd4NI5oWMwprL
	 y87kOpfeKQ8jDOPVVDO7eqK4LGjI4nx3A7mAnQG9V3tI00UhaX9qJLrL8aQ7KDz/Ck1tC
	 eFKlFl/endYVerv6z0p2xGGxoPRFpSUP3tMP91487bolQOl2Se65k4mp+JNM/5SH48WMB
	 JBwIeCL4evL5CZLI/Rmfe1CloAgQIAN6H0OkEA1PhyehtlLwAyHeVpKEROp+U1lAVyLzM
	 g3NwjycKxpjvctx2tkJvD/nehvegr9JuF+cyEdO5vAP64X0Q7+sGfo46X+YkfRo9txQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KuEmaduXqciZDVP0GI6ZaQ4598wl41gB7SolsK2cplM=;
	b=3zAt0HIayHTk96vebJraI6P/Wi+JNMNhFnNlx+SYhnB+touGMfj80AvcyusyoWjXGqCD
	 Rr7zFITkTRSnjP2QvjwbXMHmqA8Up1jLePRHCdQJ7Rz7zQqrzo6MeHYJPCdQdeyp36szh
	 0IJ05zhpk6KVSSYASCAuBplpHIN30JaTeBbDjf5WhF7NvnI04bRxuQVdZM7IVJe2f99hi
	 IpiIm9S+BM2wjbEjxl0UWJG0Fidxqf6Hx6445THC+XmD4o5VxdLVEbjzkjownp7VSTSw9
	 6QXcybD6d+i0L6jztEaTZOXcPrlyFdftgbUN48EeRGcSL6Mf/o8LhXriy0I0bLGia+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Eq3XQJno;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Eq3XQJno
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso41286565e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794844274; x=1795449074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuEmaduXqciZDVP0GI6ZaQ4598wl41gB7SolsK2cplM=;
        b=Eq3XQJno5POIUugEpYPzRDqLrfBR6gzuxKn17bJSJLQ5+8rWUpj6KskKJLKcyjEgbN
         f5WY+tr+UHR1bOUzcZGnoSSDH1yhip4o4ouipVuhBG/iIIFB/f3FFPX2rKwJkQtPzf3j
         Wn2vMtNzr56RKyqzQfWq5gAebW6S26Kdiu1KYV+paZxNVozmKfGfIHatqVPGUk0i3wQh
         sXWzXBxGBI0lve57f0LCpNXVIfuhIRmLItImnX0ZEVuUKOpV2euWJc3zLEOqW0f3KtIH
         PW1I+bPPkCEMgfDx8NwHLTuAcTUOnpmvUAuDYJzWThLOyCfM0ZHpRc9EUeDeSy3gb0ZV
         1jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844274; x=1795449074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuEmaduXqciZDVP0GI6ZaQ4598wl41gB7SolsK2cplM=;
        b=flPHD4PXWrjretk7i6L5nTCyo7KCLduQkqNRFH2nN7EzdqG/kggDJdMlRjm1m8y4Gr
         MEdqcdr23Y0hSQ3N3qTsRFJktgF58bA6v7K4HIimo3S8JyCKlJoq69kHS8d1qQbTs8In
         8AFVAXkmC54e5tAIihL2SdCgy6RIkoY7ktcuBx+aPGl22X7gjDLKt2FAM1xxl48FX6jS
         uogabGNUKG4qzUe5zn1xuN5waw+4f8zXIn8qHWeILmUu+pzAyswKygKDcBSYYkuV7Ecc
         O05jbsB7FDhzVVVCxWdm6DGCWvT8jnq0ErOWkzrNtOfGx5PBo7pGU+e+W1Hmq8rUKD/i
         L+2g==
X-Gm-Message-State: APuU4Z/hX8M5mHWVr0UZfCLoPZO8wDzo0GjE3MGsEYnInyArDtRFWb3q
	bDofM7cdQ8S/27Tv2UHau4EbynPm0T1iVoqJNNQrgHlkDDciZf/lOSf+pI5ZTYc5XNq9KdKIuap
	f0SxHe4k=
X-Gm-Gg: AYBFou0uoAfL94R6TjGg0lNCTVVtm/PmRGx3Sv/EBzCgwzoaNIzo7GRVMes3CfFAPHG
	SjOrqecaI83hf0UtOzAx/0vS//Zkep8rzSYBLQT4ZKAhJm2xctQ1piujF4BfjNw5jIIOKazVKA5
	djoFZSkihwPGk9b8kOdn3gNUrzn7Stme4T/+p0tt09kv7ObqMEV2mxkWast4I9ojLCoOwZKw2UI
	rZf8dYzDWVVVr4aDHrCkEZdbr5lMHk44SRjDR5ItSIEabp+oIf6+T0jawIEwEGv+FhuGE+1AQMm
	Y2nHR8GGGsQuAzxB62rd+sRzBf52V9/GKB4/cx26CIWaZPKLoz++S0OedsBTdOPsY6IV5ZVsdCz
	J1ZosGk8G69zDikKm7d3+0XsAjsgtsY93FdW2YPou3jxRYcx6VmgiFH01Cqw34t6MqiSr28ph6l
	/MAuo7y02HU7eHy5j5X7H3tqRRS7RCpYEXMvw6R/5jkSy9LVsVHjh2dao5DktJdJwAXSYccMMB9
	2efTyz8jdfVMGra60WFu0DdRUZFiPfQ+rhPirYzX7qfArWMtnNhSTl0xbeYWIbO6c56RXfyWW16
	Cr9ol8Gm2P2X8YEU9y3InzrH0BodwE3RX+8IJmL8Oy7lYLrApHs=
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr152337155e9.34.1794844274043;
        Mon, 16 Nov 2026 07:51:14 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb679b7e1asm298063515e9.6.2026.11.16.07.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:51:02 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v6 0/2] workqueue: Make WQ_UNBOUND the default behavior
Date: Mon, 16 Nov 2026 16:50:49 +0100
Message-ID: <20261116155051.157875-1-marco.crivellari@suse.com>
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

Per-CPU workqueues provide strict CPU affinity and concurrency
management. Some users rely on these properties, but many don't need
them, and for those users per-CPU workqueues significantly restrict
what the scheduler can do with their work items.

Unbound workqueues now use non-strict (soft) affinity scopes, so they
keep part of the locality benefits while giving the scheduler more
flexibility. This helps system-level concerns such as power management
and CPU isolation.

This series therefore transitions alloc_workqueue() to unbound as the
default. Users that need per-CPU behavior can still request it
explicitly with WQ_PERCPU.

The behavior changes as follows:

[ P1 ]

  - keep WARN_ON() if WQ_PERCPU and WQ_UNBOUND are present and drop
    WQ_PERCPU.

  - defaults to WQ_UNBOUND except for WQ_BH, that it is always per-CPU.

  - WQ_POWER_EFFICIENT description, kernel parameters and konfig
    description changed to reflect what this patch introduces.

[ P2 ]

  Documentation updated accordingly.

Thanks!

---
Changes in v6:
- rephrase cover letter

- change comments in workqueue.c, workqueue.h, power/Kconfig, kernel
  parameters so that they now reflect what has been done.

Link to v5: https://lore.kernel.org/all/20261102110047.115375-1-marco.crivellari@suse.com/

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

 .../admin-guide/kernel-parameters.txt         | 15 +++-----
 Documentation/core-api/workqueue.rst          | 11 ++++--
 include/linux/workqueue.h                     | 23 +++++-------
 kernel/power/Kconfig                          |  7 ++--
 kernel/workqueue.c                            | 37 +++++++++++--------
 5 files changed, 46 insertions(+), 47 deletions(-)

-- 
2.56.0

