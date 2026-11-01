Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793509009;
	b=Xwhj78eDM2Ezg+ERIJS673SpH8ltud9K7fSt0ZSC2XnLk3bdMLipNWawsmV9ru1upGnu
	 UYIDTGVe+yo0o/3JSV/aHqS83+gkZkytKgiYG1bLxvNtYvvNhiAwDG+zWr3jiQXr+2Hhu
	 5IdkLkqi8NtOP4KJX35PKvMmc5FWeruzAqcUBt7v8donFlUczi0O39pofagdHXXqlLgu9
	 lqapcP2RUG1uzxX4qZxLnIPZJj9kDTS0DdVEm2we59xEFhtM2qIDChZgrl4khA73Egy6M
	 zqR9KRkZbCMjm13+ddYHqkClfyd+cFR9EiwoNxttNg28V0q5bgbe2E5CTBOEkEZuDnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793509009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LeJF4Pxpn6+eTYyORgX2n47bZp/eNndLgg0fRZ3I7Wk=;
	b=WgKAtoCRG+wckLvXFcdL75gvl4jav0EGRRkGIASqNDe1KTdwNzQT+LhviWUy7mlttuNw
	 Kintg92RUKXwP0Q4MJDCiJdfoUuwcEy4AmTANys7S1QEAISvnSTA2qXaZ2Q1UQ2RCfzSg
	 3/9qJN4MK4JMveRvOqWjX/COz4Z48uHo8g9PU2CXqSVOdKgz8qPE/pGiyNbum4UOKE87U
	 41YQ1AgyPeSnVYxcZITJW5ZmxK7ZnKthW5xph0uQ3QTjU/RwsLhAIlNnER+MJnzyioiNW
	 EJNdf6QnQePbjm5V9lQ3XaRdJyviUOH3sBpSXVhp/mbt0l/3E/ujUw/NlNWSSX0MeYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewd66BYO;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFE606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 04:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AFE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewd66BYO
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so14944485e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793509007; x=1794113807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LeJF4Pxpn6+eTYyORgX2n47bZp/eNndLgg0fRZ3I7Wk=;
        b=ewd66BYOVFhhLJiU21aR5INRXtJR0B7ja3aShUQhPKtHiGJ9uSkzigOGYsbo6lWooj
         QEAAiWlOYnMlOCsr100K35p2EgUM9PWPUtGTa+AeWFotLPOJAwl7pCplfwbrkn06ZNdb
         Ssn5EZ9nru9fcxmikCEEJ+d1gVF4VUyAnrLS/t1wm7H2c5Bq9EwWKtyXuIUNu0lhNs0v
         FgbrRCt+0KB49MYNP3adNy/Nhio3qkk3iE9j1U9McnE2EwLHV/AbkIBqyu6LdAif+Mip
         j8bZvH547TYhfm+pJPLYp9N2PayF8JvSGXmNqHYk+dCMTXZEZMzGC3I/9k7sla3KLCz7
         3XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793509007; x=1794113807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeJF4Pxpn6+eTYyORgX2n47bZp/eNndLgg0fRZ3I7Wk=;
        b=hZF+M857p2AgMsO6Wz2/Z19SkBXfIezKSjZZ2nukL1nnz85dil6t2xKawk2z0wnEG6
         Rscx0ylEjWMZmjXyQawHXUftmGO0VVUKkGwy/I21PKlvhEK5hAqp9AVXJ+Y8PB6BcyNq
         2IJditlpbZdBar3kExHUrFA3XLwAVIBhGkWZr/xVR+ssSttHu2ZZDd4I4d1laQ+VJXoh
         6DN911EmPDqY5YDoxgDGh/CT0sYY1VZFUDobNyGfZiPd6oHvpSpXOgIcNfNgPyJFt2H6
         19zTn3eyITv3zDjh8rs3vzDJ55+2FQi66ZRlZmIVTfsHK/xCR+COuD4xhpiJoMkwH/Iq
         EZcw==
X-Forwarded-Encrypted: i=1; AKwUvBzevO2FqfIwjT7A3y4Q+NfD0yp8xFs03svG8HkCza0jOdRir7jlmHVKepUwxNueDf2M5tpVSI0LIZ1d42Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLOve91XO2lZs98qg5vuv+qsgafp+7WIEwu15oPY9OJWesmJJz
	gQ9wr1T+QYFszx7rVWoJzpMx/IXYxkO9u3YXodyK06fko9v02/QXWmuD
X-Gm-Gg: AYBFou164kLcyj+zrlzlqZr5Bat2u2P54VCmB4fN4Zc8SGS6gr7xOybEI4qUZytdDWT
	U5Cmy2hO4f0zW1cAEh5yhIg/Iu+Kgc9P/1jB03XdMnMQ+riBY3dT42eZfbyVbbZ2Me8nHHgrWEm
	JF0hzByPDCmu1kJbOboXlKbv295IY36m9ZdI42tt0UbzwaFr9gW/8SBSLvzVRyolvqJXKrN7fEo
	dWxDn0hb0+iwlxHdtAzcfXeKYbQVDLin1j1i6NtJCJJxdQ6Y6wc44pdIVKkLBRMgME5JwP5otZC
	SGMJdgD3w0opyAM5dBzuPVtCZjCgVs2QKJFwaVjsisGELOj3D0m+lg4OFIGYiABOnoea1J4xgej
	z9zQ7+gbolB2orOYjGd0OUtZX1om2IBLMvbV/Bhfnc0Ysbs5VOV3t7cujSITkP4X1cqieBfq0uq
	wdDUIvHnsatvM/oYsPFKuVOT6wpVYOM0VN5mAQ2cDmOkeukUjwpGTeZaGu/NOoHoBsZoL7hZzA+
	dPW9xOh0odmhfwB90vNJXLy9UN4BC93KoKeQCyuTsqJFNLNKweFqy/zCKALPw8REJeYhpYezL6F
	VSDD9S3ECB9Pjf7PSBHUo41fu6Yle6Cd
X-Received: by 2002:a05:600c:8483:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4ac1889d4b5mr144561925e9.27.1793509007271;
        Sat, 31 Oct 2026 21:56:47 -0700 (PDT)
Received: from thinkpad.lan ([2a06:c701:4773:6f00:56ee:931:5944:26f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm157791665e9.0.2026.10.31.21.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 21:56:45 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq: Resend pending interrupts after handle_simple_irq()
Date: Sun,  1 Nov 2026 06:56:28 +0200
Message-ID: <20261101045632.218099-1-thnkslprpt@gmail.com>
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

Commit 2c9e7f857400 ("genirq: Teach handle_simple_irq() to resend an
in-progress interrupt") records a concurrent interrupt as IRQS_PENDING
when another CPU is still handling the IRQ. However, handle_simple_irq()
does not consume the pending state after the first handler completes,
so an interrupt arriving during an affinity change can be lost.

Check IRQS_PENDING after handle_irq_event() and request a resend, as
handle_fasteoi_irq() already does.

Fixes: 2c9e7f857400 ("genirq: Teach handle_simple_irq() to resend an in-progress interrupt")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Related 2025 patch/review: https://lore.kernel.org/r/20250708173404.1278635-2-maz@kernel.org
 kernel/irq/chip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index de754db414d1..4a131dd72196 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -626,6 +626,8 @@ void handle_simple_irq(struct irq_desc *desc)
 
 	kstat_incr_irqs_this_cpu(desc);
 	handle_irq_event(desc);
+	if (unlikely(desc->istate & IRQS_PENDING))
+		check_irq_resend(desc, false);
 }
 EXPORT_SYMBOL_GPL(handle_simple_irq);
 

base-commit: e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0
-- 
2.53.0

