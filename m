Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158321;
	b=TPwUuNYdYisqd2NGeov8I3UmmIaIp2gxY4gj22GiLiG/0/2QCCooBGhuttabWry36sGi
	 hfbcC5LoXySq+IJ0AZ9W6MkDRjpBz70GziRGgUqwBWKG5QpEEVq4TOiC5PnljRsczOq9k
	 NLt0Miimw3WPGDCT7qOZN8mHGdgFQGD7HQJEVWLuAjSAPTUkChPOrVSQmCP2SvxvbdVm8
	 dwfV/2x0TAR0GLdfcHvfyNzgAG0+txA/GPQveFGGTs410oFWSpq35jN6RUz/7BWaVB8a1
	 j3QPHKQ83YdU+QGuXK8UcppWq+NRTFIc1lyo5Zrze9KHibIpeFOZZ19/ML1XCNVTUCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
	b=TayQVqi7YkVIB0/AOmiHPqmshTMe57+aI31nLEX6YHSvcXbKuFBUfdlUPT2Gf3AU0u/D
	 X1iVMVtlpcoc71LGHAjCGChh7EdEMnq8LH1iXanVSijsyGmo5I7oKo2vyW7BbooChxMc7
	 dKbfRpHaQI2q8QG38yVjOtyAqfvkHFIlWGQpxPsOdIJdH058rY8qDucVzqbOvQK/hS0p1
	 SfhaVH4WC16rk5vudUQ5vvWkco6FICD4tnrpR/S02aOxz/fHv3d2PARMVW7qfFpGeEkNR
	 anUsnuU0SuVgix5vZhMK7Z49D0dwIoULstobfNU48N9Hlk+Maj4rKZ5Al8m/B3RL2Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byqKZ7W5;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A4606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D37A4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byqKZ7W5
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so381987f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158319; x=1793763119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=byqKZ7W5UhcRnSu2xxUZbE+yuSVLG5xXpLtK7cb7czM3NOEXtb6wKc6iXFz2DKpwA9
         wMMJxxbtH2nyjid4h+HCiHZrWvG6538k/yc0/3xF2bGRJU15yX+EkqfA/n7BgmD1DBrP
         dG70rDNxKUrsvvDyFunqI4goaCGmjZi+m6z3O1PPT4yqwNsRZq8epZYulFKe6vkGnX+B
         cQVOJZQbjs1l+qhuLvjydugvN0jOJT0WzPUeM76lU27qI496W7dQCLgrZAN0HctCTGOU
         lsLtoQb7vHfYkb61UEwwYTNpU7Cnf+YP7WdGSPAdz5DB9aQ5KdYnYi1tjAfnoB9zzXV/
         i1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158319; x=1793763119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=rBpqGPRbELxo7oP73DamOmH7dlKPCS0XZgXcds4iDfFpbDCY1haFERV8EF4gg/I1FE
         Zzpy2EP+nirPa62qtDqq8g8/ZR/xGEVjAPHTCGiR6Cu3207ZFnQPiwO0yUfQ2+CGRUGy
         leVO8D4UdWQ2p09swBwglMDlsLPeocybClQ8/Zd0T9CgfLVOwu4l4fUNvMLPYwPRqZkA
         ra93Jehb5ME1Q3D40KkX2RFXBbN/hQQyz67m+7P/dtaGTReIM4RZSkpEpGEH8YrRwFc+
         I6hzEW9GnIPK91WoEPLfttIBFaGV86M7sOgW1nrQj7XUf7Z12YgQxvRLOlP46Dn29940
         mMfw==
X-Forwarded-Encrypted: i=1; AKwUvBwIWi9UYZJ0Y165ls2AoacDnE8XKWTklY7OdVh+8DVAOknDTxivWqa3GbQ9jToAvUK5feOz0bt76cuyBoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtmcdKbw3opSYr3PIPrg2ye1rpVH63Dt08lREi3sYIBkduHdrk
	CT5FWmgU1hjX2zvo7Ykhg9E0bvtWcOCFQYVBtohJblkQw7xddIFS1ZSC
X-Gm-Gg: AYBFou2f9fpMLiFONUDgpa9EXQFfh3InFwAE1fpNg2h2aPTdV4mavPbm4PQ513kDSAb
	iJBdy/DU9hQVNpd0XtamOUSfhcbQPCLy97xGwsqocP6vLUVgwEYAvaUAG9c/COdvBYaQKTaD5HL
	0FLCOGHbXPGsfTtF4rKNRXnGZYSfp3oHF5S7merfsi33T8doBxXexwca8LNSeck1U0zG6rbxM+a
	FfP1O8m50m/oMTFglhssclE0wqEOxQ0/DJo6YdBTlOOSqC7G/pAxDcAXHE2oOCvidFTGK+YbI40
	zyaLTJLGBOySBTZuh9P7ONK6vQ/56n5+h4mB1IP/Rr9nz3KDKa+DDZGJ8Nk1bvnig01K7sj+CUn
	s+CHQXsv457r70lH1Hr8VyMC9p0vHauSqvdC2qk2dHUF/DQg2fGT0497jZdUN3UcqyeuZJmO//e
	6ag6ns50LWi2Css/VWHnlI0zzl3hldVlQwvVKx5T3dCIPBmh1lryLDBc0jXZanbaU8m9iWgphzo
	BBVh1zAA4aLYwvlpqigWsyJKnHy4mHU1gNKQM/SJ6Zf5PUP2oBXsjYZKat9W9fNmZQpk2dbke7j
	JKegmGI38UPc6Ofoswrz+4Olt0wnNnnYYcda5N5ek/FLXe6Hn/tIEnJhMoJD1cwOvHsykWVtHGI
	fFk4hFXCw3O01cpO/rr6Upv5yMIeOJHaVSYtLzO7y6qG3aTDiBBtuiPT+Wr2etq9b30xpvAA2QI
	7UiNrEHQnCe/p0fZ9PxrB39yomPTtLVhP9
X-Received: by 2002:a5d:6f04:0:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e5d2e7526mr2965587f8f.9.1793158319122;
        Tue, 27 Oct 2026 20:31:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:58 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 06/13] entry: Skip inactive IRQ-return reschedule calls
Date: Wed, 28 Oct 2026 04:31:20 +0100
Message-Id: <20261028033127.82193-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

irqentry_exit_to_kernel_mode_preempt() calls the reschedule helper when
preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Arm64 invokes this caller from noinstr code. Force its preempt_count()
implementation inline so Clang cannot outline the new check into
instrumentable text.

Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h | 2 +-
 include/linux/irq-entry-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd1936d..3e9bcc6e76625 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 289e308d2d46c..e1fd9155410c1 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -503,7 +503,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)

