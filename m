Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216173;
	b=guHpj9ZP4+f1pyC+bSiQ9r7ki0NtDj/VdMVH/202e9OvP9ZHMuNDjyhfVcBQQR9iKikN
	 gg3XXmjKRQSxnT0Qvlsw+eoru93hrBPvfI1Ude7ildCS6XSLNxBxYa9dmyYqZiSmAy6Gh
	 YMJ8wFUpb3scEpQ9xfgatbaaoO+7l61bS0uqVyFGu8AIXhPK1JRZdqRgk55NQ3REbcFpB
	 CMZ2TgY0cVyomk6fCuLx5LaoCoI7J9/nOJss4BeiK12YOiQhkiKThdyukx/Rikr/HOwXg
	 u7LtYiJIrmGR1cG4sWWUaYtoyR8RctaqaWrbV/dWrAx71cmBkwiYWjgIuW4FM1rhrlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216173;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=odoEVQrdxWAi8uNiPNq8aYJ4dvYHsyZJ/JxM5BjIgJ8=;
	b=t/0ZErquKlM7X3ITZTPMHpek00Kotue5VlxJVdWSyWWZJPAtgBbwB2QXgHnf8sIIzGsx
	 4cH3DbF1efED+gNHXB1Wq27tE8r6PIM7GD9AZk+l3HB9kQ8weWWN6/v0pv3EuE3+QfGT1
	 et2icrIh1i0DhqqgPLxi7WwG3YUd40Mzmdr3OmgVem6y8OM+F3zo9BU8XjRe36nQUh0Gf
	 50gLw3App4wHQHZI2mFfhf+Qzomxc33cG+a1jLMlhe8Zv6GzfqGotsYBpDTWrZTiLdtok
	 vajNiTtTCADs05Y2QYXaZeM6OM74QjC2CKMj7kfnBodKZbrbtwPg9k8C6uJQOCjwdSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IVHBvF+1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mlHIM7Lc;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFAA606A33B;
	Mon,  9 Nov 2026 09:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CFAA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IVHBvF+1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mlHIM7Lc
Date: Mon, 09 Nov 2026 09:22:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216170;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odoEVQrdxWAi8uNiPNq8aYJ4dvYHsyZJ/JxM5BjIgJ8=;
	b=IVHBvF+1RXEXce2LB1ilHTru/X3Jus052948udC5yuXkGX47v9zt+JvF+B1VJs0KDXT1tx
	Puc5oi/34JcxSR2FvsBQBUV/AhA+teZn2EaueaoFzpIJS8SCQdcK/e+0J325SXO1qnLeaS
	XRcr2TsmOinNmkZjZG7o0/BxyvhAbmY8QwNYeQhb4XCmDfobl53canSUWb3TVIGq0/BL5L
	GuVUOioQyDEIykCUXuCIKGuODcXY5bso9QANpQ3Xf9gYhFuDFwT+Kst2UT5cl0jH2yiL4u
	Ild65YagpVKxuv3yr8xFPL0QOuHUB5faAJkWg585FyLcZndkb/IyfMmb991ReA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216170;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odoEVQrdxWAi8uNiPNq8aYJ4dvYHsyZJ/JxM5BjIgJ8=;
	b=mlHIM7Lc1F+DGLVaWdUpFhal+NqIXYeauapijTxUUB8d5RUVpLN4uqLAyIDUCrs2XTJdI3
	tnnH9rVpMwSd62Cg==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/alpine-msi: Fix format and wording of the
 registration debug print
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024193620.39999-5-farbere@amazon.com>
References: <20261024193620.39999-5-farbere@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421616914.2093942.15415606380782429037.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     f6ce421fb051511481c8f286f90d9d44891089da
Gitweb:        https://git.kernel.org/tip/f6ce421fb051511481c8f286f90d9d44891=
089da
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sat, 24 Oct 2026 19:36:19=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:20:18 +01:00

irqchip/alpine-msi: Fix format and wording of the registration debug print

The "Registering" debug message in alpine_msix_init() prints
priv->num_spis and priv->spi_first, both u32, with %d. Use %u to match
their type, and fix the "msixs" wording while at it. No functional
change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261024193620.39999-5-farbere@amazon.com
---
 drivers/irqchip/irq-alpine-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-ms=
i.c
index 8155f63..fb84b60 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -229,7 +229,7 @@ static int alpine_msix_init(struct device_node *node, str=
uct device_node *parent
 		return -ENOMEM;
 	priv->msi_map =3D msi_map;
=20
-	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv->sp=
i_first);
+	pr_debug("Registering %u MSIs, starting at SPI %u\n", priv->num_spis, priv-=
>spi_first);
=20
 	ret =3D alpine_msix_init_domains(priv, node);
 	if (ret)
