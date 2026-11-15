Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702698;
	b=yyo0+WOMUrdPx4TnxlbruTV5NT6tBXxYLrmXVtOFxEq/XYmenJiuG/mLI+RX7vWl9man
	 sIrxx2X3muk5+FqmnWemSCbGaRDu/Csy9bhRMppT9GSqGrDsXUu4ryskwaHKaQhaHkmuK
	 XIfVG6R5b1mOqo4HyNaMqQdHhGm6LIcXCPGC7a5cYvb+5usveu8+tyuGxx9EXHzirjq8f
	 Nlei/gbOBFoiIoMtrmSSuBYbacczKJ95Ue/9onmnb0jhtxdjH2HrpJD1zbJEKNy+hJ5cU
	 DBJJKWJgL0PrLYVsgnioLUFWco0ajoMFlxTamfwh0Jzx1F+3X/xzZzAON40vKlcUUCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=H1r4s03OTSXpAk2qDHWsbzmDBzynW8D8hOIi23yx2Ig=;
	b=YBqtSxUAJnR4jvUeVfSICipugbS0QXq8LjeqsW+S3osqFsJ2TrBj5D5SNAnYq+N0ILxM
	 aWkLR1HPysXV1+7V9hLuZAzO0djVgx8o+O9qv4IyMRcJn8QqW/BwYcqexwJUpKi4+FoGh
	 MOQ2VN6w600a+Z1YGLQDhGX45UWJZAgOXLzHuBQpM74uh+b40rK0j7aEKNMAZ1zhNeEGH
	 7zkX/BIYHaKnAP2Uu7/Kriw1SVNCi72t12VdVDk3aryarnGerDyF4tpP3cd2y2MB3MQ4h
	 4qA66dYcJWmuACncQReI/3q+7r4yFLqPTCNfkm0wfGuM1/rnhGv6YKGum+646MoFvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mIrAg/jV";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8C606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D8C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mIrAg/jV
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2858252eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794702697; x=1795307497; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1r4s03OTSXpAk2qDHWsbzmDBzynW8D8hOIi23yx2Ig=;
        b=mIrAg/jVOclPkOIFebftKeA/NkL/iGZ4uxsWfgejkVtgVv9ZzXBE0JB/3erqKjNeGs
         GToOd7/yiGs6IucMQJ7PEePm4mv4nmTzqvjnJJBW+xQgCZHApKX3k9ij2Z63Sf+l3i6j
         DeiuBOz2xK90EyKtrcyhs9AuSF2u2MeaaYzFzsYnH8fw+TPHDw5Mti0JCSSNf38VYAIe
         BRdaq+R7vqxvISSpZf5uHR/aeYNr6PLgAeM6BU2EeZdNNr3cLIdsha5q6u12gbWGJVFe
         gKRgYxNFX6bfT4k9SydgzH0g5JI6oNW70bkwhWSYC/HYQXVQfkmyNsqaSF0zeD6FnIUG
         diDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702697; x=1795307497;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1r4s03OTSXpAk2qDHWsbzmDBzynW8D8hOIi23yx2Ig=;
        b=osVbBztpGcfqmLR4HDLMNv1u2jPjfmd0LQoj57EJs131bncBr4tZkJsl9jMwBxcT26
         cng6O0LvK2HlM38Gj3SywfWcmpKMTfFIbVvxbNqNhxqMcn6U/Fv6Rnh4xOsqmJtWkpTx
         1O0yL81pl/wskXylDhD5fE46UusfWBLDBlv4RpsT8R4w+R5tP5bBF9NLaOQ1lZWi3NLD
         AyfwnVqvgfxk+6fcrXsF2zKaEPvSnl8VERNLFRItoxFYSZxQsxkZ6xyn0iFbAhPDHpJi
         xMuf/3/csIhVO87EzbwdHdHtEw+8WkvjGz/0t9zFtNeDBipImakA03l7y/ddowtyKWRf
         sNTg==
X-Forwarded-Encrypted: i=1; AL+hErHpX8wKRNlCfOPwF4YEAG73FKYd3Nr+daYxgE6qH0MZTFPZ/dU9fJKpBh+tkKUY8N70MMxkH6TXca+4O8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+loCvDFdRMCAFO2yL1/AdOt/XbgdIjugs9pwkNrtniXK16YdlR
	uKkTU+dx4bZdD9LRW/skoz/kZwvwNVZtJPGY06S2HKwhysPjFSw0NQstKI8ZN+Dv3zw7ag8ZRHB
	Ece4OvcYwy1OyEw==
X-Received: from dyaw16-n2.prod.google.com ([2002:a05:693c:4150:20b0:34c:9660:9612])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr6454518eec.31.1794702696356;
 Sat, 14 Nov 2026 16:31:36 -0800 (PST)
Date: Sat, 14 Nov 2026 16:31:14 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261115003113.1852160-2-wusamuel@google.com>
Subject: [PATCH] freezer: Check frozen() before freezing() in freeze_task()
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

During the freeze stage of suspend, there are multiple passes over the
same list of tasks. Each pass tries to freeze non-frozen tasks, meaning
that the number of frozen tasks increase monotonically, and that each
subsequent pass will mostly be iterating over frozen tasks. Therefore,
it is faster to *first* check that a task is frozen before other checks,
especially since the frozen check is computationally trivial.

Check frozen(p) before !freezing(p) to short circuit the more expensive
freezing_slow_path() calls, while retaining identical return semantics.

On a v7.3 Pixel 9 device, this consistently reduces freeze_processes
latency by ~10% (~4.5 ms).

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 kernel/freezer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/freezer.c b/kernel/freezer.c
index a76bf957fb32..1adf09321389 100644
--- a/kernel/freezer.c
+++ b/kernel/freezer.c
@@ -166,7 +166,7 @@ bool freeze_task(struct task_struct *p)
 	unsigned long flags;
 
 	spin_lock_irqsave(&freezer_lock, flags);
-	if (!freezing(p) || frozen(p) || __freeze_task(p)) {
+	if (frozen(p) || !freezing(p) || __freeze_task(p)) {
 		spin_unlock_irqrestore(&freezer_lock, flags);
 		return false;
 	}
-- 
2.56.0.679.gc527c65306-goog

