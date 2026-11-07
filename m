Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019235;
	b=oZG2hSAM97ZfvV5Fe887b4ouhii7LikX3gUqgfGNBU7KqCt+24/Cx2IZVjtsz+DAI/pt
	 5FyGoLELmuYro819qu2HJ5nsTDgJOu0pdUhqkn9dH4CB4frx81qsEZRpKvBudVug91N7D
	 6QB36f4UVpJ3UrZfIhuEOsVTPrg8VqMSqCf9mvjpGWHDa4Xpg+QOswigApDZlkjHIZoD6
	 RAh5/UYFnV7otWgSdr7BEZ+84NFK9rWibfiQOXVngmXFTg5eCui74i6+Zt/l62mrisFP0
	 pYX8ZNpMuoy0hwrFOcrkf761ZGGudIJULxhoHKlqor0fCydI16MpD4L6Ky5uIwJ/msA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
	b=h0a8cK2MOaaATU6L+TPDpIGKhIYnr8ZGwg8S+jmgQwausEXaD2qoEkWiTjHPMVKUWZPQ
	 0BTUQ4Da1lJPO+thG2GMgB73davmsLWO3epUYCslJTwyMZ6zOVdgZx7IM9hnVMgqpvEFR
	 M1XhB+Fg7DfnV6/asQtDgx/whlPKoJy0pvgnanhXBBXO5VjFT1RbclAlPl9W3eInZ/Nx8
	 kZhkWh6A8Jq9zj7WO8IPh4gaFJRKvEYbdXbTh9nmMZ0fzIWyaChdMcYP1fGrdLHeNO6Ea
	 kOORj389GRFoeidmOdr4qB7A5wezkjFhSlHK4HJuuqWof5G/fnmHKHNbxOdyH/2d21g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nop8ZZz5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPIvxkBy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53E606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB53E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nop8ZZz5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPIvxkBy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72AvGK1537519
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 02:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3GIOH+/c8Zl
	wAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=; b=nop8ZZz50KWkS8urDJT3hxpTV4k
	BAEPCnNgvlCV5nW/ALTCX9VJTey5w3I10a/mjLDouG3WOysCbGYEzn7gNFkNg8M/
	nzpOsFkzTU0Z/dY4mPagcZ7QvQcIjZqzc44YLqeoKSxhr7/j/HR9z2FI+0DuoyDV
	i1bCmfL8UTAFZpvehzU413xo0+FAgXLAC7BKlCtlyydehZhLOkP/Qs49TEO2o2Rm
	Tt6kwxWKzdvHE5kMzJ0E0bXvcpYIna7EiRYtn8YmVfbrX5esD/ex4wFvDxncrpOF
	kmJbd5Xw6pX9NV4pmdQJWV8D0BfLJPqH+N0rZNvJ+7Dyq9HYKMns1MG1JZg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn03s6be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:40:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso2876051eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019233; x=1794624033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
        b=KPIvxkByE1KosgLgqW5Sb95C1rvj70WDTN6BwrXk8vyEP6VBYI8yomA40wDJHuSNM2
         Kp8cLocrUsVZPMGIFgRVEL1QAeWWnRrlRH8Yw5U3c4qSVUoahCveUzk4mwnC7qMxiMJ2
         +yYfiRK6saosxIPN0EsLqmAP84GCPJbSN5JENUXsmb3TQNKqBy8jDIQGbLcnY6K/YS/k
         KxQqVL7KkJbfHAelgU+7/8j+85aVZOiL+pW4aorm5yQEqVd62fTBcMp8KMbUgqYTMfo8
         wb9P1MrgmtvSm5HCHlH3timskyIg1ODJ5Gv7oTW2LwweiIXHlO9uMAXQx8fIf/6eCS5r
         9kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019233; x=1794624033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
        b=STZHlHu9eYv13iTySc9NLU6/HIV9qNsWCZdsibqWOrkzbh1bvZCcWRn6wKDZBHmXQy
         rt2a4fpN1210qHsVQm12vprd4V41YwdWyZqqUl87IMEFSbRmjhv2QHST700V80nasdqe
         ScuY9Xe9TK7tX5RSM/Z7sXBiNsUd1eSlKou4kl+KREkdIE+yTtmn1xMRLtIkRF23s23q
         nlggzgJFA9ouz8g/mxK2pWGwGmkEPpnWRNQ3wBE3+ByH5ukoF9NQAPG+YJY5fmUuuLKe
         oTi6KmNGncmE2/SsdyNMyA9VQ5EtjrI3jWh+S6sYgjAFrmuoePk8CflxlV/5iAs9gVIO
         6ynw==
X-Forwarded-Encrypted: i=1; AL+hErGLY7UD8248+IGVUn+HWknokYrUSFRuFKviCZ9aFpCcUhyVWRANyVhNI4omuvGhGtiTcaRsawB2+BbGYcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bzdCDdEHDL8lh+ho7WT3s8CeMzqlJUYm/WM6lc+8B0ohsBSdB
	z9Ayo1NzZPa0dDcaIabri+Z5FAeCnLcEvfAUlB3vMYtaml1Jzx8cTFAvMjdz7vOb5sDEUdzU/QL
	wUTC+VuYRTFIvESFic+NAUNe9/l1BJNGllEIQjYIdTyidp6s6eo0necNtD0mZsHAqDS8=
X-Gm-Gg: AYBFou2iddv6iZYlcCP4M+dyOf8HLz1h8A3C5zj14a6lTovCEiMiX5sOkOKDd3lcBXB
	tyao6CPCNHBdUbeisXGJniGUOPUnGdKg5EeOTSg2+56BuziYW8LRMNQrUYIANcuZYdou3kX0fyZ
	l1SsNDf6luiIDd6M6yQCuL+B+MCpiFcBT8ulkKkL8NHzELOGqENdrxY0n8NRjKVSB9MgJcxm63W
	/S+4oxY+qU+dp6ulVJnWqv/waLM/cHpsf2dhoblxPN1BFBO8xYnbwM1sBZ/No0ggAomwaJunqoB
	08Hhodv7ZdZHFwQ/iRvjANHO1o4JS6tjOw1sc8NJH55neD/Np5xVht9xmkLjsg5g+MWdRySTywQ
	iK+7tgsLmKb2ymNgjgZhsBnRphDjmIp+NGIwIz/WNUyGa/9O3CDJqqvHan6LNUgL0DqSibV4ZNo
	2u5VD1vMIxIUHnMedCrYisVFh5SJq79gADjkczuztWA6VgBxE5MJcaF7zOKT0YGSKaM7GapNcCT
	w==
X-Received: by 2002:a05:7301:d805:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-36f6fc79169mr4866628eec.0.1794019232661;
        Fri, 06 Nov 2026 18:40:32 -0800 (PST)
X-Received: by 2002:a05:7301:d805:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-36f6fc79169mr4866588eec.0.1794019232016;
        Fri, 06 Nov 2026 18:40:32 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:40:31 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 8/8] perf tests: keep bp_signal memory accesses visible
Date: Sat,  7 Nov 2026 08:09:17 +0530
Message-ID: <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JMSuIMKb c=1 sm=1 tr=0 ts=6aee8fa1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tsqkxpHE8OKeFbBeJjEA:9 a=O8hF6Hzn-FEA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX3N/JQoWTwPkm
 oWfh+umK9VPLBR3ehC8G6KPlAV4LD9OuKAWK+hP7WnjLKddZqzcPLMGh/pfrT04ZOOe4G60kr/X
 z6vjxdrbBWNB09oaz8aLnSlRZjxS4MU=
X-Proofpoint-ORIG-GUID: Xm3Telpy2O_BTDTKZYnq7kI2jIgwQf4u
X-Proofpoint-GUID: Xm3Telpy2O_BTDTKZYnq7kI2jIgwQf4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX7Y5zCk/gqsSR
 e/7bs6SqYz6v1vVZcSDukHT6Dqq+Nv3j9kk4fQITyohlDfK2wvmVjEYFJftQhLrC+kzIb0zvIY3
 jYOkxaGDtzIsxDlR7l7+6OUZwZ+Pg6W2DyJVdUK1DTh/E46Qsxkw2V3w01e3qzQXnJgYez/ssqN
 /d8v6Xwj2kTZG9Ogg7dHoqy4I0YugXr+/cqkMcwtjpSooRCqJmYH4p7eMa4kjIbhP0mtMbNzyIl
 NqHa2j16KiXwoyru+i0iZgwZ/lHO6zdx3PrzjN4Kby/5umuJCBEZ04IBIe99LdrPedb4OLJn5Jy
 osKNdBXMUH5BPJIruJax3BRm1iktpC7H72YAY0/5aOliHeZNw+0JbbYn/p9DYtu5qeQ1nYbAov+
 C7iZJxelL/CbVI+LU5I01xC05L9vgUyzU2j+iMSMZbT+PDeXpdRabKKrDxQPmk/7YBN/POEcjm4
 M1I0XvkOIcBMlnq4JvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070010

In the breakpoint signal handler test, a breakpoint is set on
__test_function. Keep that helper as a real call target so the breakpoint
has a stable address.

The test also relies on the watched variable being accessed as distinct
memory operations. Use READ_ONCE() and WRITE_ONCE() for those accesses
instead of making the object volatile, so the source marks the exact
operations that must be preserved.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/perf/tests/bp_signal.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
index f580ba7486b1..2e4f7747d32f 100644
--- a/tools/perf/tests/bp_signal.c
+++ b/tools/perf/tests/bp_signal.c
@@ -36,15 +36,14 @@ static int fd3;
 static int overflows;
 static int overflows_2;
 
-static volatile long the_var;
-
+static long the_var;
 
 /*
  * Use ASM to ensure watchpoint and breakpoint can be triggered
  * at one instruction.
  */
 #if defined (__x86_64__)
-extern void __test_function(volatile long *ptr);
+extern void __test_function(long *ptr);
 asm (
 	".pushsection .text;"
 	".globl __test_function\n"
@@ -54,16 +53,19 @@ asm (
 	"ret\n"
 	".popsection\n");
 #else
-static void __test_function(volatile long *ptr)
+static noinline void __test_function(long *ptr)
 {
-	*ptr = 0x1234;
+	WRITE_ONCE(*ptr, 0x1234);
 }
 #endif
 
 static noinline int test_function(void)
 {
+	long value;
+
 	__test_function(&the_var);
-	the_var++;
+	value = READ_ONCE(the_var);
+	WRITE_ONCE(the_var, value + 1);
 	return time(NULL);
 }
 
-- 
2.43.0

