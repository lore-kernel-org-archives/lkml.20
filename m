Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065831;
	b=OcnpkoVV/vRq4EI5i4Rykef+eFLF4APyxOYiw2im0gyOjC/Uz9f1CdTWXMudzg77m01O
	 Yr5q5CR36GuFZHWQxa5fMRlwaKLFebEtj47ufjHb/uuJ5aKd8Im596HEE5OGYq5xl2M6B
	 j96B3z7g+kKljCsNAdyc2ybCINEJVFYU+sdFDpM5vBQcFtOgAvwPwJ22V50mFGFJgmp89
	 t2UHvqCgG7RieFnv9oEncJ51li0VHUGWHwTFMlZ5BoYGGUUH2Lo4Dh+5hE3lvkdDHO72h
	 TCbQJwS4zajtmSP9xDE0AzA+tYCUru1SEf/PTCoG2oT3G32ytYmiZpHqBrOQtnp4eJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
	b=ASt2+F3kMtPOzUm1qzOMN9JwONOOOEACRJYFH2ZswnpmA1JHtoaJwN0egzfPrqq9RogD
	 kbpxczZOZlURppwTmM/Rndw1ujmSGDo11T0d4KTsVVLZW6SdoLGAZuuVdr3io+k1VEBhg
	 ScfyWSjbOBw2OS1mmjz7bXvrxRy9D7hslsZkb5IP5OsnJHWVCIUDt/dQIrKPey2IEQEm3
	 8ZnCmk6Nqf7tvdne43bZN9A+unQ4A3foQw4qo+Rh3MI9xJO6GEe5dtjYUAYdBLjeU61j1
	 bFWYXfRu43/Pf4t+IYD4i03UYcS3vpRFd8cKBCcS7d6VCTYh33BnfOvMPRwcFWdhqXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dumCt+Fx;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CEA606D804
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CEA606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dumCt+Fx
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3f04e0e481so31356666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065829; x=1794670629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
        b=dumCt+Fxwej4aM6MPpjS4V80JFGKHnQ3nP848Wy7kKs1TUyno4p0aOVDgMufQFllCm
         OLemr9dYBJ3Va7JGCGUEUU0DXVHGNutdDrUVvEPT1SxxOWzN9Cpx53DIbo+iQrE1nZ+Z
         CVZRwLbUGzmBdP2Fsl6XFM2EyPGYB6M9OPFA6W0+OKCBABIfcqbK55c+okx9cpj34zja
         CN14aWAvFnKTe1+QEkevnN96snDQ4D5zCvIlgy8lMkasEw/ZZXgRbntAu6rse2FU7heh
         VAA3sg6hjUBtf5isVtXRtAFgugZDg6QvrFVWFbMKCwfah1FB4BJA4l2YTecq1SV2W1P8
         WYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065829; x=1794670629;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
        b=yrgS7OZhC7ltFoh1P2+8mV/pXR8mIAj0QzjQxzQPGNyWTB0YJd8RLNWqLdBwjUXlDT
         4Qhtpp9BMQMNsLSXDXs7lgFJjkm1+FsYN/vYR2jmfPfEv5fN5FPxbuODRGKF+kWO/hiq
         j61YqtUD2q+1zx2RJOuRJYbodgtPjmI6/OleuC6FDx7DfXaphDdFjqyP1CAOj42CwBz0
         gfInKzIonkaR7SyedqcxRIXV4+geJLBKFnfUJygtgU1f+vQ4updobLFPnX4x9VMryAid
         ziK10fzQefTfGdr26HfG2ijgvNBW+JmfIeJjSuvN9KdT0+eue4wjD5so39C1lZpLgFzQ
         gSNw==
X-Forwarded-Encrypted: i=1; AL+hErH8+b9lO4sijGz422zCks4uYaXAYjJIxz6dAS5LNZHaLn2v5cTee3BLY4KIob2eIlWmMqoGf/cUa/ldAII=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nx3CDI2/hlib8fQaxUCAecFI8ZXR6GrhLyyCkTdMTdCqN2Vxl
	OhgJg3oRM/gA/UyMzbi8CIAcUUpUk6j6EYswiE+rP9F1jVX4e37CUVEzzPXHQLdk/amfRWqKWpQ
	isA==
X-Received: from ejpc8.prod.google.com ([2002:a17:906:54c8:b0:c3f:c35a:7704])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c0a:b0:c33:dbe8:291c
 with SMTP id a640c23a62f3a-c4d35448ab9mr515861766b.20.1794065829385; Sat, 07
 Nov 2026 07:37:09 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:08 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-2-d84ea5f30f94@google.com>
Subject: [PATCH 02/24] kselftest/arm64: Test lazy PSTATE.TCO handling
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Reproduce a bug introduced by commit 38ddf7dafaea ("arm64: mte: avoid
clearing PSTATE.TCO on entry unless necessary") where TCO wasn't cleared
when it should have, by detecting that the kernel misses MTE faults when
accessing (tagged) memory of a process running sync MTE.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 tools/testing/selftests/arm64/mte/.gitignore       |   1 +
 tools/testing/selftests/arm64/mte/check_lazy_tco.c | 152 +++++++++++++++++=
++++
 2 files changed, 153 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/.gitignore b/tools/testing/s=
elftests/arm64/mte/.gitignore
index f6937f890039..70ebc3883a26 100644
--- a/tools/testing/selftests/arm64/mte/.gitignore
+++ b/tools/testing/selftests/arm64/mte/.gitignore
@@ -4,6 +4,7 @@ check_tags_inclusion
 check_child_memory
 check_mmap_options
 check_prctl
+check_lazy_tco
 check_ksm_options
 check_user_mem
 check_hugetlb_options
diff --git a/tools/testing/selftests/arm64/mte/check_lazy_tco.c b/tools/tes=
ting/selftests/arm64/mte/check_lazy_tco.c
new file mode 100644
index 000000000000..28174495056a
--- /dev/null
+++ b/tools/testing/selftests/arm64/mte/check_lazy_tco.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2026 Google LLC
+/*
+ * Validate that the kernel does not leave PSTATE.TCO set on kernel entry =
and/or
+ * thread switching, when it should be clear i.e. when kernel accesses (su=
ch as
+ * uaccess) are expected to be tag checked.
+ */
+
+#include <sys/wait.h>
+
+#include "kselftest.h"
+#include "mte_common_util.h"
+#include "mte_def.h"
+
+#define BUG_EXIT_CODE	99
+#define MAX_TRIALS	32
+
+static void handle_signal(int sig);
+
+/*
+ * We validate that uaccesses are tag checked by tricking the kernel into
+ * triggering a tag check fault while accessing user (tagged) memory. If t=
he
+ * kernel does not report an error, we assume that PSTATE.TCO was set, sil=
encing
+ * the hardware exception.
+ *
+ * To achieve this with robust userspace-kernel synchronization, we alloca=
te a
+ * signal handler stack in PROT_MTE memory, tagged with 0x0 so that our si=
gnal
+ * handler can safely run without triggering tag check violations from SP
+ * (untagged) accesses. We only re-tag (with a non-zero value) the uppermo=
st
+ * granule of the stack, where the kernel must write user->next_frame.
+ *
+ * When the parent process sends SIGUSR1 to its child, the following happe=
ns:
+ * - TCO should be cleared before the uaccess
+ * - the kernel writes user->next_frame to the tagged stack granule
+ * - (if MTE is properly enabled, a synchronous tag fault is raised)
+ * - if the fault was detected and handled, SIGSEGV should be delivered
+ * - if it was not detected or raised, the initial SIGUSR1 is received
+ */
+static void setup_sigaltstack_tripwire(int sig)
+{
+	size_t sz =3D MT_ALIGN_UP((size_t)MINSIGSTKSZ + 2 * (size_t)getpagesize()=
);
+	void *altstack, *top_granule;
+	struct sigaction sa =3D {};
+	stack_t ss =3D {};
+
+	/* Enable non-zero IRG, needed for tagging the sigaltstack. */
+	if (mte_switch_mode(MTE_NONE_ERR, MTE_ALLOW_NON_ZERO_TAG, false) !=3D 0)
+		ksft_exit_fail_msg("Failed to enable MTE tag generation\n");
+
+	altstack =3D mte_allocate_memory(sz, USE_MMAP, 0, false);
+	if (check_allocated_memory(altstack, sz, USE_MMAP, false) !=3D KSFT_PASS)
+		ksft_exit_fail_msg("Failed to allocate MTE sigaltstack\n");
+
+	top_granule =3D (char *)altstack + sz - MT_GRANULE_SIZE;
+	if (!mte_insert_tags(top_granule, MT_GRANULE_SIZE))
+		ksft_exit_fail_msg("Failed to tag sigaltstack top granule\n");
+
+	ss.ss_sp =3D altstack;
+	ss.ss_size =3D sz;
+	if (sigaltstack(&ss, NULL) !=3D 0)
+		ksft_exit_fail_perror("sigaltstack()");
+
+	sa.sa_handler =3D handle_signal;
+	sa.sa_flags =3D SA_ONSTACK;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(sig, &sa, NULL) !=3D 0)
+		ksft_exit_fail_perror("sigaction()");
+}
+
+static __noreturn void stress_test_lazy_tco(void)
+{
+	const unsigned long sync_ctrl =3D
+		PR_TAGGED_ADDR_ENABLE | PR_MTE_TCF_SYNC |
+		(MTE_ALLOW_NON_ZERO_TAG << PR_MTE_TAG_SHIFT);
+
+	if (prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0) !=3D 0)
+		_exit(KSFT_FAIL);
+
+	for (;;) {
+		if (prctl(PR_SET_TAGGED_ADDR_CTRL, sync_ctrl, 0, 0, 0) !=3D 0)
+			_exit(KSFT_FAIL);
+		if (prctl(PR_SET_TAGGED_ADDR_CTRL, 0, 0, 0, 0) !=3D 0)
+			_exit(KSFT_FAIL);
+	}
+}
+
+static void handle_signal(int sig __always_unused)
+{
+	if (prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0) & PR_MTE_TCF_SYNC)
+		_exit(BUG_EXIT_CODE);
+}
+
+static int spam_signal_until_child_exit(pid_t pid, int sig)
+{
+	int status =3D 0;
+	pid_t ret;
+
+	do {
+		if (kill(pid, sig) !=3D 0)
+			ksft_exit_fail_perror("kill()");
+		mte_wait_after_trig();
+		ret =3D waitpid(pid, &status, WNOHANG);
+	} while (ret =3D=3D 0);
+	if (ret !=3D pid)
+		ksft_exit_fail_perror("waitpid()");
+
+	if (WIFSIGNALED(status) && WTERMSIG(status) =3D=3D SIGSEGV)
+		return KSFT_PASS;
+
+	if (WIFEXITED(status) && WEXITSTATUS(status) =3D=3D BUG_EXIT_CODE)
+		return KSFT_FAIL;
+
+	ksft_exit_fail_msg("Unexpected child wait status %#x\n", status);
+}
+
+static int check_lazy_tco(void)
+{
+	for (int trial =3D 0; trial < MAX_TRIALS; trial++) {
+		pid_t child =3D fork();
+
+		if (child < 0)
+			ksft_exit_fail_perror("fork()");
+
+		if (!child)
+			stress_test_lazy_tco();
+
+		if (spam_signal_until_child_exit(child, SIGUSR1) =3D=3D KSFT_PASS)
+			continue;
+
+		ksft_print_msg("Detected invalid TCO state\n");
+		return KSFT_FAIL;
+	}
+
+	return KSFT_PASS;
+}
+
+int main(void)
+{
+	int err;
+
+	ksft_print_header();
+
+	err =3D mte_default_setup();
+	if (err)
+		return err;
+
+	ksft_set_plan(1);
+	setup_sigaltstack_tripwire(SIGUSR1);
+	ksft_test_result_report(check_lazy_tco(), "Check lazy TCO clearing\n");
+	mte_restore_setup();
+	ksft_finished();
+}

--=20
2.56.0.455.g6c5a503b38-goog

