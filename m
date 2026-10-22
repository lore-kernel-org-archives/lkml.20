Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649633;
	b=pb61UDeM2d4XcCze6QUytFPGe26GVBeipFWXIcyMa3i0Heq5yhB0+pEZMaLlH10dqNjo
	 a+kSpqamEsamtxWdILXZe7wg7d0Z21AvL7RT84fCbu3myEDRYcVOPYrI6DTELGBECd3J7
	 5Iu8vcF1U0FElF/pTAhJCmG6MZgs+KvBymh1sAsG8HPtzNnDaytXquZHpyHXdTg983EH4
	 b7VZETYHSL3CMJ5acYG/xiFgfVXgQKe4ucIIDMeyF8N/B914LrpgnQRm/k2QvPWvgLrNE
	 g29JPe++CgDCJoxuC2HRGyd/2VoFSTBgFJz6L8D77+iXxWOfp+KiJlw6HG07aHaUg7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649633;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=BmgIMapkahKlbfyQzrcwQvh1U+8wbB6XnkC4IJQYK+Y=;
	b=3h/Qo29jy62IQsjNL5cW6hjMEZNk1eZ5jZ4sKgMROPuYvBN2u1kccIE+BW/jx+RUMqUT
	 R6jSxRXrWXwFH7Jr3eWd2qnH4ho7LJ6fotXRft5Qi4ACkrGJVrJ3y2ev06bDKg3uG0vwu
	 qs/1BKSk7qJCzVT3agXdVqtey8iLe3fpgh/AGsk1nydVTxvEOMeKJx01pW3fh3yLt1/hb
	 HozOICekmt2VeMu1225HVsYvJvCGqEoQvoW69+oRR5bm0Ea4i4r9ax6qeQwQswysq7Bm4
	 Fj47x1hBPMK18L1ynGws88LJCYuCoM0/3Sl0yQ86uFwfOQhNmr6t0+AxdESs15MbZGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JTezKpN3;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92150606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92150606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JTezKpN3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Bm
	gIMapkahKlbfyQzrcwQvh1U+8wbB6XnkC4IJQYK+Y=; b=JTezKpN3CCTU0OaMKO
	kYgp0UP06HFSdGEGDpvvyD9edd9RlzLTM8drMne4VLPZpUHPLVFCUHEYsJ7+uE/5
	Hxur8C0ma6J1+AyGx3kAHJzrrurUYLhXsNa4+2zhsEIab7gnxq4zStOgI/W23xFb
	bgcQdpr9CumtIdSetAJmulYJk=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3HzFPqdlq2HKKBg--.22271S2;
	Thu, 22 Oct 2026 14:12:32 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	elver@google.com,
	jpoimboe@kernel.org,
	heiko.carstens@de.ibm.com,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched: Drop the never-defined $(PROFILING) from CFLAGS_core.o
Date: Thu, 22 Oct 2026 15:12:31 +0900
Message-ID: <20261022061231.610118-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
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
X-CM-TRANSID:_____wD3HzFPqdlq2HKKBg--.22271S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wry5XF4rAr1xtF1rWr4UJwb_yoWkWwcEga
	97CFs8Kw40grWkJa1xCrW7XrWaq3s8Jrn5Zws7Gr17JrZ5tr98XFyDuF1DGFs3Jws7Zrn3
	JFySqFn8WrW5KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRtkuUUUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RCP7mrZqVBYwwAA3J

$(PROFILING) is not defined anywhere in the build system, so
"CFLAGS_core.o := $(PROFILING) -fno-omit-frame-pointer" expands to just
"-fno-omit-frame-pointer".  The reference is left over from the days when
the scheduler build rules lived in kernel/Makefile; the ftrace compiler
options moved to CC_FLAGS_FTRACE in c0a80c0c27e5, and KBUILD_CFLAGS adds
those to every object.

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index b1f1a367034f..bd6f4e25e686 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -22,7 +22,7 @@ ifneq ($(CONFIG_SCHED_OMIT_FRAME_POINTER),y)
 # me.  I suspect most platforms don't need this, but until we know that for sure
 # I turn this off for IA-64 only.  Andreas Schwab says it's also needed on m68k
 # to get a correct value for the wait-channel (WCHAN in ps). --davidm
-CFLAGS_core.o := $(PROFILING) -fno-omit-frame-pointer
+CFLAGS_core.o := -fno-omit-frame-pointer
 endif
 
 # Branch profiling isn't noinstr-safe

