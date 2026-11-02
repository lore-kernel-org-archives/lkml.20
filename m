Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617259;
	b=zWw/zs2HAd8SOsMmKbeOmlTidEmAgN+pEKTYypQqAkumPlMYVzqYGHXSafd3lJ3P2xm0
	 eS2ssZ4XtLXZdfcYqCLw2PgqwFc/babvGVwMKKyIE+X0C1ow4hAsJkehNhherYHHE4beu
	 3TuglOSTJPXW5D+F23H9A76PN+BmM3sTvzFht8GKQ8gTLNOion7yeU2i7ytcXVB8Ra1fd
	 QxP82ALf+sUO/zKU2up+zR8IfY4fOQmRx5dB1WzaCHv5meFQFbbrbnrJsJfElh3cw8RIi
	 HEaJzhoKhywQYWBg6ltiJJTedbvs4HstaPf++05Tvx96NdB7KEWzqTNRgglR/4DnYpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=an+UOEFhB+5D8ryDTlHyQjduWTu9r/ongaPw2YRIAFo=;
	b=P20+VD8MNY4lqEjPEWMujaRqIRiSgVyWEPyrR9zmYG3W2YvrXkuXv8jEunWkDuU4aG2/
	 gX80byFIsxQT0YqPvodLI7Mn6W+3qBTa0g8jGIok5xfqDEraByESxr1qMKrgKDDaEV/sC
	 5M2Q30rGVcVLXBXnv8Jnamj4v1sHfJe4V6SWQJMFhYbRuGySC1fZZQaXkBUinjUXN6+KX
	 9MyQczXuzGy970Fyd4ui61ogJr9+eFj25Aym6d8R+abqVVHY5L4FVqvPpSHwOtAyXdVoy
	 T/DJzb+tlRgYjDCLn0y990Y9l/0wki8I1FHQklcslx/H+/srEr8xt4MUAGFhVHTtnxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SMqKGA37;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88324606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88324606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SMqKGA37
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso24861865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617257; x=1794222057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an+UOEFhB+5D8ryDTlHyQjduWTu9r/ongaPw2YRIAFo=;
        b=SMqKGA37e0ZQqtC3O7X5LJWQN/NbuTaAy3AFsmk+VUQvKtkaZnTy/3AaSbcFl//+Ty
         zln9E9mB0QGirDzb0TYw+rHiz5blRMOBMgVAVJ6XqpuQgZhoJdpdfoO9MZ0h79tbEd71
         uRqqLVRxOMkqo+0wkMoQUKlztVPGcMR+jNrbGNT6xMI2T5Xg0y1g8IVH5guywzzklhZn
         Zx7eUXXo0MpiNFmp/CJZHYZYLS6C1TmIq4qQhSyAnxmYrTWJFk3QCplmmtkot1PQiqpY
         PO1ryJChEdHU7wy1RhWc+WEz+eS3G/RMq1qE1ov8y4cLVdxR4isp/aold0C1U396ZtcL
         ivkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617257; x=1794222057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=an+UOEFhB+5D8ryDTlHyQjduWTu9r/ongaPw2YRIAFo=;
        b=xONjyI6r5NJGuXS/Q9XKk5yzaHjL+acse5eNwh9+RyMwGOEqizjyeHR2AOpg1HUmDL
         jRmOsIgau+JFvSXl53me6aKrG6TB61xAcRgDlL9OzmmlLGFOqb0SCXTmyeAxTRbjz4AO
         41FsWcR45nRy4D5WqrNaxS++vo1NQgeDyrUpg0N91wlEde0RaSP23SCkPk32I8Ul4ZbR
         IY2FD0qiP5TClX8VLpOASRKgpmNOIwJl/DqBq1dK6qykznFedPh0RWxu7y7ebnMt5Id1
         7elZxZeISpojdtbdBmyHPGlF3LUNBas+PGSfIkaUXDg/g1CleDBcLnTkfY8baAq6IoJY
         aPIw==
X-Gm-Message-State: AFq9FYK6mfQhtwz0xhTe9VbAWJpV9thgjKo1zGbb92MzrOpQUC4w0yRM
	0Z7qoJSVD30DgJWs5WXy+gyQfa/tgdaIe+3A/QiPPC94+F4/ZeAdt2ln2ube1/jLaE3uwjy9rOk
	71FZ4vZY=
X-Gm-Gg: AYBFou3xUWy/l92G+ZxpbMJvMZgvuCOPGDyNtYJkVDG8ue5w2xUvuEZ5NyuajA5NFxp
	qQ4Kl3me2YYWPdOlW05ogeGNgeCEiI6ZhKqQif2dwWgW8eojtlMaZ8Kd/UlzpZ7rPcUSqdXflV3
	gG5JFTrnEVUr8orNQKLKuGyAmVOcda53eIw6HEppua9fAdQuBVSKW/o9KHzFQTFDK1FX5PTSovC
	ZykpYrwpa6OqxTu6xmmuy7HDLIH76Bp9zSjbFCZVANlQm5F947v7EOeCXb4VSb1qMLDA9FmxCax
	IARYpwvONdRxomCJjydAZRxOCxORg2eBeDjPlTybh6H+wLfOauiRWw7Hy81dryincnAjZHIyQsE
	KNSoPxC2gGo6olpGtoM8hQxUnl7z8432JAH0s3rEIiPsdUtPmZUbKhTkzSATAHH5wGY/qyilH2k
	EttsxFwer943r7Yc+3K+zpBkkuuC3I8bsRK2oGF1ElqQkbPCMVhD/iaawq6TxBwSSES5AevLYUY
	QexcUnE5KaFFYeJca/5LjWwmlAMN7vWzFZ8SXh24ODP50WU/6eaZMOF6RUdGFN1ZWtDuvD6fhWF
	TfFc6aH47Dd4TAYTOmemgNbH5kl4QzYz2L6v+ihFRkudQjR+ntQn
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr231279665e9.9.1793617256469;
        Mon, 02 Nov 2026 03:00:56 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm266236305e9.1.2026.11.02.03.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:00:56 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v5 1/2] workqueue: Make alloc_workqueue() unbound by default
Date: Mon,  2 Nov 2026 12:00:46 +0100
Message-ID: <20261102110047.115375-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102110047.115375-1-marco.crivellari@suse.com>
References: <20261102110047.115375-1-marco.crivellari@suse.com>
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

Currently alloc_workqueue() ensures that one among WQ_PERCPU or WQ_UNBOUND
is present. Now every user has one among these two flags and if nothing
is specified the default is WQ_PERCPU.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they're needed and
reducing noise when CPUs are isolated.

In order to achieve the future goal of removing WQ_UNBOUND from the code,
start changing the default behavior making alloc_workqueue() act this way:

  - if WQ_PERCPU and WQ_UNBOUND are present: remove WQ_PERCPU (as before)
  - if neither are present: add WQ_UNBOUND

BH workqueues (WQ_BH) are always per-CPU and can't be unbound, so
WQ_PERCPU is now unconditionally forced for them before the above
defaulting logic runs.

The WARN_ONCE() when neither flag is present has been removed: from now
on, every alloc_workqueue() user without WQ_PERCPU will be considered
unbound.

The defaulting now happens before the workqueue is allocated, since
unbound workqueues need the node_nr_active[] array. Doing it before the
WQ_POWER_EFFICIENT override also makes sure that callers passing both
WQ_PERCPU and WQ_UNBOUND get the warning regardless of
wq_power_efficient.

Update the WQ_POWER_EFFICIENT comment accordingly.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
 include/linux/workqueue.h |  4 ++--
 kernel/workqueue.c        | 32 ++++++++++++++++----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index c8a36423cb34..da18debf424d 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -392,8 +392,8 @@ enum wq_flags {
 	 * turn may lead to more scheduling choices which are sub-optimal
 	 * in terms of power consumption.
 	 *
-	 * Workqueues marked with WQ_POWER_EFFICIENT are per-cpu by default
-	 * but become unbound if workqueue.power_efficient kernel param is
+	 * Workqueues marked with WQ_POWER_EFFICIENT and WQ_PERCPU become
+	 * unbound if workqueue.power_efficient kernel param is
 	 * specified.  Per-cpu workqueues which are identified to
 	 * contribute significantly to power-consumption are identified and
 	 * marked with this flag and enabling the power_efficient mode
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index c1cb328bce3c..747c48582ceb 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5892,6 +5892,7 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 						  unsigned int flags,
 						  int max_active, va_list args)
 {
+	bool wq_dropped_percpu = false;
 	struct workqueue_struct *wq;
 	size_t wq_size;
 	int name_len;
@@ -5901,6 +5902,18 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 			return NULL;
 		if (WARN_ON_ONCE(max_active))
 			return NULL;
+		flags |= WQ_PERCPU;
+	}
+
+	/*
+	 * Do this before computing wq_size and before WQ_POWER_EFFICIENT
+	 * can drop WQ_PERCPU.
+	 */
+	if (!(flags & (WQ_UNBOUND | WQ_PERCPU))) {
+		flags |= WQ_UNBOUND;
+	} else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND))) {
+		flags &= ~WQ_PERCPU;
+		wq_dropped_percpu = true;
 	}
 
 	/* see the comment above the definition of WQ_POWER_EFFICIENT */
@@ -5927,22 +5940,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		pr_warn_once("workqueue: name exceeds WQ_NAME_LEN. Truncating to: %s\n",
 			     wq->name);
 
-	/*
-	 * One among WQ_PERCPU and WQ_UNBOUND must be set, but not both.
-	 * - If neither is set, default to WQ_PERCPU
-	 * - If both are set, default to WQ_UNBOUND
-	 *
-	 * This code can be removed after workqueue are unbound by default
-	 */
-	if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
-		WARN_ONCE(1, "workqueue: %s is using neither WQ_PERCPU or WQ_UNBOUND. "
-			  "Setting WQ_PERCPU.\n", wq->name);
-		flags |= WQ_PERCPU;
-	} else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND))) {
-		WARN_ONCE(1, "workqueue: %s uses both WQ_PERCPU and WQ_UNBOUND. "
-			  "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq->name);
-		flags &= ~WQ_PERCPU;
-	}
+	WARN_ONCE(wq_dropped_percpu,
+		  "workqueue: %s uses both WQ_PERCPU and WQ_UNBOUND. "
+		  "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq->name);
 
 	if (flags & WQ_BH) {
 		/*
-- 
2.56.0

