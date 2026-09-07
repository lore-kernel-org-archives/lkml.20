Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F698416103;
	Mon,  7 Sep 2026 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810693; cv=none; b=nnZ4dB62+fHiTobtxodwSHGBbUxdaiPpSimbyXFY7Xrt3hY4N42Zbe3hdZ87MP1exM+ven5g1npntV2k591uorNUZap1Lejk6Bl+eeBjZo7X+IWBIunFTxDgHTKPDVrrQzXP4TUEIWwvan6GzhgZP8xaeai7Hbc21UuwQciRSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810693; c=relaxed/simple;
	bh=ew5LWeGnmXYTQTVBW4QUJLNfkRGZq7wG1KE68X7IlY0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=HcYTEIsRZ5THWCwhaiGPLTjgfqFeVOgbrt1RSbGlEc0zku0FqF5m140j2GW8mGz7qimG3XYIdtuhzP15hhVHOSjPLPh3hLgfrqenRFMXsYPl+VW+XnxZGFgCyyv3UcEJwMfQsd+rAM0CcyhxiAAIs3Qh8OsEBfbQ0J5Kt2Kxrck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B/SrNYPR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tMUi7jFO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B/SrNYPR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tMUi7jFO"
Date: Mon, 07 Sep 2026 19:51:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788810689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkcYTJO62umwoA+GBNHmdMbEgTcjOHEF8OjN4zoZQts=;
	b=B/SrNYPREGCy/IwunJPTSRcMQzq56l2vCsPgif3VULENXSwmqsT3bnE4jd9vcCpmAvDZB4
	ZrtTDMt+m5Ne5lU+vY+GjO7Wca7BxXuNZvcTlXGPX6OCsp0oweXNBDj9fb1WHhpnW3b471
	QJ5VGDeWZ0k8owHmRaOA5VxpK+g31KyGvgc3VRl+hivdH3qbmGi9rxr/a37pTeBSJwZKtT
	ME5O8KeThVt8BsMMan4j36hL+FujReM8IRsw8KwL4ssQmvwhe1eHd52fAYNtMGemMh4ckB
	AG3uEC4FRr724MDt5h71J0CdGoUGFiCUOBxQtEdR2a0bLZ6FnGUtGJcNqPQS8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788810689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkcYTJO62umwoA+GBNHmdMbEgTcjOHEF8OjN4zoZQts=;
	b=tMUi7jFOxPm7aWnk2rE2xCiHMJ7knXqqCbjKhixS2VO5jXu8SM3vKgE+ExczRcjH1JgWyr
	zATqqY0I2WmJZ8CQ==
From: "tip-bot2 for Qingshuang Fu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqdomain: Set IRQ_DOMAIN_FLAG_DESTROY_GC in
 __irq_domain_instantiate()
Cc: Qingshuang Fu <fuqingshuang@kylinos.cn>, Thomas Gleixner <tglx@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907024046.28845-2-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-2-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881068823.623050.16780173652578550758.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0aa45dce2afe6960865de1f32fabd716efaa6fdb
Gitweb:        https://git.kernel.org/tip/0aa45dce2afe6960865de1f32fabd716efa=
a6fdb
Author:        Qingshuang Fu <fuqingshuang@kylinos.cn>
AuthorDate:    Mon, 07 Sep 2026 10:40:44 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:49:58 +02:00

irqdomain: Set IRQ_DOMAIN_FLAG_DESTROY_GC in __irq_domain_instantiate()

When a driver uses irq_domain_instantiate() with dgc_info to create
generic irq chips, IRQ_DOMAIN_FLAG_DESTROY_GC is required so that
irq_domain_remove() can clean up those generic chips.

All existing in-tree callers manually set this flag today, but this
pattern is error-prone. A future new caller forgetting to set the flag
would leave generic chips allocated by irq_domain_alloc_generic_chips()
leaked on domain removal.

Set IRQ_DOMAIN_FLAG_DESTROY_GC right after
irq_domain_alloc_generic_chips() succeeds inside
__irq_domain_instantiate().  This makes automatic cleanup the default
for all users that provide dgc_info via irq_domain_instantiate().

This is the correct location for the flag because:

  - irq_domain_instantiate() is a high-level wrapper which internally
    allocates the generic chips, so it should also take responsibility
    for arranging their cleanup.

  - Setting the flag in irq_domain_alloc_generic_chips() would affect
    legacy callers like __irq_alloc_domain_generic_chips(), some of
    which have custom cleanup paths that manually free the generic
    chips (e.g. gpio-tb10x does kfree(domain->gc) before
    irq_domain_remove()), leading to use-after-free.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Link: https://patch.msgid.link/20260907024046.28845-2-fuqingshuang@kylinos.cn
---
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 57c819d..4fdcb6d 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -344,6 +344,7 @@ static struct irq_domain *__irq_domain_instantiate(const =
struct irq_domain_info=20
 		err =3D irq_domain_alloc_generic_chips(domain, info->dgc_info);
 		if (err)
 			goto err_domain_free;
+		domain->flags |=3D IRQ_DOMAIN_FLAG_DESTROY_GC;
 	}
=20
 	if (info->init) {
