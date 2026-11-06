Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998326;
	b=0QWYos48aU461LQJltiS4izmoMvCphxzPU7AMX8fh5/LkUXr1G4W8hLk712KBBsGbrdx
	 i2CTDXp23/GGcrP9RrxCdEy7Zr8CBH2qJtsRg+IF632WGvtynCh/SMTp48CuWbIsQFP8c
	 nbXu/GMnckv8KZEoN6VSX7ZERbikPHJXUAWV8ev1OVgMqaktPey3VROneGOST/DjdIEhP
	 3XguBDOfcbmt/U5Y2ZNxqLF78bwHeBB/hG/zXxa9wvJUk7ErPz42yezQw7/ZClbJl7pfY
	 Rv9SiwC0LMlwI3NGQAKvEMUdIb9Na+63p73VpW+8XLiflXZYHN7vlJbg7Qd0s3GCesQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
	b=Ifm+9u8QIrW1s2cDmD+xVPHpaTbHWMH1dsxtSHzP/4Sy3UTp2cWg0cgi2D93+8ZdvO0y
	 WxSxPb5DLRKVKA/Zp5QFYx+iZEaBr4CUqkzEJGOik+0vqMwPPd5rLHHA67jfFPB8Pu+9o
	 cWecxadiZP9sQqV9VSi65ltFCq3wHiCO+jktMaqVVtr+nywXBFmfOm/FXBkbtOUMMSHAk
	 GyYfIKknWXv/IYUpKP7FH+ULlymbInsjPylJ+QD1/dk2rgwggB9Jo75INWZxDDxywKOaI
	 yOo0nW+0TqyvuQLKEEUQgZlmN7I1htondVNSXi/aIuITJXAhb1Z+bNmewxGLXIVjhXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGu9teUN;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F8606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85F8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGu9teUN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so211055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998324; x=1794603124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
        b=tGu9teUNJ1zxIAGoTnqctdfzxw6DyuT06z5Y2L93HHwOhxX7C55Cwz78HdIsnFJQ05
         cJjMmdFA1gXpFwWhrOJRgDWDm6v1eOZPvaQIVwSFITwdhICAGIR/wbxVesnO3fGVMC+Y
         hD8AFftaDqVdyb6bOuJfotSi0FLS+FRdxt1N5EjijC5kQQfp3GMlNWf4SlkpJs89WTRh
         +ipjLNZmY2/69YbEbk4rjo+WahVBvmCo18NzEckgRKemCU3o2vIyS2lcFiIF5HeiUsvZ
         eQ+ItrXl84I1tafbF875utkB8RQXwgL4kDkAQBiZYeovXSKHtaRtVQjWT5fHJL7MeEm+
         /vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998324; x=1794603124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
        b=D6mcS54oKt8W5QIc872bybNpgb0z+7kaek1EdXpRx0inFgDeMvFMXLQOWTXN9i9vd3
         THA4J7ckzsECOShg/u/irdZp1Bx3hgmFRJ5iQH5NA3gJPhKE35kY5tPJlHgEvxxBiZHb
         dElrmqXtRL/ur9z7gWDFT0ZWDYew4jk9+7h1wmfkooo65I8PTDBo1+SpWOMeihcMobfd
         aQtkUlcFeMyaTAX/YMO3MxSwkYtS/wos0ArnqXO6UWb9fPCj7tK86AvNTbjvA6PnWY6E
         gzRAa55fUyy/TZTA9lca+SYj0VYOFBjzo56CvkD0tQTjQVzHdxL1JCbriBCjW6e5zFAH
         NJqA==
X-Forwarded-Encrypted: i=1; AKwUvBwAk+/jy81pqu8mITIxmnEWb9uwTLCEk264xKN7On+3C0RIHF/DHOCjPDf8MJLNuxoFlxXGFZFlkhxIEEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u9lnUF+pvUguIb93nI1wi0Cd4pDGFLQFwGICLy9FJnbpDsNms
	HwHEILMtmXEmnW0xsvV/LOsNKbDTBuhPyuXh691F3Wk2m3Gx55zWDAhS
X-Gm-Gg: AYBFou36kbjbMCu6JDTvNaYZMTzHzVCt9ehLin5scGLi9Fke+ZK3ja1NH2OY0hXOiL/
	xHXaqtU8L2M8ckCT/kcJQwFk0HLkPgCDbcyTcdaja0ytfQ+ozNaT8K09WuqaGO2tuKOIVHeh+Lx
	cTYzMyw2P4f5XmF2me9Y0UDlEbALnJh8BFXtdOqgApJsnA5pL9XGgtJYizTR80rCN8XGVdU18rR
	SAlEeoaZzlH70ewWtE7lDOmKhI06MFGPsc9y8BGdim2AFB/1/W6aSFFq0ggFHuFUo7IrWJyylmH
	5g7Q5y+xSYQZc+N+eH5YIVsAo4rjy4/T9RnnRVQMgQR7su1m+oF3Z8lxYT6Q+Z46wLd2VDtTx9I
	U1+IrUmlCbRD/1qedHbNDnuQL8EavHob++K41u4k8wthTk94zU+fkXlvNGu3pHwFR+rotNIMXIO
	cFkOapOK19+8w6AKa39f7INzAcX5nU8r3jlND6Mooe+QKx4O473TiwjnlS106RBxlADHNY5SMqb
	pw/KSxYX0+nICYjzEU1kVTzWRnpqM2fjYETW6LE8M921fR8+xO+hWvP0Is5B2N8EnNINacOle8F
	fEj37MMXGBpRjn46Ie6lhh3jgVtc6FQnweQxsxVQpBLm7BM=
X-Received: by 2002:a05:600c:871a:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4b8190eca6bmr2665875e9.2.1793998324172;
        Fri, 06 Nov 2026 12:52:04 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:03 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 04/18] selftests/bpf: Declare bpf_fentry_test1 in tracing tests
Date: Fri,  6 Nov 2026 21:02:53 +0000
Message-ID: <20261106210314.1767267-4-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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

