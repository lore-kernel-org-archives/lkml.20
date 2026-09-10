Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6322E5B2D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072120; cv=none; b=krOA6aXr2+GNp54IFMfHfD70lOYSMV8HCIC+K+PAPXDeULObKFbPAhNwZ3sAuXEB0cP2puFDTN/JnQA6MnnDXDq8AZzF7d6a6KzliFzKcoVmoDqCHJlORUutKDB5fN5pKYFT3wPHQZFRdgA6g8N6ooRKF+hXJn5hWKxkxd0n7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072120; c=relaxed/simple;
	bh=N7i0pkr7swC6GQwQjpdxM08xlRxUiS8+9KYj6QU595g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HkmKY1qtqQ3mI14XmJqjvc8qwKZMhBFsU+9CN/CGLFzRayW/vu7sO4bKTItyOxyKb61qY6T2R54LRP45OXKe1/arf9bkrEbCWDI+/F5KmnKme4wK7DMP7/Z6gV4XDfdVKu2I4i5GUXYw8vFQMRHblwuzmtyvXmtcgCjAzlmfeC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ReFlfEVi; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ReFlfEVi"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-9399ec950caso1641785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789072116; x=1789676916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDCr9GzV1B1Q6u77NnAu+24+DGPgnFPYx7acDChAt8Y=;
        b=ReFlfEVi1LXQy/TARyQ2N+iKeEAYPXuUY9U2InHxnlZJIiUFlRwTzHEkvxLN7AlelA
         g0Ocv0Nwq8y+lyrWC5xyPa/yQUkIeGbxT2MEhwr9sdAos9oMEpKF1S7rMjCOoqtIoYTx
         uZF4K+BqZN/yBfle+frR64N7VYQf0o/6fcxIEqX/dUVf7spaqNBND4ThHoj6IctAGHeh
         VtrZXS14SJeExs9hA5+ACpjGt+ghShxP/YhnHtwzVjteHmPIUtOgi7iTVTuFgKiFsITD
         udbEy7fhc3SKxRyW2H02M5/AcEcmm6E4oIWEU6iy+QmzUF8hiS04/KT4Jzd9WycGdM/G
         Jehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072117; x=1789676917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDCr9GzV1B1Q6u77NnAu+24+DGPgnFPYx7acDChAt8Y=;
        b=fUOeR/bUfsyK5K79d2aTpDHPiFKyuRSB/eVZ0aasUiDHNEvb61yPrXKTXpzSUY6uqn
         hRliSXH3SosNwALQSU8Y3+N0QiBDZzfxLx4x5OKk4T63nHkZYqStXCXbIsUDOl+fsCl2
         GSxJRNDiFk14lC6X4PoPX88bi9CidlIFTsmvaDzEqvL7M55Mzrc1tCEOv1avzfLJO05i
         tT5PFkynYDs0z/CrjEBN7buEBHt29Xli95HtqnzUdawMjXPuS8zTXVnUktc0sZhTDbGO
         Ppz4qg9oC1w/G/iM7CTvFDxeL0VHjLcogJTWHcHFkknXG6nc+lPCYi32X5+hsxKavZYU
         WWFA==
X-Forwarded-Encrypted: i=1; AKwUvBznXhPrTex8h9a//LHFETa0qeiDmBVqvyyQXwg1J0jLR4en4mfvH1E2ueIu1kco0bk3DD9qO1RwxqIjgSY=@vger.kernel.org
X-Gm-Message-State: AFuF++nDRtKe6lHBuo/YzKDKsPzsfgv1pcISMOjUdkXw+BlaF+S8pRQB
	cQof+TzvtXZ1X2r8GhjNrDdojSPrqRY88Ebb98gBCL4T4hd5EmglAEjgEJluoSH+dQ78SXCjgdH
	gXB1WY08gpeRMGHKKotqQ8X2NEvsP4CADO3ZE
X-Gm-Gg: AYBFou0Wf1TPEt1A05F8Zj7dQrvSaVoSnAin9vxTPtpsEZVSmhd3sp9gZCxziP6gZ5N
	LxftifC6mWmmND9ZS5197O9m8X8RDbCPYBFe+6s90VpQ2Wf8zglp0cThLY8FFnVwcXv1WwnotpF
	utwglPqklaLMJYfP+wacoomojL5OhOb2pqYfDkOZo/L6aqsPwPxEoU6oTsrrpNeGD+v1evuy1Ak
	ERA+kc53v7nwZ6VeVTh6n9dKfSdNCiePBVf9h6f5dH8Gb89BX88WlqYdtEHzvYjxiQWkFxoullN
	V0htYFnykQPwcdoKv2yPpgwkgjMJNV7yOhNz3wl0zBRYcEjElcIrh5hpxZKCJ3lNPBAwLzbS2oL
	OmBuqInaEZbrcUiWWOJyocRF7x9Gz8uI=
X-Received: by 2002:a05:620a:40c5:b0:936:e938:b07a with SMTP id af79cd13be357-939ea048390mr86167985a.8.1789072116518;
        Thu, 10 Sep 2026 13:28:36 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-939e8102456sm7339885a.2.2026.09.10.13.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:28:36 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-sgogte.dev.purestorage.com (bond0.slc5-n22m24-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:429])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id E2889400F1;
	Thu, 10 Sep 2026 14:28:35 -0600 (MDT)
Received: by dev-sgogte.dev.purestorage.com (Postfix, from userid 1557734945)
	id DE99A51EC2; Thu, 10 Sep 2026 14:28:35 -0600 (MDT)
From: Surabhi Gogte <sgogte@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Solganik Alexander <sashas@lightbitslabs.com>,
	Roy Shterman <roys@lightbitslabs.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mkhalfella@purestorage.com,
	randyj@purestorage.com,
	adailey@purestorage.com,
	Surabhi Gogte <sgogte@purestorage.com>
Subject: [PATCH v3 0/3] nvme-tcp: parallelize I/O setup queue in connect 
Date: Thu, 10 Sep 2026 14:28:09 -0600
Message-ID: <20260910202812.1642832-1-sgogte@purestorage.com>
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

---
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
---

Surabhi Gogte (3):
  nvme-tcp: store and use the caller's network namespace
  nvme-tcp: refactor I/O queue setup path
  nvme-tcp: parallelize I/O queue allocation and startup

 drivers/nvme/host/tcp.c | 144 +++++++++++++++++++++++++++-------------
 1 file changed, 98 insertions(+), 46 deletions(-)

-- 
2.55.0

