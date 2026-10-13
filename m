Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86913D53C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898283; cv=none; b=o7VgYB7YIVFETSOSShAH5XSJ0p9ed75oUFuWL03yiIn1Ov5jEEwO5EfZ5VyUbD4jl3ddWfYP8OKMkEf7m0YRL4YgHRxwlpH/pb8qly2zbyvKyUK4EPswaX4CW1I2GIXzpDNyfhv58eJwd7NTKNTxNLUAsZ8DAp0TRIKT7kB8uYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898283; c=relaxed/simple;
	bh=2H7wvitAMNWSkVHVbItEdyUgymmXQEJ4BVU7Nzg3Npg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=URrbaAsL63yf0+JXOmgb+HfYV7e/TRgYDey1dsxnSO+/TdQfQlUNt1HesJ+kgVywG7OiHebsOcQkFJUURRScp3/b8an6VPvCxUQ2K6qy5q1Gck40PUB6lQ8Sh8LluCJZLzGVPjWx//i+vYq7W9YqboIDnZ2NyZU4mM5Dxt/AuZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dK/f74JQ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dK/f74JQ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2CbGl3031881;
	Tue, 13 Oct 2026 13:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=06lN3Fwz4twftnr0
	zpISiGj0PUcp5NbI3v0D+O/XXkI=; b=dK/f74JQ3FQDsPbjJTxko9sHgcIvSNQv
	drK5FIPxkzP17hwVG3vwWtRW47SAibFG+7TmoKvor2p0sL1b6vNntE4/TBrbUCV0
	wAJVy7b0FjE+2nzee8jdFHAtNIMFU9bqP7HEDMx+tMxjuQaS5HBR6Ip8LTVGZl3e
	1BdUV3qqYGg2UquLoVhSNhe+NPXedS4CQ2H+Gz52cC/AYBMnradjejmS8eyj9JGw
	xeEO4L0HO0Yy6i0A6EgQlzww7rgXq/G+Ti2K/t0B3CGBaLGtU8XkURBYDgAfIuau
	kFy0CeNgcfcfn0OnaD1xRhBn7VVk+tFiFZ2NF2xxmFC8FShCkA96oQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h7dwtc1kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 13:31:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 69DDLd48016525;
	Tue, 13 Oct 2026 13:30:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h7btphpda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 13:30:59 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 69DDUwXR014262;
	Tue, 13 Oct 2026 13:30:58 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4h7btphpbx-1;
	Tue, 13 Oct 2026 13:30:58 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>
Cc: John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] test-ww_mutex: Report whether stress failures are isolated or mixed
Date: Tue, 13 Oct 2026 15:30:50 +0200
Message-ID: <20261013133054.2625272-1-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX62mQ3pbd3cRr
 /wXC+daz69mJuUFprHay+3Z/VzeC8gXEh7pFS25T0uwJzIwJJ9iUzDgSK9yfY4mnOpKGR0wkXB0
 Thot0pmILDwd7e6wv5KUeU0AGU0wBCBvgokYHyhgD58g5BITJ77z5kpicvLsKxaIQJV8C1uut1v
 sGnwbnenoLyTuuMLlZCHiq54xrnYUKDXKTmQ73Pvbt5Iw+0oGvtPYyiqJnAKZ7tg/fOsny7yTGN
 Jmcjs4H/YQ06pDH0z7vKFa2lvpNZX7AU2AC5oWblnzk2KAlL0Kf/azovjkX0ajl8StKKjFByr3k
 irNv/Rm48HwdVHdsObLyHNHepqHevjpUUIMOsjgGpITFCCax8rzPqhwGz+lv3HqF56ssW7jH7kh
 lJ8/LAKwiOPZ3sUg9oy9WXnG03Mbe5PJnT49fUGOEpQu9rfWC0MrtJgD8wRYQcRmw8vLpFuvP0G
 Z3QFZ7Jrywtlri601hD3cIal0ZbKAI4uqIoeYoyM=
X-Authority-Analysis: v=2.4 cv=Kp7YSmWN c=1 sm=1 tr=0 ts=6ace3294 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22
 a=yPCof4ZbAAAA:8 a=ndBhsA4XpGziXSlQFrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-ORIG-GUID: 96DGK_yRzW5Rh3SPb56tzaEQTkeZ-fsI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX3FMZaGlHyckK
 LEElk1rbZZu5+dJUVZ+Lym1jZIJ4F6UYr70ArqrzrG9SNzOksVny2oMVrOMhYxd47UySrVZLKaX
 vWNgddYFgxeM8QSQzH27DJNQBMb4QoA9p7KWH3mNmMHwL+8+PqNz
X-Proofpoint-GUID: 96DGK_yRzW5Rh3SPb56tzaEQTkeZ-fsI

The stress tests can run an individual stress worker type in isolation or
together with the other stress worker types.

Include this information in the error message so that failures can be
distinguished between isolated and mixed workloads.

Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>
---
 kernel/locking/test-ww_mutex.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index e11f6b869b4d4..01af56b0bb6c0 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -408,6 +408,7 @@ struct stress {
 	unsigned long timeout;
 	int nlocks;
 	int result;
+	bool run_in_isolation;
 };

 struct rnd_state rng;
@@ -449,6 +450,11 @@ static void dummy_load(struct stress *stress)
 	usleep_range(1000, 2000);
 }

+static const char *in_isolation_or_mixed(bool in_isolation)
+{
+	return in_isolation ? "in isolation" : "mixed workload";
+}
+
 static void stress_inorder_work(struct work_struct *work)
 {
 	struct stress *stress = container_of(work, typeof(*stress), work);
@@ -497,8 +503,8 @@ static void stress_inorder_work(struct work_struct *work)

 		ww_acquire_fini(&ctx);
 		if (err) {
-			pr_err_once("stress (%s) failed with %d\n",
-				    __func__, err);
+			pr_err_once("stress (%s; %s) failed with %d\n",
+				    __func__, in_isolation_or_mixed(stress->run_in_isolation), err);
 			break;
 		}
 	} while (!time_after(jiffies, stress->timeout));
@@ -551,8 +557,9 @@ static void stress_reorder_work(struct work_struct *work)
 				ww_mutex_unlock(ln->lock);

 			if (err != -EDEADLK) {
-				pr_err_once("stress (%s) failed with %d\n",
-					    __func__, err);
+				pr_err_once("stress (%s; %s) failed with %d\n",
+					    __func__,
+					    in_isolation_or_mixed(stress->run_in_isolation), err);
 				break;
 			}

@@ -588,8 +595,8 @@ static void stress_one_work(struct work_struct *work)
 			dummy_load(stress);
 			ww_mutex_unlock(lock);
 		} else {
-			pr_err_once("stress (%s) failed with %d\n",
-				    __func__, err);
+			pr_err_once("stress (%s; %s) failed with %d\n",
+				    __func__, in_isolation_or_mixed(stress->run_in_isolation), err);
 			break;
 		}
 	} while (!time_after(jiffies, stress->timeout));
@@ -653,6 +660,7 @@ static int stress(struct ww_class *class, int nlocks, int nthreads, unsigned int
 		stress->locks = locks;
 		stress->nlocks = nlocks;
 		stress->timeout = jiffies + 2*HZ;
+		stress->run_in_isolation = flags != STRESS_ALL;

 		queue_work(wq, &stress->work);
 		nthreads--;
--
2.43.5

