Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1B36EA8B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135824; cv=none; b=TNXcF5PHXK3SOOBQAYg2CCxq8+gqpi8Fg68tP4PAm7e7G8sIo61LfjZYF90j0TNtiZO29H453JtEiV6Rr0ADsrAdwiWAQV3vgKQyOLQRQUTe/OoSru+sQiBVsVwobt+aJ3iypUVt6rp77BJZfme7I73laMXsSk74BpDfu0i599Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135824; c=relaxed/simple;
	bh=c9hUQ9kAAl2b2IbncqDZq1k2ejJxuc1g83EyvfAIkis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrGmpBIxGnEzjZsDK5ZaKvCmoJSlRtmsC7xI2rUHkibTa0ByOG6R6cIOrfrdpMkr++wPjrCTeYVW+DDcl2I6nFgcfvlcISo/9YyB/iyy2G6w2gYKFIWhxGvsmR0hhMVKfH9jU8VQ2lVy7kGZ/jeLPDyrpzXpc+JR2w4jMpSa+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=VNKysXO3; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="VNKysXO3"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so8995836d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135821; x=1789740621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=VNKysXO35hDRh0I5aaik3B+ZyQfCj/A/akUeSWwO4t2rLjIxuWhPn+XPKU7gnGywL3
         lG8fEKUQC7QElqObZ/b7r5Ip7EIJO13BG03nXDxPK2pGwu8aeUNKR93XiG4KF0VzFvws
         nlCDPYyeCxTBoVXwy/8O2LmEYq0pnIuyJ+tKpthhet9V30qNJXTmbhJgiRASHmq6cfbS
         Q/coTcxK4ImFJ2+MaByBx8YRIUAo0f0lnheaKFvC1i2EQ2TFNZlBVQ9LvXPZKPBALc4h
         X1/IYd9gJBBR8JgQ7InEmdp4f+BNcd7l6jbrB1/TTUmuDzCUYJq+0KZMA9NtqZnErt1h
         gqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135821; x=1789740621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=b7Httgqiex+KzI0kwwkYiVaPXvYzzhw+d2UJz9Ny7t2kEhzxTlGnfo2YhsLGaoYp5j
         9wLVzGLDWD1isXSlVsHJPCYJ4CCiB1yaUabkifLaw2IUFbD4L5IlVAud86Apnss/9J0U
         UM2NpNm8V5s0h/1PG637cpl5B2y2lbGmftHQd0ggB79cUuEYyY+4mfuATJZxpFhdRvQl
         9q0N0mEkPw3Qs9tAc/MF35AxF0vU+H13kQj9ftlXsHWZR3jTyFxP0AMVE14sxoaO6H7W
         h+RWwhwWuSDGAh2gXGX4ARnl7ypCXHZBimUjKNex1UQv22yMcCzo8niJ/j/6d6MymF1X
         IUqw==
X-Forwarded-Encrypted: i=1; AKwUvByhyqshf6M1etmdGXHFISXUmE9lMwp8Ne/lltGAXKxVlDW53iYjMpfIQyeNQsH72cOCkNFXEXJNTjOo+GY=@vger.kernel.org
X-Gm-Message-State: AFuF++nj56oUgwSW2AV5MoxShTxLyYekyBvAjNU2GzE6jhMApMLs+NmV
	rqbKNPY5obzlDjug42Dhp2nT4BAKOEB05oi8QXOew6fic7kzLzRIqkGcgtYRSGkCrHk=
X-Gm-Gg: AYBFou2H1PMMmmAep4nWp5VLQO2C6JMKW7gcmuzkhDB47Y1Nl7aIELim+t2nccr/BlY
	K82RBqNn9fMgkrEYCbVG9L6AKHZd59OvcKHWKPOLHERo5cPKiUqwmpb+Aa69cnwVEEA0pay5KC+
	wgd1LzSy7WLA6iLFfCTiCm3usO/NkBXkquQmhvXmhYteu2VPouzoxLtLDDxAT/pRvY2KEKP0OR0
	uttym+Q+h/b4DiUogEqW48//hNYTS4pSghdivKyUWqanePFzATEKuARgz0BlUssE0t1vp10Hx2M
	ZfeIVI8rHfCDvMc5iv4s/RxzdbE+M0uDiMuj6IGRwYPQIGCVTG0QaYdq+oEbWDTwGm44+7LJ6Nx
	uODSITUHEWqx9ad42PSbZzQ5TrlmDwXLM9HA4fY8L8512Bjd0XZSK9YgUH3IRsg8rJDQx3oqJtK
	8+VSNBjRBJK30ewyzUhCplGZu2KlJFT430+I4cJwV3ghRB1wHmNP/MBHxa41jbWp77hLSRMuEiE
	0pmbYIuKtslQIXvYgZwoDkjnp+0kFBtsDRahOtYsVKWifj2oNmp2LFD
X-Received: by 2002:a05:620a:690e:b0:939:639b:2e1f with SMTP id af79cd13be357-939ea04922amr525733885a.7.1789135821311;
        Fri, 11 Sep 2026 07:10:21 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80dc002sm248697485a.39.2026.09.11.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:20 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:50 +0000
Subject: [PATCH RFC v2 12/15] rcutorture: Bracket Tasks RCU readers with
 trampoline nesting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-12-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=1492;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=c9hUQ9kAAl2b2IbncqDZq1k2ejJxuc1g83EyvfAIkis=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDpeCdAsuDTbsWwi8oqAy5KN1IjS7Ye/ysM/qLEJAJ0SGsvHuCkttXUFQ2AlX09A0IwbwXmGUQ4
 qHaGMzc7/Vgg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

rcutorture's tasks flavor models a Tasks RCU reader as "any stretch of
kernel code", and rcu_read_delay() deliberately preempts inside it to
check that a preemption does not end the read-side critical section.
Once preemption outside a trampoline becomes a quiescent state that
model no longer matches what Tasks RCU protects, and the readers would
report false too-short grace periods.

Have tasks_torture_read_lock()/unlock() raise and drop
current->rcu_tramp_nesting so the reader models a trampoline, which is
the thing Tasks RCU actually guards; the deliberate preemption inside it
then continues to be, correctly, not a quiescent state.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..df6dd708cea7 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1144,11 +1144,17 @@ static struct rcu_torture_ops trivial_preempt_ops = {
 
 static int tasks_torture_read_lock(void)
 {
+	/*
+	 * Model a trampoline: with CONFIG_RCU_TASKS_PREEMPT_QS a preemption is
+	 * otherwise a quiescent state and rcu_read_delay() preempts on purpose.
+	 */
+	rcu_tasks_trampoline_enter();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	rcu_tasks_trampoline_exit();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0

