Received: from mail-yw1-f231.google.com (mail-yw1-f231.google.com [209.85.128.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5C3A5E67
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107672; cv=none; b=gTShOchjejmX9yumSVrtE+Zfrv51J5u8WuBeh8E4Opf3ccOvfms6mUxH7ICgwf97WDYMXjMubliQR4uLAELNB68AUcw/rUv6Hrp8dWZcekXBFT7HqckvTnEGJFETM7aBoFZ1JFyKgeONDq4RQKM5B8SH2Fs4rkhISHxd459wAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107672; c=relaxed/simple;
	bh=q1z61cQ80PvrOqglw/EkGZFgHoHpZjizJTN3URFWJcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B77+wWw0AE5K7zvrpi/NoETOYCVNhrkAP5QScLuEoWQlCwiCyJqVeg8AN7hDYjRh0VnVv/Ha9ml0jDnbwKMcwysqqglGcajMrPvKKaX0YtPkNbsSU5hK/BtTrYB7TsusPl3nj1uZiJd27aeauB18AldPZgr428Q6MFyyfGLT07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cVISUvpk; arc=none smtp.client-ip=209.85.128.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cVISUvpk"
Received: by mail-yw1-f231.google.com with SMTP id 00721157ae682-888cbacf70eso1133837b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790107655; x=1790712455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vsx5sNHXuWXYLFUY3r/lMl9Ziy/DA8qKQ5KpvcRU7Oo=;
        b=cVISUvpkHIhxzapT6p3w5PQdKCLo2IntJQqYtVD3o4BkuMKT1l6a6dx9nsVdeUF/hw
         dVF/r3N3keQ6BVJT9Dff/AZPhCfosnHhUzxOJrwmJRmd4b9xe3KiwqcXuQHbs39wtHLk
         00gC5DszDxY1eQT+069HLL6KdSNxrwZj/dRsFi/rjPz8Xm7eSfX6mjj1HhU5u+0ZqmqI
         17vdsodHf6028NS8kO/hTBi+D26n/QniGy2Sz9BjHob0xZllgjSu8OsEXrLr+vDM2TQo
         QInYbzavyxmukV9eYKrtdzXLTskihtgtaZR7nng4lZLwSCDOCklCTtuxcf5BTAtDf7t9
         jjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107655; x=1790712455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vsx5sNHXuWXYLFUY3r/lMl9Ziy/DA8qKQ5KpvcRU7Oo=;
        b=eM8KUBGeaWrqbQ3BNsyBUmcIvuifmeOOtuwan+AueAxSNS1wlfRu8RW1zeaPxxO5dD
         bTF+BlLIM9HflGtLEwxOI9NIZzDv2z1pSYIohWxY+HOezlL3cOf3weSGCm4BnDwubQyl
         iM069zvuXSbqBBfIlZk5BZJK1wMf6DhHIKjuaYUdN/Mxbb1IyxP3dFxKc4mEN3Qtk6Oh
         KLSu3zCtxiDQOcLKgyvF9Px5Cc8bYc31YKViZJLcpw2Yts14z5US5fMIS0nI7w7s90Il
         sogsm1KFBTb2ZySektJsFApTaIKriDZiRRB9jS8vCzII+HlSMpnjvT50tDFirB0wIE1W
         m/fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDCDX/ThW4Ss+hikPBOqjpeQa7h0JHY682HmxRHDyQQKS+zVtsd05XMoEEhWgF7w16AZm8ECVE/EnIiUs=@vger.kernel.org
X-Gm-Message-State: AFuF++lIZJUxlMcfvvWCFiiEfsnssEKZyzYWQzG0t89updV+hPGUyr/2
	9jG9QhZC6bRORUm+lOFrhlCNMwWEPWFEwzktkBHmXPYMZjjnlofEE6Pu1Z/FwO6rE0p5+lYIDzA
	yuzDpF1TEWnsVGdDtzasQKHfDyVD470wf1xXA
X-Gm-Gg: AYBFou1Sw6PfxKD+WPQWZpHR7mWMu1jKa1uqXMpHfQ7eml42b6ueCCxISg/8L6L8TVv
	daswV81x2TaIGJgMrbS+upp16OCase0mfPUQgkaSdTPuci2D1UrpDPTOj0ZQdBCeu1G8DC8Qytt
	lAb9m+T4OKTJFHDOL1tmZu7Ii39v4j3rIKWrhXZOUQiuhntQuAR1dON8I+JxAMUMrk+648RoNvI
	5/MwuuxkaYs+wxwdEY465pX41EvLBKcC8eBZFEENkQ6VIC6ztlr8UQGJE+DP2EH931pl88rxyit
	lkB+6CuTYxeq5RKqd1LWbKVjT4EZGdan/1vO+qGHnCjHal6uGtlaDUriLOHrjfBvalOsWxf/U7V
	btlUVanncbibqY0l/wZWaxFWAtsAFD0M=
X-Received: by 2002:a05:690e:24e:b0:672:99e0:ec08 with SMTP id 956f58d0204a3-672d59b5281mr219751d50.160.1790107655240;
        Tue, 22 Sep 2026 13:07:35 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-672d80499fasm12358d50.13.2026.09.22.13.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:07:35 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-sgogte.dev.purestorage.com (bond0.slc5-n22m24-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:429])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id B3E1B4014B;
	Tue, 22 Sep 2026 14:07:34 -0600 (MDT)
Received: by dev-sgogte.dev.purestorage.com (Postfix, from userid 1557734945)
	id AE4343F9F5; Tue, 22 Sep 2026 14:07:34 -0600 (MDT)
From: Surabhi Gogte <sgogte@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mkhalfella@purestorage.com,
	randyj@purestorage.com,
	adailey@purestorage.com,
	Surabhi Gogte <sgogte@purestorage.com>
Subject: [PATCH v4 0/3] nvme-tcp: parallelize I/O setup queue in connect
Date: Tue, 22 Sep 2026 14:07:15 -0600
Message-ID: <20260922200718.3941465-1-sgogte@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
allocation and startup"), I/O queue allocation and start steps
(including authentication) can be parallelized for nvme-tcp as well.

Patch 1 fixes a pre-existing bug: nvme_tcp_alloc_queue() used
current->nsproxy->net_ns to create sockets during initial connect
while it used kernel's init_net for reconnect and error recovery
paths. The fix captures the caller's network namespace at controller
allocation time.

Patch 2 is a preparatory refactor: it splits the queue-count
negotiation and TLS PSK checks into helpers so that the individual
steps can be called directly from nvme_tcp_configure_io_queues(). No
functional change.

Patch 3 has the async implementation: it fans the per-queue alloc and
start out over an async domain, serializes the per-cpu queue-count in
nvme_tcp_set_queue_io_cpu() that can now run concurrently, and uses
ctrl->net for all socket creation.

Testing on a 64-core host with 64 IO-queues shows nvme-tcp connection
time reduced from 61ms to 11ms.

blktests - nvme suite, TCP transport (nvme_trtype=tcp)

Tested with:
- Ubuntu 22.04 LTS (Jammy Jellyfish), x86_64, KubeVirt VM
- nvme-cli v2.13 / libnvme v1.14 (built with libkeyutils)
- ktls-utils tag ktls-utils-1.4.0 (c63c04b) (tlshd) linked
against gnutls 3.8.5

---
v4:
  - Moved conditional from nvme_tcp_configure_io_queues() to
    nvme_tcp_setup_io_queues().

v3:
  - Added patch 1 fixing a network namespace bug: reconnect and error
    recovery paths were creating sockets in init_net instead of the
    controller's namespace. Patch 3 now uses ctrl->net (from patch 1)
    instead of hardcoding init_net.
  - Patches renumbered accordingly (v2 patch 1->2, patch 2->3).

v2:
  - Resending the entire series to fix missing numbering in the
    original patch 2 subject line. No functional code changes.

v1: https://lore.kernel.org/20260824222939.301887-1-sgogte@purestorage.com/
v2: https://lore.kernel.org/20260824225648.316962-1-sgogte@purestorage.com/
v3: https://lore.kernel.org/20260910202812.1642832-1-sgogte@purestorage.com/
---

Surabhi Gogte (3):
  nvme-tcp: store and use the caller's network namespace
  nvme-tcp: refactor I/O queue setup path
  nvme-tcp: parallelize I/O queue allocation and startup

 drivers/nvme/host/tcp.c | 139 +++++++++++++++++++++++++++-------------
 1 file changed, 96 insertions(+), 43 deletions(-)

-- 
2.55.0

