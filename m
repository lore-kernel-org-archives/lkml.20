Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B8511E78;
	Thu, 15 Oct 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059772; cv=none; b=RE8c+KEONb+zsFzYLybNv6xPmH66nhmhvU3YU5K+E8bws/E+Thc1D0oQQ/AHgfxIxpBHgORJ/XBs7JRIFJk2I6Swc6YvQlofivVYTArHai0FFPlwPgew/6encO9+kDYCqbrN/YB2EY7bgQwut/5m4JJ8k0YAKkhxKbrTcncC2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059772; c=relaxed/simple;
	bh=yKCmoIXvo11DDSPzSecRYk0GkfSpCxKiHFvIC1QZjEg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=DAuAiMk6t5jgzJlMB2KS4Cd7FuvDQGWltzd77SQY06oJrS8ZXGGeiR5uzNIQdK/hT+GNhNae++RHSoaVlgTUT+PAQ4WPufIFmr1aIvKFcOJ9ZoD6LwcZL6p+mam0XH4xzIZZRBBX+CegNFFbVG2zcn3/H17TdmyRAJF03uhPMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lS1AwDcr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=90+p649v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lS1AwDcr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="90+p649v"
Date: Thu, 15 Oct 2026 10:22:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792059769;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4+gU945DRxMUCDEzbsYudzI376ZiIND2Zwl1vjNcXE=;
	b=lS1AwDcrSdulDS5fEUXR3BTCFNNeugRqb3ClNiXJr/0Dg4KCWNGCOyghleotTcvFUyMv5n
	3ERQGwpF2fmbdPY+Vxpt/ljvlCuEXExPjE0LQhIJOteBQ1sOAgmWiHHbrk6/URicvcbJpt
	MA05wypaD91N3T3+drClOg/yhJtfgiCYcM1a4JSAM//qyfn6exlLnPZ0pziNvWzT06YeeR
	wI55inLA+u8yC3nNNNcYNxscojj0R3czaf6LyUePhRx9fWd+ob496x7FPQ+OrXhLHACoBZ
	g93XG967f942qfw1jughFQW6BG6oq0i4NE9h5fuvZM281OMaKS35c5QrHZDKkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792059769;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4+gU945DRxMUCDEzbsYudzI376ZiIND2Zwl1vjNcXE=;
	b=90+p649vIJj5IoLBmAFmXx5AlO1JDisMIbCWUGFrll+QYGRr82CXwoHVA1+h7V8cQl3Asi
	OTI7GKzrXGR+rQCg==
From: "tip-bot2 for Huacai Chen" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/loongson-eiointc: Use pa_to_nid() rather
 than hard-code
Cc: Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013062358.60654-1-chenhuacai@loongson.cn>
References: <20261013062358.60654-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205976728.2666988.6236210457087239433.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0a0cdf87d07e22927c2a4c47b78a09bec37a7d38
Gitweb:        https://git.kernel.org/tip/0a0cdf87d07e22927c2a4c47b78a09bec37=
a7d38
Author:        Huacai Chen <chenhuacai@loongson.cn>
AuthorDate:    Tue, 13 Oct 2026 14:23:58 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:16:59 +02:00

irqchip/loongson-eiointc: Use pa_to_nid() rather than hard-code

NODE_ADDRSPACE_SHIFT is 44 now but may be changed in the future, so use
pa_to_nid() rather than the hard-coded valud.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261013062358.60654-1-chenhuacai@loongson.cn
---
 drivers/irqchip/irq-loongson-eiointc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loo=
ngson-eiointc.c
index a9e8b48..ba6e848 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -454,7 +454,7 @@ static int __init pch_pic_parse_madt(union acpi_subtable_=
headers *header,
 					const unsigned long end)
 {
 	struct acpi_madt_bio_pic *pchpic_entry =3D (struct acpi_madt_bio_pic *)head=
er;
-	unsigned int node =3D (pchpic_entry->address >> 44) & 0xf;
+	unsigned int node =3D pa_to_nid(pchpic_entry->address) & 0xf;
 	struct irq_domain *parent =3D acpi_get_vec_parent(node, pch_group);
=20
 	if (parent)
