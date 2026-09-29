Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40173D75BC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702186; cv=none; b=HpddRoNcIvsjSh0BkFaDLYmgsas+vyrWs6IQAJDvhwjWuQdENvroBrqVMDB6uvJ/xRc5j8ffp6czeLbjUkHzxyKsHUdXkENEtKie88n0gLolKL5vJbfjZPuVifphIzyaPP6XkmhqZe3Zy9SYEIP8u8UPlNxPHwaj8Er1eynJWz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702186; c=relaxed/simple;
	bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEagymuv2WEcz7oaoT/hABD6wDh03cDdQPnjg3/iurdHtE2/UtY0oIjcIMC1X65oLN/SUxWYuUbThIZsPGqTLp/hqglcD+0N2bD4QvTPO6ozMDk6WBEVu9O0GAxlqs4uURLryZ5JwjM3si+AOWuuYIm5Gm0tCHAGLwTxWTSDPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=RdaydNM3; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="RdaydNM3"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91058dd77a2so42955486d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790702183; x=1791306983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=RdaydNM3P3WI9DRxOf9UXQckzoS3MeQ7aF3YGbSZIsbgTwsVj7UlwtpRjOe2RhLpfd
         UafjXQY9G9c7DjNhiIZxyLYTBsgA2YnjM19keg9zXuJ+ghbSwa0jI4zwL+wdi8kETaGQ
         Z8Hzs/QZCLA+qtcjG/ZudMiTv0EWBrdxiEJqIuiUZXNKeDS9UasjWAcj6OEHpNBFJyS1
         HH05nk+1lMUXRI/In25sy7oL9e4n7KALFckZl3KeF1b6Htn25cvNI4BNpK1Bsxk1iexn
         vtAYgEc4wL15qXkWJhjoNH1pmg8Ee3mrBJ9JUovWBPP6w2CFrigvl7K7xamz3D6uYgKd
         rVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702183; x=1791306983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=kdpag/Lc6pnhVv+/v76J2xkWpkpg4KGM4k6BZ7mHhW2n3SQGHDJoWJ87GLpAgsKUqO
         M3EnHHaDAfrs80NT8Az4P9k6+y+CMy5OME26JIC8itrqIMDcLCOZSt99hY3/3thfvKyM
         iip9fhBzmdxU16Gu1g3UASbTXljzPO3TUfj2SwG6KfYNy1hC4nzf1kmxTmp8fY664uP8
         +e2Zt2EskZR2K6s9gZiaT6klUhH2PB2Dqo938MF/tR2AOFg/bY9w5KO1+G5qZukcwHtC
         9FRgpV5mJuHQE0hldmlmqZrUZYOJyYwDuWqWhUYdZU6Eoz22soKuWQ52jjzr2KFDjRzy
         RYGA==
X-Forwarded-Encrypted: i=1; AKwUvByrU3eujoh2cEYBZa+mvpTr2DLvzokxRRisC7e7ft9CeTAyM8vDO48g1ft9vstZP0PD6GRsswVmm0Jcsig=@vger.kernel.org
X-Gm-Message-State: AFuF++l24eT0M2ZJmSDiGgx4B8TjCzNcQnunmGWs8n1J/BUb60XRoZS5
	sqWc8jQNmnwgP6QybKBn8f1C+vzF8EQ60sP3Uh96AQ1rvVVirUxfV11dTfDv4aRjrdM=
X-Gm-Gg: AYBFou1e3GgNmBwoC6jq37eZeRVgWr5XGyDe+D2X5GtwRwYUWWf0B11wpgWYeVbQueY
	idrIOugDpac328iLgSdTdV4QvRP7zP+xScXAIygpLh5bVgdOX2THJCzE6AWn02pYLb4u0aFfsHe
	0gRKGtRyUoAJqMTWz/ILRjjSJP7IMphbFJ5OqPS5LpiNjZw0jCci8z7G5C3j0WiFXI9Oz2D7etO
	ePbJd80bcsYK3nX6FjAwTdmIAnj7i4XOfvtHluWd272HJEvIdkFbIG/5+qDQ4f7VByeYbbWKRwv
	gwhe0zfpEe/QHAR6Q4EjE+Bps/qTbwJUT5Tz0KAEStJrnbD0ZZfEyZ6ZKRoitkAHiPdfbnia267
	JFwYykLxA1wNea2ub7z5l7xT9asRtiwgV76wXaZDMG1SzfNKsnvm4Qh+7oK8f4ZfhdHGD9QudMS
	2mR3C9a22X+0UbKK6tDZPTHSTU8kB2fi1h/Ulk2JCO1vS76HULlPs9HRDWV9xYvWrZHOva3KIiL
	uAN9QsR0VXBQp4=
X-Received: by 2002:ad4:4ea3:0:b0:917:8c86:6608 with SMTP id 6a1803df08f44-9178c8685e3mr38720066d6.42.1790702182375;
        Tue, 29 Sep 2026 10:16:22 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917981f5c18sm546196d6.0.2026.09.29.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:16:21 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:29 +0000
Subject: [PATCH v6 12/14] rcutorture: Make Tasks RCU readers Tasks Trace
 readers where required
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-12-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701682; l=1716;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG3jQwCkEzXVFZFj5OJPsasIxdbQv9M/HHEGtLd8yZhbdChJa1bb33IuFQ5NDeb24Kaa8oYTn7u
 N5DM7Y1DOQA0=
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

