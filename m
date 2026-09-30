Received: from mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150C53AE71E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746597; cv=none; b=S1dwZ72IRfpJC3m5Om/jjE1NPhHMWhuf+Vwzb1JTutGWbZY067jfqDLBkc1Shr1XWmjO0uFVZ7bxzDj9vGPYAgTUM+EumwyAkDdo9fnRpsg1u9t7Y6V03HlcbJ/tVMPj8KbhcHtwO/4ldGS0QB6UwS45V+kHFeYSM6YdyqVsDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746597; c=relaxed/simple;
	bh=weGHAUr2l8CJamIsh5doUiVjsBwz2X9koep9k05v1c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6IJGQ8KfCxTwchADTn127appvlrxmRqZNzFtz5gTo7BeSp/vT1W7i1eyUHWJFnJdEchvIhL8CXdkahbbljfCM4q+v5tA/pby+YQpyZ4kTtwV6E2RW8voLoSeF2tYkKvWHG1sfnBOhvBnenVbIBb0b/xK1g9oHCbMK+R4C5ubbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xZEqCPwU; arc=none smtp.client-ip=95.215.58.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xZEqCPwU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=weGHAUr2l8CJamIsh5doUiVjsBwz2X9koep9k05v1c4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790746594; v=1; x=1791351394;
 b=xZEqCPwUGcBMH0ehckWl17hhdy2EWFaHZQtvQ91l8KoJHqCX4vgJvVErKhgGdbAi7K8xPwFr
 f6NJ8fevID2A56oCNeiOH19LnHILPJhWSOh4O5CcG6u3jWvTfYWVN6qS3ugLppr4xOezvSxHIYL
 mLnOi6G78hD3bOmHROEaPlqg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67e0a92a6b2b4068;
	Wed, 30 Sep 2026 05:36:32 +0000
X-Mizu-Trace-ID: 67e0a92a6b2b4068
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: Naveen N Rao <naveen@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ingo Molnar <mingo@elte.hu>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH] kprobes: Skip disarmed probes when checking optkprobe overlap
Date: Wed, 30 Sep 2026 13:36:18 +0800
Message-ID: <20260930053618.104498-1-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On x86, an optkprobe at A replaces five bytes with a jump. If a disabled
probe B is at A+2, get_optimized_kprobe() stops at B when arming a new
probe C at A+4. It leaves A optimized:

              A    A+1  A+2  A+3  A+4
  A's jump  | e9 | d0 | d1 | d2 | d3 |
  after C   | e9 | d0 | d1 | d2 | cc |

The INT3 for C overwrites the last byte of A's jump displacement, so
execution can jump to the wrong address. B can have prepared optinsns
while disarmed, but has no jump to unoptimize.

Continue past disarmed and unprepared probes to find the active optimized
probe before arming a probe in its jump.

Fixes: afd66255b9a4 ("kprobes: Introduce kprobes jump optimization")
Cc: stable@vger.kernel.org
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/kprobes.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..e6f6e18fa1b5 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -495,14 +495,16 @@ static bool kprobe_queued(struct kprobe *p)
 static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 {
 	int i;
-	struct kprobe *p = NULL;
+	struct kprobe *p;
 	struct optimized_kprobe *op;
 
 	/* Don't check i == 0, since that is a breakpoint case. */
-	for (i = 1; !p && i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
+	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++) {
 		p = get_kprobe(addr - i);
+		/* A disabled probe can have prepared, but inactive, optinsns. */
+		if (!p || !kprobe_optready(p) || kprobe_disarmed(p))
+			continue;
 
-	if (p && kprobe_optready(p)) {
 		op = container_of(p, struct optimized_kprobe, kp);
 		if (arch_within_optimized_kprobe(op, addr))
 			return p;
-- 
2.55.0

