Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A64750EC02;
	Thu, 15 Oct 2026 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058460; cv=none; b=K8EbKX//q3QVcQeYwNMaO/n8cxmO4b9NZZSnnN720Ao1M5EPsaJXP8Tq0nCeKqgOzquRGfkKuX48KUeg6Wjyyz/t+GeUsv+uxydqSugQcku79ekxeRZ+sqdr43rXudk9GqvoGosL9KCl4OIk3Ss2pDydmyLuFu6N8zWwHppNZIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058460; c=relaxed/simple;
	bh=G5k3pgvbYAaFQ0xSIZVKgbErkCs4K80LzxOOo0mi8xo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=dHgMjbj7gG49jG0NWop7FdeXR3ukmH5MuDOik0pBPEzCwNFfY3g+rWr6QgxIIv1fECAK7f9bz5OUFudnMRMljGEmoivWJDiXBal2yAUiRVk2+i+Y3qa6pyb1xA8YUc7IdPgkI8ay9dtXEfMWOafgGijZdHBBGWJPWUhld2B2E+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eiXnPFia; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y+ihuLR6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eiXnPFia";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y+ihuLR6"
Date: Thu, 15 Oct 2026 10:00:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058443;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMPJMlKHboHWaYibbdeGiuqq0FcK++PVC98nbOtv1Mo=;
	b=eiXnPFiamJySKQcmtOU+hE+P3FOKXZmv9ifEi4PC+Ia6fsml4yOeiza3dP0WRJr7Hx3u4A
	pLROVSwqKc9iWQ0O6knY1YwZqZcnCITPdZNH2tdks3dTzrlStM8zOme85mcMyk1NjHUyId
	NKyQRbZbCmQ0ICIXlpFApd3Q88eFwwDl/GmJ0P61vJjpfxk4Bv+uDH8vYtMxC18FUHxDGJ
	nh784n+lSi98x3DZz8MGjpQ4nRPH+8O4vDyD1o3qsSn9MWFTA03UMEjyo8LHTrY5GWabSh
	IDiq7uNJyxy4htIq0qpTpAQLqp34kQDyCMNG/9p0GIvj7JBEdnmM52gv8g8cYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058443;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMPJMlKHboHWaYibbdeGiuqq0FcK++PVC98nbOtv1Mo=;
	b=y+ihuLR67C6/lTJ0lTLA57WSs5DWEGAhPmdngCEBhdmQY9l8EYVs/PYk9zXWu8ZiUxzlms
	LPdZwzq4mIHy6pCA==
From: "tip-bot2 for Fuad Tabba" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3-its: Don't free a vPE table shared
 with another ITS
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925085000.753400-2-fuad.tabba@linux.dev>
References: <20260925085000.753400-2-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205844226.2666988.10895723927443358117.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     32e056cc1d1582951f981113ca8b98914f29c32a
Gitweb:        https://git.kernel.org/tip/32e056cc1d1582951f981113ca8b98914f2=
9c32a
Author:        Fuad Tabba <fuad.tabba@linux.dev>
AuthorDate:    Fri, 25 Sep 2026 09:49:58 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:55:41 +02:00

irqchip/gic-v3-its: Don't free a vPE table shared with another ITS

On GICv4.1, its_alloc_tables() copies a sibling's vPE table baser
rather than allocating one, but its_free_tables() frees it like the
rest. A probe failure on the copying ITS then frees pages the enabled
sibling still points GITS_BASER2 at, and the kernel comes up running
on that sibling.

Mark a shared table so its_free_tables() skips it.

Fixes: 5e5168461c22c ("irqchip/gic-v4.1: VPE table (aka GICR_VPROPBASER) allo=
cation")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://patch.msgid.link/20260925085000.753400-2-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v3-its.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index 872d342..259ec0c 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -87,6 +87,8 @@ struct its_baser {
 	u64		val;
 	u32		order;
 	u32		psz;
+	/* Inherited from a sibling ITS, not freed here */
+	bool		shared;
 };
=20
 struct its_device;
@@ -2605,7 +2607,8 @@ static void its_free_tables(struct its_node *its)
=20
 	for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
 		if (its->tables[i].base) {
-			its_free_pages(its->tables[i].base, its->tables[i].order);
+			if (!its->tables[i].shared)
+				its_free_pages(its->tables[i].base, its->tables[i].order);
 			its->tables[i].base =3D NULL;
 		}
 	}
@@ -2704,6 +2707,7 @@ static int its_alloc_tables(struct its_node *its)
 				WARN_ON(i !=3D 2);
 				if ((sibling =3D find_sibling_its(its))) {
 					*baser =3D sibling->tables[2];
+					baser->shared =3D true;
 					its_write_baser(its, baser, baser->val);
 					continue;
 				}
