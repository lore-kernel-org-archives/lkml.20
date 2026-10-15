Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E623A99F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067670; cv=none; b=VFYTy3AWrzPjEuSO/PtnEfhgRgXRtYx3I13LUvRlZVsImC1ccIAFT6NxIdzM0Tp6IdUrVOEi/zY3q/snpuZ3vpNooVnWq3aHOLiJ2V8M2rRuwUz6kV1IwuO54iGrnsnFtGKr7+Kc7rPPNO6Ee9R3s3Fsk655QLKoq8MOYDzmOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067670; c=relaxed/simple;
	bh=6RYCJTgmZtkhTJF0IB6+IuC6pGbjy5IhOnHcNqjkuBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ulm5g/ViKdddCtFrvIf9PV90z0+f1AJS8YiBFuTZF1UJ9leHhFIiEZa/YNztCjTivgPNoDe5a28DSL+L4JRJFpJ8FzwqqthdmjnLuScLH/zPqUBnCe7oSWTXW9CDxjNDF9Zqw5hl5QFzUH702dW45bUrNsBnkNXi49uNvXlV3zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bes+hyL9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bes+hyL9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1318380a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792067669; x=1792672469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MuIQxTwfSJeHtZkn09gsG33Ccv5vPWVkF/kC4waNbbY=;
        b=Bes+hyL9Gkg2QnWiLjSO7paxXpTj8q8o+7xp0hD4eT5TyitpciP5VjBUkruqGr8qnd
         AUp7tKX0/tQmzet2x+L5+1nejaeSgltV9+JQGzrZt8hM60yGd8woKFFoByYE3+R6T+jg
         c3CQJD30XJZkFlMoxBSVzRrtkBznVTgE3M9AU7g7MI8LEUcpKMS5WQ/jq2/Gfaj8s7Uy
         kIKua/ipYWIPcc/AqFO4iQsM1Sdz6Qdz42z2bXMl2mk7eKP7zWIa/LNY8+xkdkPboy8Y
         6NfaDYgA79uzWwRLExul81/0dLyM9lYnSv5+ZhWOA2jGyj8JsS+RoJ9PhsuUj4AKk7oM
         k0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067669; x=1792672469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuIQxTwfSJeHtZkn09gsG33Ccv5vPWVkF/kC4waNbbY=;
        b=1rEVG8wDLL0idVUdBr2utmcIFwrWlYGSPqT3OTxy8bRP9o/y4GBKutQdsGNQwDog7d
         uyRTguAOMH0ml7YUaQWTjg9q224dpl4m69P35sBChHJqSphftImLY4fsrTiY+oj4aDOC
         y14mgDD78AoS5atX7RaxUCh0TE+TkL9unXSMM+4LBBLdjRl3ZOJjSX5dLg1kFcAinskh
         CsKZPNmxFCVUOypiNeX+0GCkDCe9CaSOE3bLHZqK7EnjQpp82q/U4lrrAFZ/TAxbFckx
         N5q1hKUgMXWvgZMPlwvuqji7FOkX046/mY9Y6WdGAbLyZp3XTeZJZcZRowv2BQARfpor
         HHbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgivwc9LJyDjSzgLqO4jYe7xzbyA8zrUcRiy0ay4LuvPEvqDzK3iScnVGLBb8nW8JpZOARaL+42+S0als=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8qBkvGvlo8tBib5a+iFqBQEceiluIAsqDOEruY7+CBuKCZjWG
	xN9NAlqKUsrpJnzt3i38VyWbR47XUXiobtR21bPtiyOUFsSSBMUuJg2v
X-Gm-Gg: AYBFou2Hu/gkCcoslSRsLFh72fKyKCpXQc4SdldYSucmwzDOYAW5j45dxtlB/mP/PWg
	baQCReQ34WGZbD8HW4S+MjrLgaflUX0aXZ/83qgMFqXjhui6fk9WNwKlnE4KcfQz7OXCV3qmMXv
	dC81OXq6qJewdP/pkfLeFfdzk8v72kRwhQs2xvPoNvXy5PyjXUcdwFbR8+2LIEOAEyDPT/+jPXN
	RlIhc+8QrL/z9IHLai8zDi8ECk/S7ghayPwGEr0qnbLCTfSsFSETMpCBjpHukkhQhzwxtJ8AucV
	CU3Od54bgFddJyJQGHOlRHz3sGJXQ0SAXyts/y72YHOoc6+ns1tmuyu7BRZcgUoTewpgtxn7JRV
	iSEBy7evRHLybovisj8ThFk45OZyfFL7COqGC9txjIoFtUTggHPLjLn6bf1fHeMBrzEnSsyB3vv
	3p4wLcqCDoR8aNDww5o+vZrMSy00MZBlTb7JtO97CG++WLKO7uy0tA/QFKUgPirrro7mXVGcOxc
	dQmbbwCA3Y=
X-Received: by 2002:a17:90b:314d:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3ac7556a42cmr3796079a91.44.1792067668726;
        Thu, 15 Oct 2026 05:34:28 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9444a0c6sm4714146a91.11.2026.10.15.05.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:34:28 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	elver@google.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] perf/core: Close owner-list publication race with remove-on-exec
Date: Thu, 15 Oct 2026 21:34:16 +0900
Message-ID: <20261015123416.795008-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

perf_event_open() makes a user event visible in the target context before
adding owner_entry to the opener's perf_event_list.  For a remote task, it
also releases exec_update_lock before adding the list node.

A concurrent target exec can therefore process a remove_on_exec event in
this interval.  perf_remove_from_owner() sees the published non-NULL owner
and calls list_del_init() on the zero-allocated, but not initialized,
owner_entry.  DEBUG_LIST reports a NULL-link list corruption and can panic
the kernel.

If list corruption reporting is non-fatal, list_del_init() initializes the
node and clears the owner.  The open path then adds the ownerless event to
the opener's list.  Closing the returned file descriptor frees the event
while it remains linked, and the next owner-list insertion accesses the
freed object.

Initialize owner_entry when the event is allocated.  After taking the
opener's perf_event_mutex, add the node only if the exec side has not
cleared the owner.  The existing mutex then makes both orders safe: the
open side either publishes the list node before exec removes it, or skips
the late add after exec clears the owner.

An unprivileged remote-task reproducer triggered the NULL-link panic on an
unmodified hardened kernel.  With corruption reporting made non-fatal, the
same reproducer triggered a KASAN use-after-free in the next owner-list
insertion.  The patched hardened kernel completed 1,264,540 remote opens
during 60 seconds of concurrent exec without a list diagnostic or panic.

Fixes: 2e498d0a74e5 ("perf: Add support for event removal on exec")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 kernel/events/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7846d70be57f6c..5e191757a08ccc 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13382,6 +13382,7 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	INIT_LIST_HEAD(&event->rb_entry);
 	INIT_LIST_HEAD(&event->active_entry);
 	INIT_LIST_HEAD(&event->addr_filters.list);
+	INIT_LIST_HEAD(&event->owner_entry);
 	INIT_HLIST_NODE(&event->hlist_entry);
 	INIT_LIST_HEAD(&event->pmu_list);
 
@@ -14252,7 +14253,8 @@ SYSCALL_DEFINE5(perf_event_open,
 	}
 
 	mutex_lock(&current->perf_event_mutex);
-	list_add_tail(&event->owner_entry, &current->perf_event_list);
+	if (event->owner)
+		list_add_tail(&event->owner_entry, &current->perf_event_list);
 	mutex_unlock(&current->perf_event_mutex);
 
 	/*

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
