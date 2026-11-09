Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216171;
	b=muSBtpSvNPsaiqNbxVeez5I8G7ni9oc42ho19xxfsfTsJwqoR0eplIKTGTCqJUk2v1Xc
	 VcXAa/eZugh2XgMgAmfpkCz4BDQnVxr7lgL3W3EjokIEIOIoGwXl/xvCdwW4XZhAckUWB
	 m+hT7E20AtOJNUE6coXSWvXR6PgyM+d7baZLWGFqzxwlllCExz5zPoeTT0S4FZ3HYmoEV
	 mQJ1KR2SKha+LAJI5Vn3vmM21l9q/3Gz9w3ZquyIZ46JWiCrfwDnYmQJ7aazA8fC+m3N+
	 dUsG+jMXvYLToFZcJMwa7U6DgzTRJi/viQDo7I0egL4YgnBz8xVo8fR7a4YqasIJoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216171;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=2KE9YbhZ4gy0vayx8mhRZfvAbKcGsorTYBxu1ilbmGE=;
	b=nGYuk10ZECVyi9VltTGNC1cwMvMXscZX325KOaS/1X5aXq3ZEjJTeUcYLuTcQhYazsg2
	 NAYNGmrIvwvSvWgNy6rC6VztK6L2ggO1KkEkmF7+dmyZkiR4GBMwkhq5lXuOC4+ZQihwj
	 TWsjwcmI4pgWCa7Fql+s90ramSA8j9JZDbvC97p0Mh9twtBNErPIP+/vhyHd68U8R7HwX
	 V5IUWRrErME/BNfgDO+/Y0xYocwvqJVt6f1x0XS6KAvz8lSc6VWnyWVroz57ylLKywy5K
	 fZO5+C5Qvcl04ok0KsLEWEmuGvsgZo0tgrrTjG5i7NmaHtUEvs5iCJ6+yX/yohBAVMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="j/KS11YI";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qpOeFtbD;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38534606A321;
	Mon,  9 Nov 2026 09:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38534606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=j/KS11YI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qpOeFtbD
Date: Mon, 09 Nov 2026 09:22:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216169;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KE9YbhZ4gy0vayx8mhRZfvAbKcGsorTYBxu1ilbmGE=;
	b=j/KS11YIW3SqIQeDc6OF3xnXStKnifwKfxvrmsBpdqaITd2i+/TlqjpPC80/URIodpr3IA
	h16XbKdaeMIVyRYebzS4A7SHdc9XQqMj0SL5deiWfavYWouwtDybe9tNye1JaubhAiaKBB
	X/wt3ppqNVjP3i7OG2/VcsQHPg/DU7FQxRcx6RByRqY2ZENJZDJLkpWBF7h1IJbZungebh
	JqZ+6ajFdFu5Fuw8ee/jQ3GATKFdV4K4zIaSTy2nkWXR7Vp6wLJ9AtGMA8yJ6/nKPVhE3C
	gFGg04W+ZeXc6O5sNe8Wo4634zt8oqJZ0+TmnGnKA5UoKHbhs6/PrGkKjtV1cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216169;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KE9YbhZ4gy0vayx8mhRZfvAbKcGsorTYBxu1ilbmGE=;
	b=qpOeFtbDdA+FlyAUhnk930sU6x1IpyyH4lf4vAP6S6EDRrRC+zEK78LepSizboIo6fg9fz
	+BoE3TkIt/AUprBg==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/alpine-msi: Add debug logging for MSI allocation
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024193620.39999-6-farbere@amazon.com>
References: <20261024193620.39999-6-farbere@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421616754.2093942.1420941114463196151.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0fcfc884260ab15e303461de4494ef70a2d85983
Gitweb:        https://git.kernel.org/tip/0fcfc884260ab15e303461de4494ef70a2d=
85983
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sat, 24 Oct 2026 19:36:20=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:20:18 +01:00

irqchip/alpine-msi: Add debug logging for MSI allocation

Add log messages to help follow the driver flow when debugging: an
info message on successful initialisation, and debug messages on the
MSI interrupt allocation and free paths.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261024193620.39999-6-farbere@amazon.com
---
 drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-ms=
i.c
index fb84b60..c13646c 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq_dom=
ain *domain, unsigned i
 	struct alpine_msix_data *priv =3D domain->host_data;
 	int sgi, err, i;
=20
+	pr_debug("trying to allocate %u MSIs starting from %u\n", nr_irqs, virq);
+
 	sgi =3D alpine_msix_allocate_sgi(priv, nr_irqs);
 	if (sgi < 0)
 		return sgi;
@@ -116,6 +118,9 @@ static int alpine_msix_middle_domain_alloc(struct irq_dom=
ain *domain, unsigned i
 		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
 					      &middle_irq_chip, priv);
 	}
+
+	pr_debug("allocated %u MSIs starting from %u\n", nr_irqs, virq);
+
 	return 0;
=20
 err_sgi:
@@ -132,6 +137,8 @@ static void alpine_msix_middle_domain_free(struct irq_dom=
ain *domain, unsigned i
=20
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 	alpine_msix_free_sgi(priv, d->hwirq, nr_irqs);
+
+	pr_debug("freed %u MSIs starting from %u\n", nr_irqs, virq);
 }
=20
 static const struct irq_domain_ops alpine_msix_middle_domain_ops =3D {
@@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node, str=
uct device_node *parent
 	if (ret)
 		return ret;
=20
+	pr_info("initialized successfully, SPI %u to %u\n",
+		priv->spi_first, priv->spi_first + priv->num_spis - 1);
+
 	retain_and_null_ptr(priv);
 	retain_and_null_ptr(msi_map);
 	return 0;
