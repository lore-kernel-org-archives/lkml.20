Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835603;
	b=0pph4vrA5c1iR4B8NnNzsLHpNUp0e3nEprdB7R5mO0FXmyqDZ8r2rtndTuM5to6p5cC/
	 HbDMUESqBUoErthwvHLUAOl8Gr9xqNbsrQSVMvebb30pgVroyRVF/o8pYhrznRN7MUSpS
	 8R91dGnmm2kUSo+f5tM3Ttx9Mr7PTAHOlvfw4ApeBp5YTmVzul2ADalYgoNanVAroL1pM
	 idBa7DuwhRbmkg42v7wCugoREFGtTM3M+5Vs07ESqV9zCW8OXRPUXtCFvrW/FR4WNZl1B
	 0uMEEF+CTRtWWjsVZOouerx0tg1NXKycmuyTukgtZxdpgoJI8bIYddcvSS2+UozlLLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PJZz0YlOJcfbF9jg/HunuJ7liHek0Gp3vyMLiPrKO+c=;
	b=s33NcQNFwea8RTIq0SCs7RkvykKT6VRAYpkv2YrSt6WhD9GlBUc8uSJuojpOF8NIPxXx
	 7FW+DjIWzH9gdgFx13w0r9VRLsfuIEouIm/W7Gkbx2QdRwJyuYkIJ7H7KHEbV41eGUy8r
	 XBV02gcLhgaHcU4eqWJUnZUIwb9eyqoCINXxTIGBl6ym2JfO0fmfUyD+cwGzQxn/s1DdB
	 pN+Z9XxXsNO4qSed4B2AV8F/2c8gBroUDmW3hbMmDkvQ+dp346q8V0+yxRXwFyMccpbmL
	 tG0zxAwIi75kPFi55rzJ32Ri7p9Ja+ttMOnc3Z7PQk1dTF/0WNpVLsnITHwfoUa+mGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnqbYWCZ;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB6606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBB6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnqbYWCZ
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ee1b65fdbcso10165675ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835602; x=1795440402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJZz0YlOJcfbF9jg/HunuJ7liHek0Gp3vyMLiPrKO+c=;
        b=rnqbYWCZn54/ObiL8lkH5/53odv2d5F0aQSuIExpOuZEIC1L4JYUCCsedtfsLFZF8z
         uk3rISBqh0Rxt3lJgcWJmPoPFKX+BCHCNQDoxc7AvSAB+6IC/l+uJAqi9eFTb730sBGN
         dsvdek4MegvIuHYHcTi/aNUaZLIctwmYoFeWVG5WKm2nevYe3gJ9pmep0d1IaEuKiPjX
         hsD6C9LoFbFVdXvKnM8ZIeayWS9KHsP4lXY4SsfCn1+iDutHJZ1YCHp/0Vx6F7vb/B4Y
         JlGqTNCMKM0RZ2AYk/12X9bf9XQ1lt4mVzLkz48ACcDmyzKHgUSJJLyjESR24xWlsuMC
         uCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835602; x=1795440402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJZz0YlOJcfbF9jg/HunuJ7liHek0Gp3vyMLiPrKO+c=;
        b=2GKk+nW/2cpyKQFKcaGtjaJ4VLt+XeiJWrsPr4mCpHFGo9magMYeV0hlKR+OSMmwbe
         AqicZHaxPEUtkOEiMmMduaONuK7Ii9W3MS9kzdzv49NTq6svEEkygAPztB30Ayibnb83
         +mzvZ9mkQOGFYixvFbUAHak/oYvtLDYLUYIKxTUOALiZ7vn3uwef5szADFX1siqMd+uE
         20EVywYcGFZgWKolUnzdn8jQqtQGlR2zWYh7yfx9TzQBLrQh7MthgXhMZpG3S7yu+vc9
         SuBHzJwXrEgQAmRkqeZ9T1o5Dzo9z5qfwiqVKcDPP9EMbTpWkMHPssJqj0gEQbG08XV2
         h4eQ==
X-Forwarded-Encrypted: i=1; AL+hErGBUeWNlGMLewYKu6bYBlnT6Y8xelmLt1CNKRQ+f9wbvoD9HnvqJicgNVXLaMxcMM0gHM7nS8tkjIExm30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g9A6S7Gg7598Q290+NTw/jvaumq8hu2ue6yTZPaRb1GOkLAno
	Anqqs75+X7h0X3PwbhBmo9lv2T0+OwpflAdigNEFso7kdsD9se8PBmK/
X-Gm-Gg: AZFdTZf/1xXzcbSigkDuhQSB6W1MJzJ4S6MbUAFgr+ezq+foQdry2+FJ/5pbiIH1OBv
	Bgk+n26pAIYovZGoLnMu53qfwOxPcODao5l9MgW/JmBJZr0FDwtpNUwLRN+ncyA1SJ6UAtRw/lo
	or6qcLlXadtl7KFW3EMFLEz9V54gMkUMbBe7mYaHvZCils6QV3w6wohqFRAE8sTpCkIprjtlB7o
	tBpZ0M2yrA4CLDNd2L1rHC+i1bbxAHNXDzW1bG+f0vjtYT6HGdg3PMyrRhZAMWiSN92+E50OeAx
	1nCUB7xfUBVoYBDF1hQti+X+MEOW+/XSMZPjmcB7Dij4b5LjeSQXES7kT59qyc1MW86/pPbBWrX
	HD8nUO/Fq0oC7Lag2d6ef01LT3WxKAPd+XW3DFMWfqgd7cUOcr2vsGumjnu+PizOQPW/d5AzBtu
	xsh/WwBCGmrwXSO3E1PjeSB3/80YPVnuydCaue/0IcffI/g8e89+dNE6U2gUhyu5XMdB23K5dTM
	BZDIg2QxKtXPgVr4OGl/R9hKUc5oOz115KNS+9sg7dtqm2fND4lufqdjs+p06mdBaiiWfurRFar
	LoHcMqZEpmy1goPnMQZyLtLrNkwPSSNgLd2A6qEep62F5JEiuxLoPCKBwteoV01mla+si/UzPR/
	YuGOZE6HZPJOpv2Za2rRlg4VeQaCE1KiBhgVJFQ3utNRgAlXFOjTybEkTwR66gBwKKyrQ6no3kI
	2sEYSX5V0Y2HvRickW1LWsUw0iHIkZR6oeIxTcIGnE1ZNyJ4M09HMga6FFw/zWTYmWVG3KQIUDe
	bIm3Ut+lYzU2c8iiuSSlp+M2xHZcPiuUMM8IF3OmujQnKZHWCn7YKyYa9vQ7aGw
X-Received: by 2002:a17:902:e951:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ee0da98ceemr93918415ad.20.1794835602251;
        Mon, 16 Nov 2026 05:26:42 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad534sm38780335ad.9.2026.11.16.05.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:26:41 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Andre Almeida <andrealmeid@igalia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] futex/pi: Reject owners that have no mm
Date: Mon, 16 Nov 2026 23:56:22 +1030
Message-Id: <20261116132622.34793-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

attach_to_pi_owner() attaches PI state to the task named in the futex word
and rejects kernel threads, which cannot own a user space futex.

A usermode helper thread runs with PF_KTHREAD cleared and acquires an mm at
exec(). While it is in that state, any task that can see its TID can name
it as the owner of a shared PI futex. Commit 59b3732f95dd ("futex/pi:
Reject cross-mm private futex owners") compares the owner mm with the
waiter mm, which applies to private keys only.

The helper then execs or exits, exit_pi_state_list() takes a reference on
the private hash of current->mm, and futex_private_hash() dereferences a
NULL mm. The oops path calls do_exit(), which runs the futex cleanup again
and blocks on the futex exit_mutex, so the thread stays there and with
preemptible RCU grace periods stop completing. Module auto-loading starts
usermode helpers on behalf of ordinary users, so an unprivileged task
reaches this.

Reject an owner that has no mm with -EPERM, as for a kernel thread, after
the futex state check so that an exited task still goes through
handle_exit_race().

Fixes: 80367ad01d93 ("futex: Add basic infrastructure for local task local hash")
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
Cc: stable@vger.kernel.org
---
Tested on mainline b3dfbde62cf1 (kernel/futex identical to v7.4-rc3),
x86-64 with KASAN and lockdep, 2 vCPUs under KVM, as an ordinary user.

Without the patch a usermode helper accepted PI ownership 130 times, with
no EPERM refusal, and the kernel oopsed 22 s in:

  Oops: stack segment: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:futex_private_hash+0x4c/0x2b0
  Call Trace:
   futex_exit_exec_release
   mm_exit_exec_release
   begin_new_exec
   call_usermodehelper_exec_async

after which the kworker never exited and RCU stall warnings repeated. With
the patch: 201472 refusals, 5822 owners that do have an mm still accepted,
no oops and no stall.

Not tested on other architectures.

 kernel/futex/pi.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 98f1b962e59a..77e88dd5dc22 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -515,6 +515,18 @@ static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 		return ret;
 	}
 
+	/*
+	 * A usermode helper thread runs with PF_KTHREAD cleared and acquires
+	 * an mm at exec(), so the kernel thread test above lets it through.
+	 * Its exec() or exit() cleanup runs exit_pi_state_list(), which uses
+	 * current->mm.
+	 */
+	if (unlikely(!p->mm)) {
+		raw_spin_unlock_irq(&p->pi_lock);
+		put_task_struct(p);
+		return -EPERM;
+	}
+
 	if (IS_ENABLED(CONFIG_MMU) && futex_key_is_private(key)) {
 		/*
 		 * A private futex key holds a pointer to the waiter's mm
