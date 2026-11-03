Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.177.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727865;
	b=uteugH+dHKabYPZxTvoloHHFj2Uty+t5T271rkDkchiAr8kJUR92ChMgW9rN0UDf0Wz1
	 sv8b9VruDwLcUVkphbM/u2hR9ODUKPF0cqIchNcdz9etAboXAoM/AmJ8CkRtLarTqlvUD
	 PnvKJuRnwIKePCKxKUudHDk0dmdrlcTbMBfh2DMriyNOTz3IcEjCQM0DFASiwddxY6xHH
	 4z/uC1JWsdGgZbTejm+/558KLSbVmYVz7A6wIDs9pnIpnjuGmxKNCp2GzLaOB0ieRifp5
	 NdMKMo/Pwm/fx8aF5MTmhv/n0VpNK0FuwUmPkgJHhBv2e2IKbnawHeMSNC2aLQ825Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis;
	bh=06lN3Fwz4twftnr0zpISiGj0PUcp5NbI3v0D+O/XXkI=;
	b=QJg1u2O1KE4i2oE4wi7Y4Zy+gyuI1+mCiJc2/HTV/+sEs8mqUTgb4K4RqKmFVu5GkW0z
	 C9IPIffkdnSKAIuCB6g6ahRtWUIpMFyy2PyYoG/FwUEn6vtpSWoNwwDqYiuZuDQ6NUzmx
	 PRbl39O4OYqeXWWygKBNC1lC6CezCtp8X2r3BOauo8Te22atK/wpJqhgMUCdpHfJHPZK2
	 3Ov7KzRoVPsBjRM8bw7SD+vxXFYYimXUuBLd6QUB525chuphB8DH3FvPUf7yMa0itGD+e
	 siW8Yfp+OmhhO3H5vvYrPiJqA65k1ypmV7JlDGnFQIZIy3naOpfy+WwMGQcFDeVRmqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=XHNuDqam;
	arc=none smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8874606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8874606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=XHNuDqam
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E5QnQ2272008;
	Tue, 3 Nov 2026 17:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=06lN3Fwz4twftnr0
	zpISiGj0PUcp5NbI3v0D+O/XXkI=; b=XHNuDqam5b8ZepBUvBQhBqRXfMJhQeis
	tPXNAoJ6GWyVdMkPaNKcHEq3Sk+VgNURD0y152oDBMQtuxSV+6Wf0Pkdavg5a0No
	ClOYukwywGEW24lb/kTUipqWITiB9lv0Hn+2WRpjmnmEu+Nryd86ODAsBl5ARHgQ
	XV09tDuf77oI2rVrfETwii7qNFy2xzcElr+6rAeJbeZxKza6EjMTwRKCEe0jkubg
	jrG+ss/c1WPZVxbiMfcDRg45JkuXWCExBxKHFgFlQENLKQXSvBqpSFy0KJO8dFKl
	KpYTb/buPyhs21Fo53bkZfHP3LDnk8MkPTTO7MUaXgvNeHqEz2ziZw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hn8cfvq81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 03 Nov 2026 17:44:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPrSq2435120;
	Tue, 3 Nov 2026 17:44:11 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4hqk4njvpn-1;
	Tue, 03 Nov 2026 17:44:11 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long <longman@redhat.com>
Cc: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] test-ww_mutex: Report whether stress failures are isolated or mixed
Date: Tue,  3 Nov 2026 18:44:06 +0100
Message-ID: <20261103174409.1398249-1-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-ORIG-GUID: kjqZ_zfRdGyTjd_ql2KyfUyWwYXJDzTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX1wzX6r8uUx2T
 R1K3jA7/XI1DRWnQNFrxKUPG9KaSB/yTTLOkclxbm/MQtNk61RotJWKuei3KEaOL/0ap5HCPVHd
 waBW8SSB0E8HN1b8s2J4sh9H2DV4lGLdub0mQv6g+jaXMcY89ukQjAcqxo8mL0R65hKNioHKb2i
 xBVoFhcFDyuOY8wWBsA8QZl/5iOScPTOnfEPIwVgADdKKI1XC+dylaotn4VkXlvHcLArXRKmz6F
 fiPRaILelqlV0s6StpJKfNMSPcVWhhlPhNCU7ZCZ4NE20qP3JZYoRAgBDBgZ9sBATRO+iRmGxpq
 Ujo9x9QQTkJ9kyJRDPME1e9dSA1LC/YuxZ5URPAoeG5CBK4hP6T3qnMYcb2VfQXwShnifMHp2Fr
 jltDZdOaEbjEs/i+LTXvyF3UVxPcdPLnqp2c/wEEa7chxQuwWCqOHdWp3XND1jqWPovX44u4mz0
 vk0AK93mhDwZydzTH2JfPzNUEhYaUo8qBL5EKYWM=
X-Proofpoint-GUID: kjqZ_zfRdGyTjd_ql2KyfUyWwYXJDzTo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfXwr28E3+orlQS
 CoA0zYw1dBxkkYfKrV93c8oW+/uS0pweprRxf3ngO3iYV6JitlExe5w0TetH6XhMCwRbU5tCbn2
 +7pJt9SBqCRj8dgrAMOEEFRmavij58rABc2Zwy2ZzojLeHmn5OPB
X-Authority-Analysis: v=2.4 cv=OZQNnRTY c=1 sm=1 tr=0 ts=6aea1d6c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22
 a=yPCof4ZbAAAA:8 a=ndBhsA4XpGziXSlQFrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13532

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

