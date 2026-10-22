Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701744;
	b=5fksoqdhR7amzZYR/LSvc/ZtdfanwO2U+K1L3flsecRjsW4f9Td+rxtEEJzo5r/yLhj6
	 3xrUwH3F32eOcZ6gGdYD65X+2iON+5C4g/PuQgtr8BIu8f9BB5YZSis6ijznZHO7Mpl0O
	 b/RKllLUjeE1swHQCqScOXyFY4kdXqE81KPsgD5Mp21AhaGHciZI/j+kg1ujhHKoBJe71
	 EJT8jVa+Ul8jcJo299YUEfZkl5UoXtyKwfQbZhBpE4Nb7kOPcpF1ggdcevZRo90Kgk1cH
	 bF5h067UvVYlJxyg4gI+SGw97N20frwIX65VUba0u4twQG/1HmLeMSwVqHrTWQ2xJUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JhXZAj91SNuMu9he9BgFHy/gIFPKUvXivW06Udy0qjA=;
	b=o30unnlckXP6GeUflV5GLkMP8AzlLMl+Vv6sCWAp4feOMzH7010D/fY74OzzxdPI2wZ9
	 mdksICAqry3idx0IDihawgxvYXywoeH7T/e3YszZI9mBYhcvNFr2U3FqRsMEankNtPs+I
	 /V8x8CdWEwTzNRpKeuOeIGPysQTALRzAlUFKIz9xccfdVES52DOu+JzmDyuSkqrNgz8e2
	 p8c9nlL6lnlcFfHiE+IgYH+R2UhMpcX8jwBjQ66dkdFLbGUNXXnZgUm5bZRUAoNqDxxXN
	 9azG8Wu/dWIGshyxyK4wzAIm5p/UDb2WUdFDd67bI6UsaNWPEWBp47bYsCNH38qMqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXETzTLY;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03617606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03617606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXETzTLY
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d870d54so124443f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701742; x=1793306542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhXZAj91SNuMu9he9BgFHy/gIFPKUvXivW06Udy0qjA=;
        b=RXETzTLY07AsvZwWvneX90vtGwd7RsrE4SOu1HSjw+tA9JENKVIDQLmNDoM/bM4ERM
         BxOkfGwg3yiih0LofnWs2eptL9+l7j5ZLPhMK/DLu7zsPRO0wxeeGSdjdfnsnKY1NaBx
         W+sXX/BrmAWrJt+MjLoB9tdSUw8xFALnLMPPbwwajzZU3lO2bAzqp6GMkzOkdkmgwyE+
         fQw/1lcUyG0Vf7REq4AE/xX26rIvudWdTLW8PPFaOZdyM51dFDN3wMVDNk8iQ9qSmGBV
         evxzrbks2K50g7cAm/5qe1bkgmnoJtPXJYSlGPYYMuf5Emd2pyEwxP6PgbDT/qimQUQG
         e2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701742; x=1793306542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhXZAj91SNuMu9he9BgFHy/gIFPKUvXivW06Udy0qjA=;
        b=TGPXvf41UjWSESPuXcsGOWX5DGMFCqvmnubio8hcMD6HT4yZ5+tUQvJN1l9dTHqN8b
         /oN6uSPBuROnt/Y2wdx46zsEbhwralemPqRJPDTiCUXwxdbpuOVRawjMyLgqw2BBT1cJ
         Fs2fKD9QcuE+UcSbBlzMj46T1YWsd0g9rMVFDa/aUEKre4lvrq6sQgJW9/3duc9rusM9
         Edr801I+nh7oYUlpQtAhLxYDV+rr3pXAao4nb6Ynx+Jk6E2t0dboUl9Q1yeDA6vIsVg+
         OZZpvgTqN6PqCzW80oDEWF6XfYY9LdsTZ5IchOER8fyt2ZjrhzueceIeisftj/7c0e6O
         lwVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8F9GecJuZ7poulscAC/3n/s6EsvrLj8WW8SIxLFtgqIM8AD5YKBURNronNi27I8lYmAkvU2dHIe+n2Lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+kDu11PzyZK9v1dVAhl4H1RA/ku9nZKJbusVrSWasN8rMPlLQ
	sWEp7S34Nq/pXfONGBU0QLqJb/qEn6Um6fW69sBTjf5/Ww2k2Xjp0ZiO
X-Gm-Gg: AYBFou3uUUeDlxzdKFcMXmZnpGREVrjHZjpU9MSpRe5uHIrpX6tPN8KKqs2VQf+FO1+
	eqwg1VfxtJzJSfq7PZSfrz1XPrgQCO2idEc/QhLoux2m42ePbf+OWrARx+dTV3oTQOnAsQhehvs
	k/gIB/0mFw/pYRqTjN/5u9Pj4+p6nMIYYrkbVoRmVOh2fWAZJsW0CnmfB2Qu/7ZYpKgjGyNff2w
	Cpf9E5NGLmUodRJfQUdHcszmzUDlDC6jycf+Bs7LPzc5TjpPmkWe+wRFev9YJVlVN2L1NYIShnX
	3hIhlEjePseK4MwO1oBGNVrRA+W9wMaAMM+kK91XOWN9mF+JWkCrmQAS1wspK5s7VxCR2kqY1Cq
	WRMRcrT9e0RnX83atvcFqod9bSy/fbu8oQpgyESvx9HuqFgZJX8Y4datHsRRStXCQCSmVEI9O2x
	hUARVIz1z2Kq3nMkNb/PFECvYYFneHtlNQTK+hKxjhQd00HuPcymt/tHT+mHu/k5wdNFpMdLPJQ
	I/vwLuhEE8DEXwHnJhcAuvoc6HED9s4NzimPiZ0uNxcDoWHFaD/3onUW5mHvCO/TCX2G3gDisiL
	veC6HUx48ZYM4fo5uMAyUdrBDD7JHImLYVTdpWI+
X-Received: by 2002:a05:6000:29cc:b0:488:8850:50ec with SMTP id ffacd0b85a97d-48e264d4203mr8976716f8f.46.1792701741736;
        Thu, 22 Oct 2026 13:42:21 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edcf9csm476853f8f.4.2026.10.22.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:42:21 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] tracing: Define common event fields before enabling boot events
Date: Thu, 22 Oct 2026 21:42:18 +0100
Message-ID: <20261022204218.1222647-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

event_trace_enable() parses trace_event= filters before
event_trace_init_fields() has defined the common and generic fields,
so a filter on common_pid or comm fails and the event stays off until
event_trace_enable_again().

Fixes: 084100a1b579 ("tracing: Parse filter from boot event string")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index a1ac2a02f4e2..e52351dd0e5e 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -5022,8 +5022,8 @@ void __init trace_event_init(void)
 {
 	event_trace_memsetup();
 	init_ftrace_syscalls();
-	event_trace_enable();
 	event_trace_init_fields();
+	event_trace_enable();
 }
 
 #ifdef CONFIG_EVENT_TRACE_STARTUP_TEST
-- 
2.55.0

