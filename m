Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768472;
	b=UTFKX/sdLBisWSzgAUnU8Pqcd1Mc76hsvqzprZSrS5e/pGaRkXSELs8udinY2VK2W9dJ
	 NBJcCNmGbHJkohOlCulks9J6UWkGW5sT+ICRVVVZqSA1aYG7EZ52PyxfPGKZ5Ds3Xk4fI
	 sPUl5be5aH50BPLnK1+5tWomxPC+CEH8V3FaGxbdb7ucpf+7f7PHBqHGLLRXjmGVuBGQJ
	 tRleZ+9VI0gTuUjAM+s5OHUvTNhYbcu043e6RAb7fnWrqZdx9aTGcB9gbi+guOm/5M+cK
	 z4EBN6Jj4WQO/IBv316j6CZ/RRun8C8q7dNTvaUSE3h2XWL9/EeFbL08twUifUfxvcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uYsXVdni1md+83PijIpFoxA8BV79W4PZ5dUTF0szV4w=;
	b=mdWjzbKb9MocIM2uHvOSys6agnOxKSwleB87un0omlNfDIKcIJCgvkWrDIoGnZWHbbQu
	 1UvOgLqfdwGXMFA78vahif4E5+o+cvojItAT6uLTbYCa9CobsqlX/a8Icf8CFA1R6SLjm
	 ZrzhE+DYkYEwQocXAF0p3WPb6/N5CuyUIhxcITuDDEg2uUHQHBYEwHqh38NMdD8qaOK2j
	 UkUhnLmi3iGBHYQbHZmW7/16nduH7jpZ2gDKL8jfH49f9vyN5iJqY40fhoV48VQQPwEkQ
	 mP3eEsLp+RFp1D06npiEhnFCLl5p7LkRKDzq+IEVvmRrjmcDEM1MsLBWbZL3qc0Yr+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CxihBLMX;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1CE606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1CE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CxihBLMX
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab98332238so616730a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768471; x=1793373271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYsXVdni1md+83PijIpFoxA8BV79W4PZ5dUTF0szV4w=;
        b=CxihBLMXTDIBn+anE+uCpmjLkrvxoSA3hyKWVjlSCuMnuo82nEdfAGQ9o0g/3LVewC
         /z4P9NeXyQf/26phPZ6Owm4OtA82QnO3cLGAK8dJzvlbjmc8E3bUtzSayWycsUri4cjc
         2Jx+Qtig85c97pZBSfmyFJo+r8ZmNSV3WEWyjSJYr3EjMm3bJTP08G3os8WF9MyNZamq
         /ILCk4et44Q/wv7CrfgL3DJglK8Ka0BPmhZObrqCKNK8wO+FPPcCgNOYWKE4Qe0qN5Mr
         9xCd3Ze/SeNFBtI5Vzacce3fbucLfU1sAnDRUYGqnnikkvqiSGCYdH2fSb34Y0H359l3
         k/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768471; x=1793373271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYsXVdni1md+83PijIpFoxA8BV79W4PZ5dUTF0szV4w=;
        b=Io4yQvAbeX7wHURkLn/yX+uM/RS5C8Ju1MMdoAafSUmefs56sRlvQaxy5hdNutBarg
         ktj0KRXImUTFs1VVyA7EAAmAAkN6VTr80zz47hF4hEUrChN/f4ubtiJkScwf6v5r735I
         zT7UZ3rg6Nv7w3ay2iJoRpOxeXHkFrpj8CteKbbFIbcVhrbJ7bSmi2XeiKFyWbLbBSEZ
         ClYlJjz4CiTUPRkfPBwZKVjinndrzpo4QBy9SWWDiX/BEMwZpoL5PdviRQSn/mUOImQ8
         HDHAdKx72T+byXQ4OHtkW8NDm1G5OUFZE5vnvav9tQS829wOCnUkkPDKiKn1AtlhJOVC
         9HUQ==
X-Forwarded-Encrypted: i=1; AKwUvBycjPFopqMSKSNICDxIKkHkYhGT80PM5eLkAdHf74Ge3nl4zrVcHasFGktHsHAwtTThcuhYx3M+KeQTnAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdgz12Hgzm7SYCOIGqLOxk3orsc/raMDrRPKpjAW1S/h7XrwEQ
	QkIfKzZSAaOcQwI7Wp8YGFO/UUWQKeeaBFLswzVEbHMDu5EpZ+efpzSI
X-Gm-Gg: AYBFou2NC8GJXVjGaNEAaQ/UuI4IvHkGCXYZeWLZyiUNVH9F8RFu8H1sopkrwGOxnSF
	m80MyAkusQPA4r+gKi4IeN0IrEfsqusDhF5v9+Dq8L0G71A54fQMONaJ2QO2NieDicbZMdFJpnz
	M2IaZsYmrMIiNYK4z/9eVYjBcygTQxZ5/tWNLviXA+ti3RGUr0NGBSbbpEfK7ywf+BMs8g0LnI2
	iQHp/LLAYTRRLtogRH2w28jds+jg2oLDAYGETYZELaNjru44qA8Mrjmea7a5DpRelg+gqFkLWGb
	GSeaXmz5IDo7X7zk0NRK9JlyhRu/aB97hdRpH6QcBcuOLxgMGzYzeC3oj3TtOdq6E0h4hErm/xh
	27WfDAiLtHqF1P3cRZKkOr4GHBtD7xI+F3FEoa5S4XL1SchbaI3CDx4TKSh0Yt0AKpuzDNaz6GF
	iplo7aate+AVTkIiXGTkO6tRaY6+K0sOCjC1qAyBuGBtdl4vuH78tuUguPrQVsmW7v1HnIqI+LR
	XzqwG2MggRc2YtUWyM3GuATEAFkc5jKKzNUNrDhJEifqoyWMq53sXAiJUloC+HYtwSGE72rob4h
	ZagMhqE8WyhaHSJGJRM/YxBsoCRHinvc1IImvu8k0oujyogZRxwm/3TZAbBnbQ==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:2737:3392 with SMTP id 98e67ed59e1d1-3adce0d3dc1mr2276865a91.53.1792768471109;
        Fri, 23 Oct 2026 08:14:31 -0700 (PDT)
Received: from localhost.localdomain (111-255-192-187.dynamic-ip.hinet.net. [111.255.192.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd84c87esm590809a91.11.2026.10.23.08.14.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:14:30 -0700 (PDT)
From: Hung-Jui Lin <alex.lin.programmer@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hung-Jui Lin <alex.lin.programmer@gmail.com>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests: timers: Add a test for disarmed SIGEV_NONE timers
Date: Fri, 23 Oct 2026 23:14:11 +0800
Message-ID: <20261023151411.28685-2-alex.lin.programmer@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023151411.28685-1-alex.lin.programmer@gmail.com>
References: <20261023151411.28685-1-alex.lin.programmer@gmail.com>
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

timer_gettime() must report a zero it_value for a disarmed timer. For
SIGEV_NONE timers, common_timer_get() reported the remaining time of the
previous arming instead.

Add check_sigev_none_disarm(). It arms a SIGEV_NONE oneshot timer, checks
that a remaining time is reported, disarms the timer and checks that
it_value is zero. Run it for CLOCK_MONOTONIC and CLOCK_PROCESS_CPUTIME_ID,
as CPU timers use a separate implementation.

Without the preceding fix, the CLOCK_MONOTONIC case fails.

Signed-off-by: Hung-Jui Lin <alex.lin.programmer@gmail.com>
---
 tools/testing/selftests/timers/posix_timers.c | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 52b7289e1..464609b8c 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -496,6 +496,45 @@ static void check_sigev_none(int which)
 			 "check_sigev_none %s\n", name);
 }
 
+static void check_sigev_none_disarm(int which)
+{
+	const char *name = clock_name(which);
+	struct itimerspec its;
+	struct sigevent sev;
+	timer_t timerid;
+	bool armed;
+
+	memset(&sev, 0, sizeof(sev));
+	sev.sigev_notify = SIGEV_NONE;
+
+	if (timer_create(which, &sev, &timerid))
+		fatal_error(name, "timer_create()");
+
+	/* Start a oneshot timer which does not expire during the test */
+	memset(&its, 0, sizeof(its));
+	its.it_value.tv_sec = 100;
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	if (timer_gettime(timerid, &its))
+		fatal_error(name, "timer_gettime()");
+	armed = its.it_value.tv_sec || its.it_value.tv_nsec;
+
+	/* Disarm it. The remaining time must be reported as 0 */
+	memset(&its, 0, sizeof(its));
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	if (timer_gettime(timerid, &its))
+		fatal_error(name, "timer_gettime()");
+
+	if (timer_delete(timerid))
+		fatal_error(name, "timer_delete()");
+
+	ksft_test_result(armed && !its.it_value.tv_sec && !its.it_value.tv_nsec,
+			 "%s %s\n", __func__, name);
+}
+
 static void check_gettime(int which)
 {
 	const char *name = clock_name(which);
@@ -681,7 +720,7 @@ int main(int argc, char **argv)
 
 	ksft_print_header();
 	if (run_sig_ign_tests) {
-		ksft_set_plan(19);
+		ksft_set_plan(21);
 	} else {
 		ksft_set_plan(10);
 	}
@@ -715,6 +754,8 @@ int main(int argc, char **argv)
 		check_delete();
 		check_sigev_none(CLOCK_MONOTONIC);
 		check_sigev_none(CLOCK_PROCESS_CPUTIME_ID);
+		check_sigev_none_disarm(CLOCK_MONOTONIC);
+		check_sigev_none_disarm(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_MONOTONIC);
 		check_gettime(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_THREAD_CPUTIME_ID);
-- 
2.56.0

