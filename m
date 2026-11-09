Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243192;
	b=SVwXU/X/Hhec1AiWT3u4jEznpjy11epDSHdsR7yXTKaE7t4wgpaNen22a6Xzs9nXgmii
	 dUQkavHrXCXZshHSDCr3+m6p0xT4fj8X6iLgDLJdPUXE3UvIOSiT4RhBdLiOwlUnW3rA9
	 OOtdi94gPKBR7tEFgXXThBspKBx8PmfxIrLAqmDvFtP0TIUisd68I58fOPcjVeNJzq9s2
	 rwtElr2V5hibHqQcfNWD60sm1P3Rgx9vLphxKtTShMLdm8o5sXNZfj2Wge76S9V2g9VoD
	 CkIXZp3/+ucBR1jN9ckKCK7cQ8NRSyPOLMiA2GhOMqDAbO4p3ctyrG1bLcB0aqKR6Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243192;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=3mkABF34CJ/KKFqath17VuO0X4dwB5CDorKarcPJNfU=;
	b=rOXHSBr0J80dQ+PWJOBuGbQOhNJFDY8IuJBIDCz6FRIhAGbGaJfUQetiO2BpETz0Xesy
	 wgbrSNc4PhPolBAK1Dzg3DPQxkQf++RV4XXI0Lhtlf28zjWlT6tZ94fvFIdibEjr9Ya8q
	 alfO34bEYiklaxt35Za9Nm8WNOhufyHEuBI9gP0H+1HLsl2q/IN5twsr5k42HBrUVKsWo
	 x+o+8imm0XfFlZ9Qh2NedT3kooncCIJV+EgG3frTCcAtpVpJtUnvkbfS4ILVWMFCOASxG
	 DP1DYtgE7sSxHv5z/Rnm02oCaRO2HWdfjf4ZwvkacirWRQRLCFfx2DcFyF7Oewo8Q+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OOWXmgtb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lUaM4JEw;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B360A2636;
	Mon,  9 Nov 2026 16:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150B360A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OOWXmgtb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lUaM4JEw
Date: Mon, 09 Nov 2026 16:53:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794243190;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3mkABF34CJ/KKFqath17VuO0X4dwB5CDorKarcPJNfU=;
	b=OOWXmgtbMST1wDD4ntEgqqndBGKTLslUfyThzrvV8TJDL/PTjn0UK1AXMsy1k8O7I0dpKU
	xwQ+pycTe0Jhuk9h8HSy9GIw/N3urGagrXFizJCfjol1sWaJAw+C0cwKcJmOzRqa51nYtM
	rSSbnyV17ALyknlA/41+bGiul6K/rpz4Q5u3jjlyyHqp/dkGa0e4CkiOZNm1PKZRkqvcFS
	UDJpevs79Yv8BZ9+U522KHyP0pSUhkx7NVwk0PNoJg4v/DWYtHVJuHx51g7rc+jsRnBp69
	ivSBSjImE+lMQrLvnikaSPSzMSysma/MnHHVbw+k8eJT7oywhHcpmFBhRSYAog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794243190;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3mkABF34CJ/KKFqath17VuO0X4dwB5CDorKarcPJNfU=;
	b=lUaM4JEwy2XJAY0U8uTPU2x4B3Pc9Vuo6sZHiGp5TOiEVqkAmC5V+WsqzC6p4lkoFK37cj
	JFQ+6YngZNOFf4DQ==
From: "tip-bot2 for Kunwu Chan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/nohz] rwonce: Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU()
Cc: Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Kunwu Chan <kunwu.chan@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261007022859.60101-2-kunwu.chan@gmail.com>
References: <20261007022859.60101-2-kunwu.chan@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179424318891.2093942.316035562027685699.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/nohz branch of tip:

Commit-ID:     3f1eb85d954ae5aa16e85e87afe982b7fed91588
Gitweb:        https://git.kernel.org/tip/3f1eb85d954ae5aa16e85e87afe982b7fed=
91588
Author:        Kunwu Chan <kunwu.chan@gmail.com>
AuthorDate:    Wed, 07 Oct 2026 10:28:58 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 17:50:54 +01:00

rwonce: Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU()

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
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Link: https://patch.msgid.link/20261007022859.60101-2-kunwu.chan@gmail.com
---
 include/asm-generic/rwonce.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 52b969c..4d4e009 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -61,6 +61,17 @@ do {									\
 	__WRITE_ONCE(x, val);						\
 } while (0)
=20
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
