Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042773B585D;
	Wed, 23 Sep 2026 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195118; cv=none; b=GUw2geNPHbrOjIBDL5SJbM5RbDBw7bDhI5Kce9URC8dPKCpl4xA78Qo97lwz1W7Q1L0aIOMZoRYt9KhPGBuWy8d68MSlfYRbqNyGwirp26oz89mzSKMr/Any/ug3xD8LZUqqczKfwDaNBgYz4Xkea8yWajMNefjia+di/t/JlsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195118; c=relaxed/simple;
	bh=Ql75Zu9vigmUud4l6iVQmKgreyXQNYKKtYjwCtfvN3g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TsnK/MFlj5ghzfoO31gJw4sWK1Q8wsKkxT6U4t55UvfGbHDWNfv9H7Mqm4SXJ43D72sl9glH6ClbE3nZjer+DuJQW6LtpZY1XN8ZpQaQLuid3TxTdRMB794fwylHk4agr38DboQEhLYlach27zCgytaKOZN/cdOTRWNJ5mHevXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UI4gjXbT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M1uvI9U3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UI4gjXbT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M1uvI9U3"
Date: Wed, 23 Sep 2026 20:25:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790195108;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRrfB6GhYHSPrb7AhRmtWv4KaemsWi5vCYm0cE5BA1U=;
	b=UI4gjXbT0JkF6RMW9uyOb3Q+EyYp4jrVr98LokptSmQc5uCZM/xFVzBViztNUXqetNrULn
	ke27WMzxnW3LfyOfhWFw7GKpkPIQo1tNzk1O60PV6Eo+LCienCtgYkVyj4qwR3Tz83iipU
	yKyYjUYvKfsyB0g6Tb8X1ByfJuBqH5NEZJTLMQMbC8ncD4VmbdUoCDATPSA1t1JAfJr6lZ
	J5+vlebslotZnbsW/yPT8xtJTBXaCpVAwT2GvvZE/XPY8DBRBP7RctLTjGhGDkeEb8gKpk
	06mKIteF82SQw6IQLnHNDVFVGqPW2GvZ+8dP7fXpvLYwfIYdSG+nlPxtVHrt8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790195108;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRrfB6GhYHSPrb7AhRmtWv4KaemsWi5vCYm0cE5BA1U=;
	b=M1uvI9U3cnACTT7DVfOChIpdWpQeTNZvN+KggEGHtUqf6O0zaDTHn+117CN9vWcYrjPq7b
	/UICQxn22wpuiQDQ==
From: "tip-bot2 for David Laight" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/asm] x86/local: Support large immediate values in local_(add|sub)()
Cc: David Laight <david.laight.linux@gmail.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803094702.3852-3-david.laight.linux@gmail.com>
References: <20260803094702.3852-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179019510604.2819794.2411591397553587601.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/asm branch of tip:

Commit-ID:     966bbfa5f24f601593a0890154e3fb5fddc51e6e
Gitweb:        https://git.kernel.org/tip/966bbfa5f24f601593a0890154e3fb5fddc=
51e6e
Author:        David Laight <david.laight.linux@gmail.com>
AuthorDate:    Mon, 03 Aug 2026 10:47:02 +01:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 23 Sep 2026 13:16:13 -07:00

x86/local: Support large immediate values in local_(add|sub)()

Replace the "ir" constraint with "er" so that constants over 2^31 get loaded
into a register due to ADD/SUB supporting only 32-bit signed immediates.

  [ bp: Massage commit message. ]

Signed-off-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: H. Peter Anvin <hpa@zytor.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260803094702.3852-3-david.laight.linux@gmail=
.com
---
 arch/x86/include/asm/local.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 4957018..68af7b7 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -32,14 +32,14 @@ static inline void local_add(long i, local_t *l)
 {
 	asm volatile(_ASM_ADD "%1,%0"
 		     : "+m" (l->a.counter)
-		     : "ir" (i));
+		     : "er" (i));
 }
=20
 static inline void local_sub(long i, local_t *l)
 {
 	asm volatile(_ASM_SUB "%1,%0"
 		     : "+m" (l->a.counter)
-		     : "ir" (i));
+		     : "er" (i));
 }
=20
 /**
