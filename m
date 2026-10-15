Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAB6524B14
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080426; cv=none; b=ftKNoFk0jFHQ1Psk2SEY7fsD01BS8lzYDMfdZn1K/h0Hl73NCYh6tvmRRpJqmfptXhaNvRg4Pv7wYsfNzmKN25aeVeszJ/XjuGuyge72kukPCogRideiuCfrkYKBCnJ2wL5ZXrDWfEW1NCMzpSQLAp6mlhexPOXy1FVVVzDVeCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080426; c=relaxed/simple;
	bh=cgzukAc9Wbn+afAesZp4FrqrR57tNf1rIQwqHfU+Zmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=innp4xNCFhB3mWbqsuFiVV+DZRcQ/vwQh1hmI8ku3uNKEUVFewqowAicBTDBd1+S9PPH7JUP0fbQbfSBz/fwLArLJ0YPNw9LBLAnjesFur7r6Jc03YRT6AyvOH3zi+ruDswi7BQ869ZHPQEw569HCkCwggYGklccI3rH4vJzM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IcfjdtaJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dtQxfRiO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IcfjdtaJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dtQxfRiO"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792080412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UzV3+yxSJYix+P3p0zfv2cPKeIhE5EjBIUBKuaxC5KE=;
	b=IcfjdtaJjFR8go+F1rLsfNqWgWXpwn0QG0CVnU8DV2e1X2MZ/ignlL741h3Oqj/ls00BwX
	TtxWAabOHWPCShbNxD+Dr1hZotaliC9nV4p9d3m1n2Y172Ni1I3ursM0O0daAeLDBmDFMO
	URB/RIc9OCXvl2KzZq0aQ+Ox7yr0WT7JimcD5hd5vtunewy6TW9BLEUBBY3A4n7XP8dZZP
	uraE+PUS1e5ncemPTdkwGPWgnlkRK1PgJtq6Lm6ezS8sywdZVFPjCyH+62ZCM3Rc5hzkeL
	LLyqTTmBXWTpx5pfENTTe65CtkMgSoNCRgFTkPgau8oZNZUOFYljwhp/gcj1mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792080412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UzV3+yxSJYix+P3p0zfv2cPKeIhE5EjBIUBKuaxC5KE=;
	b=dtQxfRiOwf258V5fd79IfNmOpDoI3pIq5b92YpbRFuuqvHc+3e1V4QD1gykRp6qWIWlXKD
	isFkGbzgJqbtG0Dw==
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
Subject: [PATCH v3 0/2] vsprintf: Don't leak pointers
Date: Thu, 15 Oct 2026 18:06:47 +0200
Message-ID: <20261015-vsprintf_kallsym-v3-0-c175c27f38b7@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

 include/linux/sprintf.h |  1 +
 kernel/kallsyms.c       |  3 ++-
 lib/vsprintf.c          | 27 ++++++++++++++++++++++++++-
 3 files changed, 29 insertions(+), 2 deletions(-)
---
base-commit: ec8bf8280261294a9b9b4520414b42704c7f9f6b
change-id: 20261015-vsprintf_kallsym-73d5ed6f800e

Best regards,
--=20=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>

