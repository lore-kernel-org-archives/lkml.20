Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956668;
	b=d0+pozupGCTdNs9iNgAU4Xs87gLoyah0amopRFrnS1SrGcuHI4pu3V8P+3q3R4WAPxaB
	 yAYoav3bl+2NM2N9qGS3vRdBT4dyTX8wZYlj7cVB8FlTFVDSikIvNN/f9BQ7xKtvs7bf0
	 srFXF3vL6K6ca1aOCqzzC1hZApKdVvCoD8l47+btUphSF31ipvxSaUUAe7c4aARAJto25
	 EeD6t3/uX084LUKZU5V+K4wBIi3lWHTYzajqB8US8n1B3tS7SsdfwNHejtYI3a214sWjp
	 Nt8+9VTj7ayIP6CNXYfHSsOCWwWBt+1mRvTN4LuVJM+8mLokk3mCvHxm5DcSaw8hSyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iNPloUTR9LM3h+nhnvEBDecNoAWunEFzhNB+irnO9g8=;
	b=XB3wmPMnSFBHtZMmu4POzAxUVqx0gMtitsNHUJCOveDfUinpQqpDfaNWpu5XwplIIWid
	 3pcf5ApABRYnqMaq0hYqEDVGKTy82ThTcGMqLMbswaP3CD5j3uZEEtD9RaX5I27aOUriZ
	 P1xcF9LtTvY3zBVenEUuC9wVlCpfub1cC3a7OxxbNJelM1uaScXPmb2Vos4cufrYhVpun
	 zTPmNu/dbCM10+T1Pnhv7Vh7f6mUugKu+zO7LqacClssjtcuvQrqvYmZOKhONH1nMe+z2
	 ek/0+Q/eM6G1a2HeDQ2g0mGHJvF1XJQTgUyh1NGCDKozUoFcl0a0jV5Fe6xYPkhtObw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G26h0o0A;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D91606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D91606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G26h0o0A
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so776700c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956667; x=1794561467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNPloUTR9LM3h+nhnvEBDecNoAWunEFzhNB+irnO9g8=;
        b=G26h0o0AiTK8g5MIkvzscNfzymxa9UNCAjO1THV7UBSWiZEncyxP9FbRSZPsus94gG
         X6HywaH7MwuXgqZWbWXaSHFNZNLXsgsFHdGCqadLKd7wdKshg6Vi+BelEOHMO3EmTwGH
         D54Bd3ovc+CAuc+5V3m7dbkD5nnBvO4wFmlY95A3rJsfiBdI4PTBqOYiMTora1crvw+6
         PJROWO9QKx55cZWU1DrrwkLv3rtu7FqrXnTuupYw+T9FnzXUTVMpHE8ai/7CA14NNUmx
         RY0xEQpOvC9vCjvNyzLoTROtkxhrL/B5otZy3v7g7K/CL/LH+RhIkUaYWkpsq5zGgdbL
         x+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956667; x=1794561467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNPloUTR9LM3h+nhnvEBDecNoAWunEFzhNB+irnO9g8=;
        b=mSbPTyEEQn85x+Yn9vJ1NT1+RCr4/rXfooUD2nG8Aimld6S3ZFUg+TknRu0wvg2m2B
         UrV6xOwKbtGX5AW3zoXPQ/4sIivkFUwyjzudahVAvqGk05XhS6zA6vMtOyRplc7cFftw
         D8wAtOoFsEzefQybk7CMfqQEUM98ScKFfKil0mR1LCMAG21ccvuGXNx2aB5S1D+pgpD/
         xVJQLAZZWVe5oIBhn5tsH9fDciiWowgH/yUQz/qMYzf3T7lsRBCN+LPZ5j482I+Ohm9j
         /pUzsS3PkKab3vY5hEIMTUnmnoiUBz5FeyQ9zE1tjZn8cMg7//tgApqH9rHhQLKB5+T9
         6Ofw==
X-Forwarded-Encrypted: i=1; AKwUvBw27ZQ2IWiITXjRga1p6O2eqy9vqB7TvnXUGJTeyIErHkHjZPaIa+yQDg06TduSF4JUVak57+c8wYKkXO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CCkXykfQXe0laUwYUdwgegBiYJviMPsV8UxcxbgyMyjKzfji/
	vGohkqbj32rW1yY2Yr/q4Knq+vkl30b1+4AMcOvZhBHQXdIiwNwEKADP
X-Gm-Gg: AYBFou1wfbVa+AWQVbpnjUTfYrI4d1mstiyVAGgXTlztWN+YrssJIEV3xY0QyWHgqkn
	adcxSXoacySWfaZhinO5HTLrhap7CwnQ9eXEUBhbnCTTTlCyaCe1l4z/J8KEK9pYVgWZh5u3dhZ
	Ge9hZZBckSxohFkibhImPfM7nvGMxM9AJF90WQHyOu8aM3/H3EujMCKoX92/Yimj36Bp9c8j514
	KMoXG/KxSUuLRdIswuf1foiQ6xSBGush2BSyh6Q3TySrZO5xNQM2IE0655mYrSApNxMaxCrPo6C
	17fhJDnV9HQB8kp3j8rWYP0lNoDi1zsEVeVkhd/KzTCPfh6V3sFBZ/TI3ncxNzFRgYQck6c7zI4
	pSd8EclfdMjDHrh69qNV0273iYo4dTc7Nim/WTnSp+iOHQC+1ArbLL+Ct9O9tdcufJiRU7Id+E0
	/5VeUiVQMADuImyq2Z06YXsAe1R2l+PPPs+avg1DFg/4Z7gpI2WBuvyyJrutRA5vUlGX0LgVBZu
	38AE+rHrbPGmZM3CCe2rehnUq6/Q/1b3pwGt80F9fn+II5ljrHl0OY2W1fcwNWSSCZ+YrouyibU
	vqWLiW4iPWe75g+o5CkMkLQus8LxYCXJIYa7A91WoIrx9pq+9BykD5yACZhzI0RVVFfxwjfhF6V
	7rbIBWUQinaox4Lny/tLHwChC1awfUCvCWA8DEpuUYHOd
X-Received: by 2002:a05:7022:c43:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1b25d36f29amr2101220c88.30.1793956666638;
        Fri, 06 Nov 2026 01:17:46 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a5628sm4927535c88.10.2026.11.06.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:17:46 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: amit@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: rusty@rustcorp.com.au,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] virtio_console: fix buffer ownership and unplug races in the read path
Date: Fri,  6 Nov 2026 17:17:39 +0800
Message-Id: <20261106091739.1334178-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The read path hands port buffers to readers without any ownership
protocol.  Two threads sharing one file descriptor can both pick up
port->inbuf, copy from it concurrently and requeue it twice, and an
input virtqueue callback prefetching the next buffer can drop the
remainder a reader is about to put back.  During port unplug a
reader can also call add_inbuf() on a virtqueue that is being torn
down (KASAN: slab-use-after-free in virtqueue_get_buf_ctx), or
requeue a buffer nobody will free anymore.  The input virtqueue
callback itself can run past find_port_by_vq() into port->portdev
and the virtqueue after unplug_port() has cleared them.

Track buffer ownership explicitly:

- fill_readbuf() claims port->inbuf under inbuf_lock and owns it
  exclusively across the unlocked copy.  port_read_snapshot() and
  the input virtqueue callback do not prefetch another buffer while
  a claim is held (nor once the port is being unplugged), so a
  partially consumed buffer is always finished before the next one
  and the byte order is preserved.

- The input state and the connection state are snapshotted together
  under inbuf_lock as empty, readable (a buffer can be acquired),
  claimed, or unplugged, together with guest_connected and
  host_connected.  poll() reports EPOLLIN when a buffer is available,
  or when the host has disconnected with no pending data so that a
  reader can observe EOF; a claimed buffer is not reported as
  immediately readable.  A claimed buffer is data pending for the EOF
  and host-disconnect logic, so a peer reader sharing the file
  descriptor does not observe EOF while another reader still owns
  unread bytes and instead waits for the claim to be released.  A
  nonblocking reader gets -EAGAIN (or 0 when the host has
  disconnected and no data is left).  Because the unplug state and
  the connection state are taken in the same critical section, a read
  that observes PORT_INPUT_UNPLUGGED in its snapshot returns -ENODEV,
  and poll() reports EPOLLHUP without a fake EPOLLIN.  A concurrent
  read may complete according to an earlier snapshot instead of
  observing the unplug immediately.  This
  ordering guarantee is against unplug_port(); the normal
  host_connected control-message update is not serialized by
  inbuf_lock and is read with READ_ONCE(), as before.  The atomic
  HVC poll simply retries.  will_read_block() uses the same snapshot
  for its wait predicate.

- unplug_port() publishes an "unplugging" state under inbuf_lock
  before any teardown.  After observing the unplugging state under
  inbuf_lock, in_intr() drops its port reference and returns without
  accessing portdev or the input virtqueue.  The separate HVC adapter
  lifetime race after inbuf_lock is dropped is addressed by the
  independently submitted hvc_kick change.  Readers stop touching the
  input virtqueue from that point; a reader returning a claimed buffer
  frees it instead of requeueing it.  A userspace read() that has not
  copied any byte returns -ENODEV for an unplugged port, while the HVC
  get_chars() path keeps returning 0.  In the fill_readbuf() release
  branches of this change, the teardown, copy-fault and
  failed-requeue paths defer free_buf() until inbuf_lock is dropped,
  so a userspace read may sleep in free_buf() for DMA buffers.  Other
  driver paths still free buffers under their own locks.  Nothing
  reads the buffer after it is freed, and the claim is
  always released with a wakeup, so readers waiting for the claim
  are not stalled until the next packet.

  The deferred rproc DMA buffers are reclaimed in unplug_port() after
  hvc_remove().  For the normal HVC polling path, the console entry is
  removed from pdrvdata.consoles before hvc_remove(), so a get_chars()
  that starts later cannot find this port; hvc_remove() also waits
  (via hp->lock) for a get_chars() that already found it.  The
  CONFIG_CONSOLE_POLL path is outside this normal teardown
  synchronization and has not been runtime-tested.

  For device-wide removal, virtio_break_device(), the virtqueue
  callback synchronization during reset, and cancellation of the
  control/config work precede unplug_port(); remove_vqs() subsequently
  frees remaining buffers in sleepable context.  For the virtio-pci
  and virtio-mmio transports, the reset-time callback synchronization
  is synchronize_irq() over the device vectors, and vring_interrupt()
  checks vq->broken before invoking the driver callback, so a late
  interrupt cannot invoke the callback after reset.  This does not
  establish runtime coverage of single-port PORT_REMOVE, where the
  device stays up and the remaining virtqueue callbacks are not
  stopped by reset, nor of all remoteproc transport behavior.

- A zero-length read returns 0 before the unplug checks, preserving
  the normal read(fd, buf, 0) semantics.

This issue was investigated and the fix was developed with AI
assistance (ZCode/GLM-4).

Testing with QEMU and KASAN injection (lockdep and
CONFIG_DEBUG_ATOMIC_SLEEP enabled in the test kernel):

- A shared-fd, two-reader test without unplug delivered all 20000
  records exactly once, with no corruption or reordering.  The
  unmodified kernel delivered 19979 of them more than once and only
  48 could be attributed to any consistent stream order.
- Stalling the input callback right after find_port_by_vq() while a
  QMP device_del unplugs the port made the previous version
  dereference the cleared portdev (KASAN null-ptr-deref in
  in_intr()); this version returns through the unplug check and
  reports nothing.
- Stalling a userspace read() just before fill_readbuf() and
  unplugging the port while it is parked: the previous version
  returns 0 (treated as a normal host disconnect), this version
  returns -ENODEV.
- With one reader parked while holding a claim, poll() no longer
  reports EPOLLIN and a nonblocking read from the second reader
  returns -EAGAIN instead of a readable/EAGAIN mismatch.  With the
  host disconnecting at the same point, the second reader gets
  -EAGAIN rather than a premature EOF, and the following blocking
  read receives the remainder the first reader puts back.
- During concurrent unplug, readers received a valid contiguous
  prefix before disconnect, with no duplicates or KASAN reports;
  the same stall sequences produce six slab use-after-free reports
  per run on the unmodified kernel.
- A separate fault-injection run exercised 20 failed buffer
  requeues, all going through the deferred free path, without a
  reported use-after-free, lockdep splat or invalid-context sleep.
- A nonblocking read with an empty input raced against unplug: the
  previous version returned 0 (a false EOF) once unplug cleared
  host_connected.  A read that observes the unplug state in its
  input/connection snapshot returns -ENODEV; a concurrent read may
  complete according to an earlier snapshot.  In this test the new
  version returns -EAGAIN and the next read -ENODEV.
- Polling while unplug_port() had published the unplugging state but
  not yet cleared the connection state: the previous version reported
  EPOLLIN | EPOLLRDNORM; this version reports EPOLLHUP only.
- A normal host disconnect still returns 0.
- Combined with the hvc_kick change for the HVC adapter lifetime,
  the 20000-record integrity test, the callback/unplug injection
  and a normal PORT_REMOVE run all complete without new KASAN,
  lockdep, duplicate or reordered data.  The 20000-record, High and
  -ENODEV tests were re-run on this version.

The test environment provides virtual virtio-console devices only.
Real remoteproc DMA buffers were not available, so the rproc-serial
DMA buffer path is covered by code inspection of the claim, deferred
free and reclaim ordering, not by a runtime test.

Fixes: 203baab8ba319 ("virtio: console: Introduce function to hand off data from host to readers")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Changes since v3:
- Snapshot the input state and the connection state in one
  inbuf_lock critical section, so an unplug is not mistaken for a
  host disconnect when the read and poll paths check host_connected
  after a state snapshot (reported by Sashiko).
- Make poll() report EPOLLHUP and no EPOLLIN for an unplugging port.
- Return 0 for zero-length reads before the unplug checks.
- Use the same snapshot in will_read_block() and remove the
  now-unused port_input_state().
- Document synchronization of the normal HVC polling path before the
  final DMA reclaim, and explicitly state the CONFIG_CONSOLE_POLL
  testing limitation.
- A/B: the previous version returns 0 / EPOLLIN in the new eofrace
  and pollunplug injections; this version returns -EAGAIN / -ENODEV
  and EPOLLHUP.  Re-ran the 20000-record, claim+poll, nb, eof, High
  and -ENODEV tests.
v3: https://lore.kernel.org/r/20261106053438.1206065-1-shunsheng1218@gmail.com/
v2: https://lore.kernel.org/r/20261105114535.972013-1-shunsheng1218@gmail.com/
v1: https://lore.kernel.org/r/179378543196.71890.7555371342727156729@gmail.com/
---
 drivers/char/virtio_console.c | 347 +++++++++++++++++++++++++++++-----
 1 file changed, 298 insertions(+), 49 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 019bcae81af5c..6573db068eee3 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -180,6 +180,23 @@ struct port {
 	/* The current buffer from which data has to be fed to readers */
 	struct port_buffer *inbuf;
 
+	/*
+	 * True while a reader owns an exclusively claimed inbuf outside
+	 * inbuf_lock, possibly sleeping in copy_to_user().  Nobody may
+	 * prefetch the next buffer meanwhile: the claimer's unconsumed
+	 * remainder goes back to inbuf first, or the prefetched buffer
+	 * would be dropped or the stream reordered.
+	 */
+	bool inbuf_claimed;
+
+	/*
+	 * Set at the start of unplug_port(), before any teardown.  The
+	 * read path checks it under inbuf_lock and stops touching the
+	 * input virtqueue; a reader returning a claimed buffer frees it
+	 * instead of requeueing it.
+	 */
+	bool unplugging;
+
 	/*
 	 * To protect the operations on the in_vq associated with this
 	 * port.  Has to be a spinlock because it can be called from
@@ -534,19 +551,56 @@ static void discard_port_data(struct port *port)
 			 err);
 }
 
-static bool port_has_data(struct port *port)
+/*
+ * Input state of a port, snapshotted under inbuf_lock.  The distinction
+ * between a buffer that can be acquired now (AVAILABLE) and one that is
+ * owned by another reader (CLAIMED) matters for poll() and for blocking
+ * reads: only AVAILABLE must be reported as readable, while both mean
+ * that unread data may still be pending for the EOF logic.
+ */
+enum port_input_state {
+	PORT_INPUT_EMPTY,
+	PORT_INPUT_AVAILABLE,
+	PORT_INPUT_CLAIMED,
+	PORT_INPUT_UNPLUGGED,
+};
+
+/*
+ * Consistent snapshot of the input state and the connection state.
+ * unplug_port() publishes the unplugging state and clears
+ * guest_connected/host_connected under inbuf_lock, so taking all of
+ * them in the same critical section lets the read and poll paths tell
+ * an unplug from a normal host disconnect.
+ */
+struct port_read_snapshot {
+	enum port_input_state input;
+	bool guest_connected;
+	bool host_connected;
+};
+
+/* Callers must not hold inbuf_lock. */
+static struct port_read_snapshot port_read_snapshot(struct port *port)
 {
+	struct port_read_snapshot snap;
 	unsigned long flags;
-	bool ret;
 
-	ret = false;
 	spin_lock_irqsave(&port->inbuf_lock, flags);
-	port->inbuf = get_inbuf(port);
-	if (port->inbuf)
-		ret = true;
+
+	snap.guest_connected = port->guest_connected;
+	snap.host_connected = READ_ONCE(port->host_connected);
+
+	if (port->unplugging || !port->portdev) {
+		snap.input = PORT_INPUT_UNPLUGGED;
+	} else if (port->inbuf_claimed) {
+		snap.input = PORT_INPUT_CLAIMED;
+	} else {
+		port->inbuf = get_inbuf(port);
+		snap.input = port->inbuf ? PORT_INPUT_AVAILABLE
+					 : PORT_INPUT_EMPTY;
+	}
 
 	spin_unlock_irqrestore(&port->inbuf_lock, flags);
-	return ret;
+	return snap;
 }
 
 static ssize_t __send_control_msg(struct ports_device *portdev, u32 port_id,
@@ -692,24 +746,122 @@ static ssize_t __send_to_port(struct port *port, struct scatterlist *sg,
  * Give out the data that's requested from the buffer that we have
  * queued up.
  */
+static bool will_read_block(struct port *port);
+
 static ssize_t fill_readbuf(struct port *port, u8 __user *out_buf,
-			    size_t out_count, bool to_user)
+			    size_t out_count, bool to_user, bool nonblock)
 {
 	struct port_buffer *buf;
+	struct port_read_snapshot snap;
 	unsigned long flags;
+	bool free_requeue_buf = false;
+	int err;
 
-	if (!out_count || !port_has_data(port))
+	if (!out_count)
 		return 0;
 
+retry:
+	spin_lock_irqsave(&port->inbuf_lock, flags);
+
+	/* The port is going away; its vqs are being torn down. */
+	if (port->unplugging || !port->portdev) {
+		spin_unlock_irqrestore(&port->inbuf_lock, flags);
+		/* Userspace sees a removed port; HVC just has no data. */
+		return to_user ? -ENODEV : 0;
+	}
+
+	/*
+	 * Another reader (a userspace read() or the HVC console poll)
+	 * owns the claimed buffer, possibly sleeping in copy_to_user().
+	 * Prefetching the next buffer here would drop or reorder the
+	 * claimed data once the owner returns its unconsumed remainder,
+	 * so report no data instead.  The HVC poll will simply retry;
+	 * a userspace reader waits for the claim to be released.
+	 */
+	if (port->inbuf_claimed) {
+		spin_unlock_irqrestore(&port->inbuf_lock, flags);
+		if (!to_user)
+			return 0;
+		if (nonblock)
+			return -EAGAIN;
+
+		err = wait_event_freezable(port->waitqueue,
+					   !READ_ONCE(port->inbuf_claimed) ||
+					   READ_ONCE(port->unplugging));
+		if (err)
+			return err;
+		goto retry;
+	}
+
+	port->inbuf = get_inbuf(port);
 	buf = port->inbuf;
+	if (!buf) {
+		bool guest = port->guest_connected;
+		bool host = READ_ONCE(port->host_connected);
+
+		spin_unlock_irqrestore(&port->inbuf_lock, flags);
+		if (!to_user)
+			return 0;
+		if (!guest)
+			return -ENODEV;
+		if (nonblock)
+			return host ? -EAGAIN : 0;
+		if (!host)
+			return 0;
+		/*
+		 * The input is empty but the guest is still connected.
+		 * Wait for data, a disconnect or the unplug fence, then
+		 * re-snapshot instead of reusing the state above.
+		 */
+		err = wait_event_freezable(port->waitqueue,
+					   !will_read_block(port));
+		if (err)
+			return err;
+
+		snap = port_read_snapshot(port);
+		if (snap.input == PORT_INPUT_UNPLUGGED ||
+		    !snap.guest_connected)
+			return -ENODEV;
+		if (snap.input == PORT_INPUT_EMPTY && !snap.host_connected)
+			return 0;
+		goto retry;
+	}
+
+	/*
+	 * Claim the buffer: we own it exclusively while copying,
+	 * without holding inbuf_lock.
+	 */
+	port->inbuf = NULL;
+	port->inbuf_claimed = true;
+	spin_unlock_irqrestore(&port->inbuf_lock, flags);
+
 	out_count = min(out_count, buf->len - buf->offset);
 
 	if (to_user) {
 		ssize_t ret;
 
 		ret = copy_to_user(out_buf, buf->buf + buf->offset, out_count);
-		if (ret)
+		if (ret) {
+			bool free_it;
+
+			/*
+			 * The copy failed: hand the buffer back with its
+			 * data intact, unless the port is being unplugged,
+			 * in which case nobody would free it anymore.
+			 */
+			spin_lock_irqsave(&port->inbuf_lock, flags);
+			free_it = port->unplugging || !port->portdev;
+			if (!free_it)
+				port->inbuf = buf;
+			port->inbuf_claimed = false;
+			spin_unlock_irqrestore(&port->inbuf_lock, flags);
+
+			if (free_it)
+				free_buf(buf, true);
+			else
+				wake_up_interruptible(&port->waitqueue);
 			return -EFAULT;
+		}
 	} else {
 		memcpy((__force u8 *)out_buf, buf->buf + buf->offset,
 		       out_count);
@@ -717,19 +869,57 @@ static ssize_t fill_readbuf(struct port *port, u8 __user *out_buf,
 
 	buf->offset += out_count;
 
-	if (buf->offset == buf->len) {
+	spin_lock_irqsave(&port->inbuf_lock, flags);
+
+	if (port->unplugging || !port->portdev) {
+		/*
+		 * The port was unplugged while we were copying: the vqs
+		 * are going away, so free the buffer instead of requeueing
+		 * it.  Runs outside the lock; sleepability matches the
+		 * caller's context (to_user == false is the atomic HVC
+		 * path, whose DMA frees are deferred by free_buf()).
+		 */
+		port->inbuf_claimed = false;
+		spin_unlock_irqrestore(&port->inbuf_lock, flags);
+		free_buf(buf, to_user);
+		wake_up_interruptible(&port->waitqueue);
+		return out_count;
+	}
+
+	if (buf->offset < buf->len) {
+		/* Data left in this buffer; serve it before the next one. */
+		port->inbuf = buf;
+	} else {
 		/*
 		 * We're done using all the data in this buffer.
 		 * Re-queue so that the Host can send us more data.
 		 */
-		spin_lock_irqsave(&port->inbuf_lock, flags);
-		port->inbuf = NULL;
-
-		if (add_inbuf(port->in_vq, buf) < 0)
+		if (add_inbuf(port->in_vq, buf) < 0) {
 			dev_warn(port->dev, "failed add_buf\n");
-
-		spin_unlock_irqrestore(&port->inbuf_lock, flags);
+			/*
+			 * Defer the free: free_buf() may call
+			 * dma_free_coherent() (rproc buffers) when the
+			 * caller can sleep, which is illegal with
+			 * inbuf_lock held and IRQs off.
+			 */
+			free_requeue_buf = true;
+		}
 	}
+
+	/*
+	 * Release the claim.  Do not touch buf afterwards: it may have
+	 * been freed above (failed requeue).  Wake unconditionally:
+	 * readers waiting for the claim need a wakeup even when the
+	 * buffer was fully consumed.
+	 */
+	port->inbuf_claimed = false;
+	spin_unlock_irqrestore(&port->inbuf_lock, flags);
+
+	if (free_requeue_buf)
+		free_buf(buf, to_user);
+
+	wake_up_interruptible(&port->waitqueue);
+
 	/* Return the number of bytes actually copied */
 	return out_count;
 }
@@ -737,11 +927,17 @@ static ssize_t fill_readbuf(struct port *port, u8 __user *out_buf,
 /* The condition that must be true for polling to end */
 static bool will_read_block(struct port *port)
 {
-	if (!port->guest_connected) {
-		/* Port got hot-unplugged. Let's exit. */
+	struct port_read_snapshot snap = port_read_snapshot(port);
+
+	if (snap.input == PORT_INPUT_UNPLUGGED || !snap.guest_connected)
 		return false;
-	}
-	return !port_has_data(port) && port->host_connected;
+	if (snap.input == PORT_INPUT_AVAILABLE)
+		return false;
+	/* Another reader owns the claimed buffer: wait for it. */
+	if (snap.input == PORT_INPUT_CLAIMED)
+		return true;
+
+	return snap.host_connected;
 }
 
 static bool will_write_block(struct port *port)
@@ -771,21 +967,27 @@ static ssize_t port_fops_read(struct file *filp, char __user *ubuf,
 			      size_t count, loff_t *offp)
 {
 	struct port *port;
+	struct port_read_snapshot snap;
 	ssize_t ret;
 
 	port = filp->private_data;
 
-	/* Port is hot-unplugged. */
-	if (!port->guest_connected)
+	/* Zero-length reads always return 0. */
+	if (!count)
+		return 0;
+
+	snap = port_read_snapshot(port);
+	if (snap.input == PORT_INPUT_UNPLUGGED || !snap.guest_connected)
 		return -ENODEV;
 
-	if (!port_has_data(port)) {
+	if (snap.input != PORT_INPUT_AVAILABLE) {
 		/*
-		 * If nothing's connected on the host just return 0 in
-		 * case of list_empty; this tells the userspace app
-		 * that there's no connection
+		 * No buffer can be acquired right now: the input is empty
+		 * or another reader owns the claimed buffer.  A host
+		 * disconnect is only EOF when no reader still holds
+		 * unread bytes; with a claim outstanding, wait for it.
 		 */
-		if (!port->host_connected)
+		if (snap.input == PORT_INPUT_EMPTY && !snap.host_connected)
 			return 0;
 		if (filp->f_flags & O_NONBLOCK)
 			return -EAGAIN;
@@ -795,23 +997,19 @@ static ssize_t port_fops_read(struct file *filp, char __user *ubuf,
 		if (ret < 0)
 			return ret;
 	}
-	/* Port got hot-unplugged while we were waiting above. */
-	if (!port->guest_connected)
-		return -ENODEV;
+
 	/*
-	 * We could've received a disconnection message while we were
-	 * waiting for more data.
-	 *
-	 * This check is not clubbed in the if() statement above as we
-	 * might receive some data as well as the host could get
-	 * disconnected after we got woken up from our wait.  So we
-	 * really want to give off whatever data we have and only then
-	 * check for host_connected.
+	 * Re-snapshot after the wait: an unplug or a host disconnect may
+	 * have happened, and the pre-wait state must not be reused.
 	 */
-	if (!port_has_data(port) && !port->host_connected)
+	snap = port_read_snapshot(port);
+	if (snap.input == PORT_INPUT_UNPLUGGED || !snap.guest_connected)
+		return -ENODEV;
+	if (snap.input == PORT_INPUT_EMPTY && !snap.host_connected)
 		return 0;
 
-	return fill_readbuf(port, ubuf, count, true);
+	return fill_readbuf(port, ubuf, count, true,
+			     filp->f_flags & O_NONBLOCK);
 }
 
 static int wait_port_writable(struct port *port, bool nonblock)
@@ -995,21 +1193,25 @@ static ssize_t port_fops_splice_write(struct pipe_inode_info *pipe,
 static __poll_t port_fops_poll(struct file *filp, poll_table *wait)
 {
 	struct port *port;
+	struct port_read_snapshot snap;
 	__poll_t ret;
 
 	port = filp->private_data;
 	poll_wait(filp, &port->waitqueue, wait);
 
-	if (!port->guest_connected) {
-		/* Port got unplugged */
+	snap = port_read_snapshot(port);
+
+	/* Port got unplugged. */
+	if (snap.input == PORT_INPUT_UNPLUGGED || !snap.guest_connected)
 		return EPOLLHUP;
-	}
+
 	ret = 0;
-	if (!will_read_block(port))
+	if (snap.input == PORT_INPUT_AVAILABLE ||
+	    (snap.input == PORT_INPUT_EMPTY && !snap.host_connected))
 		ret |= EPOLLIN | EPOLLRDNORM;
 	if (!will_write_block(port))
 		ret |= EPOLLOUT;
-	if (!port->host_connected)
+	if (!snap.host_connected)
 		ret |= EPOLLHUP;
 
 	return ret;
@@ -1206,7 +1408,7 @@ static ssize_t get_chars(u32 vtermno, u8 *buf, size_t count)
 	/* If we don't have an input queue yet, we can't get input. */
 	BUG_ON(!port->in_vq);
 
-	return fill_readbuf(port, (__force u8 __user *)buf, count, false);
+	return fill_readbuf(port, (__force u8 __user *)buf, count, false, false);
 }
 
 static void resize_console(struct port *port)
@@ -1400,6 +1602,8 @@ static int add_port(struct ports_device *portdev, u32 id)
 
 	port->name = NULL;
 	port->inbuf = NULL;
+	port->inbuf_claimed = false;
+	port->unplugging = false;
 	port->cons.hvc = NULL;
 	port->async_queue = NULL;
 
@@ -1533,6 +1737,17 @@ static void remove_port_data(struct port *port)
  */
 static void unplug_port(struct port *port)
 {
+	/*
+	 * Mark the port as being unplugged before any teardown, so the
+	 * read path stops touching the input virtqueue: readers check
+	 * this flag under inbuf_lock and bail out, and a reader that is
+	 * returning a claimed buffer frees it instead of requeueing it
+	 * to a virtqueue that may already be gone.
+	 */
+	spin_lock_irq(&port->inbuf_lock);
+	port->unplugging = true;
+	spin_unlock_irq(&port->inbuf_lock);
+
 	spin_lock_irq(&port->portdev->ports_lock);
 	list_del(&port->list);
 	spin_unlock_irq(&port->portdev->ports_lock);
@@ -1579,6 +1794,18 @@ static void unplug_port(struct port *port)
 	debugfs_remove(port->debugfs_file);
 	kfree(port->name);
 
+	/*
+	 * Reclaim rproc DMA buffers deferred by the atomic cleanup
+	 * paths before the port is fully torn down.  For the normal
+	 * HVC polling path, the console entry was removed from
+	 * pdrvdata.consoles above, so a get_chars() that starts later
+	 * cannot find this port, while hvc_remove() waits (via hp->lock)
+	 * for a get_chars() that had already found it.  The
+	 * CONFIG_CONSOLE_POLL path is outside this normal teardown
+	 * synchronization and has not been runtime-tested.
+	 */
+	reclaim_dma_bufs();
+
 	/*
 	 * Locks around here are not necessary - a port can't be
 	 * opened after we removed the port struct from ports_list
@@ -1791,7 +2018,28 @@ static void in_intr(struct virtqueue *vq)
 	}
 
 	spin_lock_irqsave(&port->inbuf_lock, flags);
-	port->inbuf = get_inbuf(port);
+
+	/*
+	 * The port is being unplugged: unplug_port() tears down portdev,
+	 * the guest_connected state and the HVC adapter.  Do not touch
+	 * the input virtqueue or any of that state; just drop the port
+	 * reference taken by find_port_by_vq().
+	 */
+	if (port->unplugging || !port->portdev) {
+		spin_unlock_irqrestore(&port->inbuf_lock, flags);
+		wake_up_interruptible(&port->waitqueue);
+		kref_put(&port->kref, remove_port);
+		return;
+	}
+
+	/*
+	 * A reader may own an exclusively claimed buffer, possibly
+	 * sleeping in copy_to_user().  Do not prefetch the next buffer
+	 * now: the claimer's unconsumed remainder must go back to
+	 * port->inbuf first, or the prefetched buffer would be lost.
+	 */
+	if (!port->inbuf_claimed)
+		port->inbuf = get_inbuf(port);
 
 	/*
 	 * Normally the port should not accept data when the port is
@@ -1810,7 +2058,8 @@ static void in_intr(struct virtqueue *vq)
 	 * guest_connected to true.
 	 */
 
-	if (!port->guest_connected && !is_rproc_serial(port->portdev->vdev))
+	if (!port->inbuf_claimed && !port->guest_connected &&
+	    !is_rproc_serial(port->portdev->vdev))
 		discard_port_data(port);
 
 	/* Send a SIGIO indicating new data in case the process asked for it */
-- 
2.34.1

