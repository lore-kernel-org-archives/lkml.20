Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559040;
	b=GBDCkRquiQ3El8CRywQK4N+hsvTRAtgV3olqQ/eGuGsAG/5peOxI3SV9ZnIdzAGG9nFw
	 kFO9DavwCfThn77+9p7OMknw19JJhOOAMxe1zj60tw//W8aqF0+7trBBKU4dDcp0PRqRR
	 aIz3KfjqT3Qcf4nAhAtR0WhSEB4XJoRy32woxy6l8b0UDYx/mEY2p5eBV6DFiYs7P7VXt
	 QB3iGefaaLfOlYon/ewoRl2zh4blqzVE34c/HjnANpXtYLb11mjUxUegaNjCeiwS7Dj86
	 8FJo0ppoM+1y/nN/lqghtWv9EDWi+Ia6WEndULJAiiONto/FOKDvNYnbJIYePcdiK0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
	b=ayVupPs1bfxx1SA7LwwfNYrWkEV+XT6bDxp5+hB6DQRbLbDgv/J5wKKlDS7oOGAYqm+Y
	 8eVPBcInO2/75vNly8deUC/R0aG1tW06ZVRSM+go+94IZCWFY2OesmPCSxK67XxQG+6sU
	 3c49m6Mjp+6guhu2yi4iCAxSeNbtpsig3fwQKkaa5LrfL8vmhnweT4ytvDOy1H5NtGjRn
	 jVPGnlrlED5GfRPOnCage1dT3EzAn6hK6RdB4vqE8zRZXn8N++1yCkBrCsSpa6tP0PEob
	 anLjQf1zVDJkpVZgo6IJ8Kgp+BHdWuRE+x2rIqex+A1HFCJ4JzmSOzTBzZgk9o8xt1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FUGKdwwy;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21590606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21590606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FUGKdwwy
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2eac6e9aed5so2575025ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559038; x=1795163838; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=FUGKdwwy5qp1Qi31MPeEdEjYr98cr/fMoFORoQlH2iwqJ/AXUngqtv1zqJrP4cUvEv
         x/nII5hqIUrGDUUv2cVC5QDADZ6XKn4Aial/KEbbH8VcA9bY9EV8JU6hFge+fBUIsOhE
         BrLuIwU6hb8JiJGDb1/dLkGy5AvjdX2mufF6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559038; x=1795163838;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=I5ZpEyuBRN6oPHXMdcb+cIJP67rs7W+2cMkVsvdb6r0hRgLlsHeGrH3Cl4CnWrIGWI
         STisSYgkVTs5O75m4+M8XenVzvqbjvew/0rlSUJSECpjSFfsqejtvL4GEptRFs6o68Jk
         5WDtiqyoCdSEqksVQ62UbJio44v8D43ALhDD+tEnrEa5oPFdudYbX90p39jKe+h7HBeV
         IwHdWQZx/kW6wJ1i8bJyaU+BlfamlVGP5CJjadSpxGZcbQTM+XlZGieJSMLuT+8zEQmw
         DhAlItfoB1ynXgSF2CFMWkkkZLIqJWOFqT/z9d20FRwae3BHW6gPu6A7FudMfHy4+u4J
         YA1g==
X-Forwarded-Encrypted: i=1; AL+hErEIhwNimT9dsMlx6+Uhy/eXSmkYGTuYleTh+fCzLFyCyETZVrnpz2VIOrNDggVUB5i6ZtKZKGuXSpWRQnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ao5KHiMbiNhfjVjV0CXbbUym3NqVIi5tnkjCd+WnXgHh9ycs9
	D+9crt8olNJWn0Aj+37FIEUNqtPUwLRZW0IF5oP3Vo/WMKlCG02yXNj992tUcJWEAcc=
X-Gm-Gg: AYBFou14ZUOzyB/I4UmwsiGhm2aUFmz6AsSdO0GZiAQOZbBI1k4k00EPp9nyj+PeO7v
	xS+Gl5bodqv7RHkTBLFDrwLItFnVpInhXxTvoSRDIuLY+LJAZJMVlyB3vcp8eVZx2b9x3L6/uOz
	YLFnWrLUaFEkWw6dwASrB9Aq0FVbadOMA7bg6GYafPEozyP//JsG7ggxPf4OGrP+F6TSJ910nKb
	9NtM0DUZJBynuQUnTuym1m0MWGou7MT+BPXffNtRv1CPZLK3zDdq5xMe5stbqCRJ09IpOH2ni4t
	vjbrne7MSBLRgTqCByWV0b/bfGQdiOhYvDfa0QIhf+ODSSop3MskuP9LpHCxAQaKy2HU8PdErIx
	RMOLFxZ5gK045zYk42ETpX8qE6s0NEsHDrStHEE5F5SHJQxp1MDYe+OqP15mwUwcH03asEKncuh
	Wos/iN0hCVxc7VpTqZgJ2YnzzbEpjqRbjaYA3wyFiCyXfvi3I1XNBEAGCBGUxYX9RVe7FLA7+3a
	iI1csL1ZjAboGfyGlD1hXiTbOc+auY4EPA/M7XmrrMy/v8I+2PTgHk4opqRtUJ86PKc/Y/Z4duy
	Qsc9VVC6kP+C+n3r8cPl2gDuL1GhDRa0eJXvuRrRr718wGdPsr3SbRX+595dKms9xmOdRxCrits
	5QyfXZbNtXZSCJvahse33ldXGeAHwXkjf+bmcxjCWtfMQlW7AW7i48RMMJpeEbk98OjJTUuJORI
	EUEbI6Cc/lL3Vxx+dn5fuDZZx2TrFpxLG9seDq3aD1Q1v67fmc7xKkmhU67P8=
X-Received: by 2002:a17:903:120d:b0:2e9:5c51:19dc with SMTP id d9443c01a7336-2ee0dd14181mr18456195ad.41.1794559038435;
        Fri, 13 Nov 2026 00:37:18 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm6731535ad.54.2026.11.13.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:17 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:14 -0800
Message-ID: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/3] Make the scheduler stack end check selectable at boot
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

v2:

- Check scs_is_enabled() inside task_scs_end_corrupted() rather than in
  schedule_debug() (Peter)
- Return 1 when sched_stack_end_check= can't be parsed (Randy)
- Say in the changelog why the other task_stack_end_corrupted() callers
  are left alone (Peter)
- Rebase onto tip/sched/core

v1: https://lore.kernel.org/r/cover.1793082868.git.chris@chrisdown.name

Chris Down (3):
  scs: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 include/linux/scs.h                           | 19 ++++++-----
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 5 files changed, 68 insertions(+), 14 deletions(-)


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.56.1

