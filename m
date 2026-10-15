Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0A509F18;
	Thu, 15 Oct 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058101; cv=none; b=PXwzdew1VZSrJdAcIaqQ3wJaB91VL4UXADHuJDJhmxCHjqvod5Q9Wmaa1PntQolEZ0HZXiXLPs7rioDyKTabELTkPgDEdshIPSSL/pjZtfwSlpWpYij0e94t577mwN+zyJzVwM6iYUYkLGAl88oviqqP3Fo+a/j+b3j4NepfvaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058101; c=relaxed/simple;
	bh=pangQqqlNkPyR/65oQlZsc9fdlQ3FFWxvT1npiyMDpo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZlE1AWf/Eqmxn2TIqPvHxnx+54lrvmBwF0tLWjoi+tvMtnpUGtaGGqEVyOENIpiv+iW1BuX/aPWPVlwsY09uo8IUkktY1cvbNZLbBX1MZT4LVMfqCQBA6FL7hmeGu4KN4UAbU3Je18R9HJq9yIohhEhlBcfQUWcjIhhMhwluVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xU/Cd7QH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GSDUtPNA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xU/Cd7QH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GSDUtPNA"
Date: Thu, 15 Oct 2026 09:54:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058095;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4bYVo56phNUfjIchV852G7lbV15J4boxzBiBsYSsTNs=;
	b=xU/Cd7QH3qCfXR6X3lIZGwRWf2SACCmYzswtBVBctxdLZV1t60/8MfvHSZokcV9m/mezMS
	EH3eJNPIdtoS+DUJbB1fT4g6OKfW+9RRxtRDQ9Qq8ipFG2ZfSKVlodWHbmGQthD3JxqlT3
	de2sDmVMznjiI2SyTtGwFvgTxXJwI6KvzTj/zhOspNFpTJf241RAXriibJmX/r/XTJIuL4
	euhXWePAbh4yJfRWZEoEpJYD1JwmujRKEJ+KAY2ISDZeo8RhQbXzxFIvKDuXl1ku7ZUnx/
	mxIzvv40pnARBHI4wbDpJjiFZQ4vVUXUH8nQizHqQ+9Nd37Qxkz23TO5m5KiSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058095;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4bYVo56phNUfjIchV852G7lbV15J4boxzBiBsYSsTNs=;
	b=GSDUtPNA9/kCGzhX2kO6R4ut7Dg1fK9l/KrawvhqECm/x1NtWcsJtbzMKhs4lgGflvUqhU
	1UVm8zvnq21r9zDg==
From: "tip-bot2 for Arnd Bergmann" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/qcom-pdc: Fix linking against QCOM_SCM firmware
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915195948.3521662-1-arnd@kernel.org>
References: <20260915195948.3521662-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205809376.2666988.1537016931129572231.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     8e6b8708f925b015e2af4d77757c2fbee7da6ec8
Gitweb:        https://git.kernel.org/tip/8e6b8708f925b015e2af4d77757c2fbee7d=
a6ec8
Author:        Arnd Bergmann <arnd@arndb.de>
AuthorDate:    Tue, 15 Sep 2026 21:59:27 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:47 +02:00

irqchip/qcom-pdc: Fix linking against QCOM_SCM firmware

Build testing with SCM disabled or in a loadable module fails
with a link error:

s390-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
qcom-pdc.c:(.text+0x18b8): undefined reference to `qcom_scm_is_available'
qcom-pdc.c:(.text+0x18ce): undefined reference to `qcom_scm_io_writel'

As QCOM_SCM can already be enabled for compile testing on non-qualcomm
machines, but is always enabled on Qualcomm Arm kernels, use that
as the Kconfig dependency and remove the ||COMPILE_TEST check.

Fixes: 1b852de05f74 ("irqchip/qcom: Enable compile testing for QCOM_PDC and Q=
COM_MPM")
Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://patch.msgid.link/20260915195948.3521662-1-arnd@kernel.org
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a8f8c42..06d5cbf 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -522,7 +522,7 @@ config GOLDFISH_PIC
=20
 config QCOM_PDC
 	tristate "Qualcomm PDC"
-	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SCM
 	select IRQ_DOMAIN_HIERARCHY
 	default ARCH_QCOM
 	help
