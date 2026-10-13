Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656E55218BB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914411; cv=none; b=MMILMxTTTyxYKZ6ZJCP0SGRTGZaLwOtWs7ltvamPakBJiArKMp81iqVkg97GBsZP/Az6qMH63n15R1hmIX3vzSB6kJ4ZIHROGy3FgvXHvmitE4s1MifLlEHcgflseUh8oTjhIInulLN5MuZVyPQ2fZWw2yrxPDv7tXQ7vp9l84g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914411; c=relaxed/simple;
	bh=B3jMk3eCeC8Y3GqSv15e2NLDsK4khOcl+UEkO6mDNtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YbK2TIlliwkVx2KpzArxZ+rGWk4OuH+4jC/dW7KUGALz2aS2t5ojpYFZYEYe5sSkDaNkInqbDywi+uwbTC/XQXrBVtzXjE8UkW4wAfzMY0PyJfTgwFQIMiq2IB8R6JvI2jd/ZjAj1XL9x5fIW+AlY3MCfKyQsYzydAYqnq9CsYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GpNVirUi; arc=none smtp.client-ip=91.218.175.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GpNVirUi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B3jMk3eCeC8Y3GqSv15e2NLDsK4khOcl+UEkO6mDNtQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914408; v=1; x=1792519208;
 b=GpNVirUiGge0E1qf4WCXd/NZbyE1BGBEdmpNJh20RAvDf9p+fZDivGRqI9yX7RSTWqMrv3Y2
 mrZ3bWLtT5j8UEQR06MauZbtursq3HbBVNOE5mh/aEsGi6DczLtDDY2+h8SwiSFvog8a44mNsbo
 akf/gh4tbW2/l/xbrLQd4Txs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id a72433726fce9c6c;
	Tue, 13 Oct 2026 17:59:58 +0000
X-Mizu-Trace-ID: a72433726fce9c6c
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
Subject: [PATCH 07/15] net: add debugging checks in skb_attempt_defer_free()
Date: Wed, 14 Oct 2026 01:58:41 +0800
Message-Id: <eb6046c21643e4b712752d53ea0f45216ca6e352.1791912669.git.wen.yang@linux.dev>
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

commit e8e1ce8454c9cc8ad2e4422bef346428e52455e3 upstream.

Make sure skbs that are stored in softnet_data.defer_list
do not have a dst attached.

Also make sure the the skb was orphaned.

Link: https://lore.kernel.org/netdev/CANn89iJuEVe72bPmEftyEJHLzzN=QNR2yueFjTxYXCEpS5S8HQ@mail.gmail.com/T/
Signed-off-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/skbuff.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a66066bc9861..919ad5a2c5da 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6727,6 +6727,9 @@ nodefer:	__kfree_skb(skb);
 		return;
 	}
 
+	DEBUG_NET_WARN_ON_ONCE(skb_dst(skb));
+	DEBUG_NET_WARN_ON_ONCE(skb->destructor);
+
 	sd = &per_cpu(softnet_data, cpu);
 	defer_max = READ_ONCE(sysctl_skb_defer_max);
 	if (READ_ONCE(sd->defer_count) >= defer_max)
-- 
2.25.1

