Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FB568544
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964919; cv=none; b=tV1iGhDBdPKxCBmhgTak9mYsvMSWiEsQ31ATkqckW7agn1hkeX08H+dx8E7jY/DCp2+35yO6+QP0Q2/pEV8GUyEjmRLn1a6AlR8mEo35HjjcewCs/n4z6YOmrDrGx+mO5DhwUWcjrL4Uu4Dl6AiUr8oPAFqVhxn3Nfusq1ezr9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964919; c=relaxed/simple;
	bh=2H7wvitAMNWSkVHVbItEdyUgymmXQEJ4BVU7Nzg3Npg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NUODV4iZrky0LXW0DNZglE41G4yjQX4OFCQYoIovyUZCYPckypNsARjCMwijIOjJ4y/y4UYaK76W8WLkHjLzC6XDaPv7SfpvsHAwnyeTttsoMjdeHgE9ex2nw5RkbiP0Ccbb7XrxogY53BNP+dpDwzQVOL53PTcSM3im1Yvz2JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cKOwcgo1; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cKOwcgo1"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BuSpJ2681191;
	Wed, 9 Sep 2026 14:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=06lN3Fwz4twftnr0
	zpISiGj0PUcp5NbI3v0D+O/XXkI=; b=cKOwcgo16vfIvZ76h+SIn/EfCanAoQ3U
	CUPkPiHbQM3tfRodqxszPfTPTj03S8SmTe4olvBnvTzVzQIHR9k25szGQ0vu9h15
	mZUIDEDZchtrMHyKXle/gTb9HE7IArCZNMPXJt8ts28tJVqYDF5Tiy2tXXnHvkrF
	3cqSVFpONZu/2XGKo4mnSAUnAgMlrxzHBjoYj2OF07NFfPuUyIIelANnmL0KixbM
	J5BVcprq1iwRFCAFWbrtLgZzSvD0OhslrGfyZmHW4Y+RsuP4FRKzhLkU+s81nD5B
	iQDPQFuUYX8sKPv5B2qPUPqDvsEryRxxKA8G0K5vhTc+ZjYwgQ1JoA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ggbh0dc9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Sep 2026 14:41:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 689EZTNr033155;
	Wed, 9 Sep 2026 14:41:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gh755rh1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Sep 2026 14:41:43 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 689EZQi8032950;
	Wed, 9 Sep 2026 14:41:43 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4gh755rh14-1;
	Wed, 09 Sep 2026 14:41:43 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>
Cc: John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] test-ww_mutex: Report whether stress failures are isolated or mixed
Date: Wed,  9 Sep 2026 16:41:31 +0200
Message-ID: <20260909144134.2979555-1-haakon.bugge@oracle.com>
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
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2609090163
X-Proofpoint-ORIG-GUID: mUKA_-7p20Z4f_GDi9kn2HeZh_48TxUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfXzZc77oZABkD4
 vx1MIq6yHv5a73WyHUTyOoYdz2aum32jSGaTGTNONK29UXd0PERhH4QuaBHK6QY94m+O0mN4uyC
 hP1qvwZlRGsKDAwUdegKdfumNerRBYb86KkEvtH7Bkun95eMRDTONukjdK/aLjBnOGpoJaru+E9
 ld1h/JKNRWxvE6rliIDRZIf6nM5Ryuljx2YQb33lts3IAIuyLhHlSxBGeNZvbDrGVvYlGP6qIJF
 j/3lIWugtjD2kdEUWXdnFxmXwMl49pb0XU000xjN9ojmXulDpL6EYo7B2F9AebKEnx3Zl5L4+Q4
 hP9xFm25AyynYuZHCqbECBBpxR7mQ/DPVu5LWpiEowpQ4LVw5Q9iHXgPOVns0GJA2zNRVu64xM5
 4wejeUM1Wl5KDnlvt/rM7bdq2evSQpVUecDNT0/mXnP9zYfKinmwdRJFBTIg+Bwu5KR25fQdHyN
 81fN2yDdH8+4pJNUTNDTqbBXSFBVhXvmOI98toAo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX1NnDHNSShCge
 nd2V2tcVyoiqRW2u0AT0MSNlL4AwjlTtxugsLs39eiEFfwNqy/F74xpPS0GQntBTM4xWEKmVFcT
 SIMrwXy0oduuqNmyAxTOA/s0DpCQ+vJQVDh5D7j5wZUNGyDSI5NY
X-Authority-Analysis: v=2.4 cv=GKE41ONK c=1 sm=1 tr=0 ts=6aa17029 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22
 a=yPCof4ZbAAAA:8 a=ndBhsA4XpGziXSlQFrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12105
X-Proofpoint-GUID: mUKA_-7p20Z4f_GDi9kn2HeZh_48TxUj

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

