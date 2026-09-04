Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC73B42C9;
	Fri,  4 Sep 2026 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511329; cv=none; b=T/7h/uqYqILJCRkveNMmYt7H4I4AmR1knl0Nao4k9Y/ro8wuLQc1I+Grh9lXZEZcby1ApaE7LdvSEVT7PvdeHJWhwiX5wJ5LBc/LTkvgyFtD9p2sD28qw3RDoU4n7YI4BRu1XQ4oiIbqVBhIvdNCrAi2wKa8Y8Qim54JUMfxg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511329; c=relaxed/simple;
	bh=FKNu7a4uf2Rz1WrdpMmKzwxQ+L8qiFRHWOp8QSr23+g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iOUhNgK3Nqllp2M5tHps8T+aMAr0xdaVTyLlG9TkMltVa8i9PzaYrqGFTFGN0etuNNUyXHSTxmCV5BT6BaOklzu0l4iWTDmJisMQQsWfE/rmxuyjOPUsN18pJZEFgAiIr/XZymnG/KjIY0t4tU3TkMSG/w1HeBSvgRorZ/Jd0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I5DaU36/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=melSIv+b; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I5DaU36/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="melSIv+b"
Date: Fri, 04 Sep 2026 08:42:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788511324;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSxDjwkt3SPBlUUsiUNEbmZA+kDgNAyQl0KuJQ6BUoU=;
	b=I5DaU36/XALBSdfuB8kX2uyCZu6v0nmRZjD8QlwhX/AcLVur3ZHi2NWT3SVGfCU22FffHJ
	z0zzRw6bPDpKU2ZjQZjPCgbZ6VDwFWcw0g2caU2G0h7NEUZJ5FPCmu5WjdEwxzO3UOS8Qd
	59tirmBseglK7T0ThT5kL5pJGM+OnvBontByCYzV2QJfHRMw6g1wwkYHKZOl2uRcwqs2r6
	IaKxKEqY/oTP0bMYL+AtOl8NZfkKnJNCcZSaP+d3HnenLYJZhxaGHPosyuW0EciNXw7Scs
	bMixSFbQXriI+MU12HQ8Sgns3EzCGSDqokDF1zYtz+NhcOt5KU5DRxhHke1tGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788511324;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSxDjwkt3SPBlUUsiUNEbmZA+kDgNAyQl0KuJQ6BUoU=;
	b=melSIv+by+Ivt15SUPhdcDdbF8d7tmf3SKRYEH1o4Rsad4jNnusHGWR1chw7oKVjzkfYeU
	JOwMoINQMoVXAUBA==
From: "tip-bot2 for Jiri Slaby (SUSE)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/urgent] irqdomain: Delete irq_domain_add_linear()
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, x86@kernel.org,
 linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20260901070450.255507-1-jirislaby@kernel.org>
References: <20260901070450.255507-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178851132292.3717435.3188183058570404204.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/urgent branch of tip:

Commit-ID:     797b13a7de957792c1b4773aa2cc3dab4621fd9c
Gitweb:        https://git.kernel.org/tip/797b13a7de957792c1b4773aa2cc3dab462=
1fd9c
Author:        Jiri Slaby (SUSE) <jirislaby@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 09:04:48 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 08:40:07 +02:00

irqdomain: Delete irq_domain_add_linear()

7.3-rc1 is free of calls to irq_domain_add_linear(), so it can be finally
deleted.

According to Dongliang Mu, the related paragraph in the Chinese docs is now
obsolete. So drop it completely.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Link: https://patch.msgid.link/20260901070450.255507-1-jirislaby@kernel.org
---
 Documentation/translations/zh_CN/core-api/irq/irq-domain.rst |  4 +--
 include/linux/irqdomain.h                                    | 18 +-------
 2 files changed, 22 deletions(-)

diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/D=
ocumentation/translations/zh_CN/core-api/irq/irq-domain.rst
index aaefeda..7317cf5 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
@@ -90,10 +90,6 @@ irq_domain=E6=98=A0=E5=B0=84=E7=9A=84=E7=B1=BB=E5=9E=8B
 =E6=98=A0=E5=B0=84=E7=9A=84=E4=BC=98=E7=82=B9=E6=98=AF=E5=9B=BA=E5=AE=9A=E6=
=97=B6=E9=97=B4=E6=9F=A5=E6=89=BEIRQ=E5=8F=B7=EF=BC=8C=E8=80=8C=E4=B8=94irq_d=
escs=E5=8F=AA=E5=88=86=E9=85=8D=E7=BB=99=E5=9C=A8=E7=94=A8=E7=9A=84IRQ=E3=80=
=82 =E7=BC=BA=E7=82=B9=E6=98=AF=E8=AF=A5=E8=A1=A8
 =E5=BF=85=E9=A1=BB=E5=B0=BD=E5=8F=AF=E8=83=BD=E5=A4=A7=E7=9A=84hwirq=E5=8F=
=B7=E3=80=82
=20
-irq_domain_add_linear()=E5=92=8Cirq_domain_create_linear()=E5=9C=A8=E5=8A=9F=
=E8=83=BD=E4=B8=8A=E6=98=AF=E7=AD=89=E4=BB=B7=E7=9A=84=EF=BC=8C
-=E9=99=A4=E4=BA=86=E7=AC=AC=E4=B8=80=E4=B8=AA=E5=8F=82=E6=95=B0=E4=B8=8D=E5=
=90=8C--=E5=89=8D=E8=80=85=E6=8E=A5=E5=8F=97=E4=B8=80=E4=B8=AAOpen Firmware=
=E7=89=B9=E5=AE=9A=E7=9A=84 'struct device_node' =E8=80=8C
-=E5=90=8E=E8=80=85=E6=8E=A5=E5=8F=97=E4=B8=80=E4=B8=AA=E6=9B=B4=E9=80=9A=E7=
=94=A8=E7=9A=84=E6=8A=BD=E8=B1=A1 'struct fwnode_handle' =E3=80=82
-
 =E5=A4=A7=E5=A4=9A=E6=95=B0=E9=A9=B1=E5=8A=A8=E5=BA=94=E8=AF=A5=E4=BD=BF=E7=
=94=A8=E7=BA=BF=E6=80=A7=E6=98=A0=E5=B0=84
=20
 =E6=A0=91=E7=8A=B6=E6=98=A0=E5=B0=84
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 73c25d4..3ba75a4 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -752,24 +752,6 @@ static inline void msi_device_domain_free_wired(struct i=
rq_domain *domain, unsig
 }
 #endif
=20
-static inline struct irq_domain *irq_domain_add_linear(struct device_node *o=
f_node,
-						       unsigned int size,
-						       const struct irq_domain_ops *ops,
-						       void *host_data)
-{
-	struct irq_domain_info info =3D {
-		.fwnode		=3D of_fwnode_handle(of_node),
-		.size		=3D size,
-		.hwirq_max	=3D size,
-		.ops		=3D ops,
-		.host_data	=3D host_data,
-	};
-	struct irq_domain *d;
-
-	d =3D irq_domain_instantiate(&info);
-	return IS_ERR(d) ? NULL : d;
-}
-
 #else /* CONFIG_IRQ_DOMAIN */
 static inline void irq_dispose_mapping(unsigned int virq) { }
 static inline struct irq_domain *irq_find_matching_fwnode(struct fwnode_hand=
le *fwnode,
