Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267F93EF0AA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510666; cv=none; b=bItOvNS0LKDdMHV3sokq2VlR58fXBpqcrNGqdh5LvS09zq1Xd8wYFxyhWA4zwgQeVUhuegiD3yIdY9btH3CQJAli8FXYMuCYXMgU8uDm5YLNuWt1KsHT96E7HLxpjSHIRD6oxAmt4FIpCSwUrdUEIJIfjR07eImHIrpRGDn+zJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510666; c=relaxed/simple;
	bh=j1M+jh7rCRP1fmPGlKazdBrF1jppzbTuGoNzeUt018s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aiX00WPGZvCbOQgGgWD5hhXGvRTcJAjj7KUCrV0lNIgdP9Y1z5evS62a92v7g85VMMtlJMrq4lMs8Y7rDun99X+Zl+9VM6dKf+3jWmvvS42LWfozrJBfFgGo4ymdLgoBAgkOEOVjWx1EQyu9Ac/L9+BOo8pZsiUv7Z2+4Mxq+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t0iaE2xE; arc=none smtp.client-ip=91.218.175.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t0iaE2xE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j1M+jh7rCRP1fmPGlKazdBrF1jppzbTuGoNzeUt018s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510664; v=1; x=1789115464;
 b=t0iaE2xEuOESyBHatvMQYyoCqGaz3OkBKrJ2Sth3LrDkVppIJgshtPtThUG09adUGphD0+8k
 VOHWv5EuC68lwhue5e1e29H3oczZA/y64TSFT+4wRUru/fBz/3m2a8iD9ifVGkDon6oUOsnGFJS
 V3ESwT4asMlz0/LsVWcoUe1w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 56984b57f42ec0be;
	Fri, 04 Sep 2026 08:31:04 +0000
X-Mizu-Trace-ID: 56984b57f42ec0be
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ye Liu <liuye@kylinos.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] lib: convert process iterator to for_each_process_rcu
Date: Fri,  4 Sep 2026 16:29:59 +0800
Message-Id: <20260904083001.553587-8-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904083001.553587-1-ye.liu@linux.dev>
References: <20260904083001.553587-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

Replace the manual rcu_read_lock()/rcu_read_unlock() pair combined
with for_each_process() loop in lib/ with for_each_process_rcu().

No functional change.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 lib/is_single_threaded.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/lib/is_single_threaded.c b/lib/is_single_threaded.c
index 8c98b20bfc41..0682dc87bcdf 100644
--- a/lib/is_single_threaded.c
+++ b/lib/is_single_threaded.c
@@ -26,8 +26,7 @@ bool current_is_single_threaded(void)
 		return true;
 
 	ret = false;
-	rcu_read_lock();
-	for_each_process(p) {
+	for_each_process_rcu(p) {
 		if (unlikely(p->flags & PF_KTHREAD))
 			continue;
 		if (unlikely(p == task->group_leader))
@@ -48,7 +47,5 @@ bool current_is_single_threaded(void)
 	}
 	ret = true;
 found:
-	rcu_read_unlock();
-
 	return ret;
 }
-- 
2.25.1

