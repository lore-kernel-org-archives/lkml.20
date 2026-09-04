Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38549F119;
	Fri,  4 Sep 2026 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529229; cv=none; b=NJBPN4sLHz1gX6718vOadB93NTCtd0uhfuTGypU6+shPJ/z8ydB7GDL23qJmL2+EBdhlUtM+ChhUyTSOke35TI0vht+Aq5/PR+kxqb98JF92sse+TPeCTbouwTl5WhbEAhBr3XauPzC7cdp+v0vWQ90C/uxlI4RO+P2FEvcj40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529229; c=relaxed/simple;
	bh=B1RcxfTq1z+qrMNOxix1ZqooTbF2j2cDhZGAiNded9E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TE+tYb+2X1emxyzue8DMvuWQ1NooFcSPg+VN+2GfyUJ6n/OUUuc0PZ8poLXk/iskluF29mgXt7LbuzlAMiMOU7D+3cSswCoYJ4NGGy3B8UccOniKTpgCmWoiKu/ffJPCjTVL46VwMpC+6Lnu10voZOSjevaTlEubr54whOGYQt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nMmlrTu1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5XJQnOyu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nMmlrTu1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5XJQnOyu"
Date: Fri, 04 Sep 2026 13:40:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529223;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxESBVMidBp6ei5PTTYul7XyZRzv6jkLIP0xYDqcZSI=;
	b=nMmlrTu15HvdIvwUY/zVs4vPh/FpA6+i4Rs6PpwT0BrM5NFy8seqhClN8usPItM0YoectS
	Ote39oGgUhQ8v+/UopfdPWCKBa4gF1MxQX/EMyWIsvvDJqvsiTbUAaRNkYnr6KOpp3j2zR
	of2RcggNYaCZJcPp4jY6cqSGvpW2dW0LX5nWkerUPFq4rAVomlUb39Qk6PIMLg48+UGSBe
	p1diEgXKrM25WPSWSqxqqW/mjezTzEtaWBW3/LJ4ZJ38pPBKV/57WhFg8ygLZeNg+AVDGf
	qgJphkvijGjwOdmTPIKfAH8R4HLVyAQxzN6LyCTgiIT4rHVI38ymn1TUJgXeCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529223;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxESBVMidBp6ei5PTTYul7XyZRzv6jkLIP0xYDqcZSI=;
	b=5XJQnOyup84m1apXZA0cLSPKCNqaTXCTzZuI3AncYB8qLEkcOLaDKiyKkjoZzPBQoBT9jQ
	CrBCVa8IqtdwKWBA==
From: "tip-bot2 for Krzysztof Kozlowski" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/qcom: Enable compile testing for QCOM_PDC
 and QCOM_MPM
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <20260727-irqchip-qcom-defaults-v2-1-466f3c407937@oss.qualcomm.com>
References:
 <20260727-irqchip-qcom-defaults-v2-1-466f3c407937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852922146.3717435.18033369341654719377.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     1b852de05f74cfc96c58caad9df4cc1fa2dc7689
Gitweb:        https://git.kernel.org/tip/1b852de05f74cfc96c58caad9df4cc1fa2d=
c7689
Author:        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
AuthorDate:    Mon, 27 Jul 2026 22:01:20 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:33 +02:00

irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM

QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
should be compile-testable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20260727-irqchip-qcom-defaults-v2-1-466f3c4079=
37@oss.qualcomm.com
---
 drivers/irqchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fb..5a881dd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -522,7 +522,7 @@ config GOLDFISH_PIC
=20
 config QCOM_PDC
 	tristate "Qualcomm PDC"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Power Domain Controller driver to manage and configure wakeup
@@ -530,7 +530,7 @@ config QCOM_PDC
=20
 config QCOM_MPM
 	tristate "Qualcomm MPM"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	help
