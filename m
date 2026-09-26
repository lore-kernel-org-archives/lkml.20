Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE74365A00
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401919; cv=none; b=bx3BZ9Lz8WzGNG9AVuoaHVoQ2JsoMRdiidqjx1JX0LfvBe0sSYhtxvLlQsBy0VbpNZ1XSlmfa3zOv20HAgFnDzKf4zpnFraoa7u9qzIbDm0eQv1TyNfDQNn9jUAUaIOWwwiQyFNl33bp5sHDJLB0JbsSTArRzU6nxiCN4IpquzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401919; c=relaxed/simple;
	bh=9RXKOWZdfkg5EyFwqm8qaMXGUne5S50EBQ/ThlsAPSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJT5z7oTzx3bl2cI+WCKyc6jvWJb7zodq49hYBcvYc4YrXEPgsfMaGQOvqfQnUGdQZuNK2Omdl7heCWTLqsvskQxuce9UVbNwJylPfSY0RFgo/MrKfbYe95isiZOzuA5v0kMHHbPSxRMgSemt4tGB7OzBRNYMzaKVdBS8486eiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbnMnVe5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbnMnVe5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so915104f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401916; x=1791006716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuKCG/8Yq7XE4kptDjfwqIDbhWjCk5cWtvEdVchH9Gg=;
        b=MbnMnVe5wQtZuWkfL2YrIkxta8viJ0lQkq3RhrcogMZ17MBJkZR/WpBv2lSE5rJZhx
         6j3Rxt7YceHCpjbQ+w55i22EJAzFxE14ONUyE7j8pjZ+eiSH1K6RE6cjec+XZBWTJ48M
         xt1iDZxnqZt7SCxUH8kNOBPzDD+K6jQ/IF7dIhmxqK7fkLDd5LNDJQd9aCtOC0gkFQ1x
         IibdhTAFLLgSPNuMh5U2FWw6UlM565yAvMBW87OIAOx7/jeA3HDKBcWJWw1RzbwR/scp
         IZnFgQwsGcWNQmjZ343s4qHQr7ZCQEuGioTPhzu9oldATgxt+ZeQA5LJDS4d7zuYq67b
         dWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401916; x=1791006716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuKCG/8Yq7XE4kptDjfwqIDbhWjCk5cWtvEdVchH9Gg=;
        b=Tx7c7fABn+A9hanciXydp1I1FPwayGWE6ByBXgaL7mN0dVt3qWW6APALwC9ZP38341
         k0XrPhoVQkfHU5yf6hvR/R5Y1kMbkdvqhYJPeoFe8/+bvlNdvX8Yix9+cGcmNe6oNVN7
         C3O6hMe4N7nTYJDsKWipcUaLAsxM2bLdNEjRKDLumkckW3uVQL12CH5N4QsdPhrKtuoG
         wZY6sMQ9zFjCo6S93m5Js0gyKsMN2wjYY2ZBr3T5A1eKQM1zvznGDh4yucMZwFSpqA7Q
         LtSDn20pUBIj/ASRBIuQR2Y0uHlkv4V/SbHpmE/Eopwmny2fOCCcfBORggQ/S0wE7ro8
         5PWA==
X-Forwarded-Encrypted: i=1; AKwUvBzD0b40CLITZ2/FsFKASkUY1txBhTUFWktyO1OlFC9knPZoOC/owbHg6EeKH7QV9QHG+aFwRVkY286GpgE=@vger.kernel.org
X-Gm-Message-State: AFuF++lH7WCEbiZV9+UrZefZlf/eceh8/HipazKWytk56P7JyPrZotDu
	vhrXI9qQf/X/GGP8hq5V5FIsLXl2V0j81KBYITc4fREfdJCecdgedMP3dhOwchAR
X-Gm-Gg: AYBFou2NIjjwoade4BdVjtWvcbl62Mjy+AF1mF4XA443mNnYzwn4Ko1TOgPksMdtJT6
	GfYlUqYrshhpb67Yzcj2L3a/ARFdVY5k7cZxSrIYRxFDNL/FK1MWQuXAT7OVlT/+hElfWyi4dqm
	EZtR15/wEVOIGijpol74xqsNMR4QO9141C0pMPp8gkj3AeQDG8gC/l2Jl3Yq/t1ug8lwKlVkUsS
	lD2Ah4ZAjIJHIguxVJi4dzSpy0t/zhHjtoM982Aamk5d3SFqgGGTYCigoImpv/opbg/r/WictTb
	aEPlsX86816PlxY8peaTTB+sEz7pGdl+OeHRR/cJdYEVrMVA/PNlzyV9KS3/QRL4ULeKXWNMkZ0
	uiRNS1eirBpknwYEWttLGlujdScVw2cO3qhyWQDqUAnoPgCOh/HI7qOmKH6VkKMyfTZbuEPU54L
	QiZPXFCQ8TWbk9ttoo/bBYjtM7f3TtMNDtv6lRlZhERNi/q3ufhUH/E1VCvB4jYhEvcq8p528Gz
	8oePRcnf0UmNwNyWDKXdWevMdUyT82A1QnFMR5uQtBO
X-Received: by 2002:a05:6000:2906:b0:487:ff1:6274 with SMTP id ffacd0b85a97d-488716b290cmr15769328f8f.7.1790401916378;
        Fri, 25 Sep 2026 22:51:56 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm12317560f8f.1.2026.09.25.22.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:51:55 -0700 (PDT)
From: Sebastian Chlad <sebastianchlad@gmail.com>
X-Google-Original-From: Sebastian Chlad <sebastian.chlad@suse.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sebastian Chlad <sebastian.chlad@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] selftests: cgroup: Report failed checks in test_memcontrol
Date: Sat, 26 Sep 2026 07:51:46 +0200
Message-ID: <20260926055152.1684-1-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_memcontrol fails intermittently, but most of its checks fail
silently, so a "not ok" line gives no indication of how far off the
measured value was. This series makes those failures print the observed
and expected values. It does not change any threshold or pass/fail
behaviour.

Patch 1 converts the terminal tolerance checks to values_close_report(),
as was done for test_cpu in commit 4cdde87d723a ("selftests: cgroup: Use
values_close_report in test_cpu"). values_close() is kept where it is a
loop or retry condition, where a mismatch is expected.

Patch 2 reports the "memory.current < 50M" check in
alloc_pagecache_50M_check(). Because test_memcg_high() calls the same
helper expecting it to fail, it gets a quiet variant. An alternative
would be to pass the flag through the currently unused void *arg of
the cg_run() callback; I am happy to switch to that if preferred.

With patch 1 applied, we observe at times failures like these:

  not ok 3 test_memcg_min
  [FAIL] actual=18722816 expected=30408704 | diff=11685888 | limit=7369725 | tolerance=15% | actual_error=23.78%

  not ok 4 test_memcg_low
  [FAIL] actual=20852736 expected=30408704 | diff=9555968 | limit=7689210 | tolerance=15% | actual_error=18.64%

  not ok 4 test_memcg_low
  [FAIL] actual=14364672 expected=22020096 | diff=7655424 | limit=7276940 | tolerance=20% | actual_error=21.04%

These are the child memory.current checks in test_memcg_protection()
(expected ~29M and ~21M). Their tolerances were already raised in commit
d2def68ae06a ("selftests: memcg: increase error tolerance of child
memory.current check in test_memcg_protection()"), and the values above
still fall outside them. In the first case the child is about 38% below
the expected 29M. This series only makes such failures visible; whether
the expectations or the tolerances should change is left for a separate
discussion.

Changes in v2:
- Patch 1: pass the measured value first in the alloc_anon_50M_check()
  values_close_report() call, so that a failure prints actual and
  expected the right way round (reported by Sashiko AI review).

v1: https://lore.kernel.org/all/20260926034923.31718-1-sebastian.chlad@suse.com/

Sebastian Chlad (2):
  selftests: cgroup: Use values_close_report in test_memcontrol
  selftests: cgroup: Report memory.current shortfall in
    alloc_pagecache_50M_check

 .../selftests/cgroup/test_memcontrol.c        | 50 +++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

-- 
2.51.0

