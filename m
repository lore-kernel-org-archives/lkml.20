Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773990;
	b=wXn2bfBeGoOL4NtES65RgEjGgLhHPPFLDimXUY9gwwfnEmkHrIbd35ditYsyAzBVYw0s
	 6lh4HAk7XBtlOaD6tr14iuTm/NQcsOhIk8FB3VpidtMOMsgY29gQsBL8Sw7Dp9Bhdx7M4
	 ppzW6HlcK+4Ss9AzBt9E50yMHetN/CagXkhC/PlDbwiMVMFv4lt0yIx+OPzF38X+sKyKG
	 owmmaN4NwGN3kiM/SW/JTDE28TmOz0uf1K3S3hBAuajEsjtWQ8MfbezhVn9o0ZdqMXanN
	 hF1g1xET3uiqS+c5cp2br3esITtBMCO7P1bujCx+v5NtYfkWi4yUnaUOof10gcP3q6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773990;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+wykzsmGWpsXJYGuvhSKQQjdG0KETRqKr1QaFkAbCo=;
	b=hguTgpIlmqOa756yQ8lUjfF3NRlcj3leaFS9O2plVsch0YMVj5lDVNo9e23fGKl2BdYo
	 RZ9vtQc4KAVuNavKxa1kaReBrFOsEPfc5GJmiMNXzoqah/Dyg9bGQWR9R4VBa/6Xo1M5t
	 zcHVPtZYdLEIvqPGpIBjhz2osYGmf60GwA4xNGIWX1lTVWmc6KpzW4AqQy6Vsmcufrglz
	 3Hw9cRGdOZua0aFFs4UMaXWica0vslykaciM+qxQi+xVJamyV/B2h511rDrCASHrIVbax
	 njnASVyocpPPtEny1x2rZe9cuhTNn02iZzmZtVeO4BZ6a5u3O0sh6X4Q3aGiQSFmEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E81FxbvW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oOkm6WvE;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A09606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A09606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E81FxbvW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oOkm6WvE
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792773988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+wykzsmGWpsXJYGuvhSKQQjdG0KETRqKr1QaFkAbCo=;
	b=E81FxbvW548UhozMJZcho1KTUr40sCtR5ieqNH1x2woBVZH4dxq/EJU4i3J9Oq1CrXvyBf
	ccYrDkQNVm9Rh2gqJdQaMUodfP4bwO4GVQHzeYWuW2G9F4hAI9eg4YbHz5QAYDBnZRS/k4
	Ei+/hkShPsjeYZmW+LGo/JXkYnc2hvmMrQ1h6cw52x+p3tS0DKODNXFUr9aqVLTtB2zZXb
	6zisAoGEGUDTQysLnGbii0280dBjN46NNNiw2cs/siORFa1teIPv/9WClspteNUCHh8aG7
	Wj0CPeMDcN4pHsfZIrMujXu+LYHuHzTELCyCB8a/mOZ2zwivT5asNgBD/lEAfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792773988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+wykzsmGWpsXJYGuvhSKQQjdG0KETRqKr1QaFkAbCo=;
	b=oOkm6WvET2YWlDBo4BoV6adjj7Q8+sNb310Q17U90DBJTQrfkmutAjnM4iqZjagdahZzOh
	DzCwu8CMOmjiUnBw==
To: linux-kernel@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>
Subject: [PATCH v5 1/2] vsprintf: Don't leak pointers for %ps without KALLSYMS enabled
Date: Fri, 23 Oct 2026 18:46:23 +0200
Message-ID: <20261023-vsprintf_kallsym-v5-1-57ff92187c1d@linutronix.de>
In-Reply-To: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable

The "%ps" format modifier prints the name of the symbol which is more
valuable in terms of debugging and does not leak the actual pointer.

Without KALLSYMS it will leak the pointer which is not intended. The
default policy for pointers is to print a hashed value and not to leak
the actual pointer.

Print a hashed pointer for any symbol resolution witout KALLSYMS
enabled like it is the case for %p.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 lib/vsprintf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 1d95ab9314bf7..40565c857913d 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1008,7 +1008,7 @@ char *symbol_string(char *buf, char *end, void *ptr,
=20
 	return string_nocheck(buf, end, sym, spec);
 #else
-	return special_hex_number(buf, end, value, sizeof(void *));
+	return default_pointer(buf, end, (void *)value, spec);
 #endif
 }
=20

--=20
2.55.0

