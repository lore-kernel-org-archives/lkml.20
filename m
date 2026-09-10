Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF0F38E8A1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072435; cv=none; b=TDLvMo29cbvN1xkBnwkuMnXgcgnWVdQnrpmj95sVbyllqokTe2Tgv8feZndgdJgOpRcIcsB1gEsybbKexD+0hNtn91N+T/Dgpyi1a5AuNRmJmuwLy4s8Eg4addAOnDuyu8ryP5wkoU41zMEByzoT76O002IYMYdKBApmSZkmn3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072435; c=relaxed/simple;
	bh=km1BUFPzd3+DYCz0Q4gYYogFiJUxetUMVtNO2WWwsxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1PHf3z1N0WZziE8gw4sC/8RKHR52H5Bny6JAsCUIxKK5E3hlU8voc1YkIURYcjVU7f3RwE6OGw5bRYxA+AUhSokjv58CMBBWdSY8S7whp77q85lCd2q4uY81bxuTMPcmOa3jYRLkYOfq1eoBQUIQjC+god7ckocb80OvUuDZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EbZQEBMI; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EbZQEBMI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AJtqbE1098103;
	Thu, 10 Sep 2026 20:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=PVkPD
	e0EwfebBcsuJb6TFXDVB9efMenq7to2FeFiSGw=; b=EbZQEBMIuFVNG70gUvTY0
	xPlW94zOBjIS+MH6P/+QIzj8acSnDHxuAqxSaQEs76EBMxjh7OY+H2+kJkrM+Mri
	WEBCx6FJutNZBOy+1cD4U6FFlJmCCKX169+cKzo0Rp0Kq9WLDbkA4DUXVXOfxnjH
	yJK8lniEnWq2iQxBnngziBfQNO7qWGB47/tozGSgRodmp3nfTp1E3N8t4aZJQZDE
	YgEOuSOWIkjguUp9yzPOWOr6L7PnhbEc/tHBzw3CNEGTAZF1YnzzkzQvZEd+IsbG
	HIcryPifftkkeSn904M2QEg6+EkJT1+fKxFSA1eZ1+1UIx8ZjSOeuI8T7yBl61AI
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gkcyua0eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2026 20:33:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68AKUTvJ036104;
	Thu, 10 Sep 2026 20:33:31 GMT
Received: from aruramak-dev.osdevelopmeniad.oraclevcn.com (aruramak-dev.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.155])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4gkrjsh1f5-2;
	Thu, 10 Sep 2026 20:33:31 +0000 (GMT)
From: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
        senozhatsky@chromium.org
Subject: [PATCH 1/1] printk: Yield console_sem to blocking waiters
Date: Thu, 10 Sep 2026 20:33:31 +0000
Message-ID: <20260910203331.4139656-2-aruna.ramakrishna@oracle.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
References: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=674 mlxscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609100255
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI1NiBTYWx0ZWRfX1/ZfkKRj2QaT
 IMVM+u60IB80L4P6HdQjXtkUzqadMtqKEkUwb7HdOh1VyDVaDxHDPtXdWdgdckfbTqZxA1GP2Vp
 QmIgW9HiA5y1xgMoW+tFOgmeQ1JqJscrM45OllLZgB3dMJXpnvb9XS5ggQfntPT57UOUdxChqf5
 ccxVOHlSKlSNzH8BO9kwUnjUlEhhIq4d5SiWBjlfim6O6CDSgNII+ssD6Ci3EKyQgCyV263NgGG
 HchPQ76h8I3sHF5uGRuVVOmDIzwpOvs1DkNyuFdJEjs/yNtt32kZqm64o3dys2Z8tpBe13qb8lB
 cCrPXSemrCVmSgLIuSd274T7MIRUgsW0AiANwETLxm7496ai9r/iE0deMNK1tyuYHtpSliT2yAc
 IVT15vTk+MXWR4vj7Z3odgm8DjUjg7Q3+FNedKHqpdEdLxYED7AnSCD9k9K34IKXt2YdlEdH9TO
 BXGVSRTGEUp/uYw9uCS1M8mRwQ5mBpyGKVINF5ak=
X-Proofpoint-GUID: j0TXsb0T3OvJCEE4M_xMImt2ZLPA6qFH
X-Proofpoint-ORIG-GUID: j0TXsb0T3OvJCEE4M_xMImt2ZLPA6qFH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI1NiBTYWx0ZWRfX8rxLSpXWd7IW
 qMkf2aOeUbdk0qMajObj5HhkLRYdGq41IB3WuysVI/DZP/t9i9070eLSCz9cwFghocH02G00IVQ
 LURnOYS43sS6W6q1BoSKsIAZ0Xv0BoICbZIE6G4HlJtfQR5YJafn
X-Authority-Analysis: v=2.4 cv=GPSdgeNK c=1 sm=1 tr=0 ts=6aa3141d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=UF6qQZy4-_CmW-z93i8A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106

A continuous chain of direct printk handoffs can keep console_sem held
while blocking console_lock() callers are starved.

If there is a blocked console_sem waiter, then:
1. Prevent new printk-to-printk handoffs.
2. Stop the current owner from indefinitely flushing all records until
its done.

This unblocks console_sem waiters who are not doing printk.

Fixes: dbdda842fe96 ("printk: Add console owner and waiter logic to load balance console writes")

Signed-off-by: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
---
 kernel/printk/printk.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3fcdf4b4e2e5..b182bc980850 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -94,6 +94,13 @@ static DEFINE_MUTEX(console_mutex);
  * and also provides serialization for console printing.
  */
 static DEFINE_SEMAPHORE(console_sem, 1);
+
+/*
+ * Number of blocking console_sem waiters. This does not include spinning
+ * printk waiters - they bypass the semaphore wait list.
+ */
+static atomic_t console_sem_waiters = ATOMIC_INIT(0);
+
 HLIST_HEAD(console_list);
 EXPORT_SYMBOL_GPL(console_list);
 DEFINE_STATIC_SRCU(console_srcu);
@@ -311,7 +318,9 @@ EXPORT_SYMBOL(console_srcu_read_unlock);
  * macros instead of functions so that _RET_IP_ contains useful information.
  */
 #define down_console_sem() do { \
+	atomic_inc(&console_sem_waiters);\
 	down(&console_sem);\
+	atomic_dec(&console_sem_waiters);\
 	mutex_acquire(&console_lock_dep_map, 0, 0, _RET_IP_);\
 } while (0)
 
@@ -2002,7 +2011,8 @@ static int console_trylock_spinning(void)
 	raw_spin_lock(&console_owner_lock);
 	owner = READ_ONCE(console_owner);
 	waiter = READ_ONCE(console_waiter);
-	if (!waiter && owner && owner != current) {
+	if (!waiter && owner && owner != current &&
+	    !atomic_read(&console_sem_waiters)) {
 		WRITE_ONCE(console_waiter, true);
 		spin = true;
 	}
@@ -3329,16 +3339,22 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
  * console_lock, in which case the caller is no longer holding the
  * console_lock. Otherwise it is set to false.
  *
+ * @yield_to_waiter is set by a caller if there is a blocking console_sem
+ * waiter, in which case the console_lock will be released rather than
+ * being handed over to the next printk waiter.
+ *
  * Returns true when there was at least one usable console and all messages
  * were flushed to all usable consoles. A returned false informs the caller
  * that everything was not flushed (either there were no usable consoles or
  * another context has taken over printing or it is a panic situation and this
- * is not the panic CPU). Regardless the reason, the caller should assume it
- * is not useful to immediately try again.
+ * is not the panic CPU or there is a blocking console_lock waiter). Regardless
+ * the reason, the caller should assume it is not useful to immediately try
+ * again.
  *
  * Requires the console_lock.
  */
-static bool console_flush_all(bool do_cond_resched, u64 *next_seq, bool *handover)
+static bool console_flush_all(bool do_cond_resched, u64 *next_seq, bool *handover,
+			      bool yield_to_waiter)
 {
 	bool try_again;
 	bool ret;
@@ -3349,6 +3365,14 @@ static bool console_flush_all(bool do_cond_resched, u64 *next_seq, bool *handove
 	do {
 		ret = console_flush_one_record(do_cond_resched, next_seq,
 					       handover, &try_again);
+
+		/*
+		 * If there's a blocking console_lock waiter, and we're not
+		 * in panic, then yield to that waiter.
+		 */
+		if (!panic_in_progress() && try_again && yield_to_waiter &&
+		    atomic_read(&console_sem_waiters))
+			return false;
 	} while (try_again);
 
 	return ret;
@@ -3377,7 +3401,8 @@ static void __console_flush_and_unlock(void)
 	do {
 		console_may_schedule = 0;
 
-		flushed = console_flush_all(do_cond_resched, &next_seq, &handover);
+		flushed = console_flush_all(do_cond_resched, &next_seq, &handover,
+					    true);
 		if (!handover)
 			__console_unlock();
 
@@ -3563,7 +3588,7 @@ void console_flush_on_panic(enum con_flush_mode mode)
 
 	/* Flush legacy consoles once allowed, even when dangerous. */
 	if (legacy_allow_panic_sync)
-		console_flush_all(false, &next_seq, &handover);
+		console_flush_all(false, &next_seq, &handover, false);
 }
 
 /*
@@ -3990,7 +4015,7 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 			 * Flush all consoles and set the console to start at
 			 * the next unprinted sequence number.
 			 */
-			if (!console_flush_all(true, &init_seq, &handover)) {
+			if (!console_flush_all(true, &init_seq, &handover, false)) {
 				/*
 				 * Flushing failed. Just choose the lowest
 				 * sequence of the enabled boot consoles.
-- 
2.43.7

