Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F10361947
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856476; cv=none; b=VV/7lseGQVw1mmgdQhfibdz+uahC01mpsjZwqPX7oZWFjtPl08Ba/iVHTwxL2B9BNa5+c6XEFgJa6f0sBRsP9fNXca4JDiaIM08UPkfL6w1EMwjfjt9fE4SQuflxdkLb6MkqAy5nObqS5o1XsmjaCO0mPyQJl44+HamRyzPtV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856476; c=relaxed/simple;
	bh=jsgWk1VusxjuNYW8zxDP4dFWFs2R4p8/8pRdi3Q+A2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IoQF7iOREySVtJ/HDVBF6xHNJEqE/7AGCUVANgz43F62jDflYErKH824Y9KuqCqPA2EUwPUnSEZP5b0SveBJuZDIBzRV9tVRhOUmAJJ0wRPh4NYFEuM/RHarIldbuv9lkwpyW36Xr7bvXbXMZeQgantmPgGafu4YoP7hIASwusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aJZy2zA6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EVhRsF9t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aJZy2zA6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EVhRsF9t"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787856471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UJqk4J7gtiIPTsna8qIz1pQeIJREclVPjsaKykcmDxE=;
	b=aJZy2zA6u/gxi2axTTOznlgoyd6OVZ4iIYGDFY9VSalZzHd7DvRzHS9lTH6ilfJ31HrSz4
	ENzPG+zOIYVl0536qe1vQcztgwNGXfJeQ3qBxXyFqbxlfLroXR/Ihe+fu8uaRfGLI9dfn7
	/fNQM1P7nKq9KDrwL5zuy1NocVqE5h8GorPeCNDNLWzc5E0kuexzCzvl5oKUKe53/eAR9r
	YPWk3AHrJmwqvpnDwG/yLvXWzXCCCqiRUJ63e6vjUF1OH9eRPo9xXQkhkT7zxL7yVwuer+
	/x2X6unyT+q+OaLdNojS8qcGqcrunNqRcrnNFd/PYSWALm1C2TUxx8WxK2G75w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787856471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UJqk4J7gtiIPTsna8qIz1pQeIJREclVPjsaKykcmDxE=;
	b=EVhRsF9tmpL5ryEpbwfmcljlFS6RSu/3A9QWg9XBGe8y2nA8ypfwnBep2ciseP4RcP1HM3
	+S+URdLznzLhz1Cw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH printk] printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
Date: Thu, 27 Aug 2026 20:53:38 +0206
Message-ID: <20260827184750.203521-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some platforms it is a problem to queue irq_work when entering
cpuidle states. Since nbcon uses irq_work for waking the printing
kthreads, any printk() calls when entering cpuidle states can lead
to the affected hardware hanging. Tegra20 and Tegra30 are examples
of such platforms. Avoiding raising the irq_work IRQ has shown to
circumvent the problem.

Change the nbcon_irq_work to be IRQ_WORK_LAZY, thus not raising
an IRQ upon irq_work queuing. The irq_work is then handled on the
next interrupt (worst case, kernel tick). This additional delay is
acceptable because nbcon_irq_work is only responsible for
non-emergency deferred printing, which is delayed anyway. This also
has the benefit of not needing to raise an IRQ for each printk()
call.

Link: https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index a5921a84a80ed..ad79e30afd647 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1782,7 +1782,7 @@ bool nbcon_alloc(struct console *con)
 	}
 
 	rcuwait_init(&con->rcuwait);
-	init_irq_work(&con->irq_work, nbcon_irq_work);
+	con->irq_work = IRQ_WORK_INIT_LAZY(nbcon_irq_work);
 	atomic_long_set(&ACCESS_PRIVATE(con, nbcon_prev_seq), -1UL);
 	nbcon_state_set(con, &state);
 

base-commit: ffe0486b139e45cd9c9ca2584f04a1910fe4f8a6
-- 
2.47.3

