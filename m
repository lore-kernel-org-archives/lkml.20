Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBC37F74A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856252; cv=none; b=BvWMYvEKLGv8uprwBRn5yh6ADWcdPa4a4xDremxCt2zK1HeplfZX+vA8DyjJ/4AEzdmw8pdEctSYE+hoeZE16D/oWk5b3SCh9/0iHHarWvJQzeF3mdjeBje0idl0K82u7gt6gpatHIN9ePTPKleoizdDljINVWmVEehghcGljdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856252; c=relaxed/simple;
	bh=HP3AGEiUehwDMhZ3NPzicHI/5oLIQXnrtcDeE9jDPD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKFcX6MZLvUa65BegR2Dmh8l8Zr7QIZEMFU9PoQUXGjNqMVhZE97WCMFeKYF3uf+SWXciVfmHUHYrz0mqBkym6YQ5p2Dm6QlACQTYZFGcqXM911+bo2GNzaUtMdycSYSENStDRB6x8pW53pJu+lywScU19DLG+Vt6Yk0Lw3Uk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDWrcrPb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDWrcrPb"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a1676000so1563505a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856251; x=1790461051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOFz2tVOnWMDeiyax1z+Z7XLRHM+8n0lwbk8G0N6AS8=;
        b=TDWrcrPbo7FeB6o98tW8aTmZXg/bpdQWPbG9bXUf2Gr+Ds57P/qPtoqLX5Cgrg+/y4
         7+Hfr8eE077A1iIl4P1exhmkXf0M1mN49EPEmSRRzbuWqccGXRms58oHxV/nn5YZcR+s
         n19q5ETfn9w2MLwj2k/yEK3EUKBQP8tXWEnG1fbMrnjlVs6YEyiQj4Sn6c3iqNSq8WwW
         nSsilxf+5UObCNeW2g2vu3czChfhs737JIAfcNRSX0r+jFhfJAWLc9iLRNidKD9xDAFj
         LYi9YiR9ywwGzug/+Q7F2Og0xm3wlJvjt6z+q+7/QLd1Gx95gV4GvzoGK+Za5qAYv8cb
         HBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856251; x=1790461051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOFz2tVOnWMDeiyax1z+Z7XLRHM+8n0lwbk8G0N6AS8=;
        b=CKXBzSym+w+V28dp/iOAM5RP6Un3bUm7QWbQUjQ7E0G9/X0NkM9VjZ/kPkr9SjGcai
         GrLcTKyN9lcr4WkxnoZoRW5oRPJZEjQoMjRxkHv3GC7vO2pe9De4lSPv5zZ6AB4SvJ1x
         bOi7kKFaduqXDLl6q4p6+xhJzwS08IGJ62HrDiV3743/FTOLnqn2l9t4BXwko5Kb2gb0
         poUeTB6w68TQnniZIxcRaW1kwSYZPUTrO+y8C98x8hIzjUi3y/GToP4hOiVRgH3Zea04
         U93dAiHNkUVhQN5mgm7cxm6xjQxsmKPh041EKWnkNNF+bSpJ+FtwSeQM9kPTkeyS17td
         PZSQ==
X-Gm-Message-State: AFuF++lytLTpX4IUMx3kjHll54Qiw7yUHKUNWyg2UkiLvezPozbq13Qa
	nQ8cAW/J6LacU5ydRHxgfaiAaqoSIhHgkEpOSs67ByqNhy7O+cexd+vyxwTB0ycY
X-Gm-Gg: AYBFou0NypCHdQW+xTsb2YLsVCQTpqKrPUIARGcJweR/CYZD3HGQUv0/DcuhuXUeGiX
	R+xIBLQvQUYwwfJVgSfiO23Tjaf6qUUeW8c1rjEwxcfSMSfBYSu2RJxlEfX50CIQ8ENujpuSYhX
	XZf/3UZlkX1OWXHdKj8VcoB2qYaltUXRCLyvjWE6amNrLwLqPdVPDVMlaTwzLs5pYtiFfqesOMF
	uUTHq+KWhgiaAlDpwqCcTq+/V7Y2JdpGAR4bscEz8EKTfrarFgKv9MV2R8nPqGwoag9x/JOZJGS
	UoQBRaQ49PEBwOwHG91zBiMvL6oV5Li+BmLzSfv5b9+A+BDJHG00UKi03CKI6oZmFrL9K0RmaKi
	0amVrsa+JVZOWu8X8PRWmOZ5hpdHfx/b4+z6FhpkHIy6XMUdbq2vWOItmFiKVRs30niTN85uNG0
	JZPicNvsylpr0+CayQF2IgMBlLe/jY3JK7D0/1zzq8ks7Dv4BTzpEpDGTzMAfax994eboMT4CvN
	0oT6POMLQGkxdL9pmBQhHgi4cmdIk2K3WOyihD7XeU9mEEspgWbVAPq4Xoqap+pddCkhtvlM+co
	LPr5D4vfag==
X-Received: by 2002:a17:90b:3d47:b0:39d:f189:48d6 with SMTP id 98e67ed59e1d1-39e54c8891fmr11286878a91.4.1789856250801;
        Sat, 19 Sep 2026 15:17:30 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02738654csm4291269a91.3.2026.09.19.15.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:30 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] futex: fix hb lock mismatch in futex_wait_requeue_pi() and CLONE_VFORK hash init
Date: Sat, 19 Sep 2026 22:17:30 +0000
Message-ID: <20260919221730.3707261-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues in futex and fork initialization:

1. In futex_wait_requeue_pi(), if futex_wait_queue() returns with
   q.lock_ptr updated tohb2's lock after a requeue timeout or signal
   race, unlocking the original hb1 lock instead of q.lock_ptr leaves
   hb2 locked and unlocks an unheld spinlock. Always unlock via
   q.lock_ptr.
2. In copy_mm() (kernel/fork.c), initialize mm->futex_phash properly
   when cloning so private futex hash state is consistent across
   CLONE_VFORK.

Fixes: e5c6828493b5 ("futex: Split out requeue")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/kernel/fork.c b/kernel/fork.c
index a5934a317634..8f320f51cae8 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1996,9 +1996,9 @@ static bool need_futex_hash_allocate_default(u64 clone_flags)
 {
 	/*
 	 * Allocate a default futex hash for any sibling that will
-	 * share the parent's mm, except vfork.
+	 * share the parent's mm.
 	 */
-	return (clone_flags & (CLONE_VM | CLONE_VFORK)) == CLONE_VM;
+	return (clone_flags & CLONE_VM) != 0;
 }
 
 /*
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index b3f4a4bccb12..72b954d625c4 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -842,12 +842,13 @@ int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
 	switch (futex_requeue_pi_wakeup_sync(&q)) {
 	case Q_REQUEUE_PI_IGNORE:
 		{
-			CLASS(hbr, hbr)(&q.key);
-			auto hb = hbr.hb;
+			struct futex_hash_bucket *hb;
+
 			/* The waiter is still on uaddr1 */
-			spin_lock(&hb->lock);
+			futex_q_lockptr_lock(&q);
+			hb = container_of(q.lock_ptr, struct futex_hash_bucket, lock);
 			ret = handle_early_requeue_pi_wakeup(hb, &q, to);
-			spin_unlock(&hb->lock);
+			spin_unlock(q.lock_ptr);
 		}
 		break;
 
