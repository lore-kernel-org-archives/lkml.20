Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3841DE13
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389841; cv=none; b=OQNVLGtfXwDRB1IBnzzmPTeRmnBSnhbVmObdpdzkIjybS/Mi4KjBSRrEispZSIjwqr51F9SH5xFx61bip6CALdmyQEofX7JANmUK1wReWD+thX03P26Pw+3OGVp3aEcnfiiWZ1MbEbD7BByOg6NoMv+J+1eo3PxtsUF5o4ZOKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389841; c=relaxed/simple;
	bh=o1vlXcLANFy7ZzKd9CG3z8Rv1Gnisjb6ZUbt68YBI0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5oxJPKw9MCJUYoNi3YZaAb8+HNmRkmQeX7NQjs6pduMutnj7OeZ8oI93NfcG5yTik78C6NMo4APHe9btLEMbs1os7vH3AUIWUtvsCGjIvsqmwjnuqBxHTjUu5lLh52zr5g0OhZgxRyOsHi9SpgYNxeJqWxYiL4QiHapk40oIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=J9cUgpDH; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="J9cUgpDH"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38ecc48b3deso233941a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788389834; x=1788994634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXye3s8M7BBJFOvpLi+6gbf2riGSXQocruinG92HPCg=;
        b=J9cUgpDHOI/FpeFFt2dKxL1oyBGP8FA9jN2/7Zm9Chy534yn8+XfnFl5PQXD3eSOJx
         q3G6+Be1xOa/okr2QjeJsRwENV5LXQbt5uGYH6qC3/va1Qqje6R0JNj1peeF5coC3WIL
         2lnHfmN7f2UMmkfoCQOt4wKlOKcghCIIo3/swP7BtMpTu6Le3ggGWxMlP/rPgOBvBnom
         SlOoNbx5nXDOeJQ9tRIcMPKtUOno25STK+nHPQWvnJfK96lj987pxEgJWOqvhJmv9K2m
         9c8paPzcb3bmOqEGOUi7c1knEjMBaIQ+WM1YsbwIrzaTgmiwaMCx2KcZkwAtUnQfe0p3
         JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389834; x=1788994634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXye3s8M7BBJFOvpLi+6gbf2riGSXQocruinG92HPCg=;
        b=mDb6y73KdjHVHy6FmgzXGy4LfWU7qkBMlOzCfW0keBImBL/nbfgnLSYVYpLqT24K6I
         BTvM3I4xh7MoFcmPWhxEaS0fNycuymDVUZY0YsREbWtcN1bYvEAp2+DTxFmWXRZE+ErJ
         hVfBXK6C5Mjl8438T9xjpW5YOlQl8Un/EZG4qPholC/ozNQULIZdMXhjFdlftJ82pE6M
         hAOJiRmHyWtrcMM+3yQS2atv6CyvYGXiU06APKB8bhqkb+tLcpVTabcz9lSvJzllTnoC
         4QV/g1hFH4BbEPovDtQtUJy5DsbBorlyMiVfTw8BFvscz+PkoLJg5vR0MLvKZur8uCye
         n/mg==
X-Forwarded-Encrypted: i=1; AKwUvBweLG//piaj4CuJcl213pBy90cfgFFixtlpZ6eN/6LNA3NSrESMrjMSErb/3i0uwqeDOdv3Cd2S97jxB1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mzd1PKWxHoUDBSrq8ghIzU1l2zVqi4PEsf+TOqO+6a6o7DCALl
	tncs87oNXOGlLgq5O0TCqP+mkBBXI1esD/ClgaBHJwFrUnKJmaA6XlGoTSERBs8GZFHGxN1VT1W
	EjVdn+pTuEMqbindfyPnEDtDu7jdM/xjHt3GN
X-Gm-Gg: AYBFou2hJENvivGei3epYrN97+BwvVVrSC73/yEtQBe1qYYDcon8+KGNRX00I3jtf8m
	bFJ0HMqzLZPLmziXIHwT1AyNgGvu/gZHxIVYLoJjT7dzW3qAyjvQjG4giJl6nLSmxN5Wpqa5557
	PtHsM0vzpn7PMI2EwkIJlEJYPigPqJ6wgUEEMg4nAVWpnhVItmzoM+E2O6yjdBATly7MNF8P8Hi
	YVjJvcSlKFJLnj8PfygZNHRrnEHfphCRGq+I3ZTdyoGjr9Q3o9PRsU6qnwVQ9OwQ/iobhsEhEkz
	sbiwWj0HS1P3JJ/0tki2l3ZQWy2QuFvqJKeO/Bxkp2RECuCPxm/N20W26NzPqd3206qjor4gu2J
	+K3KdcLe5nVSnjPd0jMCZQ1xE7EK9RVSt
X-Received: by 2002:a17:90b:39ae:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-39aee1b3eebmr7025118a91.4.1788389834421;
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b0e6550bbsm187875a91.7.2026.09.02.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 564F54001C;
	Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 46D07E40404; Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	linux-nvme@lists.infradead.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 0/2] io_uring passthru: set result on blk-mq request completion
Date: Wed,  2 Sep 2026 16:57:06 -0600
Message-ID: <20260902225708.2379840-1-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring NVMe passthru currently receives the NVMe status and result in
the blk-mq request completion callback nvme_uring_cmd_end_io() but
doesn't post the io_uring CQE until the io_uring task work callback
nvme_uring_task_cb(). The status and result must be plumbed through
struct nvme_uring_cmd_pdu, taking up 16 bytes of the 32 available.

Store the status and result on the io_uring request in
nvme_uring_cmd_end_io() instead of nvme_uring_task_cb() so it doesn't
need to be passed through struct nvme_uring_cmd_pdu.

v2:
- Keep io_uring_cmd_done{,32}() wrappers to reduce changes in uring_cmd
  implementations (Joanne)

v1: https://lore.kernel.org/io-uring/20260827185722.3234622-1-csander@purestorage.com/

Caleb Sander Mateos (2):
  io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
  nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()

 drivers/nvme/host/ioctl.c    | 19 +++++++++----------
 include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
 io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
 3 files changed, 44 insertions(+), 31 deletions(-)

-- 
2.55.0

