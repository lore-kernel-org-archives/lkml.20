Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390153358E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914416; cv=none; b=iVwC0FBoHGkFCzto3sVjhupi4aBAGmWmpPJHrg6IMTq8mlBQYyD4bX0HWssTzoEUIM505vdQG8Im3CXfnJHI85j7X36GojX9acN+VTy3Lp6r/WU7sm1ZEr8GUSxwtsGGpPwcm1F8+M8b6KqWXNM9ci0JnTx7TsmU7D88+7xxTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914416; c=relaxed/simple;
	bh=v7pK23cEJwXDA7NRq3cUL8owWe2UjNebeZQAaqr21aw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iFSvOuyn30uKU2apPgIVAgmBS/suXDimOFCwUV+I7W4bPLyWhGWwxrlQ/cYmwe2/Ub9sPTMcOU+FCESryBNwYAf96j7JwcKWNEG4F51rHO7SDDb1gNPJlqW4MLDbNEEXvuu/SjQEJb5It+de9FoDbiKdWJWPaKZoG7nueDBln7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fD12CEMI; arc=none smtp.client-ip=95.215.58.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fD12CEMI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v7pK23cEJwXDA7NRq3cUL8owWe2UjNebeZQAaqr21aw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914412; v=1; x=1792519212;
 b=fD12CEMIX3c0OXeYzrdXg9bSpEFrfG4JwU9hRZkYxWD/lEqIDyCpmE7uBMlEA21idE0QMo6r
 vvGoDAPfOhj6LpifJhC2jVDDaSViraJLkJdHRVrrXe9KO+EDaGI+3mHGhxqQV3fJJ0hruT2VQg6
 eXttPFqHlpNO22jVR6hx9C4A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 39e7f601a12e283d;
	Tue, 13 Oct 2026 18:00:04 +0000
X-Mizu-Trace-ID: 39e7f601a12e283d
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-rt-devel@list.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 08/15] net: do not provide hard irq safety for sd->defer_lock
Date: Wed, 14 Oct 2026 01:58:42 +0800
Message-Id: <df9b11ddbd8a6dd4ee4a3bca00d1ad51c64e25b2.1791912669.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791912669.git.wen.yang@linux.dev>
References: <cover.1791912669.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Dumazet <edumazet@google.com>

commit 931e93bdf8ca71cef1f8759c43bc2c5385392b8b upstream.

kfree_skb() can be called from hard irq handlers,
but skb_attempt_defer_free() is meant to be used
from process or BH contexts, and skb_defer_free_flush()
is meant to be called from BH contexts.

Not having to mask hard irq can save some cycles.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c    | 4 ++--
 net/core/skbuff.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index db1fe85ebc90..c8789241f4a7 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6779,11 +6779,11 @@ static void skb_defer_free_flush(struct softnet_data *sd)
 	if (!READ_ONCE(sd->defer_list))
 		return;
 
-	spin_lock_irq(&sd->defer_lock);
+	spin_lock(&sd->defer_lock);
 	skb = sd->defer_list;
 	sd->defer_list = NULL;
 	sd->defer_count = 0;
-	spin_unlock_irq(&sd->defer_lock);
+	spin_unlock(&sd->defer_lock);
 
 	while (skb != NULL) {
 		next = skb->next;
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 919ad5a2c5da..6111c1bba704 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6716,7 +6716,6 @@ void skb_attempt_defer_free(struct sk_buff *skb)
 {
 	int cpu = skb->alloc_cpu;
 	struct softnet_data *sd;
-	unsigned long flags;
 	unsigned int defer_max;
 	bool kick;
 
@@ -6735,7 +6734,7 @@ nodefer:	__kfree_skb(skb);
 	if (READ_ONCE(sd->defer_count) >= defer_max)
 		goto nodefer;
 
-	spin_lock_irqsave(&sd->defer_lock, flags);
+	spin_lock_bh(&sd->defer_lock);
 	/* Send an IPI every time queue reaches half capacity. */
 	kick = sd->defer_count == (defer_max >> 1);
 	/* Paired with the READ_ONCE() few lines above */
@@ -6744,7 +6743,7 @@ nodefer:	__kfree_skb(skb);
 	skb->next = sd->defer_list;
 	/* Paired with READ_ONCE() in skb_defer_free_flush() */
 	WRITE_ONCE(sd->defer_list, skb);
-	spin_unlock_irqrestore(&sd->defer_lock, flags);
+	spin_unlock_bh(&sd->defer_lock);
 
 	/* Make sure to trigger NET_RX_SOFTIRQ on the remote CPU
 	 * if we are unlucky enough (this seems very unlikely).
-- 
2.25.1

