Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E0545297;
	Thu, 15 Oct 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078682; cv=none; b=l8hyZH3MCSLzStqXu82F/4hORpNwVkQIhM9WPGZe6fliDwLiafcm0vVdsKk4E5/Jik6au9s89jLWJP+1CZDh0ps0XvQIcY9WmG/Zzbfqicczo5z/K0MJFqhV7g+1r1TFzeZfqTlqSV99YyHL4/1WF7SsUUmQzKdlPEhTtC86alg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078682; c=relaxed/simple;
	bh=dzF8h5esPHSoQ+Szrpr7TLfq4TqU0xs8LDPH1U2+jUg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=dxkTQ+OBEOn9BAPNEQWS6xttNYThqXFWHD9WBMWUNpRc8H50QZtLnQJLWh2PiykdEh93Yys5sU8h+dOaz+q7G9zXacH9bgSWUWH7MrE0dTALvlLl5dhMJ4MAkx4y3woUXYcp4b1A5fQAiRSB3ga3YXjR17R4Z6WWSUdpkawI03o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FW7odLrk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ygzfTBcM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FW7odLrk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ygzfTBcM"
Date: Thu, 15 Oct 2026 15:37:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078661;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dptQUBphRn6Xl5PUrJAcrkaNp4Y9ylb6uw+DuZNvEVM=;
	b=FW7odLrkSU7IZnquQ05KpfewsIrL3ZzFXGThuDGBtYWeqKxogF+U4ntfPHpm3H0DhwXO7A
	rVsPRJ72a0XDqeevFE5GsSVsaQiMebyS1/smxfcUb7gfQiDB3ux1vfCFX42MNVYUmLC1Zq
	EAUYA6Id2mSnL2qNeJmu7jgHxejseliQUnxYUU2Rq+ZT6tDjNHb/UkjvhVzn9ymtOBXWvH
	5h+rMLmNAHAGxOwuhOfGm8ztijuMdsX7ikwjt/9le00v2BZVHhL02QxWPxaYTKyAEPMWjj
	J2YaMVYz7Yx/FTfsluc+nWl+Mpv5NcEnjRwTR8Um5yek0Uf/J6e+8rE81E9zyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078661;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dptQUBphRn6Xl5PUrJAcrkaNp4Y9ylb6uw+DuZNvEVM=;
	b=ygzfTBcM8xYPWCMmDsYa/m7hcduOAz9VEfk9qr1LpV1EytXXFrMN70bTmdnmKmmEjPAe60
	YpzzeHr7D88/seDA==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] arm64/vdso: Delete asm/vdso/vsyscall.h inclusions
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-11-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-11-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207866011.2666988.14304748979269545884.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     128b1c7d3ac8486018299a31c4398305ecb61b51
Gitweb:        https://git.kernel.org/tip/128b1c7d3ac8486018299a31c4398305ecb=
61b51
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:24 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

arm64/vdso: Delete asm/vdso/vsyscall.h inclusions

The inclusions are unnecessary, remove them.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-11-63a=
e856cc659@linutronix.de
---
 arch/arm64/include/asm/vdso/getrandom.h | 1 -
 arch/arm64/kernel/vdso/vdso.lds.S       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/getrandom.h b/arch/arm64/include/asm=
/vdso/getrandom.h
index da1d58b..d9b9104 100644
--- a/arch/arm64/include/asm/vdso/getrandom.h
+++ b/arch/arm64/include/asm/vdso/getrandom.h
@@ -6,7 +6,6 @@
 #ifndef __ASSEMBLER__
=20
 #include <asm/unistd.h>
-#include <asm/vdso/vsyscall.h>
 #include <vdso/datapage.h>
=20
 /**
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.=
lds.S
index 52314be..6334ca0 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -11,7 +11,6 @@
 #include <linux/const.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm-generic/vmlinux.lds.h>
 #include <vdso/datapage.h>
=20
