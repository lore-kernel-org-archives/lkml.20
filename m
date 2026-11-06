Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975358;
	b=rvpr8UPxxu84SbNO619N5YJ+kxqnnMH8rYGqInwECxZj+VSFljd7EuYpRRzJWTdlvV3q
	 zQf4ccssILdXSefaf8GC3137J4rr9ye+uwtSvQ3/rOzremlX9phFc3qKebyr/ppTb355c
	 JQQF6/+BbuWeTyV77jopQ56YZn/BG38HvI85LMennjQ0MEyPLrond8ZzNcGDuqC9ysyNF
	 OBstnJT+yq0q0kncjcUzHRNhixAO8HhY5I0jIp6jmhK7wLuUoCMoSeY9p5L9AD1vMi1Xv
	 tb1Gfn5ne09v/q/1r+WKKX4esAzJWua83Q992q5o2OQ6kxIw/SPVUpXXgIdKdxvEhCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975358;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WqAWscfL3r9BujgfFktP9SElrvjPmWkmFgsU+wf24R0=;
	b=c+cK70oaW/hjQjPqeccph09H1nDb5eCo+DUnvd/xxcs60DvUP+gp+DgEgXMsJIXuQ/EX
	 acMfg3OgHX3G6O+DYIaPVYN3G8EB5kkYvR2frQbpoG8CJYNjp+LWmiIlTv4x3OhRzkY/u
	 WzcXXUkxbN9sQ2QtnS2juqsc7U131sd5M3wlrMgpy4Wdp9AFzkkMgzYAT9qBCQZQtvNeI
	 Q71Mq1QEqtYw69MHi+CIab6giaJyFZ9HgObjK6y1ZQD7Jjg0fvgg37i4FVzE+X04da/mQ
	 ng6vNjL69Gm56fW70ydye8Szn+LbPD5xVZwHmIQpg7hw/eD9GDvYqtLfG0W7uGmijdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gNUFi5iE;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D98D606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D98D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gNUFi5iE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5EItJb1QeIxAtpcdoUd4dtj8OkZ5yQ/SrQWV8LNAh6Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793975356; v=1; x=1794580156;
 b=gNUFi5iEcHfcXJ+8QgF1PYXYgDNv1GFHTnIHIirJUGTx4mP1hI1MxFDnQInuwAe4gD3+ryXp
 Jzi3PQH3yfmnU+mKYihpFt+NxaRQbV++OdTM6G9nG2iqbU8/+7npnQW38RzmoP90sWaBD6kaxnv
 VCuBT5tuWfkVVVOf2g5CMVVo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9dbca7f61e34c06a;
	Fri, 06 Nov 2026 14:29:16 +0000
X-Mizu-Trace-ID: 9dbca7f61e34c06a
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: axboe@kernel.dk,
	rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH] blktrace: require CAP_SYS_ADMIN for the BLKTRACE ioctls
Date: Fri,  6 Nov 2026 22:28:52 +0800
Message-ID: <20261106142852.3233950-1-cui.tao@linux.dev>
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

From: Tao Cui <cuitao@kylinos.cn>

BLKTRACESETUP allocates user-sized relay buffers and sets up a trace
that outlives the creating fd.  Every command of the interface,
BLKTRACESETUP, BLKTRACESETUP2, BLKTRACESTART, BLKTRACESTOP,
BLKTRACETEARDOWN and the 32-bit variant, can be issued by anyone who
can open the block device node.  The sg passthrough path
(sg_ioctl_common) reaches the same code with an sg char device, so a
container that is handed either node can hold trace state and relay
memory on shared devices.  The trace data itself stays root-only: the
debugfs relay files are not readable past root.

Gate the whole family behind CAP_SYS_ADMIN.

Verified on next-20261104 under qemu: with the patch, BLKTRACESETUP
with all capabilities dropped is rejected with EPERM; without the
patch the same call succeeds.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/trace/blktrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 8cd2520b4c99..c1bf8ca350fe 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -927,6 +927,9 @@ int blk_trace_ioctl(struct block_device *bdev, unsigned cmd, char __user *arg)
 	int ret, start = 0;
 	char b[BDEVNAME_SIZE];
 
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
 	switch (cmd) {
 	case BLKTRACESETUP2:
 		snprintf(b, sizeof(b), "%pg", bdev);
-- 
2.43.0

