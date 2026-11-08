Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141805;
	b=wzdneNjiMr0DeEyWbbe7kyuahQHAwdYJ3HLfygtu0yqhRHsGtH0eXYLwv4gvr5KAPVK1
	 CizxKaaVFspHzoX2bO0R69WQN6i+E2vZNwjrJPmIdRL/VSjJDYtgO/XySImd8bEKEj5Ot
	 h5OSOsR2+ZxqOgC89lQL6c1N8HB7vzwXfP9K+4LyKUtSOwU8LPb0d2YYxDdBFZlr9A7jE
	 qNXFLw8JSjuM29kbWK5B7wrnFIfxfQmBK8YghjWHXhH7q7ZMIZ7X0iKIxs4taG+/gKcXQ
	 jmY2ef8esE/XFp2asYGoPFc0VOW6cp+EFIOhwFqqwCUzYhY6DbL1Z89BrgX/CwhZPcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141805;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Ym7EP5Cjk8x6mQl6YSgRpYbehxPfCPdy6bTh8yYVcI4=;
	b=KgIlaFDdhybmFL6y072B4JhHuA3BCnfm/rLrD136IrT2qglMi6+RyB9z3zQiOhlXf6oY
	 1SJLAocWe+x2VbHpOmEBxtoUo1VETkQ1qTxbV2VkazF4J9DIJz2iXaoGbZmX/lzyFYC3c
	 IFuMdogYs+1oVC4QnzJnQSsVvH76sffQflvwTDcD4UI+BTvq1HX2neiTPvkTpV3GvnDKJ
	 Gk8C1WOhZuXMUxYiOa4E4t75p3EUYagKZhtGCMugoS+kb+j34OehbPuKbOx/Nhd1t+FW2
	 pj3rOjH+tbcpA0858eqO8kUDy2m7iroR4LCMkleAt8/7wTibx2KXlXLPzBb7/5ax97A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OcDt0mXq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="/Y5Qr5HA";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499A2606A336;
	Sun,  8 Nov 2026 12:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499A2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OcDt0mXq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/Y5Qr5HA
Date: Sun, 08 Nov 2026 12:43:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794141802;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym7EP5Cjk8x6mQl6YSgRpYbehxPfCPdy6bTh8yYVcI4=;
	b=OcDt0mXq9QTkZy8OzgJCVap/ESJodQNl2QidcYTFezHSlYj3pr/2G8W287dfdr0E8htlho
	c183jHYaEWHCFb7sdxQLSVs1t/tJ3IhPQDCu6cpxvklTrpCunlKjREWwk6fbG71B5BHNJA
	drEgMj4lO7WHyMCYnaX5FhdtBMp/yBC6XjZCaX3tlJPNOmUMk3F2xp56VrvjWyiHl/02wV
	y6FJbl69CE1Ef/zWgx+F0b9sHN3YofxwbNLtZX8RYxduXb1chL/gTw4ok6iq4jm9wpG2ch
	JXUIhNmSRcdC0MtXE0zvC5C8KFU2YPZxAXNdxuRW0RH/xZdlwO444CX8g2uCeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794141802;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym7EP5Cjk8x6mQl6YSgRpYbehxPfCPdy6bTh8yYVcI4=;
	b=/Y5Qr5HAKiG/dasXvrIjcZHXEOj/Uwc4OVq49QaBbuVUXfz+TypwDa9FK+KcuEPY+aGAMP
	KjgdYcKkephHB7AA==
From: "tip-bot2 for Sasha Levin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: core/rseq] selftests/rseq: Select only implemented architecture
 variants
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014200157.1365258-1-sashal@kernel.org>
References: <20261014200157.1365258-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179414179935.2093942.14842774422125478289.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the core/rseq branch of tip:

Commit-ID:     9ad0f2d93caf9b1b70c3f239e72b241313caa21f
Gitweb:        https://git.kernel.org/tip/9ad0f2d93caf9b1b70c3f239e72b241313c=
aa21f
Author:        Sasha Levin <sashal@kernel.org>
AuthorDate:    Wed, 14 Oct 2026 16:01:57 -04:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 13:41:53 +01:00

selftests/rseq: Select only implemented architecture variants

The rseq headers implement a limited set of targets, and only the
little-endian ARM, arm64 and RISC-V variants. Building the suite for
LoongArch or for the unsupported endian variants fails in the
architecture dispatch of rseq.h.

Ask the target compiler which architecture it builds for before
selecting the tests and scripts, so that unsupported targets build,
install and emit an empty runlist through the ordinary lib.mk rules.
Pass USERCFLAGS to the probe as well, since lib.mk expands the
generated program lists before it appends USERCFLAGS to CFLAGS, and
filter out only the linker options that the preprocessor would warn
about. If the compiler cannot be run, select the tests so that the
build fails instead of turning the problem into an empty suite.

This does not add LoongArch support and does not address the remaining
compiler-specific build failures on supported targets.

Fixes: ccba8b64452b ("rseq/selftests: Provide Makefile, scripts, gitignore")
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261014200157.1365258-1-sashal@kernel.org
---
 tools/testing/selftests/rseq/Makefile | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/=
rseq/Makefile
index 977da55..ce8721e 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -18,10 +18,22 @@ LDLIBS +=3D -lpthread -ldl
 # still track changes to header files and depend on shared object.
 OVERRIDE_TARGETS =3D 1
=20
-TEST_GEN_PROGS =3D basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_=
test \
+comma :=3D ,
+RSEQ_ARCH_SUPPORTED =3D $(shell printf '\043if defined(__x86_64__) || define=
d(__i386__) || \
+	defined(__ARMEL__) || defined(__AARCH64EL__) || \
+	defined(__PPC__) || defined(__mips__) || defined(__s390__) || \
+	defined(__or1k__) || (defined(__riscv) && __BYTE_ORDER__ =3D=3D __ORDER_LIT=
TLE_ENDIAN__)\n1\n\043endif\n' | \
+	$(filter-out -fuse-ld=3D%,$(CC)) $(filter-out -L% -Wl$(comma)%,$(CFLAGS) $(=
USERCFLAGS)) \
+	-E -P -x c - || echo 1)
+
+TEST_GEN_PROGS =3D $(if $(filter 1,$(RSEQ_ARCH_SUPPORTED)),$(RSEQ_TEST_GEN_P=
ROGS))
+TEST_GEN_PROGS_EXTENDED =3D $(if $(filter 1,$(RSEQ_ARCH_SUPPORTED)),$(RSEQ_T=
EST_GEN_PROGS_EXTENDED))
+TEST_PROGS =3D $(if $(filter 1,$(RSEQ_ARCH_SUPPORTED)),$(RSEQ_TEST_PROGS))
+
+RSEQ_TEST_GEN_PROGS =3D basic_test basic_percpu_ops_test basic_percpu_ops_mm=
_cid_test \
 		 param_test_benchmark param_test_mm_cid_benchmark
=20
-TEST_GEN_PROGS_EXTENDED =3D librseq.so \
+RSEQ_TEST_GEN_PROGS_EXTENDED =3D librseq.so \
 	param_test \
 	param_test_compare_twice \
 	param_test_mm_cid \
@@ -31,7 +43,7 @@ TEST_GEN_PROGS_EXTENDED =3D librseq.so \
 	slice_test \
 	check_optimized
=20
-TEST_PROGS =3D run_param_test.sh run_syscall_errors_test.sh run_legacy_check=
.sh run_timeslice_test.sh
+RSEQ_TEST_PROGS =3D run_param_test.sh run_syscall_errors_test.sh run_legacy_=
check.sh run_timeslice_test.sh
=20
 TEST_FILES :=3D settings
=20
