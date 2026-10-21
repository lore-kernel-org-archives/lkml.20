Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605050;
	b=pG43yapeMznan6Pj9zb5Q+Ud4yhRpb+TdDBuYekRi6FTqKCOe1VUUFeJrD6om2bPOHVP
	 Y3rB12Nfemtwvf7U5iV2r2wm+wfoo61HVaChssM3BDHcYwyOADYvpwwaCXFZNvO7+0Bcp
	 VHA3C4N8YCcmQ49j2i8U5rm0HeYiK/VjB8NLazmgRtIPMzKAyifFAfOupj5jzKEMeodA+
	 5x2zpGckfEf26nojUoSH3eZQ4c9fDVqRru3rPvpXTxwlJC2zMQFobRuHA24iP7kAH4CJL
	 /GE0tHrsEWLs9oQLQAz1PuiM1woTn6aX8xmIyZnX3JAZklhEKyQ2+q/6ZP05IpdUCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mE9Ag/gCpQwpic9Sbpc9hGK5nNJZ45oi/KyynO+C5Ws=;
	b=3G/tMGIbt5xvbXC+2YCTa0pfQwo2/72eQvoPsf4MMQld7zkkftVYzV3Ih1MLFbCqLdWc
	 RgKkKwBu9WetbsOFTZVZkdm8eilInzXjBioigi1qsn2g8MaqBtpstwK53hLFYlLwsYtCf
	 q9c0fu3g2YbG/z18yW5DY56jDrzsvn3gQwPQkLQ7cGCVuPvBfkMv/t6vYdWN2cNljFzEF
	 JL4T31Tu6KjqdMEU3r7ZL/xH4JMfmTAANy6g0Ck1hgXZ85X6FpL24vubx1HaS96OVHRmJ
	 bHuDB+VS0OttmK8KzCUAECJFSK8ioWix5u/EqMqfFZ09O3rbCwrm/Z3kK7EeqkvqSDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=AcdzYn+x;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF71606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF71606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=AcdzYn+x
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-192faaff686so17866c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792605049; x=1793209849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mE9Ag/gCpQwpic9Sbpc9hGK5nNJZ45oi/KyynO+C5Ws=;
        b=AcdzYn+xJgZ24qhdgNzJ+znHcPBAcXz72e9f4fQNiIdR9DHJ88983AMvTE3ngzyFC7
         SDCp43YiGEg2N4XU5y9IxSku8AVhcBQifpG6b+xFWQnuaUlWF9eKV6mIv1RvQan4ZlRi
         A9tHlhTbISYlznruJmqYxa1i5DlWZ1i41oAkZUkiMLDZRtM51ZkD4+XEWQBcQnhAHTow
         3uG185oH+MfhXlZiE12QtsqR6cagzCQoEmcGwZ9t3m3bGudFO8B9vNQh02gnj6beJXsG
         HBNvvitmYn6+WQzRXLedcKF7QS4HnyyjH8bwxj1aB5uT88pEdpQBBl5Ih/61fj7fuIIF
         Trxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605049; x=1793209849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mE9Ag/gCpQwpic9Sbpc9hGK5nNJZ45oi/KyynO+C5Ws=;
        b=lSzxgpokc+r/Pbs/FS5AiTdrHlgHh8NR0nc9u5BgdMdmOCuZgCyCF1fZEJoXTFx0XC
         epvRO5PddL2Fy1xJc7+Z+ZWSuQKZo3Y3zYDWC1Ui++6SBmOQRjKXhTjhziWnoVq6W2fW
         ELIqjbJQKG5hn5Tn7+8/F2g0hi28hBrTxa0QPN/9RECecECSXdXNp5u9gkRjt27g34y0
         Kdcqxu8LkYOYu7JLT3WaW3H+eyS7P9KXh4duXBekC7DkRoqoUI7CIwtEIZReky6axpgz
         cGsgM4D3sYYPXoCpeHlWCx3GD0+UYhou+02G9boEQKJ3nLmSsgkm8yaGWsaoXHJavfsH
         YnTw==
X-Forwarded-Encrypted: i=1; AKwUvBwOnIDbEruzZeIMzU8QvND6eLoYzJv3zfRgLS2eZaXP44HtNJEFBjiZNLBiYxu3zvxISApWExDdegpb0gI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyPcOIG8VZjXFNFFzPksi7v+00yVKUQTOUcl3H8nvIMN/D0GWS
	h3Nqb8WHaXXRksj6y/eVRR4+Tmsxy5ckthGmSzKlkMnNoXV2BVyOmUuHnfrAO4TJTMc=
X-Gm-Gg: AYBFou3rKLjlWxH2IxbzZI7sHsqJivN5hlJDt6rAYD7dYBgk+kTfpvN1RW1R/GW8DbG
	ol76jx9vfF4rnnQqr10U7iKVON6hIzOhHssOUYy7t/pp4spQc16gvFZ00uyHfMmUxbTSHM4PCnb
	4sv5XTFHkI68ktc5VELqmbfZexn+MO8qj5FWS1MeQ5g7yZiskszZarFKVNKA4sVl5yPlswND21V
	c/glL8XHSxUXbxXR3NAymJZzXuFBWfMisuBXvUPfkeN1NWVasGPNRnglMUhbpkR552zLk0sEEX5
	5WA+RJY1v+5LQ2KxXt2of4gIhg4aeqaI4UIdstAWGCtuXU2a6lBYxdklR9JoqOLm54DhPRN9meW
	JglVActoqq/EIlA4agVz9vtVOgLiFFXuz7dEd416y/Sc71zG2Od6/C0zTGUzopJKkx/n/AnXUt9
	UaU70EKJbO6Ts2I1t69YsyxDBI2WUbaSd9CUc0SEjx4Adw4qnMOvbJcKunVrScP5SFXUJZoLbgL
	Weafia6+NQns45s4lMemRRCeRRHVPepcpDEOlHT+PJMSQQlMQprpa6dQMLqLkx6Eo/KYQ8Js2PA
	1g/i36IDQYLK2Mih01mbGq6Bafzmszk8LuCBurTb4m1cjeny0lpt
X-Received: by 2002:a05:701b:424e:20b0:143:298f:33b8 with SMTP id a92af1059eb24-190a7756cafmr3521892c88.44.1792605049249;
        Wed, 21 Oct 2026 10:50:49 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d059:e601:becb:a5ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm8229754c88.17.2026.10.21.10.50.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 10:50:48 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: cgroups@vger.kernel.org,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mkoutny@suse.com,
	ridong.chen@linux.dev,
	tj@kernel.org
Subject: [PATCH 6.6.y] cgroup/cpuset: Make nr_deadline_tasks an atomic_t
Date: Wed, 21 Oct 2026 13:50:45 -0400
Message-ID: <20261021175045.1443-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
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

From: Waiman Long <longman@redhat.com>

[ Upstream commit 95220e1f18f6321008f021abc7d6f581f64bcb82 ]

The nr_deadline_tasks variable in the cpuset structure was introduced by
commit 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task
in cpusets"). It is reported by sashiko [1] that nr_deadline_tasks
can currently be modified by inc_dl_tasks_cs() under rq->lock and
by cpuset_attach() under cpuset_mutex. So if both updates happen
simultaneously, the nr_deadline_tasks variable can be corrupted leading
to incorrect operations down the road.

Fix that by changing its type to atomic_t so that nr_deadline_tasks
are always atomically updated. This fix patch is a low hanging fruit.
It can handle some of the races between a concurrent sched_setscheduler()
and cpuset_can_attach()/cpuset_attach() calls, but not all of them like
the other issue raised by sashiko [2]. This will be handled hopefully
in a future follow up patch.

[1] https://sashiko.dev/#/patchset/20260626181923.133658-1-longman%40redhat.com
[2] https://sashiko.dev/#/patchset/20260630033344.352702-1-longman%40redhat.com

Fixes: 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets")
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Signed-off-by: Waiman Long <longman@redhat.com>
Signed-off-by: Tejun Heo <tj@kernel.org>
Assisted-by: LLM
[ Backport to 6.6.y: Apply the declaration change in
  kernel/cgroup/cpuset.c; struct cpuset has not moved to
  cpuset-internal.h. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-93150 to 6.6.y.

The code changes are identical to upstream, with the field declaration
applied in cpuset.c. See the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 kernel/cgroup/cpuset.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index bb413045d174469d9f5f8187af2de50d3c4076fd..4dc4b326781a8ffb93f503255eb5a026180adb23 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -175,7 +175,7 @@ struct cpuset {
 	 * number of SCHED_DEADLINE tasks attached to this cpuset, so that we
 	 * know when to rebuild associated root domain bandwidth information.
 	 */
-	int nr_deadline_tasks;
+	atomic_t nr_deadline_tasks;
 	int nr_migrate_dl_tasks;
 	u64 sum_migrate_dl_bw;
 
@@ -235,14 +235,14 @@ void inc_dl_tasks_cs(struct task_struct *p)
 {
 	struct cpuset *cs = task_cs(p);
 
-	cs->nr_deadline_tasks++;
+	atomic_inc(&cs->nr_deadline_tasks);
 }
 
 void dec_dl_tasks_cs(struct task_struct *p)
 {
 	struct cpuset *cs = task_cs(p);
 
-	cs->nr_deadline_tasks--;
+	atomic_dec(&cs->nr_deadline_tasks);
 }
 
 /* bits in struct cpuset flags field */
@@ -1091,7 +1091,7 @@ static void dl_update_tasks_root_domain(struct cpuset *cs)
 	struct css_task_iter it;
 	struct task_struct *task;
 
-	if (cs->nr_deadline_tasks == 0)
+	if (atomic_read(&cs->nr_deadline_tasks) == 0)
 		return;
 
 	css_task_iter_start(&cs->css, 0, &it);
@@ -2757,8 +2757,8 @@ out:
 	cs->old_mems_allowed = cpuset_attach_nodemask_to;
 
 	if (cs->nr_migrate_dl_tasks) {
-		cs->nr_deadline_tasks += cs->nr_migrate_dl_tasks;
-		oldcs->nr_deadline_tasks -= cs->nr_migrate_dl_tasks;
+		atomic_add(cs->nr_migrate_dl_tasks, &cs->nr_deadline_tasks);
+		atomic_sub(cs->nr_migrate_dl_tasks, &oldcs->nr_deadline_tasks);
 		reset_migrate_dl_data(cs);
 	}
 
