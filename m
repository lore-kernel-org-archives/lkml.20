Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003935;
	b=yHjRoxf2jF+HQqzOPjb94fzmWCU/f6onev1rbgtiGPZWRubmZNnNNV5oqgXkOs6UAinH
	 QLokey4OwAkR7uc+KvaZQT+eYO7v7zoeo41bMufi2gFouZn/uzY2vkWbzXc60wIgfpcvV
	 Qz0Xoqzup6BSMQ42EwDt02XBmcocbQv5xRV8PYq7AZxDm1OwYEiIPxNsooLDd7w6EOtBb
	 q7VQZhmMgmXIVsFoSsVC3E2iPN1MBV8u5Gcs59DMMNHZOdNxazcYV+gsKO09HnTLuj6tx
	 9jFeJdpTfBnsnTJh41tTnyUFifdhqdDcKJ8TsjuE5CwHMvzR7y3MukYk+nb8Tqp8eTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+MsbjmZXyQIGIrMSZDLm0szNexGnhEGpcLnezb5K85A=;
	b=1QAyVmg25uKFlNn5pZAizLn32CklbJfy/bYaMerKzyROMqyRo5/ysLG5DWiahyFdpTEJ
	 RL1TJN54l7Cx3FBvWE0Tu2WZzD+rgXLpiu/xGwroymDNd1RQhIRUpIo4dnfbBi1Jq7TFR
	 TFFAO41k/gIZQIt1nKQxKHduYYNRmLEqVStXBcEqouv+yZLrIO4ZSA7o6RfaKl0z1Fw0+
	 w1/ex7J6L/vIPRPFXt5dzIIjeAEeZBxw3uE5E8L39YQlf64skaJDkMmwto6PCXp7Fs/6u
	 AR5w4TkrJhHNb5xaXOKkmqD2XFlIfuR2vyyVwmRx9aHtBmUiZwDs7zQ721b4GXfuBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gBpdk1S6;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62925606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62925606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gBpdk1S6
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c45551fa84eso396173166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003934; x=1793608734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MsbjmZXyQIGIrMSZDLm0szNexGnhEGpcLnezb5K85A=;
        b=gBpdk1S6DRVeuljO+Stc1a2ikSJw13AEqo9tYqvDT/LkyFs1i+CQJsKk2w2Cc75aex
         3TLHt+aC3mlD5r0S4UP+7jv6CsSo8AVrAjFS4XZnG2d9lJJZF1qw5Cax2PnLcGP+TBys
         Om3WkPcl4r5gadbR23eeWSivdSHpB3wQooIk3EFWqjWX8O6L+kXvW5csbYqTxkSf/qHn
         PaCESo6On67Gjeklhp+jOMq5S2ppGo11ZhUA7hSDDp3IcO6njPNDPxlyEG8bz3tVvT5R
         kvoexajBLBOLqif5O9P+vFrCqst9g6dLzIjaAaBhGDHcI3Bv0YSgGhzujnspGQNQaAbx
         Ms9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003934; x=1793608734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MsbjmZXyQIGIrMSZDLm0szNexGnhEGpcLnezb5K85A=;
        b=nG83mnFTTB38ffG76zV7E3a5TqC4QpID/INVdVbO6dJSyIbxCsv9jSWWUJLvYH2bRs
         zDRXLh9GkrouunDqBIRjcn9vC8adkvkG/qm3w2hiub/D371xko/OKqSTdTO4wheNunO5
         nF1Z42nNC0ql4wVx8BgSMDGmVs8JtOrs5i/o3qTaMWw1FdjJxkXDF1GKTNSjwQUcf3lL
         ediCvwehV4D6Qwd07GWFD8pXDOiFxarAFHrbi97tnfG5fDOGw1DyS3gMAzHXDkDvxjBv
         LStn1bbRCAgKOnXtdtroVjkj00G/sc+xHgdilW5sgUry8oNRkTgxnTWo0+1vguuiTKth
         x/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBw6AyhLDcnD+6CQcFWyqA1Vz/sVZEJItmbNR04G6S1/CgPnXVuZoFAzjz+ronyxPJjMJxwluqBC8AKhYMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtwNVbW139fIlzuskXdNJFJEIASMUIuayXon2XCxpIZgy2zxi4
	4+hBYFG0mwhqTKDo7EGTEThgplqXSzwDr4aywAIRmsZgFhzkTZMVVNdv
X-Gm-Gg: AYBFou2YQ1nxf24VBPa9b5QNNGizsSN/TVuTInem37wrvJwmR+Z/71zshYWPENJhsyx
	v5ydIu/C0kPratFnOVyTnKIolx2v59k3tPIz9feZAvf5gyy3MGkAQ6JVKEG1jVrA/+4MH8iW+Vz
	xNpgAoXDLaiczd2cEv0njQdLcjOqONArwSy9jgXyibk5DQuux3ZpVM9s7PJBAmwh27SUMVwNwRr
	YO2sVln1FM9h8JpzHSIp8U9np9C5ffNx40JeOP0Uwrgn4e4+wfS6kvDg66mPoZzAbV1XO3xSZHt
	VwoWvWE7Jw1lNQxGhSschp3NoqG0CO4vkQqunG3xSuhf5y+KcyFR/L6bnXuk+8I1POFCo943q87
	sD/T5d8LTefaV86uu5sxKBwOundpj1jGvTLeEaf6lViHNyDjNqQdHoVKKP8RNp3StwL7vsMhfkb
	3bZY42S5PLf9Slxb7D/9721P46N/IMGD+UqTr7JSFIBr7AkTVEY68g0avS4HuYINppHt1dNg0yO
	0o3oOep0EMi47pWQUAIv0Mvr+h1bh5Z/YZ11N3CxfMCOMghdC9s21VmWUCSlTFuGdV9NMZ20mSg
	zaU8CMYmjzlJJU7UtdGoMA==
X-Received: by 2002:a17:907:9611:b0:c46:2a05:b257 with SMTP id a640c23a62f3a-c46bdc0f3b4mr739291766b.23.1793003933589;
        Mon, 26 Oct 2026 01:38:53 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46c59c063csm249655166b.34.2026.10.26.01.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:38:53 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 1/1] sparc32: do not write back unchanged values in emulated atomics
Date: Mon, 26 Oct 2026 09:36:56 +0100
Message-ID: <20261026083837.1055953-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026083837.1055953-1-linmag7@gmail.com>
References: <20261026083837.1055953-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed bit-lock acquisition can restore an unlinked hlist_bl head and
leave pathname lookup retrying a dead dentry indefinitely. The owner
updates the pointer bits with a plain store while holding the bit lock.
SPARC32's hashed atomic lock does not exclude that store: an unconditional
fetch-or can write back a stale pointer even when the lock bit was set.

Skip unchanged stores in the emulated atomic fetch operations and legacy
set/clear bit helpers. This covers current test_and_set_bit()-based locks
and older generic bit-lock implementations. Keep the hash lock and IRQ
exclusion on every path, preserving ordering, return values and
changed-value updates.

This fixes the bit-lock owner/waiter protocol, not arbitrary races between
plain stores and changed-value emulated atomic operations.

Fixes: 26333576fd0d ("bitops: introduce lock ops")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Validation: forced-interleaving host regression; SMP/UP builds and QEMU
smoke boots. A native GDB 18.1 build also passed on dual-CPU HyperSPARC
as part of the combined integration; see the cover letter for scope.

 arch/sparc/lib/atomic32.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/sparc/lib/atomic32.c b/arch/sparc/lib/atomic32.c
index 8ae880ebf07a..30b4e0c12c07 100644
--- a/arch/sparc/lib/atomic32.c
+++ b/arch/sparc/lib/atomic32.c
@@ -28,15 +28,19 @@ static DEFINE_SPINLOCK(dummy);
 
 #endif /* SMP */
 
+/* Failed bit-lock acquisition must not overwrite an owner's plain store. */
 #define ATOMIC_FETCH_OP(op, c_op)					\
 int arch_atomic_fetch_##op(int i, atomic_t *v)				\
 {									\
-	int ret;							\
+	int ret, new;							\
 	unsigned long flags;						\
 	spin_lock_irqsave(ATOMIC_HASH(v), flags);			\
 									\
-	ret = v->counter;						\
-	v->counter c_op i;						\
+	ret = READ_ONCE(v->counter);					\
+	new = ret;							\
+	new c_op i;							\
+	if (new != ret)							\
+		WRITE_ONCE(v->counter, new);				\
 									\
 	spin_unlock_irqrestore(ATOMIC_HASH(v), flags);			\
 	return ret;							\
@@ -125,8 +129,9 @@ unsigned long sp32___set_bit(unsigned long *addr, unsigned long mask)
 	unsigned long old, flags;
 
 	spin_lock_irqsave(ATOMIC_HASH(addr), flags);
-	old = *addr;
-	*addr = old | mask;
+	old = READ_ONCE(*addr);
+	if (!(old & mask))
+		WRITE_ONCE(*addr, old | mask);
 	spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 
 	return old & mask;
@@ -138,8 +143,9 @@ unsigned long sp32___clear_bit(unsigned long *addr, unsigned long mask)
 	unsigned long old, flags;
 
 	spin_lock_irqsave(ATOMIC_HASH(addr), flags);
-	old = *addr;
-	*addr = old & ~mask;
+	old = READ_ONCE(*addr);
+	if (old & mask)
+		WRITE_ONCE(*addr, old & ~mask);
 	spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 
 	return old & mask;
-- 
2.43.0

