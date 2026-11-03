Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.177.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727865;
	b=FfZwg4gn/6IQkmjGem4+qKcx4s4AMAsYM99RoLtqYSOIm4Eay84ApzINWeCb2/lKI2XV
	 WQT7djyxWxRNkQwEV1lmUKdcFcZApfQA/3dSiQhcRuSBzhysoPdmeaVfQ2RjgyefGzHXX
	 8T4UsTN3I+FXeCQC8nfhJxybh37L7wK9TZwnR9pcjHAYWRv89FQMt42DVkEbXBz7S1N7S
	 q1cXmuBvwuvSDpLNBfNaZuyi1SSTVeicrbW7Vxjz6tijXlIXYS9mLbSq5K+x8aSHfVs5l
	 NZhaadEeI/4pxD1PjR7Pk/kbj/j8ocztPghqLPn9DbO6iwh5cAvdzinU7gBE+YJVgNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID;
	bh=o9yvLNi+CPRFYQBhqMNH7MrxSrvu9jT7DdrFrPvSgRI=;
	b=HrHHTf9vGZy181q95JZ8ptQfcD65Hff+ZyY/uI24W7hG5S1V5EdphOFQi2dcLQ3z21vw
	 xz+4tmGhTnaPDvYJJhWAJd8OINgeR2ecVVGcctiQ+R2XnKApFLzqdapGCqCSV20uxEdsd
	 5QgUVheVhlQHWZ7A6SKMOHxtxjox2HIWgYJBgljFr6iRTMALdf8kxa7qSQnUKWEePPlp4
	 BbLITL8wEh1IKDvh9Q0eX0YJU2KRzJxgQ+KrjNBEyEXyCl8ytanGv34yjvtiWMrXhW0O+
	 yFDVvkBJq81Ij532Mej6uONjW6xmRAidY+wsaU7MzVGBwMFcl4UawRmEDs3Jsg37+cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=FFe4BFei;
	arc=none smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667AD606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 667AD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=FFe4BFei
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E5kD33533630;
	Tue, 3 Nov 2026 17:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=o9yvLNi+CPRFYQBhqMNH7MrxSrvu9jT7DdrFrPvSgRI=; b=
	FFe4BFeikYorYkDvteLN1uDPjYQuAoYaW9beJAxm9TLDPzT0Aw7XGdBSDSAqNfsL
	LaX1kZ0QQSFcJ3liYyI2MCUZ/rk+0SzB7vjiKfXGiXjUHVUNkaEbGzpE7rQEaVQR
	eJJ/sVApG72iMoQ6LsE+mrVLWLTJgoZfJrO9Zre2yjDck4s3bSHKhVN3/bkWBv6M
	NXvu3UY6CNEuLxLn8xy7FZ3JTEik8qt/aggU0TZgi8/lXlbpDst1EorFv5udTIL8
	2s8tEkJw4hN7OS3w/nYPdCLQThdautraGQbr898UEIAswbR5Jsm1EjB4TVqy4LKp
	OgfKEEGGLi3Q5iUPDTCHow==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hn6r9vqgm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 03 Nov 2026 17:44:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPrd42435132;
	Tue, 3 Nov 2026 17:44:14 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4hqk4njvpn-2;
	Tue, 03 Nov 2026 17:44:13 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>, John Stultz <jstultz@google.com>
Cc: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/2] test-ww_mutex: Bound inorder stress test concurrency
Date: Tue,  3 Nov 2026 18:44:07 +0100
Message-ID: <20261103174409.1398249-2-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261103174409.1398249-1-haakon.bugge@oracle.com>
References: <20261103174409.1398249-1-haakon.bugge@oracle.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030070
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfXwRIZBc2vXDBq
 9+o8e968Pz0S/nWrRctAn63vXEdi+iGHcLRA15ZKik/1/bNyRyXApaHXlyDnazUGD6ADPUIE+qv
 ASVfykMF3LnX543i4/+VPaR1eB6wGPdNLnSm9d25pz4fXwDZZuLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX7ZfoH8znUnxM
 HwvHfNhmiKJkJ6zwzEJDKA3mlh0JQpGH1rUVL6gHMbaGpdI32fsrThwjH3y4chkXYt9Vq/8K5gP
 OlFPnquEtJ4Wrq3R6Yh1broJ/uaqFteV9gOr8SURpmMx+9MVkfztDhV14JARqd13q02h7JANPdv
 LWYIT4A/lOZDKvtNFnB5BhMXNne8UCm3NV0sY5Mk+p9iZv+qweU5CemsqMRESj2cbYw2NjCRqla
 KJ+2uOPQD1AntQSZs6tneHa117HOzrgmrdwjWcHnZ1fkm5iMRDNBK3YC+7/TVvqteaW9sczGhIz
 hqWR/NWKPi/a+58ggvuweby2ZlJv72Sh1MPZQJYCEFfRLHNVcvgy21O/mMg8uOnYkECtT3aDXaC
 XivIgiBNS16DS+eewse0wGh82JjIYPZFOED3UCr+93M66iuEB9ODtm1sA1q4LKxuBRjsdG7G6xj
 GyQZeuE2Y0itVXcNYTEb/wpE9K193TP96mJK9XXk=
X-Proofpoint-GUID: amliZSJLZxLkTA03eCB9JaoKnwRM_iR7
X-Authority-Analysis: v=2.4 cv=EdZd0/mC c=1 sm=1 tr=0 ts=6aea1d6e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22
 a=yPCof4ZbAAAA:8 a=lktUxaRpcj_qRIFOMJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13532
X-Proofpoint-ORIG-GUID: amliZSJLZxLkTA03eCB9JaoKnwRM_iR7

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

