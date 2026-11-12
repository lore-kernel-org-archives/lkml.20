Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446671;
	b=qP4grFNnoNYMtkunuU6luKEkKWrcTF1RPYGyzPbRWKYcJYcPsojR6T+phj2AaVl1cDzJ
	 9AAsf8heB2OYgg+4RE368KFBWEz0W6Uxm3O/jUBQqw6cFLljHoOvMr8YP3odjzzf/UoK+
	 TDYmy9yteQd4L2dZf99nvyu2J2H7oN4f1ei8mAeSiePSXneJUCCTFpoeVvtN+CkOZrOwN
	 EyNSgbPuspBjiaTSNBaoaAuh55+LmRiCoI65pPPtMQpiOkwlG8X98EKx9sYlmLfBI/WBS
	 S4JP6k0SYaLqBi9ew7x59v5Mz7XZ7iwAkjhFZqHKyu/ausKh9PGpXzXd+DnTrSI1Rhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446671;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=wnPH7VTXdQcbvNA0iyny6ChtnL+MZ+y7OLGac0wIBr0=;
	b=Iw0HdaQZ9MuVM2VpLVtPkj9mTbw4OVd1fujmA4bjyJAl90YVO2SecQ/EdQ4d+QvZDaxN
	 8FznbO6yHg+eeoDIUlWcKLpZ56u1Wwy9XkMFO6vLTs/dA2Y8XwutERMw4TEFQYIKSpGFY
	 b07IC+W5+X3uqHRBVbKOkwTUdRq2fpe711xUhZuMU5m82yvp6Ql2Z0n9FIBi2Pwi21Vf5
	 /zcZBvMuBR2rIUj1YGHJergxly6BUOTRXoa/jLn3L5IZpmkioLrRGhP8huOPeTziq7Lq6
	 li5Oo1hhERDSyY3bPsGt4ONAmMJ+6LcpP7BKp7Z9A2kxPENN1EOI+Omtw19HP+3piIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JzXo1jdV;
	arc=none smtp.remote-ip=91.218.175.184
Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033EC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 033EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JzXo1jdV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oNsPPqN4DfmzhC/IG0VAIVXyM4YososRJjoB3+tOiyo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794446668; v=1; x=1795051468;
 b=JzXo1jdVSvqpfDtYAHJAO53sxhYXBma3Wzvlf3OxOvdfLEcZ8Nr8bw0HHJM23aWTBAN/xxMY
 gWxeYqVWkChU4hAhcEsL7bpsrUT4NsRjf4IMiqteThlnL70h8g5JgDlRbX5woZXcIYgLhV/O/q1
 uLJNO23lpqmovJ/5rh6D1N3Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 311b01dbfd59ca1b;
	Thu, 12 Nov 2026 01:24:28 +0000
X-Mizu-Trace-ID: 311b01dbfd59ca1b
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH 0/2] sched/fair: Cut per-group work from sched domain
 rebuilds
Date: Wed, 11 Nov 2026 20:24:19 -0500
Message-Id: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMV9WoC/x3MSwqEMBBF0a1IjbtADX7orUgPYvJKCyQ2iYog7
 t3gnZ3JvSghKhJ9i4siDk26hozqU5CbbZjA6rOpLuu2yvG4T5zcDM9iNfIqsmgAW7fpAe592Rp
 0pvFGKD/+EaLn+x9+9/0AH57EL28AAAA=
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A sched domain rebuild, from CPU hotplug or a cpuset partition change,
moves every active CPU to a new root domain through rq_attach_root().
For each of them rq_offline_fair() and rq_online_fair() walk all task
groups with the rq lock held and interrupts disabled, so a rebuild
costs O(nr_cpus * nr_task_groups). Dietmar pointed at the offline side
when f60a631ab9ed was reviewed [1].

Patch 1 skips rq_offline_fair() for CPUs that stay active. Patch 2
skips the runtime_enabled re-sync in rq_online_fair() unless the CPU
actually went down.

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0
(median of 20 partition switches and 16 hotplug operations, all three
kernels measured in the same run):

  operation         base (ms)  patch 1 (ms)  patch 1+2 (ms)  change
  partition root        13.28          7.68            1.21    -91%
  cpu offline           44.95         30.96           13.44    -70%
  cpu online            36.84         28.48           12.82    -65%

With both patches these times no longer grow with the number of
groups. With RT_GROUP_SCHED enabled, the rt.c runtime walks remain.

[1] https://lore.kernel.org/r/dbd36b16-4acb-415a-9bbd-258b2e022475@arm.com

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
Qiliang Yuan (2):
      sched/fair: Skip rq_offline_fair() work for CPUs that stay active
      sched/fair: Avoid re-syncing runtime_enabled on root domain changes

 kernel/sched/fair.c  | 20 +++++++++++++++++---
 kernel/sched/sched.h |  2 ++
 2 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
change-id: 20261111-bug-sched-fair-offline-active-8d063e735d3f

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

