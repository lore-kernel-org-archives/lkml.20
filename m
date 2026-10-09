Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD333E347
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510606; cv=none; b=MRjl3wcSnteTD2DilHBoKlMO51HLy8UHRO5QQPk2MuKVITrQKUPuV3/EUnIqAMbElSbi5JmzvwOUYnKd9hNjpEWvFys6xRkj2+dMRbIX2FMA88D3+teSaajQYKGILxT0LjHhK3Q3PDoz15vJZHdbt/Wy6eGi2donw31XUcOjiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510606; c=relaxed/simple;
	bh=+/4v1kWb9Z8LHSl6fJMTJEt4Wi+ztr3HQBgQiwBNDv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xh3SKQe98bS8V9iHFr647BT9iypTfSm8TN5UMAnnfUWZLeLBlAHMRT4FaByFgT6R8EJgPucYFQ6ejf9P/1TUE2JrTgozpUHFgz7Qc0TBQxDm0O/5wWEY/xmWFlfQnVaswOXyyTR4PbxF5oQSm4Hec8Vy+tfsFG856nkJuk7zkmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNZzUIIm; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNZzUIIm"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1419d3416ceso11370102c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510604; x=1792115404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUd5celQ1xRRVvSTT7TnMsIc0Rmu+vm1iEQ8dUANTn4=;
        b=VNZzUIImYtk6fROQvo8fMFqpfR+vd0qtnStqibwDZ10TvTAf1PadA5Zou4bBB8xP1u
         mc4KYe3oKA+YtDAPA7GTjgSwwU1xfaQ86f3jGst894XGnKokg3Ex5mOQMlFJ8CS2O4jN
         DsaL7k/KCcUiMdP+SiaGxQMqGHyd7u5WaHsmwfKQwqNsq7ab3jD+lZobyDsZRAzSYqz7
         B7h9k+1u6l2u7Eb04zMR8RUnv1W122eIwBP8sk50xwX8Zso4L3c9G1T44s62VsJRPc2L
         G4JX8O4PHEuYG1MDPNJ+wLokCVRXjb/BEcoA2CTPfVfTj1Df9QMKIOwAv3+L4u/uxyC6
         q/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510604; x=1792115404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUd5celQ1xRRVvSTT7TnMsIc0Rmu+vm1iEQ8dUANTn4=;
        b=KiToXrhp9NLbH//rpQmBxLXf/fT/Fb/rI1jm42upNZjr3A7QRpne9r87iZleHd7z+r
         CDArSJvNsanloKMZML8H5GdlOuLFLO9WfDHjqDmc5KUcail7Mj+uwu8XGvhNyqa6HRrH
         WuwYgHzAmWVUPbVA3/G6BHKdYIK774IcLcAKvG1cF3ewDULObMjKhqpSGipqZ9nmb92d
         8TCbBcCoedUNSK02QeAsSL3+jXXjhdz+t6cYR89iYFhFbgIR9Bs0PT8Wqhpex7gwqpFT
         ni+MG7UA+lyICOxX9KdUGuNLkXc2VDeYdfJJ76YJ4HxEPBf/LKbwG227nNGStihhOyPF
         f6Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzyLNvsj56ebth2ZHz3uZQVxyR6QgHuuISgPQKxnLK5YIxyeJMaJKfR/9zv5o8hy+e1lK4l8i0RwaPoMas=@vger.kernel.org
X-Gm-Message-State: AFuF++kKBU3KknKusZf1ytpv+oCT4kKHTIw7HYUXAOJ4crRJKLqXO6Hv
	WO2V7ipA41s5V/q1C3zsMvrZAhSL/OzvK2HC2Ef4+wZ5K6pqeQsTFXUP
X-Gm-Gg: AYBFou3L4OX9NAF2OaTNDECxAxjzqs+thKyXIwTDf9jBSFa9iEIMNGO/FeSYyAwjw4q
	+Q7OlFYD9K9XWzF2KXQ5zNxCtm5AUoc9QEOj/M4pp4YXHSCH7Dd56P9T2kmAo8wAeoA/+8YMWGt
	MSRzVI2MKtBXffnxLsvJR5Dsnhfp5JfqnQT4h9Kzz3EbdhTBjb387E52GmLZRfGO2mFlzWb7S3S
	VZinXP4OILbAwvtCaECd7LlrlWP64sXRH7bPrvszBtPiUUg8PgSw1LR2wolpkHVvms7VZKr4sJ+
	CCgZ7jzIqulN3acCdXOSH7jlMtqn8uzogS28kME8aahS+4atjEhb4iECoDnyvSaPZg0IJ8QjYfa
	H/K9fcmbE+HrJE7YxONipHIYVq8hVSNtqDZFOCdmzqTSNU7dr5nDTdJOQamJWgYSrnqnBeuNTSR
	p+s48nA8xX7S7eDBHeHTqEp9uzqkpLftaY5mJWkdkyZcB7b+J/FpoCLcktIeEk+0jpmQ==
X-Received: by 2002:a05:7022:7e83:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-16a60fcd68bmr770017c88.24.1791510603880;
        Thu, 08 Oct 2026 18:50:03 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm1984845eec.24.2026.10.08.18.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:50:03 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:49:52 +0800
Subject: [PATCH bpf-next 2/2] selftests/bpf: Skip libarena on kernels with
 too many possible CPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-libarena-nr-cpus-v1-2-e726ccc66fc6@gmail.com>
References: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
In-Reply-To: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

serial_test_libarena runs every test program of libarena, most of them
after resetting the buddy allocator with arena_buddy_reset.

The buddy allocator takes an arena spin lock, which fails with
-EOPNOTSUPP on kernels built with more than 1024 possible CPUs, as
distributions commonly configure them. Every test then fails at
arena_buddy_reset, while the arena_spin_lock test already skips in that
case.

Reset the allocator once before running the tests, and skip them when
that returns -EOPNOTSUPP.

Fixes: b1487dc1b181 ("selftests/bpf: Add selftests for libarena buddy allocator")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/libarena.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/libarena.c b/tools/testing/selftests/bpf/prog_tests/libarena.c
index daade4150af66..070a08856ee04 100644
--- a/tools/testing/selftests/bpf/prog_tests/libarena.c
+++ b/tools/testing/selftests/bpf/prog_tests/libarena.c
@@ -240,6 +240,15 @@ void serial_test_libarena(void)
 	if (!ASSERT_OK(ret, "arena_alloc_reserve"))
 		goto out;
 
+	/* Skip on kernels with more possible CPUs than arena spin locks support */
+	ret = libarena_run_prog(bpf_program__fd(skel->progs.arena_buddy_reset));
+	if (ret == -EOPNOTSUPP) {
+		test__skip();
+		goto out;
+	}
+	if (!ASSERT_OK(ret, "arena_buddy_reset"))
+		goto out;
+
 	bpf_object__for_each_program(prog, skel->obj) {
 		const char *name = bpf_program__name(prog);
 

-- 
2.43.0

