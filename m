Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503126;
	b=lLyIBIW9r6YnODDu/g/YFedfdS4UEAbP69Bo4u9p1coxVYdB2yPCzWJpIcWu6KoflRID
	 vPQZcv4ZKZN2cGucwj33xgLPOPxt4115AkMO68d+gqCIoY98BSU8OvrESFHmGDSYnZjnd
	 nROfR7zyx0MdqKZe5GfXL5G38zejSJKmTPFo97rn7MCD04/tEFZsYkSofUJl017uCLBMS
	 BbxcHYOHQeEsnYe86DR0L3lFajKe8slazQZTPSvcm2fLh/TEzQwBxg5ro9siDaZ7cdWsJ
	 n8piljp/bdzmWT9TEXxZe8Bf+VgKQ3vS6ObN3SM0gU96tN5m7q+VJaeufdzRaMtCqpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503126;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=SgP+WH81addi9ud+xT/M9dpbjG9XQ2NklY8C4q0ox8s=;
	b=PoccJQXW7OBpRgY8Kd3mgJwYwAu0xQJHraRBGEA3gAnnxvZlAghJp8NIfKRXMX8FezFU
	 7NNGp2fX8AzN+oLCBg4a84W/2Exf7VKUo7nOaUAm/Y0xXt3Gn4ZSob582YtbGk2J94eyt
	 3Pbq1gTTyRJ0B2DZxksJEOyiyiVC/eBWbv7X8vf5UTHMxACCC3tz7tLtefxZpBb/KlA+Z
	 L+VNSHDVxDxT/LtVaI/JJ7ohxlV8PuBg3VbB0VjrVpoiS7bFxSWBsJ1H9UqrgbF9bml3S
	 YX32jGRRBdk5tpGxUTKENNbBn6vdWeZaWK1Q3sNXndDNMhwI0Z1R9vmqLWnXrunI7fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CR1nt0qL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6L7Hwz+l;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9782E60A2624;
	Tue, 20 Oct 2026 13:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9782E60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CR1nt0qL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6L7Hwz+l
Date: Tue, 20 Oct 2026 13:32:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792503122;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgP+WH81addi9ud+xT/M9dpbjG9XQ2NklY8C4q0ox8s=;
	b=CR1nt0qLiinlaZpRPl2UM4si8S3jBEbOjP6OyX0o90u4QfFPlet3qZEZnLdmWXsm4WRxWd
	dRUKRpDJFurloYQ3WhhR1yEjsj6mVGEmGiHvlOIBm6Bi5mD9lgpVklJWSTy+JIzf59Gbf2
	Np0W71sV33Po2PwJ+aaPtU/iPUYBEAqBxMwckTQk6rNWAEeHcbQcO42yuOV3si/hVMOvuF
	gf99+Cw3GKG9MUDQimwjKQBmwII1RZiBPrrDFkF+DoMGi+7OrWaJiz9kZkEOMxw9V8p53O
	Zdp2PBft+MgVl89OUVTjk6j6gh3KuGMtZwpIIRMs/jUJ2KRoc5DIOxR2tEk29A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792503122;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgP+WH81addi9ud+xT/M9dpbjG9XQ2NklY8C4q0ox8s=;
	b=6L7Hwz+lL4PoN/A+K26MnNx/YCP4zsMMUhvR9xj/HGBIxbBx2CLszbxYf6V73qzTe6y78k
	s7r+w29RVTf80PCA==
From: "tip-bot2 for Liang Hao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/urgent] timers: Clear pending_map on CPU hotplug
Cc: Liang Hao <haohlliang@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260930063621.37740-1-haohlliang@gmail.com>
References: <20260930063621.37740-1-haohlliang@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179250312063.3012171.15060379659597477402.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/urgent branch of tip:

Commit-ID:     e7cad586d73276cbd4466de81b2092287d7475c0
Gitweb:        https://git.kernel.org/tip/e7cad586d73276cbd4466de81b2092287d7=
475c0
Author:        Liang Hao <haohlliang@gmail.com>
AuthorDate:    Wed, 30 Sep 2026 14:36:21 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 20 Oct 2026 15:28:14 +02:00

timers: Clear pending_map on CPU hotplug

CPU hotplug migration leaves pending_map bits set on the outgoing CPU
while its wheel vectors are empty. After re-online, a later next_expiry
recalc can treat those empty buckets as pending and temporarily pull
next_expiry forward until collect drains the bits.

Clear pending_map under the base lock after migration in timers_dead_cpu().

Fixes: 500462a9de65 ("timers: Switch to a non-cascading wheel")
Signed-off-by: Liang Hao <haohlliang@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260930063621.37740-1-haohlliang@gmail.com
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index ae9abf1..fc37444 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/bitmap.h>
=20
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -2541,6 +2542,7 @@ int timers_dead_cpu(unsigned int cpu)
 		for (i =3D 0; i < WHEEL_SIZE; i++)
 			migrate_timer_list(new_base, old_base->vectors + i);
=20
+		bitmap_zero(old_base->pending_map, WHEEL_SIZE);
 		raw_spin_unlock(&old_base->lock);
 		raw_spin_unlock_irq(&new_base->lock);
 		put_cpu_ptr(&timer_bases);
