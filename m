Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516697;
	b=IZL5ptJ5v1/k1NdhMTPzl4K2BqacIHosloLF5PinYcNnVdGq1gHNt1uYI/RG7DkJAdkm
	 Am969T5nmyiBDBC1pXbsVAKwaXLffWX3QytuazMcdY2oLAKgSafPpqQ5NG9sV5nglv7uV
	 k7/6PxjE8Tr5eJfc0D/YHIbRLVBew6uSDdor5UaozwsWMEzmaV5JUNl8epH0zFwsAg/oS
	 OsjmrfQ2050NXVHWAK7axqIsqeLuRDBMBcZFscg62Kv1rXyK6cz5fc2fauIr3XQS+c1pv
	 qq5nt/Zop5EEwAHGGMfWMLtHNfqzz24A6G1LhGvDXhhxXqaH0opCYxFs8dLwR3zTgXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516697;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Spam-Status:X-Rspamd-Server:X-Stat-Signature:X-Rspamd-Queue-Id:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=Vi/uUj7tBagJWx7HJ6B+E1Ypct4qtwJEaf/1ngtvpuc=;
	b=m0jW5kb/KcR3UdE+Dk5mDfMsig2PUxgddYMx4EXjtx2CyVibrd5ZYQyfGDmSO9XYSJJz
	 Y0UmVlEimT5QDpAtCVzuZC2EQtKfqjWHOTRxMkjwJahQSKVL0gLm3E2N6UzGJz+/dKeLT
	 RPBCbTxLDPodpT6v/0t4K2tqrDyZqqTbj5vFtp0ZLj4GOjcoMioRAMJyt+ydvIb9ou/vZ
	 pKMa5blZvi6GHyZfho2m74PVOPtacuatuJgELo6u0RYXi7tYPiuHw5BJ3qNMgIP5CqLss
	 i2DImgR/p7DUX+pgc5nkUs7/XA7zDQ3YJY36p53xHwrosB9xqEKIq4SQhmblQr8iUfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=iI4ttSnw;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9951606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9951606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=iI4ttSnw
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 645904028B;
	Tue, 20 Oct 2026 17:18:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id A065B20010;
	Tue, 20 Oct 2026 17:18:12 +0000 (UTC)
Date: Tue, 20 Oct 2026 13:18:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Tomas Glozar <tglozar@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>, Crystal Wood <crwood@redhat.com>
Subject: [GIT PULL] rtla: Updates for v7.4
Message-ID: <20261020131811.7e70d93d@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: jmtsc1qqt8bptiiqahh9z3g3e6sd4cqy
X-Rspamd-Queue-Id: A065B20010
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+eCysPAhYwG+1AdoBvCkEhMPvk68WWDDg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Vi/uUj7tBagJWx7HJ6B+E1Ypct4qtwJEaf/1ngtvpuc=; b=iI4ttSnwCKlcoRkRHf1BUNeUAiL8eg8xbTiRUYcSml4xKcpT+IZnLxGLVvPGQNxOSguRT61FKpqA/AlzLBELDWUPdZt9AJCizSu2XHMp1vUdU0MVvgY0bCZq5WMZlYakoSTgB+2fgJeQok2TpsvxQpN7EOFKtgGxzNTL5p/xhaI=
X-HE-Tag: 1792516692-380258
X-HE-Meta: U2FsdGVkX18rGC3IT6SCFR5YLl99gzaveoTJumBv4/7NG075Ugqv9PlOsRkM/yBI/nHIGFl+/+wT69QlUSADmiqJ1kNEuZCk5G8moNjpSvrH3Hwr7SfwMD1yoJKuaxdItfRlJzGl2Ax9pqVyBfzVB8tkzuaW23NOCKrOuKFamxkn9zcfKDEwbQutCqE2q3kM5jljOxjSkai4Uaz3KBMMmuR8awou/CBEJA5G6Fal13kQkbRO4Lc3zHLh4nhLOL6v4NzNGZdGKZjLltNze0eh2R/xqiuHyPJ+tsIksYKffGWd8Dj5FgvZ1owklzAI9niMosLU0ZrWOlQTzPgBk3w8ub4x3fEEwMWh


Linus,

RTLA patches for 7.4

- Test actions in absence of threshold

  Cover the case which regressed in the past in tests.

- More robust CPU count detection

  Parse /sys/devices/system/cpu/possible directly instead of going through
  libc for CPU count and sanity check against any mismatch with the number
  reported by tracefs / osnoise.

- Add option to record IPI count in osnoise top

  In addition to counting IRQs, add an option to enable counting IPIs
  targetting the measurement CPU to the rtla-osnoise-top tool.

- Improve runtime test usability

  Catch up with increased complexity of runtime tests with better defaults
  and more options available to the developer running the tests.

- Simplify osnoise tracer option setting code

  Deduplicate osnoise tracer option setting code with macros to make it
  less error-prone and to make it easier to add new tracer options in
  the future.


Please pull the latest trace-tools-v7.4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-tools-v7.4

Tag SHA1: be7bf0909051623c90d138aa7ee28694df6bd640
Head SHA1: 5ddc4497508a628b6c18653a0d5208edc6228aaf


Crystal Wood (3):
      rtla/tests: Use absolute path for $RTLA
      rtla/tests: Show the command line for failing tests
      rtla/tests: Add $SUBTESTS and $STOPONFAIL

Tomas Glozar (7):
      rtla/tests: Test actions in absence of threshold
      rtla: Replace get_nprocs_conf() with sysfs possible cpus
      rtla: Discard trace entries with cpu >= nr_cpus
      rtla: Abort on nr_cpus mismatch with tracer
      rtla/tests: Add unit test for cpu_list_iterate()
      rtla/tests: Add unit test for get_max_cpu_from_list()
      rtla: Simplify osnoise tracer option setting code

Valentin Schneider (8):
      rtla/osnoise: Add IPI tracking cmdline option
      rtla/osnoise: Record IPI count in osnoise top
      rtla/osnoise: Leverage IPI event filters when tracing a subset of CPUs
      rtla/osnoise: Allow IPI filters to gracefully fail
      rtla: Make struct trace_events double linked
      rtla: Enable and disable events in the user-defined order
      rtla: Unconditionally clean any pre-existing filters for user-provided events
      rtla/osnoise: Trace IPI events when recording a trace file

----
 Documentation/tools/rtla/common_options.txt   |    9 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst |    4 +
 tools/tracing/rtla/src/cli.c                  |    1 +
 tools/tracing/rtla/src/cli_p.h                |    7 +-
 tools/tracing/rtla/src/common.c               |   31 +-
 tools/tracing/rtla/src/common.h               |  102 +-
 tools/tracing/rtla/src/osnoise.c              | 1291 ++++++++++---------------
 tools/tracing/rtla/src/osnoise.h              |   38 +-
 tools/tracing/rtla/src/osnoise_hist.c         |    1 +
 tools/tracing/rtla/src/osnoise_top.c          |  156 ++-
 tools/tracing/rtla/src/timerlat_hist.c        |    1 +
 tools/tracing/rtla/src/timerlat_top.c         |    1 +
 tools/tracing/rtla/src/trace.c                |   35 +-
 tools/tracing/rtla/src/trace.h                |    2 +
 tools/tracing/rtla/src/utils.c                |  181 +++-
 tools/tracing/rtla/src/utils.h                |    6 +
 tools/tracing/rtla/tests/engine.sh            |   23 +-
 tools/tracing/rtla/tests/osnoise.t            |    2 +
 tools/tracing/rtla/tests/timerlat.t           |    2 +
 tools/tracing/rtla/tests/unit/utils.c         |   71 ++
 20 files changed, 1049 insertions(+), 915 deletions(-)
---------------------------
