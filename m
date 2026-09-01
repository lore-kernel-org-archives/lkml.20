Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025A47F79C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268425; cv=none; b=UJzrsfaV40QzTWxZlvUW0iZ7Mpv1aalArcGz4y5adQlZA8eaN3iGmlmCsGvf8xG6RZPMgu2FOP/uQfSAqMWpzJucAZGnshOIF5uKp/8hDCzeKWObrkexkU6zpdmdoWLJvcyhh6ZBncihpr2y0Ki/yLRSU+PWsScHeWUvk0MEz54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268425; c=relaxed/simple;
	bh=qz0SaQk3SQ761T7x85SQqX6nS4lr/tPFoNL/yc11oWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eqorraxPFaB6VFg7R5lAMmKDT/8XTdc3/CxR8a90eAJgK2ucM80N0cZl0Dneu6OxYFYTqAbWz8B0IqDj4DIh0qLARKYhkU428rpLHkmIl8axw8h2Qkb+AzNKoBXtLw+ha9TpWDx9sgcOv0J1ZHqb4jlZGx+Q58eSzQLCtx5fLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANU2PVlR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANU2PVlR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso54894535e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268422; x=1788873222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXeoOvwBP+ldx/8gVLXWVNkzbohuXGpUFdUxHm5IJN4=;
        b=ANU2PVlR0xjDk10WJqeNzE4PntPV11Y7KQ0HLMFGfWM/M1zB/LaUktVc6FaEZ+UzpG
         knocl7ARmHJpXgtXBIipi5CzN7J/UDkspYvlOIMIHyHb+NStk1VqNNkK7NGjum1ey3BU
         JzpOuhTnUHrwtw+6doZCLKGlvZd/FY/63aWKo2XdoVKf4lOaIQl5Fk252dhg87vaP5f4
         PUSGRIme95qlQkrQNQfSSTy9ma8RiEsR58BZf5ZkyZFAgb6P48QJTuTiWm1UaEfaou1r
         f/Avv1DF2uSgRKvPxAV7fELdiw2nj6xrfrISO13N3xmN8uLe5ZPr1GSgpeasirqdaLPB
         6xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268422; x=1788873222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXeoOvwBP+ldx/8gVLXWVNkzbohuXGpUFdUxHm5IJN4=;
        b=RmE1+P6Tn2r+OzXysNO0MXecaLo4wRsRiY8rW9/I09JrSGpnVk/D76ytezNv0pcRZw
         GGY9ZFjHAWWCZR8qPLhFffaQzlVNkWxAPUkpFVtmgnsCbaemNXqWFEty+df9Kzz898cD
         RMypByHmkmM5TpD3wxcbz5krmXT09V4V5kfsV5uE/eapX+DRJbU7G9sNqghRG2CU9F+E
         iKGxBCRSSDDsrOE7ozeiMPv8yDo7i8mRzWeiyYTMpmkF2z92HWqSk363MrPwc7ZrbF0c
         Afg3Lao9hKhreTpGShF0TSIaXBKGHH03KxWImnxKSim7Vf6+SzSrYh4WiY4e+8+uJlRz
         nEIg==
X-Forwarded-Encrypted: i=1; AHgh+Rpt3YkvhDoym28+LpK1WHRnIYTm5T9p7ReaTSarshgf6LUjO1yLDxKeTuvR7iU+sqvYC5WLBjbWdmapEDo=@vger.kernel.org
X-Gm-Message-State: AFuF++ndrW/Za+3+ql0CPvqTwxcLhR2/F/mZCLmGcN5Ags9Tl5eiLvR4
	Do3Ed59rKwS9tHfCHgnuu4Emdjzy603XVazn9IsCP2Kb4Ux5CqMCp4A5qrBwA/IO
X-Gm-Gg: AR+sD10xlu+yviCsKAXavWQbfiGQ1eqoAvu2/vEorcxTf6iukqHKABL3wCundM6kgEB
	6wxjAY8e8f2J6WkWxUyFYvRV3qow+e9EzDRVGT/gjn7ca61XpgTEq0ira9BObuOQjtN6+PcLZyc
	eU0DN5bWNBTNXynffAYpdCedpFVRAm53vsS52UOk7QhwSOCDl3GBjeR+4CS95P9beCM8bxJva65
	cmZc4cuypKFi+VaK/Q4lXYXa6RV4dwU2Pwl0VkGwyMJR+5jNeqsCgKlJnSF+udTLKY5AwqIu+LI
	Lkas+U2pRNg9MfkN16IJG1PEnf0UOjwkUsSZsPh+g7rnsiso8oukinWQF7ySYlXIR3P/AmMHOS4
	gj/1binpOQ23GofXJmJ4o6jYPaeEyXMRv5/kkp9cl+1eM9lJfJ258emJzu6HmWjoxHWU12vLRkC
	ZRcBBmNEJ9YApXPX0yOZRutD58EjizM/MCRLqQ+Y0wcw8JqAcv3f2wsMHLC20la+9RZSty66RNc
	m3tv1BYrC0fN4wZx5/m+ecOhhFlsxfN2/KVWhuYChve4uo5VQkfGoHrqVoLmbP1lCf771bj+9Ei
	VYTTqjMxYSPawPt1QLU+RJMaDRM4b7Mh1XdqcSNbCa7Fb15nY7j9gX7CWz5CwqtUinvxY5y4SUt
	8uLPxJg==
X-Received: by 2002:a05:600c:3f19:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cdc43d444mr166787295e9.6.1788268421259;
        Tue, 01 Sep 2026 06:13:41 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6eafesm4504719f8f.24.2026.09.01.06.13.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 06:13:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	Chen Ridong <chenridong@huaweicloud.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 6.1.y] cgroup/cpuset: Fix misplaced DL migration reset
Date: Tue,  1 Sep 2026 15:13:35 +0200
Message-Id: <20260901131335.15553-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mainline commit 4a39eda5fdd8 ("cgroup/cpuset: Reset DL migration state
on can_attach() failure") puts the common error cleanup in
cpuset_can_attach().  The 6.1.y backport instead placed that hunk at
cpuset_can_fork()'s similarly named out_unlock label, while removing
cpuset_can_attach()'s two existing targeted resets.

If cpuset_can_attach() fails after accounting a SCHED_DEADLINE task,
cgroup_migrate_execute() does not call cpuset_cancel_attach() for the
failing subsystem.  The temporary migration fields remain set, and a
later successful migration can consume the stale state and corrupt
deadline-task and pending-bandwidth accounting.

Move the reset to cpuset_can_attach()'s common error exit.  It is not
needed in cpuset_can_fork(), which never accumulates migration DL state.

Fixes: f8a8358832f3 ("cgroup/cpuset: Reset DL migration state on can_attach() failure")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Applies to Linux 6.1.186 and 6.1.187-rc1.

A controlled QEMU A/B on 6.1.186 forced an attach error after accounting a
real SCHED_DEADLINE task.  The affected kernel returned with
nr_migrate_dl_tasks=1 and sum_migrate_dl_bw=104857; both fields were zero
with this patch.

The equivalent 6.6.y correction is submitted separately.

 kernel/cgroup/cpuset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 681b52f6aae5b..7123bb020a242 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2600,6 +2600,8 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
 	 */
 	cs->attach_in_progress++;
 out_unlock:
+	if (ret)
+		reset_migrate_dl_data(cs);
 	mutex_unlock(&cpuset_mutex);
 	return ret;
 }
@@ -3405,8 +3407,6 @@ static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
 	cs->attach_in_progress++;
 
 out_unlock:
-	if (ret)
-		reset_migrate_dl_data(cs);
 	mutex_unlock(&cpuset_mutex);
 	return ret;
 }
-- 
2.53.0
