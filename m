Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916772;
	b=XA6q1kfSmqQpo1FuOxlqdVBW1Gcs7gjCXtu1hrFEO9DV+Gx3DAhiKi7r2WR9EyMel5Ej
	 tVtT5d79EhrSPNl1mKZ/d3/QFT+lp8ZHB37Ggmjq+WwjxtKeAX0T44HpZ5CC66NRAeOv+
	 tHEEwtNojgJOsbUBbTI4aoqzkaLqu1y9Ourwb11v3CKEEgovOFPRuJNAlOFSchXRfllol
	 xxT2h6uxf3HxN5IQU53HPNaGDRGjEquU1QPVOwnKT2YuBSg2Dh2PHqtaFkPmZUa5XA4To
	 PZiniVgtkjG96+5oH9E/g3G0OsVe0rqdZ3KKdq9CJFO0wqX7ciy9tvwBO6NJ89ZghMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=l9GPRcnNlXTejSSzflm9p+/Cuc/CeAyIfCspFaALo3I=;
	b=bXTWeWo2VXVd6i7GKgiuZeYM69qFIObES9GgGxmHiglt0H7q+MertUYOeUOyUOoD1FrU
	 3KPySCFGtZ0Ng61CjDXw/xLHJ3VB1wEmlrWbqmhppBqc3YyBVTYLdmYqWuH5DxxrWTKhO
	 X8yKSVtFozK4XBpGnJMLqeeRhmMp/s1lsaRiaw2bjsKguJ4Pk8idGprkmeVDDBS+aMTqX
	 HwN+dAyrRdVnSlS9rwBioxXoT5W6KzruMnQ6X6ryFIL0m1qn0LZ9/RiO0+Wjz02LQ8WfA
	 +b1CAOInwTVJ+ZZoimJF10qAJzBBzL68+1eFzUZz1qPTWqthf+Na5+5ZctDjQOVSn0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxhaL8UP;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8902606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8902606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxhaL8UP
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d28f75d62so881750766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916770; x=1795521570; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l9GPRcnNlXTejSSzflm9p+/Cuc/CeAyIfCspFaALo3I=;
        b=sxhaL8UPz0t1UBZm7MwnWN1Daii1gDew6mFAf54H9k+5TdOfj4z6JCE0Vtt96m7ZIr
         psxAeQhu1YkflO75IdzxNrdRh0KAYf2rP20kmp1hw4cpVqXzVM656B4aZ/W+KsVL7vYi
         4teaFzmA45mz1axvmY824VyyTWVGTLHOR4xNi0OYxTVRYp6HQ0ww9bkpZJClTRlRX1sX
         ce6w0v6shfPsHVUA2xfHx6t9bIYMujyfSrsX1xZA4Sajf4bXpSxtURwnio2iPtBc0iGq
         oRYhDWBFhKuLulenunIml0OMAcu/eV1cz1IuIquiBqonoosOWTkVNg3U4zOgHioqzgrC
         S7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916770; x=1795521570;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9GPRcnNlXTejSSzflm9p+/Cuc/CeAyIfCspFaALo3I=;
        b=bkj6z/p4knIKeKHwTKDIgciOululYGDJQBbgS+9iXeE2QBWL/LzL8RWCXhZe9w0ods
         NHr2sqpYqKmuirOn/MBxa9GHfnLTq1dN9l9oCUrzRSs7LSDQR+PVRxA1J3LD1P3H7NbO
         Sl8qVgp8ZD5Hqx0gLzTXetUoc5qm0VTqsvb7o6Qk7F7ezVdDPX2Yxz8hvh5pr/SRVguK
         wWjeln3jBhGAAfVhsfFBqADWXG4lq0JMNGrIfqk2b3M/pzfYCFuNA4b2FIG9um02iOYZ
         yZsRM4kXSEonkdwnzsqWBpKODnaXxPXlnSdjZBMJ+KOCMJ13mURcDrF6yo+zzqwvpeGb
         BHNA==
X-Forwarded-Encrypted: i=1; AL+hErEOETCmNeO1gZg/gptLPyG/2IcqQPp3ai/Yq4YYxfYGHrXvIC9RYCtv+vCjQ0Dkz/SSht+ZlS9z2skmp7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2hO/8DxbjQ2pFJKWhLZCWD+gcsRQWCpQp/DmVKtKaOJbXuHKr
	bkz8+IqlFxLJ9b4GwHck42jbNskGUAgYSXdLK/dGSKse+XzXPMfEsAp57gtxpw==
X-Gm-Gg: AYBFou0UEr+I37153ogh88ac83G8wA0OhQ3JZtWeNFZlwFaZw9OGYOTqzPJQ4jsS5Uv
	/4t4NmErord/wltMn67YIF4/EHn/8gtjYoQKG9nY7nOayA3dU9qXMaRKyLq36JAHjZWULE1enTx
	oBa84dZ3Cb+wNSgMyuPG/GjE/D3blI8BslNKSuheYoWyLk19bb2NX34+fISOhtdgm6jH5UvUbHe
	OONfBIT6dHCmftFFLJaW3L5rrfhgfZ91C23wCdRvNJUUvyxmyHSPjGDYsVvf6hInoiNjPSnmTsg
	Kwl17dkUYa7P4nWrhMD30WnZZ8pCJrXvzlmSTyUUWpfw0fWRulyR7DPP7EPhFvjy4KQHMKE4r4y
	oozMF13aOT9AmJaGJsOE9wSNBqdCms95S2CkT3zd/eclA8KoSEXj0NeLut/WS4N2UCQwgWmRPvF
	Cqdyu+FoJ9Qibc14QLWqxgsEAZe5kMnviMKMEWUk2ZXfUUYUKi+j5PR4KrkUYGkn9Hn6hfL3ocl
	VBMbIkK2t8emYB/FwMt3jxJrR8bSBjwQJB8+ArSLAtUHmO0an7WvkxSOT9WbW7AYLsl/Dd2IvN8
	03LYUjWe8Zt9GAO0ZAPw8pL8e+RHOSbOjNGu5a9Bar5OKpOUC3qS0vI/
X-Received: by 2002:a17:907:968b:b0:c4c:bff4:202a with SMTP id a640c23a62f3a-c5096409d5dmr1143205966b.49.1794916770077;
        Tue, 17 Nov 2026 03:59:30 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40831sm544249366b.42.2026.11.17.03.59.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:29 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 8/8] char: xillybus: Cancel delayed work items before teardown
Date: Tue, 17 Nov 2026 12:59:02 +0100
Message-Id: <20261117115902.41359-9-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261117115902.41359-1-eli.billauer@gmail.com>
References: <20261117115902.41359-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

xillybus_core queues only delayed work items in its workqueue. Use
cancel_delayed_work_sync() instead of flush_workqueue() to clean up
queued work items, as the latter does not wait for or cancel delayed
work items whose timers have not yet expired.

Fixes: 48bae0507410 ("staging: New driver: Xillybus generic interface for FPGA")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260630092330.43534-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillybus_core.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index ab8ac78b28dc..644447502d09 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1926,9 +1926,10 @@ struct xilly_endpoint *xillybus_init_endpoint(struct device *dev)
 }
 EXPORT_SYMBOL(xillybus_init_endpoint);
 
-static int xilly_quiesce(struct xilly_endpoint *endpoint)
+static int xilly_quiesce(struct xilly_endpoint *endpoint, int to_cancel)
 {
 	long t;
+	int i;
 
 	endpoint->idtlen = -1;
 	endpoint->num_channels = 0;
@@ -1944,6 +1945,9 @@ static int xilly_quiesce(struct xilly_endpoint *endpoint)
 
 	xilly_allow_isr(endpoint, false);
 
+	for (i = 1; i <= to_cancel; i++)
+		cancel_delayed_work_sync(&endpoint->channels[i]->rd_workitem);
+
 	if (t <= 0) {
 		dev_err(endpoint->dev,
 			"Failed to quiesce the device on exit.\n");
@@ -1956,6 +1960,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 {
 	int rc;
 	long t;
+	int quiesce_channels = 0;
 
 	void *bootstrap_resources;
 	int idtbuffersize = (1 << PAGE_SHIFT);
@@ -2058,6 +2063,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 		goto failed_idt;
 
 	xilly_allow_isr(endpoint, true);
+	quiesce_channels = endpoint->num_channels;
 
 	rc = xillybus_init_chrdev(dev, &xillybus_fops,
 				  endpoint->owner, endpoint,
@@ -2074,8 +2080,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 	return 0;
 
 failed_idt:
-	xilly_quiesce(endpoint);
-	flush_workqueue(xillybus_wq);
+	xilly_quiesce(endpoint, quiesce_channels);
 
 	return rc;
 }
@@ -2085,13 +2090,7 @@ void xillybus_endpoint_remove(struct xilly_endpoint *endpoint)
 {
 	xillybus_cleanup_chrdev(endpoint, endpoint->dev);
 
-	xilly_quiesce(endpoint);
-
-	/*
-	 * Flushing is done upon endpoint release to prevent access to memory
-	 * just about to be released. This makes the quiesce complete.
-	 */
-	flush_workqueue(xillybus_wq);
+	xilly_quiesce(endpoint, endpoint->num_channels);
 }
 EXPORT_SYMBOL(xillybus_endpoint_remove);
 
@@ -2106,7 +2105,7 @@ static int __init xillybus_init(void)
 
 static void __exit xillybus_exit(void)
 {
-	/* flush_workqueue() was called for each endpoint released */
+	/* Work items have been canceled for each endpoint separately */
 	destroy_workqueue(xillybus_wq);
 }
 
-- 
2.17.1

