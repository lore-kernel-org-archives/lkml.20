Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215168;
	b=Yu6/2vpvtjtO+OXT5WwFR9qFJgeeJO2/1QxFOXaNkKNSwl+6X4lNi8y+5Pc1DZFqhG8S
	 PqpIR2UjJhvwpkUPA+Tyd6tdYK+7ecywOwUGgD54vw+A0VvP4Qw5lm/LxWlutTbRyXRGR
	 sapInqhC/3ACEMptI3UTiGZOunMhh5mny7jDwwHyywDvNZtOJtHJijtjnB89/QPNo876s
	 nvw6zljMeGEeoOY7yKVlBGYugnJEibL7PjD0ESb4xAPtzZFA7x+3Mgz1xvKRuuE11HDwR
	 W8Hw5xAAArFc6x6VFOZYhdCvSBY1sDnYb7ea6UmxwaruO3Dv71QjEptQ7xVNnSr0osg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215168;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=YwPpzREuujv1a/cfaYRavZt97OtyS5afhZJwZrwwqfU=;
	b=k6U5x/ivySKyzH2imZM4xNOfRHj4CaCBfeiBTf4K/u+tDtGmk3MOgKhm718Bu4D5Qcl2
	 2T9jKJfAg6FKfphfKxi7SiHYo8+m77Ukm6YHpqeIkzc9R7KVPo/mlmK74mts7bBdG93ig
	 earxf2IFQoj1nj80yZ1GuhhuqnI1F/ou0ny+AoD85JpH67UbB4OnBlXRX+c7GpiyqPhWm
	 W0fr6Hg34p8eVgP37IfXYkFS22RDnlj5AtnF4bWqhA58d517cDxp8Wwp5ODNeHST4S2Ta
	 tAfBNNFc/Ye8KJxLyuJyVYfSA19UNytkARvWS+JQWqos5V8P5MWHugzyb3SXR4lQhvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bCWeGFGr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Imua9udO;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E9606A330;
	Mon,  9 Nov 2026 09:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2E9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bCWeGFGr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Imua9udO
Date: Mon, 09 Nov 2026 09:06:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215166;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwPpzREuujv1a/cfaYRavZt97OtyS5afhZJwZrwwqfU=;
	b=bCWeGFGrNlMXrjHhisuqtszzGSEuxWvBVenBYBgM5b5AXHWGvA+l/AYh86zFQsjmRsV3cV
	YHmSrICpqIhKUKfKOkuelzAsC1RjKpXVJg7FT8D/VNwWXe9xCm2m7zhbmr7n/fgjw+99J+
	zu2+Ofa2XMnuoPh+Hqe0MiyQ8GFFt3hV6Su1S3iGqT8YTougFzY/dwNPZKFgNX9bH3i2OV
	lCVdIkFgdn/JR+XZiIwwf3pOWM4Ad+MnlxujPcjRg/2VJ8KR9D00KT4dEstksuoBNF2AuP
	9i2E6mw58+iJaly8epV3bAPZvookiXEObQlZE9nbP3FNGPcFFtG1/hoU1sJ6hA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215166;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwPpzREuujv1a/cfaYRavZt97OtyS5afhZJwZrwwqfU=;
	b=Imua9udOMlg3R+y3B5MQwDR5266NFXqn84yS0TgZL15DGQ60BbavhcJI3Asg75QJOlvjmq
	x5Dq6oSCbXSueBAA==
From: "tip-bot2 for Zhipeng Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] genirq/irqdomain: Add devm_irq_domain_create_linear()
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, Thomas Gleixner <tglx@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-10-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-10-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421516466.2093942.5476984760992767396.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     51987720c2845807161f56f4714df4562f56f328
Gitweb:        https://git.kernel.org/tip/51987720c2845807161f56f4714df4562f5=
6f328
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:57 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:08 +01:00

genirq/irqdomain: Add devm_irq_domain_create_linear()

irq_domain_create_linear() has no devres-managed counterpart, so a
driver that wants a linear revmap domain tied to the device lifetime has
to open-code an irq_domain_info and call devm_irq_domain_instantiate()
directly.

Add devm_irq_domain_create_linear() as the devres-managed sibling of
irq_domain_create_linear(): it builds the same linear-revmap
irq_domain_info and hands it to devm_irq_domain_instantiate(), so the
domain is removed when the owning device is unbound. The return
convention matches irq_domain_create_linear() (NULL on failure).

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-10-Zhipeng.wang_1@oss.nx=
p.com
---
 include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 3ba75a4..d8caafc 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -457,6 +457,36 @@ static inline struct irq_domain *irq_domain_create_linea=
r(struct fwnode_handle *
 	return IS_ERR(d) ? NULL : d;
 }
=20
+/**
+ * devm_irq_domain_create_linear - Allocate and register a linear revmap
+ *				   irq_domain tied to the device lifetime.
+ * @dev:	Device that owns the domain. The domain is removed via devres
+ *		when the device is unbound.
+ * @fwnode:	pointer to interrupt controller's FW node.
+ * @size:	Number of interrupts in the domain.
+ * @ops:	map/unmap domain callbacks
+ * @host_data:	Controller private data pointer
+ *
+ * Returns: Newly created irq_domain, or NULL on failure.
+ */
+static inline struct irq_domain *devm_irq_domain_create_linear(struct device=
 *dev,
+							       struct fwnode_handle *fwnode,
+							       unsigned int size,
+							       const struct irq_domain_ops *ops,
+							       void *host_data)
+{
+	const struct irq_domain_info info =3D {
+		.fwnode		=3D fwnode,
+		.size		=3D size,
+		.hwirq_max	=3D size,
+		.ops		=3D ops,
+		.host_data	=3D host_data,
+	};
+	struct irq_domain *d =3D devm_irq_domain_instantiate(dev, &info);
+
+	return IS_ERR(d) ? NULL : d;
+}
+
 static inline struct irq_domain *irq_domain_create_tree(struct fwnode_handle=
 *fwnode,
 							const struct irq_domain_ops *ops,
 							void *host_data)
