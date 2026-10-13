Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A37A4718EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914566; cv=none; b=M0m06Iu89im9NkSt0CghnEJRymSTrH552p5p4hPAuJuRrksd+/cgtz8Z49Wl9sUGZTccC9dUvQlY5RqAEi8gkavFNNZw//Y6YiMuqiCtRfu+ZP/QTfMpIzVwsM6rMvgqD5W0R2A5yWiZEFXe09uPrf+Ps5/feH4jsHzKzCmlOEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914566; c=relaxed/simple;
	bh=ezuFFUi6PivDxuUOseqtDzW4aOjW+5v9YWvmNMVwCvw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HXaZnRn5qiUu5tgbI9P+hEVdHc6cHIMqG74f7TtpGgyT+GWQ57aIy+SkJ64UWXH/Tv0TghhFUjq9BamvbvSC9i2vvxAr6+Z+zyYG7fxP8GjEQ2fxDW7LRZ+2qdHi0ejHLwPM9yB8o91kXdUmRg8elbStDPSMsXFf6TS9D7zKSA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mPsbjCBM; arc=none smtp.client-ip=91.218.175.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mPsbjCBM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ezuFFUi6PivDxuUOseqtDzW4aOjW+5v9YWvmNMVwCvw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914562; v=1; x=1792519362;
 b=mPsbjCBMh27MNSgXgUM6+2CBMOCxUJYSm52a5evtGlBOxaq2dwnBEH3Ncq0fovzBLYxaBSAT
 b4BcorFn4v6/Dbv1y2uqcNA1CCdepM9in9NWziwMnmoKqj8sfTfs1QE0fsEaZlBTVcqpa6S7fDb
 dIt6BNcP/nzhd86NK4O631+0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 72c23e72e327d275;
	Tue, 13 Oct 2026 18:02:42 +0000
X-Mizu-Trace-ID: 72c23e72e327d275
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
Subject: [PATCH 10/15] net: make napi_threaded_poll() aware of sd->defer_list
Date: Wed, 14 Oct 2026 02:02:26 +0800
Message-Id: <ca670e2fb6418313626e3e039da3c034b0f99862.1791912669.git.wen.yang@linux.dev>
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

commit a1aaee7f8f79d1b0595e24f8c3caed24630d6cb6 upstream.

If we call skb_defer_free_flush() from napi_threaded_poll(),
we can avoid to raise IPI from skb_attempt_defer_free()
when the list becomes too big.

This allows napi_threaded_poll() to rely less on softirqs,
and lowers latency caused by a too big list.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index df7df594e7f0..cac16e17ccf9 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6766,6 +6766,7 @@ static void skb_defer_free_flush(struct softnet_data *sd)
 static int napi_threaded_poll(void *data)
 {
 	struct napi_struct *napi = data;
+	struct softnet_data *sd;
 	void *have;
 
 	while (!napi_thread_wait(napi)) {
@@ -6775,11 +6776,13 @@ static int napi_threaded_poll(void *data)
 			bool repoll = false;
 
 			local_bh_disable();
+			sd = this_cpu_ptr(&softnet_data);
 
 			have = netpoll_poll_lock(napi);
 			__napi_poll(napi, &repoll);
 			netpoll_poll_unlock(have);
 
+			skb_defer_free_flush(sd);
 			local_bh_enable();
 
 			if (!repoll)
-- 
2.25.1

