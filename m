Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844202;
	b=cieX5eLGwQq7PnY+bK5++nKx1y5UdicNaJ/yGaHaxJ3pk8WR+/J3yaseVqRBA6+yIhHj
	 LA30ljjw8ocdrXAFhl5qh4lbs8XjoPiydNwLiHrU+RZW8MqP2QCFEJTr4WqMe7eISgAqB
	 xHFT7Nd3KR1EA0onenvzE5TFP6YajZjUtf8mtYsq88/buCJ7ZgOw1xlG8CSsc7pOcWAHc
	 acthohMApj3BIlja1JvSCpXVQhwNirTV9sx97iI+SjfbN5tYq+nc41dx8gCoe5ANFOvmP
	 oprT7vYOqID7WJesPShEJcarbC4Bj0qk91oUKk6lL7e6206PK3/qya7PurWkcZOtSyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EQfIAOrQJdusvyYnUH0bVt07oZDCi/o3NqYD4NHITMs=;
	b=wpd0oRRNNabTzvkSCDiQBQrSZvBGN0kCVxNVa4wDThNc8WsozazaIYjA71I/qwSY/DSt
	 /Z5LDEwF1zCclZ1tI8RLwvRFzKijTgMArSsQ9tRj2Kh+SO0k1WFlw6lnKwp3WYqL2MIxj
	 3k8a13BRQjWObjeH6yD2Ynpw2Wc2Qbq4wc2H76jY/SVynWY0SeNYjUl0c7tIxD7pZ/yqR
	 rkqiVQIBtSkXS6CJ/6SzH8age7qpBSoPqAicMCRIN53MwVdxbiz7V66aI3vK+24Ma5AMc
	 u//hn5U+H8rjCV9NnOfiod95PrHl6DHWWGuIQKxsU3TtAh/uiMyp+V9w9qLGn6Fw5eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=GkW1ZmRS;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F376606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F376606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=GkW1ZmRS
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso544123a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793844201; x=1794449001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQfIAOrQJdusvyYnUH0bVt07oZDCi/o3NqYD4NHITMs=;
        b=GkW1ZmRSpSFfkokdZSUjXrT1WnzmH4jmdbE5YxNIOWGzejsxgAzJ+QcbgMaYBr/TcY
         y/9DTwSGT2OAqkiPA9DO3xjoeDMNWq/cglIDmENrAsciQv2pHOjPeTvYheYhniVp8Vws
         0jTFpd5+218Tf2l9uj9L4a3jJ+AT69WnxcI5nshMC0GZjbQ3flZrbHoukEUHFZ5lX7na
         tQj0YP0umvFSqQKkqgLRYSXR2lnXTHCFzGEi07kLXxEOUM4wceSpGSKGerical0TWjqa
         eQAus6mWnUAJZ455DpUBGUPG/pnAKEcoRdKZ4TvNUZhMDcdHJNF8jUZ7zEdfv9zTa0Bz
         bOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844201; x=1794449001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQfIAOrQJdusvyYnUH0bVt07oZDCi/o3NqYD4NHITMs=;
        b=XuWazHJ/q/sFBJXfXddOis5dSYigkQQabZ6QaS70HHX5JcGSLrvd4iKa5atLzfxy/3
         K4/+Vas2wUhrD7ZLU2LPC+g6cJGGUtvPZ4u3Ip+Q5ORdgUnG1LRNF7Pb+8gdHZukCjWy
         UeaOYo7v4FKFRhaMq80874g8qjowCc4vrPeuyES7Q+2pE1mHqsmggS50+yBZR7Y6GVvf
         whlTnic4eqD1H8GPj1cnMHOqRQ33eeFp9QKg20TIQICmjaLLI2OU6kaFgzWo46258HQW
         Ts+8AWW4PdSJZdEw0I+PDFGm+ktQpfV1I1rsgLyUQpT+42OxA3AXYIXqj8RUjEB8a8vC
         GLMg==
X-Forwarded-Encrypted: i=1; AKwUvBwDk3priucV7kFAOZcHa/sOUZQe8kqzzkEngmnDFk+9iiXheINVF5FhX0h2wevXrfty8OrZ3xowMMmzyDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k9fxV7f0v25kFaoGv7iWm8azlkJQ6jXGrcps9zlm5hdobrmGe
	DY0Lt3XXRXZc6x9WgJR5XHSB5x8NAeeyhPwm1IneYcm34CSiTWVEIOfka22X/pxpCGPIt1xfHMh
	6jLp5GYjfUi2hwxYPau4rg4Q9cB3LtFKnpN+D
X-Gm-Gg: AYBFou3QQDl/Es0zp/gwRdMwFoT2jr+sgXCsdRCVayLWUBUSL9FiVtOUSIU0wcHCr5l
	BDNdWOFSQvG7Qiqt9pLwqsmbQP+NJpoIj29yDNITdQ/9L1p0Ggk7hn1srlLu6nKEhoJT/QhQKrE
	w72fumYFbMVxtoSTfJDAUB3qsyLkPnC2NTrHV85G8H06cEyd1aBm9ZQeAdnBi6Vy1nbU8WmtE0L
	GYTBaWdUACmVNP2cSEyd6K0ZnT2tl46e8ZuIkKsLB6fU/iiQYo+FrA3qOu8It8S1n3vszmCOJ5O
	9fgOC2BUUC1Hb1g4J3zjiAEXsHyiHescl/6F83nnyjdr0Wz8i2kTtSiTH9LC71cl0lW/4JbIz3S
	1H+Ypn2eKiYvB8lpCf+vy/MC7Pd8cnWFf8/rFMw==
X-Received: by 2002:a17:90b:2d84:b0:3b0:9a1b:b708 with SMTP id 98e67ed59e1d1-3b09a1bb881mr3168053a91.62.1793844200546;
        Wed, 04 Nov 2026 18:03:20 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b31f880fsm824975a91.7.2026.11.04.18.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:03:20 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 943B534014E;
	Wed,  4 Nov 2026 18:02:49 -0800 (PST)
From: tmenninger@purestorage.com
To: anna@kernel.org,
	trondmy@kernel.org
Cc: cel@kernel.org,
	ebadger@everpuredata.com,
	jcurley@everpuredata.com,
	jlayton@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	slingappa@everpuredata.com,
	Tim Menninger <tmenninger@everpuredata.com>
Subject: [PATCH v2 0/2] SUNRPC/NFS: limit transport disconnects when cancelling flexfiles I/O
Date: Thu,  5 Nov 2026 02:02:47 +0000
Message-ID: <20261105020249.2607367-1-tmenninger@purestorage.com>
X-Mailer: git-send-email 2.53.0
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

From: Tim Menninger <tmenninger@everpuredata.com>

This series narrows the transport disconnects performed when flexfiles
cancels I/O for a recalled or revoked layout segment.

Today ff_layout_cancel_io() first cancels matching RPC tasks and then
calls rpc_clnt_disconnect() if any tasks matched. rpc_clnt_disconnect()
operates on the entire rpc_clnt, so for a data server client using
multiple transports it disconnects transports that may have had no I/O
associated with the affected layout segment.

I encountered this while testing pNFS over RPC/RDMA during data server
recovery. Restarting the NFS service on a data server while sustained
direct-read I/O was active could cause repeated reconnect activity and a
large throughput drop. The client-wide disconnect from
ff_layout_cancel_io() amplified the disruption by tearing down otherwise
unaffected transports.

The first patch adds a SUNRPC helper that combines task cancellation with
request-scoped conditional disconnects. Matching tasks are cancelled as
before. A subsequent transport-queue pass marks matching requests
belonging to the same rpc_clnt that remain on the transmit or receive
queues so that, when released, xprt_conditional_disconnect() is called
using the request's saved connection cookie.

The disconnect state is stored on struct rpc_rqst rather than struct
rpc_task. A task can release one request and later acquire another, so a
task-scoped indication could otherwise be consumed by a successor
request and applied to the wrong transport generation.

The request-marking pass also preserves the rpc_clnt selection used by
rpc_cancel_tasks(). An rpc_xprt may be shared by multiple rpc_clnt
instances, so requests belonging to other clients sharing the same
transport are not marked.

The second patch switches flexfiles to the new helper, preserving its
I/O cancellation behavior while avoiding client-wide transport
disconnects.

Testing:

The code in this series does not depend on:

    https://lore.kernel.org/all/20261105000131.2512336-1-tmenninger@everpuredata.com/

However, I used that change while collecting the results below because,
without it, the client enters the earlier recovery livelock before the
transport-disconnect behavior can be observed cleanly.

As a control experiment, I also tested skipping the
ff_layout_cancel_io() task-cancellation and client-disconnect path
entirely for RPC/RDMA. Doing so eliminates the reconnect pathology. This
shows that the pathology depends on the cancellation/disconnect path
introduced by commit b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the
layout is recalled or revoked"), but simply opting RPC/RDMA out of that
behavior would also remove the cancellation that is intended to drain
I/O associated with a recalled or revoked layout segment.

This series instead preserves that cancellation while limiting transport
disconnects to matching requests that remain in flight.

I have repeated the data-server restart test many times and the behavior
is consistent. The counters below are intentionally collected after the
restart event, once throughput has partially recovered and the client has
entered the post-recovery state in which it remains until the workload
completes.

This distinction matters because some transport activity during the
data-server restart itself is expected. The problem addressed here is
the continued reconnect activity after that transition has completed:
once recovery has settled, the client should not continue cycling
otherwise healthy RPC/RDMA connections.

Over a 30-second post-recovery sampling window, this series reduces
sunrpc events from 4,526 to 289, a roughly
16-fold reduction. RPC/RDMA disconnect and connect events fall by about
6.6-fold. During the same interval, read throughput improves from
approximately 0.4-1.1 GB/s to 1.9-2.2 GB/s.

Before (throughput: approximately 0.4-1.1 GB/s):

    Performance counter stats for 'system wide':

                 4,526      sunrpc:xprt_disconnect_force
                 1,911      rpcrdma:xprtrdma_disconnect
                 1,909      rpcrdma:xprtrdma_connect

          30.021267692 seconds time elapsed

After (throughput: approximately 1.9-2.2 GB/s):

    Performance counter stats for 'system wide':

                   289      sunrpc:xprt_disconnect_force
                   289      rpcrdma:xprtrdma_disconnect
                   291      rpcrdma:xprtrdma_connect

          30.080790959 seconds time elapsed

---
Changes in v2:
- Rebase onto v7.4-rc1.
- Adapt to the device-ID-aware ff_layout_cancel_io() interface,
  preserving device-node reference cleanup.
- No functional changes to the SUNRPC implementation.

v1: https://lore.kernel.org/all/20260924204525.3381590-1-tmenninger@everpuredata.com/

Tim Menninger (2):
  SUNRPC: add request-scoped disconnects when cancelling tasks
  NFSv4/flexfiles: limit transport disconnects when cancelling I/O

 fs/nfs/flexfilelayout/flexfilelayout.c |  7 +-
 include/linux/sunrpc/sched.h           |  4 ++
 include/linux/sunrpc/xprt.h            |  5 ++
 net/sunrpc/clnt.c                      | 94 +++++++++++++++++++++-----
 net/sunrpc/sunrpc.h                    |  5 ++
 net/sunrpc/xprt.c                      | 76 +++++++++++++++++++++
 6 files changed, 170 insertions(+), 21 deletions(-)

-- 
2.53.0

