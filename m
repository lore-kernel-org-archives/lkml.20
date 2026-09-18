Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8112D1F7B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741949; cv=none; b=DS5YGlJJj4pyfCu2MQ7ly5GcXSxMD1WZJVt57v9veF8HDPOcprX3Wuog02jF9sfesEzbv6e/6yhGjMdsrHJ++9gZBKWKE61s5zj4n5dCq+D71EpPIDqPo7HPWRNGOYfjsg3vEneYwc/ohu8ScPxkmYjTHX7sRHlrSeLn5svOJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741949; c=relaxed/simple;
	bh=QD3PxjCXZ6UJPf0E8x4yo7IEgC7LOe9fpYJLiO251GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mc67wD3jV+haHKbuBL8A+4njnQ8NzhQ5wRcuJFr1QuexhwK/pWZSHMoJ/a/zz3+bPR3iO2m/pKHfUUUc0JVydLYtz2cfMO/dGEn3o80qw6oh1BNqbNdDPadzKr9n/diXnFcMvLKqfE9oJIaN8jB2AmbHOM54sokmgLBEMTtLkGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XulFdTz8; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XulFdTz8"
Received: by mail-oi2-f13.google.com with SMTP id 46e09a7af769-80a71781323so340694a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789741947; x=1790346747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6E7ctxafzLuDLf4HoS6Tx9j17d6jseDqLEP/al0ahus=;
        b=XulFdTz8Q+B5fnHJVuKmSdzT9XulptHj5DveQoJQJX8tINg5TZ9NF5cSJLMdDkJSVa
         RtKuN/Iebk43gbHWfPje8OI8bRcXhrsJROfU0H8tIB+qWD97RCQvNzJNiLfxuvq5XS47
         1aQmS+Qq8xdCe5uzJ2lvd04NwJjNXIho0zQA7A/7r4lS4BHFP3ibcud2SEjc46LOlbbQ
         09uxngZFwCf5ipi3OeMYt1oZ7oc9jHA4fLZTFBSWu4RkMPo3erI8Ff8KmRATsNznBNJ2
         lcvfTYa6UYxF/ChtTiKi8v0BBo7RvIhGCFh6eiMe75F1pPQ1xrP9tA1FnLRHKhEXwxWn
         WDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741947; x=1790346747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6E7ctxafzLuDLf4HoS6Tx9j17d6jseDqLEP/al0ahus=;
        b=sx4wc5M4c3vSHgeVVsj9fSBFG0NBRLgmoMYNPkaEtrroqPJA0ZQlbW1jLKiK0J1wSt
         DYRLrDiptOa+oGsl9JZ+ON2nPs032RHT2VpFbIl0E4yTK9bLou1/mKHsra8twYVgftr0
         YveTxpv7/u77jZGX3FtStOkJ/oQ5JwsE1ssTOWpLtMoNk9KVdEXHy9t3y9niuWWN2ADF
         Pj1SQhIjBYvTU7aohi1ctVO3U8PU7dMOpM5dnnVujBU0/Ss3AToahapTXl4S8Y8vXpyU
         9lCbo01NTFc9UXTRbbDjav6S6TjY8BpFGyEi7sUJU1SnchUXFCES3CTX9oX+oMzEKxvh
         NYlQ==
X-Forwarded-Encrypted: i=1; AKwUvByUTLi0HDEJW1X+VWdJsq1lYMqClQBbC6MWGiG2H5HduILObUh6LRgizvBGrtu5t8WT9Qlg1nP1vAYcEXA=@vger.kernel.org
X-Gm-Message-State: AFuF++kNUh9dtvlamFDOfkinmWbuhYCOywrRvlt2J98Sc4C7TTw1Gxes
	Xbbl1cUjx53JId0ACoM6hfeSxUCoejuuvA3p2zJg7uoDx9vzMgKECSqQvABEJ+7i
X-Gm-Gg: AYBFou2bKhS1lVh9hfY2BcbZj9PiKgwRjHHyUWXQ2hctJ5Y/sRytCxPv+iRMEcKANfZ
	QhUnFMtcBln9al60iMjsrapkqbgEl6hQxhRCD6pt8dcXSCm2P1Qb3CdvQWfYA25CfX7ZXFG2j5p
	ec7KEyFZV0sZxFdy4sJOLXQ6jI/GhB7iY+V5rtkBzQh5eevWVxdslmWrA90c8KXooRXuoUReiT/
	mtBDgBfKa/U+HcLWs6rxbMRmNDwrqxFygNFDefqxbz0yydVPKaAVhB8jRfWoxjq3jYK6toyUiEU
	EcjJdzglpf2ExRc271nJ6Elln6cXrYhWM/wjQr7YT68D3NQCl+cOwTb3qX4vgGxbAfZVpbNKCbY
	IA/YGRBYVajF2g7lrWXrhBHLvZRxY83a5ab1Da9nRpudQywYtJQ6kLBIke+Ljb6Kzrj8H/PJEPa
	IIrB+LRmP/S9iUkUvAJ0d1NZqYJeMfLoWPkHk9pRNGBa0T4mjzOHleJ7d6fIOSBLI=
X-Received: by 2002:a05:6830:6001:b0:7f3:a8ac:45f7 with SMTP id 46e09a7af769-80ddfd69b03mr2915289a34.3.1789741946653;
        Fri, 18 Sep 2026 07:32:26 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e42815ff2sm1615667a34.3.2026.09.18.07.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:32:25 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 1/2] uprobes: Use a dedicated mutex to serialize prepare_uprobe()
Date: Fri, 18 Sep 2026 11:32:08 -0300
Message-ID: <20260918143209.709291-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_uprobe() serializes its callers by taking consumer_rwsem for
writing. That rwsem protects the consumer list, not the instruction
copy.

Give struct uprobe a dedicated prepare_mutex and use it instead.

No functional change.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 kernel/events/uprobes.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 7709ea882477..686585539ebf 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -64,6 +64,7 @@ struct uprobe {
 	refcount_t		ref;
 	struct rw_semaphore	register_rwsem;
 	struct rw_semaphore	consumer_rwsem;
+	struct mutex		prepare_mutex;	/* serializes prepare_uprobe() */
 	struct list_head	pending_list;
 	struct list_head	consumers;
 	struct inode		*inode;		/* Also hold a ref to inode */
@@ -1007,6 +1008,7 @@ static struct uprobe *alloc_uprobe(struct inode *inode, loff_t offset,
 	INIT_LIST_HEAD(&uprobe->consumers);
 	init_rwsem(&uprobe->register_rwsem);
 	init_rwsem(&uprobe->consumer_rwsem);
+	mutex_init(&uprobe->prepare_mutex);
 	RB_CLEAR_NODE(&uprobe->rb_node);
 	refcount_set(&uprobe->ref, 1);
 
@@ -1104,8 +1106,8 @@ static int prepare_uprobe(struct uprobe *uprobe, struct file *file,
 	if (test_bit(UPROBE_COPY_INSN, &uprobe->flags))
 		return ret;
 
-	/* TODO: move this into _register, until then we abuse this sem. */
-	down_write(&uprobe->consumer_rwsem);
+	/* Serialize concurrent prepare_uprobe() calls from uprobe_mmap(). */
+	mutex_lock(&uprobe->prepare_mutex);
 	if (test_bit(UPROBE_COPY_INSN, &uprobe->flags))
 		goto out;
 
@@ -1125,7 +1127,7 @@ static int prepare_uprobe(struct uprobe *uprobe, struct file *file,
 	set_bit(UPROBE_COPY_INSN, &uprobe->flags);
 
  out:
-	up_write(&uprobe->consumer_rwsem);
+	mutex_unlock(&uprobe->prepare_mutex);
 
 	return ret;
 }
-- 
2.51.0

