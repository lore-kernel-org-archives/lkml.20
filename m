Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE18233946;
	Fri,  9 Oct 2026 01:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508437; cv=none; b=E8yDWn4geTsB+ozQf72jnXbVt6+LlIP5KCLXy1asgvDHJITFfZQ7qGXQL0n8Z8mzFxx0mcqkQGqIX2gFla0jcK2fGGYgrwLombGd61I9h7KLqKGAdLHaWfdzKXc+O5goYcCbh0X5wMbafrJOzmrOsE+O/LkHc56SyTDjRFA8nYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508437; c=relaxed/simple;
	bh=PKxNHmo3b9AmapEP9pe8XgasIUrq/xzacG/+7RgQ86Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EdQa/ukhqvxlQRVksHR4BoAE7TX3uEKo0IDynrXrAmeqDhWmU2vDpi1wDQXnIQozRKGntPXtDDo5bEBC2/X9hVRSlxF88I54UVbvF6eWPjBltBrrxmu9IeWIl77hgHbA9xYn2d2VAMlGGqwLS2OsHOTfmfwneqSkPFU8KR1gRxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=PdPlUoWI; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="PdPlUoWI"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id E169CD19EA;
	Fri,  9 Oct 2026 04:13:44 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro E169CD19EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791508425;
	bh=QhWTydXEXnoezSmu80r2yjYE4XuPsJ9Dk+TOati+pgo=;
	h=From:To:Cc:Subject:Date:From;
	b=PdPlUoWI8KfPABzUx4qf8ZfpvXapwQvVslywrtosDwg8X3ipNOagKzb7L1TU1yFY8
	 9cXJd2JW15f5JGPjgebgHlL3LDnVCde9TLcUacZZvDVZTkUvzaP7x16L59OAaIiqh6
	 8S1wf4JDyBO74YWLkZEjTzSmLM1GFNtDnPo+ecL8gwAV9HMJfIIp5zzsM12fYgUXGZ
	 uGsbrBWLNKweQ/t2wFa0S27NisfAYUVT7F3H28mbd+oRnBUmN+vgjnkW0wSvdf2+0N
	 hdbtFbFeh1h7RT4xpVw5KM0blkzWIxrSroH73iJL0mZDic7oI64KlD7gOHFJsmMKnG
	 MhucvZVxfwKDw==
From: Radu Rendec <radu@rendec.net>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Eliav Farber <farbere@amazon.com>,
	Thomas Gleixner <tglx@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of/irq: Document of_irq_init() device node refcount contract
Date: Thu,  8 Oct 2026 21:13:24 -0400
Message-ID: <20261009011324.1503697-1-radu@rendec.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a driver initialization function is successful, of_irq_init() keeps
a refcount on the device node it has passed, which makes it safe for the
driver to store a pointer to the device node and use it after the
initialization function returns.

This behavior is currently not documented anywhere, and only assumed.
Add a paragraph to the comment block preceding of_irq_init() to document
the behavior and turn it into a contract.

It is worth noting that of_irq_init() did leak device node refcounts in
the past, and this was addressed in multiple commits; most recently in
commit 708124d9e6e7 ("of/irq: Fix device node refcount leakages in
of_irq_init()"), which fixed the refcount leaks for the initialization
failure path only. That is an indirect confirmation that keeping the
refcount on the successful path is intentional.

Signed-off-by: Radu Rendec <radu@rendec.net>
---
 drivers/of/irq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index ef1ed9743907..bf277781cdb6 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -647,6 +647,15 @@ struct of_intc_desc {
  *
  * This function scans the device tree for matching interrupt controller nodes,
  * and calls their initialization functions in order with parents first.
+ *
+ * The initialization functions are called while holding a refcount on the
+ * device node corresponding to the device that is being initialized (passed
+ * as the first parameter). If an initialization function is successful, the
+ * device node refcount is *not* dropped (ever); this is intentional and
+ * guarantees that the pointer passed to the initialization function is valid
+ * not only while the function runs, but also for the rest of the kernel
+ * lifetime (i.e. it is safe for a driver to store the device node pointer
+ * and use it *after* the initialization function returns).
  */
 void __init of_irq_init(const struct of_device_id *matches)
 {
-- 
2.55.0

