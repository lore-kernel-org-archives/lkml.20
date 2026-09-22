Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC54143DA53;
	Tue, 22 Sep 2026 08:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065929; cv=none; b=n0Quxa3Leuz0QR2kxLFE4MrD1ZxMHauZ5msFoJ/tmvgPEygqs/Trm8CW6or7K9vlsOw7RNUGxPp7hOFxZQ7dzcKCTdRsKN2wZaNe5/Gaiz4BJW9diajRUHt8GVDChGQ7eHcQKnMs3nYxJIOLFevdzmPzbkgmCbiuZ1Ljs/KjDvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065929; c=relaxed/simple;
	bh=NNiseMGXmv5Gk1zHYlIFPkjTndCev1b22O0FN9yKi9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4Wcumcvh5Hy14hkvtqSfG5a7RFcj+6n4hQf4d+0GsYWpuVVDVWeuewoEHTiGCI76+iPS2J9TqfMPie++Z0sgqsJJVeLA7A3iwCBRKQzYEvywSbu2orrNp5ikrV/Q8mUhFJTbtYYGEUN1UMC4Xh56DNMLNjJh8TTm0gmt15AM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Aefwra0a; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Aefwra0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3t
	Wa3uUpjFLyRrh+EEGjAOTlCJ/JF7+BaXL85GeSrgk=; b=Aefwra0aWH8sTM7obE
	TqDsUgvB1P1xlN8r2b1EgNgjqbZ1La+tewXshBNltVeCG6Ndyx6Qolov8b+wJ8Jg
	8WONol7JdWxlj8G4xr3yfWUt3WoWsd0+gyORoz1egXJMinhUNBlBA/2qR9Rw7jTA
	67KZ7kJVxOZUYuzz86ot9Haqo=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3137OPLJqg7FaAA--.45299S3;
	Tue, 22 Sep 2026 16:31:12 +0800 (CST)
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
Subject: [PATCH v2 2/2] docs: kernel-parameters: fix a truncated sentence for preempt=lazy
Date: Tue, 22 Sep 2026 16:31:01 +0800
Message-ID: <20260922083101.99685-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922083101.99685-1-quchaosheng000406@163.com>
References: <20260922083101.99685-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3137OPLJqg7FaAA--.45299S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr45XF1DAr13Jr4kKFWDXFb_yoW8XrWDpa
	90gr1xKwnrJwn8Cw48Awn7XryfCas3ua1rKrykt3WfXFn8KF1vvr47tr45KF1q9rWxua18
	ZFsYva1Uuw1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMv38UUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC4xCKAGqyPNDuxgAA3l

The "lazy" entry ends with:

  One preemption is when the task returns to user space.

which is not a sentence.  It is a leftover from shortening "One such
preemption is when the task returns to user space."

Writing it as "preemption point" reads better than restoring the missing
word, so use that.

Fixes: f66e4a996582 ("sched/core: Update kernel boot parameters for LAZY preempt.")
Assisted-by: LLM
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---

Changes in v2:
- Use "preemption point", Sebastian's wording, instead of restoring the
  missing word.
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

