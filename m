Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834457;
	b=Ukg5riLecp56php2ItVHS/3KWUBNXgX7ithzkuz4KzNeFaQm9AeTcl8u41QMu0bJ/gx2
	 PxV1iIgRcVqYtDijh1saF6vG2FnmnFg/2t3J0UZE6pCkPXASa0pHms6r30vfm87X8k31a
	 N5OUoQJvqh3rmQSe3nTBTCYW/LFK11fSLw0LVvk67WEqDv0Xhpee7NQAvqu7ohgkuJao4
	 DqbIzA9yFRZ8Mptiexn5fmHATrltCMENzxVHXS3jXhI6jJHmuYu/d3k4ZLJNNJzH5MeWw
	 6nS+3CA/xFEMK3fkya4KW2AA9LWvar2siGSjjVGKt9EhyykpSdw+SsGED04tXfvMNBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6pcpvaSe9ElEJt/G5lEejZAQ2sl+Ux6mleZlCU2LO+0=;
	b=M6q6Y/X0hXN1vnTvzaQE9g9Da3UfXHdnCMi1hOy0FMgt4OyuQ0Az7jm3fIAC/E6C3Oje
	 33If1nDWSphYW6m97PWEuo8CEcMGU9+ez0nadxKYxunRgoMwS0bl5H2lsVM/dt4yZ+pQN
	 waR+kTs4178AuBko6IP1eR/yN8jTDj/9E3q8iEXWYvtgvoJPAuzpHZHWxnfeVl/tTIdu3
	 RdgahhI/AQExfKeCdT7yWR8uMjM7TMEXVOe1c9Z5Ox4OxURd/zL7aoc9Bl5D22IRGfRcb
	 cyf6XJ1LMMZys55vklAA3YFQ/bG8va1c7k2FZ+fjmss01RGnKwsYIjj9BDDkI2qTPcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/kVshHl";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A400606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A400606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/kVshHl
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so821338a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793834456; x=1794439256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pcpvaSe9ElEJt/G5lEejZAQ2sl+Ux6mleZlCU2LO+0=;
        b=D/kVshHlSztePvRdaME0VrDfCaifENALUV5qVvoTlOqwXmIOoRDvM8d+e2KtZbsp6n
         MM4W7BmOwFnTIQTJV5mH+nKzcfaDfcklz4psWGxjZ5qxFEwt2QZ7sKJVdw0UY3jZj2fv
         WvZCJQucY/GpO87C1GyoYqwyZoalSi4YsUwRR7pRgN5NQNV5NvdT5ApTpBg7QTjAyf2N
         CEJOh5k2RQxA/sIUZLzpy+JXq+tcwClbhZFcrLP53Ro/1nbmU9majZlr+vxKyDkQdDoX
         9ETPZ59lJPc8f9CcQ896HXzsNXUi3iujx/RpI2lBDkkIfSc0xdCdEVdycQERgRylhmwP
         9vkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834456; x=1794439256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pcpvaSe9ElEJt/G5lEejZAQ2sl+Ux6mleZlCU2LO+0=;
        b=R4ZczF8y1b+4nt6k/w44eRhMf+C6CUjXWUxWy5AdkLMYdbOb7LKhHa+LyRA+TwQ/kZ
         vzaDP328q5kw2BnLi1omLZkPcRhW1FyKryb00gf54hsca39oo6+4A/OiSQzPmo+QQrQ3
         g+O0saUENSXYAK4nKmcfug7MH/CbY33IHn3uZcskz+NiuBkx5N37H73iF24D0nyvvNpU
         iOjE3MhXMPekzBtaW5AD8e7KdbfvrGWgVjKYIj5+Vpkzpg8qcZnqsR++M5Y2hnduFBWk
         AruRyQkQRb9TSoNO+Sbgw0T28vB9juWZqQslvoE/M3nS3KbunY0OVgJYzGchNSSBpNMi
         R6wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ9MV4n3DXzm8s2GCQPHgprYDbx3M7W8O4slUP0GFTMhc2RBEbYc8Qsl3hfkTmlISzMpK3qDMD71cGih8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y9GsbPkUkf7H0wuDamM/TS2ycocLHY9QqHcRLYzrMb7BrY9HN
	QEWkVLglNfLp49J5ZgDsBAv6p0ayOZ7bOEI/dMnd4ycKnstDbJnDM3Ch
X-Gm-Gg: AYBFou3uJlgEoLxRkSyqjmRHYHCzy4O7QeBRIGT525CHmaoaUGZSApAXXXu1dLa5Lmi
	Mqiknv2+5lz5R8W07qY6gysQqjSFXjuzTOhADFSp5IIohmhtslwoTuHosaVi5F0YRUpaOqiIDAL
	3/vn97jkZW7AAiapPo+Shoj5BJXRNRpJa1euCrwM6jzyBR5Z95KKmRDdTMUkMvM07yXKu5WK+W/
	fcOZRgda855ocwzjO3Nt96Bu2SY9cos4fqOalzdogmUP1afPmJRaW2X+jHoOWp8YVe9/8nyMXxw
	8YfsSJlus1rSG2juFxAn+8VZTWmibX1CWEkkYQSca8QJaEHSvDnf++zmrQ/oC4Y1990ma280GKJ
	y2OP+waBHcjzyD+G/gh/0dBxpygWWnuDWZXIBel4o3tlC8lORxyOwxtII0FsnuuZsih9LVZmkkU
	VegMGU0ijIbGG6eLfA5jCjomsJ/n3fmPhZRaPsHkSDg7w81ISPm5ulyP/bT4FnNNjgaFawSzrIw
	VJcMqCduPq6WJAy6J2m6ifN/BrlBBUwGO0AczMxcm7l37cvz/yPGAwcNMRyNxMILHSRBgGFtpme
	hNbBVLVrk/9hNeUvG880YQsPAQ8n
X-Received: by 2002:a17:90b:3811:b0:3b0:adba:45e9 with SMTP id 98e67ed59e1d1-3b0adc98d2emr1040635a91.58.1793834456448;
        Wed, 04 Nov 2026 15:20:56 -0800 (PST)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094dec0e3sm2551500a91.1.2026.11.04.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:20:55 -0800 (PST)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v3] tracing: Keep copying markers when one instance is stopped
Date: Thu,  5 Nov 2026 08:19:26 +0900
Message-ID: <20261104232046.32519-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104085715.5838b869@gandalf.local.home>
References: <20261103005219.3236380-1-jaewon8868@gmail.com> <sashiko-outbox-194417@kernel.org> <20261103095019.6a88e783@gandalf.local.home> <20261104063552.28094-1-jaewon8868@gmail.com> <20261104085715.5838b869@gandalf.local.home>
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

When several instances enable copy_trace_marker, stopping one instance
can prevent the remaining buffers from receiving markers.

Continue copying text and raw markers even if one copy fails. Return the
largest successful write length, or -ENODEV if no write succeeds.

Fixes: 7b382efd5e8a ("tracing: Allow the top level trace_marker to write into another instances")
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
Changes in v3:
- Return the largest successful write length, as suggested by Steven.

Tested on x86_64 QEMU:
- Before: A failed copy prevents writes to later live buffers.
- After: All buffers are tried, and the largest successful write length
  is returned. If no write succeeds, ENODEV is returned.
- Existing text/raw marker and instance selftests: 6 PASS.

 kernel/trace/trace.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 08614af8fad1..164da1ea5e73 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6329,9 +6329,10 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 	if (tr == &global_trace) {
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
-			written = write_marker_to_buffer(tr, buf, cnt, ip);
-			if (written < 0)
-				break;
+			ssize_t w = write_marker_to_buffer(tr, buf, cnt, ip);
+
+			if (w >= 0 && w > written)
+				written = w;
 		}
 	} else {
 		written = write_marker_to_buffer(tr, buf, cnt, ip);
@@ -6408,9 +6409,10 @@ tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
 	if (tr == &global_trace) {
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
-			written = write_raw_marker_to_buffer(tr, buf, cnt);
-			if (written < 0)
-				break;
+			ssize_t w = write_raw_marker_to_buffer(tr, buf, cnt);
+
+			if (w >= 0 && w > written)
+				written = w;
 		}
 	} else {
 		written = write_raw_marker_to_buffer(tr, buf, cnt);

base-commit: d7ff48d92a0f28bc0612da47c054efbc28c19562
-- 
2.43.0

