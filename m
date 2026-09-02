Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE449483F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352892; cv=none; b=gzJNMHtoY48qqZtySqiavvnUM1wMN1GSbUwnt7D1GFYZxFkSRjl4Y6tP8uDdX/5eFH9pA0tRUuc+/ZTQcXeX5eFwYiLQ9syIoMHmQ0MtB8gJO2IVJ+z6EBTIvQ1/pdu6RDgKj0MR6wpRGRPHpzlKuvx3RzwhPKpdfqwyojbMvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352892; c=relaxed/simple;
	bh=y7PRpZbgoBm5tkmSmY3DPe1d1KFai+ynj5Yq8MdGQEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vBSkjbUGUQ68VKKwyAWVvcs92C8p/NDeIv1SaibZbgC+/jmv61dmfHfIhhBBxNdnRbG5Zc68E0vB24T19i8XBIEReaoiIES5cQMszF3pu3HM7hR2NfTAdnHHWujGdrQoxv2/nUVtGA6tsFI2fshv0GPFUQ+BD78bNAkSi2buk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hzauJHYF; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hzauJHYF"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CZLKR231367;
	Wed, 2 Sep 2026 12:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=06lN3Fwz4twftnr0
	zpISiGj0PUcp5NbI3v0D+O/XXkI=; b=hzauJHYF2mmcLCABy2HO4h/orNlSUYVM
	F+OTpXSKmF10C5oIVtTQ9Eps5bomOivXwFd1RCRMvQplTIo1bZKCPFWbFtTZFSHd
	mocNaQpgZK55LBgeKDljxVN2lVCxYnJyR1NQ9UdHdxedmHMhBBUKfEYuWrO6lg+O
	dXnpmlu28LWsdS2Y9RWPrQjvD5ybXY0RtzAtG3twmNbeyaLLOyRuSmH4Sd7yfcPo
	WXxonZo4cnbpBaP6Y25JfozSV9DBNlIUopG2zXRdZkHhrI9ZF+N57dm/X4yD5C4Y
	r153n5HklMopLytJzeiZ08HgK/lN25jCs2yTRZPkNHJoUb/1S8tB/g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbqa7ppyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Sep 2026 12:41:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 682CZ671034095;
	Wed, 2 Sep 2026 12:41:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvffu7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Sep 2026 12:41:13 +0000 (GMT)
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 682Cduq9017648;
	Wed, 2 Sep 2026 12:41:12 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4gbnvffu6n-1;
	Wed, 02 Sep 2026 12:41:12 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>
Cc: John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] test-ww_mutex: Report whether stress failures are isolated or mixed
Date: Wed,  2 Sep 2026 14:40:36 +0200
Message-ID: <20260902124040.2017477-1-haakon.bugge@oracle.com>
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
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2609020112
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExMiBTYWx0ZWRfX0w8wyHS/UREX
 1aiLLZKlkqAkyA1D8t5w0bhfgK/RVmMPSAX8ktU+q/DgwZ5fxvU9T76+zKozc3ngxB+FAqE5MC4
 5SjFaoz9FVQS5xiJDxsRHSmtB7xndqN8PYoGA7flPop84dift9he
X-Proofpoint-GUID: D8TkSSYXYCGpavB0FNRNjIVfD7eeasyB
X-Authority-Analysis: v=2.4 cv=DPu/JSNb c=1 sm=1 tr=0 ts=6a981969 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22
 a=yPCof4ZbAAAA:8 a=ndBhsA4XpGziXSlQFrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: D8TkSSYXYCGpavB0FNRNjIVfD7eeasyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExMiBTYWx0ZWRfX8N25/bl76qoW
 wX+Ozq8j7doOZJGa870r+IxkRidTvhI8yxNLpOXS9NqNqLBa5k6Egc6hc2ZuyNLIPieqgnKjjyO
 WoxqZz5/eeEgLtkX5JsvLv1BxRW2Er9Vld/GkO/criCogAwgWnP3rI7IAsnWrHq0bLMXqzUcGZC
 sDZimW/baetvl9ESeJH96FCqjNkK3PmAL4KyRNsnwW5mNHfUPvDhKReASuK/tkraUstz1jtZTzD
 5W2tVJFLb/ZQmtXiQpMQRr5V00TG5iF98xcVORegWaReviiC0dQYzux1tOmCw0xeXenEOdKIaQT
 1CyfsZYWku/Ug93kUFjgF8F+IC3/yXzZIZc0pnvpJypBKn9OxTRkb2+hCRfI9p8yB+4Qn5BgGse
 fNOZUUCYZiA0GklvqLDUsE5TpsPvGoNQEqz3Dcpsg6JNfIxzV2rQRn6UfQzRleJ6Ad6FB1bNycC
 6h//3J9M4B3Xowelqkw==

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

