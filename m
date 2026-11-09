Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216177;
	b=yjLFQkeoFaRfZTdjon1x5AJqEGgCWws2i2J+NdhiDwQsMEMvqX4Qk8zNfKiCKsKTmrG9
	 A8AnRRhGpVMoP+KrZutIpbI8C5wBLGA4i6NQQUKmFEgS60S+k9MuiBf2vglbZuZH5nLrQ
	 OA7XsYOCpa8Gzjvs7DDgt5p/8fWPBHQ1K7YZHWBkGKTu9dljaV2mdVnPC46CXPk4bmHjF
	 t+6zkskjAjI2xK2y4clqyuwfHBd31ftga29uB83dRSW8pCj1hK++vEwSKIW3zaXwfDKRJ
	 az1rKYuRnaaPqw0uPwOWg1VjtSMYch/vjg1CREjwvF8K8f4nkIKDEp9efdkimR4Ya0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216177;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=pI+3dn7zNbOZ16OlK7ksbC1HOFCRKaWeHr/u1/OaJQc=;
	b=Ly7ctVMiX23QI1TaQFly4NwyHn+FjhEsAF7ii1Ua11KmoUR9dSoQYQqwh7Ht0F4gEZ9r
	 eaWqIH7ePbx0xDBQB3o89d5M6y6JHeMoqlhPbj7wKZzPbIaRp3V5G0VMSoQVnfZMRZFF0
	 ilUhpcs/4R2sgrDOdE0N62E6HmXdXSw50btRw/7ikNtIZhuFrIr0PhC3hr0IMsNWnghBE
	 l3ZPnO80LFjQiUa73TiM7w5WsBYJ1/RSyKd8u+2ffPEaBccBewjsx1u0bZ/Ut1UfSxsOl
	 HLWd7MiotbRYrnt1c9aKije2n1UpUUt940SGyCqHtK+qNUF3aUwfclPw531ZYz+ms2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="gx/3FHs9";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wjeZzB+9;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA57606A33B;
	Mon,  9 Nov 2026 09:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA57606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gx/3FHs9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wjeZzB+9
Date: Mon, 09 Nov 2026 09:22:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216174;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI+3dn7zNbOZ16OlK7ksbC1HOFCRKaWeHr/u1/OaJQc=;
	b=gx/3FHs9w0j/fmkuDugCMAWlF+9U0VL+Lf8ihtWoVKlwJZGLqjDJhWr8go2SAXkHieBeJY
	bJWxLwfbhORm6wn6LPZA24rSC47TTCJc8zLzVFHOguO8KAyUdPv+TnSK3oGwVfw5oPPiWU
	/Vt7vbwTMcpP6te+h+vmX907VMJTMRP56KPrVugsCoCZL48n6wxnUo35cFc73QKuFcWSiq
	OTcRVy83LfI6C2n6/mc7IuE6//Nie7NAkzVf66zdjpViOqIHTImPc9a6KP6CynUaCingL8
	APRARbUVPWXdbyYl5jxV1zoGwz938eXSWPDLhDQTS57gCEMrzz3CD1DPVyIyiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216174;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI+3dn7zNbOZ16OlK7ksbC1HOFCRKaWeHr/u1/OaJQc=;
	b=wjeZzB+94WZAmPV0CIUIngVWGdB3LzCNoj8N6ZQ9pihU4gB/7MUQtleTkkeXD0PUTn0ww2
	8S9vFd1TEEA07FBQ==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/alpine-msi: Drop redundant asm/msi.h include
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024193620.39999-3-farbere@amazon.com>
References: <20261024193620.39999-3-farbere@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421617223.2093942.1523011375738921850.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     34f1c8b1ea1460d27353c11adb0ac722cecc8bbc
Gitweb:        https://git.kernel.org/tip/34f1c8b1ea1460d27353c11adb0ac722cec=
c8bbc
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sat, 24 Oct 2026 19:36:17=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:20:18 +01:00

irqchip/alpine-msi: Drop redundant asm/msi.h include

The driver already includes <linux/msi.h>, which itself pulls in
<asm/msi.h>, so the explicit arch include is redundant. Remove it;
checkpatch also flags the direct use of the asm header in favour of
the linux one. No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261024193620.39999-3-farbere@amazon.com
---
 drivers/irqchip/irq-alpine-msi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-ms=
i.c
index 0d97abb..20f1f7f 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
=20
 #include <asm/irq.h>
-#include <asm/msi.h>
=20
 /* MSIX message address format: local GIC target */
 #define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)
