Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D0B374A1D;
	Wed, 30 Sep 2026 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739634; cv=none; b=H3g0Myx1GSI2mExXO1JGaQ9RZmNgxn/5pvh9F06Lbpy2AdwsC739bmnaavb8MaODqIXxcjvaCUy/wvR0ErgPhUvYULW6RZsCKaw42eixipo5Z8jWB/m7iCqBfgJL9CXtuis3UmkLX9yU2FhdGhG0gOkcKtCBhAIrD57eY/xaLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739634; c=relaxed/simple;
	bh=On9JzMdpnM9KWVwCQnLWmp1fL65ytruRxDFmufzQd2Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XmaV260UEeHn6whMozVBdxOBEmcmj9jo0CBi8egpQVXKGKLfc/T7V2qdyCVEoJvUoiK1iQDvfV4t7C5yM2tANTKkvFNX2RNBU4K0+szE5gi99Oa+P3TqjrgOrr21S6uK54NEj2S7VeaxpiZjS2tZpJZpM4P+PNWB8UaN1ufQMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZjB8jlqj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PK3jTCuu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZjB8jlqj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PK3jTCuu"
Date: Wed, 30 Sep 2026 03:40:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790739624;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyKUcoH5G8rXInk9DYN0C6IuwSeovnxvl7Y3QRqTVkk=;
	b=ZjB8jlqjFl9x3wEMKPJzcg59JdxTqQ71qd7Wt8oWrGKdXMGXVr5wI0F0TLCeLGrLW/Ez1t
	EpfU5JPws8+KFoyUBcKDC/lpXZaLdU6kppk6lRMOpIBuDRg9uX2FmaNMuC+6KPoQdPYihk
	vNkaRJFZ4jFL9CsC4Celw53MeMRyEALLfJB1PwGBbHKhDp6ikvhZQpAR4BkeH8Rlnxdj4V
	0w8dF64KGlz1EP1YekYe9/AlEekQYiIRx8qWiuuXVnofbWe9EO5iwqy53B8t4a38Pz0tWF
	jBxx1sTrE/irJs09umataojASRA2AWVtNAdFWQonrNYL0qBqG+0iRxFzhaZAMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790739624;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyKUcoH5G8rXInk9DYN0C6IuwSeovnxvl7Y3QRqTVkk=;
	b=PK3jTCuuBTewwbQfRkMf9Gk9mO72p3CBxwCnAVY/zUwYtMQsxg/AeOIrl9DUE0sNo33Dy0
	QykRaA5AZ/O2crAQ==
From: "tip-bot2 for Pawel Zalewski (The Capable Hub)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/platform] x86/platform/olpc: Use named initializers for
 acpi_device_id
Cc: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807-acpi-platform-v1-1-1507662916ed@thegoodpenguin.co.uk>
References: <20260807-acpi-platform-v1-1-1507662916ed@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179073962239.3910103.3178524599986165128.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/platform branch of tip:

Commit-ID:     edb2b6d8ea88659679787231253e1acefca63f28
Gitweb:        https://git.kernel.org/tip/edb2b6d8ea88659679787231253e1acefca=
63f28
Author:        Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.=
uk>
AuthorDate:    Fri, 07 Aug 2026 13:38:33 +01:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 29 Sep 2026 20:35:00 -07:00

x86/platform/olpc: Use named initializers for acpi_device_id

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of the
kernel code base. Also drop explicitly setting fields to 0 where it is
redundant.

While at it - unify the list terminator to have a single space between the
brackets and no trailing comma.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.=
uk>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260807-acpi-platform-v1-1-1507662916ed@thego=
odpenguin.co.uk
---
 arch/x86/platform/olpc/olpc-xo15-sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc-xo15-sci.c b/arch/x86/platform/olpc/=
olpc-xo15-sci.c
index 75ed6ce..a13dd6b 100644
--- a/arch/x86/platform/olpc/olpc-xo15-sci.c
+++ b/arch/x86/platform/olpc/olpc-xo15-sci.c
@@ -210,8 +210,8 @@ static int xo15_sci_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(xo15_sci_pm, NULL, xo15_sci_resume);
=20
 static const struct acpi_device_id xo15_sci_device_ids[] =3D {
-	{"XO15EC", 0},
-	{"", 0},
+	{ .id =3D "XO15EC" },
+	{ }
 };
=20
 static struct platform_driver xo15_sci_drv =3D {
