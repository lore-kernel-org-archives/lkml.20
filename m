Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B44639E19C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046467; cv=none; b=lC1fMMaNQeuz6glRLGKe5HGDFqjxQGO+Bx0UgA9/C2zAKF1CT25H5rAwclraUCeoZL8Lo/pySEnFO3vaEz3HMAojGOhJtBX+FmtfybaaB5L65PAYKexEqXGraRlwGIJn5TM2PDfYLyviRQHCFgtS357/c4Z2Rbb+G1r2IWSDYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046467; c=relaxed/simple;
	bh=fo2uXbV/YsdosodD5hKrFlrHpx5nxnjuDY7NSFj2QqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PnbeMRjUUcEAFJXWNZh8j2/HbQgIfoQSl9bOAuSvYokeLy8Db26742yD/JX1dNvBJBvIlxnug0tvygtwNCrtrrALjqPpShkTAWLXK6D4XNh0OR6O26owomspwKrSwQtst6hKbU4KZzkfHvK3MmdeLj1+wPU1K288949UBHFtor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHmNrNMW; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHmNrNMW"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so3040700b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790046466; x=1790651266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpPaqYZF1lhNpWa3wlSSx8EKhADVJbrI8ZsmdqJYbwo=;
        b=PHmNrNMWR2zssSnG+hcfoMdFNxXn5TPNKqQBSpM8Tqldrds/rD4WaHJMWcXyQzHvGh
         hVepk3sPokVykr+g/L/hTBGpmhc/uBYm599WGTpGe9jXwr3DUv5Cb0xB/StKbzJ4a4c7
         oZu8ZMz1CSGr/rnFjV7eQ2lOc4vmqMhQ8Jq5P1ZZx+0vjDhJrLrDy4wqTnbIoGK2NBT2
         +PblTrZUZM4SZDVHgNu5YKZy+bnaUipVyAeRIivQVuEpabGHWHVJK4bziGWLMl76NG5C
         AXPvGVrIdAhmGrb68J0YZn/mk/vbJ7aug/+IiXYeq6uMAfNcJblgHuUynSRr4kTXS3OZ
         xAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790046466; x=1790651266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpPaqYZF1lhNpWa3wlSSx8EKhADVJbrI8ZsmdqJYbwo=;
        b=y9hSemei1lFkNnEb+DYflBtZeRE06iApAf13Vxcluj/tPrCEfnGaLkExl+hELdzx4l
         ZfKehCtodK+AL96dCbyCGFOkLt8Vd3Uu5PWCvROt++ZlNTADBSCiQWz7IN9+2ei0liNN
         /ud+/tpFHCXasQ6GS9BIIxp19r7GD3TWsfW+/HL98LUZX863ZNlZ3eS6aHm118diXzLz
         sICZHtdlkDIOyTNyYOvd1WAMBHz+l66/2kX/zJ7qfdMEU7thdHqnRv5Y56+tlXZ15l2J
         61aRvacKjw2v3vF7tLXaxjC0b0DC80ljasnJSRh/h8avHCs03GS20lBOmtAImSpGZKq9
         UX9A==
X-Forwarded-Encrypted: i=1; AKwUvByErQjH0WSJosFpiaq8LzKG4uW4t8HOICXrsFvuLbBKUR3NMqfdvYBb055g4ORizosN+OZ1ZxrKqbQcESY=@vger.kernel.org
X-Gm-Message-State: AFuF++m2p4qPZFnoT6EdkpIk2o/FtktPN+IhBFF6NTC+TcxshzY61f+J
	m+vItc2SgM/jH46jrUPBROqQEIsgtaoSrI60Y/scH+mK0N7nbeFenTY=
X-Gm-Gg: AYBFou39HOMhylN3bFqO6CETdp6OysLUtWJ5YmHsPJnP/Bv4eL3MIyD83akjx+1lXYq
	cF9zgwwv3ZyZtvpShQCMRgOqMYjof56V8CU+7QSOoTfp9rem4kPzjw6+WzVw8L6PrHeWQY933iM
	3d33kM+cHqR69Cwdb0mULAvEYwvgTCVaOT+JT9e4FmeahIm6Mo00EGU0P1Apj6wy3A2GpvZspI1
	ubfiPetEwZLVBS9SciIENbVRXnthEDavdhRBnauFrcAfJ/wxtcHhFV02hoFidryjhYnq9Xh8beQ
	NTx7Q5Y/ae6r6f8g7EN8U8m+I5oR3yBRIE6e9+BdQfJsUP93PapGI8mHX76l6z6MG0ufX84bC80
	Jg7wl5jdxZDYcPc4QQmjRhpO5Z717MI2WGDvkdToSrKEEYhREurYY+a30CHg+UaWwDGBDdzJVqd
	IFS5XqYkQger8keRmUirK4cGVGWIhwAUUFukbrWluHV3l+TJFxAc0ueHpUmgt0AE5I3NCIh68Q1
	S8x+iCd4t5y5bxKu6rRAqr1O4I=
X-Received: by 2002:a05:6a00:130d:b0:878:3538:8f7f with SMTP id d2e1a72fcca58-87c02558923mr842779b3a.45.1790046465483;
        Mon, 21 Sep 2026 20:07:45 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c32fa8924sm127912b3a.45.2026.09.21.20.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:07:45 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	longman@redhat.com,
	tj@kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] sched: Restore the normalize_rt_tasks() cpuset_mutex exemption
Date: Tue, 22 Sep 2026 12:07:38 +0900
Message-ID: <20260922030738.1613919-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysrq-n runs normalize_rt_tasks(), which walks the task list under
read_lock(&tasklist_lock) and hands every user RT or deadline task to
__sched_setscheduler() with pi == false.  __sched_setscheduler() takes
cpuset_mutex whenever the old or the new policy is deadline, and
cpuset_lock() is a plain mutex_lock(), so a single SCHED_DEADLINE user
task makes the sysrq handler sleep in atomic context:

  sysrq: Nice All RT Tasks
  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: init
  preempt_count: 1, expected: 0
  RCU nest depth: 1, expected: 0
  locks held by init/1: 3, last CPU#1:
   #0: ffff9fa2c34e1470 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x74/0xf0
   #1: ffffffffb8f66540 (rcu_read_lock){....}-{1:3}, at: __handle_sysrq+0x3a/0x110
   #2: ffffffffb8e060d8 (tasklist_lock){.+.+}-{3:3}, at: normalize_rt_tasks+0x34/0x150
  Call Trace:
   __might_resched.cold+0xe3/0xf5
   __mutex_lock+0x8a/0x11c0
   __sched_setscheduler+0x35f/0x9c0
   normalize_rt_tasks+0xe6/0x150
   __handle_sysrq.cold+0x9b/0xde
   write_sysrq_trigger+0x65/0x90

Test pi along with the policy. The only pi == false caller is
normalize_rt_tasks(), where the lock is given up since the sysrq
emergency already voids deadline guarantees.

Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: stable@vger.kernel.org
---
Reproduced under qemu-system-x86_64, -smp 2, on tip/sched/core
e81ee0630837 with x86_64_defconfig plus x86_debug.config less
GCOV_KERNEL, plus CPUSETS, MAGIC_SYSRQ, DEBUG_ATOMIC_SLEEP,
DEBUG_MUTEXES and PROVE_RAW_LOCK_NESTING.

  deadline tasks      base                      patched
  0, one RT task      no splat, RT normalized   same
  1 blocked           splat, normalized         no splat, normalized
  2 blocked, one RT   splat, sysrq-n hangs      no splat, all normalized
  1 blocked, x3       splat                     no splat
  1 spinning          splat, normalized         no splat, normalized
  2 spinning, one RT  splat, sysrq-n hangs      no splat, all normalized

 kernel/sched/syscalls.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index b215b0ead9a60..1d931ecfaad88 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -553,10 +553,10 @@ int __sched_setscheduler(struct task_struct *p,
 	}
 
 	/*
-	 * SCHED_DEADLINE bandwidth accounting relies on stable cpusets
-	 * information.
+	 * SCHED_DEADLINE needs stable cpusets.  However, the pi == false
+	 * caller normalize_rt_tasks() must skip the lock to avoid sleeping.
 	 */
-	if (dl_policy(policy) || dl_policy(p->policy)) {
+	if (pi && (dl_policy(policy) || dl_policy(p->policy))) {
 		cpuset_locked = true;
 		cpuset_lock();
 	}
-- 
2.53.0

