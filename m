Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805944;
	b=QQ6Z4qQUb6JFvLmKGAoo3SDQ1DEB/RA293vzSRFN89DG2qhuBsCyjpN72q6//NT1khkz
	 Jb5mq/9gTJB5t0x8LZPjRhEX0NXs9rnAqxdvRLqdwaFWlx5PtIFwCY2NodxftFDUqXQPe
	 ydT+8x5bafO29+6KjBB5++6GXYx2rn2RSqVKJ6CUl3lEh6IWX6VR/Ke/kkoG49rNOK0Xa
	 a4xfusOMQv+ahKYKH9XYrhRYs50FJ9lvORPZt8ysq1FtxOXzhvznYpGPKFfpWNUaJ7Byp
	 iSjkgqsn/Md2qbDkGkELSY6Ijc7C3cFqfChyLTwWmhgtWS7vvFU+uCaVjmF5sk0bf8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805944;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=iDcxcgpD8H2AJ+U+UDDaqNSj/Xno6laRJDhgDqjVhCc=;
	b=1NeMFKkPngk5io0PAlgwPYXPpbveydXEdI2D2NCtz+zi5VoxOmK8RIRh+qCGahdPtios
	 DZ3vGifeJ6MiKZJBZ7YYpLAduKMB2mMz3soMkZ1mx42RIDUYEQmE5CwyJfHwgCWRtZ9sv
	 PhCD1nu1EdW8UBv+jXIq5VluIoXCiJlb4VgTBjMRq/fkHfkckXHfAImzbRqKhJuAOe4cV
	 gjZ2gWURZFK7oCpna9j4xiquP0+WqJ1lDOLYDYCgGAEEhilNjrIPuYE7aSVaeg3+W4rHw
	 EKh+v3H/UFjVn6FFxdBxO98UU0mZj5b1OjK0peRTwQ2HxTlfwvdRP7SWRZ+bqHBrPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XxwoNSaN;
	arc=none smtp.remote-ip=91.218.175.157
Received: from mta0.migadu.com (out-157.mta0.migadu.com [91.218.175.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489AB606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XxwoNSaN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KFtcnpywgt6Da6rx/OLFu2kQrGV++9XA+ORnj3A9npM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794805942; v=1; x=1795410742;
 b=XxwoNSaNAzWB+69/SethpreM8exUr5dn8dSHqbWBlekCsHEf8JDujMjvF9nGxmBqUxfcko/P
 WamZQC1SD+nlOBeenLu10vc7MwhQ9LR5o1bIdbiODgrF8QLo1dAYnVwBOjXAUw5d2AxSs00dppj
 6CM/7jl11G/qZNg/h0UuVDCQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1882c6d6c103cf14;
	Mon, 16 Nov 2026 05:12:22 +0000
X-Mizu-Trace-ID: 1882c6d6c103cf14
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 16 Nov 2026 00:12:04 -0500
Subject: [PATCH 2/2] dm thin: free thins with kfree_rcu() instead of
 waiting in thin_dtr()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-bug-dm-thin-rcu-gp-v1-2-14ed3567da3e@linux.dev>
References: <20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev>
In-Reply-To: <20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

get_first_thin() and get_next_thin() find a thin on pool->active_thins
under rcu_read_lock() and take a reference on it. thin_dtr() removes the
thin from the list and waits for a grace period before dropping its own
reference, so that no walker takes one after the last is gone.

Removing a thin device thus waits for a full grace period in thin_dtr(),
before it waits for the references that are still held.

Take the references with refcount_inc_not_zero() and skip the thins
whose last reference is gone, so that thin_dtr() only waits for the
references already taken. Free the thin with kfree_rcu(), as
requeue_bios() and error_retry_list_with_code() may still look at it
under rcu_read_lock().

Removing 100 thin devices of an idle pool with dmsetup remove takes per
device (mean of five rounds, min-max of the rounds in parentheses). The
queue freeze in del_gendisk() waits for a grace period of its own, which
the one in thin_dtr() used to overlap, so only part of it is saved:

  before (ms)        after (ms)         change
  16.9 (15.8-17.3)   14.4 (13.8-15.3)     -15%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/md/dm-thin.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index d5ff937eeacba..8386215101eb2 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -360,6 +360,7 @@ struct thin_c {
 	 */
 	refcount_t refcount;
 	struct completion can_destroy;
+	struct rcu_head rcu;
 };
 
 /*----------------------------------------------------------------*/
@@ -2317,25 +2318,29 @@ static void process_thin_deferred_cells(struct thin_c *tc)
 	} while (!list_empty(&cells));
 }
 
-static void thin_get(struct thin_c *tc);
+static bool thin_tryget(struct thin_c *tc);
 static void thin_put(struct thin_c *tc);
 
 /*
  * We can't hold rcu_read_lock() around code that can block.  So we
  * find a thin with the rcu lock held; bump a refcount; then drop
- * the lock.
+ * the lock.  Skip the thins whose refcount thin_dtr() already dropped
+ * to zero.
  */
 static struct thin_c *get_first_thin(struct pool *pool)
 {
-	struct thin_c *tc = NULL;
+	struct thin_c *tc;
 
 	rcu_read_lock();
-	tc = list_first_or_null_rcu(&pool->active_thins, struct thin_c, list);
-	if (tc)
-		thin_get(tc);
+	list_for_each_entry_rcu(tc, &pool->active_thins, list) {
+		if (thin_tryget(tc)) {
+			rcu_read_unlock();
+			return tc;
+		}
+	}
 	rcu_read_unlock();
 
-	return tc;
+	return NULL;
 }
 
 static struct thin_c *get_next_thin(struct pool *pool, struct thin_c *tc)
@@ -2344,7 +2349,8 @@ static struct thin_c *get_next_thin(struct pool *pool, struct thin_c *tc)
 
 	rcu_read_lock();
 	list_for_each_entry_continue_rcu(tc, &pool->active_thins, list) {
-		thin_get(tc);
+		if (!thin_tryget(tc))
+			continue;
 		thin_put(old_tc);
 		rcu_read_unlock();
 		return tc;
@@ -4128,9 +4134,9 @@ static struct target_type pool_target = {
  * Thin target methods
  *--------------------------------------------------------------
  */
-static void thin_get(struct thin_c *tc)
+static bool thin_tryget(struct thin_c *tc)
 {
-	refcount_inc(&tc->refcount);
+	return refcount_inc_not_zero(&tc->refcount);
 }
 
 static void thin_put(struct thin_c *tc)
@@ -4146,7 +4152,6 @@ static void thin_dtr(struct dm_target *ti)
 	spin_lock_irq(&tc->pool->lock);
 	list_del_rcu(&tc->list);
 	spin_unlock_irq(&tc->pool->lock);
-	synchronize_rcu();
 
 	thin_put(tc);
 	wait_for_completion(&tc->can_destroy);
@@ -4158,7 +4163,8 @@ static void thin_dtr(struct dm_target *ti)
 	dm_put_device(ti, tc->pool_dev);
 	if (tc->origin_dev)
 		dm_put_device(ti, tc->origin_dev);
-	kfree(tc);
+	/* Let RCU readers of active_thins finish with tc before freeing it */
+	kfree_rcu(tc, rcu);
 
 	mutex_unlock(&dm_thin_pool_table.mutex);
 }

-- 
2.43.0

