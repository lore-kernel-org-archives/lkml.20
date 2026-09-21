Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B844C33F6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008702; cv=none; b=o8ecmRECJL7TGgpYFM5F2JG0b1U9Ow9I1e/y705G1y9V4kyi5igb0OOtGroMHTEGtw0smH0v6WCgn2VHrOy/y3teNz5WloaAnh1M/TA/ErT61FdNWZOTUSOgMIeRi39CVPfEa22FVPHy7v2/iP+mcOeHhwjQJzMr4Q4ocA3drNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008702; c=relaxed/simple;
	bh=2H7wvitAMNWSkVHVbItEdyUgymmXQEJ4BVU7Nzg3Npg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ezF1eYU3/1IocrIDgJzGdIJh4X9cSZ/paBUeBHWawcAbHvtZO39zoCqzNEw8k80cdFBgKc+v1slz1QyMUhzxZDLXkY87FmKJLk3y6iuQz2iPlHKkj3AEGipBVXzES/K4UNP2xOckeZ9F6LPhPSEIu08Gl1JpZjf7gAqw0yNgFtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IhDdTukv; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IhDdTukv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LDtssm2444378;
	Mon, 21 Sep 2026 16:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=06lN3Fwz4twftnr0
	zpISiGj0PUcp5NbI3v0D+O/XXkI=; b=IhDdTukvTqrq0pAWtLjpNw65MKrgdu/R
	xBakiUN57CxZLsLMiHmr/zotewAmtjwnb6OsLULsA/2b+2IvNzL80xWaiY0tgI3P
	GKbU5JxcXMezBRA+SmRa2/n9Wf9RprpBFr4+G02lcXq1SD966zPEVkDDpiF8slvN
	vmygYafw3n6yAsuRJyp3boXLXt/+iCaCNM51XDRIwaE25e/KxSZWkGAnwFsLz7kH
	LGL9m5tUgjN3Jh98IT2n5UCuxh5DJFLFuDY8pKTKXLAh3p24ngoFNdvutPb8Dgr6
	Dbo+H/25gw1lShRiBlIm0bLT2fvlclIWzkHrSQS8BR4M0aUgMjUCGg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk1qanpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 16:38:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68LGZQ8w002185;
	Mon, 21 Sep 2026 16:38:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gteguee1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 16:38:08 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 68LGZTQw002537;
	Mon, 21 Sep 2026 16:38:07 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4gteguee0j-1;
	Mon, 21 Sep 2026 16:38:07 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>
Cc: John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] test-ww_mutex: Report whether stress failures are isolated or mixed
Date: Mon, 21 Sep 2026 18:38:00 +0200
Message-ID: <20260921163804.213435-1-haakon.bugge@oracle.com>
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
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609210242
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX60tv/msqn5lt
 8APDEdqKl9J+WPv2tdhSUXIoQYgoAEi013KmBeWGfEGKXAX2HuWP4zXV8OI/gPgulz7mRRdEDAu
 6bQQWtmDm4/FPN8qFb8e3OdnbNcAR6lwIQvcRSjQDKLt2XWYRxCo
X-Proofpoint-ORIG-GUID: 4yxfM9-bSpSvSY4q1g5PJsj6DvzeJo-1
X-Proofpoint-GUID: 4yxfM9-bSpSvSY4q1g5PJsj6DvzeJo-1
X-Authority-Analysis: v=2.4 cv=LIzz05W9 c=1 sm=1 tr=0 ts=6ab15d71 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22
 a=yPCof4ZbAAAA:8 a=ndBhsA4XpGziXSlQFrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfXyeezcf/VYtIF
 cm2dWJ0h8ETh0AvIwR3promlfYGJBk2cFTAKQzcxPLLHVVVPs40UF1XNtJSbdR7cm/J6AgT9oaq
 xiwTKiQa2zN043VaARljp1zuzIA4DGQpkkWo1QWt9WcmlTP5AsdWTrcHP3baUd2ooLzWdqiDNgj
 lV9dC5mOdMcqFDMAWD3TGMsnbF7J/LxIq1ZPLDhcNCUMSWXtrjZe6ysuyU39bP5dtXok3mhVovx
 aEy9MFZD83sMGqgVAkaUS6f/iwb/gOEIPOkcD8eg5KviYC3j2tQ8PUhmpYDj0nr2euuuGUPy9+N
 BrIc/pK69n3mYs+8GiE4NCX5EY3qGI+XbzQLEEdtoJr3FC6EwnaQlZho0ICiie+t/Eb4bfenITa
 ICnUYBDoPmKvxUH4yf0GA//kduZiMLRiu+eDFf0JAFrqcZuRx6AHU6oGyE7jDlt77fPdl2ehQeh
 dUxwUQrhdJx97PqOxYzavXlSuTpKA+CCRJO2gX34=

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

