Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758383;
	b=u4Xi4gLnTUJolD9XsfeDYyBH1NbjDJYYbmIPhj99qPO0MqUTHVwgQP9cNlQx7Quk6OJK
	 j1t9BYuqYNybi5mZmoVec86tU3XSptBynm2MflI6cHuft8pexUkXqjnl7fW+Amuns6V5S
	 x/S67s+Q1I37lWc9VDYM7c6ISuwyLTPp005gdg+zoDDOLaG1lfZPzn7d45WwX1I3QJK7s
	 v8IZ4PjTtk+SBVTRUWDxq0Im9xZm2IzYPbSztenExAbeiAd+EPm6v1/E3BpTfoX00D8Zq
	 F9YUlOkCIhGFoVTiruV9ioQGGJdhZ4k9d3IKYPAiab+V3D1OUDLIjHemZWoSSuepVKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xTFQQMhK3UJMqexJFys6E1k1C7+dAh9ayaPYXn833+U=;
	b=1EnkK5qLwbJyXGc1+0BXey0XvuFHV7ebBKCgKDocWVwbM9iJqQW0XzJpOAHFEZYOP5hf
	 XDXPqlueURA8yA9tqNZVStGsGFC9VrE3c7osldcUrtwOHDme7GAj0Bv7MYid0JVF7SaXs
	 tAxceswh0+3eGudnp9in7NyzMVfT3X14bpSnldv3GhKdHaR3JjI3SzZ6zQA7ZDZ0X6Jw/
	 gUC/KkI05xlMgCcGFmAFaBusniyOWp3nka5OTZ+KTmP52Cr+zP72/IjYaTH9jlDaQy4/a
	 0pbxiM6nErubHb+m2MbudA5+BfVu3btU8+zpHDZGRGXNF6s7FmcKIcKxkeXEEYe3GQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygKzYaSv;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A11606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A11606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygKzYaSv
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so27679915e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758381; x=1795363181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTFQQMhK3UJMqexJFys6E1k1C7+dAh9ayaPYXn833+U=;
        b=ygKzYaSvRhuzclPrvO3frMENam1XSgQqd7Xx9HDScTKCo8NIirBjMJiwM8H2cUbGsP
         O83Ax50tu+QQnbI40TxRpVBEgnveKIPH9iMgCGtcuy0JbVlDvcSuvtNkhBp911k90K/7
         idl0x1HqblOmNZ/fuTPHAOqtVVCYmyZP0Y4ZlpITuGRu/CdCaQQDk80f805XYmuC6X++
         DQZpxIuf76ogO7YxehSVTpbc0VorNB1MDesZnwNSI2pD4WAXuXo0kVGr1fCZ4Jwqp6Gu
         Idk9JZxXmych7XxEJFCp+kyD4vi3OKMNbSgh8PiI835smjhw5Ila3ypE1OXgiztbGni3
         OQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758381; x=1795363181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTFQQMhK3UJMqexJFys6E1k1C7+dAh9ayaPYXn833+U=;
        b=aOtYGgiV7X2OKuBK9Y1VdsYZ5sx9E9jsm2sTjpimOPDSwMSUqASjFb4rpsKIVQchmm
         cIj31iwptPsccBzGiKPODp3d+z1qO2oSotuX2sbP1Uv8TXjAlw+o+mIl5+AUqr3EG3t+
         +gVsy19+lILGxQWjlORUAiyttGLbxFDuQqOhnShelO8KUH8g0rxwj1Iz9YsEFX+ZPROD
         9faMOnAKeETB4vzvTLQNoPfUt14DE4kUlwgUDanQXcLZT1OlA5uvCfTV7eq8nuHTtarU
         2AWFND6ahioNWFSgGqVjpUpoIRt6eR4DwZrdS/E1jml8Pxm6SQZ8/7NA7yNY+B2m2fgk
         wJGQ==
X-Forwarded-Encrypted: i=1; AL+hErEXmCaBnmcr/Yg4NUQlJx0siahp1Xn8acXw3q/J2N2HTfI0tUKq23uuzcVljEpBhUV+jqUkRP91kPRz0iM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fuXjrMjkx5QEYstaL1iGHgC6eEw4sfFJYXhIBCiNqBpyASsbX
	jPQAjAlq3uaK+S0IGJ9ghcPDlXtt9sYLKA6ZXz4Q5bFe6WlMqfGggiMo
X-Gm-Gg: AYBFou2ovWWilFhoGG1XmpRbdfjlWVDyKMF2jIU+vJRumIlFXLU3v7TBDXTNZA4R4MX
	hPxpzpDGZ+Xjq8MdFraVzqQOutk9cZZ1+JF30Pk/v2PJ4Db50QMVwD/mMsnHqmBmb40i8SHN+Gr
	d/393EYlvqmewakMnijwnq3w0vPJ/8v1YZEPMkBnAJg+WBdEO4QshPoc+jP6wB9h2/Jvq12T+hb
	iFJpsL3wFnW21rtzku5SDFN64LcAL9cvE2HuBitrhv7Ckt8jR33OXbRY71gPLQ9s8Z4qMdeDS8j
	aOUNRs7TEWIy6j+6BDA5c4rg7QKCvGCyhtEs8PSNmeO31O39kzP82zDE4RkftyqNAZqwUS5fKFN
	qnvsAuov/Zw3flPHyrBlszyj5UaB2ShJjLRKayUgm4AGw28yJfAbeyqis5PE/kpCCTcJ0ThYnGi
	MuAzYzT24SOzL6fPeBx4fXCZ97sJ78uUZLdxL50V+EjLCynyitho/VQPYMuPLnmqcN32YWZVf8+
	N3ruEkWtxpgn5qUD+uS4mIybTmPSWVRe6jS423y8VN6Usl1fDqgsHH5ljw86q4F21GonYqu8/q0
	fzPL/SOhpyUy+VtskW00gDMA7JTTj+gmuQ==
X-Received: by 2002:a05:600c:8909:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb55a83e95mr127075265e9.24.1794758380829;
        Sun, 15 Nov 2026 07:59:40 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:474b:1700:f61b:bfec:b5f1:a453])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdfebsm204511085e9.7.2026.11.15.07.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:59:40 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: andrii@kernel.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] uprobes: avoid postponing return-probe SRCU lease expiration
Date: Sun, 15 Nov 2026 17:59:21 +0200
Message-ID: <20261115155921.260878-1-thnkslprpt@gmail.com>
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

prepare_uretprobe() reprograms the per-task return-instance timer on every
successfully installed return probe. If a traced outer function remains
active while nested traced calls arrive more frequently than the timeout,
the shared timer keeps moving forward and the outer instance can hold its
SRCU read-side lease indefinitely. This delays unrelated synchronous uprobe
unregister operations that must wait for the same SRCU grace period.

Use timer_reduce() to preserve the earliest pending expiry. Pair a full
memory barrier after publishing a return instance with one before the timer
callback traverses the list. A publisher that observes the earlier timer
as pending must then be visible to that callback - otherwise the producer
rearms the expired timer.

In an x86-64 QEMU reproducer with nested traced calls every 10 ms, an
unrelated tracefs event disable took 7,740 ms on the baseline and 70 ms
with the change. A corrected monotonic-clock regression run measured
2,210 ms versus 79 ms, with 15 additional long-lived timer-boundary
cases and process exit/exec checks passing. Narrow LKMM store-buffering
litmus tests observed the lost-rearm outcome without both barriers and
forbade it when both were present.

Fixes: dd1a7567784e ("uprobes: SRCU-protect uretprobe lifetime (with timeout)")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/events/uprobes.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index caf444762a27..82065863a6c1 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -2052,6 +2052,9 @@ static void ri_timer(struct timer_list *timer)
 	 */
 	raw_write_seqcount_begin(&utask->ri_seqcount);
 
+	/* Pair with prepare_uretprobe() to avoid a missed rearm. */
+	smp_mb();
+
 	for_each_ret_instance_rcu(ri, utask->return_instances)
 		hprobe_expire(&ri->hprobe, false);
 
@@ -2304,7 +2307,9 @@ static void prepare_uretprobe(struct uprobe *uprobe, struct pt_regs *regs,
 	ri->next = utask->return_instances;
 	rcu_assign_pointer(utask->return_instances, ri);
 
-	mod_timer(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
+	/* Pair with ri_timer() after publishing the instance. */
+	smp_mb();
+	timer_reduce(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
 
 	return;
 free:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

