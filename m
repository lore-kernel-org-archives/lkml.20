Received: from mta1.migadu.com (out-93.mta1.migadu.com [95.215.58.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35E3C3BEE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628103; cv=none; b=XU46jDx5VeNcv1cY/GcmaSD5xAlxn+HUp10QDEc6iQ8vgnILIOUASQA/+doznuw49xmRK5MIgACpkXfoa/bHhLNbvpTB713VVJe881eAT567co/HHrnISg/A52FXDJcPddnH99smUQw3/ewrKtIGuzyFud+I/qpAGReAi4i32eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628103; c=relaxed/simple;
	bh=wdQY6e4IT/vt1yJe9rU8b6pN7UZvQ4C3jvejp4hdFg4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=W4gxSoHzViG0r0Cu7krVkFa3WK9Znu6oUMtj91gxFvFNZy/ZbhgvoqlnlA5z51wbWctgh69XISmW9G79OoUI2dN/sTwGPP7JHwTVuw4soQ8OavH7Ier3ADCWrBLTyz9uIMCHZoJDlPXKli7P3yaBC1Ud7wOY9eoThEU+9xNP+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s+PZFvs1; arc=none smtp.client-ip=95.215.58.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s+PZFvs1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wdQY6e4IT/vt1yJe9rU8b6pN7UZvQ4C3jvejp4hdFg4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791628098; v=1; x=1792232898;
 b=s+PZFvs1d79IZ1VRvaUA6z89biqtKBZHJCmcLpeYmMoM0T5BtxczYSvpUi/Utl0+8GIoWTgI
 dswP4FWOTbfLLDlF2flils5KW3VJAnTqU20S3PlFAZWHVuP77fW2pugJrs9JZJlwyUeKynBTR4w
 49GB8AaDDSZcRv+/mRWvRzaE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7bc3b0fbc2f514a5;
	Sat, 10 Oct 2026 10:28:18 +0000
X-Mizu-Trace-ID: 7bc3b0fbc2f514a5
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	urezki@gmail.com,
	boqun@kernel.org
Cc: qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] doc: Update recent SRCU API additions to whatisRCU.rst
Date: Sat, 10 Oct 2026 18:28:13 +0800
Message-Id: <20261010102813.25460-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The commit 'dab06d6f9379 ("srcutree: Add an atomic Tree SRCU")'
introduces some new APIs:

srcu_read_lock_atomic
srcu_read_unlock_atomic
synchronize_srcu_atomic
DEFINE_SRCU_ATOMIC
DEFINE_STATIC_SRCU_ATOMIC
init_srcu_struct_atomic

This commit therefore update thems to whatisRCU.rst.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 Documentation/RCU/whatisRCU.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
index e6767baff2d3..75c50f2f6d79 100644
--- a/Documentation/RCU/whatisRCU.rst
+++ b/Documentation/RCU/whatisRCU.rst
@@ -1209,11 +1209,13 @@ SRCU::
 	srcu_read_lock_nmisafe		start_poll_synchronize_srcu
 	srcu_read_unlock_nmisafe	start_poll_synchronize_srcu_expedited
 	srcu_read_lock_notrace		poll_state_synchronize_srcu
-	srcu_read_unlock_notrace
+	srcu_read_unlock_notrace	synchronize_srcu_atomic
 	srcu_down_read
 	srcu_up_read
 	srcu_down_read_fast
 	srcu_up_read_fast
+	srcu_read_lock_atomic
+	srcu_read_unlock_atomic
 	guard(srcu)()
 	scoped_guard(srcu)
 	srcu_read_lock_held
@@ -1229,8 +1231,11 @@ SRCU: Initialization/cleanup/ordering::
 	DEFINE_STATIC_SRCU
 	DEFINE_SRCU_FAST        // for srcu_read_lock_fast() and friends
 	DEFINE_STATIC_SRCU_FAST // for srcu_read_lock_fast() and friends
+	DEFINE_SRCU_ATOMIC
+	DEFINE_STATIC_SRCU_ATOMIC
 	init_srcu_struct
 	init_srcu_struct_fast
+	init_srcu_struct_atomic
 	cleanup_srcu_struct
 	smp_mb__after_srcu_read_unlock
 
-- 
2.17.1

