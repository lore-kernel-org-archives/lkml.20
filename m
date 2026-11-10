Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328169;
	b=KomJEH7bJ2/T2YZYH4L0fvMR54EJK4ClzhgzAtLp4aOOWMXimfvQ6gFovZNeXHOtnnDs
	 6KbYEj5dR5/8i1arWHAPvaR1gyOYSJHxQ6igNzT/ytntDiLRxcmTS60d7+zDMY3uyizQn
	 0L2T70IvR8iu+dkMeA1F9t6795vuzbjN++khSeY4MpUFMdRHhloMS043RN4aTGI+hiRHB
	 UQEbThfg/xieM9BpFu8Fh36/O3eepT5cytFP2XSxGBJjeiXn/P4SROSagFI6S4svEYrtr
	 j3y7KU6P2p3BQOK2yA2XBbFEeBR6PWNNN3GunWpm5XwGFU1USN4q6n88NrRF9hjW1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
	b=ZQcBJdGH52VUGLO6Rw/L90Al7/bR0+1uWsxYjwYvl6cClj4VVDNU+Vwwv5fwuKCdKgBM
	 fwYJrUkv9z4o7xkCvnWysiR/q7Y84/WKhAQg6gznCZkaRpUstM7l5r0ubUf1LKFDx7fQM
	 SrOfeaoi19NKfnPWPSw5LGYjps35QyMjQClr3U9vMTlbRq1yCgE2ECHPNXp5hH1A8b83A
	 vVjMlcoLpnorqGnsUqvFiPGBd9+KXvtIb1KnmNQ1fpN7lPjEN+ZgMQ93AbQZ1meNJS+vo
	 P/5xJI/x74nu4Y3kdTgeOO4+tPeJlXtr2+Kgp3TK8YQd7Ey4tVaXEs611E2sfJ5NrUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQn8Cv9W;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253CA60A2609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 253CA60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQn8Cv9W
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15877295e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328167; x=1794932967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
        b=wQn8Cv9WSp8U9YmHH/WaVO+Yh8opCBDHMrG7mbqFO0KSG8qcL7ClK35vD7ExCJUYix
         j7lDDCbiYyVmUIrPtE5ZFfOzUBzStbqUCviLyMTdlObIC68y2kBTVgD0zbY3Hoegl+8K
         l7hekknz/FU6TADqpXc2Il7aP4UHbd1IAGFvaS8BmfousMh9B/tAzS2bir2Tg6lJX5O6
         TewvPyC6qtdhJRoygEqCEZXTta9IeslvX0Y+JVCKwe1VYkHzCDmeR1zza29V81SDJRXB
         a6+sKuBActhbjIGqhCBH9HubuIS9O/nn0mIeE/OA0i8hlxXmE3+WONnjY9pSA4VZFf5k
         9JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328167; x=1794932967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaefMEvrOf3+jRRd3Xy+fUqgL7q625BAckIaBev8onI=;
        b=DotJHm1W00WFDuimeFwIE7UKM5rw8hhwjCKQMfMDQGM2IidQHzL4xTf5YLIZqdFRHb
         CYHLLP5vaCt1KUsZ1RMgisjO7h5E5mz+6z7X7z/vxuoG/Jyolt8QXtdkMgPDXqnn8aQt
         L0nE+PMD6XO30mjEGN8PcLc8j+HXHlLSyyfTLi+cLQ16Sx5r+UnUJ5jqObAEQJaqOVg2
         A4DzO6GxccTjfJdPcP8+1ztC1vi+3EWGzK52nk2kEvuOflMVUlkmomEL1NSzvr9i7SbN
         1eihJxmlSTGiHKwm6TIwC9kAPSRB5XUoO8GOPebVdCaBAIywzb9VmB8sS8QhZllyemAK
         YMEQ==
X-Forwarded-Encrypted: i=1; AL+hErEwksCLcNIScuTTLEmIfj4w/Jcazb2hJNXP35vXgIriIV+5EpX1GpMeYEavTZ94WUzl9f0zIXwW7eqrT9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tQO8nTft5YI4nxOxAjeDX7e7sWqybw828S9kkEcy6xAMAFxOI
	CSfkX2EkSv2HwmdaSQrd15T+utLHvGvX8xC5c6+gy3aZtbhQGMkq4mc1
X-Gm-Gg: AYBFou2Acjl1UVLWruIqzaPBgntBS+89AJchSdhJQW76PjBlRjGCPwpxWMA66DSLNWB
	jBaj3/ifD9uonvcCi4zdSGV9Noetl6E2s5IGIfkMo2Djff6udQequXiV1Rs017S0hbJGeGovN79
	LeoN5d0+s2VA+l3K7VNU+fQ7PR4LKD97EXlfsv8h7uoMYcQnJeraqDsjO+2tR3PxxuzQSGTFZdN
	eK68byD6LNOFqFW4RMp8lM5tQnJwqRPW8c2SHjlmqCLUz+Aweu+7/2Q5PK5FapZeIRpMJVuhZ4K
	B/DPhxArij7+JVtph1mbb94zDlw7+TW2WJvyaGwevSoRlPKyIM+QYMsj1j7ZaHslP/nYdfKVXWY
	QShHPn3TjP7zDCZb+VYIogh7bWNct7gJrd8YGcu9uUOqmeb2TkCmXngYxya4rEwjYya67VUgxPW
	eL5mgEvjtzXjECOpqCVsr8/Ue7SE4K58d7OkPzlDZg9aYhZ7pItOpwXtJ8He0XIrBAtlccQrn+W
	G9fU0GGu6vub6xm2Yyu5UfPpW7wi32eb/MTG2UF0kv6MLNdftXx+Fo6ZqpaqWU1C08ZxTvjUC2k
	nOHrkrw1OLXTF4nv/FFjwNKycGg34XWulJD386CKvhkjjiY=
X-Received: by 2002:a05:600c:4fce:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ba0235bc8dmr57241955e9.35.1794328167339;
        Tue, 10 Nov 2026 08:29:27 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:25 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 04/18] selftests/bpf: Declare bpf_fentry_test1 in tracing tests
Date: Tue, 10 Nov 2026 16:40:24 +0000
Message-ID: <20261110164046.454431-5-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
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

