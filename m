Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F883ABD8C;
	Fri, 18 Sep 2026 02:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697224; cv=none; b=h1lYgNlGdY+rKkmJCt33YuTRX3c4eCQSbY1GuR02o73eqZqxyFiu6+2fpNneUqu+4q/aZgLTkqOZHgQLJwYczizardmPXJQ7t4mS6WzeHgVAG24mTApAa3mBdz/kRKDAjWR0a2eiJA1kTcQixEDWHlOi8mR3drfT1Ew6Z6QfuVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697224; c=relaxed/simple;
	bh=5trEPETXWgkc3/MRScNf9ISoobtfIhcHGDWAjwwavgw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KxPtZyqfmmvgVQOiVzM3gnEX8hVKnUZjXxUkaPWrPOQOzgKFrfPbwA+eBaRpyNI7nqo0JZkQaa29m0sfQomg6gz0HkTGGXrG2g7oQJSRrTvfSu6ndLWH91jPeEAKSuDSTZMKXwtvz+WAot3NOTsNt0jRcNZiXbxYRkYNzeV9vFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=aUn92JrE; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="aUn92JrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1789677806;
	bh=5trEPETXWgkc3/MRScNf9ISoobtfIhcHGDWAjwwavgw=;
	h=From:Subject:Date:To:Cc:From;
	b=aUn92JrEzdoKGsZQxqlkZU+FQzKBY+vK+BAIVwJbI1uaFzwiuHaZT54YtCYc9lEI9
	 p7AU8Kh6Immqj+g9umuCWAHpl8cNCSR6pskkWbht1eNRhdh4yJIY/7R2oodtlKsGOj
	 Vqsjjfx0Thut161DPUNHNH1sBd2CHWkUXRJ1xM9k=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id B07C6401E1;
	Thu, 17 Sep 2026 13:43:25 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Subject: [RFC PATCH v2 0/2] sched: Document WF_SYNC wakeup placement
 semantics
Date: Thu, 17 Sep 2026 13:43:23 -0700
Message-Id: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtQrGoC/22NQQ6DIBBFr2Jm3WmUYIWuvEfjosKMsoEGjNYY7
 l5q0l2X7yX//QMSRUcJ7tUBkVaXXPAFxKUCMz/9ROhsYRC1uNVKSExmJosbY9q9QRsMkhajZNK
 q4w7K7hWJ3ftsPobCs0tLiPt5sTZf+6u1f2prgzWy0prsKCVz20/kly1cQ5xgyDl/ALK/p4GzA
 AAA
X-Change-ID: 20260824-sched-wf-sync-doc-e92b4fe987f7
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789677805; l=1705;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=5trEPETXWgkc3/MRScNf9ISoobtfIhcHGDWAjwwavgw=;
 b=RbuKqmXzo5FAxp0b1GXEVUcb6fdy9m9d5i1SQnHMf6YWwKluVuRq3YEcY4xOK413oTbpvlHTK
 IkuXctLUJbBC3fyn+bu4c7ZPXFGS9HmaxWD3rFWJ1BLiPqEbrRZGsvZ
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

WF_SYNC is passed by synchronous waitqueue wakeup helpers when the
caller expects the waker to schedule away soon. Its fair class semantics
are not documented.

In particular, the waitqueue API comments state that a synchronous wakee
will not be migrated to another CPU. This is not guaranteed by the
current wakeup path.

Document the current fair class WF_SYNC semantics and correct the stale
waitqueue API comments. WF_SYNC is a non-binding hint that can influence
placement and preemption, but does not guarantee CPU locality, avoidance
of migration, or immediate wakee preemption.

This series does not change scheduler behavior or define a stronger
WF_SYNC placement policy.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Changes in v2:
  - Describe stable WF_SYNC semantics rather than scheduler implementation flow.
  - Remove helper names, predicates, and CPU-selection details.
  - Clarify custom wake function handling and WF_SYNC placement and
    preemption limitations.

Link to v1: https://lore.kernel.org/r/20260825-sched-wf-sync-doc-v1-0-f899edb44ff5@gentwo.org

---
Shubhang Kaushik (Ampere) (2):
      sched: Document WF_SYNC wakeup placement semantics
      sched/wait: Clarify WF_SYNC wakeup semantics

 Documentation/scheduler/index.rst               |  1 +
 Documentation/scheduler/sched-wake-affinity.rst | 67 +++++++++++++++++++++++++
 kernel/sched/wait.c                             | 30 +++++------
 3 files changed, 84 insertions(+), 14 deletions(-)
---
base-commit: b5a051f6b840d48f159166ef073d3021989bfb50
change-id: 20260824-sched-wf-sync-doc-e92b4fe987f7

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

