Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D129BD91
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787879217; cv=none; b=tuldO+4jTpmq1sTaqB9ppbArq4WcZl21ipWsCSh4M7afmxK+lZoQ/hKR3ll3uTNgnc5+iDWyrBqYcMJGfvvF4PCQW7Ss4aGzUXrc3rttKYl9MolV4CQTdhUoK794UV4pJJyIGLIHuJC3sr3SVvTRWTfykPTGvdEW/APpvzorJD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787879217; c=relaxed/simple;
	bh=i/XclKP4oHi0aARsSHChuDFqmZPSwMeKOoGf3GbpB8U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I8LRAB4ls3sFB3O0aIHJOud6GFOZlCmwHItRDqE064opE+shyLzuIeAhn67UVfIUzRT8dowOwf1aYghLv089QfDxS2iG+wJ3TtJh2emzBNtWM5zUokbnq9di6czXwZ3yADR8bXYxbb0Xjzoft/xxmlXRfqGhNbDfrqRiDadFLe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bcc0cde8a27c11f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:32920df2-0403-42c0-9ffa-df41d57cfe1c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:03a9b5c1672d62359fd3d9ec8d7c2719,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bcc0cde8a27c11f19a56ed5b684f684d-20260828
X-User: huangbing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangbing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1400096879; Fri, 28 Aug 2026 09:06:45 +0800
From: Bing Huang <huangbing@kylinos.cn>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mel Gorman <mgorman@suse.de>
Cc: Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kernel@vger.kernel.org,
	Bing Huang <huangbing@kylinos.cn>
Subject: [RESEND PATCH v2] init/Kconfig: Move NUMA_BALANCING_DEFAULT_ENABLED next to NUMA_BALANCING
Date: Fri, 28 Aug 2026 09:06:41 +0800
Message-Id: <20260828010641.21142-1-huangbing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NUMA_BALANCING_DEFAULT_ENABLED config option is semantically
related to NUMA_BALANCING. Move it directly after its parent option
so they are grouped together, improving readability.

As a side effect, the prompt for this option will now be indented
below that of NUMA_BALANCING in menuconfig, rendered as part of its
submenu.

No functional change beyond the visual grouping.

Signed-off-by: Bing Huang <huangbing@kylinos.cn>
Reviewed-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
---
v2:
- Updated commit message to note menuconfig indentation side effect
  (suggested by Julian Braha)

 init/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 53178ea4bc93..68f259fea239 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1019,6 +1019,14 @@ config NUMA_BALANCING
 
 	  This system will be inactive on UMA systems.
 
+config NUMA_BALANCING_DEFAULT_ENABLED
+	bool "Automatically enable NUMA aware memory/task placement"
+	default y
+	depends on NUMA_BALANCING
+	help
+	  If set, automatic NUMA balancing will be enabled if running on a NUMA
+	  machine.
+
 config SCHED_CACHE
 	bool "Cache aware load balance"
 	default y
@@ -1030,14 +1038,6 @@ config SCHED_CACHE
 	  resources within the same cache domain, reducing cache misses and
 	  lowering data access latency.
 
-config NUMA_BALANCING_DEFAULT_ENABLED
-	bool "Automatically enable NUMA aware memory/task placement"
-	default y
-	depends on NUMA_BALANCING
-	help
-	  If set, automatic NUMA balancing will be enabled if running on a NUMA
-	  machine.
-
 config SLAB_OBJ_EXT
 	bool
 
-- 
2.25.1

