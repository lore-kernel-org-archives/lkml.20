Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3C38B7D1
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789287145; cv=none; b=ZiOiuqMB+pwwU0Fizuck3Lq0r52O3uqyL5FIg7SHCylHFMt+Yy1qaU6hg4TV96iivxEhq4Gma+cXaLysLbzcvDrSQPZNQfPM0aBPhSel4vCC/gffUH8M/w67SEOnV6DvFLBnMlIMK14ttx25h+XAYwmBoaS51vYiK2j7+G9w93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789287145; c=relaxed/simple;
	bh=LCXFAOk/C8B61f+JOz0OmDoxPmfklZapCkwIPsMVpS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNxRcQR1yQ4uTPs9hnVlDP2wum5s9bin6/AqfbOeOY2kk6zgpBUj8qaaGWHPJnWIhY2xBNfFs696R/IlEaGAnetxGStMFtjH5iOGnNJ+pKdGG4EoizM3upoh6QURNVwz3Niw30uzEro7XYM1uUjyDstZBTkWuJrCVZjY2D71u9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg9CfB7b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg9CfB7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67D41F000FF;
	Sun, 13 Sep 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789287134;
	bh=UjaG8gp1CFyRN1dpryjLaFjTQYGtGmz0HDIgBOwCpns=;
	h=Date:From:To:Cc:Subject;
	b=Qg9CfB7bgKmnQDQQENCEHJI1Pbmd9FU9vQBip9SM72PfrsGneI5TU5lv4Ohc7RI/A
	 IPg3jHgM/xPZI/zOuK62ghlGr44AeVMmTkvdBlQrn0J43bfBmioNJhxM1YtEZ6L2p1
	 bsfOS+VidjYbyfo+idSS9p+O+9uL1o1YsuYQJKNobyhInkXUQb2JZKgQRHbvRKvY5v
	 0T/JUD+u5y8XK2sAjnZ1Fj7yWQuNOgGSlRSzBJycVPLVJ9iNlLtWmkhP0W/74AWHUq
	 +iXPhs/MLeNF4fscVZj9Hr9DJITCcFsB3wFnAkmXMt5AMIneiQiQLRzCZJY8u3OJ2C
	 3HTh8h2UbcxGQ==
Date: Sun, 13 Sep 2026 10:12:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <aqZa2mwcibFd9w1A@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-13

for you to fetch changes up to a56c03a397e2cd0c4cf8da96dcd6214f7d0e7d8c:

Miscellaneous perf events fixes:

 - Fix sched_cb_list corruption on PMU callbacks that
   invoke list_del() during perf_event_overflow()
   calls (Thomas Richter)

 - Fix PEBS pt_regs->flags snapshot data that was
   regressed with the introduction of adaptive
   PEBS v4 support (Dapeng Mi)

 - Fix possible drain_pebs() re-entry bug
   when intel_pmu_drain_pebs_buffer() is called from
   process context (Dapeng Mi)

 Thanks,

	Ingo

------------------>
Dapeng Mi (2):
      perf/x86/intel: Correct pt_regs->flags update for PEBS path
      perf/x86/intel: Prevent drain_pebs() reentry

Thomas Richter (1):
      perf/core: Allow list_del during perf_event_overflow()


 arch/x86/events/intel/core.c | 33 ++++++++++++++++++++++++---------
 arch/x86/events/intel/ds.c   | 18 ++++++++++++++++--
 arch/x86/events/perf_event.h |  3 +++
 kernel/events/core.c         |  4 ++--
 4 files changed, 45 insertions(+), 13 deletions(-)
