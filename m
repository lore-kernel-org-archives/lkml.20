Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B57934AB01
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=Tin1c9OXqiwMRclF4zjheDqt8CXuHD2swHwieABfs9lATKIXZqX8im++cmPl1GZH0iqWUR1dVQ9uVxu+kgEnOrZf+iy5NJ3MPmieMsBFAuFm7G3dLCp6lo6WKiaXWPHYH398mmJNv/6xsHrFgH1nIT7dVcRR0xmNf/ANWXQt4QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=gQ2GOV8Dmrszsdh+wQhrIb1AXtKM9wHta2VUf59x08M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p5wlwH+Pvju2LG2+OfJ/Plnpg7i2iK8iEaa+i4x1hpqzGEDT0tLpZEcGsKOloo9k9yVN0EIcr6GfTyMHcApV+OpEMJWHZnaX4N3Wdn51FM0a49UAqgFNlsgITOXA2DCkXkYTi4X2sx+Qbpe+Iz+GrPyd9rt9aDjp+eCl7Ca71lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=agyzdUVW; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="agyzdUVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=T7
	aj3ANDLcZnLgr2CwfVQ6lQY11yYofrsfu5AMmmt8M=; b=agyzdUVW2XyxzCXQ67
	HzjkCQoNECrQ/JnFx8HSTsqtOjKg7ealzeBAZrV1AlNoetQqStXSMcWYyFQ9+14z
	jkT5xJV/Y8lP4K+Hwki4hct6NYH9IVhuckXOJnNJEVqdjGY8mCL8/9Zcxg8SQrPE
	HuC/stG3UQVqoipirCE8U3k7o=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S6;
	Thu, 10 Sep 2026 12:29:59 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 04/10] sched/fair: Add LB_PROMOTE feature to enhance real-time performance of fair tasks
Date: Thu, 10 Sep 2026 12:29:44 +0800
Message-Id: <20260910042950.1619727-5-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910042950.1619727-1-jackzxcui1989@163.com>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxurWUJw13JF45CFy5Xr13urg_yoWrGrykpa
	93Xr4Yyr4DJryIy34fZr4xXr1ru393Cry3tr1kGw1xXas8Xr1ayw4IgF4UKFs3C397Za1j
	q3W2q343uF1jvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziqjgfUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5wfg6mqiMkeBzAAA3a

Embedded platforms commonly use CONFIG_HZ_250, and testing has revealed
that there are numerous instances of unreasonable CPU idle events on such
platforms. Unreasonable CPU idle refers to situations where the CPU enters
an idle state for a duration of time (t), while there are tasks that can
run on the idle CPU and are not limited by cgroup constraints, yet these
tasks remain unscheduled for a duration greater than (t), t > 2.5 ms.

Testing has shown that over 95% of these events last less than 4 ms, but
there are still some instances of longer durations between 4-5ms, even
occasionally between 5-10 ms. For a real-time system, scheduling delays
greater than 4 ms can lead to performance spikes.

Enabling this option can effectively reduce the occurrence of unreasonable
CPU idle events on low HZ systems like CONFIG_HZ_250, and completely
eliminate events exceeding 4 ms. Note that the feature only affects fair
tasks.

Note that enabling this feature will increase sys%, as it uses CPU time
that would have been idle to expedite the scheduling of tasks. There will
also be some CPU overhead involved in searching for suitable tasks.

This feature has been split into several smaller patches, which will be
elaborated on one by one later. Below are some test data:

Test one compares the number of unreasonable CPU idle events and their
distribution when this feature is enabled versus when it is not, under
the same fillback scenario. The test duration was 60 seconds.

      LB_PROMOTE(on/off) 2.5-3ms 3-4ms  4ms+
index 0               on       0     0     0
index 1              off       4    13     1
index 2               on       0     0     0
index 3              off       6     3     0
index 4               on       0     0     0
index 5              off       1     1     0

Test two compares the performance of the system with and without the
feature enabled, based on the same fillback scenario. Each test lasts for
25 minutes, and a total of 15 comparative tests were conducted. The
results include a comparison of the maximum and median values of
end-to-end latency and sys%.

LB_PROMOTE(on/off)                    on        off
end-to-end latency(max)              172        180
end-to-end latency(median of avg)    166     167.68
sys%(max)                           9.68       9.35
sys%(median of avg)                 8.81       8.55

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/features.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 8f0dee8fc475..4916a4b89ab3 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -142,3 +142,27 @@ SCHED_FEAT(LATENCY_WARN, false)
  */
 SCHED_FEAT(NI_RANDOM, true)
 SCHED_FEAT(NI_RATE, true)
+
+/*
+ * Embedded platforms commonly use CONFIG_HZ_250, and testing has revealed that
+ * there are numerous instances of unreasonable CPU idle events on such
+ * platforms. Unreasonable CPU idle refers to situations where the CPU enters
+ * an idle state for a duration of time (t), while there are tasks that can run
+ * on the idle CPU and are not limited by cgroup constraints, yet these tasks
+ * remain unscheduled for a duration greater than (t), t > 2.5 ms.
+ *
+ * Testing has shown that over 95% of these events last less than 4 ms, but
+ * there are still some instances of longer durations between 4-5ms, even
+ * occasionally between 5-10 ms. For a real-time system, scheduling delays
+ * greater than 4 ms can lead to performance spikes.
+ *
+ * Enabling this option can effectively reduce the occurrence of unreasonable
+ * CPU idle events on low HZ systems like CONFIG_HZ_250, and completely
+ * eliminate events exceeding 4 ms. Note that the feature only affects fair
+ * tasks.
+ *
+ * Note that enabling this feature will increase sys%, as it uses CPU time that
+ * would have been idle to expedite the scheduling of tasks. There will also be
+ * some CPU overhead involved in searching for suitable tasks.
+ */
+SCHED_FEAT(LB_PROMOTE, false)
-- 
2.34.1

