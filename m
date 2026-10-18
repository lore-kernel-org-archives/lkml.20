Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697713790B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315253; cv=none; b=A4lFW0Iw+0KQi6QssLbQy1r0d/dNolRE1Twgb/wgJCg63xzRuScHmzJJnijbwFJ/qRRTsm/1POAFdQW3zb6PmJVFxY0K9CIN0lWIXthY0c960GJJlPnbEm83fGuP6OvOmQJdfUSrGpOZLsbaHyU8BHVJfgjEzyGXm9DXXzgRsak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315253; c=relaxed/simple;
	bh=sjja28T43G9OAQ2y9dCQVgkCtJkYo3sxrIQqBrdfVU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqrOiVUglep9jVtyc1cJ5owsN1os0kuzuDxCOrVa1TUdZHIgQak6ivE2R/ninKscyjo0ere+zRxSGpHObuXdTdeSfqE1Eyutg9tVMBWggI1oB8r97m6ZZMyBgTgWKgNnpSnLfSlIZmR/jig9ZJH6Zmkdn0dt438QbYZqeCPWsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABu3WIHo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABu3WIHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1F31F000C4;
	Sun, 18 Oct 2026 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792315251;
	bh=TMkIbC+HawTRf+6OQ6ro97DJGRRDYz1Zf7izLigBnR0=;
	h=Date:From:To:Cc:Subject;
	b=ABu3WIHoOg3LLbCkX4BBWpR/XkbgpUQfu2VoGp5Iu2x6Nn742eWLTxWj9EOSG0y9t
	 gjkY/2uz1SwFa6e+XAZaz8HpD54NwTrpdHZpSbE3judQge19VDCAumkh3CDz0bbXkg
	 UkO1p0V34Bxh9uXdlGeqCwV5HZ8Ejb004EG5l+P3w2WFZ5PAWjPa0E8pNu7+NOEQ/E
	 NXRSnpIsN9Mq300ohJEwxKgxMq1jdmvi5Fl8XGjpgKFqJYyMzTiB6ptToJ7WoKJ20A
	 Wj/jwoF9VxR2Lh1Fr6owiNxbKwzvHRYY2brU85KKlucvSf9RS0wRCbwU7iCmWLqxZk
	 D00KvTEjE+uUA==
Date: Sun, 18 Oct 2026 11:20:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <atSPbnItoEdxnXs6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-18

for you to fetch changes up to e4c7c401c6b9174c0c893084fdaa6a84bd2520d7:

Perf events fixes:

 - Fix x86 Intel uncore driver bug on Diamond Rapids CPUs
   that erroneously always-cleared the invert bit (Guixiong Wei)

 - Fix accounting bug in the perf mlock 'gift' code causing
   unrelated RLIMIT_MEMLOCK functionality to fail (Lorenzo Stoakes)

 - Fix perf_pmu_migrate_context() bug leaving events behind during
   CPU hot-unplug (Haris Okanovic)

 - Update cgroup time when rotating multiplexed events, to fix
   time_running & scaled counts accounting bug (Antoine Huret)

 Thanks,

	Ingo

------------------>
Antoine Huret (1):
      perf: Update cgroup time when rotating multiplexed events

Guixiong Wei (1):
      perf/x86/intel/uncore: Fix DMR CXL CM invert filter

Haris Okanovic (1):
      perf: Fix perf_pmu_migrate_context() leaving events behind

Lorenzo Stoakes (ARM) (1):
      perf: Track the perf mlock gift separately


 arch/x86/events/intel/uncore_snbep.c |  5 ++++-
 include/linux/sched/user.h           |  8 +++++---
 kernel/events/core.c                 | 33 ++++++++++++++-------------------
 3 files changed, 23 insertions(+), 23 deletions(-)
