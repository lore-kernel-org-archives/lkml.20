Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2794028E2;
	Mon,  7 Sep 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810691; cv=none; b=NRHqgaJ3Gx6bgcpd1U/xpAx3v81C/eTVHtyH2da0iFIwWK/0r2oswTgJVK/AzVgE2Opu3r2OjxiCfzOmtZWwjkFhez0fepJOJNr94AUsAnrWytsrVM7XiNz1vzBCZIZe6XCKINbs1P3UcHxfiwxvLG8VBSWKExxDZq7+92rwRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810691; c=relaxed/simple;
	bh=Uer005a84YPA0UHkL5S0ckMJ2I+EU6f8l4Uy5m8Nltg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=u/i30+9PEaZNyuMPWXZE7MZEM8gF8eGWRtimmWIoaDJ7MOz63kfXQ47XgWmkk7jM/z5nGPlmBt1YFX2HnCPZJ1ngKcp8mm3vokvsuDDGklV0HhMr3YfPiIb3wQK4RHSwTJkcKzDvmFEhK2nDBgSKk6htllw+8o2/ceJnfN3vsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T02kSzra; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zhcj+j01; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T02kSzra";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zhcj+j01"
Date: Mon, 07 Sep 2026 19:51:26 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788810688;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/MR4EzWCPgujADeJINZO5T/3CH7TT/S/di8m8MHlOwU=;
	b=T02kSzraa4G+SJug9tu33JfRPYXMzfIyB6WWd1VoxrEfBQNe9c/ZD28pmqXSo8M3PmKUZV
	IKk+oBnc5QODw/M3LGdg7sAc8gYlOgwsqcd5LhHn7fUHMg2dc2E1Qp4KMgmMATFJkZSKEV
	JivVKdkW7EEIF+0MBCHe7geUrNc0l5rjplArJn/nQClYOuVoQ6sPqraww543fgyvkT2qYR
	apF2Iyy2ZiFYbtrlI6hy07gK+jSFJ7IsqeHOUgu/FnW5XFmCOInj6N0eNrg/KkmtHEiJcc
	v7TMwfrnAwmonY+BoNozamk/sMXjH+udV5v1ozHKOg/VoVql4ZgPFqfRHMxlqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788810688;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/MR4EzWCPgujADeJINZO5T/3CH7TT/S/di8m8MHlOwU=;
	b=Zhcj+j01XrvnjHDvzEik8zKGZOOLOd5/2XdL46KKCXEm4/IsHhTfLmMMKXpv9HNoywOhVq
	CItQa5r2ygtX0ADQ==
From: "tip-bot2 for Qingshuang Fu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/lan966x-oic: Drop redundant
 IRQ_DOMAIN_FLAG_DESTROY_GC
Cc: Qingshuang Fu <fuqingshuang@kylinos.cn>, Thomas Gleixner <tglx@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907024046.28845-3-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-3-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881068691.623050.2555208053879883004.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     404b7900e62b9d5f4ac25c3e2ce757f32e4cc004
Gitweb:        https://git.kernel.org/tip/404b7900e62b9d5f4ac25c3e2ce757f32e4=
cc004
Author:        Qingshuang Fu <fuqingshuang@kylinos.cn>
AuthorDate:    Mon, 07 Sep 2026 10:40:45 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:49:58 +02:00

irqchip/lan966x-oic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC

Now that __irq_domain_instantiate() automatically sets
IRQ_DOMAIN_FLAG_DESTROY_GC when dgc_info is provided, the explicit
flag in the irq_domain_info is redundant.  Remove it.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Link: https://patch.msgid.link/20260907024046.28845-3-fuqingshuang@kylinos.cn
---
 drivers/irqchip/irq-lan966x-oic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-=
oic.c
index 8af08d0..5122f3f 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -220,7 +220,6 @@ static int lan966x_oic_probe(struct platform_device *pdev)
 	};
 	struct irq_domain_info d_info =3D {
 		.fwnode		=3D of_fwnode_handle(pdev->dev.of_node),
-		.domain_flags	=3D IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size		=3D LAN966X_OIC_NR_IRQ,
 		.hwirq_max	=3D LAN966X_OIC_NR_IRQ,
 		.ops		=3D &irq_generic_chip_ops,
