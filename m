Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872387;
	b=jZZeC2JheZcpmN0GR94z9KhxQmNCvLLpyechlQ9dUlepal2f7PjYYOtexbdu1QRP2j3d
	 1Y50oBfuj9P1vQ0/cNON4bXVuoLp/GoZ6AymA28+0nm3PO06wPvynAoI21BqT1FJRUUYz
	 icbJDOv1aAenW1GFs46WEOGk2+4vUMxWgecZ6+R42Zo8ZBIN5f7j2sYOb3ufd2F2TewEK
	 mYNXz3HzdM5kiU88sZ7yDs2tVlHZtjPLyn2QIP5DCDdBIDxgx7kLYsyBVKX9vGZPMMmWm
	 Lh24tvN2/dQ4p3uMMuLh2Xh98OsgroARrmmPwdiHbjuoKd5zj6mWybFjWfdmQsceiqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872387;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=akx74pP0EqF+1pksOPbSGjk6x7dhXiLrhRaRT4PeLV0=;
	b=UbnroLvMJ6PrOCJa+5/ELMezTwkTJ0KP5BO9PZh6d+L/Xpuy7VBNbIuIJDKjAcDW6MuK
	 7Zxz+PA7Zdmdl4ZrNIrwyZtTmjTHOUd2KpJPbqYFhOPpPbxZmmHCZDu/XEZsHz8LtccaV
	 Tur0ZFPtYuIf1HoJP5WGSB9koJa6gTY25Id59kJZeP/dmzXO+HL9XvXAXvupxB3XCatE+
	 f1HSVgou3HMYTOUtgdUggRYyPeYC9YdNQG5giY5zSXdP7GkQzGyOnsy6CbHgyt9IXMYik
	 vhSyfiCRO4g5ZpX5P81KP+twvfzLqIhK/zlqHcFaL61Hqv0nn0Z6MFLBFwFKfR8qEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rlFCPpNF;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B31606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=rlFCPpNF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872384; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=akx74pP0EqF+1pksOPbSGjk6x7dhXiLrhRaRT4PeLV0=;
	b=rlFCPpNFJnW4yIijtLQ93A+kO+Q8GVlqs3F/7O2syHR0kuwKKP2zXyhFVisfu7qyUFK0bIQIy72E8GuKN8dIffZGYy3GB3XBLNUgZMsIlki56c9bbkKiKDX0kk1kPICmZsq9uuUwOR02t0Y7SG7SFhmOSWtEFFzb3Hof/CeTm5A=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XE8JNsC_1793872384;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XE8JNsC_1793872384 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:53:04 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: catalin.marinas@arm.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mm: kmemleak: serialize disable-time cleanup
Date: Thu,  5 Nov 2026 17:52:49 +0800
Message-ID: <149d93f2cfe20d355f4d9882ce2bf99030217772.1793871596.git.tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793871596.git.tongweilin@linux.alibaba.com>
References: <cover.1793871596.git.tongweilin@linux.alibaba.com>
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

kmemleak_do_cleanup() drops scan_mutex before removing tracked objects
without kmemleak_lock. A concurrent clear command can therefore start
another cleanup while the background cleanup is still running.

Keep scan_mutex held until the background cleanup completes, serializing
its lockless removals with explicit clearing and report readers.

Fixes: 2abd839aa7e6 ("kmemleak: Do not corrupt the object_list during clean-up")
Assisted-by: LLM
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
 mm/kmemleak.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 20c0eb41c..d959d11f6 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -2507,12 +2507,13 @@ static void kmemleak_do_cleanup(struct work_struct *work)
 	 * function.
 	 */
 	kmemleak_free_enabled = 0;
-	mutex_unlock(&scan_mutex);
 
+	/* Serialize the lockless cleanup with report readers. */
 	if (!kmemleak_found_leaks)
 		__kmemleak_do_cleanup();
 	else
 		pr_info("Kmemleak disabled without freeing internal data. Reclaim the memory with \"echo clear > /sys/kernel/debug/kmemleak\".\n");
+	mutex_unlock(&scan_mutex);
 }
 
 static DECLARE_WORK(cleanup_work, kmemleak_do_cleanup);
