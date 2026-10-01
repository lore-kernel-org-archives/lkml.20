Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444E448A8C6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886315; cv=none; b=WI0d2iSgZuAW2smuFR3Ib9C1eLX4dMkl5Ln2jLUhi1RCf7D0BePt0/kRVCwSTogQ22jXgFTEUUksF8tiyYRZCSYOFYZcP389FFb4YLEJ14prAbHM8zCLWB8WlhwAJ4HyUgS9j4pLruXetbA0LEvkM19s2POVkYp6t2k/ChAyh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886315; c=relaxed/simple;
	bh=izI7nlDu/GgmKYM8STf1Z2KFNima1MkBB3BxOuizcA8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LeN74sXtyDn7+kJTZ1gepzzj456YktY+6RDVwiuHAIE01rpNSSHftYTK0JRCezOX4bGGf9yVfqdxz5QVoQ7q1vWTJRCLhfts+pPZS6aVTWRwdPPiDqrZFBr0iZEFel0J1D7aZXCC862wRFCbIkA1W1hKVkxyhdIDCTyWCGEcyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (91.79.16.162) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 1 Oct 2026
 23:25:01 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
	<frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] tick/sched: make kernel parameter skew_tick boolean
Date: Thu, 1 Oct 2026 23:24:09 +0300
Message-ID: <20261001202417.73273-1-s.shtylyov@auroraos.dev>
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

The kernel parameter skew_tick requires an integer value, despite being
boolean in nature. Convert the static variable sched_skew_tick to *bool*
(while at it, annotate it as __ro_after_init) and thus use kstrtobool()
to parse the parameter's value (the values 0 and 1 should keep working
as before); also stop ignoring the value parsing errors as it happened
before (when skew_tick() always returned 0)...

Found by Linux Verification Center (linuxtesting.org) with the Svace
static analysis tool.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
The patch is against the timers/nohz branch of the tip.git repo.

 kernel/time/tick-sched.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index a7893a079a83..1083eede34fc 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1475,13 +1475,11 @@ void tick_irq_enter(void)
 	tick_nohz_irq_enter();
 }
 
-static int sched_skew_tick;
+static bool sched_skew_tick __ro_after_init;
 
 static int __init skew_tick(char *str)
 {
-	get_option(&str, &sched_skew_tick);
-
-	return 0;
+	return kstrtobool(str, &sched_skew_tick);
 }
 early_param("skew_tick", skew_tick);
 
-- 
2.55.0
