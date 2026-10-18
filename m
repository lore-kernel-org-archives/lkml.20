Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B349252E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792325704; cv=none; b=iK/tGQu6prWj6JihNa5dcreoB4E6VngXB0T7NHr6kaecV5NnlTZAQQ94tuGulzYAIZ+wUhLF/bnHP6iw47l4i1PGGJxTT0k5Lh1BA2XlKU7IKEaHZhC0Z8cR2CuNgDaDvU+3w9JlUpZAKmX2dIjwOd9VK8KoqWBNidEmZKURrZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792325704; c=relaxed/simple;
	bh=jJzrwDcLPPwtfFvIwpbsnemnHUZlCxNXhbp9HY7MxhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sr7mj3utcBlrJAE8oxS9Sf0FaYl37FyzN0Mx9lOIvmK6XmoDBN3w/jOOrHaT/suZ6EQ0+TdKFuGvXYPPnGhpwflpaUOhO2ZZ5mQNxoM9WHbPcm67kg7j5YRpgwnsgOteh8gDgOwRifUz4grpZkia02PhGwcX2baNGwG+Ti9tPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjHfP/f2; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjHfP/f2"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c41dae9db9dso67538566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792325701; x=1792930501; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwDexhyU7jAUc+oJl4oPya3q4dZ70NmO2jnrwQScHtU=;
        b=mjHfP/f2S8mP+qz0SrDdPJHii4SSroP/XZDv4peKYr0lFRxkmCWOQUr+oEYeCVOgXU
         zb0OeV8hfrllQUv4wYE62XNlRtC2VLnEP4pJj03hFqKbzm+qKayvPhYbaFqP1SrmXFqt
         oyN5jYMAGs4oV707exr092hYhANNs4LHy6ciWBv1QxNZSixwRsVeLMClXFHt3b3I/G4w
         GOPmTyuRL4qtHVmm/TlAQeLM2pWrkmwB9q3rHu52VEjq93W3JwygGf2gP661/8BG4Qa+
         ththhQrlnXqA3Yg8AjzTF2yWoZS8xyFyOS7nidDq+niuNrMXpkZgkEt9NwTMU58zqEgz
         7TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792325701; x=1792930501;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwDexhyU7jAUc+oJl4oPya3q4dZ70NmO2jnrwQScHtU=;
        b=Pzoti4NplUeoDSttGrrqpKpbyLlKgD60WZgJy7rdJK6QWK+Z4EVem4xmh3fkbuspHV
         kD4Jy+FDuuStYbUcQRZ5pFsUWflo4CTie8uJ3IS1OnC4QeYxNRGAXaABJ0FxS0WOZ39i
         XjjtleAWJLyQFjm5Yi93F0V5Zbb0HAgDnk4EA2IxG844ZkjtafN3accdnfhSocvNidme
         Woi1lp+3Hwi+SLInPYC3AFKyzlEJpXhmIqxg5yn7q6bEZ+CfDbdJewOFZ+0P3glDUBGS
         LEleuywNo2mc2IayljlOFbi8E/Hd7auzBNY9W9bnmC0ogrnwD+wNw5NZ/OAP9SMoAIJI
         wd/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzEfcNO34TDB/IEmza51wmZf/huIObvlhaa0CANUpW2BHMpSs9GmUKeE05agWUn3c3aK1zPLss/XUrDsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRgTa2fG+j6lkMMKAbd4RBARIL+QcwLJMlatXa7barPSqL+GkV
	e8FapDreb2cNqp4N3vXWeR0hfrf4DUIgO1e6MtcGTYLW5VLgQ9Rie2XK4D/VuECGumgpwsnWYNF
	MAc3yYh4Kx/OCew==
X-Received: from ejsh11.prod.google.com ([2002:a17:906:584b:b0:c31:533d:60fe])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c510:b0:c2e:5f8f:e60e with SMTP id a640c23a62f3a-c41a01fd45emr300164466b.38.1792325700997;
 Sun, 18 Oct 2026 05:15:00 -0700 (PDT)
Date: Sun, 18 Oct 2026 12:14:45 +0000
In-Reply-To: <cover.1792248922.git.jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1792248922.git.jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <177fec80ae740d23baea0d5e50fb231ce165057e.1792248922.git.jpiecuch@google.com>
Subject: [RFC PATCH 1/5] sched_ext: Make legacy scx_bpf_reenqueue_local()
 target the locked rq
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Peter Zijlstra <peterz@infradead.org>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The legacy, synchronous scx_bpf_reenqueue_local() can only be called
from ops.cpu_release(). It assumes that ops.cpu_release() always runs on
the CPU being released and re-enqueues the tasks on the local DSQ of
smp_processor_id().

That assumption is about to stop holding. A following patch emits
ops.cpu_release() when the task running on a CPU leaves SCX through
sched_setscheduler() or a PI boost. That can happen from any CPU, with
the target CPU's rq locked. Picking the rq from smp_processor_id() would
then trip lockdep_assert_rq_held() and walk another CPU's local DSQ
without holding that CPU's rq lock.

SCX_CALL_OP() already records the rq the operation is invoked for in
scx_locked_rq(), and scx_bpf_dsq_reenq() /
scx_bpf_reenqueue_local___v2() already resolve SCX_DSQ_LOCAL against it.
Do the same in the legacy kfunc. Nothing else in reenq_local() depends
on running on the target CPU: the local DSQ is protected by the rq lock,
and direct dispatches to a third CPU's local DSQ are already deferred
through ddsp_deferred_locals.

No functional change for the existing callers, which all run on the CPU
whose rq is locked.

Also update the kerneldoc of scx_bpf_reenqueue_local___v2(), which still
says that it works on the local DSQ of the caller's CPU, to match
scx_bpf_dsq_reenq().

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index f1b9d52f624a..f64438290218 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -9501,9 +9501,10 @@ __bpf_kfunc_start_defs();
  * scx_bpf_reenqueue_local - Re-enqueue tasks on a local DSQ
  * @aux: implicit BPF argument to access bpf_prog_aux hidden from BPF progs
  *
- * Iterate over all of the tasks currently enqueued on the local DSQ of the
- * caller's CPU, and re-enqueue them in the BPF scheduler. Returns the number of
- * processed tasks. Can only be called from ops.cpu_release().
+ * Iterate over all of the tasks currently enqueued on the local DSQ of the CPU
+ * ops.cpu_release() is being invoked for, and re-enqueue them in the BPF
+ * scheduler. Returns the number of processed tasks. Can only be called from
+ * ops.cpu_release().
  */
 __bpf_kfunc u32 scx_bpf_reenqueue_local(const struct bpf_prog_aux *aux)
 {
@@ -9515,7 +9516,13 @@ __bpf_kfunc u32 scx_bpf_reenqueue_local(const struct bpf_prog_aux *aux)
 	if (unlikely(!sch))
 		return 0;
 
-	rq = cpu_rq(smp_processor_id());
+	/*
+	 * Use the rq ops.cpu_release() was invoked for rather than the local
+	 * one. They are not necessarily the same CPU.
+	 */
+	rq = scx_locked_rq();
+	if (WARN_ON_ONCE(!rq))
+		return 0;
 	lockdep_assert_rq_held(rq);
 
 	return reenq_local(sch, rq, SCX_REENQ_ANY);
@@ -10057,7 +10064,9 @@ __bpf_kfunc void scx_bpf_dsq_reenq(u64 dsq_id, u64 reenq_flags,
  * @aux: implicit BPF argument to access bpf_prog_aux hidden from BPF progs
  *
  * Iterate over all of the tasks currently enqueued on the local DSQ of the
- * caller's CPU, and re-enqueue them in the BPF scheduler. Can be called from
+ * rq the current scheduler operation is locked to - e.g. the CPU
+ * ops.cpu_release() is being invoked for - or the calling CPU's when no rq is
+ * locked, and re-enqueue them in the BPF scheduler. Can be called from
  * anywhere.
  *
  * This is now a special case of scx_bpf_dsq_reenq() and may be removed in the
-- 
2.56.0.176.g3575e65682-goog

