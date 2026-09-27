Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592A37204E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492975; cv=none; b=Qjtiv1BkzPwAwlZpemWe2i9Zeqf8EavFzbld18DCOu1d59Qo5LeUkoggEGwGinNutiENiemnIO5hKHXeV1Lds617pzuVJZLkxnj9RPegCwXjKURWFxbyB5ZHqcRcnSLS8mpRFVcecyJJxUXk/ujfVO/R3mxoRt0eIbrosmlyW2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492975; c=relaxed/simple;
	bh=VXDeyQL2OSBMOEpLz54LZvHRY6cfQwqDJKH++M9pfkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbltHXjgoiSeKUZuFYMSYQPXDlqlSFldnnzZpC1YqrF8SsQ26GjRKezM3PPQWBpdMg0QgA1+UIEBZQ2N+G4akdmWwYLRvTof/WDLvQJSyNri1u2VYRhqb2Xh9HIdC6AoD/+4E5GBJunMTB/y6P1PoYaZ3QeoSSANpaJLrzLyWO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=i/uGKaSl; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="i/uGKaSl"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso1578316c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790492973; x=1791097773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eofGbpKzYy4pS2F+hufAR6Lu21I/5i0IX2p0adL7Y98=;
        b=i/uGKaSl7+divtysSoqGG20hTXU9kVCHtXdwbMLTlHIkI0YiHeD79dlcE/N9xpUdqu
         W0wb+EjB4Wvi7J4dImoJUK4nU6fJc6LxeH3PTXP3PDXiq3yZWa3f3ow5r/fa7xq93z/J
         IiNKKDXoVgv/uDrctqY1B3QdHDKBNs20m/fB81/MFyiBFGX4buc5wH8UtV08qB8y2ylH
         jNA8ySGDg1on6fA3C6NDvtjBbhpCLdA1Me/f5jrUI8dck98+nYzKR4QNzP/ZvoPHluQA
         eVBtpkx1+lfF4f+UHZMtkpHzjjxXFBRD7yFwiJuRFRrU1B9DspTfSt9bAXITxBVrb+lC
         UG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492973; x=1791097773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eofGbpKzYy4pS2F+hufAR6Lu21I/5i0IX2p0adL7Y98=;
        b=OctdOy46mlbBKnN04pcHADfIaC8vAX4YdQUBWLILyBieJQYPVJTi9Edu0T42C6fJ1c
         ENcH7/HlLhfSC3rJV0h+L5EFSchEitFGJ7qQ366M5Gcngcfuqy48UNH8EAwGpaU/80I+
         gt/AOMvZ/Jjauk9jHaKJpCe3B7XKkBee97MtUXwzLHhPEwXYzHwPjn9gLDN3NncIdAbu
         phRR4irXCE9pnlNW+v26Fy+nS4Afxy9l7Vnfe7gPv4sXTPpoUEz7BdDpkaJFqno2NQy5
         aibn7fYPnRoQe40T3hAWSCEMBY9a7UK2ltKZ83R67c3AO31cqlDUEIu/s5p5osV9P4pU
         7cFg==
X-Forwarded-Encrypted: i=1; AKwUvBzWWnOSqV9hyEADBKxD3TjsfxVeRJofIlc3DdKyiJiTJLHELJsAxqJ4VQpFePZ7Xn+odPpjhXyRX55lGcg=@vger.kernel.org
X-Gm-Message-State: AFuF++kl8aDKMPF95g+lMTaoUqF1JQdZW0kPCLkWhjURY4JBONChw+tD
	mO5FrCSxL40mXXGGklvSpbY+lxtpwzJMWyf40q5YpJD88Jy7FshKe/bChZR6fvDansQ=
X-Gm-Gg: AYBFou1/LtqZK0+SH7clzUdUsy8vLTlGXd5C8yVQRi8Ch1jW1g6A1wiZvueGM6eYE0Z
	Ubw0W0mzQJOLdZulCe2qEXesFDC8SK0FLTFV0rGfJ6D/XhmL26jMjX5wP//F7A4U0WJ13urouj5
	tpYnA3RrLR2/fncBt7KQAYgfX4dy9hNvdwoQ+laey8GhuK2Vs+NNhP/pHyjw4WieTNcJoMXbvRN
	Jxsnx0Vkl9jwbAyD74LN1LaDhmsdSQT91demiSxpb1oy3Xa/lFvV6IbN8HkFx/1BQ17OukAE/Ur
	sAvoYq3PZkMBYxm/93AEz0crS/gWdSJqj9kS7+Jyw7H7r/fMNavRFsXkRkx5TCa6Ar0YWMceHGY
	Rq1XGtdsdx2lEqt3zVCLXAiKNQAulzKKh9e1TqILbXHujjF1Fr2gt3/qE5YPGKO643eWBNluHkp
	mYdO30l1OmAnSaqBsIbb+rP5rjUM7pHrML+jYkBfplvviC28OmtEuHAc8/y3yEOaeEyP9v9QciG
	gtUg1/oeMaNng8zq1cCKmsntWgcGkU4Z9esZeSYj8MCp+VE8PKpzQ==
X-Received: by 2002:a05:7022:d43:b0:143:26eb:18ea with SMTP id a92af1059eb24-146d00b7b89mr5800492c88.29.1790492971652;
        Sun, 27 Sep 2026 00:09:31 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4380:3400:cdfd:5309:3fdc:3b4e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm10322371c88.9.2026.09.27.00.09.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 00:09:28 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sj@kernel.org,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v4 0/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Sun, 27 Sep 2026 00:09:23 -0700
Message-ID: <20260927070925.47209-1-saravanand@crusoe.ai>
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

The first patch adds a small common queue info that a transport embeds
in its queue structure, backing a transport neutral

  /sys/class/nvme/nvmeX/queues/<qid>/

directory under the controller device. The second patch has nvme-tcp
expose io_cpu and managed attributes there.

Changes since v3 [1]:
- Split into two patches and introduced the common queue info that
  Sagi proposed [2], named nvme_queue_info since the PCI driver
  already uses nvme_queue, as Nilay pointed out.
- Renamed the tcp_queues directory to queues so the ABI does not bake
  in the transport, as suggested by Nilay [3].
- Added the read-only managed attribute, 1 while io_cpu is driver
  managed and 0 once the user assigned it, as suggested by Nilay.
- io_cpu now accepts -1 or the string "unbound" to leave the socket
  work unbound, instead of restoring the connect time selection, as
  suggested by Sagi.
- A user assignment is tracked in the common queue info flags and
  still persists across reconnects, following Sagi's earlier guidance
  that io_cpu should not change on reconnect.
- The queue directories register once per controller lifetime and
  persist across reconnects, and the io_cpu accounting moved from the
  queue lock to a controller level lock since a write can now arrive
  while a queue is torn down.
- The io_cpu accounting now also covers a pin to a queue whose connect
  time pick did not bind a cpu, and the queue teardown clears any
  accounting left by a write racing the teardown.

[1] https://lore.kernel.org/linux-nvme/20260909211432.6741-1-saravanand@crusoe.ai/
[2] https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
[3] https://lore.kernel.org/linux-nvme/8dfee10f-89f3-463b-8d16-587873c3394c@linux.ibm.com/

Saravanan D (2):
  nvme: add per-queue sysfs directories
  nvme-tcp: allow setting per-queue io_cpu through sysfs

 Documentation/ABI/stable/sysfs-nvme |  21 ++++
 drivers/nvme/host/core.c            |   2 +
 drivers/nvme/host/nvme.h            |  23 +++++
 drivers/nvme/host/sysfs.c           |  42 ++++++++
 drivers/nvme/host/tcp.c             | 153 +++++++++++++++++++++++++++-
 5 files changed, 240 insertions(+), 1 deletion(-)


base-commit: 2ee54f01f07c0307deaf90ca8691a4643ae0357b
-- 
2.55.0

