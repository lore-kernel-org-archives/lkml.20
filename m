Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADB545295;
	Thu, 15 Oct 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078679; cv=none; b=iopbeA03xP5m07tRhpahmhrqW1MxPAl3IspRn4oiVktj85QgGw8mOqeEkciTGbGYIbJBMQljAHb4ikGNCSCmTmRhdrsM31nfDXR1DfTg2GDi3TYmydeOjEbhCoDmFNk1gPXqBIIOxTejqoldNHlN/r5fW6PYI0UWQUutYTIdudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078679; c=relaxed/simple;
	bh=UeP+1us3N/GCm0nFWmIkboPCLxuK2JXGFlX1NRL5Zsw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FRvVdOJ1kwTjXZAjaMDM3h29+00govDSs/+1zzq4wI8tRcLFgL2JwF6fPkbrVutQn4qnwPz8SVbqCqb1P5ODYJk1PeEEH4zgMmOgc1ggyLdxcCYLk8EIuvFuGKrz/SqmrgbS1t0WpxoISfcsk/yXbWm+cAMEVVws7FpLgEDTFhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aT5ZWtSQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OVXKSvix; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aT5ZWtSQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OVXKSvix"
Date: Thu, 15 Oct 2026 15:37:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078664;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=peK8xa0UKXgVy5QpywKTab2+e8g2i8dhusL3ZM0zDmI=;
	b=aT5ZWtSQZjLAGmOoILg8ATANxuXtFyV3Bm/ckFw6dlFiS09PAjc3OLXWYxIlShpzDUJ930
	mO0sFFrs0+D7JhKElrTvWBt6Hu+zWbASxJ2+vRyAaowP0k41VVF7AM5nNT8hMF3mV5VBRC
	3uqNXOq9mlsSiksiPxwUrXJ2K+rfSEHAo8IroR8cx9gVdhaxRIkAOkgcD9MtBh6rTPkRAX
	JpXYfTO4mEVq0SOGhz2Onl+p6pd+nf0xMHfoMwvUWh59zFfRlEDeWtZ7oellKAZR/XgJkV
	mQkhxHzjPX5YCC1SKl3kVjZjg89bOsrYnoBOyUEt2Wj8SsrehzIgNtWAvNxCww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078664;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=peK8xa0UKXgVy5QpywKTab2+e8g2i8dhusL3ZM0zDmI=;
	b=OVXKSvixzHkPY0IshuYXb+AzIZad9opOVtoiFVv78vhSnYa+qiSe//POTYBNNzxk4ik5Ja
	AoZ5NVuB6omcpUAA==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] sparc/vdso: Delete asm/vdso/vsyscall.h inclusion
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-9-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-9-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207866308.2666988.3173740337726404247.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     cc729f8448151a455b125a827f9fc883f822968f
Gitweb:        https://git.kernel.org/tip/cc729f8448151a455b125a827f9fc883f82=
2968f
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:22 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

sparc/vdso: Delete asm/vdso/vsyscall.h inclusion

The inclusion is unnecessary, remove it.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-9-63ae=
856cc659@linutronix.de
---
 arch/sparc/vdso/vma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/vdso/vma.c b/arch/sparc/vdso/vma.c
index 60029d6..ab6626c 100644
--- a/arch/sparc/vdso/vma.c
+++ b/arch/sparc/vdso/vma.c
@@ -23,7 +23,6 @@
 #include <asm/page.h>
=20
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
=20
 unsigned int __read_mostly vdso_enabled =3D 1;
=20
