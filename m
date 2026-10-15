Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9355448B2;
	Thu, 15 Oct 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078680; cv=none; b=QofL2tn0g32Cqx7lSYK5x9ahTuF7l7JcMS7LmhENwhZj+IXvm2Sex8YlgIWUTsILdX26qLrUVy1R9BvAGlZze7eg3042em2xNFyHxzuroYA877iyjPMaxAJ2uE1TUXBlgTXMqaIuxZlu4JHln+hOwu0LEEsLtx9dsrSGKW5eW60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078680; c=relaxed/simple;
	bh=9gHCoD6CZ53BS9dl46v3Rk5sIaenel41WUlE7zqAHUA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FwX3k6BZtE9Kzp4peXMl+DPdsB+zB1Wd7GaZKyr25VBlRSxVMKZYZhZduZ0TlLE4S8PzM97o1IfNXy/VwbxgfOQFGvm0+gNfgxySpNVt2v4Doa+Q1zKTsyuV0yfqS6N7A6rwiuXz/FV+pWv6NLNbYV7Ht11p4KATm/pKQFluh6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WP/r/cFO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=72NyuF9N; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WP/r/cFO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="72NyuF9N"
Date: Thu, 15 Oct 2026 15:37:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078660;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMi5o/WmI9gq2tlQUVkBPToIIxdsUHNuxCKXOiJM8Jk=;
	b=WP/r/cFOJdoJGyY79YYO2J/2Vy1g3Cx77Qqi0d4tQzeVSZcBlxnYQNQDFWzqMHcZXRm0Jb
	iPU+oRjz0c9ktIhuqdkebAd6drsNWcKKIQEoa2AQ7tmSOtNazjeeYs6TRv0T4c5xUZ6lo9
	7j65x7bicEpPLB7oXeB1vPLNi/I1BnpeC9uPNdwgvWEF2c6YCQR5PLQbd76/S3uWUkVm8p
	9AffATD+PHRR1Dx9McxDdPGeS6f/DxD4SH656O90VJHDzGYgbMq8izbo7kjfj0jpNf4zrw
	zcj6WRXWTwj+3s91bMnNxKB6dAtEKP7a3mWmjeDESBrTvfwoGIIzT/HgfUl8aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078660;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMi5o/WmI9gq2tlQUVkBPToIIxdsUHNuxCKXOiJM8Jk=;
	b=72NyuF9NRRqZH1q0KCB2UwSAjSLZSoVTAVZgEuzaw8aTvA3pNKOJsKTQn1jnfo++y8QGiX
	T89gE9kXZHp3eUAw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] riscv/hwprobe: Include vdso/datapage.h
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-12-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-12-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207865864.2666988.9743064541912227422.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     0d10af5db4818ec1b90d1cf47a1d383598fc4129
Gitweb:        https://git.kernel.org/tip/0d10af5db4818ec1b90d1cf47a1d383598f=
c4129
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:25 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

riscv/hwprobe: Include vdso/datapage.h

The symbol vdso_k_arch_data is provided by vdso/datapage.h,
which is currently not included explicitly. An upcoming refactoring will
remove the currently used transitive inclusion.

Add an explicit inclusion.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-12-63a=
e856cc659@linutronix.de
---
 arch/riscv/kernel/sys_hwprobe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 7818e1d..5c440ec 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -18,6 +18,7 @@
 #include <asm/vendor_extensions/mips_hwprobe.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
+#include <vdso/datapage.h>
 #include <vdso/vsyscall.h>
=20
=20
