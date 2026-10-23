Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796679;
	b=LWzRKeb2zlebnumaLVaO2CBTGhn7d2iqGcflQnTWXP5m7452j3CPpHo9hRxXmRMFIfuy
	 hcBVzJWstm5yqK1M6qogtuni0TW+AvrNuKOx/huquGuFnNLgd3ZHmNJK0M/rhCOcRTCQQ
	 3e4cuG3+HDILFAG1/4DwyYI0H2HcLeC17IIxPitFTdH9Gs1gpunk/0g/Cxg1g8i62oY6/
	 EThC+m9PI8E3n2VtWcfLJFxNe/qfS6MbL1mAM/N5Aq1YXebaFSuvh6iPlUcPhNoH9YE6n
	 hhNj41TVlyS1Oy9Vjlb7Qs4y4XPvegOIZdGEeyn2TEv4LlJ8Oe92yVvu7fgB28kG5mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=doBOOM8Cs1fNLKQHQX6YPzDm/RUcBypchsyN9Gs0iOo=;
	b=w+ctC8Ve3a4DTeU2a7QLR57Qf2XvgyOGYKXk6IUwsJ0ro4imXKJvtIM63JjlAt6TW9bw
	 U4ER5JVxVIK5T7gUQGYXmo1RYjKGtJ/kN5AAL1Dzblur8VPlVrUylYiqHALZqOc7F3tUY
	 OF/uEUQjpOXdxGqxfLaG6E4uxI4ZSIhVLcBIoanRZwgZf8EgV0H3/nvvU5QyWh6IJknAE
	 VdttydOBUOjTt5XIjhN5bQ5VXbOPec/U5FqV3nSuSHeO9RwQGiJYSasln3otGc7/Naeyn
	 0zpQGRxKNbL/x9MXHhdZ2YGXA1z1hD8rysGltFAZTu6xyV3dMg69OBnqWCgMD8XRwjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=CrmQ0uB8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A787606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A787606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=CrmQ0uB8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2379524eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792796678; x=1793401478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=doBOOM8Cs1fNLKQHQX6YPzDm/RUcBypchsyN9Gs0iOo=;
        b=CrmQ0uB8kAcV59iRl78fTLytdfWnT22NUcHmFpAM3h0yel1KCci/XGw5N8LVbKqU9X
         q6ogJP5N28+oFjbFdrL85EjaY0KIzAlobQa4uCf8lixgwuz9IhcTlo4yLSpQOoTli0KR
         6OK7Jm9hggHneHI5Ql9hB2x9BK0FJc4wwq04rewRA1SiFMvM76Lq+kOvTmYzo8WWCA+h
         Cb6Dx4hpo41fq1I5MEPBKqyVvUjwy9tgoky1nVHlQb1+JDr9NVITecGwcWHzyGYjv+rG
         wlpRjuSffb4vTszbakpQ6Bc3bjVRlfrdKPiih7phWyjXbukaOkvilLeKpBY1KHS0lq4r
         ZxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792796678; x=1793401478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=doBOOM8Cs1fNLKQHQX6YPzDm/RUcBypchsyN9Gs0iOo=;
        b=YGltJugBuyObRwjc8eYJUzgOXieNRbewRVziU9um4wV7L+LL1JvVYly+pK6lszB6yh
         yEla7g8HFJhaxEKGd62MXQE9o/6XqI6Rzsd3bJ0IUbyb3tkIuqCtKTn/uHn5BxsxpPCu
         Cefevp+iiFmtCjOmJUbC0D7BJ5j6yQI29gIS99qkk+dlxjBjKmyYXqSJ+vZoejPsGBpA
         mveZckYowY0GOxskP4xuOHQhoKpYSvBOS616mY7ubuzKYWFYQe+gHrmULoWCPte556ZX
         TvtW+hzwQ4KAmuIBEAb8O7D5Do6Ly2YW4MlA7IpVVb1U/BqFQH/zI9bXxi7ZaNHNjcgv
         VO/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSYS79Y02LnjwfBP5xtcYrzia9vNM5JOIOPV4T0J6MAmQYmlh1bNi4voEiAox1hM52eJgME3uY1VQFiL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrM5GuOYpI5UAXpM5Pnj4cgSvdlujFiKZETYyuQZK65/xlKz4I
	wu/CG1S4XGjm2MUmaxsbUg6IsI57p5lH097+qIb1igAvnKoMFYOnzQLC3ulwN7aIwfI=
X-Gm-Gg: AYBFou27bOWjCVniu5BBJ38H0w0Sx8pVqRW5b3AiMIm79FNvm3aph3hsDpMUJJBRL+B
	Megy9Bw1juxPj2tz+AbVEnA7RJYUPROSWwB6jYlQqbkq29u2zyI3PUGcEKeqlUeOa8t/jeZS0xR
	kmw8u4HuRp+MAL3wRF7NOMSBEmFXrKrlUnVBx3T3d4yQbeQQs3KHvzcu4KRJggajdAzbsajQskj
	ii6GfUOhXxn3bJnPUI+SX4m4LqjSRo8hhyBZEP2iS6KLeXZCPMmUHPRn/PEMO6tbKy1JEUhPC8b
	lA391Tyt8QlIKJQHafqk/yGYMRs9sKItldJ4C+dydsdL07miR7UOILbz143jYCrs0Jcf2lmeemp
	nikEgHnL2gn8tX25c9EqndlsrmrvkV9knoPMoF0B/LAY+VlUbHjumb5La9clzqw0WhIjfOJfwAH
	NAz0A4xfMRvEcwq/X6qSvFdGESUnzSoL2vGqAOhm/G28qnvl/o1X4XVfDTh7/I4q8t8WBpHh9ya
	jenWfYWMQMzdBduF6seiqMiQtvHy/5x9MZK3V+bptNOiR70DTKwVDKMv2T0fv1ym/pBk6QMM3PE
	SRYp/pDXPSC2klKfPjh0pHpl6Q==
X-Received: by 2002:a05:693c:41c8:20b0:366:cc5e:5b7a with SMTP id 5a478bee46e88-369e8621badmr832595eec.41.1792796678263;
        Fri, 23 Oct 2026 16:04:38 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([67.208.231.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm1356203eec.27.2026.10.23.16.04.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 16:04:37 -0700 (PDT)
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
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v6 0/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Fri, 23 Oct 2026 16:04:24 -0700
Message-ID: <20261023230426.6425-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
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

On hosts that partition their CPUs after connect time, the connect
time io_cpu selection can place a queue's socket work on CPUs owned by
another workload. This series lets a control plane set each queue's
io_cpu through /sys/class/nvme/nvmeX/queues/<qid>/. Patch 1 adds the
core helpers, patch 2 the nvme-tcp attributes.

Changes since v5 [1]:
- The queue directory is added once the io_cpu selection has run, so
  readers never see a placement that is about to change (Sashiko).
- Rebased onto nvme-7.4, and the ABI entry targets 7.5.

managed stays per queue, as discussed in [1]. A blktests patch,
nvme/075, covers the interface and follows in this thread.

[1] https://lore.kernel.org/linux-nvme/20261018010059.83120-1-saravanand@crusoe.ai/

Saravanan D (2):
  nvme: add per-queue sysfs directories
  nvme-tcp: allow setting per-queue io_cpu through sysfs

 Documentation/ABI/stable/sysfs-nvme |  31 +++++
 drivers/nvme/host/core.c            |   6 +
 drivers/nvme/host/nvme.h            |  23 ++++
 drivers/nvme/host/sysfs.c           |  88 ++++++++++++++
 drivers/nvme/host/tcp.c             | 172 ++++++++++++++++++++++++----
 5 files changed, 300 insertions(+), 20 deletions(-)


base-commit: aaedcff9014876387504a8b92d227766cb95015c
-- 
2.55.0

