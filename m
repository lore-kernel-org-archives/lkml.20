Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4133852BE3A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914374; cv=none; b=aqbChjK6VybPdHBYlyvp1qVJwotgalhLONq0devXUZTzsOVlpEcu57RKQ+uXbIHhOhjA/EJ8P7aDSB1QWYI+M2kNIFJm8LGHYHoyf5Bc1UAfRsBUrs6Lq0EHnQ/Q2WSbYE2yCf4+/oaRylSCSOUB3SPwXlWcwLrRaGxXbdAZ4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914374; c=relaxed/simple;
	bh=9h/FNSMgG+J6obEKf6fvJS5SmMAncJBwxOlD5ZJEldk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PK5bwve38bqyoezAQUhANavUfIyxXRebCiJA1kM0vO+WhX/48p5KUAGXU/+AJT5TYaTd+mVcNgLBaV68pOD8Y2Cc4K+48EwPT7niY6VRC79HHbLSNsZ6YLQEB5DBKcpJhSK1l43kNcu0RWdM1Jaj1Nkd13Haqx/KyDoTDRV9uJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ozfBblX2; arc=none smtp.client-ip=91.218.175.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ozfBblX2"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9h/FNSMgG+J6obEKf6fvJS5SmMAncJBwxOlD5ZJEldk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914370; v=1; x=1792519170;
 b=ozfBblX2OlF3ciq6K3bcnIRYWplo7jt+8CJAWU1tnQbZtP76YmD9Xmq6HsFGFwSrKE3O24my
 xQu39kd79Y4Isvpa9XGzjfe3YfKNajp5c5w16lnTqkf4eVdPE48Ml/NC4fJ+vx32hypgt6d7+kp
 VoJpmE15Q1gqGRY1bbWqB5cE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 0ab10756c8226aae;
	Tue, 13 Oct 2026 17:59:30 +0000
X-Mizu-Trace-ID: 0ab10756c8226aae
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
	Jason Xing <kerneljasonxing@gmail.com>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 03/15] net: napi_schedule_rps() cleanup
Date: Wed, 14 Oct 2026 01:58:37 +0800
Message-Id: <9703e2ac1d47f48775c312a6fc54cb3f874142f6.1791912669.git.wen.yang@linux.dev>
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

napi_schedule_rps() return value is ignored, remove it.

commit 8fcb76b934daff12cde76adeab3d502eeb0734b1 upstream.

Change the comment to clarify the intent.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
Tested-by: Jason Xing <kerneljasonxing@gmail.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index efe483d7e03f..36dbb86496ec 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4722,11 +4722,18 @@ static void trigger_rx_softirq(void *data)
 }
 
 /*
- * Check if this softnet_data structure is another cpu one
- * If yes, queue it to our IPI list and return 1
- * If no, return 0
+ * After we queued a packet into sd->input_pkt_queue,
+ * we need to make sure this queue is serviced soon.
+ *
+ * - If this is another cpu queue, link it to our rps_ipi_list,
+ *   and make sure we will process rps_ipi_list from net_rx_action().
+ *   As we do not know yet if we are called from net_rx_action(),
+ *   we have to raise NET_RX_SOFTIRQ. This might change in the future.
+ *
+ * - If this is our own queue, NAPI schedule our backlog.
+ *   Note that this also raises NET_RX_SOFTIRQ.
  */
-static int napi_schedule_rps(struct softnet_data *sd)
+static void napi_schedule_rps(struct softnet_data *sd)
 {
 	struct softnet_data *mysd = this_cpu_ptr(&softnet_data);
 
@@ -4736,11 +4743,10 @@ static int napi_schedule_rps(struct softnet_data *sd)
 		mysd->rps_ipi_list = sd;
 
 		__raise_softirq_irqoff(NET_RX_SOFTIRQ);
-		return 1;
+		return;
 	}
 #endif /* CONFIG_RPS */
 	__napi_schedule_irqoff(&mysd->backlog);
-	return 0;
 }
 
 #ifdef CONFIG_NET_FLOW_LIMIT
-- 
2.25.1

