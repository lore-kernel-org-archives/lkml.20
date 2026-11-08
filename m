Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141807;
	b=NLrjwE5Jj/WP2Muq2elicsnU1wxqd1sN1+UITsQQcEVGM/B5c6I0SEL+xt/N+HKtlOgW
	 im6IKix01pxeIuI7NL42cZQRdwsHs4sJwwEKkdC32kaUqbX06lh/WcP2cC1TZUjoPj2dd
	 EsJyZqz4oelkFKXufvHdrlHHfRqZaZnfcL+g8XdkVoCZHgtshRKN7h2vOfPuTIF+8FSFG
	 0+06AyynWb2cmaMLX+/Y9zQ8aYCP1jOIQgd1Rup9Yv3Kstz2zGA1bxurq95UHM7UkBjdh
	 Rxb8fdNnDML7zsBXCDBbuvfsp2D3tBolW1sGR7v79elJj4VjG/OTi8aX6APoG8EL1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141807;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=tVyA7ikxZLxiUj/wTdNFpC/LpWq3YQ0Mnn3SVMwlPcU=;
	b=j4S+ODkROsBkxuQhCEBknRi4sc6xhWnzZR5E+ETkgA+6jUJ/jYMrargew733H5py64ks
	 k1DloMyxDLJQlMyNXWPvx6O028L2wdwE0xkbggYm+EjO9kQhysx+Hjno0fon7uT0wyMpu
	 OmOHbW2bjBOl9ULKvCDHCpPaiZTt0Pnh2gVQBrrQdUGSNfnzExxOBlx/BwryEZdj2zANH
	 KpoOOJhi7roMA8OdgWEyU97ZmMUvNE9TYF4nggXuWo0ptWlkdboQgKAPG4wNUSctGrPF+
	 2PFfdYLQ+fRaxO59cPTVAKmChOOTBab+hXTKvO13Gfa7Uua6OAjH5gMX/dKq1Al3yWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JogsPMMW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=snIUEawq;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E4606D824;
	Sun,  8 Nov 2026 12:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749E4606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JogsPMMW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=snIUEawq
Date: Sun, 08 Nov 2026 12:43:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794141804;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVyA7ikxZLxiUj/wTdNFpC/LpWq3YQ0Mnn3SVMwlPcU=;
	b=JogsPMMWye/T3dwDDD9P2DQj/iIUPpGzVHM9cbHGW7b6drg2p+M03eFswK0heTO/yoHZdb
	8jSIT6sHBucjst9ZJCARvEb7WwYyNyk8gZJWScG4XQWwHpB49Y0vLs7Ku7mBD2jK32MDz2
	jPMoQm3hbhvKjQKXP5JdIwxyLNslLHR/6fQBPSmq2PIf0sZZUnIByMI2yDEj0YcRBzbm50
	Fon1+s+tdkDcHKHvkJ4OVJQ5gaykQU+EjWXFD7jRpmcWTYhjehGa2dWm2sjIHDwbv+rWfG
	w2N0Dp2EW6KgsJ7G78A3EfslaP+JE9r/lAZn9zZle/7Cq4Uqg8tASq2Vgz60ZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794141804;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVyA7ikxZLxiUj/wTdNFpC/LpWq3YQ0Mnn3SVMwlPcU=;
	b=snIUEawqTQ7bpHMkcdLdJRCUWms1sVK/0YH7UDcQQnvhVQQ0p5oN4UwrZoy/KbHhCGexAC
	vGgeoRHiD58q3EBQ==
From: "tip-bot2 for Sasha Levin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: core/rseq] selftests/rseq: Depend on librseq.so only
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011223358.2327625-7-sashal@kernel.org>
References: <20261011223358.2327625-7-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179414180308.2093942.1453784744549048075.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the core/rseq branch of tip:

Commit-ID:     59f893de13d0d8be2484c072fdf6c3d492de5c48
Gitweb:        https://git.kernel.org/tip/59f893de13d0d8be2484c072fdf6c3d492d=
e5c48
Author:        Sasha Levin <sashal@kernel.org>
AuthorDate:    Sun, 11 Oct 2026 18:33:35 -04:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 13:41:53 +01:00

selftests/rseq: Depend on librseq.so only

Each test program lists $(TEST_GEN_PROGS_EXTENDED) as a prerequisite to
pick up librseq.so. Since that list also holds the test programs built by
the same rules, every build prints a page of

  make: Circular <prog> <- <prog> dependency dropped.

Depend on $(OUTPUT)/librseq.so, which is what the rules need.

Fixes: cb48828f06afa ("selftests/rseq: Don't run tests with runner scripts ou=
tside of the scripts")
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261011223358.2327625-7-sashal@kernel.org
---
 tools/testing/selftests/rseq/Makefile | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/=
rseq/Makefile
index aba6317..977da55 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -40,38 +40,38 @@ include ../lib.mk
 $(OUTPUT)/librseq.so: rseq.c rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -shared -fPIC $< $(LDLIBS) -o $@
=20
-$(OUTPUT)/%: %.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/%: %.c $(OUTPUT)/librseq.so rseq.h rseq-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
=20
-$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(TEST_GEN_P=
ROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(OUTPUT)/li=
brseq.so rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
=20
-$(OUTPUT)/param_test_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_benchmark: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
=20
-$(OUTPUT)/param_test_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_compare_twice: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
=20
-$(OUTPUT)/param_test_mm_cid: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_mm_cid: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
=20
-$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDE=
D) \
+$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DBENCHMARK $< $(LDLIBS) -lrs=
eq -o $@
=20
-$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(TEST_GEN_PROGS_EXT=
ENDED) \
+$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(OUTPUT)/librseq.so=
 \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DRSEQ_COMPARE_TWICE $< $(LDL=
IBS) -lrseq -o $@
=20
-$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(TEST_GEN_PROGS_EXTEND=
ED) \
+$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
=20
-$(OUTPUT)/slice_test: slice_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/slice_test: slice_test.c $(OUTPUT)/librseq.so rseq.h rseq-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
=20
-$(OUTPUT)/check_optimized: check_optimized.c $(TEST_GEN_PROGS_EXTENDED) rseq=
.h rseq-*.h
+$(OUTPUT)/check_optimized: check_optimized.c $(OUTPUT)/librseq.so rseq.h rse=
q-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
