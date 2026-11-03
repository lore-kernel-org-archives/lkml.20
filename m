Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692857;
	b=P5Ii2bja7bO+BzldpD0RlUs2O/P7gZbnN3InwFycuygPOA71VRpjMOK2zI8YkQB+YsCO
	 HktmmBVC/vPFlkK7/doJGiFxEzXwKnBSk9SDEoRYYGEQMvExkzdc1AmKN9hI8RlDxadqQ
	 O4LvgP8+6P/27rAoy1S9aDyjhS4mxAGMC+Z6E8eXESLsJ5+TtX+1ce9kEjYdsCFAzt9xT
	 GKPQ1bsJ+ZHwvpGzhavXOo7CmBT9tE4YHGrAuCPWOM/V/otIJaYgXKtvqXsRTU0JE+u2X
	 loSiR+OKIMEwOQJDloLJc9kX+25JIHDV5a0kK3z0LHGYclTeSm3gwD60mCD9M+WcYbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jaPQ34I/G6MMT2pb+dBcgiPAsdHes/QH+s/hJq1mQjw=;
	b=K1XgBKDrG+Gbxs9deP0hR8yWiXb/vM53s2GDnDyFVfg5ZnBQ6sZA9kcPoK8Zd7UVImsN
	 XfT7l+1xbR3nMIQG6crv0z0RWY1pHQGrYIsJXHJJ1T+QMioo1aWvYtcWBlTbtJx92LsbT
	 e+d8K67TyhGIdmFLaACWRUFR7BGQ133m3jQeFICgA1irkVpj89UBycwNW20mdFQTjio+u
	 VLVwmu4t8BTCyigvbYtfKpHov3tGsDprFchN25R8bJkvCsSf3hre+SKJd0JB+OKVPRQsq
	 OTllXIeMVRJ3qaU9/AzjgyA/aJvz375JojxZQSSROPtoqfHPVbL8/rfQrvE6Noplw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=aBXWkUP9;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5D606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD5D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=aBXWkUP9
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ABF873F780
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793692855;
	bh=jaPQ34I/G6MMT2pb+dBcgiPAsdHes/QH+s/hJq1mQjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=aBXWkUP9q41s8F4rawwetX2HntceBR69rrDT+JIkZEmMbpRGvFQVMJsjQcH0JIgEX
	 J5cRmXjo0XzXJGbQAwqLzwewAIS4mHk+K+17oC4Fptsk7bQDlZwlpxbV3MLNByAHCb
	 8aTlqyP5Vd/BUHFsOU97+tb6PJJzyFZ4CBZwsNa/qZwBFm76YC7ytpc0opscAtRWzM
	 KMVONE3pyqAn1iN/Wuix7mNrr23NlNYuLUuPUdPNABjEY4GiGVdna7SRLlojx2hotA
	 a/3o9SNfwcjfyneXLgb01y5DjcCCB8mGzxFYBjMSwXE2xJH5dNQH5LgYguOJNrp44D
	 zPsR35En38yAFkykjizzT4U8yIacJvLUTylIRAk1C41NFOGMX9jkCPrS0qM4IkQNR5
	 rePvv4C8/oU7kiqCj2/KEJ5MHVMiVjED02lKtYpucF4Ram8siEvmCKPO+KTY3vmNKJ
	 gUeCganuYdEhVo7AHv4R8NobPJLRwFlOBCJa6OeZ+JeIq+HL9EgWJYl/X5L7O2pMhA
	 GCOUoHgchPTK9UVBlC/gbT1FgPM5yRFf08dAub7vDTZMfQBaK/w12CYN5MiY2Tfy2i
	 EdjL60VCz5LTrd8JjBHMYkIrQiG2zbkI/ZxpII7j8Xq7xHbwtwWyRYlV6FSb9qZ+qL
	 7x7kOUOXtbOdZu2zVwtIEghA=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so6581586eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692854; x=1794297654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaPQ34I/G6MMT2pb+dBcgiPAsdHes/QH+s/hJq1mQjw=;
        b=bYEaj14Ax61AJtTxu10049Zv/THZlH9f1pGC0Aut0ceiNH2pfBSzOInNdI9ijnjgAB
         fWAN7RPNKX0P9xQrz87fSfd4iGzZiDAcR8VR0NLEjtXoxKaFU3vBpFmFLFCdcATIauKh
         buMgzn58x7sCkLUiLzpYIMEfo/iy+4YlffwNi4jbk0gUa9NIlFnSgFCU3y+O9qydXMec
         mS1T3Cp5o6NU3YbSVYoKqEY5pIkWVjfjOGt5nwHOgE1jN4RGj2zbuM7Q/v7RqGLSuLxk
         GvRXWdcsYw59bs+glp+be8Q3RlqZwJyCxGxtMwGEwW4CBBvtV/5rNiSPGhAo24gKzHbG
         E4yg==
X-Forwarded-Encrypted: i=1; AKwUvBwN2YK/t9aJan+O/wOFu4oz9BNh39dlwoU+PCuncbcfFk7TrDSshb0bAftbdsUwWc0W+lBdUDi8zDMhCRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f/6lUyPMmonY3UVY4hTYmkpxRM+AIH6GsT1KiWh/a/ypGDyUP
	0SxHQCksbsoMHKrt/yqHv36uTgC7f/mxKPezNT7a/mcTdtqtEH19JS8ykReQ1R/83kb+ONWRz2x
	N6wYIFJHM4CslOMgKJGxbt/D+Etk6mfAhNgGyefJo/8tWisz+I7txjC5NTh0hzcgtMMChqJNYyT
	yt8x5W0Q==
X-Gm-Gg: AYBFou3HJBduufsiT8BJlinXc6geKIwV7nMqhakidmSCKXnL7TbbAsgPi/R3rkL0J7C
	atxHYh30jYeM59lQKtKFAzF/i6rnezD80B+TjggPCyQ//vH2mqF9iXY4XUNDyeH4NCnFEPgg1ZW
	IW4eaNpIR9gWfg8ZNTawplnIr1KkKdTVBhUaQ8GZfaP4Gm5jzBmVm/PIN+e5x2K52Zfv1ujswmq
	tjl8M2omQU2tTZuLoLuoVqgIj5N0f8N0IU4du9EM1V3lL1vz10GAZtlocgbvAL53J+8TDC547Lk
	/kU7xOWQH7dD4EFP3iAMSlVc1fzPsQ5ssOBOKie+Vu4D7zl1cQAXZGT7EChPWkJmk3//Gng4/88
	s46SLqGd1hqLPZ35p7PkXmFGXSbiBTlDMQoF6v4grwhMKJdLiTUyzVqCZFHFQ2HgF3ydWs+/z1C
	TzpU6BqkPrRJOHa+nSXQ==
X-Received: by 2002:a05:7300:5988:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36a42426236mr18638140eec.41.1793692853878;
        Tue, 03 Nov 2026 00:00:53 -0800 (PST)
X-Received: by 2002:a05:7300:5988:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36a42426236mr18638097eec.41.1793692853176;
        Tue, 03 Nov 2026 00:00:53 -0800 (PST)
Received: from Garunix (122-58-163-222-fibre.sparkbb.co.nz. [122.58.163.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm37885274eec.4.2026.11.03.00.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:00:52 -0800 (PST)
From: Matthew Ruffell <matthew.ruffell@canonical.com>
To: Waiman Long <longman@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Caron Wills <caron.wills@pulsar.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: [PATCH 4/6] sched/isolation: Drain per-CPU LRU batches when CPUs become isolated
Date: Tue,  3 Nov 2026 20:59:38 +1300
Message-ID: <20261103075940.110308-5-matthew.ruffell@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103075940.110308-1-matthew.ruffell@canonical.com>
References: <20261103075940.110308-1-matthew.ruffell@canonical.com>
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

From: Caron Wills <caron.wills@pulsar.com>

Isolated CPUs no longer batch folios in their per-CPU LRU caches, so
that __lru_add_drain_all() never has to queue work on them. Boot time
isolation (isolcpus=, nohz_full=) takes effect before any folio is
batched, but a cpuset isolated partition can be created at runtime and
the affected CPUs may still hold folios in their batches from before.
Those would linger until the CPU happens to drain locally, and the next
lru_add_drain_all() would fall back to queueing work on the now isolated
CPU, which is exactly what must be avoided.

Drain all batches once from housekeeping_update(), right after the
HK_TYPE_DOMAIN mask has been updated and next to the vmstat and memcg
workqueue flushes that exist for the same reason, so that newly isolated
CPUs start out with empty batches.

Link: https://bugs.launchpad.net/bugs/2165410
Signed-off-by: Caron Wills <caron.wills@pulsar.com>
Signed-off-by: Matthew Ruffell <matthew.ruffell@canonical.com>
---
 kernel/sched/isolation.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 156025ef81b7..17d8171fe97b 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -10,6 +10,7 @@
 #include <linux/sched/isolation.h>
 #include <linux/llist.h>
 #include <linux/pci.h>
+#include <linux/swap.h>
 #include "sched.h"
 
 enum hk_flags {
@@ -149,6 +150,13 @@ int housekeeping_update(struct cpumask *isol_mask)
 	pci_probe_flush_workqueue();
 	mem_cgroup_flush_workqueue();
 	vmstat_flush_workqueue();
+	/*
+	 * Folios batched on the newly isolated CPUs before the update would
+	 * otherwise linger in their per-CPU LRU batches, since isolated CPUs
+	 * stop batching from now on (see lru_batching_bypassed()) and remote
+	 * draining is exactly what must be avoided on them.
+	 */
+	lru_add_drain_all();
 
 	err = workqueue_unbound_housekeeping_update(housekeeping_cpumask(HK_TYPE_DOMAIN));
 	WARN_ON_ONCE(err < 0);
-- 
2.55.0

