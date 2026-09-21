Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60597443C31
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008068; cv=none; b=sRLikWVSLAqRcMoCdzIqfIgjjCDpCmGsANKMfWkZ26Zy9CMPJzX7cpWVo7+NmJiV/OfekrQhOXltpGb4e1KjjOl6K2QgCDMWGe9IeXJei8Jwgu02ptsgqaZv5JKr4WZoAzj86we/PfwodGontbYeCV71If6RgS0AVpIJUBRCgnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008068; c=relaxed/simple;
	bh=58wnVp8UtpC09H6o36Fs8vVg5OTej82YK7v2fSUllDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eEicfBt+YzNR4CHleKVl0NI5MEWZyiqLOlEjAwvG8GqNVOmXud/M7VTso9Xc5S+cmmID8PrBvbmwU7jO2GU+DOc3pnSm3wSwxi6ac6CaUPo2H/nDdNfE7QXsjDHdyDL5dqNZHaToKtZSfkY4hb8FDY7iKnV6yhOZBcfzPtJPu0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pz2e7KnL; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pz2e7KnL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LDtlAw002661;
	Mon, 21 Sep 2026 16:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=dLUVtjZIJ/v1snvs
	t+dkbepdyQJMtG/e3rdPXYts+UU=; b=Pz2e7KnLTdEtoW4bjVB1fuc106LGbhdd
	uA2OUX2MbMB3k43a1O9TKvJZkixTCKSVS2DRPwGuAU77v1omwH/p1qr/Et7zY8Ss
	I+UYsY8IU3KAfDZZhIeRNiZwmUfR3Z9lywi+jkUa/CPEgpQD0JGgD9QhnZY72vFJ
	pdjVzoP0kKiMB9QrO50dToPsrqkcBW5KhwjsMr2D7qFWmja4yS5XF6P/a6MHTORH
	Kuh2jYfnAzos8DQ+HlO1zwYifQ/IfqryAlO3NTQYJ+nbBn2bB6DGM+XSA4uIKeLC
	yKYOU3dsTe2qEXYRPAkRiAAMPZ125bqvAaFCJkTz+iz1HBdZcd+IaA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsjxb2n7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 16:27:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68LGP5vl019507;
	Mon, 21 Sep 2026 16:27:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gtegjemvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 16:27:30 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 68LGRUVr026549;
	Mon, 21 Sep 2026 16:27:30 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4gtegjemsy-1;
	Mon, 21 Sep 2026 16:27:29 +0000 (GMT)
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc: John Stultz <jstultz@google.com>,
        =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
Subject: [PATCH v2 0/1] kernel/locking: Add mutual exclusion self-test
Date: Mon, 21 Sep 2026 18:27:19 +0200
Message-ID: <20260921162722.212610-1-haakon.bugge@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=881 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609210239
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MCBTYWx0ZWRfX2EGcYBoBM03Z
 5LKqwHlLkAg0Q9UR7/eSZ3pgUxNLhkF5ffEZnzYRLvpnFlPI+VpGD4tvyzwCOpqt9Sa/TilNWIr
 zFyeAqaSTIxzhioqJnMus+theVCtzYQ6zOgEsI2IBMQy3v14SRpCDY6OeAqHeg5Nw2QvGazsafM
 EybyPcsEk9UWWPjbRSB+mCjMWo3stbZ3OyOOkTJGnvXh9SzI3Pt32XSbL9XLYvtgNgSWa3uE0R9
 Q45F0AdjTDDkVewT1EU+SdWtuvSUR9b00Z67CLrTVBH9Pm6Y2bTUyxoT1PaknvONtoy3jXT/XpM
 71OKgBPP3pH8ZzFMAuNFENlET85l+5OgO42Xa1PUxm5t8moGF3RVFbc7fx1XCZEQILHU6vi+E2E
 qwfRw3f4T4E9YlJ3TDal61+9bSorP6k+FRYQbHcsnYdNHyYywSgVkCSARcYJdq4ukZhPILeEAKO
 ZiB52tNHnJDxYAqC9XQ==
X-Proofpoint-ORIG-GUID: dmG265h59MWnAMcAf0-nWgJB5JT_iZ5k
X-Authority-Analysis: v=2.4 cv=UINIjyfy c=1 sm=1 tr=0 ts=6ab15af3 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=R5gcnNxLHOFc8d1k_nsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dmG265h59MWnAMcAf0-nWgJB5JT_iZ5k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MCBTYWx0ZWRfX8a02laWd2yrw
 Cc7c6HYi8bQ6GbiS6vFybMJO/ixAty22aIgzAzm3uqkjzrGYko5GR6Y1413saEobptN3Ox6rQGt
 a5Ge6Fb3AqyA2rQgIZ9FsctVBIc3WwNu+/zBWeybjz51+ek5CiuR

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

