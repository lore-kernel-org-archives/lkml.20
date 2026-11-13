Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532047;
	b=O7WbvxWL1bPpAvLuqBhRzSL4BKRuuFSjnD7Pqv68EUzQ8OXZGTZTOf2afBW2ODiLpA0K
	 J48+a2IfuQnwAhO+m5KpDVXzf+refMwLP5S9mg1b2cjfuaZtNkf4qSsasODLjZG2rLIlI
	 upYjO/1Bu9DqGaFlVMYakl08awzzzy9n4AxCnpe3BvZHUKj45UU+D0QjGK+2FKKsa5216
	 zaqx7owmQb6872buvDglbkY/+sa0xl53E3bSDqlTk/K7KJaUGv8TzvK35Y2fh3nVHqVC2
	 j1pqi+kio3U0H2H4jA8Y/DvTf5KgiQK3hRpQpegVeBVmbi8zZVLhpP8WYv46y9gW2Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=72rQE8Og3nCRl/elXTbQpPdCGc/X7s6eyv03c5TXm1E=;
	b=4JXj/LGyxXJ2bgSZ8fNVC10Q/VC7ACC1QOrjPhXGxIb0aE5RLUNkW0y172GtIvm9Ztaa
	 DMH/wO0/slNj9SIoT02x9z2/ofioEQqaxHHsrb/+TjlAlRyNdBY5sFdQBGlZ2+SVj3auu
	 wbupdgyuZQ33E0yPrQ3elsC2En+Wl+S5Htv7bYjJVsC4WAKxmOLUmd7iugjbt9Yf0pg1a
	 NE7MZ4IPKalWf8sfKCPBrXEAZus3czIv8M0QoGLXJHKecgF9L6rBIxmP+wFeoLzdlR8rU
	 tOmZS9BHKDKPWB5a3Knuz/ijvkwU51yQooLBqOFCT7PMFytlkqYOMkxVHbEgbGOl2lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQUlPy0v;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D260A261A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30D260A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQUlPy0v
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acd239776cso5240351fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532045; x=1795136845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72rQE8Og3nCRl/elXTbQpPdCGc/X7s6eyv03c5TXm1E=;
        b=OQUlPy0vx6CcGtdaEoC4ZzAuJLpXkM4wlajkcs2qP58X6urrCnT+8Q7NTXhGc8mYzw
         d7tN7w4oKGzDmItizvzN7jmbjEUoxvzdJ9i+lzNGmeNbCP1SfPyIbecGvC504TniEeUk
         kbHdc69GU/DGY2StNsJ8myojUrFbAY8habOBxDCdA1SilNVUBiU5vl0gHe+c3m4oqw/N
         nD8QLbOWody2KuLcnH9N5b93zFUeu0lDsCQaepZ8dFqKdguKTO/AMJVmBcHsGgOClojK
         4ecHNMUf+4x+3Dml/FxOIF2msdb7vPtjyUCgcn12XcPTbX/UDjY82NBQsaEp0LcwD1sr
         HVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532045; x=1795136845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=72rQE8Og3nCRl/elXTbQpPdCGc/X7s6eyv03c5TXm1E=;
        b=1AFwnwgRnA92bJuM7DaB5amKqpPhWpuO9rrvTbeCPfJn1FKNNE6eNKhw6ykbn1MElu
         NuiuJhlCiPnzcj0dhREKU9snxJDEiXK4CPXqG4Bg3XfpuFBDg6xCBvxJ76M44aCMmgp+
         qoJB4pt4SGo0v94Vl0oaxCsOPmlNOXMXrcNB889IM9pMWSHVUJpG002Li6sFq5BYNtIg
         AvwW5cqSJJYI1/y/nKCDd6+Zu6qqfTyawlmN6AgtijMR30JQ5Fty30quJdSblMGzukCy
         IueppEC5GL0Y4Hci7ELpci+I6m3Nni3APCJeIs3JSHho1UngIEzg8o/WdNDobMsGQsOz
         SlWw==
X-Gm-Message-State: APuU4Z8MGGAn7n2SZbEczQYIBgAQTC3ch1sECXhz1creEdYBYCGU0Voc
	aLNGJTMKOMC7Yw6JXbrWrjAQB8VTS0WpjSj6+ryH1hiZjsC5L3i1WqgL
X-Gm-Gg: AYBFou2XKGrcvcckoYLg/qulquItkqznf2RIa6UxgKqUKC/L01JygJLjgYg9n6qORxd
	jwA/ycIOeD/YArRWmNt4GExBdfac+IQg1tMO8p3PO3JhAQ0RyFsCx/hOWNic3enFLavjYBtC9M2
	mnARjOLCvpDwjc6YQFKvhuxL9Yy94D/e3AXnM11UYRWF5bWcAkKO8TV9YXutfEDzzHqs0DvPkaz
	0G1aRll6516o3EYmlDWh2gxT6z4moeSFC+XxsxB4Lfz1DqYL1necD4TQMWQTaWLTTZqRtandaRl
	7B7mAQgfyjsmAB2TJ9yxGmN7MWZp+13SkjDuq5tKN16wAs8RLurb/+EuZoDmXQC/DZNl/4HW7yN
	rzewt4WRPhz8TWPK4MYYnkgGgc9tZyc4hahi6xeplGRRQUNdn/216OT7W1bN8dHX94YSwrsuBIf
	JxYZi3Ps9Z42Ul7oVhMcbPmby7gQZ5I+8sRq7sqOakP5yxKlDxAjYMZ/cQV7N6ocBNhrfH/JepD
	Z26t3QoOnfpUv3rGnYIBQVlNsBP1dcL4xvIRyh6AM3keLuaG/R9NYUiAf7d5smU1HP+WXlVKD8x
	0eFO6UKujzS7kVDa0R+PCZnYepigOGyWsPZNMhjEcgJsNLiurpT/mZDDaqKispUA34bPRb2AcQx
	pewgdiZapzA==
X-Received: by 2002:a2e:a105:0:b0:3ac:f350:cd66 with SMTP id 38308e7fff4ca-3ae2b522034mr3240131fa.20.1794532045076;
        Thu, 12 Nov 2026 17:07:25 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:23 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 09/10] sched/preempt: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:14 +0400
Message-ID: <20261113010631.139191-10-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/asm-generic/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index 1adddeab8..fc0da591d 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -93,8 +93,8 @@ static __always_inline bool should_resched(int preempt_offset)
 }
 
 #ifdef CONFIG_PREEMPTION
-extern asmlinkage void preempt_schedule(void);
-extern asmlinkage void preempt_schedule_notrace(void);
+asmlinkage void preempt_schedule(void);
+asmlinkage void preempt_schedule_notrace(void);
 
 #define __preempt_schedule() preempt_schedule()
 #define __preempt_schedule_notrace() preempt_schedule_notrace()
-- 
2.56.1

