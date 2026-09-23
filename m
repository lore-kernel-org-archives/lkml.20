Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E13C09FF;
	Wed, 23 Sep 2026 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152822; cv=none; b=T/tq8/gQBFwM4HU5t6LH686fjPtOhuHKdQuxV9Fxs7j1J5pESWt8aM3Pa10A5ZM4k5jILuWpersu/FFlCYmr47C3HFe/AUtQCssFdN+NFQjcTOa6JEOHh41eYiHOn8wWCVrCAf8fgWXTP/VLLz/MKaTabw/w13vWuQwpZyqnQU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152822; c=relaxed/simple;
	bh=K9ZxqQFlB7D/gPvc1pCm6ZQP9qsdPdpMkutjCVipwwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmWI4YXjxIxiYz+tH/FKqvYTieWW+wgBsrMTzPgoLbGXAWZToPujgEQf/x6yuGYAUBGNzS4wWXmH0TXiJrgzuZ6iW8bmtetwaWdUYbM7X4VYmtY000UEkl3ro91Vn8sw+43rLArruEg6vMBkDmXu6dbPQJE+8RNjRU+ZmlQN12A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BqsI94w2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BqsI94w2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ns
	EL5L6/Ftdu8FuVtHU5h3ZCtxaKTdbR9+0Q9X++S9A=; b=BqsI94w2tujzHHEVk2
	HdCOwscUkqVKQ6TSXGDLLZ5InkI4uDdGb6BSXk84Z/Svm9xWS2y7G9LekZaNQFz2
	+iUJiF9XklrigfmCH+hSNAU8fGX2qZic+/xyBeBpbeCjx6IzqE5YEaAuZfcJWkkF
	BUIpHMPF8FoiMUcI9ishSqV4w=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDXX4EwkLNqftBNAQ--.59852S3;
	Wed, 23 Sep 2026 16:39:14 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH v4 2/2] docs: kernel-parameters: fix a truncated sentence for preempt=lazy
Date: Wed, 23 Sep 2026 16:39:03 +0800
Message-ID: <20260923083903.616271-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923083903.616271-1-quchaosheng000406@163.com>
References: <20260923083903.616271-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX4EwkLNqftBNAQ--.59852S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kry3KF17GrykZF4UCFyfZwb_yoW8AF1fp3
	9rXr1xt397Jwn8Cw1UZrn7Xryfuas3Ga1rKFyvqFyrXrs8Kw10qryxKr45KF1DurWxuF4U
	ZF90vF4Uuw1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pKsURAUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5BK3LWqzkDKRfQAA37

The preempt=lazy paragraph trails off: "One preemption is when the task
returns to user space." reads as if a preemption and a preemption point
were the same thing, and the sentence does not say what it is describing.

Say which point it means.

Fixes: f66e4a996582 ("sched/core: Update kernel boot parameters for LAZY preempt.")
Assisted-by: LLM
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
Changes in v4:
- Drop the Reported-by. There is no report behind it: the wording came out
  of Sebastian's review, so the Suggested-by that v2 had is the tag that
  belongs here, and the Fixes: line v3 dropped belongs here as well.
  No change to the diff.

Changes in v3:
- No change to the diff. The Reviewed-by is for this patch as posted in v2.
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..83261eb6b26b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5453,8 +5453,8 @@ Kernel parameters
 			lazy - Scheduler controlled. Similar to full but instead
 			       of preempting the task immediately, the task gets
 			       one HZ tick time to yield itself before the
-			       preemption will be forced. One preemption is when the
-			       task returns to user space.
+			       preemption will be forced. One such preemption
+			       point is when the task returns to user space.
 
 	print-fatal-signals=
 			[KNL] debug: print fatal signals
-- 
2.43.0

