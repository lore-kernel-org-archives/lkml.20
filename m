Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16E44C14F3;
	Thu, 15 Oct 2026 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102788; cv=none; b=qSycybpTVnfQXkpllU8mLFTviMuAJM+aBrtQReK7w36CdFI+Qolrt/oHSQVWAMCsLr2iJQJyjIiFfq4mckTaqr1o8QbA+70p1xCrnslvFj7D7yVIdR+sxD2bYs+kkenOABqn2dicPj7fQwf0sAbajH5mh7ZYE4DhgKRGN1tzXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102788; c=relaxed/simple;
	bh=EnypvhJFYeFJrWkA63Xl63nl+ZqPIi0XVX3o28rLCa4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Hqb12PVeW3vl0rebxowuSHPnm3dZlTLUaYPFwhOzZ2+HEHWDUXBqSfjSmXU0UzRBiGPj1ol4iLIZIFDOv3wsxx6KedNH9t31oe0r4qfuKYZ137SzndRJuYvRN4hCalC6QRdFQT+nAurq5kICHBBnWI1xLA/jpMLiNpbI12uZCy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EPEK3RZA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fi3CNCtw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EPEK3RZA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fi3CNCtw"
Date: Thu, 15 Oct 2026 22:19:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792102785;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CuhuAwdyEte4j2qGoMCj0miJUdQtVWm7XXfeJcRzHoQ=;
	b=EPEK3RZAorb1g+3AG84LUQ2EfG5Lj4RleXnnye/adkztgSxd+6zoTyqBCsdA62n5ZHDA4H
	P72xkRT4d3g9hgkB2Df3HDpngw4WxlwR/tK2q1SRVf5J9opzA0LLOT2dNCkhrsPitNSgZG
	XtPJoxdecXnzmdUSTgtK59G/A9BYnzRf/WTDf7vR6gTyiNtZGkphJfj5cflr/eVWH63mie
	jUBf+e6h/GaKFksq9JoXG5s4z1xA6ED2LG7JUSuLoK50WQiuhh8pXP5zA+vw8dNIHQ/PeJ
	SFkuazIF8owXqCoFnr4klVm2wXq93f0xgcvz2oInSd4gvyNVWbVzDInRwm5xSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792102785;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CuhuAwdyEte4j2qGoMCj0miJUdQtVWm7XXfeJcRzHoQ=;
	b=fi3CNCtwlUk5y7nX5eRCbvtqZyshRd22LoTTdR3wdDNpK0duxGF6Srhqz3X0OYC+5PYpa2
	F5WB8Js7hnkz5jCw==
From: "tip-bot2 for Hemanth Selam" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/core] genirq: Fix typos in comments
Cc: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org,
 maz@kernel.org
In-Reply-To: <20261009064807.70345-1-hemanth.selam@gmail.com>
References: <20261009064807.70345-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179210278354.2666988.9904907197528542335.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     d2fa415329c138117c870069ebeeb9ac67caf5ef
Gitweb:        https://git.kernel.org/tip/d2fa415329c138117c870069ebeeb9ac67c=
af5ef
Author:        Hemanth Selam <hemanth.selam@gmail.com>
AuthorDate:    Fri, 09 Oct 2026 12:18:07 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 16 Oct 2026 00:18:40 +02:00

genirq: Fix typos in comments

Correct the spelling of "descriptor" and "preceded" in the kernel-doc for
msi_insert_desc() and msi_next_desc().

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261009064807.70345-1-hemanth.selam@gmail.com
---
 kernel/irq/msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372..b22d744 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -142,7 +142,7 @@ fail:
  *				insert it at @init_desc->msi_index
  *
  * @dev:	Pointer to the device for which the descriptor is allocated
- * @domid:	The id of the interrupt domain to which the desriptor is added
+ * @domid:	The id of the interrupt domain to which the descriptor is added
  * @init_desc:	Pointer to an MSI descriptor to initialize the new descriptor
  *
  * Return: 0 on success or an appropriate failure code.
@@ -416,7 +416,7 @@ EXPORT_SYMBOL_GPL(msi_domain_first_desc);
  * @domid:	The id of the interrupt domain which should be walked.
  * @filter:	Descriptor state filter
  *
- * The first invocation of msi_next_desc() has to be preceeded by a
+ * The first invocation of msi_next_desc() has to be preceded by a
  * successful invocation of __msi_first_desc(). Consecutive invocations are
  * only valid if the previous one was successful. All these operations have
  * to be done within the same MSI mutex held region.
