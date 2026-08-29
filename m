Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B2418357
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788035256; cv=none; b=Tu7e/H7gyJXvMMWsPt0X4H3I2j5jZF6LfF41p7PEp5RDQRkrk5BZnlUL3J6t7tc/Zudq+WggWVf1CAfWAH/jpFRU/ST/nNM43wLmZZ+KxCCzONvYiTYfsPWSWbVHqqeViYGBt+AP5dBg2XrHnSLD5VH5krPDch4dAfBeki+akS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788035256; c=relaxed/simple;
	bh=xZq+O2bfpzT3ZLMd1ciNqB8y6E9sBNHT3sjah+CGKeU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WqIk+7a1sLodDY+hecqX8bN2NlCWxI70rvkVdZr2UMBIrBOBUQyWYKV4Q8bzlHjYrShoUGB8uh8aaUqnFBr+rELVXZXqUwYFi8ekJXWzb9hzOAzWyQLmX+2MAkgrmAp1f14IHE8wSa+oJer/srQgtCNqdFLtqXhxafojOF6ZFG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (91.78.26.147) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 29 Aug
 2026 23:27:20 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
	<frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] tick/sched: check skew_tick kernel parameter's validity
Date: Sat, 29 Aug 2026 23:25:35 +0300
Message-ID: <20260829202535.46470-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

In skew_tick(), the result of get_option() call is ignored, so even if a
value of the skew_tick kernel parameter was not specified (or specified
as a list or range), the kernel won't complain. Add the missing check...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
The patch is against the timers/nohz branch of the tip.git repo...

 kernel/time/tick-sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c1ee0b256445..34ceccdd49b5 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1483,7 +1483,8 @@ static int sched_skew_tick;
 
 static int __init skew_tick(char *str)
 {
-	get_option(&str, &sched_skew_tick);
+	if (get_option(&str, &sched_skew_tick) != 1)
+		return -EINVAL;
 
 	return 0;
 }
-- 
2.55.0
