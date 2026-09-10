Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F31496D43
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072432; cv=none; b=FoyQIORxzUdNTAzqj8OnHufEVg5MiSWBAOGTMpwVJHMX1dt7JIvS+xgQKU6VB1EeudFpMoINam7nU6xiV6ZQhPxL1HfQWzPgzoH/clLRs9KZd6KnxZjLSMzXrkwzGwllb0KhFrcA8WWYQgCOyuOcOCdxfIXUcOjri75Y+nFtVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072432; c=relaxed/simple;
	bh=qtx52UK/4LBV9jghu0vT9VRVINLkVe7W5dYSEGtxupE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMd2zTvMSY+L1oPhTzauRcM979KqNkn8Etf7zt1UCI3LsVoFzJl8gx+pfCbVuxZURpsX9tfQ0rv2U6nK0Ww6Icr0/HIQ+aGyId8kyubm16/kkXQwJybhlFf4i3H9kXb1jGuk0ZiqByyXKkiFfFWFgqq1d34XX+N/Msb8tZXbBCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A0aIqC/b; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A0aIqC/b"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AJu1jQ2561856;
	Thu, 10 Sep 2026 20:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=kOWSksod1WPWOtEo6wlFmVMVA9ySi
	/1QtRNlnIkXk5I=; b=A0aIqC/bO1SgpSk9PrInkbj0Nx+U68SFDW/i/1st46iL9
	G6ACBCxCYLvwQMCEhxwaUK2VgWRBMoHSR8f9a8ury4533wXS7VKSRlAae2AY85In
	2oFn0W38rZH3HuFH/9b84kWQ0gf/uIQCfXNvbVzGCFecLs7tKZqzYhdCIYbzlFoB
	Rutc2jGEKiHC4hMUig4pBmLMo06uGXp2/kLsu/sh8IAqdSOFatSpFdQztvljNa4i
	UeSBrrG82ymLQJvAbu9LnXt/cpbzu+k2+kzlRgqbfz6L5IZQZasCxvibExi38HWp
	pFJWvRo27+5Nskd5utaYlmPRgkScCalcityhgyxVQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gkcypj13e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2026 20:33:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68AKUTvI036104;
	Thu, 10 Sep 2026 20:33:31 GMT
Received: from aruramak-dev.osdevelopmeniad.oraclevcn.com (aruramak-dev.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.155])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4gkrjsh1f5-1;
	Thu, 10 Sep 2026 20:33:31 +0000 (GMT)
From: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
        senozhatsky@chromium.org
Subject: [PATCH 0/1] printk: Yield console_sem to blocking waiters
Date: Thu, 10 Sep 2026 20:33:30 +0000
Message-ID: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
X-Mailer: git-send-email 2.43.7
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
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=616 mlxscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609100255
X-Proofpoint-GUID: PebwJykKl9NRzcmXbwFVl_KJvRI1Vwaz
X-Proofpoint-ORIG-GUID: PebwJykKl9NRzcmXbwFVl_KJvRI1Vwaz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI1NiBTYWx0ZWRfX5F7XLLyI8ztU
 ts3Z80sq9StTT1ES9OpxKfqj3OimwAuecZ4rzkKs1aM2n7h4Hj3zEOjTDs2xBmn8mP7Tfsc+6Tt
 LmYMmuIIZ+SvwQC9HguPRjpOb6NgA8LOGHxCGwOhthabYgezXTUa
X-Authority-Analysis: v=2.4 cv=F6zC5ahN c=1 sm=1 tr=0 ts=6aa3141c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=b6U0tO9dpqJyuuIM_QMA:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI1NiBTYWx0ZWRfX5sVyG0OI7dS9
 hGPpx7Egxp5FWSMXCZN9wQOkIgMNB87fl8gerNWl6KqEjtI+1b+EWP8YIea7Oav20vSzI1Hnlza
 eqcx6hBVlzFP1jGseCvX9jpKt5XeQSWe0D3jraAHetbfexTc0jDp9f0dATw0axyTtVce4/OqkYw
 H/q8vPg7GFQ4BZAnp7hx2UQttP+BmSiCx8ZyS45YZDJhUfXoRYlo2ruzyRe7cjsL84vPbyH0QhM
 KAeUcLkIGjreaEJTLdHlGPC0wKAOp278Ny5+StiQAdywW0QJUJoqJLfuFxSzMDQaGoO7Dp4gq6+
 7b+HElZSeB8Uv37DuzLuc2EwUYkUSUd7ZytmUgRcUHAPYkJMRrK32vcOrYvIBI2HP5DSC6w71sC
 SBtxMdvbiDPztxcX1L7LSdM2lceQ2BAoPi5mgwp/2ZZdMidKmFggeQHg4gfMu4SagRfAsb1fc6A
 srWUyCrIkLXdvOSqMVCKswEuLaBvRlGBCpVuuiJY=

Problem context:

After a reboot, NetworkManager failed to bring up interfaces because
systemd was stalled, due to a flood of printk warnings. Systemd was
blocked waiting on the console lock for over 122 seconds:

  __schedule+0x224/0x65b
  schedule+0x5f/0xdf
  schedule_timeout+0x110/0x145
  __down_common+0x14d/0x18c
  ? srso_alias_return_thunk+0x5/0x7
  down+0x43/0x54
  console_lock+0x16/0x3d
  show_cons_active+0x3d/0x1b6
  dev_attr_show+0x16/0x50
  sysfs_kf_seq_show+0x9c/0x124
  seq_read_iter+0x12b/0x4e3
  new_sync_read+0x140/0x1db
  vfs_read+0x106/0x199
  ksys_read+0x67/0xe8
  do_syscall_64+0x35/0x87
  entry_SYSCALL_64_after_hwframe+0x6e/0x0

The loglevel was set to 7, due to which there were a flood of messages
to the console, which in turn starved systemd due to the chain of direct
printk handoffs. Direct printk handoffs transfer printing ownership
between printk callers without releasing console_sem. A continuous
chain of these handoffs can therefore leave blocking console_lock()
callers waiting on the semaphore.

Proposed solution:

If there is a blocked console_sem waiter, then:
1. Prevent new printk-to-printk handoffs.
2. Stop the current owner from indefinitely flushing all records until
its done.

This unblocks console_sem waiters who are not doing printk.

Aruna Ramakrishna (1):
  printk: Yield console_sem to blocking waiters

 kernel/printk/printk.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

-- 
2.43.7

