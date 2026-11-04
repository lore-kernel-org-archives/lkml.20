Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831193;
	b=siOEWjm/Fzc5JzGjbkIRPQDJoQ8TXlQeUuUP72cteaS6ugTdDEB/aZVOnANKRJqdJODR
	 DcgvaHtC/wfe+5Wqzxt3xoUZgRRhLwA3c0hpPAEyjz8Cre6vyugvQ82rU6vi4j3UFC7U6
	 1p4OTcTImV2nTuCW5lnSox5bWmG43nYhdoreGXatZYqhUzC5EQJ3mLiwcXKR71pmEHW8S
	 rcQDUxRXyukPmt1vC7T9A+ketzIkiAyW2uRr7+wU0R8eCcggfU3st6ltXIuE7SwDPIa7H
	 KrEmz0cXN2pC4uLbvhljrLYCfBoAXDlJGOtIvBTHLcB5BGNDVgGD10LhCnYuzpRsrPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9OWHZGyN+/phkIGg4cLIcv2N+SmxQEX4nd4X23tehho=;
	b=D20urtYaAEMA5wpLHtwdRIi9v0tiZpB0aVxMme74shsOjugu9jePiCFN2pgGf5nMYM6e
	 +/I5n4I8IubCNcoRrJUP42Y3J1480QDYIq8qm3PS2+/+KWEJjLyTQJWegt8m8qE9R2dOf
	 kLD5abcHHkqGyKwYUPXdpntCcMfODukqdopHtekC0ybp9ZuA9WhVDjAOBbiSnMI/207EB
	 z5IuEYztRyJCKy9phuCw3/8hpdx4mOWgHLVvYZcXdJXjtzCnKvFL/oeY7HtFR/JAQs3eG
	 2w2af1AcdLKoyNzVtAnP532ubNiKY7cPq8rtb0nWClBwrLtzIxYc2UhDXXzHAYJkbRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVMOSdef;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB6606AB10
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97DB6606AB10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVMOSdef
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-999b2b06bd7so367097241.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793831191; x=1794435991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9OWHZGyN+/phkIGg4cLIcv2N+SmxQEX4nd4X23tehho=;
        b=qVMOSdefGWOPaPhYgIsTT0/yu/T1lgjF8OEFRqSM2f2ZDa1Va/tu3lWDeXvMSDjUCe
         JUleXfuq8jlUzkzkdU5pKHhwpEcEAKVzemhf5cq9Sz9qvnGHqpEG5eCkf+rlgSJCfFIM
         HAcixp4IuzoD2l83xDIZLlKDmaLRZst55kLFR5HXOGq9Avx+ynl0m2xtW/GNoBzq4frL
         oFAEaYVbR9Sho2NO7OAbA6rwDygZZ5fOKijj3LebjdXnxSWbIt/RhYSeMxHMIFb1R/Qw
         87dAtqTytU3Fcz0IGkf29OLrg2bZfsmzyoOPjDeRFCD/No+ZVfkpY3qunq98TEWRnG9I
         2A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831191; x=1794435991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OWHZGyN+/phkIGg4cLIcv2N+SmxQEX4nd4X23tehho=;
        b=0Bo2LF+NXJ07YWvj2S2bus+5kQjhSp0whBywfdDT6Eu+a08DdYmYIJeh8kyYPIT4i/
         iG1+hbU+DgH5C6/KS2qjhMisv3yJytVKeRpriVQJk2dICugm93h9qHvUvD/6fGbw4q5I
         AJd/LA4D46VTgKWueJ+WwOuHjHvsPbnFGWf97chtTT+WyH6a6ItdV7kBMd1jqEggpsxU
         H/Ough1R3KgQfvV/cW8dBESE43KGlI3DRJGk19KR3uzRlKvuc5WxVanXzvP0mYi0bX+l
         w5FAGnsK0r1/ytzizVmhssdqqD++L0x13F9u3KzR7/kL6HuIgfIL4r6MT7W7VJVSiMZH
         YUWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfiKrvkXEcYFQDGvcYtA9CrzLEzZwMY1QlNuepOIuzBEIB/w9LUioOGqk9EGmr/o6WZD6/7So109f64GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gPjz6Y1gITFHwlxxqMpiM/9hMRBW2fjqnKqLwebCNMVrZkU0a
	E4poK6TkcOaxBEBQZbw31TfZC3+ShVIooCYAbShBhyBm3QD4ov/JqrZz
X-Gm-Gg: AYBFou3JtDObKWW7Ruq9D2hKAdQfECaw9rTwxmb7jM+eyYPxQ2wPywlv2MMYDRX1Az/
	P7l/ey97ZASWCxz3MwQVMMpkXi4yi0Iu2+BvblqK0wOQw9CDxSugpx5g3+Y015nSFOqOW1Q8uis
	7My9+NIigC0V4NToSkd7GDqmTunlk2k8hAqt9Ef4TdQDPG7SvWx7lh7vszUvBU7XRDvbEEbewq+
	hRZw310C/XW6aT9ipsMyYy9nWM0a1PkO7wHkyRnJwiVYoNDpMmk+0WYM+HZ/i1IF6q7Pg0Zomgs
	vm0PCl/NobjypzAcJzpY1NjzNDp8rfp0xlFIM/oCwlmJooxDLR4sCRP0ZgO/auv+0H2UU+O0T+6
	LMMpI7qWH/kIOf2YfXhrCHkyVFgWLD+k9qUlhSxyfeQzbqR3b5zr70sjd2vMPC/mkgVOTzdwr/W
	tEu5drFpFMNKrOP7ZwBeGL7eUC6ycrE+Sne/Ej/W1KQeGyI4d/AmBLQd8A/6SSNDLswf8MgloIe
	qf+VnTWNt5aOGAjksv7/SqcRmaezmMNHQd2/NsjbLAR+PV+AWMm2mnnBD1T1Tx7qwyvQKa/zoPg
	95pIMXO31vNCPCIGIOcTUv2+AXsWw53RH233H+U/cQ8v7sRjELK73qiYIpnD3Q==
X-Received: by 2002:a05:6102:2d0e:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d072247ab2mr7611158137.1.1793831191511;
        Wed, 04 Nov 2026 14:26:31 -0800 (PST)
Received: from bridge.vpn.bridge.ufsc.br ([2804:14d:ba6b:8339:9401:67ca:4be7:55d0])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b6568sm2863977e0c.1.2026.11.04.14.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:26:30 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com
Subject: [PATCH] ring-buffer: Do not WARN when trace_rb_cpu_prepare() fails to allocate
Date: Wed,  4 Nov 2026 19:25:58 -0300
Message-ID: <20261104222558.863948-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Creating a tracing instance allocates the buffers of the other CPUs
through trace_rb_cpu_prepare(), which WARNs if the allocation fails.
But __rb_allocate_pages() bails out on purpose when si_mem_available()
is too low or the task gets killed, so a mkdir in instances/ with a
large trace_buf_size is enough to trigger it:

  WARNING: kernel/trace/ring_buffer.c:8094 at trace_rb_cpu_prepare+0xf1/0x100

The same failure for the current CPU, or in ring_buffer_resize(), just
returns -ENOMEM. Use pr_warn() here instead.

Fixes: b32614c03413 ("tracing/rb: Convert to hotplug state machine")
Reported-by: syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a707c4f.13bfb6d0.1ecdd5.027e.GAE@google.com/
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Tested in QEMU on 05441d697f7f (4 CPUs, 1G, trace_buf_size=350M): mkdir
    in instances/ WARNs every time before and only prints the message after.
    Same with a mkdir killed during the allocation.

 kernel/trace/ring_buffer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..c018559ad61a 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -8091,8 +8091,7 @@ int trace_rb_cpu_prepare(unsigned int cpu, struct hlist_node *node)
 	buffer->buffers[cpu] =
 		rb_allocate_cpu_buffer(buffer, nr_pages, cpu);
 	if (!buffer->buffers[cpu]) {
-		WARN(1, "failed to allocate ring buffer on CPU %u\n",
-		     cpu);
+		pr_warn("failed to allocate ring buffer on CPU %u\n", cpu);
 		return -ENOMEM;
 	}
 
-- 
2.43.0

