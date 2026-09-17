Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27643CD8BF;
	Thu, 17 Sep 2026 23:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688815; cv=none; b=jCuIEspMZPXqSJLvopcJHtg2oxbMvfU2aZmaxCCjbFCjqmC6po6XTfsjjh50QUK5OazPX7fZ9WK4W9xMEVYNGfmiGGznutah4qpEROcmkMjYTqFfVRI3tKNLjMsyP5KXgXgbFqwwI3I0YG8Q4GjSYBJPXdMrYa5GtNNVIOKb2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688815; c=relaxed/simple;
	bh=3Qtb2MNOmRwJ2Ei/olRj3LhnFV0DH/aL6UWUuaKYPFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgQQ0M++siLDoIN4LedwkCjC9GfQRIPDkU5w6t7n81ST3x4vKD2ge9aILibwUCZtsKmSij9AbpZuMoJO/8OiVbkjkgYUWOkSuJw14D91wOqADxM2hlr08ZQftioL0SeUUE/x47AlX0wiwDi1Aqm5/Hk5YZliN7/yqdkTrC3/vXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=VhMFhwoD; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="VhMFhwoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1789677806;
	bh=3Qtb2MNOmRwJ2Ei/olRj3LhnFV0DH/aL6UWUuaKYPFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VhMFhwoDiEarMVP9Imvr/F+4JOvqdPFPyznTfMnLST4xsBufJZU5l9YKz8AbF8C08
	 2/pPRBoagi+bqHE1203nT34s0dyIeFq82HdRTBPrgYP0YoSRACv8+4hrkLbuCXGo4U
	 GuTF/tc9/dx3BJo20bYggMePhEYnwjGC43keGceM=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 713994027F;
	Thu, 17 Sep 2026 13:43:26 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Thu, 17 Sep 2026 13:43:24 -0700
Subject: [RFC PATCH v2 1/2] sched: Document WF_SYNC wakeup placement
 semantics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-sched-wf-sync-doc-v2-1-6d1f107c0596@gentwo.org>
References: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
In-Reply-To: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
 Christopher Lameter <clameter@amperecomputing.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789677805; l=4087;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=3Qtb2MNOmRwJ2Ei/olRj3LhnFV0DH/aL6UWUuaKYPFE=;
 b=UgVnqpJxzkzmRqWgP8WyOOVqveVi4jwB6BC/AnA6bSoftng0LDYdqEBED+eiJM+8zK4GfjQAf
 oXnpTvZfPhUDniQPWCJkXGCfqt28kTZj6eipsXUjBnos5TRQwO9uuWt
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

WF_SYNC is supplied by callers that expect the waker to schedule away
soon. The fair scheduler can use it as a placement and preemption hint,
but its semantics are not documented.

Document the stable fair-class WF_SYNC semantics. WF_SYNC is advisory:
it can influence placement and preemption, but does not guarantee CPU
locality, avoidance of migration, or immediate wakee preemption.

This documents existing behavior only. It does not establish a new
WF_SYNC placement policy.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
 Documentation/scheduler/index.rst               |  1 +
 Documentation/scheduler/sched-wake-affinity.rst | 67 +++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 17ce8d76befc1bb1dc289e9243bdca98c9ccb172..ac95c79617fd2c03564ea4a9dad362091b9d1b86 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -14,6 +14,7 @@ Scheduler
     sched-design-CFS
     sched-eevdf
     sched-domains
+    sched-wake-affinity
     sched-capacity
     sched-energy
     schedutil
diff --git a/Documentation/scheduler/sched-wake-affinity.rst b/Documentation/scheduler/sched-wake-affinity.rst
new file mode 100644
index 0000000000000000000000000000000000000000..dd82b739bb1191db57d4006a38e1ac86b614f042
--- /dev/null
+++ b/Documentation/scheduler/sched-wake-affinity.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+WF_SYNC Wakeup Semantics
+=========================
+
+WF_SYNC is a wakeup flag supplied by callers that expect the waking task
+to schedule away soon after waking another task. It is a scheduler hint,
+not a CPU-placement request.
+
+The synchronous waitqueue helpers pass WF_SYNC to their wake functions.
+The default wake function forwards it to the scheduler. WF_SYNC itself
+does not block, yield, or otherwise change the state of the waker.
+
+This document describes the current WF_SYNC semantics for the fair
+scheduler. Other scheduler classes may ignore WF_SYNC or apply their own
+policy.
+
+Custom waitqueue wake functions may ignore WF_SYNC. The following
+describes fair-scheduler behavior when a wake function forwards the flag
+to the scheduler.
+
+Placement
+=========
+
+For fair-class tasks, WF_SYNC can influence CPU selection for a wakee.
+It expresses that placing the wakee so that it can run after the waker
+schedules away may be beneficial.
+
+WF_SYNC is advisory. CPU selection remains subject to the wakee's
+affinity and migration constraints, as well as the scheduler's other
+placement policy. The scheduler can therefore select an eligible CPU
+other than the waker's CPU or the wakee's previous CPU.
+
+In particular, WF_SYNC does not guarantee that the wakee:
+
+* runs on the waker CPU;
+* remains on its previous CPU;
+* avoids migration; or
+* shares a core with the waker.
+
+Preemption
+==========
+
+For fair-class tasks, WF_SYNC can also influence wakeup preemption. It
+does not guarantee either immediate preemption or non-preemption. The
+scheduler can preempt the current task immediately or defer the wakee's
+execution according to fair scheduling policy.
+
+The scheduler does not verify that the waker subsequently schedules
+away. A caller can continue to execute after a WF_SYNC wakeup or issue
+several WF_SYNC wakeups before scheduling away. WF_SYNC consequently
+does not imply that the wakee will run immediately after the wakeup.
+
+On uniprocessor systems, WF_SYNC may avoid a preemption when the waker
+is expected to schedule away soon.
+
+Policy
+======
+
+WF_SYNC is a non-binding hint. It describes the caller's expectation,
+but does not establish a placement or execution-order guarantee for the
+wakee.
+
+The hint leaves placement and preemption decisions to the scheduler.
+Any future policy that strengthens WF_SYNC semantics must define its
+placement and preemption guarantees explicitly.

-- 
2.52.0

