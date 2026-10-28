Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219346;
	b=LJvk82x7tvRvai4zJAK4fyzGA0z8OqbNbvI+iIjRZyYal2qi+YTgAjzZeIIT4H0dLekd
	 9WSlqTbhX1vp20FnXCKgrSbVgzmGb485HQlwLNHxsu2pbZuCUV9XMdk6n/kcXBaSXrRz1
	 zQMquUFjD6Z15FWYacLD2k/XM1Tsa1m4zvWmqFp8WH2T6KyEmsr9YeiD+czkCVCxxhCuR
	 eOIbTWZxZQizr0uXpYfHRiOgWCavncF55gUHYYNCYDXNI5T+66WBOialxK4UqcZXhm/0W
	 esWNGS4eULUYBfoy5DZ3nQSUEmBor7aNn5oe4o+K7cB28s2sPyh9OW5WHJEvvzN3A+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219346;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Aoo5E7+DuxLcAJUhFQhORA9K/QmjnxzTPypgp1Wo/Sc=;
	b=JbGV5t71cLODxzv7o36CXlI/whMs56F8FKekfags7DH9QOEgTxUwq6QEnXJ6WbAOZpfv
	 US6GYEYhs4PN7XgAe514uLjcS5HrV6/MHkldmzaZv/WmoyrLthtycCNzCj33tXXSK1Ra+
	 KrnG/0JduaekBJBxvfuzO1D0+a1B8mBhwsD7VrSihGS3dwfXSJ7xVDvPsmv0fKZLmuI9R
	 +iLab5SbwwGDppjfkwJ5rb/5q6bZ2im/XgjcD0oaVFkybtLK6FUeNKtzmh/ebEM8XYTey
	 tDW5JL6SDIOULVkI8EOr5FU8wBwwtp94Hre4O6rcCWakQKpKvIpYqO+B+mlFmSImgQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DFjH8a13;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uOUXZYRK;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51547606A31C;
	Wed, 28 Oct 2026 20:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51547606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DFjH8a13;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uOUXZYRK
Date: Wed, 28 Oct 2026 20:29:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793219342;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aoo5E7+DuxLcAJUhFQhORA9K/QmjnxzTPypgp1Wo/Sc=;
	b=DFjH8a13dXRbdF0+NDi1siOSTILAjhwh3e4FdPNAn7V96H5hM0Ql+FoblQXEL1jCjsgVcp
	OO7eVeDgeJht9XkI5346Kmh2d+9eXUfsWoYW+qRv2mmUpXWPv/NdI1j4+ZyLBoH8oVEnVF
	iUKej2Eemb0Vee0Yj0UjUTk4F7tbgreDb9LFUrJz+cMtEdFxwzh+WGCgRn/TDK1YAMe83u
	f6A3GR2dzmhe5ib4gKMtk6fJOnJ4sTIr/gpxWuHo+P2mrea+zcoQ5yXJPh06uCotL8AKsc
	aeGkUekC3eUw1Hsfh1kjLCA0gHVAZ92KUJqbJhWhpemAo5IDLX8QdarSILAWEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793219342;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aoo5E7+DuxLcAJUhFQhORA9K/QmjnxzTPypgp1Wo/Sc=;
	b=uOUXZYRKs3ZJW4Kw7NoLzikRWHycu4mDrAoTeTjbthqa8/9TEP8cbmK0vAJWLvVoxp2eqT
	tzeo2G/TendI/RDg==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/urgent] irqchip/riscv-imsic: Report successful hardware retrigger
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 bjorn@kernel.org, Anup Patel <anup@brainfault.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20261026122641.3292904-2-thnkslprpt@gmail.com>
References: <20261026122641.3292904-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179321934085.4109677.4552215550678394415.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/urgent branch of tip:

Commit-ID:     8ccba7c98f69009e64b9290f6ee4b2c0d2a87a4e
Gitweb:        https://git.kernel.org/tip/8ccba7c98f69009e64b9290f6ee4b2c0d2a=
87a4e
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Mon, 26 Oct 2026 14:26:42 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 28 Oct 2026 21:24:51 +01:00

irqchip/riscv-imsic: Report successful hardware retrigger

imsic_irq_retrigger() writes to the IMSIC MSI register to retrigger
an interrupt, but returns 0. The IRQ core treats zero as failure and
may schedule a software resend despite the hardware retrigger.

Return 1 after the MSI write to report successful hardware
retriggering and prevent the unnecessary software resend.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for =
platform devices")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20261026122641.3292904-2-thnkslprpt@gmail.com
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq=
-riscv-imsic-platform.c
index 643c8e4..52673ff 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -61,7 +61,7 @@ static int imsic_irq_retrigger(struct irq_data *d)
=20
 	local =3D per_cpu_ptr(imsic->global.local, vec->cpu);
 	writel_relaxed(vec->local_id, local->msi_va);
-	return 0;
+	return 1;
 }
=20
 static void imsic_irq_ack(struct irq_data *d)
