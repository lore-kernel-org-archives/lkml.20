Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB28377010
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789946207; cv=none; b=rpt8/eoNNel6qe++6ajRwUt0EZ4UXegT2BebGSZAejpVEC89cNUMGtJlwHdtNn7xvc1CfbZko3HDLFjKwqJFJ8LpYPdkMHIt1Z+5E5kaEUSZjrUDLJnqYYL0N93gul9gmNDMDnmsEe2M3GV4wS9cX6k0KSKfzVP1gT/BBepqa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789946207; c=relaxed/simple;
	bh=zFua+0WqQmguW9OMTToCtrlq7C8Bc0rUMKyYFFe4nRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXA1ASQVzle75PabBQ5mK6l8OfZNjLbVgXJ3Ac3D8MOhWgmwwf+SFW6i4nOV8aLX4mX9JM/2u/A+12j/kcHivBIfpdCx5CO9TmEPFqFPJeQZejLh4uQe2SURiJSccLok40UCnXoXq0/R7fcUJMGghDD8btsDsdSxqF9j3cO4euA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg8zXIgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg8zXIgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40901F000FF;
	Sun, 20 Sep 2026 23:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789946206;
	bh=WumCDFm1fKLkdQHB40LA6OAQzssO9kt67pTn+mLFieA=;
	h=From:To:Cc:Subject:Date;
	b=kg8zXIgMvFzagN0RBSNdv+woRwlfQjZ5OFMKWXt+fJrfkkIE54IGkPSg87Cb52L8G
	 REXP5UE9/wUxwrXdcrZJmLJ34+C3TTz+3FCZ49k8sEsg7P5e7oehsz5Ga4omPgJEPF
	 Ho+Gj7ns17PIDb/OvKNIYkpFDwBIcP+v+VDHsM0/GT5S70T4SKqglE/XkcrPS3ucDC
	 GvH+hIshPFY+sTBIAHkQc9BedFH34qh/bmiyOLv0R6MUlj62iqb4xJMb4g1Hw8Kb00
	 3IEBURulfY3jNVNY6peh+qkXnpLTxoNqX6iw7Vxb/OtUYtXsIg6TmX0Rnrjmcon+jn
	 XI86XnRgis2ew==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] perf/core: Fix a refcount leak in attach_perf_ctx_data()
Date: Sun, 20 Sep 2026 16:16:39 -0700
Message-ID: <20260920231639.11910-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The attach_perf_ctx_data() can race on global and !global cases.  The
global case is protected by global_ctx_data_rwsem and shares a single
reference count using perf_ctx_data.global field.

But when it races with !global case, it may miss to set the global field
and result in a reference count leak.

 CPU1                              CPU2
 ----------------------------------------------------------------
 attach_task_ctx_data(global=1)    attach_task_ctx_data(global=0)
   cd1 = alloc_perf_ctx_data()       cd2 = alloc_perf_ctx_data()
                                       try_cmpxchg() // ok
                                       // task->perf_ctx_data = cd2

     try_cmpxchg()            // fail; old = cd2; global = 0
     refcount_inc_not_zero()  // cd2->refcount++;
     free_perf_ctx_data()     // cd1

Then later detach_global_ctx_data() will see the data but it's not
marked as global, so it won't call detach_task_ctx_data().

Fixes: 506e64e710ff ("perf: attach/detach PMU specific data")
Assisted-by: Sashiko.dev:Gemini-3.1-pro
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 kernel/events/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index db7b76d6b68aa55d..e180134bad5e0ae3 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5454,6 +5454,8 @@ attach_task_ctx_data(struct task_struct *task, struct kmem_cache *ctx_cache,
 		}
 
 		if (refcount_inc_not_zero(&old->refcount)) {
+			if (global)
+				old->global = true;
 			free_perf_ctx_data(cd); /* unused */
 			return 0;
 		}
-- 
2.55.0

