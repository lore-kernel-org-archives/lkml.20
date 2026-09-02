Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B651CFA2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333801; cv=none; b=V6rknWxSBFa5KIR1vtmPoEVXXY/bkeeqXOnwxw6fZO2XNYFClDZRpJlmpWYmnG5UKn2JHD+434FfEG8w1x9sqxfSm9x+4A59mzi2ja1apGz5xYAbCuH+NsoIndnFekdcDdlYd78CRUv8ibALx2vWoJzGidJFnhKSV/ZAXJUxxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333801; c=relaxed/simple;
	bh=za176NmUQu0vS4pNMVnaqYWZHdKrLiHmI+FJmfHnr34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EmskOtWkitJNkB4JcxZdj1vU2WyMcRgVV2JwB/jG5EdusAZoWU8nQMBxRuetHq7LM7hHFJ+iBpvi5uay3lVpF67Y2s3/P83Nap16Z2/M0E2Id67ZFP3OTTCFSPpUwv/uPXqmiLGl4ER3iVlI+CMutIEQKxbFUPRKGkoUHwPQa98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pEhV8vCi; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pEhV8vCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7Z
	WIpgbGvBDCJBO7x6EqpyOmLD8gjerLasInBY9sVUE=; b=pEhV8vCi2S7NGLYlqi
	OYtVnnFFKr9U4mQv4GtVZn0pmtIW7yX/+/wUI1FhRHaQiyCcoqKPLA82iW6WHnOV
	j0hs9ZfVkkHhiJpISlF/Q7IXZlyogTjj3FHBdyY+h/aTui7T9U1a0w2rIRofmYA0
	s9cwxdMRPQPff1eI/taXXVZeA=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCHLyu8zpdqiyshPg--.12058S2;
	Wed, 02 Sep 2026 15:22:36 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun@kernel.org
Cc: longman@redhat.com,
	juri.lelli@redhat.com,
	jstultz@google.com,
	vschneid@redhat.com,
	connoro@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] locking/mutex: clear stale blocked_donor when blocked_on is cleared
Date: Wed,  2 Sep 2026 15:22:36 +0800
Message-ID: <20260902072236.710008-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCHLyu8zpdqiyshPg--.12058S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4UXw1DXw4UCw4xJF48Crg_yoW8CrWUp3
	yqgFZrJw4DGryvq3W7Cw1Sgw48u3yUGF4rCFsrAFyxWrW5tF1IgrykKry5Gr10qr9aqFZI
	vr409ryrAFyUZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDR6cUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwhxjwmqXzrxGOwAA3N

Proxy execution records in current->blocked_donor the blocked donor
whose scheduling context the mutex owner is executing on behalf of.
The mutex unlock slowpath uses this backlink to hand the mutex directly
to that donor when it is still blocked on the mutex being unlocked.

The donor's blocked_on link can be cleared before the owner consumes the
backlink. For example, an interruptible mutex acquisition can be
interrupted by a signal and leave the owner with the blocked_donor from
the previous proxy pick.

If the owner later reaches another mutex unlock slowpath before being
rescheduled, the stale backlink is treated as an active donor and
forces the proxy-handoff path. Since blocked_donor is currently cleared
only when next_lock == lock, it can survive that unlock as well.

When __get_task_blocked_on() returns NULL, there is no mutex through
which this blocked_donor backlink can provide a direct handoff target,
so clear it.

Do not clear the backlink when next_lock names a different mutex. The
owner may hold multiple mutexes and the donor can still legitimately be
blocked through another one.

Fixes: 1628b25248d0 ("sched: Add blocked_donor link to task for smarter mutex handoffs")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/locking/mutex.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 942a939cee95..63b9cc401bb0 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -1046,6 +1046,8 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 				next = get_task_struct(donor);
 				__clear_task_blocked_on(next, lock);
 				current->blocked_donor = NULL;
+			} else if (!next_lock) {
+				current->blocked_donor = NULL;
 			}
 			raw_spin_unlock(&donor->blocked_lock);
 		}
-- 
2.54.0

