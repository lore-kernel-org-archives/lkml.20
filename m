Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06F366051
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405324; cv=none; b=KRE68C1fCO2TnT5577Fg1I0bEB6n2vlctNLc38VrHzNVD/3d6xjX+0iD5anE0amrYBOilJob6/BjBsdgSGUgKszo1p++9zXh0E6TstFQNQWGd3orvCWcvFZloH+hfCJfeKjceLyKEPm9Ic6weqmvax2Azs5LQnmSqOyVEpPHqM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405324; c=relaxed/simple;
	bh=dB+Z76TjWihbHOMW+5Zh44FjxfCe05vm8zRO+qBNozw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h0LYAjys5Ed6UlCBdLDDG9hUAvYoQr0niIUUsS2t7mXqTEQXuV+3TcAF3+QXxNmGB5lK0YE622go/SLc8Soo8s+br5t4TAHCm4nDIKRdyYFytOfECTlGBFu4Hl2+leWc7ZiNdFLrUMULVC+XKtLFUtEGFakeaBbzcrIUGeutC1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kCpo4tVR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VBHrn7AP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kCpo4tVR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VBHrn7AP"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792405321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvvJCCXRGCZTklVGMMULaouSi0UizkmaEj/808tYFTA=;
	b=kCpo4tVRb/fMdxMExtm+SMtnLMG8Zp6Z10Ej9vRod7voddav1FIUaei7nanXaB6zU/Xvpo
	r3fT0Jsf3RWb/Qwf8SyaU2KSwAjUOcARCdhKkGeD6zI27mlccdIPMvZ62CHv4lNN+h/5WU
	Roryz2ELJnjpwQ+lP8jnmbjIqyUSbfiH0r93pkvcowp9qIsK8IDx7Bo0/3+KesACDbEZz/
	W090VzV4K/q3188SV3wdXnLOzAc6d/V0yAylDxDgNur8VJ/Cea6ommxv93GNcvIFtI7c0r
	f/xJsnz/c+7zYcOEowWJVQefts13joqcMmwBGSz0HvXRxbVz8EQPHHi4dloK/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792405321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvvJCCXRGCZTklVGMMULaouSi0UizkmaEj/808tYFTA=;
	b=VBHrn7APA8VFE2+SkQcWhjTdxpMR66o96heeK6yEAwOKhofRPYn0hifrTnOTinoyAjZRWd
	6t535kNnAWnDcXDQ==
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
Subject: [PATCH v4 2/2] kallsyms: Don't leak pointers for unresolved symbols
Date: Mon, 19 Oct 2026 12:21:51 +0200
Message-ID: <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
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

__sprint_symbol() is supposed to resolve the passed address to a symbol
name. If the symbol can not be resolved it will print the actual pointer
that was passed. The pointer policy is to not reveal actual pointer
values.
For post-mortem analysis the pointer in the backtrace shouldn't be
relevant. In BUG(), WARN() and panic() related backtraces the PC
register will contain the actual value.

Add snprintf_default_pointer() as a wrapper around default_pointer() and
use it __sprint_symbol() if the pointer has not been resolved.

Cc: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/sprintf.h |  1 +
 kernel/kallsyms.c       |  3 ++-
 lib/vsprintf.c          | 27 +++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index f06f7b7850911..596c73a57371e 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -24,6 +24,7 @@ __scanf(2, 0) int vsscanf(const char *, const char *, va_=
list);
 /* These are for specific cases, do not use without real need */
 extern bool no_hash_pointers;
 void hash_pointers_finalize(bool slub_debug);
+int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr);
=20
 /* Used for Rust formatting ('%pA') */
 char *rust_fmt_argument(char *buf, char *end, const void *ptr);
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858afd..5d51c825c1e71 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -483,7 +483,8 @@ static int __sprint_symbol(char *buffer, unsigned long =
address,
 	len =3D kallsyms_lookup_buildid(address, &size, &offset, &modname, &build=
id,
 				       buffer);
 	if (!len)
-		return sprintf(buffer, "0x%lx", address - symbol_offset);
+		return snprintf_default_pointer(buffer, KSYM_SYMBOL_LEN,
+						(void *)(address - symbol_offset));
=20
 	offset -=3D symbol_offset;
=20
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 40565c857913d..b2ca1d195bc9e 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -849,6 +849,33 @@ static char *default_pointer(char *buf, char *end, con=
st void *ptr,
 	return ptr_to_id(buf, end, ptr, spec);
 }
=20
+/**
+ * snprintf_default_pointer - Format a pointer and place it in a buffer
+ * @buf: The buffer to place the result into
+ * @len: The size of the buffer, including the trailing null space
+ * @ptr: The pointer to format
+ *
+ * Formats the passed pointer the same way as the %p modifier. Does not wr=
ite
+ * more than len bytes to buf including the NULL terminator.
+ *
+ * See the vsnprintf() documentation for the return value.
+ */
+int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr)
+{
+	struct printf_spec spec =3D {
+		.base =3D 10,
+		.precision =3D -1,
+		.field_width =3D -1,
+	};
+	unsigned int w;
+	char *endp;
+
+	endp =3D default_pointer(buf, buf + len, ptr, spec);
+	w =3D min_t(unsigned int, len - 1, endp - buf);
+	buf[w] =3D '\0';
+	return endp - buf;
+}
+
 int kptr_restrict __read_mostly;
 EXPORT_SYMBOL_FOR_MODULES(kptr_restrict, "printf_kunit");
=20

--=20
2.55.0

