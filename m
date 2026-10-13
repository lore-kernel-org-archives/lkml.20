Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1408D389104
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898283; cv=none; b=cLHYSUYK5P5W5UKFoPDrxOFklvHr+Hr2TzdQYvakt0rABsc4n949MUx/PRGiuRFZRx4DGdCzC71SkPPHbJjI/RKpoxEBzKLQoq6YIvpNaQm59IreGuJGIDwBF2CruT3SmTjvjiCfXHxXLqT/UFhq5pZOKImMEUPrhRKYWXrycIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898283; c=relaxed/simple;
	bh=M1Gylf6wA82yPdj1PN6Ikvlijlb4yI0QNUe25VZV9eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CL3hiASHM0ncawdAkNJ4tC1GG3Kz09bBcnr+P8PeOxKwo0W1xtUHHLycbViOJsnUsGCDFhK6UoSFbrvqWnkbAWip7CxnvAgby09laJxsQBhxQq9Y89Hz7M9ZGVpUtSj3rQlBeHeFhO7f+cAD7PZYRcXSufnbmrMFnAT44ntervc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y4A3oCX7; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y4A3oCX7"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2BxDe3198121;
	Tue, 13 Oct 2026 13:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=o9yvLNi+CPRFYQBhqMNH7MrxSrvu9jT7DdrFrPvSgRI=; b=
	Y4A3oCX7CGpdRVRvGacvGKOWV6ZI2WWMYXszxYvAXMA62L/FWUPL4V8Wq4/iqpfV
	g7j4S9XdqywZJxrpbd6EcUAwqHumR+tBW9K9imlRREe43uIggW1Njb0uUQJIzekC
	jxHXkqbmla/SrmsQ/s2OuDSsyq/WDKybdhkyYDcg7jWn0LJDliBzJKdpE2dwEeTX
	8Z2WFH+0AbjsEF+M7BvtnIcEzOrtlEUFnNTmETdKMbZzxjv+bFUXAVywCSMD/Cwk
	OhCbYFMTQwjuqB86kSvWGZQERgkBVNXi4t+aeZ4JmXNxyq6Rjb0f/FtOS4g3kTPO
	osnPje75zgCtQ5uk5ZPd1g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h7dcsc3a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 13:31:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 69DDLgJx016582;
	Tue, 13 Oct 2026 13:31:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h7btphph7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 13:31:03 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 69DDUwXT014262;
	Tue, 13 Oct 2026 13:31:02 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4h7btphpbx-2;
	Tue, 13 Oct 2026 13:31:02 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>, John Stultz <jstultz@google.com>
Cc: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/2] test-ww_mutex: Bound inorder stress test concurrency
Date: Tue, 13 Oct 2026 15:30:51 +0200
Message-ID: <20261013133054.2625272-2-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261013133054.2625272-1-haakon.bugge@oracle.com>
References: <20261013133054.2625272-1-haakon.bugge@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2610020000 definitions=main-2610130053
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX37IZO03cpsk9
 3xu2mM3/9FyHgkH84eQQlif67F4cXhQZ45gPmLyf9jzP7LLr9S09ROum9kwLcBteuf+6S917DdO
 0XSdgLmqBHXmp4xQbK9cJAkqlxF7DNvKqKydwXSzbn/P7yCURMXm
X-Proofpoint-GUID: _SPzbdQnLAOK1riHjn17zZ_tG-rVEkib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX6OGTkv4O/tD5
 yVnYSG0/8EqyPYfWReT4JTtRwGMvHOq1e9xTvwZHuYeV9h0dZVHAbb3pf7t/wMSvROv9BQIqHwk
 tNinT/VElVqFGzQ7eU1zu4jMpeAd2WmYXhrPuZw2Bh7Yr9pvdJCJAA1DAQ0j924/1LI/24T/R17
 q1q25DKsdYURVch027PaQ/UGpW9xIb8Y9yO+GMnKJ6BAToUgAbdpiFtQSm4lhmeQ+snOraGF3Ir
 /L0Yhvn94ybIWrFPGRybapa5a6thPiujDz4+sACUb+H+r7TUtVQUyDHeLLrkAA75J9p/v2khePC
 nDa+2u9QT7PAuoyLwRBq6TbB3sOw2eczOdPheTwv0c0ZmMmeE27vocdxxrYTs2MQYljKnIU9Lh/
 +F8bwJi/P/T2zA2aIY1wTWyUQ4LyrLum5fgbPrAPuJuRwjd3X6Wrbh2hf17J4jyi/X0Cl0uUchU
 FrRbQjWeGZjYiC6ZwBmmNGCYOiaOb9VfPbNOxbbk=
X-Proofpoint-ORIG-GUID: _SPzbdQnLAOK1riHjn17zZ_tG-rVEkib
X-Authority-Analysis: v=2.4 cv=EdZd0/mC c=1 sm=1 tr=0 ts=6ace3297 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22
 a=yPCof4ZbAAAA:8 a=lktUxaRpcj_qRIFOMJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107

The ww_mutex stress tests can have difficulty converging on systems
with large CPU counts. In particular, as the number of workers
increases, the inorder test may spend more time retrying after
-EDEADLK, reducing the probability of converging within the allotted
time.

The inorder stress has particularly poor convergence at high
concurrency because repeated -EDEADLK handling causes workers to retry
their complete lock acquisition sequences while competing with many
other workers. On large systems this can prevent the test from making
sufficient progress within the allotted time, resulting in
false-negatives.

Add one cutoff for the inorder test when it runs in isolation and
another when it runs concurrently with the other stress tests. When
the latter is exceeded, remove STRESS_INORDER from the enabled stress
tests.

Give the inorder -EDEADLK retry path its own extended deadline rather
than using the general stress timeout. Also determine whether a worker
runs in isolation from the number of enabled stress variants, since
STRESS_ALL may now have variants removed dynamically.

In summary, for the inorder stress test:

* Cap the number of threads when running in isolation
* Cap the number of threads when running concurrently with other tests
* Extend the deadline when -EDEADLK is returned

This bounds inorder stress concurrency on large systems while reducing
false-negatives and preserving coverage of the combined stress
workload.

This has been tested on a 160 CPU Arm system and a 512 CPU AMD x86_64
system with the following four configurations:

PROVE_LOCKING=y, DEBUG_WW_MUTEX_SLOWPATH=y,
WW_MUTEX_SELFTEST=y

PROVE_LOCKING=y, DEBUG_WW_MUTEX_SLOWPATH=y,
WW_MUTEX_SELFTEST=m

PROVE_LOCKING=n, DEBUG_WW_MUTEX_SLOWPATH=n,
WW_MUTEX_SELFTEST=y

PROVE_LOCKING=n, DEBUG_WW_MUTEX_SLOWPATH=n,
WW_MUTEX_SELFTEST=m

All four configurations passed 1000 iterations on both test systems,
with the following commits also included:

("test-ww_mutex: Fix deadlock in test_cycle_work")
("workqueue: Add missing EXPORT_SYMBOL_GPL for workqueue_set_min_active")
("test-ww_mutex: Handle transient -EDEADLK in test_cycle_work")
("test-ww_mutex: Report errors from stress workers")
("test-ww_mutex: Fix module cleanup")

Fixes: cfa92b6d5207 ("locking/ww_mutex/test: Make sure we bail out instead of livelock")
Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>

---

Note to the maintainers: Since none of the above commits have been
merged yet, I am happy to include them all in a single series if that
is more convenient.
---
 kernel/locking/test-ww_mutex.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 01af56b0bb6c0..9eace93761db6 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -406,6 +406,7 @@ struct stress {
 	struct ww_mutex *locks;
 	struct ww_class *class;
 	unsigned long timeout;
+	unsigned long timeout_edeadlk_deadline;
 	int nlocks;
 	int result;
 	bool run_in_isolation;
@@ -495,7 +496,7 @@ static void stress_inorder_work(struct work_struct *work)
 			ww_mutex_unlock(&locks[order[n]]);

 		if (err == -EDEADLK) {
-			if (!time_after(jiffies, stress->timeout)) {
+			if (!time_after(jiffies, stress->timeout_edeadlk_deadline)) {
 				ww_mutex_lock_slow(&locks[order[contended]], &ctx);
 				goto retry;
 			}
@@ -608,6 +609,8 @@ static void stress_one_work(struct work_struct *work)
 #define STRESS_REORDER BIT(1)
 #define STRESS_ONE BIT(2)
 #define STRESS_ALL (STRESS_INORDER | STRESS_REORDER | STRESS_ONE)
+#define STRESS_ALL_NTHREADS_CUTOFF 64
+#define STRESS_INORDER_NTHREADS_CUTOFF 512

 static int stress(struct ww_class *class, int nlocks, int nthreads, unsigned int flags)
 {
@@ -630,6 +633,10 @@ static int stress(struct ww_class *class, int nlocks, int nthreads, unsigned int
 		ww_mutex_init(&locks[n], class);

 	count = 0;
+	/* Remove STRESS_INORDER from flags if nthreads is too high */
+	if (flags == STRESS_ALL && nthreads > STRESS_ALL_NTHREADS_CUTOFF)
+		flags &= ~STRESS_INORDER;
+
 	for (n = 0; nthreads; n++) {
 		struct stress *stress;
 		void (*fn)(struct work_struct *work);
@@ -660,7 +667,8 @@ static int stress(struct ww_class *class, int nlocks, int nthreads, unsigned int
 		stress->locks = locks;
 		stress->nlocks = nlocks;
 		stress->timeout = jiffies + 2*HZ;
-		stress->run_in_isolation = flags != STRESS_ALL;
+		stress->timeout_edeadlk_deadline = stress->timeout + 2 * HZ;
+		stress->run_in_isolation = hweight32(flags) == 1;

 		queue_work(wq, &stress->work);
 		nthreads--;
@@ -719,7 +727,7 @@ static int run_tests(struct ww_class *class)
 	if (ret)
 		return ret;

-	ret = stress(class, 16, 2 * ncpus, STRESS_INORDER);
+	ret = stress(class, 16, min(STRESS_INORDER_NTHREADS_CUTOFF, 2 * ncpus), STRESS_INORDER);
 	if (ret)
 		return ret;

@@ -727,6 +735,12 @@ static int run_tests(struct ww_class *class)
 	if (ret)
 		return ret;

+	if (hweight32(STRESS_ALL) * ncpus > STRESS_ALL_NTHREADS_CUTOFF) {
+		/* Make sure we have a run with all tests running currently */
+		ret = stress(class, 2046, STRESS_ALL_NTHREADS_CUTOFF, STRESS_ALL);
+		if (ret)
+			return ret;
+	}
 	ret = stress(class, 2046, hweight32(STRESS_ALL) * ncpus, STRESS_ALL);
 	if (ret)
 		return ret;
--
2.43.5

