Received: from mail-qv2-f21.google.com (mail-qv2-f21.google.com [74.125.230.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02784F96BD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743012; cv=none; b=QIwRggA5Qu90K1ej0fJGSk6HlSqRAohddNwQlgL8aefmTZq0t6Oxty18+TNLvaGAFM+KS8FlQZrbtqwUvKDrX8ZsCkMz7BkdOsM39kP3t98uKws+rjkUeqfLUZP8ioyH2VJ1M4b+yQrEokUJ265YBaTFnhBGVhq8Ff3TCVUoQmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743012; c=relaxed/simple;
	bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLmtk28SvSz3Pc+zZfQwHMu+F8b2stkPkQQVlQmcpdSDkOhYF0oI33HuR8CD4WTdHVP/wgSpv7XvF6QY6m9mB4BL5UeivImTrziJeTVzz+v3KJ3e4/7ULC1usRL9P6H4wLB9siKbbxWnrT22Cujl0Of7Yz0jLsCT2Ys3MCGFrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=FMenZX4f; arc=none smtp.client-ip=74.125.230.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="FMenZX4f"
Received: by mail-qv2-f21.google.com with SMTP id 6a1803df08f44-90cdfbd148aso7068906d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789743005; x=1790347805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=FMenZX4fA7IYYaGVRJ74JORgL+Hbw07S5YoZW625s6FlgiimPPEplqFaCu1De7ETu4
         I56W5/QhtPJLAVld/nTmIBJ790mBWOk4n7LzyWhs6fxs4yoGOGz8+bA413+8tWlDifNi
         eGaqh5ZQLGJv6ATyMyx69py90tY3ihIdArxWnxgWnx20AoCpfJOmLXHZ6jPiqjewxtkl
         4hHaFlHfDqpjuhO/JTWOc9DzQIA5MDDBdiuvZ4pA2o70a/HyAJCwStZ7YEx1/81uitv+
         nayrgUTXY2IEJbJmPVoTWY8y9BjR4RcTR4F4zbD1VBRDOG+k+5ZFEiAh9VvJzwwtR+xc
         41bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743005; x=1790347805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=GlWi1pL/u7rae0tA2aZ5U68o9EYuVAka/NOyB+Bava/nKLDugWdBpcVIZmLs/OVDgP
         RlpzJ9rrBSWXtfEE2Xj8LyleFwXN4la6XQ5QHrwt+RhqAwYrnMTHcyolTjzgwN1gXg16
         vJ/3GHLHPLD/Sd6s2i5DI8+Eo3SSQrG2/+tvz9DVZqc8ma+633FTqe8Q0xDLXuhlyAJs
         ZeIwA1MoRFyb9v67TSnOi8j1WI5o9x0lVdQ+07H8rIMr0SdxTBF/0yc/U4PQMKSxx51I
         14PYSbPMJNEsCPmO7/r/+4jgcLsPFfnJGoLaJT3Qt4E8WzEoD7YtQpO90JSEIP/iMNbF
         UKBQ==
X-Forwarded-Encrypted: i=1; AKwUvByuuYcXgRPEHoS5bt9grJdA+qpJ1LPAHuDdQoAuN7uVXA68GUIcQcGig/FNxAUuFB1z80kmx8eYh/NgEqg=@vger.kernel.org
X-Gm-Message-State: AFuF++lBU2f4IsdanzkF0GDLV2/FAduUGljxHIAfSrI/RoK1Hycnrlfg
	WhKs7WGgq8ZWBMjnlWFL3xuDNdTLeFGasmF2miDPYcC5vrADLcfVOk/ls3KdcaZ4gx0=
X-Gm-Gg: AYBFou3f4/FHK/S8G+1cxlDlRDCwv76dDSY/2JaaNon5Cyqn8kDjeSv20v2T2mCKGK+
	FYEus/sb2qHkhUe0vfk6IkVu8K8SbvOlx3eXPNlkLIU5QtkUYANMUoHPgcOw6MR2TxaWSPeH3lM
	VffuiHhdFZUiAB4ptrc7s+sYGJ5KT5VhTO71xLhpx4WptKcvle/f6fmvbyQJrEBdyo93i53fbTs
	PveuZov3aB6atzhjXeBC0Sd5qOjGRzdO/g7u4znr756CM2Eh0a/bmNb81ZqjdnK7fWSkL/96SPO
	aNeuCTuX9wYzh7p2dlFqiYrUi7z4QshUHrMP6Ddfo6k28Q7rS8RTV1zqK4wewB94Rza9QmzuAWY
	w/5SSG7ftB3eunbUtoFF4NQQVyDJcdoPmnnrZmUtxaB50heCfQPn4sECo8dkp2UO+umFXpqYuey
	S/1dEky3qVHkIo1Shgwwjv/xsYJFpMN2+HXLvpduFvf3jBViLFqtP4LRCxHy9qLQM9JISgPL4rU
	K6hEqJ8hQ86AmV5rY7W+ycbSRtrSsiZtcSuvO7yWT65NUODW5rQNryx
X-Received: by 2002:a05:6214:1307:b0:910:4a86:5969 with SMTP id 6a1803df08f44-91254bd5293mr46077526d6.23.1789743004909;
        Fri, 18 Sep 2026 07:50:04 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91258056195sm14090716d6.29.2026.09.18.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:50:04 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 18 Sep 2026 14:49:30 +0000
Subject: [PATCH RFC v4 11/13] rcutorture: Make Tasks RCU readers Tasks
 Trace readers where required
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-rcu-tasks-preempt-qs-v4-11-63f0e9d69661@toxicpanda.com>
References: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com>
In-Reply-To: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com>
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
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
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
 xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789742980; l=1716;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCK2SKWNSvb8uUIHABRfNQrEJPCWCZeIZnAqX/3f5X/BpUmomCy4y1MVWrdYzX/ihyvEJhShdIA
 kincQ831+1ws=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

rcutorture's "tasks" flavor has empty readlock/readunlock hooks because
a classic Tasks RCU reader is simply code that does not block.  Under
CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption outside trampoline text
is also a quiescent state, and the thing real readers (trampolines) do
to stay protected across their call-outs is take rcu_read_lock_trace(),
so have the torture readers do the same there.  Otherwise a preempted
torture reader would rightly be treated as quiescent and the test would
report false-positive too-short grace periods.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..ab870ef09af0 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1142,13 +1142,23 @@ static struct rcu_torture_ops trivial_preempt_ops = {
  * Definitions for RCU-tasks torture testing.
  */
 
+/*
+ * A classic Tasks RCU reader is any stretch of kernel code that does not
+ * voluntarily block.  With CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption
+ * outside trampoline text also ends it, and what a trampoline does to stay
+ * protected across its call-out is take a Tasks Trace reader, so model that.
+ */
 static int tasks_torture_read_lock(void)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_lock_trace();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_unlock_trace();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0

