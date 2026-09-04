Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715573B42EC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491957; cv=none; b=b4lBi3+s6/MbBYZ/X9AkXVngcK2dp1gL9Q4Plc0ZvCk5l3pM3d85f4CfaQ/zKtuULS3R5lRMsgbC27ucmdyLqXH7UgtnOj291RMAN1jwrk6wb81qtrsthElGUEIFaEnYB2d9naT5VxHoYXcPPHIQG2e/F0xi/FPqz2rViNhzbBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491957; c=relaxed/simple;
	bh=fC6bLYvWi3YAW75vB3TW1SRbpe/x9g2nH3Xn4stbrlg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mRRh4xWv/KYKww2efXi1WWbVLb4rpus4mJBvAXcZ7DGygUdZgaPyb/wpON589l7EMiPK9h2cBzaG3h49pUYn+HpEhOEUbM1Pz5PQkBQnUHGs8K6KvVqRLKlKDoVTlF9/PMJKyNbkVRthkxgl40PXczHWKyx/RasghFmF0xX/sbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ujb4EKor; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ujb4EKor"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7293f13c6so7004795ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788491956; x=1789096756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3+QfypsaoraMhsiZLHV6szGOoZiPKujpYHWhvNQofXQ=;
        b=Ujb4EKorHMajyPYN0jotOPigulNcazTWZXTjxl05gJEMecLomIjX5nhcP0+td3DMpz
         DsdXoBdyh3sHIughZdHjKuAKf2F7Ni3XR9Zat/kzrx0Y9cSai7bF9kOap39pSV1nM6Yy
         /6jw5q/GgZrG5DEQBP7ScfyZiNBKA4XgtcGpf7W6YCavy++vci0eCgiWLgmSWbBAA1WW
         eySLrLNfE7JzyBalf29dbPDHlyf7YJ3dvO1SE2Z48TPDo5oUPkuyUNRCh5jNVZHip/P4
         t2hZfQN6UQKvbeobWECNztoIEeuYj7OpZiVP+/Jmq/ZSwk2Q1MmwZd6dh89roVbOK5Jp
         RACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491956; x=1789096756;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3+QfypsaoraMhsiZLHV6szGOoZiPKujpYHWhvNQofXQ=;
        b=RjMSNEqkYMrUVO8YoobPq0KM9cpAKq6GiE8LOfis28Hk4G8JCvfzmkBYm2bKVMo0yu
         mSNtNI93VoBxywpfrBeZNOTzQIvkLslEsCRpPY8m0EA13Km+vI2olyNQkYnlxMi6KxJV
         MMuUD2vnlXyuugPHNM1c+p2q/RA4XepsOgYccr0SB1vpM59IunMc5+tRsZYWjW/IRJMo
         eACueZCaUQ5lpJug9lctV58GxWS1nh+czEQlRChc3z4UimN9A3Otw3ITmGhGcHGvj8mX
         EIL6t4CwJUHLE8dLXefQUk86e3YQ6yVZS4pPlCHJwDEIyx/Tf+CgQ2b+FXgaOPvwm7Dw
         DMSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3ziCg7Yan/+bdc3Zfu9igPyuh30xISJfg4RiokfvN7X24eaD+hQ47qmAb7AgVFIyYIlJajF2ckXFB/Kw=@vger.kernel.org
X-Gm-Message-State: AFuF++kDjlhpPvs8WeSHtx7RHOADs6hn1xg0QEg3fQHFhrnUKJIPrIi6
	4JdpbtJ97CET8u+P3s+269MZ11cYv2jz0N7PPQjs0YcfFAvHv84uTjhx0KHxOunW4Fn0z7Sz89s
	NiA==
X-Received: from plrx6.prod.google.com ([2002:a17:902:b406:b0:2d6:dcd1:657d])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3810:b0:2d6:3c22:99bf
 with SMTP id d9443c01a7336-2db124afcefmr52336225ad.9.1788491955429; Thu, 03
 Sep 2026 20:19:15 -0700 (PDT)
Date: Fri,  4 Sep 2026 13:19:11 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904031912.2133476-1-tweek@google.com>
Subject: [PATCH bpf-next 1/2] selftests/bpf: Move verifier failure tests out
 of test_global_percpu_data
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	"=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Commit 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu
data") added test_global_percpu_data.c to LSKELS_EXTRA. Later, in commit
1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu data")
two verifier failure tests were added (verifier_strncmp and
verifier_snprintf), both marked as non-autoload (SEC("?kprobe")).

When bpftool generates light skeletons, non-autoloaded programs are
skipped during loading, causing the loader program to store subsequent
program FDs into incorrect skeleton struct fields (e.g. dump_percpu_data's
FD was stored into verifier_strncmp's descriptor).

Move the two verifier failure tests to a dedicated test file,
test_global_percpu_data_failure.c, and run them via RUN_TESTS in
global_data_init.c. This leaves test_global_percpu_data.c with only
autoloaded programs, ensuring the light skeleton can be generated cleanly
and correctly.

Fixes: 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu data=
")
Fixes: 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu da=
ta")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 .../bpf/prog_tests/global_data_init.c         |  3 +-
 .../bpf/progs/test_global_percpu_data.c       | 23 --------------
 .../progs/test_global_percpu_data_failure.c   | 30 +++++++++++++++++++
 3 files changed, 32 insertions(+), 24 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/test_global_percpu_da=
ta_failure.c

diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c b/to=
ols/testing/selftests/bpf/prog_tests/global_data_init.c
index 7c539cbcf3a1..dbb7de534f7d 100644
--- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
+++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
@@ -3,6 +3,7 @@
 #include "bpf/libbpf_internal.h"
 #include "test_global_percpu_data.skel.h"
 #include "test_global_percpu_data.lskel.h"
+#include "test_global_percpu_data_failure.skel.h"
=20
 void test_global_data_init(void)
 {
@@ -372,7 +373,7 @@ static void test_global_percpu_data_rdonly_direct_write=
(void)
=20
 static void test_global_percpu_data_verifier_log(void)
 {
-	RUN_TESTS(test_global_percpu_data);
+	RUN_TESTS(test_global_percpu_data_failure);
 }
=20
 static void test_global_percpu_data_iter(void)
diff --git a/tools/testing/selftests/bpf/progs/test_global_percpu_data.c b/=
tools/testing/selftests/bpf/progs/test_global_percpu_data.c
index 2765cd46e9af..bc748df4a6cc 100644
--- a/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
+++ b/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
@@ -42,29 +42,6 @@ int update_percpu_data(void *ctx)
 	return 0;
 }
=20
-static const char fmt[] SEC(".percpu.fmt") =3D "data %d\n";
-
-SEC("?kprobe")
-__failure __msg("R{{[0-9]+}} points to percpu_array map which cannot be us=
ed as const string")
-int verifier_strncmp(void *ctx)
-{
-	return bpf_strncmp("test", 5, fmt);
-}
-
-SEC("?kprobe")
-__failure __msg("R{{[0-9]+}} points to percpu_array map which cannot be us=
ed as const string")
-int verifier_snprintf(void *ctx)
-{
-	u64 args[] =3D { data };
-	char buf[128];
-	int len;
-
-	len =3D bpf_snprintf(buf, sizeof(buf), fmt, args, sizeof(args));
-	if (len > 0)
-		bpf_printk("snprintf: %s\n", buf);
-	return 0;
-}
-
 volatile const __u32 num_cpus =3D 0;
 volatile const int num_off;
 volatile const int elem_sz;
diff --git a/tools/testing/selftests/bpf/progs/test_global_percpu_data_fail=
ure.c b/tools/testing/selftests/bpf/progs/test_global_percpu_data_failure.c
new file mode 100644
index 000000000000..3a823acb42d7
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_global_percpu_data_failure.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+#include "bpf_misc.h"
+
+int data SEC(".percpu") =3D -1;
+static const char fmt[] SEC(".percpu.fmt") =3D "data %d\n";
+
+SEC("?kprobe")
+__failure __msg("R{{[0-9]+}} points to percpu_array map which cannot be us=
ed as const string")
+int verifier_strncmp(void *ctx)
+{
+	return bpf_strncmp("test", 5, fmt);
+}
+
+SEC("?kprobe")
+__failure __msg("R{{[0-9]+}} points to percpu_array map which cannot be us=
ed as const string")
+int verifier_snprintf(void *ctx)
+{
+	u64 args[] =3D { data };
+	char buf[128];
+	int len;
+
+	len =3D bpf_snprintf(buf, sizeof(buf), fmt, args, sizeof(args));
+	if (len > 0)
+		bpf_printk("snprintf: %s\n", buf);
+	return 0;
+}
+
+char _license[] SEC("license") =3D "GPL";
--=20
2.55.0.979.g7e5102b832-goog

