Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E64ADD97
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405323; cv=none; b=IOwecMD7qHFaWOK9bP1eRVClkRaEU/8pDDHvW3pGF8tsvGeeTIG2WuIfa5tM62MtoCvHsunWhv4rVi2VR4M3Z2r6bepUSXI1nLEe5n6TYtxMoA3A3QBV96WewJ+xhOkVVRqbrBIOZlqlmiEp/slB/MavDBfg98t5NG1whV/F3sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405323; c=relaxed/simple;
	bh=8lkxY8VB4kF35ul/wNhFXfqNLiCHVxGVDwwZMRKLHx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=klPRS1EqO+761dDX35DX/mSVhjf8n4nYnR4kOFCw4n3zgf5s2zv8L3X6KXcaZ/OZln8XBxwpLAcGb9+g5a+AlSiV8RscbmQj8f0iCnZXhMfrS/bytgN6eccRn4wqXW8yGIFbrOAtsj5f1b55m9XSjSndx2d0WLgFiyrbgu7IML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ka/W2WnB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nb47D0Bq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ka/W2WnB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nb47D0Bq"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792405320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U9WaYfoEhN5xYy9+I1MrIAzFCyVWlRupL66Da3LpZuM=;
	b=ka/W2WnB54F8deGbfjPLJHm9LICsOEFGNpf876I3gAnyTdrbjBX0SqEMNpLuWJnKUm3Wt/
	jvavB4Oz7LS+wVDkBxduz+XpLXoGWunWgGyO4vo5BkVAKRPKyd7HbQWPw5UW7qcR8iFItG
	2fVYxO5IMfYg7KsgqJaqZn8KJQ2yugMIIvVPPZ4XY1937xK/o+7XOly4fZ+BlMCkHeHBZg
	DhfZ5msBD2M0fuR5JAxrHYs9jBH1Fgqc4JL52GU4EkCuStOpJgrwi4exsxohXVSCtpRevA
	JRYALKEeHeLM6FSJO5vBqafCHPS3x7EWE9ZED3Ht2mxA/rFbn58LFDGIm5iiDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792405320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U9WaYfoEhN5xYy9+I1MrIAzFCyVWlRupL66Da3LpZuM=;
	b=Nb47D0BqoU7FBHGxbY1f1UdhJ3STm4Rj4teLy9ZQWqTRHlzW1a3Fy9PNiQ2roUDfVjLrQQ
	ygVnZfoJohIXDmAA==
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
Subject: [PATCH v4 1/2] vsprintf: Don't leak pointers for %ps without KALLSYMS enabled
Date: Mon, 19 Oct 2026 12:21:50 +0200
Message-ID: <20261019-vsprintf_kallsym-v4-1-ffd3c012d00c@linutronix.de>
In-Reply-To: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

