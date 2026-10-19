Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443238;
	b=m7YNpLPLUW9Ez1W2PdkZNJHXAoh4T4JOrc1vLtUpcE5bFTAoYoMdDEl2yIT+ix56Zv3C
	 KiYbamTkFUON5E5JL47WZt2kvhb+q71T6orklpzR+h/qXPEQno9SmPniSWmLPCCVGgpIA
	 vb9tUUXNgKnvDFp2cwwArH40qjTqIwSaPW435nYEFFsr88HgrTgWK4mnEjZbSXudp/+j+
	 XuqcfJFlAxK1HWJ/3W7mA6cuA4JDGcOYY20iCk8wlJQo073H6SkgMIWiijhtpvRZWY75b
	 YfFn8OGw7RAkrvnoj6KJAMVE7a1SBLabbRlBnEV/eUITQEcxuRTaA6AwAy9K06Ji3gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3UMhWt/QgHcRUjdVi8h4jSpXWub0rW3/KKBGP3rs/38=;
	b=DOeIKvXnZ3ACJoSAAZNdX9vug4ww+KBjKm0Aq/J35DadFkPIYL0FPYeMc5qzFK+0V9+a
	 zgKkMX8s7s5FnlLs84aARkA/8Pw6iqLndi++FcY8TPnbCxly0qdkB3eSxEGoko60tpjR3
	 McUerV8ucSSsALd6LMe4zha29HAUhcl+/M3Yr0Xmh3Sd5DQpBEkjEv5KuOzORi0FzH4yO
	 iElJ7+TwZeCFdv+7m+Lgf0SpFW/OXQ6cW7T2eV3/v2OAHKPBt23Y8fAOecKNKkKWF7YCV
	 PTk20Mt+lHceC49d/Otll/CrA53lE/CX1pw3sMWp/vfPFsbpqW5veF/x2ZrbEUti9iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j5SOb35K;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706B606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6706B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j5SOb35K
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so11305685e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792443237; x=1793048037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UMhWt/QgHcRUjdVi8h4jSpXWub0rW3/KKBGP3rs/38=;
        b=j5SOb35KARZVJSFGINw9xaj3iZQ8pT6spC7uG30JyP8l0DG6nUVnB+YaPOdfNwIy25
         fX8WkuTQGswi5uSTok68RdXwSjGdVlgnhSKMkihiLHgYCKPSN8i312E+NYxEHV9NgX+W
         ynsIF/bRR2HP7XEdnX+M69QhdRVffcZoihOFrpVZol5rMY6rlBnaw3zUUvNrUYwzIeiy
         SNgZS+qKPRLME13PklrZ/MDBusy25ZKdxDQkYYfbzhS1yV3vc9G20y1x/AYuq5tmrmLX
         Nw02FmmmP4N2thWZqS0WWdhI4xRAzsMEd5a5CSNfcLb7AQ/SkKC3vvlKl47bnhH0CQtM
         p7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443237; x=1793048037;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3UMhWt/QgHcRUjdVi8h4jSpXWub0rW3/KKBGP3rs/38=;
        b=TsagXZAP45IXhHo4CmjBF6QReTpfbf851VBZsY73Hwpj/NQAeVGpwhfr8imCsCT4mq
         sUdUqNjKd8Tp1Y8TN+qqDQGDdA1CYzFkULwC9YF1Ir5R2V/j3+oE6Ns0JSIqwkzcLha7
         0A1yNaYCPHcSVEWq7KZjLtxy0iPk2rXRXHP/8DBuusPpCIUn8o4cQQSC4rPIKKXgkXE5
         AzXiT5144J6PCvQ8uYz4v+pOeudmEI7XX625GCEwLIvUHIeLHg7WIO7o/jIDcHeVzTxQ
         4JFyF2fhDCfcvgEIguoz+fEE3E9SAzBwZ9QyJF2RIaZt+hCBKjDbgRQmcTPuwfIZJX8N
         Vsjw==
X-Forwarded-Encrypted: i=1; AKwUvBy4tbEUq4acgBCs7r9EIBAfxcUHwnKDn6d+lTmDOn9d2jeaFT2QFUguUf3vG7fvw2fI8E70i/vv2nCBSoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2cBd1YJ2Q4zx8IEPPuqVibSCkLoKDSahGy2apu0YS6fEMzL3Q
	uhuckyg61Xs7LJ8ZbX++BC4LTgnIZeq7BFJwZBHGXD5Uw2J76xQXVZ7zMR7cRGOQrDA=
X-Gm-Gg: AYBFou2pDkmjYkgtqh58VoFLy6svJiXTFnJV3/AuzcXQOt9fRuMKp4PDsOi0j5ouwOI
	Y62Wpv2XKnyw7IojMp+fW0V2gVIxZfi8Atv3/uelK97/S9zUzDzzstyf01WwiXzTaumMXnhfxqn
	wPWaajOnB7gd2NLCk/fIOBmxEr6fLHmA1EqiHr8998JONQ0w6qj6dzxToucffZhwdKgMWwlYVwf
	4Uxz/7uxwiiN+betLpo2ADvqEWWOFSo4wrw5JDL3luUq1Pw8mUmEu1zBtvBccel1JR2ymC+E9gl
	VnFMEsA4MX+v2UA3XSiPlY/GQ5PgJwkfZbpQBfPuhXrWbRQZYKG8Xqkf/7gU+YsFhr/ZT8fLBH/
	Ut5FPAJRIkUnd/pNrM/jnClGwjo+XnJmMiHsOmmg4F0ii7v5RwV/ssIxpgqQD4Ah4y1lPWROBVx
	zbDHbdYjJEebsp5lyhq8ih4ssXBic2lL89P7cQ6A35pBAaJ7jdZl5gTnyTSK3fMnqRjmoQrMU18
	JBk+5FFpEk=
X-Received: by 2002:a05:600c:870f:b0:4a1:f57c:381d with SMTP id 5b1f17b1804b1-4a1f57c3996mr3875215e9.5.1792443236710;
        Mon, 19 Oct 2026 13:53:56 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f3833f93sm6406175e9.3.2026.10.19.13.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:53:55 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH] tracing/osnoise: Add __printf attribute to osnoise_print()
Date: Mon, 19 Oct 2026 22:53:44 +0200
Message-Id: <20261019205344.190022-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building kernel/trace/trace_osnoise.o with W=1 triggers the following
compiler warning:

  kernel/trace/trace_osnoise.c:96:17: warning: function 'osnoise_print'
  might be a candidate for 'gnu_printf' format attribute
  [-Wsuggest-attribute=format]

osnoise_print() forwards its format string and va_list arguments to
trace_array_vprintk(), which is annotated with __printf(3, 0).

Add the __printf(1, 2) attribute to osnoise_print() to silence the W=1
warning and enable compile-time format string checking for its callers.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 kernel/trace/trace_osnoise.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index 0e1265acd1..995da9e0b5 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -83,6 +83,7 @@ struct osnoise_instance {
 
 static struct list_head osnoise_instances;
 
+__printf(1, 2)
 static void osnoise_print(const char *fmt, ...)
 {
 	struct osnoise_instance *inst;
-- 
2.39.5

