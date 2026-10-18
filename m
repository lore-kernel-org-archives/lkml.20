Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344CB13CA92
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792285269; cv=none; b=jdsknud5MQs7EA2K0004/dki9/Y66/+zeLtvK5cV1gzdeOLWnKfCHeIcu+lShnzbSxBwXz4cyr5Xg+TxGgUEiGOuWfj4KvMqSrcSZjk6A2uMMMBLDCu17BELKyPY+ghksbKNnsXB9Qg8qJi+ESGWZE0ITd6pLmn7oOElKKQktuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792285269; c=relaxed/simple;
	bh=qFX43rE26abK1ngPEyeaUk0LrH+VFY+ygfIqQ/4iWmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ENw6SmHI18N2t2GK6alUJaTedJaxTl4+jyBCzk511fOqyA/n22ka0pYBFNkeP+9IpDTnFgxjw+EJmM8PLMqvnfG5l1Oiee283xTbzsMUiTiMVCJA8CC+oePhh5/rGe2KGGhcnhyDkmGzSrc467fpQFtBhhgmDLX1QGOxMZdBBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=LOVYRXJV; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="LOVYRXJV"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso1885081eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792285267; x=1792890067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fP46F+XvGnx9CdMMM+Zzwz/exfVRKEgKwRy73Evl4hs=;
        b=LOVYRXJVG8pCxVAG2rhRk2leg7UJFY+/a/5hXP2mmNEWt7LsVrX5PLHDH4AyGV8PUP
         iVGWZazckTPFUBRshn6daMLx8bmZIiQFEsx5grrtDiLea2XXV38HK68yq4knVD0AMrR5
         MCPJKxrV/V5NIp7UhD4sPa5rEsRodvwx442OaL2U8YJHydQtXNHXGoCp8ZvMbaOz7tMa
         7yPx0LqNYF44nWNspCwzWHaniVsktyDvYVgMvycVh5/aLuDoXgMZ4QagYw3y+mSbupR0
         rYasrx2qjdAgSs6dQxTo0f9LRucoMcESyDzYyqezRO7v5+dtav029gDJGad1rj2oglew
         1PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792285267; x=1792890067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fP46F+XvGnx9CdMMM+Zzwz/exfVRKEgKwRy73Evl4hs=;
        b=LNmLaUn8fhP/jKe+5MMtZIQVMJxbgXjUuQUgjgyuPJCezEXi42LAwtvWyl/3FoUNZW
         tHYw5k7dZcj51zGNcYIFBrn+v151QRfmjEIon6aWSNAa003o38CNkclCLOwXunaPDouM
         iMKDA1mzCsWn0rzAaR2c5FUXCpgb9rFmcpxila1Ct0IkNqCXQZjHKVE7aj8EA2hxb3ZC
         aM3ZmthtWpzNRjYzTPM5V5iVRx0uRul5q4Q8rFlpsOYyPoMkMJEDV0txOBlBEl+Z4d1x
         2q1oNvpF9wSwY874iM10jZcIUJSTE/NWKxoGRQYgrvC9q2hnIPXGN8Q33ZF8m5hhoAb7
         jZ8g==
X-Forwarded-Encrypted: i=1; AKwUvBweblDAMxkRHrZUn0kxjfRVlIEOAKRGAiDas0HbM9eAjQpNW9hAnLMer9jJsAcX3B/m5o3xNySzFWTU7E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNuivdfy8rDDKfR3Ka4BBIZTXsCLCbgmNrH4xJUrbmT8ADFUqu
	pHEoIB7nVixuxYtcwphuiRqBxOeahN7IBU9sNFhv0nvifG+KLvl5kBkCAsBuzZnt1DcHPfvgq70
	dfKyn5a3nfA==
X-Gm-Gg: AYBFou0imJGXikXub1kUJNJzCpXp5pGMP6V2rcyou3W9uTgaQCPZgNDZsxKsV/HOPd9
	ORr1l51tvasJOvt0UjyZwjCKdCA9LWdkXQxlu8WIp8ojvZI0z7IDqMXILzyKM+8PVRoIasuncjd
	LiqjAWgVi/EMEwKhTGRHFchHObjSP3Y73+xB7AGwKS20KrItV/+n+Yve4li3lmFrQQjpmj0MXuF
	E0sNwqryicZ9kPsWn2ei1Rw3JBT/lgPUQrpNFuRQBDUudlPWRukxhY3fVzIwLM6tOW8onIAT9f1
	bJ4IWyJyBhdJa3LJSyhcpQIMQp8e+dZVi+WX9Ur78D+b7Jv0tJZGfBSS15m6hLXrFBGHYhY0OQJ
	wpy0d/tWSdGflyqAIr+XOA3a1BUh85K4oZdauByHMGdW86LxQleM2PXSnTd1VkNEKlE8b2qlBPw
	MMyBh1W77lVPiO4nT5HZr2VFfl4qQLXj9jKX0b8DlDcfLhqIYDvMtYeo2B/Ygp2nq3EFXEdNk5F
	RYlMsxcPBtUhpmKHeTDG6cEgXtjxKORcZm49rTajqgA
X-Received: by 2002:a05:7301:71a4:b0:361:344d:e906 with SMTP id 5a478bee46e88-361a195c23dmr5957696eec.14.1792285266951;
        Sat, 17 Oct 2026 18:01:06 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm24198870eec.20.2026.10.17.18.01.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Oct 2026 18:01:06 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v5 0/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Sat, 17 Oct 2026 18:00:57 -0700
Message-ID: <20261018010059.83120-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On hosts that partition their CPUs after connect time, the connect
time io_cpu selection can land a queue's socket work on CPUs owned by
a different workload. This series lets a control plane set each
queue's io_cpu directly through sysfs.

The first patch adds core helpers for a transport neutral

  /sys/class/nvme/nvmeX/queues/<qid>/

directory per queue under the controller device. The second patch has
nvme-tcp expose io_cpu and managed attributes there.

Changes since v4 [1]:
- Rebased onto nvme-7.4, which sets up the I/O queues in parallel
  (61b0ed3be81b) and serializes the io_cpu accounting with
  nvme_tcp_cpu_queues_lock. The per controller io_cpu_lock is gone,
  and the io_cpu writes take nvme_tcp_cpu_queues_lock instead.
- A queue's directory now follows the queue's allocation, added in
  nvme_tcp_alloc_queue() and removed in nvme_tcp_free_queue(), so the
  directories match the queue count after a reconnect (Nilay). The
  core allocates each directory and its release frees only that
  allocation, which drops the transport's reference counting and
  completion (Nilay) and fixes the use after free, the controller
  leak and the teardown hang found by the Sashiko review of v4 [2].
- The transport creates the queues directory once before the parallel
  queue setup, and the kerneldoc states which calls may run
  concurrently (Nilay).
- The user assignment flag moved from the core into the nvme-tcp
  queue flags (Nilay).
- io_cpu is read through nvme_tcp_queue_io_cpu() and written through
  nvme_tcp_queue_change_io_cpu(), which carries __must_hold() for the
  context analysis (Nilay).
- The sysfs store collapsed to a single path and no longer checks
  NVME_TCP_Q_ALLOCATED, since the directory only exists while the
  queue is allocated (Nilay).
- The queue stop now clears NVME_TCP_Q_IO_CPU_SET under
  nvme_tcp_cpu_queues_lock, since a store may move io_cpu between the
  clear and the decrement.
- nvme_tcp_free_queue() drops NVME_TCP_Q_IO_CPU_SET, which also fixes
  a ledger count leaked by every failed I/O queue connect.
- io_cpu parses a decimal cpu number, and the ABI entry describes the
  directory lifetime, persistence across CPU offline and the behavior
  with wq_unbound.

[1] https://lore.kernel.org/linux-nvme/20260927070925.47209-1-saravanand@crusoe.ai/
[2] https://sashiko.dev/#/patchset/20260927070925.47209-1-saravanand%40crusoe.ai

Saravanan D (2):
  nvme: add per-queue sysfs directories
  nvme-tcp: allow setting per-queue io_cpu through sysfs

 Documentation/ABI/stable/sysfs-nvme |  29 +++++
 drivers/nvme/host/core.c            |   6 +
 drivers/nvme/host/nvme.h            |  23 ++++
 drivers/nvme/host/sysfs.c           |  88 ++++++++++++++
 drivers/nvme/host/tcp.c             | 173 ++++++++++++++++++++++++----
 5 files changed, 299 insertions(+), 20 deletions(-)


base-commit: 2e8e30b3cf9f165e1a1d079331543cb7f2ad0e0c
-- 
2.55.0

