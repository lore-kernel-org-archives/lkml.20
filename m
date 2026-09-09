Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C99556854A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964920; cv=none; b=oCazA55aR+ipmqSdxEtdIVJR3KKA61RKTe9gXBTuZ0vM8A/QmUanRRBUV6cXf3d9DCRtOIIpo7wqUxJM6T0pEb8hPR1iRn6qQIMmu2/K0Mcl5Ihm5aUNM7SG6/9ediTxE9lC0inx3UDFQ1zhwmNHD2pql0VM3VpVAGbLgF4+Atk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964920; c=relaxed/simple;
	bh=M1Gylf6wA82yPdj1PN6Ikvlijlb4yI0QNUe25VZV9eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DSzcP14bW3lBt6twGl9fW5EH6xGIbtg2sKUXLRS4XKM6q5NA7UHt0t8RwCTTwO4TPE3TWftgisV+x5v6QSQ2tBimAMGxFyTixkiZZJkYg2yRtbcXfLe0wk9ZM47uVsX7o0wmC6ZxbBME6yt9wvHfSdSRvvo3rPpH79MzqSUfTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ErVuDO/u; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ErVuDO/u"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BuS542027230;
	Wed, 9 Sep 2026 14:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=o9yvLNi+CPRFYQBhqMNH7MrxSrvu9jT7DdrFrPvSgRI=; b=
	ErVuDO/u54z3NkJv0e8H5VLLHqH/rks+zEZI4LobPn1fElRrUdhR/XP7C0Qbsq7+
	/0/dtJVOUI04N9DzDm8aWKl/mEzS9nffhcnFsZTyjMSyGJkvDsOTXwk59QaLorL3
	NMCB2f4tH6701IfOdTdeg0IQp1m7SIO73QKoLpvpT1aHiUsdOWVvr0FfHG5hOpd8
	PODb28MlrcWVhPeD9u/p4KExtRITcxyZDCTXeKXxeszyDqD6oHiltRGADiDegvDi
	HjrHw8Trgbtbdc3G0quEMY2EdSQ5naCLF/7V0sP6hp0mQUn1BREJ6Am39JGiIJwx
	bLOGqm0JFYy8pTcM84wiKg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ggbhuna2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Sep 2026 14:41:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 689EZTEj033202;
	Wed, 9 Sep 2026 14:41:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gh755rh2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Sep 2026 14:41:47 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 689EZQiA032950;
	Wed, 9 Sep 2026 14:41:46 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4gh755rh14-2;
	Wed, 09 Sep 2026 14:41:46 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>, John Stultz <jstultz@google.com>
Cc: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/2] test-ww_mutex: Bound inorder stress test concurrency
Date: Wed,  9 Sep 2026 16:41:32 +0200
Message-ID: <20260909144134.2979555-2-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260909144134.2979555-1-haakon.bugge@oracle.com>
References: <20260909144134.2979555-1-haakon.bugge@oracle.com>
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
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2609090163
X-Proofpoint-GUID: 8B2tRtup9si7p0liabFHIoUl-Eu0gQjd
X-Proofpoint-ORIG-GUID: 8B2tRtup9si7p0liabFHIoUl-Eu0gQjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX6Ti/dNTcxHHk
 DdE4f6L40MEjN/hCCMMm69WaqPyQqQ6jVzjObgZtNpMga+qRqY3uNuaJM6yBg/H1pjDFikQwWSd
 JZAHGGOjgWDqDTHbeqaheeYO4NaDIhda5eY1H0kRVZCxgYAK3+LpktJyxMMuZMX+0jLYX11Hgah
 mveGKV42GhUY8LsrY/s2ia+Ueo/Uh26jjhAviGYcus9jlx2PfV6p29yBACwEduwGwRo6sMweyMn
 OEHh1JAeczvQ2GDsOHUB9Z0D2wTnovnysXHvaN4K9mVJytD5Tyqd9LV65mr0U1MPaYubFfajO5w
 K3pLsfDzMvXmk5+jahDQWUDNMYSSb5BBSjK24IDN8tJtCt2lpRmrBUOB7soqWXSgoK/+o0oR2n0
 gRcZ5KsO4PRESEckaGy2OGD7nwUPQXHPE/ZkYg4zcME8jbtp3TeI2WFz08FAQsHqngx464ESHJj
 /IXB+jSMV7iJexDnQzSmiJ68thrRWn1ZIOjubDg8=
X-Authority-Analysis: v=2.4 cv=S4HpBosP c=1 sm=1 tr=0 ts=6aa1702c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=yPCof4ZbAAAA:8 a=lktUxaRpcj_qRIFOMJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12105
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX1/2eWpm9VUnP
 BO8tPQZy5T9R01yGc7cchaYp0tN05a20gLMfCHZsnlYFYb5SzuD8Eoqg5u7yiKZMmQ1VDcjUHtG
 qH7rXXn3RNG6LEJ7mR2Pi2KvANtqywOe/n7lx484tqSW59Svx2ih

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

