Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7CA51EE06;
	Thu, 15 Oct 2026 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058454; cv=none; b=ZBBHHLmy5qdlZtmEWoDnFaMHAQCMat2vUq68CL69YYbSrmCmblCkND1quvdSxl0+8rp0u87iWm3C3QcoR37Oooq2tRuOso9M2A5vKcDHyk32EedvclqhPqB+ZZ5hBb+vOg3thSY7Xz+HXDjVKaRsF6b9EsV/z723crzWn+L7nz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058454; c=relaxed/simple;
	bh=qDwg4rWaGoLO1IMEb+ZVxGwexGZq4iloGsjFgKB+sSQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=E04zpiS1qOjeym++L2OgLEiBNVIp19CBe24Xcr7FZuTL9LClyzLBEwEjVCIbva6JQFCMTTBZ4/XJFfeS9U5N3n9jcvkgwQSJr9Ccm/NW+viJ+rOf4mmW/rjI7/Kd+BwaSRnzUsv/dpw7QA8FTyDtDHErfIzjFrHXZOg6bbdWgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1J7H+qBh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=afGDqBJ0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1J7H+qBh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="afGDqBJ0"
Date: Thu, 15 Oct 2026 10:00:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058442;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHGJRrWX5jbyAYdpjzJMiHUg9UKILO2kJUf33v0Z7Mw=;
	b=1J7H+qBhu5DSwhIn5W5Z6pzVkXQQnK6ejAkESH9yCn2Pzb+GFWygC1rQz3xjRBz4o4bsRo
	zRNOtrJfkNE53oNflk1+U+Eg282ZUcNf4zWu6V9qqTJWj4QwWNgjoS/QTq/+rJr5Jz+6/j
	npzMhvBBc8xN9wvAshr3s870UmfoYDcKcyIwlSNpSZu0hco2aWC9R+kyuMSV2DpP/TB9yH
	gSOXRwwTtJyRsygjoDwHmw0fVvUzq7HXrj2oRaCuAj4gXv6Yy8ByYi82Y2PfUizEwydD6p
	ZwGIAJShLT8k8zuIUlNqEGyQ+ryJef2nKj5JuOuxjJxYRI63+NRpXFCFpvAiWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058442;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHGJRrWX5jbyAYdpjzJMiHUg9UKILO2kJUf33v0Z7Mw=;
	b=afGDqBJ0yUNhTD8ADSiEWzJNBQdKEPXahp0GN6vXr1nEKj0kutivJcN8Q+MFPmj2kxSXHL
	jtu6PYSh8eXQKtAw==
From: "tip-bot2 for Fuad Tabba" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3-its: Don't free the tables of an
 enabled ITS
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925085000.753400-3-fuad.tabba@linux.dev>
References: <20260925085000.753400-3-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205844090.2666988.12481559307126441961.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     d09b36d8e0e60f35bd1cd7d63aadc6dfad61700c
Gitweb:        https://git.kernel.org/tip/d09b36d8e0e60f35bd1cd7d63aadc6dfad6=
1700c
Author:        Fuad Tabba <fuad.tabba@linux.dev>
AuthorDate:    Fri, 25 Sep 2026 09:49:59 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:55:41 +02:00

irqchip/gic-v3-its: Don't free the tables of an enabled ITS

its_probe_one() enables the ITS before its_init_domain(), the last step
that can fail, and the unwind from there frees the tables and the
command queue without disabling it. The kernel comes up with an enabled
ITS pointing at freed pages.

Enable the ITS last. Nothing reaches the new domain before then: this
runs from init_IRQ(), and the ITS joins its_nodes only after the enable.

Fixes: 4c21f3c26ecc2 ("irqchip: GICv3: ITS: DT probing and initialization")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://patch.msgid.link/20260925085000.753400-3-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v3-its.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index 259ec0c..282e4ba 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5337,16 +5337,18 @@ static int __init its_probe_one(struct its_node *its)
 	}
=20
 	gits_write_cwriter(0, its->base + GITS_CWRITER);
+
+	err =3D its_init_domain(its);
+	if (err)
+		goto out_free_collection;
+
+	/* Enable last: the unwind frees memory an enabled ITS may access */
 	ctlr =3D readl_relaxed(its->base + GITS_CTLR);
 	ctlr |=3D GITS_CTLR_ENABLE;
 	if (is_v4(its))
 		ctlr |=3D GITS_CTLR_ImDe;
 	writel_relaxed(ctlr, its->base + GITS_CTLR);
=20
-	err =3D its_init_domain(its);
-	if (err)
-		goto out_free_collection;
-
 	raw_spin_lock(&its_lock);
 	list_add(&its->entry, &its_nodes);
 	raw_spin_unlock(&its_lock);
