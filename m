Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35745534441
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914419; cv=none; b=EjKlyXUdcFFMjOqlAnnj+xQJtMbcly1ziEFDyroIDbfybeDEFNd4PLh6hf2AnQo8YjP9JETsXQs4QQdBuHXvxSDPmGLVPqmEha/QKD37UruaJL5l0QgX2X77KPfIGQV7A58kIYvx4eKbVA+OuM4mIfs9GCvXjpRIF8nuJO/azL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914419; c=relaxed/simple;
	bh=OQsvWYYDKTSrCwcNRn+ysQf3ZrpF3PUXCq1k8vUtuag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RkUYn5L3+vXz5fm0os7ahqFTwknctkNVS1daQwrgkhjd/LeNsDARdiSS1C/N/Hi+SlL13XFS4NFidaZrape59D0BI1v+mmT6QuNUg8UcP8pEwVydIplXePJ4a8OSpYoHfKvY7/esOr32SvgoIzFJCCqg4FMGQ8m8fb+y28G89qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f7NLMx/y; arc=none smtp.client-ip=91.218.175.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f7NLMx/y"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OQsvWYYDKTSrCwcNRn+ysQf3ZrpF3PUXCq1k8vUtuag=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914416; v=1; x=1792519216;
 b=f7NLMx/y1tU6ZCK+KmiEHa5FcCelnrKwhGGLF7ILtzl6Kh0rnMMJvNhsBTO73L0u2FT7U6sQ
 eb1Yv5lbWAjCxWfY0O6cHrSzFH2Rt6m1dBoMbIAmeZ2x+RdlpFnTaRznKHEeZ6W82/Mhtu2MCj+
 z3dq1/a3dRyFRSEIZACr71SA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id fbbd4bc1189eff9c;
	Tue, 13 Oct 2026 18:00:09 +0000
X-Mizu-Trace-ID: fbbd4bc1189eff9c
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
Subject: [PATCH 09/15] net: move skb_defer_free_flush() up
Date: Wed, 14 Oct 2026 01:58:43 +0800
Message-Id: <6a189b25935eb79e0894d9e14d529f297e147e69.1791912669.git.wen.yang@linux.dev>
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

commit e6f50edfef046cf8ad541b4d5972bf38fdcdec39 upstream.

We plan using skb_defer_free_flush() from napi_threaded_poll()
in the following patch.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index c8789241f4a7..df7df594e7f0 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6742,6 +6742,27 @@ static int napi_thread_wait(struct napi_struct *napi)
 	return -1;
 }
 
+static void skb_defer_free_flush(struct softnet_data *sd)
+{
+	struct sk_buff *skb, *next;
+
+	/* Paired with WRITE_ONCE() in skb_attempt_defer_free() */
+	if (!READ_ONCE(sd->defer_list))
+		return;
+
+	spin_lock(&sd->defer_lock);
+	skb = sd->defer_list;
+	sd->defer_list = NULL;
+	sd->defer_count = 0;
+	spin_unlock(&sd->defer_lock);
+
+	while (skb != NULL) {
+		next = skb->next;
+		napi_consume_skb(skb, 1);
+		skb = next;
+	}
+}
+
 static int napi_threaded_poll(void *data)
 {
 	struct napi_struct *napi = data;
@@ -6771,27 +6792,6 @@ static int napi_threaded_poll(void *data)
 	return 0;
 }
 
-static void skb_defer_free_flush(struct softnet_data *sd)
-{
-	struct sk_buff *skb, *next;
-
-	/* Paired with WRITE_ONCE() in skb_attempt_defer_free() */
-	if (!READ_ONCE(sd->defer_list))
-		return;
-
-	spin_lock(&sd->defer_lock);
-	skb = sd->defer_list;
-	sd->defer_list = NULL;
-	sd->defer_count = 0;
-	spin_unlock(&sd->defer_lock);
-
-	while (skb != NULL) {
-		next = skb->next;
-		napi_consume_skb(skb, 1);
-		skb = next;
-	}
-}
-
 static __latent_entropy void net_rx_action(struct softirq_action *h)
 {
 	struct softnet_data *sd = this_cpu_ptr(&softnet_data);
-- 
2.25.1

