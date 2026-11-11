Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404595;
	b=zZt0cWdX6IYoaVFoDvkeeCf+rZDCArXagOjN3MNBHtRw1ddXGwFwhL/MmdtpA9DS4LR9
	 +hQN3ewMIPKMArzR5474oVJ09OCGM1GWelpIS1UtWTmUtG+wVBAPplnKaZA1jw/sFa4QQ
	 XbnrQFWaqCfsL9B1pQ9rEv2sJqg5GSNwA2zQK2dEqE+mpLt0lsN2C6iHLrFTyVJRB5bkS
	 T0prshv+SsEkfNm2VcK0YJqXZAYt8aX9KA6llWVOCc6JONqpwvS/0FDJk4UVizix/PSLU
	 M0oU2qstKg3Pmdt/djGT7DP9MCkZp/UXUiwh9ZoPGD5sMedGBS5VGQPql4Ga05MbQfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404595;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yPXyR85ZGjl8cLhK0+9qJ60mEpjll9ZfGxDyPNzKK24=;
	b=gf1Ov6Diumpt6KN25HS3Z85/WUZzq5WQyQN1zyB6ZVns/puNhUJdYGmoHGz1I9gAKdQ0
	 kifelw5HfzHaqMuRdNhw8imJ9vrXw50LgWv0VTR6Pg9kWQDH7UoAshuKhD7AJwq3+s7pe
	 gDO2xL08GEOSnaF2HP8HuQY0yKBLHJ1itFxy/Awrh+lc8zdVk74QtmyUKvSqQ5SVpmgzR
	 uZ+8b6G6CvuNHY+CZWGI5a4NjxdY/oIIwsdnllbYimGghELfaxaolijTlIef0b8porIxN
	 wMH5X0vPlMhqMCgFv0JtReDNoCnhJB2+WAqprwW2/I0PsWrk7FOr/CaXBOFAuOqo65A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fwrtpPIi;
	arc=none smtp.remote-ip=95.215.58.229
Received: from mta1.migadu.com (out-229.mta1.migadu.com [95.215.58.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B760A2615
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621B760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fwrtpPIi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PSpT5Sc3wmThmMLvMIuwKVFzFZKXPyJVwlLny2D+v7E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794404589; v=1; x=1795009389;
 b=fwrtpPIiEN43HS80PS2mPdIYb61FPeGK7kaQsTS8DBSUWXEOB6p4TYAkSOcWU+4Y5B0zzRq9
 fy1iym/eYvjLOy7PIUt26A6xTcR1Z7bHsCtr8w+A/6xFS2vDU8xz/KXaUTXiYiwczIejSkEPIDQ
 ZDfLVQVNk80NSF79nR5934+s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a1a212ccf97d6c5;
	Wed, 11 Nov 2026 13:43:08 +0000
X-Mizu-Trace-ID: 0a1a212ccf97d6c5
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	ridong.chen@linux.dev
Cc: cgroups@vger.kernel.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH v4 0/2] cgroup/cpuset: Keep the top scheduling domain populated
Date: Wed, 11 Nov 2026 21:42:48 +0800
Message-ID: <20261111134250.16852-1-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

Boot-isolated CPUs stay in top_cpuset.effective_cpus, but are excluded
from its scheduling domain. Allocating all boot domain housekeeping CPUs
to partitions can therefore leave the top scheduling domain empty,
leading to warnings and an OOPS in build_perf_domains(). CPU hotplug can
reach the same state.

Following Ridong's review, use one tasks_nocpu_error() check for all
parents, with an explicit mask of CPUs returned by the update. This also
allows CPU replacements under populated local parents. Hotplug passes
no returned CPUs and preserves partitions unable to restore an active
boot domain housekeeping CPU.

Patch 1 contains the complete kernel fix, including all caller updates.
Patch 2 contains the selftests.

Changes since v3:
  Unify the CPU availability checks following Ridong's suggestion.
  Restrict returned CPUs to the parent's current exclusive grant, and
  retain the active housekeeping CPU guard during hotplug. Collect the
  kernel changes in patch 1 and selftests in patch 2, adding a regression
  for CPU replacement under a populated local parent. Update Ridong's
  email address as requested.

  v3: https://lore.kernel.org/all/20261110050324.173461-1-guopeng.zhang@linux.dev/

Changes since v2:
  Keep patch 1's kernel changes unchanged. Update its selftests following
  Longman's and Sashiko's comments and cover recovery with a single
  top-level HK CPU. Add patch 2 to fix the CPU replacement rejection
  reported by Sashiko, with its own regression test. Update the hotplug
  fix, now patch 3, to avoid invalidating unrelated partitions, including
  partitions whose boot housekeeping CPUs are all offline. Drop v2's
  isolated CPU cleanup patch in favor of Ridong's fix:
  https://lore.kernel.org/all/20261107120100.3587595-4-ridong.chen@linux.dev/

  v2: https://lore.kernel.org/all/20261105130344.664336-1-guopeng.zhang@linux.dev/

Changes since v1:
  Rework the fix following Ridong's suggestion and add test cases.
  Add patch 2 for CPU hotplug and patch 3 for isolated CPU cleanup
  when the parent partition becomes invalid.

  v1: https://lore.kernel.org/all/20261104071600.474587-1-guopeng.zhang@linux.dev/

Guopeng Zhang (2):
  cgroup/cpuset: Keep an active housekeeping CPU in the top sched domain
  selftests/cgroup: Add tests for top sched domain housekeeping checks

 kernel/cgroup/cpuset.c                        | 85 +++++++++++++++----
 .../selftests/cgroup/test_cpuset_prs.sh       | 71 ++++++++++++++++
 2 files changed, 141 insertions(+), 15 deletions(-)


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

