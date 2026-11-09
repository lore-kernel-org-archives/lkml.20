Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243191;
	b=CCVy0dfuTYm8iu/xT4Pmw6YCAKC58UkrC9XoY0mHpA+uoeTFSzgWl0aSTRvf9bzxy4uo
	 doNoOb7AeVfPRL7eYz91Z1udKA3cRhp3VHNxgN7aIABLAiMWYxHpU7sMkbzmNjXeS70aQ
	 zB/CyA+CKa2qFmkl/2g7iuFdwr8yWiVscYgWoB81aV2qvoB9ez47pqUDNokOXJGIamJ+6
	 2Vwxuz1e2wwPXr27m9Jl98o0TemXS8ZCMrereBbF18P8bPSVLortWXLlswF7l5aGuP9g7
	 C3RucfbrTcySCfkVBaXDTj/D8VL9iTYqvJ2HO5ylDAm3ZbOlTQ6tflT0+tS8FMg+9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243191;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=+dCqMHItAc/v+Rit8Teu81RvmRgarre9W6b3Ngds0lU=;
	b=AJeaZF7dRBayk2qQ0g3q68b7Js84C829+fVE6XiVNt8cd23Gl0VB2El8314RolI8UlrW
	 IlLQ+bxI1Y5ta8L2ZszZIkODPthM3k0UPxLYX52HCPHF8hnW3uNDCCJDpYB4dJijz7RnW
	 YUceYxJ2P7dP/bnqbmJ37w2oQJzpylxGbfz4Iy2SccJ4xWAaHCvFsggfaGGObV5itDJqF
	 cKGRwxh0X1+qYvO/dCJ1BJisjSdjszYEltPozEjIZC/E7l5EBZlap1hk5DCukLzAQYSDy
	 rrxzFuxXGZiRuYBH2hi0UpH+1H53tD9zpXnapU4jpJ4e0YG2ZAEGplBtYEzLNC1HDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xkbq8QRX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4pf+8LPW;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED21606EE8D;
	Mon,  9 Nov 2026 16:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED21606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xkbq8QRX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4pf+8LPW
Date: Mon, 09 Nov 2026 16:53:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794243189;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dCqMHItAc/v+Rit8Teu81RvmRgarre9W6b3Ngds0lU=;
	b=xkbq8QRXthw+Ww8HB2wgxXhdhQagaGBbS9TQ8s0tq0A1x8ZM6g1IlXfcYCvuGNlDTAPnZw
	pVcbXH79KgZgBQdgudFhrGc79oBhPf7XbCq+hg+C55tsM8K1Uh6Jyb3z9kL7jJqqfI727l
	Dn4fR49neX2yYaOuqbtL9fMbs2R6VWVGaeADvQmt31U5syLm2eP8OUwhJbR6f2RUbSroMu
	JOpMdtigT7IvcmESSg55cbdE8NtJtZSQM2m7e6Z06QcfFaeQjleseJpSMKIeJcjao1XwPF
	OwKayrvgOJ0ihYzZ7iMgZEoAX3l9VbxEAqRlAkL8mYagL35PUEAO3P5b9WZH+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794243189;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dCqMHItAc/v+Rit8Teu81RvmRgarre9W6b3Ngds0lU=;
	b=4pf+8LPW+uB1GTwhnHPGpXhIxUNefBG4TA3J7jSSKzO7zTypmEhN5VhsI1+WyL0Z3NOWJ9
	8MD9PW/KVxdy4+DQ==
From: "tip-bot2 for Kunwu Chan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/nohz] timers/nohz: Mark got_idle_tick accesses as same-CPU races
Cc: Thomas Gleixner <tglx@kernel.org>, Kunwu Chan <kunwu.chan@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261007022859.60101-3-kunwu.chan@gmail.com>
References: <20261007022859.60101-3-kunwu.chan@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179424318745.2093942.5840931698932337503.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/nohz branch of tip:

Commit-ID:     109fad8c8a7142b25818e64b9e12aed3935408d9
Gitweb:        https://git.kernel.org/tip/109fad8c8a7142b25818e64b9e12aed3935=
408d9
Author:        Kunwu Chan <kunwu.chan@gmail.com>
AuthorDate:    Wed, 07 Oct 2026 10:28:59 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 17:50:54 +01:00

timers/nohz: Mark got_idle_tick accesses as same-CPU races

got_idle_tick is a per-CPU flag set by the tick interrupt handler in
tick_sched_do_timer() and read and cleared by the idle path in
tick_nohz_idle_got_tick().  The flag is intentionally accessed without
ordering or locking; a concurrent set can be overwritten by the clear.

Use WRITE_ONCE_THIS_CPU() and READ_ONCE_THIS_CPU() to identify these
as intentional races between execution contexts on the same CPU,
rather than accesses that may race across CPUs.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20261007022859.60101-3-kunwu.chan@gmail.com
---
 kernel/time/tick-sched.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 5e96c2e..2554883 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -269,7 +269,7 @@ static void tick_sched_do_timer(struct tick_sched *ts, kt=
ime_t now)
 	}
=20
 	if (tick_sched_flag_test(ts, TS_FLAG_INIDLE))
-		ts->got_idle_tick =3D 1;
+		WRITE_ONCE_THIS_CPU(ts->got_idle_tick, 1);
 }
=20
 static void tick_sched_handle(struct tick_sched *ts, struct pt_regs *regs)
@@ -1264,8 +1264,8 @@ bool tick_nohz_idle_got_tick(void)
 {
 	struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
=20
-	if (ts->got_idle_tick) {
-		ts->got_idle_tick =3D 0;
+	if (READ_ONCE_THIS_CPU(ts->got_idle_tick)) {
+		WRITE_ONCE_THIS_CPU(ts->got_idle_tick, 0);
 		return true;
 	}
 	return false;
