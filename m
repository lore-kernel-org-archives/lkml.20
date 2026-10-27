Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103645;
	b=pQ8Ac1+W6NW6an3pNFxi1JQlFfq/DrJYU/h8NWJTR6LKHoT9EnYCjpMPcixUytus19YT
	 9pKPyJQDspA5X2wQ6+XLmRGZeoSTR29lCxJep/GfKAGkJYv/93sDoow1QQjDL/u7l6eH4
	 z+yw1Me5l9cm+fl5RmtExE58hirzLYOv8D/set1+d+9z4vBSY1Qf/kAk63FId0/Xl9H9d
	 wK20aUsZw9GoqASrHfhl7rL1etkEwJqlbyaKudf6XaLHwT0aT337rYn8Z1YJz5gXEny8i
	 58vTWHsBA5zQJL1ywsxve6Ip4LEJFWakR6zL1/OPacXobBLUDSGeUNqblzQJMboFXLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103645;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3uHNkIbz1W2hVmZzTNOsS0vwkqrVetO/PC31U24Oh2o=;
	b=1NqgPbRTA0as6ygvIB0ElovppauEqRz2vRVG5LmChKIfC7+DTtsRWhp+XjIGTPuAmPPq
	 TzqwgQ2SyRRhLsUAPnynrV0U22yDsgRN0jE9kAG4rLiUBlPJ+cpHF0KPvPpN22kr1gpHA
	 iwDV3O5req26wPgrZEqlYAII3bKfpfhiP8+5yxdnN8kMkorNIgnDB1+Owpq/l7P+KXH+x
	 G4/c7NWGWuxm/iEUldVKy9r8f0Mh/WlB43wvTx7Fkq0K4xhwYaEyntpcPtZ8/MFgRsj2x
	 yREe9DAJ0xW6iRhhF/eCt+2/cWFC6jSZpSZKnGUuBWncutY/a4dhUDujRknXgTP64Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k6+zS+vG;
	arc=none smtp.remote-ip=91.218.175.23
Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33BD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k6+zS+vG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cF4VhcKCkracUo6gNIATmuRN1hHW/I53fxt0RDVbk+M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793103643; v=1; x=1793708443;
 b=k6+zS+vGc0DuFZGWaTqzhdhz1NQwKEixaQvY0If8/c5h9gJnI5Qhrbgys/3hsQWHb+iH8/Ta
 55Hv9OEC+PWZQY4Zmr//7zwrafI66hmZvydjK3xqWB7nXtPcIMS+aeavKFcZt1Gdx7Mo985pjyL
 hh1z0reSYhL/SZIG2GUzq5pg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ae49ba9d3797755;
	Tue, 27 Oct 2026 12:20:43 +0000
X-Mizu-Trace-ID: 5ae49ba9d3797755
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kas@kernel.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: fix khugepaged_race build with older glibc
Date: Tue, 27 Oct 2026 20:20:13 +0800
Message-ID: <20261027122013.4286-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

glibc versions before 2.37 do not define MADV_COLLAPSE in <sys/mman.h>, so
khugepaged_race fails to build against them (e.g. glibc 2.34):

[root@localhost mm]# make
  CC       khugepaged_race
khugepaged_race.c: In function 'main':
khugepaged_race.c:506:23: error: 'MADV_COLLAPSE' undeclared (first use in this function); did you mean 'MADV_COLD'?
  506 |       hpage_pmd_size, MADV_COLLAPSE);
      |                       ^~~~~~~~~~~~~
      |                       MADV_COLD
khugepaged_race.c:506:23: note: each undeclared identifier is reported only once for each function it appears in
make: *** [../lib.mk:225: /data/code/mm/tools/testing/selftests/mm/khugepaged_race] Error 1

Include <linux/mman.h> to get the UAPI definition of MADV_COLLAPSE.

Fixes: 66c374464438 ("selftests/mm: add khugepaged race harness")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/khugepaged_race.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index abb0678522cd..1a27cb39745b 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -8,6 +8,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
+#include <linux/mman.h>
 #include <pthread.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.56.0

