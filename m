Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421187;
	b=T5KtDHxbWWA1E7RjE0bts8dcd699dlNcJyMUgPvj9nqWBZDyZCFQAUfURZgd6RLDqZg1
	 ayfmBCSOhZ/O/ATFWhUaphFUGinYiVmo0Ct/9ivhkwtjddD06SDKSWTiWAdNoqW4Lvxho
	 P3bK5/w06o7LO021scRCfa3Z5fv6D55KSo9crpwjJN7xmfj6HqL0GCeMKLusQZimswbag
	 SU29FVfLBte50/a1kQZTj/MKjP5IK1dV24fil2WZPo5LMhPel1/RPu0HZmWkgsLJ36Yb5
	 /LwR3VJeFecSJ8a9zWhV/UL9Iid0Ds3TYidw1dvXV6TLCyp04q8/MR8VoP2wng1LpQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421187;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DWKEpY9TGuZGcHQwDYqbtOA+wczVZmljo9NY2JulXuI=;
	b=UxtXIyGuQoc2Ktd0djqo57bnfgOdL8mjcQB+oY4dhf2iB14eMAOB2zXuathP4frlYzw2
	 fj4DpfM/ZefSuf6hjUGg5Us063nCD1R/V302j6Bloh9bqFZ/NBbsCEiPRcf2bB0VwsW8j
	 xJdpJ29Xfnh+X3uah+kd3YRIsd+ejFGQ2+E4seDDJDeLz6SQ5LIG8YHBAZXa4uL3TVrxO
	 KmMS82Edfd75HtJaWV4+h4dVZ10yBdqePRoXWHDJuaSYZ98ir3cdhr75FSMauRwQfeVKs
	 SZez/4dh4Qt30kKcaLejVnEk3XTPTSaQVr9fZcOQNaJDYWeeVbYlqyKeOYrf0L7G7Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FHKf3Zly;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yv9FmXYn;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C67606AE25
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C67606AE25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FHKf3Zly;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Yv9FmXYn
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794421185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWKEpY9TGuZGcHQwDYqbtOA+wczVZmljo9NY2JulXuI=;
	b=FHKf3ZlySMbFURBNDAN5pNEhpu9Igql8PI/eRtb3YBHanBImVC0hPSytqJ9awQDZRJ4jw6
	IAorpGNASaDZHr8PNpfle+KrbGO0Hrd6z1AiEHmtvwXcwLj7jVykFxpGEKRpTMWshYN5Gt
	9CEQ+386Jc/Zz199i4UM3K2jySRaVTXpOlyGLtOmWQRwf8qf9M81OP6hvTZNkp8t4BaK/k
	W3nU9J/V+zBgpxwhN4Y/C6K5noTsVcgdK5vZvQh9AuUIcEvXutw5ZuZoZn4ugWYdAHf+yg
	VnMdnSAAhyG5J1PTRB4fHmyZOYafbQvSgWHcuIdlAqcvoDXQy0sCpDWo0EQTyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794421185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWKEpY9TGuZGcHQwDYqbtOA+wczVZmljo9NY2JulXuI=;
	b=Yv9FmXYn+SLb/n8co6WSwoZT1qMQVBezECwkp9u8PGz+sCORe2f1AKR3i0YZvCwV/ySs2D
	mAcsO+YyTHzdePCQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk v2 2/6] console: Introduce unsafe flush policy flags
Date: Wed, 11 Nov 2026 19:25:18 +0106
Message-ID: <20261111181942.593695-3-john.ogness@linutronix.de>
In-Reply-To: <20261111181942.593695-1-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
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

Prepare for per-console atomic flushing policies by introducing a
new nbcon-specific console field @unsafe_flush_flags to store the
unsafe flush policies for a console. The policies are represented
by bits, specified by enum nbcon_unsafe_flush_flags.

Currently it is expected that any @unsafe_flush_flags bits are set
prior to console registration and do not change while registered.

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/console.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/console.h b/include/linux/console.h
index 06d01f1743512..beb1ee04535b7 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -194,6 +194,29 @@ enum cons_flags {
 	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
 };
 
+/**
+ * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
+ * @NBCON_PANIC_FLUSH:		In panic, unsafe flush before kexec or reboot.
+ * @NBCON_PANIC_PRINTK:		In panic, unsafe flush on each printk().
+ * @NBCON_NORMAL_NOTHREAD:	During normal operation, when printing
+ *				kthreads are unreliable or have been shutdown,
+ *				unsafe flush on each printk() or on explicit
+ *				flushing.
+ * @NBCON_KDB:			Unsafe flush kdb output.
+ *
+ * NBCON unsafe atomic flushing always occurs at the end of panic() before
+ * the kernel enters an infinite loop. Users may choose to perform unsafe
+ * flushing in additional scenarios where the current kernel is ending in
+ * order to increase the chances of seeing console messages, even if it is
+ * not safe to do so.
+ */
+enum nbcon_unsafe_flush_flags {
+	NBCON_PANIC_FLUSH	= BIT(0),
+	NBCON_PANIC_PRINTK	= BIT(1),
+	NBCON_NORMAL_NOTHREAD	= BIT(2),
+	NBCON_KDB		= BIT(3),
+};
+
 /**
  * struct nbcon_state - console state for nbcon consoles
  * @atom:	Compound of the state fields for atomic operations
@@ -326,6 +349,7 @@ struct nbcon_write_context {
  * @data:		Driver private data
  * @node:		hlist node for the console list
  *
+ * @unsafe_flush_flags:	Unsafe atomic flush policy. See enum nbcon_unsafe_flush_flags
  * @nbcon_state:	State for nbcon consoles
  * @nbcon_seq:		Sequence number of the next record for nbcon to print
  * @nbcon_device_ctxt:	Context available for non-printing operations
@@ -461,6 +485,8 @@ struct console {
 	 */
 	void (*device_unlock)(struct console *con, unsigned long flags);
 
+	unsigned int		unsafe_flush_flags;
+
 	atomic_t		__private nbcon_state;
 	atomic_long_t		__private nbcon_seq;
 	struct nbcon_context	__private nbcon_device_ctxt;
-- 
2.47.3

