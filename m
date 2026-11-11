Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408663;
	b=3JIVkv4F3U49xjlkgXSGVVtmIBTXl8I8yQAhYDO2cVXfN8H8q2tk4rEs+E8B8PEnIEP7
	 fn+rcfbNrogC5oQOcnmcAJ40y6HCFAXk3q4ZjcatpkXHEnfMKWOOz+nhoJmcN18UuiIHi
	 MFLkHci59mp/sO4jQH/HNrW12tM03bTlfDiAFwilOPdhr8oGrP3R91oxfYaud0I6p1+Ky
	 +b4fmObLcNEcUj/dOK6Ps4UOv2PZgWrMq/qlb4Fd3Vw/7GO4nh16Kl+Oy3PBiFjKPFbOy
	 A2++GvtTs29N7biyVBB3RGRsAqpaRJFQkXORoYksjzllE+1yigQtKKzx6AUTXdmj3+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408663;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EJoVaWGGDNW1Id/n/9brJAEB3fKM8Jou3zLTRrF1e7U=;
	b=mq+abJRquaq5RL1z4dsSppvc4nEiuKbGiv2sw0AYBIzNczGHtI84nc8TqZChJh88KeV+
	 9yALkFgZ6NcBwwm4YqeT+ZH65E/VJBv01F5B3GwoD1krKoOIKR1hC25nMmgPLm4FVtxSl
	 0EZKgN5GAHrlBtCwJHOhl8RyQ3fGYWg0yhRSgd7ewPqQk6P8H+3x+g2zEyeoCKDuizJXn
	 eqDjpNa3BqVWzes3+xk5gFREmkG0P8HyeuaA1esdwYvwOQPgQMcGY1kautUekZZDYwi2O
	 VvtzvxQyXXArASjKSN6TLG+vU77VP28bZkRTH19YXTq770peGJYRrOisyRyynI/G/Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VO5lBtoU;
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C3606A88C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68C3606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VO5lBtoU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6BTSDkaYo+GkLYc1VRePzbZVpQvqYtmjYkbAZjXokg8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794408660; v=1; x=1795013460;
 b=VO5lBtoUEtVoeus0nYjvQfEZJgP5hfM+BiUlYoKSpEDMIeVtuq7aJ6raxAVT+jwAJnfHnOaO
 juz/m1mHxUcW1glOPSJRgesgBV7GZQ9hhQKQkxW8CimUk02p6qI3/vkSlcV2N0qq7B4kqBGg6co
 jmTBlL875ihc8ZZkXitc23oA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9da4ac12eb974c88;
	Wed, 11 Nov 2026 14:51:00 +0000
X-Mizu-Trace-ID: 9da4ac12eb974c88
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
Subject: [PATCH v2 1/2] blktrace: require CAP_SYS_ADMIN for the blktrace interface
Date: Wed, 11 Nov 2026 22:50:33 +0800
Message-ID: <20261111145034.248717-2-cui.tao@linux.dev>
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

BLKTRACESETUP allocates user-sized relay buffers and sets up a trace
that outlives the creating fd.  Every command of the interface,
BLKTRACESETUP, BLKTRACESETUP2, BLKTRACESTART, BLKTRACESTOP,
BLKTRACETEARDOWN and, on x86_64 with CONFIG_COMPAT, the 32-bit
variant can be issued by anyone who can open the block device node,
and the sysfs trace attribute group reaches the same tracing state
without any check.  A container that is handed the node can hold
trace state and relay memory on a shared queue; the relay files
themselves stay root-only (0400).

Gate blk_trace_ioctl() and sysfs_blk_trace_attr_store() with
CAP_SYS_ADMIN.  The ioctls return -EPERM, the sysfs store -EACCES
like the md store callbacks it resembles.  Unprivileged callers now
get one answer that depends only on their credentials, instead of
values that revealed whether a trace existed and was running.

Traces survive the creating fd by design, so a creator that drops
its privileges can no longer tear down its own trace.  Such traces
wait for a privileged teardown or for the queue to go away;
blk_trace_remove() from sg_device_destroy() and
blk_trace_shutdown() from blk_unregister_queue() bound that wait for
unplugged devices.
Document the sysfs attributes in Documentation/ABI, where the group
has been missing since it was added.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 Documentation/ABI/stable/sysfs-block | 18 ++++++++++++++++++
 kernel/trace/blktrace.c              |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-block b/Documentation/ABI/stable/sysfs-block
index 900b3fc4c72d..177c4b95a47d 100644
--- a/Documentation/ABI/stable/sysfs-block
+++ b/Documentation/ABI/stable/sysfs-block
@@ -939,3 +939,21 @@ Description:
 		==  ==============================================
 
 		For more details refer Documentation/admin-guide/iostats.rst
+
+
+What:		/sys/block/<disk>/trace/{enable,act_mask,pid,start_lba,end_lba}
+		/sys/block/<disk>/<partition>/trace/{enable,act_mask,pid,start_lba,end_lba}
+Date:		January 2009
+Contact:	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
+Description:
+		Configure blktrace for this device's request queue.
+		"enable" creates (1) or removes (0) the per-queue trace
+		bookkeeping; "act_mask" selects the traced action
+		categories, either as a number or as a list of category
+		names; "pid" restricts tracing to one process;
+		"start_lba" and "end_lba" bound the traced sector range.
+		Reading an attribute shows the current setting and needs
+		no privilege; writing any attribute requires
+		CAP_SYS_ADMIN.  Enabling from sysfs does not set up
+		relay buffers; full tracing is armed through the
+		BLKTRACESETUP ioctl.
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 8cd2520b4c99..f56d57a924bf 100644
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
@@ -2079,6 +2082,9 @@ static ssize_t sysfs_blk_trace_attr_store(struct device *dev,
 	u64 value;
 	ssize_t ret = -EINVAL;
 
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+
 	if (count == 0)
 		goto out;
 
-- 
2.53.0

