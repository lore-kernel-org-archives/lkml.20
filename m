Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDA05448A3;
	Thu, 15 Oct 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078686; cv=none; b=Q6YzLwO6wiZu5UjygIkmLxdIL0ofGrW6F7Y5xBETcP2aEOPbhUWGZ/2WNknlG6I4Kb4wA345KrIstZ7RDCgFQF+owLobS+dlzKDEE02MOzmhB2MqAby3LQ20h7k8jLs4aWeVL5Yzk+w/zSCDYlKIOV5WYkzjRkxYGKm5660TWzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078686; c=relaxed/simple;
	bh=fQl5YJTZlZE0oyS+5Zf7GEXnQ1ZVvoNXuuGKTROJJNY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jIjD1JG7yBOEm4EPku11tv6NWrFt4IFFtCNV1DHQuC9HpYYdAF4dwttTb79s1qNKYlpWznKiCnQqZ2n4Lt2nWM6QwKKLciG2oIXRfMZXuweKYrk2y7yhnUiZnhZreR7XzFTBpSXqTaU9vty5tahXhvuyxqzqcHyvZ489UtPaEGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YmV799qy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nggzi4vS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YmV799qy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nggzi4vS"
Date: Thu, 15 Oct 2026 15:37:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078663;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29EO9a+3adako6z308hbOFsAPODtFb5O3eCtqnb1LL0=;
	b=YmV799qyOrhiR/hRomxvztI4Njf0MpCZYzxaEDL2EaPwyC5saljd+t7tTyfZrjXKoc9rLS
	UbLoC2qLuCpABiumhyOIk52UDtLbsjNkiY6dRy7iizYyQs3JZYV4Ia1eAdYTs82g8ZCuoO
	hO8kc9gUoShCaN7dHXU+nHY1wW9s/IA1smkm4wJ14FO5PHZOPMUwgLGpQL7jFW+qkpKNMg
	QuwzOg4hirF08GCkBJAb9b8wTiJcxreVLkb4nN/v7hRYFhalntaXaLOmbIuquBiC6SkNN+
	ZiGvJXo2jWCF6AlDaTS5s37W3sbjCQCMXmPd1gvOY5v4XteN36cNsA541naMkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078663;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29EO9a+3adako6z308hbOFsAPODtFb5O3eCtqnb1LL0=;
	b=nggzi4vSs6m9cMPlNflj14JtFOz4gUfVH0t9ZLgqY0k10ZDguhCV98n/Yh/UPshCS0+uPF
	f7SXY1hdM4h3KpAg==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] x86/vdso: Delete asm/vdso/vsyscall.h inclusions
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-10-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-10-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207866158.2666988.5742982077550159729.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     3086b69ee00f57a4b3c5735ce876801f25673aa7
Gitweb:        https://git.kernel.org/tip/3086b69ee00f57a4b3c5735ce876801f256=
73aa7
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:23 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

x86/vdso: Delete asm/vdso/vsyscall.h inclusions

The inclusions are unnecessary, remove them.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-10-63a=
e856cc659@linutronix.de
---
 arch/x86/entry/vdso/common/vdso-layout.lds.S | 1 -
 arch/x86/entry/vdso/vma.c                    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/x86/entry/vdso/common/vdso-layout.lds.S b/arch/x86/entry/vd=
so/common/vdso-layout.lds.S
index a1e30be..f190efb 100644
--- a/arch/x86/entry/vdso/common/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/common/vdso-layout.lds.S
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <asm/vdso.h>
-#include <asm/vdso/vsyscall.h>
 #include <vdso/datapage.h>
=20
 /*
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 18dfd80..4bd3b22 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -25,7 +25,6 @@
 #include <asm/page.h>
 #include <asm/desc.h>
 #include <asm/cpufeature.h>
-#include <asm/vdso/vsyscall.h>
 #include <clocksource/hyperv_timer.h>
=20
 static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES =3D=3D __VDSO_PAGES);
