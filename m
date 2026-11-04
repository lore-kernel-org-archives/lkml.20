Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826552;
	b=lx4JQCxR0Bb0BlCn6IHyer7JFR73oTytlhksk6OpZXFk4jKjflEBTD47p7KcTcuXnXHp
	 TDnp2845lgmhCpKA67MokbdLpIIBrhgLGatfBRwLe3GT8cWjvh2uesvRyT2+n0JnTMHFy
	 uCRWrEKE+mgQuW58Fp2gLa2oyiGRUW/Yv/B0m45jWXIYAq6yfvO0sgnsvuxRuDq9r+bdv
	 dH2PWpw4RL7omLB+McZJSQylcB6k7JGxM9DCe/+FcJ1Dgj4fJsD4LXuW4+xqG3UKfIxWo
	 CikIfwP+5NLNnSj4P/gxVVnPCTnf438X8U2ZeOcMAJ3Ep2t9to4+N78dQvksVyyQjRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=b1Up/mMzU2bQ97X/Wz1u2XktmxWFj0hsGQ/HEaQOHnM=;
	b=A3wj5QZQ2fI0tvQsiD/gq+zP5bfu9NbTyMqEvP1PISOYe1btp+PbflA8xe/cp42sT5A/
	 16CJ8OiYQdehCiWpvBAg/JOPsvJZmFRNVjHdDLmMkeVJ24dSAlHh5m1s7K7HNwhP/rwsx
	 YU8MQBH1EKTyeBXZRhCZLRrjPppz8V/ZfahaZlXjdhPT39JQxHmxVTGl38nSZ4Pr+Vijg
	 dCkGJCo3M353CUywW4tBYrVRUqV8UBsnSo+bFWKWGpiOW8D3GFLDnHdCx3sCvskF6Hp2H
	 fhXPBMUiDX98Vve62koNfwcZHfsjF+rq7fbH1nCVjrOJUz3ItEjnymow8Ibg0ybIOAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UGesA/Sj";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704D7607E923
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 704D7607E923
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGesA/Sj
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so764916f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826551; x=1794431351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1Up/mMzU2bQ97X/Wz1u2XktmxWFj0hsGQ/HEaQOHnM=;
        b=UGesA/SjsBHV1YCg+eVe/7SygDEICH4UvK00QL9E1FyrZnIUwnnKCC5tMUui9k16vR
         5lBqhLtNhGFMto7U8ZVmB02PLNY9h9xqYYwJE2rUcy4QJmsBwt7k4CRJ4GXoiZrXZnvd
         iBMV6fehEYxjQMLCYoZM6BysJRaiBb2qLUF3z25l+U5JTEO4f4/Ge2jjOUsNGpTptJ9i
         TS98mWg5pooEBey6PVgGjt+LHXElHbIJfTNTcAHjKjRQKPvB4xnB0dDNjXB5ri0KaaRe
         fuKJKrsdB36NbQ01dTwgH8Z+BSGg0clVVdKf8HECboHuinyUzoFa+z0H/I6QEZ2RiiVa
         YCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826551; x=1794431351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1Up/mMzU2bQ97X/Wz1u2XktmxWFj0hsGQ/HEaQOHnM=;
        b=NdcCn67mouN1pDjSV/zYvmPfwUWekG4gCrIcjptbAd3tGe8lLCN3Kl6DSaEOkksLD+
         z1AaNWe6QTb7wNDM2fjEaeXSaPVLPsr0lT9sQM0hg9+2TqSdm1PkROxjt/ULIIaxLvJb
         DmJilHKoLKv0YaMYG8q7NfsMIMnMyrMEdtbu4U9y+237CDjasRVpe9SuH4YS5IL5fTJF
         v/EvZmaJaIQI0lPzBzPJb2zGtcp6mkVlElE6matmWnfmucAFcmEadECgPnMRfno8q7iF
         Ubm5ak6rihfO7XyZR7q/hgUFzJ6MEDxGOl2YgQHyMTpXBts5/zuBvk5atdgP7BssyevE
         vu8w==
X-Forwarded-Encrypted: i=1; AKwUvByJOWC3t3Enu08W8MVy8giDb9wHvdyywtJcU6e5D5+TP6fdGvihe2lzXfTcvyne20W3dU2oJ0exy4buwQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BQKaqu9LNwHrgnearGafISImLqJYa97s081y+vYMQrIypKTgC
	tlehNUSChu35zqZabLCXeDrjz9FnXPGGT0N424LjcklerGhctNn5MLVh
X-Gm-Gg: AYBFou0kYdK78wFlMoXj+t8NS4W6W0LYW6W9l1fpQtijTag8m2f/mMGIcj3v+EOxZuc
	J4IXkuCN5EPBNS9fYhOQhc3an6edZy9gPhznnzYrNhWuYJ4hiXHMCGkLqEHYrCMZs7xBp7bwhT/
	sdrw82CZJVI0ynvaHo4IZmqyqU2AAAPCLdagA78LLsezsTpAw7wYRjcQKYbQ0Gybw8RIZgnZcax
	XErqpjtOz+89ZvettWMJo2n5H/dsgUdlCx96FfU/+XzDANs2x3x91iwD6a9ztXW5zehWoRE2abt
	cqmA4/PrEZikQ2B4LpZEkL8AnBVO7B9rQRszaC/PHb1Qmii2z1n7sEuO9J7y1sY+djlXWPx9nrg
	GInKCGwRv6U1nUx9O2X3KJlrrz/E43PYrRfk8QdlchT6tFjxF5vQDfMypUZpLxdS5GCR7pUpBK7
	vReB12aChuhnVWncaSGu7Y5PH4I8K3+ybgQCS3TL03RN8K/TVZ6gsCUGZpBcY2ieDQU0BBDSERu
	0A/UYO9vsrB8E4MzI/bpYRqvg0wFP4hRnxosbXzGUDiAAhu6S12gnZV9Z5QF3n1besSUBN9mMQB
	4nUGwRG5Hjsqvh780BKV7wzDajfBc9vtqFh4a9E+egS6vgwSQdGDCQ==
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr40887465f8f.16.1793826550673;
        Wed, 04 Nov 2026 13:09:10 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm5719865f8f.21.2026.11.04.13.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:10 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:56 +0100
Subject: [PATCH v2 10/27] selftests/landlock: Assert audit initialization
 in fixture setups
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-10-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

The audit fixtures check the result of audit_init_with_exe_filter() and
audit_init() with EXPECT_LE() and continue with a negative audit FD
when the initialization fails, e.g. when auditd holds the audit socket.
Every following audit check then fails with a less useful message.

Use ASSERT_*() for the audit FD and for the audit_exec filter
initialization, whose result is used by the following calls.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c                | 8 ++++----
 tools/testing/selftests/landlock/cap_test.c                  | 2 +-
 tools/testing/selftests/landlock/fs_test.c                   | 6 +++---
 tools/testing/selftests/landlock/net_test.c                  | 2 +-
 tools/testing/selftests/landlock/ns_test.c                   | 4 ++--
 tools/testing/selftests/landlock/ptrace_test.c               | 2 +-
 tools/testing/selftests/landlock/scoped_abstract_unix_test.c | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 81cb31aa32ad..63b1b2a04eee 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -49,7 +49,7 @@ FIXTURE_SETUP(audit)
 	disable_caps(_metadata);
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd)
+	ASSERT_LE(0, self->audit_fd)
 	{
 		const char *error_msg;
 
@@ -652,7 +652,7 @@ FIXTURE_SETUP(audit_flags)
 	disable_caps(_metadata);
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd)
+	ASSERT_LE(0, self->audit_fd)
 	{
 		const char *error_msg;
 
@@ -841,7 +841,7 @@ FIXTURE_SETUP(audit_exec)
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 
 	self->audit_fd = audit_init();
-	EXPECT_LE(0, self->audit_fd)
+	ASSERT_LE(0, self->audit_fd)
 	{
 		const char *error_msg;
 
@@ -854,7 +854,7 @@ FIXTURE_SETUP(audit_exec)
 	}
 
 	/* Applies test filter for the bin_wait_pipe_sandbox program. */
-	EXPECT_EQ(0, audit_init_filter_exe(&self->audit_filter,
+	ASSERT_EQ(0, audit_init_filter_exe(&self->audit_filter,
 					   bin_wait_pipe_sandbox));
 	EXPECT_EQ(0, audit_filter_exe(self->audit_fd, &self->audit_filter,
 				      AUDIT_ADD_RULE));
diff --git a/tools/testing/selftests/landlock/cap_test.c b/tools/testing/selftests/landlock/cap_test.c
index 3d7fd02e21ed..7b3b724e4406 100644
--- a/tools/testing/selftests/landlock/cap_test.c
+++ b/tools/testing/selftests/landlock/cap_test.c
@@ -775,7 +775,7 @@ FIXTURE_SETUP(cap_audit)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 }
 
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 7d399c097c93..7ff94755b029 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7504,7 +7504,7 @@ FIXTURE_SETUP(audit_layout1)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	disable_caps(_metadata);
 }
 
@@ -8028,7 +8028,7 @@ FIXTURE_SETUP(audit_quiet_layout1)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 
 	if (getenv("DEBUG_QUIET_TESTS"))
@@ -9605,7 +9605,7 @@ FIXTURE_SETUP(audit_quiet_rename)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 
 	if (getenv("DEBUG_QUIET_TESTS"))
diff --git a/tools/testing/selftests/landlock/net_test.c b/tools/testing/selftests/landlock/net_test.c
index 50b637354b51..c1b6e288c965 100644
--- a/tools/testing/selftests/landlock/net_test.c
+++ b/tools/testing/selftests/landlock/net_test.c
@@ -2957,7 +2957,7 @@ FIXTURE_SETUP(audit)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	disable_caps(_metadata);
 };
 
diff --git a/tools/testing/selftests/landlock/ns_test.c b/tools/testing/selftests/landlock/ns_test.c
index f5d4b86edd30..6491b53742f1 100644
--- a/tools/testing/selftests/landlock/ns_test.c
+++ b/tools/testing/selftests/landlock/ns_test.c
@@ -1944,7 +1944,7 @@ FIXTURE_SETUP(ns_audit)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 }
 
@@ -2596,7 +2596,7 @@ FIXTURE_SETUP(ns_proc_open)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 }
 
diff --git a/tools/testing/selftests/landlock/ptrace_test.c b/tools/testing/selftests/landlock/ptrace_test.c
index e0e7f95e889b..10371c1830ad 100644
--- a/tools/testing/selftests/landlock/ptrace_test.c
+++ b/tools/testing/selftests/landlock/ptrace_test.c
@@ -323,7 +323,7 @@ FIXTURE_SETUP(audit)
 	disable_caps(_metadata);
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 }
 
diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index e006dba61652..5e8224623780 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -288,7 +288,7 @@ FIXTURE_SETUP(scoped_audit)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	drop_caps(_metadata);
 }
 

-- 
2.56.0

