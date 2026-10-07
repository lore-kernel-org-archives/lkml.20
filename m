Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E73331ECB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791340161; cv=none; b=tPepWyaCxUclhjl6g5oPjcaFC8AQwNlr6D8YrXqyJ1UuUmRFDE4TKi7QQFYCtqWxzNBES3tT0SYCdQnaJHULY+TFH6zyLA6xESggYMf3SGjvhE2CJqvXceylSj4GX5/TWJCzd9zNsUtnMsXhhHPMF0oog+NN8axy/JJ93dSs1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791340161; c=relaxed/simple;
	bh=BMRJ9FNkw10Jr8T8VtBLRRoesmOFHwsxxr1YR8BmuTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyfHDmId+Io0PtO01x/LoV3nc4VDFELdF3GtkvHjGIfjCBvUn9S9aaZYNUqvCBHfUzptJous6yw6J1MZ5yxoSCyyxLyHM0kjsIEGq3ZbYjtZRpdGphBECwpuz00ld9OvOr9dJAKuDiE0uzXSZw/o5qHU5P7KHcTiv+vFEADuiuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFp/Y59k; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFp/Y59k"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso631054a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 19:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791340160; x=1791944960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkyTJS3nQKwVyxS3uRKR7tQuJ/5jtxENQKhLtBkMZV0=;
        b=JFp/Y59k6khEkneB1EhKVE9mtKn6RbUN/tXNKsar2m5Uhsy09IDfj2eaTKkMrfCvYH
         uppeOczVYKWL5d5CS6pGcdukcIqgDJ/MqPKtaDeB5uEiGg35R49MjTJfCE+S3UIyBC25
         5PplRn9Ekansvc+JKKD+TvTRAvqxffQ+NWOAnMJbsm37/Lr1NE9wgdwag8a7H+2HgF6I
         f51vvqinZD9nD1ti9hNWB/La29aWSe2ett6WIORXuOSSHR3lqzxU2Zeb5Jnvk8x5THp8
         HzNaW/vJZFn+8y1EgGvABCqRO7ZCN59ews38z/+cb1AXEUFMhy+PCS3D2cQnp0fP0KWp
         2C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791340160; x=1791944960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkyTJS3nQKwVyxS3uRKR7tQuJ/5jtxENQKhLtBkMZV0=;
        b=ANyJNLq7vwNEKEAZrwpZVk11AnHj507VOBAs6WWogAEKlF+oc2xlfAn5WyGtTiYdYa
         WX0vQp9/Ihm7n0HlFZSgK472G7u0z3c3plks98g/uuu7FloUTDEddvzP6cQTzbKTT5ct
         494NqkDx2m1qnsHdTb1QH7eEfEaDrMlA8c7GSuTCvHrJ5/TwuFu1jRE32+NIJElx8st7
         U2GaPoNYFumVzlQxkOGK2jqQk4Jg9kKNkJ2ojcyV4nUp95PkleNxP/cqpBY79ri0qCqH
         9Fyy6zqCaeynQa1/ZSeYf0hzeJ0qxY9G8zYz5s+HNYLNScQ4tceA4w9UAH82Hfm9l+qa
         0M4A==
X-Forwarded-Encrypted: i=1; AKwUvBxJOZQzIgpiGOkbX/neNyEGmk2/ZCFTY1dXXsrjfFXsous8Cq66OfSX3NBbT7wdc3Mj8p/MY2KOiet4bwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwNH2Ppgw/KX1+YdwCX2XLW4P6joQj2aWZRm6yQCSDhOgZTDUG
	uMY6LZcaPsafBUMPZZQ1Fom9EaxHWaxL8nh6QkzEqPZo4juQ5IlnNUWO
X-Gm-Gg: AYBFou2avFqpRFN6HVOs1LdikQHVGGBuZFkh1qiDLXMWKnhUPfx/LqzfJ0P3Y3pJacd
	dGSSPlgRUkgWXZdQbiYpjzQVdVhzha9yDzuF4ywaTRg5hXlLLrKUkEeOLNG4AKZT9jr7apK+r7A
	smP+dOx3piVG/1JzRxX6nb8Q6E7ZJ7soDgqcCzg4FZ8MTZYVnLbBXe47/8YWZKfyepG2Ei1zhep
	dAaJnpqmT14MsyWKFH/bsQW1UgxRdBy5l4DTI0NtJF4JhtudQsC96/nP6iPANIOttgN7Asxq71e
	/J/nAjxYd/absqRuv1alF9Cuf5DtfnaVZGfJ2iiwXGoGnOKoIhrrzr3sVTj2KCye/Ehl8fAfC9m
	btlDnt8Y8O5ByK3csjvtEp46tpo2oEgj4KTYWaAWmPT+fyCGZIX1Uj4naYvUSC9Wh/gYs6OaRTa
	Pb2x5CfpTmMomaSmzSFS16TY4HdXmwxiAMWjULSrUT8/g8R9yZhmenfMdC0VVleZc1nK6T12Unr
	mb04iMsUF6a820Xka3e1qlq4u6VFQ==
X-Received: by 2002:a17:90b:58c4:b0:3a7:9ec3:e9f8 with SMTP id 98e67ed59e1d1-3a8a0ba2239mr557276a91.27.1791340158978;
        Tue, 06 Oct 2026 19:29:18 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b5c5d9asm2090836a91.11.2026.10.06.19.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 19:29:18 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: arnd@arndb.de,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	mingo@kernel.org,
	tglx@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v3 1/2] rwonce: Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU()
Date: Wed,  7 Oct 2026 10:28:58 +0800
Message-ID: <20261007022859.60101-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007022859.60101-1-kunwu.chan@gmail.com>
References: <20261007022859.60101-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-CPU variables are sometimes accessed from different execution
contexts on the same CPU, typically task context and an interrupt or
NMI handler.

A plain READ_ONCE() or WRITE_ONCE() marks such an access as an
intentional race but does not express where the racing accesses are
expected to come from. This distinction allows concurrency tools such
as KCSAN to tell an intentional same-CPU context race apart from an
access that may race across CPUs.

Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() to identify accesses
to a per-CPU variable which are intended to race only with accesses
from other execution contexts on the same CPU. For now, they are
simple wrappers around READ_ONCE() and WRITE_ONCE(), so generated code
and tool behaviour are unchanged.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/asm-generic/rwonce.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 52b969c7c..4d4e009a4 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -61,6 +61,17 @@ do {									\
 	__WRITE_ONCE(x, val);						\
 } while (0)
 
+/*
+ * {READ,WRITE}_ONCE_THIS_CPU() identify accesses to a per-CPU variable
+ * which are intended to race only with accesses from other execution
+ * contexts on the same CPU, e.g. task and interrupt context.
+ *
+ * For now, these are simple wrappers around READ_ONCE() and
+ * WRITE_ONCE().
+ */
+#define READ_ONCE_THIS_CPU(x)		READ_ONCE(x)
+#define WRITE_ONCE_THIS_CPU(x, val)	WRITE_ONCE(x, val)
+
 static __no_sanitize_or_inline
 unsigned long __read_once_word_nocheck(const void *addr)
 {
-- 
2.43.0

