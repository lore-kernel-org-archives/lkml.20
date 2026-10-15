Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21870522693;
	Thu, 15 Oct 2026 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067553; cv=none; b=r/OVJ65/rW29ggZPXAgVaY5b/ABbkbbRWjpfac8ZfoPGynFF/yPiWuaeIOqACq+sKp3fqDqwM9gXi/X3qEfxzkq7g8dVjyV1islmaljcS/Z0j3QeGIbjxdLhFrtvLRROMZcbr3A+CAgMVWANkJxxkKtZOcGUu1Yip9F62gfznWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067553; c=relaxed/simple;
	bh=CfXjcKpu/cpIxAOkqEki6k0CMtAF6DDP/SbE3bhwGds=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CpT0xU99kAN+cMxdzGHnbMtplzI/RtXP8OiHB909we9YdIblc3qe9Gcsp7LyFMW7Ke/miLfWFTpqgAo27SPZepZ0H1Uqz6pLz/Bzs4XaT8y/4qGkWiQRonolwrdLILULVd2AGe4m37cqSYa4ROubszf0yqVaeRBAzz03BOgGlyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DjarnVYw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8vw/JoOy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DjarnVYw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8vw/JoOy"
Date: Thu, 15 Oct 2026 12:32:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067550;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ef+pB1M5e8aoi7itlcqF2w171G8Ul7PJc3QJDMn5+PA=;
	b=DjarnVYwLCtZTRr/kXHXZBCG5BJ0WJ7CN5HcQRj3J3/VVPtc1jL9OXf6amRdcQrIv14HZV
	ydM5FBCY0dkpq8E8tHZgAOztKNTYK6iJjBrxXpcM6CNUEPoZT6Rbgoj1XpXFA5n9ai1dqG
	vdGmuMsyhP2KC4oh7kOINg4IVbTPuiLH0avTL2Xo+f4LBRDnrOV85/GamtHDWaOOde0rRm
	2zJRf2MsT0TCPQ/3YMpjzqNdlywTKAYgnvENTpEZNxfPhnNtrsZ60HGcxq2ToYiOH3wga8
	8i4WbLruIkn/UaaFKg2M+hxkF+oByCb9JO29Qf1PyalAFvZK9dgwg1PZ2kokVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067550;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ef+pB1M5e8aoi7itlcqF2w171G8Ul7PJc3QJDMn5+PA=;
	b=8vw/JoOytDR69uOezhT3JmRCCeuoR0XXePa7ePeXhJMV3vS0wjHfowdZKmIGeFbVT092CB
	eXqQWREKbghQlKAw==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/al-fic: Use %pOF and raise init log level
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-4-farbere@amazon.com>
References: <20261011050449.41903-4-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206754872.2666988.1590682003502575644.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     da0b1e5f7a124c5c506baef32ed7a90aa03cf516
Gitweb:        https://git.kernel.org/tip/da0b1e5f7a124c5c506baef32ed7a90aa03=
cf516
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:42=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:06 +02:00

irqchip/al-fic: Use %pOF and raise init log level

Use %pOF in the driver's log messages, so that both the success and the
error paths identify the specific FIC instance by its full devicetree
path rather than by its bare node name, e.g.:

  /soc/interrupt-controller@fd803000 initialized successfully in Legacy mode =
(parent-irq=3D3)

A single controller is described by several FIC nodes that share the same
bare node name (e.g. "interrupt-controller"), so the bare name cannot tell
one instance from another. The full path includes the unit address and
keeps the instances distinguishable.

While converting the parent-missing message, fix a grammar typo in it
("device require a parent" -> "device requires a parent").

Raise the successful-initialization message from pr_debug to pr_info, as
this single boot-time printout is useful when dynamic debug is not enabled
at this stage of boot.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-4-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index a513d0d..ac979c3 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -205,8 +205,8 @@ static struct al_fic *al_fic_wire_init(struct device_node=
 *node, void __iomem *b
 		goto err_free;
 	}
=20
-	pr_debug("%s initialized successfully in Legacy mode (parent-irq=3D%u)\n",
-		 fic->name, parent_irq);
+	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=3D%u)\n",
+		node, parent_irq);
=20
 	return fic;
=20
@@ -223,19 +223,19 @@ static int __init al_fic_init_dt(struct device_node *no=
de, struct device_node *p
 	int ret;
=20
 	if (!parent) {
-		pr_err("%s: unsupported - device require a parent\n", node->name);
+		pr_err("%pOF: unsupported - device requires a parent\n", node);
 		return -EINVAL;
 	}
=20
 	base =3D of_iomap(node, 0);
 	if (!base) {
-		pr_err("%s: fail to map memory\n", node->name);
+		pr_err("%pOF: fail to map memory\n", node);
 		return -ENOMEM;
 	}
=20
 	parent_irq =3D irq_of_parse_and_map(node, 0);
 	if (!parent_irq) {
-		pr_err("%s: fail to map irq\n", node->name);
+		pr_err("%pOF: fail to map irq\n", node);
 		ret =3D -EINVAL;
 		goto err_unmap;
 	}
@@ -243,7 +243,7 @@ static int __init al_fic_init_dt(struct device_node *node=
, struct device_node *p
 	fic =3D al_fic_wire_init(node, base, node->name, parent_irq);
=20
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%pe)\n", node->name, fic);
+		pr_err("%pOF: fail to initialize irqchip (%pe)\n", node, fic);
 		ret =3D PTR_ERR(fic);
 		goto err_irq_dispose;
 	}
