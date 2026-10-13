Received: from mta0.migadu.com (out-33.mta0.migadu.com [91.218.175.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1503252CCF8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914387; cv=none; b=ocplZs7T/Q3xssjt4gcLIIO/SiDSanm02J32PdGcH+6ILTK8rGsk1DYUaDNg1AoDfNhudZK5MABFGYjrRwgRrCE422QRLUYt0mIxGewNrm3M29LYXHrQ57cTfZrcIqiXh4IZHWAzMD+lpzUnXXjiTAXM7AvBi9iVqUZouR5BZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914387; c=relaxed/simple;
	bh=KzjAP5mj+qZ64QCBziF9G7xxImjiEPrykcdJXSVUj50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M7ALmpAm+JVdfw0p4jiy5EwrLpEvCK45bHmFVU8haKAOZtYLKkgedWzrQ1ngeew8sKuVmQ1i95GTR/Fmj5nkzSjt1/SqYmnEU42r8O3CXQ+3WGO3hIDsnTV72JPYPig9sDdYoKEzEgJ3th3mraLsBVn9rXQdD2E342jSN0G8qmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O17l5H2j; arc=none smtp.client-ip=91.218.175.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O17l5H2j"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KzjAP5mj+qZ64QCBziF9G7xxImjiEPrykcdJXSVUj50=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914384; v=1; x=1792519184;
 b=O17l5H2j3eE7tzn8zHzdxnqA8EkbnR74B/up+BX6OliTHCM9wXlvruSLXYigcN8lOW8fwsot
 DCGxknPpFss/f5RpvBR2wfXTdBJteStPCNCBpuTuQkBMc1VuBLMofhcjykc2wTiqRal1trOyByb
 TXiDu9rxcKX95cKZNWQ+ksmQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 24a1a4ad649bf6e8;
	Tue, 13 Oct 2026 17:59:43 +0000
X-Mizu-Trace-ID: 24a1a4ad649bf6e8
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
	Jason Xing <kernelxing@tencent.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 05/15] net: optimize napi_schedule_rps()
Date: Wed, 14 Oct 2026 01:58:39 +0800
Message-Id: <16487698a3046cdfb31f056d409b34ce3fc0516b.1791912669.git.wen.yang@linux.dev>
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

commit 821eba962d95806beb0440742c4062a9da8a386b upstream.

Based on initial patch from Jason Xing.

Idea is to not raise NET_RX_SOFTIRQ from napi_schedule_rps()
when we queued a packet into another cpu backlog.

We can do this only in the context of us being called indirectly
from net_rx_action(), to have the guarantee our rps_ipi_list
will be processed before we exit from net_rx_action().

Link: https://lore.kernel.org/lkml/20230325152417.5403-1-kerneljasonxing@gmail.com/
Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Jason Xing <kernelxing@tencent.com>
Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
Tested-by: Jason Xing <kerneljasonxing@gmail.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index a46caebb06f7..10a8883ae490 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4727,8 +4727,6 @@ static void trigger_rx_softirq(void *data)
  *
  * - If this is another cpu queue, link it to our rps_ipi_list,
  *   and make sure we will process rps_ipi_list from net_rx_action().
- *   As we do not know yet if we are called from net_rx_action(),
- *   we have to raise NET_RX_SOFTIRQ. This might change in the future.
  *
  * - If this is our own queue, NAPI schedule our backlog.
  *   Note that this also raises NET_RX_SOFTIRQ.
@@ -4742,7 +4740,11 @@ static void napi_schedule_rps(struct softnet_data *sd)
 		sd->rps_ipi_next = mysd->rps_ipi_list;
 		mysd->rps_ipi_list = sd;
 
-		__raise_softirq_irqoff(NET_RX_SOFTIRQ);
+		/* If not called from net_rx_action()
+		 * we have to raise NET_RX_SOFTIRQ.
+		 */
+		if (!mysd->in_net_rx_action)
+			__raise_softirq_irqoff(NET_RX_SOFTIRQ);
 		return;
 	}
 #endif /* CONFIG_RPS */
-- 
2.25.1

