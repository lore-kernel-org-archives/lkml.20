Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216181;
	b=fGeHqzIMonyd5D4fTJps0EeLo7PSs37oVyUQDhy14+3rRZZdebvEPQEfkIQbtOU5uME1
	 CyjKNloyyOnZ3JdtJEfLdtEC+oVIA4fZNIOTYCixxj13+KpmNVlzAIYh30lqj8cGQA1ZH
	 zhOdHkrGBdeJqeFL89stCaQs1qzKG6ZxeM1vQQ1P+5Pqo0DBCyqIFXJkrELgUQRNxnuLm
	 9nG1rjkp4BjlNsdcpdsKd/wVyUflW2N/EsdBMyojySsfqu28pGuVwYQUvEqud6uOxrtwJ
	 lXZ1VPL+k7fxSgZMJKlkUPR90nNUqIXhouIOoQ2VXxpXGXN74vJxoqgyheQdGC/pXrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216181;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=3C+mbxu/DGgJwnMlvtOHx+fxPmxNpeTWk+8b9g3xqe4=;
	b=j7JI6RWjMRm2stAZYPanFeYEPTxb+ItguzcUE18nPbycutu1ULnJzSLNuMLIIMS75yCP
	 VRTWmFKcuo3pEWKYzJFv+61WoVz+cPr+75JTSP1Y5VeOK1pKC/P9qGSJbOl3CWq4hvkZh
	 03k8QqdB6YGr2jHFH5nFjhYUV6HeYDFfEXRxFvf7GY1Z3resTHIIBBD7b+9S3cXXpFKCO
	 ih3xQeLT7ryJIYZVlT0ewDiHLeQAr+37a0nsciyUUaBJcYGZnlhab1plSn7QDgMMLnIoL
	 wsA2yNtRU1opC0OTSHLMSpr0/0KtpuAQtdYqSv1m8S16fZQgQGFkOfgIMXqghU43R4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=frLNV0kF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="Ec3/0mue";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9A606EEA1;
	Mon,  9 Nov 2026 09:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E9A606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=frLNV0kF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ec3/0mue
Date: Mon, 09 Nov 2026 09:22:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216179;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C+mbxu/DGgJwnMlvtOHx+fxPmxNpeTWk+8b9g3xqe4=;
	b=frLNV0kFLpbb85uWNe75Ql8aKjcMkeuMo2FVm4xMwG5eOzNS5sy0c9Oy/lNNIE9/TLhEw4
	rrz1TJLX2qaym9OifFIzNrsxJcBabUO126mWyPqhhC0Zbmi1NJ3VgYkXQwsTMVQBTMVfXx
	LhC2RjIttAJda72Fzn9ZpMQJJ1njHcELX3pOkJ4IWrgC9BJ5NIZ11UKRnOeTVt78vKL3gX
	ktkRZJZdwwXEtMgnl1DBB/KR8G/AjxX2p/GZX9ULvGcg7M6n0DiVAt41V6vfwXuX8fuToW
	nPNsxWWmXkH/IBdnbINgj5PALp2d8vjTS6+dPLG6qutg1DtFBwDr72TaIOjVyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216179;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C+mbxu/DGgJwnMlvtOHx+fxPmxNpeTWk+8b9g3xqe4=;
	b=Ec3/0mueYVLHV8HLCL+uihzvBDh8eYNFPBpIe6krD/ikvQpQE8UIct/UD+QTruueBksfly
	l3agu3CmMSD+xjCw==
From: "tip-bot2 for Vladimir Kondratiev" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/riscv-aplic: Do not mark the syscore
 registered flag ro_after_init
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020-aplic-async-probe-v5-1-c4861c2aafca@mobileye.com>
References: <20261020-aplic-async-probe-v5-1-c4861c2aafca@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421617723.2093942.10236928397108586294.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     401632b77cc38bb6de44a2e83ed7c777e540119c
Gitweb:        https://git.kernel.org/tip/401632b77cc38bb6de44a2e83ed7c777e54=
0119c
Author:        Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
AuthorDate:    Tue, 20 Oct 2026 18:38:48 +03:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:20:17 +01:00

irqchip/riscv-aplic: Do not mark the syscore registered flag ro_after_init

aplic_syscore_registered is marked __ro_after_init, but it is written
from aplic_probe(), which can run after init. With MSI, aplic_msi_setup()
returns -EPROBE_DEFER while the MSI parent (IMSIC) is not ready, so the
later successful probe writes the flag after it has been made read-only.
That write faults.

Drop the __ro_after_init annotation so the flag stays writable.

Fixes: b330fbfd34d7 ("irqchip/riscv-aplic: Register syscore operations only o=
nce")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261020-aplic-async-probe-v5-1-c4861c2aafca@m=
obileye.com
---
 drivers/irqchip/irq-riscv-aplic-main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-ris=
cv-aplic-main.c
index 1676d64..a2c4d14 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -116,7 +116,11 @@ static struct syscore aplic_syscore =3D {
 	.ops =3D &aplic_syscore_ops,
 };
=20
-static bool aplic_syscore_registered __ro_after_init;
+/*
+ * Not __ro_after_init: probe can be deferred (e.g. MSI mode waiting for the
+ * IMSIC) and complete after the init memory is made read-only.
+ */
+static bool aplic_syscore_registered;
=20
 static void aplic_syscore_init(void)
 {
