Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940304AA033
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405324; cv=none; b=svB2RLyiHBxNxfxwJXBJNIN7cVgSW6+2T8tdtqyoxs6yDFxYUzPfmredIav0VbGEigYHWXnvC8L5TimLkqglC9qECk91rrqBgKHMr7h3mGMwPRfEQzm6iFMnm2HtFL/56x66G5SDsiUn1fdadbA9vckoBMXQn6U7p1cPtuwUT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405324; c=relaxed/simple;
	bh=kq+d/1pSC61Y2Grwrl4WA/2AzqHzzW5EnD/goKvKF9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H3XL5KhK2kzemzIfD4ZGYWiOpxETiAa9JvSSdtHfFTItP2XofRhhKPDxx61IefexR/8r3txaOoxfgqK61jVauABztFgmuDvD2KhOTyzxzAoDzDZ8HDoA3esxSaDS/X9/r5YGJYQjr3Zk8MINTomZTc3bMh9jbcHBaqTcPwlRyCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cSDN576b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0hqQiNbt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cSDN576b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0hqQiNbt"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792405320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SYzCdKkFLzWGg3TZRDpW9FkQ+nfRL9JiWR6v1KuO8F4=;
	b=cSDN576bVJ0Npa1HCv7JF+b0Wi1PL2y6B2hyDRL/0jlgSi2ZHKZndS5HxhSNdch3gK7lz/
	1ryriWde1zBFLYOdMCqzQY0+pC2mzNuvHPV8YYi6MdWh2G8a9uIn8bsJjhVp8RvfzTA73z
	5ZOvdwI5XVRaNfDtfN2Ne1emaR0UBG02Q/dTmm/d5XLDTp8+x35zQ/q8crORDfuQAqGbG9
	9cfWSoeB603xMBktuKRzabCSRkxP9vIutqLyFuwY6dV+30KR0OLGBum/FkbE6Z19LmdJpu
	NHqlsADoo9smPgxzfiLz9sWtYTYullimgX8274BjrjgCK/2P7ibhrpsusdiDDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792405320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SYzCdKkFLzWGg3TZRDpW9FkQ+nfRL9JiWR6v1KuO8F4=;
	b=0hqQiNbts+Yu0APB22md5g6WvLSjIk+1bwdt/bzY+QQUT0VyLwPYr8nqxUx+8ePqtos3Tl
	7gqU5tesvqAg64CA==
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
Subject: [PATCH v4 0/2] vsprintf: Don't leak pointers
Date: Mon, 19 Oct 2026 12:21:49 +0200
Message-ID: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
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

 include/linux/sprintf.h |  1 +
 kernel/kallsyms.c       |  3 ++-
 lib/vsprintf.c          | 29 ++++++++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 2 deletions(-)
---
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
change-id: 20261015-vsprintf_kallsym-73d5ed6f800e

Best regards,
--=20=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>

