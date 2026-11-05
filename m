Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901041;
	b=nA+OL6uXt6MfCarTH77gYeXT6RNBztG+v+946wBR5LI3eNkoNsajBcBPnrctiXxXF0fa
	 F6XwScT+dU1jFBWbrerrPue00zRtSCpZnJYyfnU548C8ep9BidPlNHY9wycgqK3wFC/85
	 pFkNQdyPn52deLUswb14vex6GLMoKgSTwuiXH62COLUddHyxMEl2vazgScDb5rHpG/hpZ
	 4zTGviQa6OEGyWYHozZhUsxIKm7TeAB8AXj+N3yc5KKy1ku0RtHdRcuMDEtIsjDKZbLg9
	 QBubNhtGSdmlwED869wux3f13KLDiS23a6HhpEkM66UXn4NopTh3tugpj/X3sifUIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901041;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kfri5xV9wlanZGjO8cNWzQ4yzQwShWrO5m2zeFlY9ek=;
	b=BV35rCmP3vvMoNIqoP+JJBMBNCUlCTHRhJ4LbMkkjhjdGp2NF+8tnVAw+F1ea7r9fWvQ
	 pAJzAOEF8gTaR2NeGUSKJaNo5IB97CkoG9nW+IrUmmMi7y6CR4SnLqPPRt9IrNL7/Baw4
	 KIKcong0eryQ3vciTFTdUG5fOiQb/lKTcwfwDeM82gboNqL82GnhObsVsrdtpDKpvZiVT
	 Y7n4Lld91a9sna9pJpv6gOkaxipJO8XvOjB3tW5e1/eHn4ZhEAvSAMvHoCADDBnMByuFV
	 7cqOAOUyJ+w+LNmh76mL3pq5BF0/4T2ucPhId3ktKkSFuQfKUviDmKCj4hTwa1Nf62w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hikRLBJI;
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36FB606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hikRLBJI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X8Jh5EH8xL3BV+TF+inqe7PXc7xM9UMIAqG2HCny/8k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793901039; v=1; x=1794505839;
 b=hikRLBJIeXTOmiXBgU6MiyxPuEBze70t6o9EQ09JOyMdI7mVbs6Mfe3DkWUczyjxQORscn+8
 4/tFed2q756MXrHZvxZeXLPcBg3Vj3gRZouTHg+QnZ1oYKo0mbbj4eybgxJnDfVNyHq5ny7JhtN
 h7lJnYasJHmcdQXG7Oa52hlw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1a99e983495ad7b3;
	Thu, 05 Nov 2026 17:50:39 +0000
X-Mizu-Trace-ID: 1a99e983495ad7b3
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v8 10/14] rv: Add tlob model DOT file
Date: Fri,  6 Nov 2026 01:49:10 +0800
Message-Id: <915c21a8b25b42306f95fb8dfcaeee283d993c49.1793900349.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Add the Graphviz DOT specification of the tlob hybrid automaton to
tools/verification/models/.

The model has four states (stopped, running, waiting, sleeping) and six
events (start, stop, sleep, preempt, wakeup, switch_in).  A single clock
invariant, clk_elapsed < BUDGET_NS(), holds in running, waiting and
sleeping; stopped has no invariant, hence no timer.

wakeup is a self-loop on running and waiting: a task that is already
queued can still be the target of a traced wakeup, either by waking
itself or through ttwu_runnable() while preempted, and neither case ends
the budget window.  stopped takes every scheduler event as a self-loop,
so a task keeps going through the scheduler between windows.

Suggested-by: Gabriele Monaco <gmonaco@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 tools/verification/models/tlob.dot | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 tools/verification/models/tlob.dot

diff --git a/tools/verification/models/tlob.dot b/tools/verification/models/tlob.dot
new file mode 100644
index 000000000000..021a4d823548
--- /dev/null
+++ b/tools/verification/models/tlob.dot
@@ -0,0 +1,27 @@
+digraph state_automaton {
+	center = true;
+	size = "7,11";
+	{node [shape = plaintext, style=invis, label=""] "__init_stopped"};
+	{node [shape = plaintext] "running"};
+	{node [shape = plaintext] "waiting"};
+	{node [shape = plaintext] "sleeping"};
+	{node [shape = ellipse] "stopped"};
+	"__init_stopped" -> "stopped";
+	"running"  [label = "running\nclk_elapsed <= BUDGET_NS()"];
+	"waiting"  [label = "waiting\nclk_elapsed <= BUDGET_NS()"];
+	"sleeping" [label = "sleeping\nclk_elapsed <= BUDGET_NS()"];
+	"stopped"  [label = "stopped", color = green3];
+	"running"  -> "sleeping" [ label = "sleep" ];
+	"running"  -> "waiting"  [ label = "preempt" ];
+	"running"  -> "running"  [ label = "wakeup" ];
+	"waiting"  -> "running"  [ label = "switch_in" ];
+	"waiting"  -> "waiting"  [ label = "wakeup" ];
+	"sleeping" -> "waiting"  [ label = "wakeup" ];
+	"running"  -> "stopped"  [ label = "stop" ];
+	"stopped"  -> "running"  [ label = "start;reset(clk_elapsed)" ];
+	"stopped"  -> "stopped"  [ label = "preempt\nsleep\nswitch_in\nwakeup" ];
+	{ rank = min ;
+		"__init_stopped";
+		"stopped";
+	}
+}
-- 
2.25.1

