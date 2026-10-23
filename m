Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773990;
	b=vAzqFmc/6lNkXiLEOZmNsy7YLqyqkOwfzN3IIURl+HNiREvrBB74SXGX6Hf0FTa2BMhQ
	 d3B58YUcqmYECf/uepH/5f8MOMVTw7AlxrwUgY6hXW2ot1JR8lFm9R+Aensaw87aIvZLx
	 a/ViK2L1+RtiPhR0x7EtB84+KX9oF6tfw17xEb2pbPknD1zvfeGkxk+ELTDEUH5RWvrsx
	 69gnxhGeBk4TQJj15eRUo9iwuNShZD1hjQoTc/PCe978tgs2Ha1wPz8I7BPxhqrgNUG6A
	 Sh+9L/Py0brZgrSx1RNRXlluNqoDoKKhWIttFDBbWvtCUThGpzkrdm/0qSeFhW2COZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773990;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:X-Change-ID:
	 Content-Transfer-Encoding;
	bh=6CNlgRJI8T/s5LhOkBQ3z8B0TsUKvZCwDkXcJPYkaAg=;
	b=itsUGubVwahkeP1hxi8rCFr8I/RD+USxhcjexK6ucJ2oQcDf8hvqVjO5eIZc+Oo3yzdZ
	 yd5vfaPvPcgJDGB9kopsW+47wYtSamAOR4/QbvmqpLWyhdVbX3qSG3W4KjXwLz4FIgD6O
	 Y1RvDMOgjfUUh8uqUbI7LvGRr1uj3ihffX/zFrYnUWsDEDJiKomAB6pf2+yk4FXAbTwaF
	 ic1Sgx1/PbkethEMzEoQ76hsEIC2UMKM7QybIAofUhnGpha2tTFYWggfmX8IJjJK0nUza
	 ODpBu0sq9SiqPj2NYVcBHPQRBcDWt+lfiB42T4pwMR6hzTcVMFPPM2d+6hDwIZscynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fxY0NUOh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uxtbX+fI;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D97E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D97E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fxY0NUOh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uxtbX+fI
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792773987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6CNlgRJI8T/s5LhOkBQ3z8B0TsUKvZCwDkXcJPYkaAg=;
	b=fxY0NUOhwL+SPvDC8oZplEEQn/GQ0L3BRFnDe8/Dc5iG3GE+MhluMiaGkDE/W01CHf2Vev
	N/7Qr3rCp4KWCgOKdamX//m0vU2YKryMCSJbBD4lw4Fi/0TDF+AAjKvfX/LdBu7anNMUY+
	cQQ7zm6yIMidS6CLjYn4B3k26sW11MeIROGKAplJrtWLTeF/U3tgxEYDjp4esmMckOvuvf
	ZhLLhLOjIMsC7JGDkJuyN1Hoewr3W+7EsVWP/Gy8LdMyIgT0nizfRBSLPCBJi7HJkYlRV/
	M2eVf+nbCvgf+WTTOSMZTdjf2ZexMrGs2FwkPmhGrvCiGNuBgyzZNhaQHS6A5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792773987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6CNlgRJI8T/s5LhOkBQ3z8B0TsUKvZCwDkXcJPYkaAg=;
	b=uxtbX+fIHEbm+gTqTREUAKATtGcx2gmbCxOpo80Nrl9trLoyxo4fw9gfg0hMKeHw+ccwf8
	rMFOwCBAYsvUWUDA==
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
Subject: [PATCH v5 0/2] vsprintf: Don't leak pointers
Date: Fri, 23 Oct 2026 18:46:22 +0200
Message-ID: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
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
X-Change-ID: 20261015-vsprintf_kallsym-73d5ed6f800e
Content-Transfer-Encoding: quoted-printable

It is possible to leak pointers via %ps without KALLSYMS enabled.
With KALLSYMS pointers can be leaked if they can not be resolved.

The tiny series has two patches, one for each issue.
I do follow the %p format instead of printing "(unknown)" since I care
more about getting it out of the way than the actual content (as long as
it is not the leaked pointer). Last time the discussion added the h:
prefix to a hashed pointer to identify it as such. I would like to keep
this part out of the series since there are few users that expect a
certain pointer width and adding two extra characters would break that
(we could strip the two 0 on 64bit but again, not related to this
problem here).

v4=E2=80=A6v5: https://patch.msgid.link/20261019-vsprintf_kallsym-v4-0-ffd3=
c012d00c@linutronix.de
 - Use %p instead snprintf_default_pointer(). This might recurse back to
   vsnprintf() if used by '%ps' but it already did so. Suggested by Petr
   Mladek.

v3=E2=80=A6v4: https://patch.msgid.link/20261015-vsprintf_kallsym-v3-0-c175=
c27f38b7@linutronix.de
 - In symbol_string(), !CONFIG_KALLSYMS case, use the 'value' argument
   instead 'ptr' to consider the '%pR' case. Noticed by lkp@intel.com.
 - The kerneldoc for snprintf_default_pointer() must describe the 'len'
   argument instead the not existing 'size'. Noticed by lkp@intel.com.
 - sashiko noticed that the string isn't properly terminated if the
   input buffer is too small.

v2=E2=80=A6v3: https://lore.kernel.org/all/20260821152614.2202196-1-bigeasy=
@linutronix.de/
 - Instead of "(unknown)" the hashed pointer is printed. This follows
   the generic %p flow.
 - In v2 I argued that it is better so print the actual pointer instead
   hiding it for post-mortem analysis. After looking at some backtraces
   with invalid pointers (not part of the kernel image) I realised the
   the PC is already part of the register dump. There I changed it back
   to what %p would do if it can't resolve a pointer. Again, following
   %p flow so it can be overridden at boot.

v1=E2=80=A6v2: https://lore.kernel.org/all/20260814144854.746840-1-bigeasy@=
linutronix.de/
 - For %ps and !KALLSYMS no_hash_pointers is used to decide if the
   pointer should be written or not. This aligns with the %p policy.
 - For %ps and KALLSYMS, unresolved pointer continue to be leaked. It
   has been pointed out it might be useful to see them in backtraces/
   crashes if the return address became invalid.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Tycho Andersen <tycho@tycho.pizza>
To: linux-kernel@vger.kernel.org

Sebastian

---
Sebastian Andrzej Siewior (2):
      vsprintf: Don't leak pointers for %ps without KALLSYMS enabled
      kallsyms: Don't leak pointers for unresolved symbols

 kernel/kallsyms.c | 2 +-
 lib/vsprintf.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
change-id: 20261015-vsprintf_kallsym-73d5ed6f800e

Best regards,
--=20=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>

