Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082967;
	b=GjkxDkd3IDqsg2vNg3tI0E51RiIimTjfBAze0DuZB6AQJTcNYJf1B2/IuwxS8z6HRash
	 xt1AVjoppr6u84AiZTYpe1YGHHzUwhnPVpIriNGFt1cxfD4zbr+yrLqz1uYnMeeIObt6f
	 JZA8Hqnbz4MQ9yiri+chtyjNkKzkl+POchJZhyt+cvJ7Pttm/MODHUB+AtphlqTypyfZZ
	 h5lmMiSaGifE5tBl3B56bhBOf5jeBOkxVtgEBtkz6E/4vgg5SP103oxbbayIUIbIPTEzH
	 AnEYa5Gs7W9xs5krGz1VuXdk1FIjqm5mul38UK4II69QN9dNa+k9wstBjYET273WAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
	b=x0mJnmr7D/6ktKFBqEkEsqxYAcw57EQMR1hMorbZAhN2EF5hF0/BVrivChX3ekkm9abT
	 2Isukul6EgOUb6Q934txN8VFPrKe9G7vcgmtMpFVzoWdjdKsL/AudN9/8qGIM4ytJx2KF
	 Ph0G4JYZPkCOe2GPrnr3bqKGhCHGWokujwR+HtjGjlvh04JZQPR+mhZtThuX9bdjGba1I
	 QRYO29c92aAM+p+TFFwFTw5RGVh9FAWhghfjDjAA1tuK3GiDzzBhHoBku1pceUasfQb25
	 J2Ofv/FWuZQ6kBfQqK+CrYDILXOafblgKEohza8FUNouKR2F7LZYbH0ClEPdMV6iT3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AJpFwj+U;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B44AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AJpFwj+U
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1284921b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082966; x=1793687766; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=AJpFwj+UtsFPy+Kokat7pc9+njX0j70xHPnHt6IOlgPxwhcl/sIWyf05lcL1vxwEkj
         W5AFrM9CsNK7QCyTLFZgK+3GcW/2PFrK2XeJ0mlrHalWoBtHfJY8stH7Cx6nZlIGKVns
         6sknpFBwcs5Rxl1M5nppyMQ6+Rmyt39GI39hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082966; x=1793687766;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=AFNGg3H7DExLwVT7+DVNCqBqfy2fESdFaAbMALb3QCi/UM6FMKovSdd6FzzUxPuSvt
         mfkqfitNrTLBNNDvkiCyYML+JkkoPC/6uI0+KnXcscnOPxS9r/E58bS59QdyH3zBmEOj
         rBfnj7ztZFhE+xcFcATAaetxok+WsDGFG/E6h3qu8ZKhVpu+VMSAO1V66u1Wa8SG4iLl
         MM9Zepevay78ZDzqSDappZOUlLChvqq7RGnLyHYhg8c2VQFI+Np+ac46aQoEfaKwaCxf
         04rl1Y3tRD7bB5ZPG/hLw9wmjYCIo4kPX7RzAeoGa7qTCOh5wjTxejXoPDKxnRCdP5zd
         jHHg==
X-Forwarded-Encrypted: i=1; AKwUvBw+vXee0rmt18sPKMM+JHNyTiNZ/HVkvePD1oWFTuBkhKbTvYQvCJNnHqPUhAsuJl3u5iJTP1+Fu2Ooi6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr1QtMmtTSI4DRWQxGXZipCYQru0L9XIyEWco1wHN4FQ+FG4ad
	H8fnk/eR962laHoAMdwYS0sgZrSHCfx4zH3bvpDZgcxQnTccHWsWG3ZLK1lfLdukpqs=
X-Gm-Gg: AYBFou1iduvC9yTSbjODfFVuUY7qlRzgEgCAo29uUnXyR/zEvBNyurudNYmb9UOfxyT
	OgXfDCxAIX1cLKNsruqxN8Zn9QBaOdKicqr/D49T07bznwwikEqG3sVtc7kALB0d3UX++5TvXtC
	Fm06j6cjnrzMWZq3pT10IiDREffVBg7TlYvQfzLn5gfOozNFatOi6RmcLypSfkLZsed32FrFznX
	C7cSIqwrzEZIXBUGS36jdnT1z4AFZ0Masxq/chqebcGuI5ILYmABfa+wqcX3pipONGFnp/NOy2x
	TB8YQOh6CCaxSv+55tlZY6Kk4qWZeF5FFVhJYtY1Wbc/v8X3d+obOAO1iLU8kd6PvPuuqayFHIZ
	gwxFbVcws5B46y08XjWr7RmBvvG6ADXd/Mvun419iYDWDwjD6CrzPXtpWaQP+oEB3Z9T8ZguZFk
	ApIY6Gi/yC9w4JY30IJ1/Hg62Ovm3YBOvSB2ICJrnqRXfRhizCV+VlofNqlSHhTtDwGrMcaD4bT
	JY8T+SvZJIShA2yf5VkDtnfsmjCU/miFONbfoPU4nqOyE5GIPMDKmNyMtikauMAQMS+hy9zxh1R
	a8veb3919Dk8Bx59NDXUtZuc8UaXJvEOSsjwQKrko6MsumZto+Mm3h991FS3JdiRHDXdoCf80sD
	FKXmfoYukLI91U2+Cevnk9to=
X-Received: by 2002:a05:6a00:21d5:b0:899:e80c:1ec1 with SMTP id d2e1a72fcca58-8a367a39106mr7234616b3a.18.1793082966170;
        Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm2004475b3a.7.2026.10.26.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:01 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/3] Make the scheduler stack end check selectable at boot
Message-ID: <cover.1793082868.git.chris@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

Chris Down (3):
  sched/core: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 4 files changed, 57 insertions(+), 6 deletions(-)


base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
-- 
2.54.0

