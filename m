Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927D51FCB2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898431; cv=none; b=sjy6uOICEVz+EZje9Q2WCa7Z2JdzMe/qzV9J+4xWp3W8vqAN9Li/3X6jG9JNh65UCGv3dWSyPv6nQwv3T4AJPZu4+h61P9niW9bFqcaRvFAPPmNL0+36FkcNAAj15eiUHBW8DK0vLm8R8me4YLtOLc/bBsD44pc5nbJd8coPc6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898431; c=relaxed/simple;
	bh=58wnVp8UtpC09H6o36Fs8vVg5OTej82YK7v2fSUllDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WO3cL9NkBDKBj5CzanwGQCl2oNejjYJhFuTL8AEsmrxMT89tYwEwF/pxifVVFzRV2aRX2HZFwF5SO64ejqhax6kxnwxEni2RdU+vhBGpuwmr0Az9I+T5k8ZEKthjjLvtPQ3UK5F5lmRoo3taZVfBz7brYXtoz1ejMf4lHcPezPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EaV5ABlJ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EaV5ABlJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2BsN41439853;
	Tue, 13 Oct 2026 13:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=dLUVtjZIJ/v1snvs
	t+dkbepdyQJMtG/e3rdPXYts+UU=; b=EaV5ABlJsoQVke1t9MaBlv6OzV1ug3wU
	1LSlZTB9Rql9TYEGGB4BsT5Ag9JEKVpji5PwFX8wYHxU20/wq7o601nuxYXFXMax
	aM5X0L5lmV5Lqw+8xcNq+0slIeoaHjfhTQ3HoKmTMHNn9uzSR4Stwz/hfprlrKZI
	fYdA3gNrHPwSafxVr3xwkYkVp4iqDnbNAfh1Qt+VtbteHZeK9ZNWhK40FUcZkrCN
	5u2eYWbE/wzOvGZP6h9AYVueWLhBavoRhxD6a1HEI7FgjuPHyzTRKnR5tL20GFXz
	mBk3DrH6bp680h24mSkFLNl/Yu5uHym+mlGG/FjDTOafkhtbmpe+5g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h7df7v2f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 13:33:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 69DDLl0G040806;
	Tue, 13 Oct 2026 13:33:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h7btk3fts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 13:33:26 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 69DDXP4d006924;
	Tue, 13 Oct 2026 13:33:25 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4h7btk3fsy-1;
	Tue, 13 Oct 2026 13:33:25 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc: John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
Subject: [RESEND PATCH v2 0/1] kernel/locking: Add mutual exclusion self-test
Date: Tue, 13 Oct 2026 15:33:18 +0200
Message-ID: <20261013133321.2625486-1-haakon.bugge@oracle.com>
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
 adultscore=0 mlxscore=0 mlxlogscore=881 bulkscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2610020000 definitions=main-2610130053
X-Authority-Analysis: v=2.4 cv=N+a8hG9B c=1 sm=1 tr=0 ts=6ace3327 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=R5gcnNxLHOFc8d1k_nsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfXw9HGetHMzSRl
 D5yUengOxyGf+7VssBSRdojjgUYfzuCsQNLuqzOfmjoUzy9a+pqNdtQZbe5u5IW5gzxa+mS9NoN
 mKtPvvXCs70NmfYKhiwmpd/i6d7p05HgcZ6/LcuVyK7/xKR1L8DCN4fArFkBWiNclYh7VgsvbUH
 BQwR47rdpRSn3Y8LZCzYrMXbVB3YocrRfa9iW72Oo63LOsEoCHO5glsGjsB09qEjlAR8PTDunSN
 JWYAiBuejWmw0c6BzdGskXSaiTVH1JsIaC9AtGuAe2lb03l+G0xrF70GsBGGlk6/YMoxTeANQUW
 lZBCQaZoaUJFhPGnCJwf6RSmIwhKHkLQsvjvZBTXsNe+qS+lqwxreRamTN6VIg+J14VTVzTiSdG
 YC3dt2AgAgGB7jqMOgKqM3BIl78GtklhjWNS9IAcR1nuzP9A3U1GvnK/fo2GojnrJ7pzihFxECs
 o+LCM5XoyhwaY2VlQHAUDTygBM+gLQeROyue7vj8=
X-Proofpoint-ORIG-GUID: DaZXWGKfivnR1f2SOIeRZwUlMmAUCyiX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MyBTYWx0ZWRfX9eaiJK92RBrR
 wlHKxz9egHJkR1idLkDJ8PpK/M4sHaaIP52ZoJP38yECemD9tSER9imrbNKhPDF6JlhEnzua0Yi
 /cAEwE+WWIx2QmXjgW+KaOUyFt2pFS/LWrrSQ4/J3mDczKyYHRj6
X-Proofpoint-GUID: DaZXWGKfivnR1f2SOIeRZwUlMmAUCyiX

Hi,

Please consider the following patch for the v7.4 merge window.

This patch adds a stress-based selftest for kernel locking and atomic
synchronization primitives. The test runs concurrent workers against
an array of counters while maintaining a simple invariant: every
increment is paired with a decrement, so the sum of all counters must
remain zero.

A common test interface allows the same workload to exercise a range
of locking primitives, including spinlocks and rwlocks, as well as
variants using atomic and bit operations without an explicit
lock. After the workers complete, the module checks the invariant and
reports a failure if the resulting sum is nonzero.

The test provides regression coverage for memory-ordering issues that
may otherwise be difficult to reproduce. In particular, it can expose
the regression fixed by commit 415d83249709 ("locking/atomic: Make
test_and_*_bit() ordered on failure") on weakly ordered architectures
such as Arm. It also includes a variant modeling the incorrect
acquire/release ordering formerly used by RDS before commit
1422f28826d2 ("rds: introduce acquire/release ordering in
acquire/release_in_xmit()"). This variant fails on Arm systems.

The patch also adds a kselftest script that:

* first runs an intentionally unsynchronized variant to verify that the
  workload is capable of exposing lost updates;
* obtains the available test variants from the module;
* runs each non-broken variant; and
* supports low, medium, and high effort levels for interactive and CI use.

The module exposes parameters for selecting the test variant, run
duration, and number of elements.

A successful run does not prove correctness, but the test provides a
practical way to detect synchronization regressions and reproduce
known classes of ordering bugs under load.

If this commit gets accepted, I have the intention, subject to other
work priorities, to expand on the locking primitives, and in
particular add a double set of ww_mutexes for each counter and attempt
to acquire both in a random order. Using both the Wound-Wait and
Wait-Die variants.


Thxs, Håkon
Håkon Bugge (1):
  kernel/locking: Add mutual exclusion self-test

 kernel/locking/Makefile                    |   1 +
 kernel/locking/mx_test.c                   | 723 +++++++++++++++++++++
 lib/Kconfig.debug                          |  10 +
 tools/testing/selftests/locking/Makefile   |   2 +-
 tools/testing/selftests/locking/mx_test.sh | 171 +++++
 5 files changed, 906 insertions(+), 1 deletion(-)
 create mode 100644 kernel/locking/mx_test.c
 create mode 100755 tools/testing/selftests/locking/mx_test.sh

--
2.43.5

