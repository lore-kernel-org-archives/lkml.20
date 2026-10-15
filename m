Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A0542ED0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080428; cv=none; b=DT8B23XWm4dQVw7wXTwNEXtyom58OnmUcWbYnUA/ouenhPhBEXTPvx8w07VnSe9y3ZHUtShIYoqf+rhfTgu5YvCgRTIkety2SVNk9aQ+UVIbSBs3e5a8RXxfQrZ3zYrKdSQO1ER/MiGzJyN24AT5Vn/BudKVRj06ZM3bNPAOSDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080428; c=relaxed/simple;
	bh=TqdcsxtO7oXxamhJ8BdjJ7S5xj5I770kuGgv6Ma7iWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKMbXkH9lhSzfVi0yjauYCC/SvnWnWwMfXKroCkdKWyLJw/ZUI0AcWY5dGywylvl94SP5maxHg6nycC1+ABtBusWDr42DT0t7Me8I3Nw+VCAtNoJzrVUtiVD4fkqW8ZKEMLPxXCr5ZbgQ8rKE6WP+AbYXPijsbZlBvf3jccd4Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qFTnYmAd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tqFldhie; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qFTnYmAd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tqFldhie"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792080414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dj0lMtALF/jPB5b5XPoABp9rhq190ToldbkEtrNJlbE=;
	b=qFTnYmAdG/Q3CLqyzuzLt1dR8mxvRicjoYDgf3V9sLK5O4QHt84oAMmaoRJw85vYvU/ClW
	aJWAEkdkdvQgD9EbsgdBb8dsL/w/yCanOiEgsaTB1JYPYD0mFllH8P3o1feMfHo4LRvLFt
	nkGhQ34uUULph80JQu+mymJ08Rm1f51Qmn/Lju8wrnVftV0UBefL15Nb1TU4zFLudvvzXx
	py+LoX0MnbR+pKutlsBswpiviK8uWYLJ6+tr9fSQrkiRrd87Lfacv9YKNhvd2KDy9El9pY
	HiM28EW+vKV7C5BFgTwoda7JUsLNouG4FB+dF1s3J9vPSQ6fquO6SDSq9gs9ZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792080414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dj0lMtALF/jPB5b5XPoABp9rhq190ToldbkEtrNJlbE=;
	b=tqFldhieX/IWS1a1Ng7JnZs2Rdxq/H0BdjBGi9ZSBojFW5hlD7NhwsgR1rfbnR5usj7jfQ
	Yu+nGy/4eKzSE7Cg==
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
Subject: [PATCH v3 1/2] vsprintf: Don't leak pointers for %ps without KALLSYMS enabled
Date: Thu, 15 Oct 2026 18:06:48 +0200
Message-ID: <20261015-vsprintf_kallsym-v3-1-c175c27f38b7@linutronix.de>
In-Reply-To: <20261015-vsprintf_kallsym-v3-0-c175c27f38b7@linutronix.de>
References: <20261015-vsprintf_kallsym-v3-0-c175c27f38b7@linutronix.de>
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
index 1d95ab9314bf7..a3db25cc1e567 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1008,7 +1008,7 @@ char *symbol_string(char *buf, char *end, void *ptr,
=20
 	return string_nocheck(buf, end, sym, spec);
 #else
-	return special_hex_number(buf, end, value, sizeof(void *));
+	return default_pointer(buf, end, ptr, spec);
 #endif
 }
=20

--=20
2.55.0

