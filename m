Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408672;
	b=4VLHLumS8oNQz/rlI7B2TrP+DPKwhGC60YVcgG1RCDYUYJLrHXKwAOmRR/aOWrIBPOtC
	 2QckCTBx9fUvnIJoTGxTngEcEN43kruFAd8Lqa5fszNnciljZ5DmaXxjtnsaXvi/y5iLe
	 jxFbbppQ7LDngvkN1z94itXex241Mhl0SLS0FUeYmYm+JocH4uKeVKri5kIOy5pBe64Yi
	 rjUKzIWQW/Gmk+bss6+fynTEcC6pXcUO+zsFAa2RUI8duvVfZEz0lmZMpG0g8eQ+mHPM6
	 JfE8REnXhTcn1oFb94N4H0QE/8yyC2+TZ9DjGwmJdDEAScZZ4PPaGRi9YNNyAyHLw2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408672;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g+jv8AtfpGafUC5wBdSfIamvnfKnHxDWwY7oWhWrKE0=;
	b=Hf2dbAljluHktCBkJBaOq89ArmJEMTqkpBHPA8X+49hJSUx8BdMHRR/KtyZStDdd3N2b
	 KoFdTQ1/IMCYjWLfDnfdeblw7sws4zYQCzzDY7G+BqI38wG1hZpLf0dsj7LM+e4W+ZBeu
	 gx/bB0QKJSJvj9t8syGO6U3z1kXXPFmVA5AMhl/KDPdtPpqUDFYEPBL4DbBVBM0Wy8Pc2
	 11S29z0jwWtC5wzn4IcyhsmtnXtWw6C5LyOI4LjWNHUyLDgxvi9OkxuLkeHkecJguhdXG
	 xhDVEqCLvaAoGakTf9fLG2dYnxvc8JLgwAVonthmOifPnWcvUMeKbjI6fUx6XDU9ftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Po9Gdm7o;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419E60A260E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C419E60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Po9Gdm7o
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xy5K9Cw6RLs5ZIVIwHbgzwEDhJquIkV4vlOTki38lhQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794408669; v=1; x=1795013469;
 b=Po9Gdm7oiVslmglM7cR6dHG8MZzP0QUgzefHoPf2YJ9YcvzjIfCAyeaf6lnYj9vp+yWVYGj2
 3xjTci7xJQGJx5jQIIQXWkCBYqRrzUjqJZfo6zFZ7vPF9iw4okDAbDcpUvhImliv7s/m/obG0JE
 L3LQET57+mehEjqh++d6BuPE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa600de2af1b08c0;
	Wed, 11 Nov 2026 14:51:09 +0000
X-Mizu-Trace-ID: fa600de2af1b08c0
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: axboe@kernel.dk,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	dgilbert@interlog.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH v2 2/2] scsi: sg: Require CAP_SYS_ADMIN for BLKTRACE passthrough ioctls
Date: Wed, 11 Nov 2026 22:50:34 +0800
Message-ID: <20261111145034.248717-3-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111145034.248717-1-cui.tao@linux.dev>
References: <20261111145034.248717-1-cui.tao@linux.dev>
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

sg_ioctl_common() calls blk_trace_setup(), blk_trace_startstop()
and blk_trace_remove() directly instead of going through
blk_trace_ioctl(), so gating the block side does not close the sg
passthrough: an unprivileged process with access to an /dev/sg node
could still allocate relay buffers and control tracing state on the
underlying request queue.

Require CAP_SYS_ADMIN for the four passthrough commands.  The check
sits after the command log line so the new rejections stay visible
in the ioctl trace, and it is qualified with
IS_ENABLED(CONFIG_BLK_DEV_IO_TRACE) so kernels without blktrace
keep returning -ENOTTY for these commands instead of a new -EPERM.

BLKTRACE ioctls through sg now get the same answer they would get
through the block device node: -EPERM for unprivileged callers,
regardless of the trace or queue state behind the node.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 drivers/scsi/sg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 6551f1284d44..f863979604ef 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -911,6 +911,13 @@ static int put_compat_request_table(struct compat_sg_req_info __user *o,
 }
 #endif
 
+/* keep in sync with the commands blk_trace_ioctl() gates */
+static bool sg_is_blktrace_cmd(unsigned int cmd)
+{
+	return cmd == BLKTRACESETUP || cmd == BLKTRACESTART ||
+	       cmd == BLKTRACESTOP || cmd == BLKTRACETEARDOWN;
+}
+
 static long
 sg_ioctl_common(struct file *filp, Sg_device *sdp, Sg_fd *sfp,
 		unsigned int cmd_in, void __user *p)
@@ -922,6 +929,9 @@ sg_ioctl_common(struct file *filp, Sg_device *sdp, Sg_fd *sfp,
 
 	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
 				   "sg_ioctl: cmd=0x%x\n", (int) cmd_in));
+	if (IS_ENABLED(CONFIG_BLK_DEV_IO_TRACE) &&
+	    sg_is_blktrace_cmd(cmd_in) && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
 	read_only = (O_RDWR != (filp->f_flags & O_ACCMODE));
 
 	switch (cmd_in) {
-- 
2.53.0

