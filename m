Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26258526AAB;
	Mon,  7 Sep 2026 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810697; cv=none; b=iNdtlPf9wAXItUxX5ykM/qNVP0/hFzDhCVUbFKUF5Tp07WGyKGGMn0/ptsEx+LwbsIVv46tuHOQKHOAy7QedB5MIElu63/c4Br0MoOyWQP6utVvnuMc3O3m3ag1m9ok0Cgx8KrGKC7oSeEc7e6rie/VgUItXtp82EZABaGNa/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810697; c=relaxed/simple;
	bh=U0lrl1jGUiBr3GIKITBJ5XmOtqZKAt/nXWdw8GrSrRA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=u751rpPewyJ185MickqC0MV8I33DRCUDUTaIRZJjX4GCsmVbzNn4O6mDg8MctC63kqZ5tbrzvJjBrRfbKK2L6FITeXFERJcEuFuhDMDLggFI9F1N5mi5druTZwDa6ylv07GApe8lfFj4Gf2BeX4Kr7HbY8Zzk5DLyZye+W/kT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ludnayrz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oTIxKRk9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ludnayrz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oTIxKRk9"
Date: Mon, 07 Sep 2026 19:51:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788810694;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jY1YETFMlBs6ompxqYUe+eSmutmoOTAcRouVZeYFTiY=;
	b=LudnayrzAEraI+JH8e7TqGhXwW04L25SLtd3z3rjwRNIQiQiP8Qpv2iKSjt4ceJ47vj0dC
	BDhQE/yDSqL6vl0KnTmZHhfrS8PDQlSz5BapSwOqy0nLengPxy4YO40C/5Yz4PpxV7yBYB
	OfouqMEJ0vbSxn7LjgkL/ZXIv6tzj/z/pGfCcTyxZXuTmIwYKgPJGewnkzI6C+3yzxKZn6
	kyDTwc8nQF+YC2OF0yxNbvvWN5ttxOy+266plBs2ZjhHWBHbsy30bJQQNS5GUSt2/oQaaG
	Oo09r3FepUYZguCXmxsL98yPWn+M4QQJHXMSJWi0a4rvHCsv54s9LizymjOr/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788810694;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jY1YETFMlBs6ompxqYUe+eSmutmoOTAcRouVZeYFTiY=;
	b=oTIxKRk97CcUVVR2yf0qpkVoDFXTJnh/7JGjqceqJe/OMUL2d4LC75NPWBLuBVdY+XHX3J
	KQRccB24AaieglBw==
From: "tip-bot2 for Andrew Davis" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/pruss-intc: Use match data directly
Cc: Andrew Davis <afd@ti.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903185220.2014861-1-afd@ti.com>
References: <20260903185220.2014861-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881069241.623050.4471914871936869241.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     02a2db115989749b945fc1dc3e935a4a07eebb8e
Gitweb:        https://git.kernel.org/tip/02a2db115989749b945fc1dc3e935a4a07e=
ebb8e
Author:        Andrew Davis <afd@ti.com>
AuthorDate:    Thu, 03 Sep 2026 13:52:19 -05:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:47:51 +02:00

irqchip/pruss-intc: Use match data directly

The match data is fetched before the instance data is available, but it is
not used until after. Skip the temporary variable and fetch the match data
after it has a place to be stored.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260903185220.2014861-1-afd@ti.com
---
 drivers/irqchip/irq-pruss-intc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-int=
c.c
index 81078d5..cc3a7c2 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -516,24 +516,21 @@ static const char * const irq_names[MAX_NUM_HOST_IRQS] =
=3D {
=20
 static int pruss_intc_probe(struct platform_device *pdev)
 {
-	const struct pruss_intc_match_data *data;
 	struct device *dev =3D &pdev->dev;
 	struct pruss_intc *intc;
 	struct pruss_host_irq_data *host_data;
 	int i, irq, ret;
 	u8 max_system_events, irqs_reserved =3D 0;
=20
-	data =3D of_device_get_match_data(dev);
-	if (!data)
-		return -ENODEV;
-
-	max_system_events =3D data->num_system_events;
-
 	intc =3D devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
 	if (!intc)
 		return -ENOMEM;
=20
-	intc->soc_config =3D data;
+	intc->soc_config =3D of_device_get_match_data(dev);
+	if (!intc->soc_config)
+		return -ENODEV;
+	max_system_events =3D intc->soc_config->num_system_events;
+
 	intc->dev =3D dev;
 	platform_set_drvdata(pdev, intc);
=20
