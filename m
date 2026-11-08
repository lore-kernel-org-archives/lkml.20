Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174579;
	b=kDHyCnB5nVyv6spWpiy2rV9r3DEL1SAI29xFLYWSZdW6uu9+3X5fGehxtHjjfOvzADxF
	 sxVk7Qdxw6xPCHQmf+qFyZB9zybp1QEBKs5lczx6OMQPx03VTbafN2DgctZ6GlL1eg+vA
	 zlLff7lN0zgVhsZL2acOPNZinN4a9qKXJ2YfdOMLEUnF094z0/tyvFtA894cJkJaavfBP
	 jeM5qv833LkM2MCwR4E2dpHvG0RQ8EFqTmMGls/uyfoRXlze3t2TWS7QiSdpFNfubcKDF
	 fB/krJU3wwm41VxT3SfbA1mrIAcB1LTiin/gpQcZ2wci1UUYD5X3Ux8WAlFcr4ojgOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174579;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=KFPAacR3ZSEdhOATUhQzQ2plE5F5/Xupnk5prIZHxcY=;
	b=URFZjlIQRWdW+OtAPF3FdfWGn6oMyajzlexTzvQHOMAVp7jEWyeONJhntlTkm09NPhSR
	 XOXmBkdffVjA1hjgqycEYY1XjbF1U+qxovpKDdhy7m6CBNLtnba60qesYcNUqMr0yWcj8
	 +4go2vxQFZSm91aT05vKxPZ7aqkj3Yhq/zRNgQ4fFTciShcoo1D0BOjx1Zjotsp48jkTq
	 LdaylyVTIaTtFKv6HMXBYkRseMxjrZFtNC2Q3opU4CY4tZb1GOtEwDXY8LJwhKiexF/8v
	 YYLGR6mFRh7iusT9C/Y6rtygIxv0dj5rmJNdzQaOgoF4723DFUnbP0YDb2rHhQIWbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rVAweZ3B;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="E+ZHg1/A";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25372606A330;
	Sun,  8 Nov 2026 21:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25372606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rVAweZ3B;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E+ZHg1/A
Date: Sun, 08 Nov 2026 21:49:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174571;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFPAacR3ZSEdhOATUhQzQ2plE5F5/Xupnk5prIZHxcY=;
	b=rVAweZ3BF9OCSWq2/HqZbU+gMs2SHu6O+FoYg2ig5vd7506eK/cniNRkmWolPFheaeB1Xr
	3ZHb1GOSSwaujJpewfVggVOr7fnqTaaJlMoNc1IDlOcuO6QZLozSMxlQzaLaC0as93WM4q
	DIZyzGXIGsW62+mL7koZKuLCys3xBk1O6+oCpH0VaTZmlSraFyciqlMoIgMwHs344Uk5zQ
	2wXaGMXtUzCFrnJMUM4UPev1Q9j6Rh+un7yLJnJ9cyV7uDOJtwZmd/3NWePpKIrdP/YFt/
	ga709i/hzP7i+FePagvI2dVUgvvWgiuRPBifcdsOewExPfnZDxXB0FqinrmSqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174571;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFPAacR3ZSEdhOATUhQzQ2plE5F5/Xupnk5prIZHxcY=;
	b=E+ZHg1/AS426G1BQzOdvU766Y2or0fDIEEv2wwlhDFIVEEiRd+0yJQ0mGpqkb7Agb154SR
	EiPtYxPXG8B20yCg==
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
Message-ID: <179417457003.2093942.1785721322103496168.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     8d095487a7bef8e060e360eb4d85aa1ab0fd62a5
Gitweb:        https://git.kernel.org/tip/8d095487a7bef8e060e360eb4d85aa1ab0f=
d62a5
Author:        Zhipeng Wang <zhipeng.wang_1@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:57 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:44 +01:00

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
