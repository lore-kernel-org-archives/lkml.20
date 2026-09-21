Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB5AA59
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970428; cv=none; b=uQaQz49eWi8uf4K2yNc6e32wAT+aBdnorthUXZvSJPfjCyX12Pv6Scb0VGRo13Cgkqx9rk1RnltzeDleBqtvEmg/dyIIJcMWguB3C5A/JooJnl1w1Mv5szrCKjxuyD+6/p0+nEE+cDz7C428/cH4CMZA5jbR5l1bW4Cm7zRAWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970428; c=relaxed/simple;
	bh=r4IZ5+oRt2NTHUYf5LXmNkSjOac+QeyqRjRNuHQhAo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EvbIDvz82kHz187W6EEUFlXL80YnP3XnMnaGmOUeSwLsFKlhL45apxuzUz2gQ1EWx6ppMxt+WjTg3X+Qba06spY7Dl7ZIdzFBXtV9PhzydaUtJ4UdQ4avmWoAyor2nnM/l6KDIL4fIfr8eoJ3FORtfSCW2939tUarILvY9rcaIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss5zp110; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss5zp110"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so10594165e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970424; x=1790575224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zqp0mXAPPlkB9y/VY2ECjAIS1J7bwOQJ/4A4XQOWjYI=;
        b=Ss5zp110uCwExkhcKMEEERZP7EmV5aqEWUhzO0nmQsFBUZtMcKhVu49ToXM7YOJnpY
         UaFd8P+TRycRmCqILMWT4yY4vxg7CowNCkIerM26ohRTWmr8ptOX0JNk2C5+ObP183vo
         zbAyTeeZnWs2LfIDNsgDjv2r/2Tz/eUz4X+59poqjbP+kNC3ASrmaJt3QT2Fl9Uu4Z8d
         5twTO8KQrvz3+DBfUwhayN+FiUmRt7U+HSeStjphKKB9Kl3apXe4z7Rj3K5LloDBLpt1
         KUO3GVB2Q0ai/aIa+RaepuNtZV6AIgQnknDAyQ/PJcnRwkIrkmusf0/Ubzt9K+9sZ55z
         QvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970424; x=1790575224;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zqp0mXAPPlkB9y/VY2ECjAIS1J7bwOQJ/4A4XQOWjYI=;
        b=1AAQbeq7SBtECJlIqZPc9XEdx1/SS0TVHLEh5AA5XiR1lYkQ9ZOUtovy8vbv108nVa
         wRkOknhPH7QN9LHX8K/GMh+EcxUk8nwN7y9R2Nwm1+4sEj1fiMjDHbpEjVEm8ZZFx266
         rJVDAAmrFHIYBcyTQVDiiCF/rFr8dvYWGkUVnTlbRdw6PNkrAlZAcNHsJeP1/cGsNrNO
         Un+HaHOGsS7tIOpGhH5a4Ojy7i9wioh+ix3sXOqKNkbaRDPHRUBAiLqLvVK8MWNVcuPO
         QVx407phKxBkGmiLIh2eJhXGEc9a6+fY6YqH57h8zdLNyIVo57B8E7Z06woyc7YiqyZP
         kRnA==
X-Forwarded-Encrypted: i=1; AKwUvBwMLbZ72OyNIUPGpjU9UUffIUYzrt9T24qvtXoc9m/An34f8D5Xd5s4/39W8QZRU3wMyaGRfZGINxIVtTc=@vger.kernel.org
X-Gm-Message-State: AFuF++kVlxUCDmuASEjCDFxXNsciJ1T2BrySsiTR1f1vWxbtPm9f8bWG
	smVPodIJqZPfEs2mSgIBKoVlC1Om2kHg7IUi01ET1u6QarsmxiKQLwlM
X-Gm-Gg: AYBFou33gwTxXrEjtXZmTlCLRK+bRudKuR0XSVm7AqLaNYWRp0XtNRbe+DJL4afG3wC
	Hr1b5FeO28VkuByjhxMGYXnAMQ1A2VdJ5pE0/PHaFJTp9m0L5gq6Blcs3STwpss1q4IkAiMvlFq
	z+Y3apw0l7JlxwZA4LAb0nHT42RUJWKgg4ca3V8ZmoE1JG6k0ISV6KUwvl37nBbnZd6gKhl0+6C
	2wiyAX11DFD2YOqsL5+3bpNGtFzeKMVqKAEcY3xhxA3yAAkImI779yajnsAYBtZG7B4iyYBmR4D
	WTKDWddZkiJ5K+iU1556K0SQM3HFwEdMaKlyPioj0xELFdhRIoGIRQtediRTpUr6zwpixbVQwmF
	HNfko3k05+oiZECDslo+IJNSoyp8pHi6idxnu+hJ/7gl0/RzMZ3oPPgPemyVCk40hheE1pep7Sw
	yVz3gqId77t/8Rq2PrfSQg5YvLtFq5T/FlW21OtFEyAczLG8c86MWqIyxWRBBZI34oNk1BF64a0
	aEOji48AxwXgC5nwxSElOLFuPBX1Pr1s3A4fR6Bd3mHFJkL4maIBMH1Vibpq2k2nEzYzGnqK/4D
	CdD/qpTlYXc5QVrkxCSa0FJl+/C1DuAz7kzACGDtUDTL3sgYL8A5+tFoK5aKSoFZnTrY1tWIDA=
	=
X-Received: by 2002:a05:600c:468a:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fc4fae7acmr152289065e9.7.1789970423297;
        Sun, 20 Sep 2026 23:00:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: allocate the cacheinfo early to fix the PREEMPT_RT boot warning
Date: Mon, 21 Sep 2026 08:00:09 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves ARM cacheinfo allocation to the boot CPU to avoid
sleeping-lock warnings during PREEMPT_RT secondary-CPU startup. It is
rebased onto v7.3-rc1, cee9395acd8043be0644b25c34bfa86623f2b935.

Patches 1-3 prepare for early allocation: bound cache-leaf writes,
include external caches in the allocation size, and guard CLIDR reads
on older CPUs. Patch 4 enables early allocation. Please take all four
patches together for stable.

Changes in v2:
- Rebase from post-v7.3-rc2 mainline (5225b8eec4c9) onto v7.3-rc1
  as Linus requested [1].
- Add Sebastian's Tested-by and links to the original patch posts.
- Retest the full series on this base; results below.
The four code diffs are unchanged.

Fresh testing on this v7.3-rc1 base used GCC 15.2.0 and QEMU 10.2.1.
Three full kernel builds and W=1 checks of cacheinfo.o/topology.o passed:
multi_v7_defconfig with and without PREEMPT_RT, and an ARMv6+ARMv7 SMP
PREEMPT_RT configuration for ARM11 MPCore. Seven boot checks passed:
- virt, Cortex-A15, 2 and 4 CPUs, with and without PREEMPT_RT;
- vexpress-a9, Cortex-A9 with external PL310 L2, 4 CPUs, RT and non-RT;
- realview-eb-mpcore, ARM11 MPCore, 4 CPUs, PREEMPT_RT.

With DEBUG_ATOMIC_SLEEP enabled, the RT boot warning was absent.
CPU1 offline/online succeeded in every run, with identical cache sysfs
output before and after. ARM11 exposed no cache leaves, as expected.
RT and non-RT cache output also matched on each ARMv7 machine.
All four stable patch IDs match v1.

Earlier testing of these same diffs also covered DT cache-description
corner cases. On September 12, the full series passed on a Raspberry
Pi 400 with a 32-bit PREEMPT_RT 7.2.6-rc1 kernel: the boot warning was
absent and all 12 cache sysfs entries matched the baseline. CPU hotplug
was unavailable there. That hardware test and the DT corner-case tests
were not repeated on this rebased tree.

v1: https://lore.kernel.org/r/20260912195552.76673-1-kmehltretter@gmail.com/
[1] https://lore.kernel.org/r/CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com/

Karl Mehltretter (4):
  ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
  ARM: cacheinfo: count external caches in early_cache_level()
  ARM: cacheinfo: guard the CLIDR read in populate_cache_leaves()
  ARM: topology: allocate the cacheinfo early on the boot CPU

 arch/arm/kernel/cacheinfo.c | 49 +++++++++++++++++++++++----------------------
 arch/arm/kernel/topology.c  | 13 ++++++++++++
 2 files changed, 38 insertions(+), 24 deletions(-)

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
