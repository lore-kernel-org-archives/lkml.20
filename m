Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536593F1077
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791099535; cv=none; b=HCDYHyFCLVFe1H2Woux+A2EJu+RqO5xw+YGyexCNXqM6nk92dpaS+Wo74cfLx7e74G3GIVSlO25eE77fKUAS2CbS8vuD7hiyNa5NbZ+KoSLBHXSZCdXcYmw5I3FQ06VMk6MetMkduP9btLi3zGk6aMU3lEmHwJz8HwTtA07Nvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791099535; c=relaxed/simple;
	bh=PYuSs0cJy8m8T11YLIpKYiX4MfcnbCilO5zBBvCfIhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPySPwvbWDmKmd++NTMlw+2Ki161j85t8o8OQj6IWtAdvefvMOrI0I65P52TRF10VjLUJg3Kho1zmv4ItFltLYlbgCDU6K4WYsg8Apk96TakJGZ2G3WuM3bKSDwU6hFb/mvZ82fjdQhG1OyA4v+xbz9joGftlXBZuKYUcsB8pVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5Q/4k8i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5Q/4k8i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89261F000FF;
	Sun,  4 Oct 2026 07:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791099530;
	bh=zOO1WWiJTkuTtGcFcSXB5aY7iPvBW7Kztc3jeEtqm5Q=;
	h=Date:From:To:Cc:Subject;
	b=e5Q/4k8i7wLU3DmxWSTGmMnEMn2sczYP0RZuTE55Ny0noxKQUFT61vwOCgkHJmI/q
	 SgK6Q6IsZC9ckPIzUuD8cURT5WMwoaVCSpu42fsTRh6DTBeOBzIkcZk6hTrXqeTP1C
	 O/XtuDIvNc3HeyiHXRTJPiv1Ibbp3ekzBzT3FAwSh4AR3Nl33VolaalT3FCiIw2kQ0
	 HzThk6O/s6oAAqLpiUj7O0oW2CgzA+yJ9VgPdwgzUvhTOuKdRpKXtxuDTH6oAbkOCr
	 jI/YCliWfXaswIRv2i7H9srhUyMzafJz9T1WEi6f/V9z2ZmzecQXOe9LXoiCtDWyTl
	 aHON0aeYAz/Xg==
Date: Sun, 4 Oct 2026 09:38:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <asIChrhIDr-KBzYc@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-04

for you to fetch changes up to 357e8a77a501d96c9517f01f4a211eed5e9c9184:

Perf events fixes:

 - Fix race between perf_event_exit_task() and perf_pending_task()
   (Luo Gengkun)

 - Fix perf header output management regressions (Ian Rogers)

 - Require kernel access for text poke events (Zhengchuan Liang)

 Thanks,

	Ingo

------------------>
Ian Rogers (1):
      perf: Replace perf_event_header__init_id with full header init

Luo Gengkun (1):
      perf: Fix race between perf_event_exit_task() and perf_pending_task()

Zhengchuan Liang (1):
      perf: Require kernel access for text poke events


 arch/powerpc/perf/imc-pmu.c |  23 ++--
 include/linux/perf_event.h  |   7 +-
 kernel/events/core.c        | 315 +++++++++++++++++++-------------------------
 kernel/events/ring_buffer.c |   7 +-
 4 files changed, 153 insertions(+), 199 deletions(-)
