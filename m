Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243286;
	b=C79xnmqWp9LfhWPiqrGjkjgwIS0Oj3lxUk7NwWAec7jNy4Tf4jw+99VGJ19f/67aAJge
	 B+LK7gbtKSUPc1Oz9nsYpgOSCAJE7O2qCscizLUmoLUM5KVDE8HCHqZx4sv1GDN8jj0k5
	 Wv4ITvXK3Bgn8/AZNSxvbi7uxkcLfR3I3KRfKvSVYoBVw7sJr5zpwIS0MSSmb52sLZp8q
	 DI49CcDfK/2kTE+MQ+7Oww9Oaqr2/LCUU50esjgRlaTNd3TVzWElsixdw6HsfGWh/Pvbe
	 /3ZsDpJfKLd/qYp6U3xAVUqb0HKDbZlzxqRpvp0jwmPrYlWOiCX1pfCIqbTUq6y6KuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
	b=s4FpW6AEtanIAtQlq2pXRzmz4qpGagzeMcsCv7fyon5LAIc6nPXit41s4LuaFGQRYiN9
	 eI9vh+y/Olu1/tT5fPxpM22vIf5z8wYNFuUQ/1NwefbtOjtEIdyvvjvTVedFft6CV66Y8
	 9N3j0gfbxaoxjUqc8xaXBNx5FJI94NI2AQAowbeqMHx3PKigQc8R9HSqTiS92AK+x7OaS
	 gPiEzJuKogq42aT+2j84avYyCjqE3lCoOVaYtfUKgdm2li+HWG/pyAjdVHcAc+oRwTrQw
	 L8eWIyFStDTbWjIYH5s+IFsUAdmoW9Skxr7ncEQWHaHtuxglojUPbPyEmQ8/w0gD+Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOQ4uacf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA960A3828
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EEA960A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOQ4uacf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4918c2d727fso574556f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243285; x=1794848085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
        b=yOQ4uacf6U+zNsE7OVTUSnfG9gzLnIxkDbDQBZpK3uSYAsgKJHWffzTSJLOU2RXkMC
         LoP8Qzgy0N5bcXuYBlDXA4OWld5Z464RaKALkuOoQIiJfD812S6+M64aTo7q3SN6MBOY
         u2niOo+ex9gH+mwg/Suy6M1mR4keaWC5FxqWkCrqwX59yvoEqDpW9wmC3PCcZe3/yYh+
         3Ow74JpGg65mI9/01J1wyj401SpbF2fZ8p4EQGYqlgi4xZC6RcXTlTia8sjjS0ZCUpuF
         hXqmWElZ/eMNfsXRSzM3/C7+idcPceIzVyOq2oUFM/6lIeOhrBLjyngC1j00nkfentuu
         TB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243285; x=1794848085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
        b=0LO2dq+WpF04bt61EuaJPUU8eTwSR1WK4MaJO+B30Egxn8iD5fEyoyyE4VxbGrZepZ
         BiJmjrs9Tw8ceMnWSP7pcIYJfbShVQtFoP7iuzggyHm1WiqkKf7Fp9NF4dGaTv/4x29i
         u4FzDkbbQMtFa8pwpivohiyyxc98clGLtV4+Kx3bGqwhdXN+gtpgML2zpIaukKWJTUv9
         w/zAViYvVuJ1a+IOaNI3YanmgFNWVLBCltZrn2yvJE7CNpG0sr5NBPlYC1yfh1UA1a8j
         waM4QuWHXsoe5BY/1Gida7MZBTz/J0feQpfkGjgCTalb4MAsir6EGnV5s1cUw+TrJrks
         bBxg==
X-Forwarded-Encrypted: i=1; AL+hErEshUt8aKFaybZJ2hF7dbDuNbdtW0w7DgAEIC26jOnMiJLh+kRHqQX7XptD2M80d1pidD/LX40jgrUpkws=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N4UILN3YV60w2RXlA5Ut8dmwyVKCs2b1CGTPbpQIg6ewLLGz+
	/mj15QGg4Q+R2EjMfAggJW15h1sBYsWAA+bB5g5S9qYY91/ZNSeXL1Lq
X-Gm-Gg: AYBFou34PekNNfyBXk0zB83iDGiivA6xxfw8CjW9/8agHo86b/m/USRDqUyw2i5TS72
	DFQgZXOpeV8wir7DCHcIHtsJ5zq5Rr8bE5EyweXqz937j9TSAWs7aO0GOKlOtD9Ix0grQhs3oMS
	6s9M54VsAfNVkkPLf8Nr6XAY+ORlCkX4SkTk5caFClqSBWlthwMK8mkBAuCcCMGtv/9ya/J82L9
	CfFk2Z26Vp3K949AiXm0OsQ7HWr/9MYokdN1OdGDdqIWCzl05B4SBLBocDKbHmiwTJLz51ROZzO
	aYDVmaDdc4HgAlEOtUDjQpZxIvb20Q1fl0/0HwmR9dGg9d8bJpQL7v8S6yCUVzT67gzyP80QJKg
	YiB+1md7bNAT1PeVp0pTkeeNeN5WAL28ZYF5uH3+LB5vgwjW/839rrlI+L0XU3UfLL/CYUHWrbS
	UH2VAAOFbgpfbPAcZQle4IpziuJtq2Wq6q9DUwfGFmQmYsRyST54QecakpbY1ozkA5j5ldcea8Q
	E8cwRPC5KhmIvlL7RAuuRui0gc78r4X4tglWOMeQ2QqH47TmhgIWMVtNMvguNL8MT0BtW6b8/kP
	AzPlr/4ZhireGPMLTBGnBKl/v1IzZp+7dG+Am8NVu8LcIyIP
X-Received: by 2002:a05:6000:29c9:b0:490:7fb3:cb41 with SMTP id ffacd0b85a97d-4982eedfb41mr41741f8f.24.1794243284690;
        Mon, 09 Nov 2026 08:54:44 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:42 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v2 bpf-next 04/18] selftests/bpf: Declare bpf_fentry_test1 in tracing tests
Date: Mon,  9 Nov 2026 17:05:24 +0000
Message-ID: <20261109170550.141443-5-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

bpftool puts bpf_fentry_test1 into vmlinux.h only because the function
is in a kfunc set, which exists to let fmod_ret programs attach to it.
A later patch moves it to an fmod_ret set, which does not make a
function a kfunc, and the declaration disappears.

The tests only compare its address. Declare it explicitly, as
get_func_ip_test.c does. The declaration matches the one in vmlinux.h,
so it builds both before and after.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 tools/testing/selftests/bpf/progs/fsession_test.c             | 2 ++
 tools/testing/selftests/bpf/progs/get_func_ip_fsession_test.c | 2 ++
 tools/testing/selftests/bpf/progs/tracing_multi_check.c       | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/fsession_test.c b/tools/testing/selftests/bpf/progs/fsession_test.c
index 86e8a2fe467e..4295f6a78dd1 100644
--- a/tools/testing/selftests/bpf/progs/fsession_test.c
+++ b/tools/testing/selftests/bpf/progs/fsession_test.c
@@ -4,6 +4,8 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 
+extern int bpf_fentry_test1(int a) __ksym;
+
 char _license[] SEC("license") = "GPL";
 
 __u64 test1_entry_result = 0;
diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_fsession_test.c b/tools/testing/selftests/bpf/progs/get_func_ip_fsession_test.c
index bbeea0d512e3..51a7f605f9c5 100644
--- a/tools/testing/selftests/bpf/progs/get_func_ip_fsession_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_ip_fsession_test.c
@@ -3,6 +3,8 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 
+extern int bpf_fentry_test1(int a) __ksym;
+
 char _license[] SEC("license") = "GPL";
 
 __u64 test1_entry_result = 0;
diff --git a/tools/testing/selftests/bpf/progs/tracing_multi_check.c b/tools/testing/selftests/bpf/progs/tracing_multi_check.c
index b2959ba71179..9b008ecd6565 100644
--- a/tools/testing/selftests/bpf/progs/tracing_multi_check.c
+++ b/tools/testing/selftests/bpf/progs/tracing_multi_check.c
@@ -8,7 +8,7 @@ char _license[] SEC("license") = "GPL";
 int pid = 0;
 bool test_cookies = false;
 
-/* bpf_fentry_test1 is exported as kfunc via vmlinux.h */
+extern int bpf_fentry_test1(int a) __ksym;
 extern const void bpf_fentry_test2 __ksym;
 extern const void bpf_fentry_test3 __ksym;
 extern const void bpf_fentry_test4 __ksym;
-- 
2.43.0

