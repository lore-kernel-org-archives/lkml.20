Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862018;
	b=eoBmcJGuywLVKtqlXJCiXPgFIXYub4NqycuWpXZ5LNXBYjxeiyKzz56tUuMaIT5QXGgt
	 Zh+CuZgqAVvxFTSRcqu45qKd40R17jHct/xVJ1y+ivkuFzM/uOfI5UlHyZgqlGLPFfEkU
	 RtoMMh7bXdtuNZd86ESGMAYwQaxhjPFGN2VF9unCf38CC4Vhdq/LlwArzVeQU3gRU1ZTC
	 Rl4mfWFFpDqGOXS8cmS5FI+nQJpbr4OmLFKybxq0yvhK76LQEtYlTeMLMTCJ3ZU01pi/H
	 DmNyLUj7MIesV6Q42BeJ8koubV+hC+HUMjPHNSvtF1IJBhTnBwEgTAJcMiOoevDjk6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862018;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0wrzHtFxjFXd7iU05CW3/ydQ7QCAtEugjeoklBp7xpE=;
	b=QEwYfDzBHeRRLp3nhD4oU00WYkTcB+/SUkw5Vx0zh879JQSJJ2qymSRT5L0xQgYLf2IL
	 EvQ969lzPu3Ygaoy85sz4zA85Pd4yFW9JvN+9wBzT3ZDvqGfNNtZrfoslW4MMdMdPRjqw
	 MH3JdFSCZfY6bZbYXpWTrVKDbIvMwvU7H3kjvhwtGjqW0REH6hBi0SmHBHRIQw27FLmfc
	 T9qpGzk/3cLazAQVsZLcFboLXi42H0114eK/5CKD+6ZRK276hb5etY+pK9MId2YnbnL0d
	 Y2uqcqB1p8XvsHxRl2Cy3zdrpfymsIVl6Uq46iVWoO62/QrMzyrJA+K5F5hIKPi3KQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gu3dXD8o;
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC85606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC85606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gu3dXD8o
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ax+wsuHoy6H96hgXiHuF6MzNsH6ADwaKJZJ1/7kMLiA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793862006; v=1; x=1794466806;
 b=gu3dXD8ovEhih0rAWmev6W2AOFR/IDaEehfUUFgeNq3wirBmvDlKHAqm5p/Tz+SA1BiOQuOG
 qCkwAa3XXnNoqIpcTagxmPi0o24Eif2ZmOzorQBk0pIqEJNSX3rILgB0r5bQ7BLrRzLo2c1K3q2
 2yZoCEZ1tjhFvPYpMUYTiwmY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 96e1fbcbd6d57c1a;
	Thu, 05 Nov 2026 07:00:05 +0000
X-Mizu-Trace-ID: 96e1fbcbd6d57c1a
X-Migadu-Flow: FLOW_OUT
From: Mengmeng Zhao <mengmeng.zhao@linux.dev>
To: Jens Axboe <axboe@kernel.dk>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	tytso@mit.edu,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	asml.silence@gmail.com,
	hch@lst.de,
	Anuj Gupta <anuj1072538@gmail.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-mm@kvack.org,
	Li Wang <liwang@kylinos.cn>
Subject: [RFC 4/6] iomap: refuse dmabuf iterators in iomap_file_buffered_write()
Date: Thu,  5 Nov 2026 14:58:45 +0800
Message-ID: <20261105065847.196540-5-mengmeng.zhao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105065847.196540-1-mengmeng.zhao@linux.dev>
References: <20261105065847.196540-1-mengmeng.zhao@linux.dev>
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

From: Mengmeng Zhao <zhaomengmeng@kylinos.cn>

A buffered write copies through the CPU linear address, which a
device mapping cannot provide.  fault_in_iov_iter_readable() treats
a dmabuf iterator as always readable, so the copy fails with a
WARN_ON_ONCE from iterate_and_advance2() and iomap_write_iter()
retries the unchanged remainder forever.

Refuse the iterator at the entry with -EOPNOTSUPP, as
generic_perform_write() and the generic read paths already do, so
that every generic buffered copy helper turns the iterator away
before touching the page cache.

Signed-off-by: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
Signed-off-by: Li Wang <liwang@kylinos.cn>
---
 fs/iomap/buffered-io.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 0a5ebfda90f1..3f56bd225e8c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1304,6 +1304,13 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
 	};
 	ssize_t ret;
 
+	/*
+	 * A buffered write copies through the CPU linear address, which a
+	 * device mapping cannot provide.
+	 */
+	if (iov_iter_is_dmabuf_map(i))
+		return -EOPNOTSUPP;
+
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		iter.flags |= IOMAP_NOWAIT;
 	if (iocb->ki_flags & IOCB_DONTCACHE)
-- 
2.43.0

