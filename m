Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F1C4779B0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254323; cv=none; b=bfKRcmHS+Rpy9bzWFxkmnmlYqwJIJdKqY4T3mqzIzcE/4FqBCOOO+QNviYiYZi+FZ318sJzPzxqqElptYLwIQUngmSmY28dNGU2U9AbrKmGSfjkKdI5X5eJwMMRcflhk5ZNb5SwzUbKj/mH1b0sAdoBxG3M6EWekhYpA1rYFxqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254323; c=relaxed/simple;
	bh=S1iHUOWPd31PqafMKmlQFyRGh+cMRyrGzQ729cGmpY4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=UZCday7B9WU+IX46oSfBSQSh1ATcx7Q6EEhJag3eAOsr0L85N+Klw8R+xcZl+pYFQ+JBlRIbipgTd4lnN5Hgp+y1ecQgCCAUHyC/gqIWTFN/BZiw58q6IzEuljnRgPZ7IAWIHkBHUGTh0UwONIrxcpi3kYWRRevo0xT86HrQmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=upBZ369D; arc=none smtp.client-ip=95.215.58.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="upBZ369D"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S1iHUOWPd31PqafMKmlQFyRGh+cMRyrGzQ729cGmpY4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788254319; v=1; x=1788859119;
 b=upBZ369D4W5G1NUKfusbjfLnhI2d3h8sHpKm1o/l1SAc637B9TuivCMr67GYGVrZNkllIWPA
 URcVXA2oy/F36RGIvZ6mtahVGHJuTdcTPjQcszuCTGX5Pc4dirlpaOEut5MNtm4sNuPu4UXY36D
 yHxJ5pVTDcjcAHTMEh/60Nsc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3cdf004cd7262c3c;
	Tue, 01 Sep 2026 09:18:39 +0000
X-Mizu-Trace-ID: 3cdf004cd7262c3c
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: aahringo@redhat.com,
	teigland@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qiang.zhang@linux.dev
Subject: [PATCH] dlm: wait for outstanding SRCU callbacks to complete in exit paths
Date: Tue,  1 Sep 2026 17:18:36 +0800
Message-Id: <20260901091836.16906-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The dlm_lowcomms_exit() and dlm_midcomms_exit() iterate over the
srcu protected connection and node hash tables and hand each
element to call_srcu() for deferred freeing (connection_release()
and midcomms_node_release()). call_srcu() is asynchronous: the
callbacks are invoked only after an SRCU grace period, which may
happen after the exit function has already returned.

These exit functions are reached from exit_dlm() on module unload.
Once they return, module teardown continues and the module text
may be unloaded while call_srcu() callbacks are still pending. When
such a callback finally runs, it executes freed module code and
touches the static SRCU domains that are being torn down, resulting
in a use-after-free.

Add an srcu_barrier() after the call_srcu() loop in each exit function
to wait for all outstanding callbacks of the respective SRCU domain to
complete before returning. In dlm_midcomms_exit() the barrier is issued
before dlm_lowcomms_exit() so that node callbacks are drained prior to
tearing down the lower layer.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 fs/dlm/lowcomms.c | 1 +
 fs/dlm/midcomms.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 2aff1c7c17de..ea8353c4638d 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1984,4 +1984,5 @@ void dlm_lowcomms_exit(void)
 		}
 	}
 	srcu_read_unlock(&connections_srcu, idx);
+	srcu_barrier(&connections_srcu);
 }
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 8964164600d2..045431524494 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1178,6 +1178,7 @@ void dlm_midcomms_exit(void)
 		}
 	}
 	srcu_read_unlock(&nodes_srcu, idx);
+	srcu_barrier(&nodes_srcu);
 
 	dlm_lowcomms_exit();
 }
-- 
2.17.1

