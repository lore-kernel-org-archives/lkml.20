Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216177;
	b=u8+fvjQsbSlXwswUb8nDy1kZUUFNXSaORgqvlQ1GwGtvAhIs5kPDvz5iizcHt2BcB4mu
	 Suz3AeoEO5mJMt6HlmPaXw13a4rO7QIjPmE+n2tJwYXIvdbos/1EKQTeNU1stmjtNmBQb
	 qkZSWZSKa89X2zZ/WdCpHlCygNfREGThnVK13LFGhLisITN9RiAG/X8lptSQTsG5S3Myn
	 d6bww6xD2LntfAPNTLJhuBQfpIUAAgz2WUc0u1fygUUAHDYxQ9t3e4zQaZvmfS8bj2tfj
	 w2SUWDJsEVGPXg6QMUXBnLpyyffjK6dPKXZb/hwr1HlmpkE7u2tBZu6f+YxHi2YtvrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216177;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=SpYnaURQ3pN/fHs0Gr+v+TpJMK7xjqZgbbJFrSNMmE8=;
	b=JzuEAwbezE30kZvGVSP++BSC8cYXVsQG3CLDLTt0ptzpc6S/X08Rk1hI9RdZDD0rQ5OQ
	 Wi86yGK9mEBvGsPEr//yNI5DTqRB34YFFHNQqydMmf/X5Y90BjHgbtztjomwPB0lGFizo
	 srBZ4fKV3DoUz1jQFS157/+4Ji/jiuISJmTCvLfh+gnwDDarC4GznAULrYsuq2mh8lCaF
	 ziKJuN6PjcLu7lpkkzupwfUnWvv0B8Fjqm8o5XDreRizWvjZMy7lC4Nw3nRulfmtNp3k4
	 b28W2RyuPCeMCC9nZnUmJV2i3oIT9w4N4A4DIcOWGlHidUx6P1Nve5neQBUZ65UH37A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=k2kV3EmF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g1HkbqvD;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD03606D80E;
	Mon,  9 Nov 2026 09:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD03606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=k2kV3EmF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g1HkbqvD
Date: Mon, 09 Nov 2026 09:22:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216172;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpYnaURQ3pN/fHs0Gr+v+TpJMK7xjqZgbbJFrSNMmE8=;
	b=k2kV3EmFtuUuX9Wk8vCJFMbA8sDdutUiMdyDOHx0Ca7vk3wpGvpLg9uZUty9k+NT8FJBS+
	jF1g2KTLeWzjGYFik9Kp1oOLhHf/fNPc36S6w+LhsEyX71010shcNZrHGdxmRBvkf0m4oH
	WEaG9NiXPsLKJ/cnC5xu30DCyyCEpm2DIXAgXBH7BJr6TJZ3OTl3UfJOHo/evM3s4zRHUZ
	lcUk8lXGjQqedwaBkYlLo4X+FVLtS3+pYDeFZPF29o4OKUnsjcmsh5wjVcWbp+CNCbio0b
	EbP9NH+WVosyo+io65vjpEtCCudqEr9RDLt0T8jR0YLRsfZcp+KfpUegMHGl0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216172;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpYnaURQ3pN/fHs0Gr+v+TpJMK7xjqZgbbJFrSNMmE8=;
	b=g1HkbqvD7JHZQYBshrIM9hJSyQj4+JAXvy3N/SFddvBNtKYEOmwgUVisGQbuUqUajmE88B
	+iQzBKo0/3gZvfBA==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/alpine-msi: Add missing space after comma
 in GENMASK_ULL
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024193620.39999-4-farbere@amazon.com>
References: <20261024193620.39999-4-farbere@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421617072.2093942.974138213369993647.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     88b4eda43e98f2d3ede58999ebc6281ee7a82ee3
Gitweb:        https://git.kernel.org/tip/88b4eda43e98f2d3ede58999ebc6281ee7a=
82ee3
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sat, 24 Oct 2026 19:36:18=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:20:18 +01:00

irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL

Fix the coding-style issue reported by checkpatch:

  ERROR: space required after that ',' (ctx:VxV)

No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261024193620.39999-4-farbere@amazon.com
---
 drivers/irqchip/irq-alpine-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-ms=
i.c
index 20f1f7f..8155f63 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -210,7 +210,7 @@ static int alpine_msix_init(struct device_node *node, str=
uct device_node *parent
 	 * To select the primary GIC as the target GIC, bits [18:17] must be set
 	 * to 0x0. In this case, bit 16 (SPI_TARGET_CLUSTER0) must be set.
 	 */
-	priv->addr =3D res.start & GENMASK_ULL(63,20);
+	priv->addr =3D res.start & GENMASK_ULL(63, 20);
 	priv->addr |=3D ALPINE_MSIX_SPI_TARGET_CLUSTER0;
=20
 	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first)) {
