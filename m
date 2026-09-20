Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67A3AEF51;
	Sun, 20 Sep 2026 02:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789870884; cv=none; b=F/7J6oTPVXMmu7XymOzmuVOoKGmjGE8G4KRNHKuWb2pTYo1sDOcFxIfXfd7plePoi82AC458mde7T+i4O5RcXxd8zRK2ZIUVJ7BStkHw6uM/iGXeo8UWNTiYLELrEwDp2D36O0MOmKRBy6f/05ahFQVKCeRKs5/INj+wcVCaQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789870884; c=relaxed/simple;
	bh=sZn7R/ntnSs+bFUxanSLjHcFnak3NsEkYdQsUWJUNGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Muf9W38G1WpdSB+onTWpxlhcTPQLMmrJzA5ALoH/pZ1RbGgrbHMZmmTz/4wHNeN98VKPeOgm0SEKG0rdp62qZaMGYT7fLCToqNEwHLk4kisn//H1MoEegBnpdiQDNfb5PmQQsIYB1o5NF7ACXkeQdWxHF1Cv7EPcsE578/IdEvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HnxTkNJw; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HnxTkNJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jH
	ET+QsCviOQs3boKj7aHTB+nHbAf4OhCwmPSHo1d2M=; b=HnxTkNJwn/UF8Sx3Cl
	Wm9oiTmfmMqCPVL+fxyWhx7ciHP2sP8JJNl79ZUk700RUfe8m2gJDTlOekj7yKiF
	dvOofn4ao0Uq3Oxaiw+4IctQJ8yoVT6h0XjDvHR/aNfqwWQvWUGwo1aYOKlVDAsa
	J5cu3zXUoJOhuEqDhYVwbyhc0=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3U9PTQq9qg1hLBw--.56923S3;
	Sun, 20 Sep 2026 10:20:07 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH 2/2] docs: kernel-parameters: fix a truncated sentence for preempt=lazy
Date: Sun, 20 Sep 2026 10:20:03 +0800
Message-ID: <20260920022003.1202546-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920022003.1202546-1-quchaosheng000406@163.com>
References: <20260920022003.1202546-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3U9PTQq9qg1hLBw--.56923S3
X-Coremail-Antispam: 1Uf129KBjvJXoWruF47GFyfXFWUKFykWr1xZrb_yoW8Jr4Dpa
	98WryxKwnrJwn8Cr48Awn7Xryfuas3ua1rKFWktF1fJFn8KFnFvrW7tr43KFnY9rW09a1U
	ZFZYvF4Ykw1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_J5rDUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDABdMwWqvQtdvQgAA3n

The "lazy" entry ends with:

  One preemption is when the task returns to user space.

which is not a sentence.  It is a leftover from shortening "One such
preemption is when the task returns to user space."  Add the missing
word back.

Fixes: f66e4a996582 ("sched/core: Update kernel boot parameters for LAZY preempt.")
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..6c1bfba180a2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5453,8 +5453,8 @@ Kernel parameters
 			lazy - Scheduler controlled. Similar to full but instead
 			       of preempting the task immediately, the task gets
 			       one HZ tick time to yield itself before the
-			       preemption will be forced. One preemption is when the
-			       task returns to user space.
+			       preemption will be forced. One such preemption is
+			       when the task returns to user space.
 
 	print-fatal-signals=
 			[KNL] debug: print fatal signals
-- 
2.43.0

