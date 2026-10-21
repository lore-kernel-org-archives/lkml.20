Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597710;
	b=T8YdK37kj5wPA7xMzG+PZfpYZqkwEjkQoorJypjLMm5SF2OP6+v5rAhPwK4eNVFZOeOI
	 OqHIqjt0p+BP1Tv6ny0xlTe+vEYzqQKotBWE/qheOBwUpPyCx18XZGZjt5dOku+apkn8X
	 1gtBHexzah3A2VWBjuLSoJxHzZgtKBS8UIl8bzD7BcyMywc1CBpTTO65R5jQUfBHkHBUW
	 S0sttgP7AgmQMcFQlQWnTouazzZ9aps4Mr94rYBZPBfDuw4lM64XDBMgnv/SjzWb7I3K9
	 +dARprPdFbZ9jYJy7nkURl6KNrTftgRyNCQnv3QRFs7wP67WZjYqPgJ4WKfEKueiSyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597710;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=augrChDjSqi+3Dig2dE9+ySed2Zv72Rck8LLz+4aM3g=;
	b=AJk2E6H0A/mAEq7FhxUTtkaAoeG2szJetuA9K6pn00eu8L/peS0mA72QcQfwSAI0LbmW
	 +TH7F1RUG/991MWbstmVeJ7GQbgDLNXN5/fVWsIZ7IFh7mU952Zjv+f/7I+f14suh5p5P
	 NESQxi8j716OVy97fpHSIO3cjWpCl6jCy2IDZQTmYB7JqSHsxMwg4UHBWvx53UTd/jhFT
	 pGllWncSTPpsMYzOWPWMv31a4Fr8hcwzbCYvAcLkZO/gNkw8owwCpmiogofGe6LtNVAtK
	 Hrk/CZCP3/LS2RR5Qp+m8NMX7SWQyzAKct1VFBoI0ZzhdlbwYDemmro3x7drUpizssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2Vp2OfuF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5bwwQXul;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBCC606A31A;
	Wed, 21 Oct 2026 15:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBCC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2Vp2OfuF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5bwwQXul
Date: Wed, 21 Oct 2026 15:48:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792597701;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=augrChDjSqi+3Dig2dE9+ySed2Zv72Rck8LLz+4aM3g=;
	b=2Vp2OfuFXeqoC/+BBhc+7hSI7pgj2sT2Dz9OLm082zIhITcUXPN74uz8jcUzSSc4msr8Hj
	q5jfj+FyUx9hkWOBfIJlbkTJRciP7UsUanZIKz7sxe7kcrYJellTjs4pVteP5I/vryo4dS
	5ceaY4hOfzJhTTz58A8eiqY7gzdvOCBQ6w83Y0NeAqJLA4MS37O/M7cu2N20AI42vZ0pWt
	ZopRf1W7ZRSgNqDQWKd5hf6XDpPAi6NiQ5PZOa+hlWhPzZkHP7jzOwP/ahqBtngcQGwSuG
	WmEmFveDpRXkVAWkbUfxZCeVbBgqY1F+Juge88Sn7aO7k4OBjkaaS07Dwrp+JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792597701;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=augrChDjSqi+3Dig2dE9+ySed2Zv72Rck8LLz+4aM3g=;
	b=5bwwQXul/WKTnWNkHwy9VA5QmlBUSdkVO3Bevlb1w6yKs6luY8Om5hyStRB3HgdO9OYrCF
	wSBc1OR7mOpcEeAA==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/urgent] alpha: add simd_enabled argument to perf_reg_validate()
Cc: thomas.weissschuh@linutronix.de,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Magnus Lindholm <linmag7@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179259769958.3012171.778251544305223933.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     2b774b5bbffabae7ac6be98a98e9641fb3c0bbb4
Gitweb:        https://git.kernel.org/tip/2b774b5bbffabae7ac6be98a98e9641fb3c=
0bbb4
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 21 Oct 2026 10:18:22 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 21 Oct 2026 17:42:37 +02:00

alpha: add simd_enabled argument to perf_reg_validate()

Align the alpha function with the generic function signature.
The alpha function was added in commit 9280e99d87dd ("alpha: add
HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support") while the
generic function signature was changed in commit a2c64c74c029 ("perf:
Enhance perf_reg_validate() with simd_enabled argument").

After both commits landed in Linus' tree the signatures now differ,
resulting in a build error:

arch/alpha/kernel/perf_regs.c:46:5: error: conflicting types for 'perf_reg_va=
lidate'; have 'int(u64)' {aka 'int(long long unsigned int)'}
   46 | int perf_reg_validate(u64 mask)
      |     ^~~~~~~~~~~~~~~~~
In file included from include/linux/perf_event.h:50,
                 from arch/alpha/kernel/perf_regs.c:4:
include/linux/perf_regs.h:13:5: note: previous declaration of 'perf_reg_valid=
ate' with type 'int(u64,  bool)' {aka 'int(long long unsigned int,  _Bool)'}
   13 | int perf_reg_validate(u64 mask, bool simd_enabled);
      |     ^~~~~~~~~~~~~~~~~

Add the missing argument.

Fixes: 742f62b63904 ("Merge tag 'alpha-for-v7.4-tag' of git://git.kernel.org/=
pub/scm/linux/kernel/git/lindholm/alpha")
Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Link: https://patch.msgid.link/20261021-alpha-perf_reg_validate-v1-1-a8e8cc23=
ea7a@linutronix.de
---
 arch/alpha/kernel/perf_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
index 33ea2e8..c5a55bf 100644
--- a/arch/alpha/kernel/perf_regs.c
+++ b/arch/alpha/kernel/perf_regs.c
@@ -43,7 +43,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return *(unsigned long *)((void *)regs + pt_regs_offset[idx]);
 }
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
