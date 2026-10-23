Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773990;
	b=TFihtGhpG7QZ27X9fZo0qfJnAMOjMQoYSwQAyyojHrZAFAP8U9GgU8E677qt1w7y3YDc
	 pzpyTG4OQBsnqf6dbX3gI8BzPU//5PTv/gQGUcrM/zkERPAcCWcLoaxxX48AIm2800XE8
	 q86qjje6LuLmCDofo/flv9OmXetXwfDZAEWi1w1Q7e2Uy7muYvls11GffuFKXFwrylF/R
	 ukOxE8BxIYQNQGyfq0v6zqEZzKapFODC0vtga5IDliWs3vsomK9Ti6QblwqgjOFGlwViB
	 Zgb0BXhz64ayxJCnADLsrPgbZ1HvuCaluLlyMCEaa8ooze+sMqy4oPvd2LDuOylg1Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773990;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=i6cNxmmRpoBmZlYKc9D1fCRg1Eqsj80LMptl8k7fNtk=;
	b=rV4UKcy1+gn/7uN6lPKQdUYr+e2BcRtHAQaTc9sVzxd/NEBadZ7jb+yk40rLbi0zMNW7
	 mCao0qiu3nVSqhfFtm3iiAxTJ+2mEa6g2xszoYkkBMnXbu1zc4qeelRLjRi799hffbBop
	 8QrnRc2E+FjaGrasrdu5faacv1DnLsSXtpVyxg00N8ftYKvspv76OLEmnvoiWy0L7b/A/
	 ie6lQvRmaBrBE++opAJw7oe368zHKtDVWKlCCvIAEzS7wkjecq6K/XNA6xDygsvutrD2r
	 ihG4SpEwBabraCrj/yFLenu/d0Rzi8phiE1KuFDnEyDFrGhn86IMRIWwhorHzIJmBJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OOQdJa26;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=QJekDlWo;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EA606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C1EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OOQdJa26;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=QJekDlWo
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792773988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6cNxmmRpoBmZlYKc9D1fCRg1Eqsj80LMptl8k7fNtk=;
	b=OOQdJa26G5Sl3Io3oGe1mBmkNrZsOfjn2HUyuEKlYmYNfLL+ek239o28iQfnw8ullf9zq1
	/P4tmw9VKrdhSaoxRmyebnYWqRz668OQyfMtNhmCxc//JRzudnoeaQWLWhPKwHsvMlJY+s
	B88WMmzWHu3AiEc3Hv6s+kPepgKSRW6+pNMWCbcpSHHuesegZyEpfS/59cOeNTIicbzNIH
	MoMXbuwAtN7FZhR1Y9bV/7dO+YrPSRfL7sflkT/RPVRbpgLbper6b2/CjyC6NdU5XWy2N9
	vzG07Vs1aKJi8zYZ6YxgmOPXzrvG1hi6rbxOPMJ7MSktLoxxPCr/GWhfKrHuiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792773988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6cNxmmRpoBmZlYKc9D1fCRg1Eqsj80LMptl8k7fNtk=;
	b=QJekDlWo34nt/qNghDxRxAAEofbZFDlg/f1yFctsuWZtKYfoqkP210nNdoJt5ymnnFSny2
	OUS9iN+3ng9S+YDQ==
To: linux-kernel@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved symbols
Date: Fri, 23 Oct 2026 18:46:24 +0200
Message-ID: <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
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

__sprint_symbol() is supposed to resolve the passed address to a symbol
name. If the symbol can not be resolved it will print the actual pointer
that was passed. The pointer policy is to not reveal actual pointer
values.
For post-mortem analysis the pointer in the backtrace shouldn't be
relevant. In BUG(), WARN() and panic() related backtraces the PC
register will contain the actual value. This affects passed pointers and
callchain content since it is not part of the register dump.

Use %p for the hashed pointer output if the pointer has not been
resolved.

Cc: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858afd..6a3e0ded8df1a 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -483,7 +483,7 @@ static int __sprint_symbol(char *buffer, unsigned long =
address,
 	len =3D kallsyms_lookup_buildid(address, &size, &offset, &modname, &build=
id,
 				       buffer);
 	if (!len)
-		return sprintf(buffer, "0x%lx", address - symbol_offset);
+		return sprintf(buffer, "0x%p", address - symbol_offset);
=20
 	offset -=3D symbol_offset;
=20

--=20
2.55.0

