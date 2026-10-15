Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF8499F31;
	Thu, 15 Oct 2026 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053834; cv=none; b=Riza6hDuKuTb/v6n87Lt6ubUOL9j2AjkZkfT9lZdcN6TsZbshFB5e0p6Ye2uGAOpPf6SeAf3dKlYoF6pAkKp2o7C50zmkttkwdwfpoQdZchFeqYOa6qk46a6sViUQUmKY11Sppzl+mjfJhVXIMW7lzOAYE4LUWLqjgTgC64fTTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053834; c=relaxed/simple;
	bh=N22jOhnMmbO0PEueV4hnR4cRkzA0xYo7ysyRh2jZep4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=sSsGZY/BiugoA0ZrY+kFX51FQuX/Stu/CluM9UWfvvLCRLTfHVFVo5Sog6szCjisxKf2SmtCgNwJYYLDty10suhT3af0YScQujBkmx/cM3SAcFq9tZGaPYqNrr8UwSaYfZt/t3oX85xkFtGZkCmzFfkqN4wBkH4zofEZFa/6QMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZeR5Lkl1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dPFP0IBP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZeR5Lkl1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dPFP0IBP"
Date: Thu, 15 Oct 2026 08:43:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792053831;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9YiP1qVYQeDBoZTZit3zFa3XMZYWhDah41Wj/4T30I=;
	b=ZeR5Lkl1sGWbEV7RgN5fj8dhsjJqUqp/HgUQUBzDBLmYxVsF7beqYksAOEbu+xcT6qqRNe
	XLVEehPZWL9pT4ZHG5gzU6OPN2gOOl1BTmiIMmxQkSq6mE79FA65HA//9P3yRu1MlK/eKt
	lb6r9W8IZ0J0mC+IYYvhJNR/DvRnAzMuqM27ndMsfx5QKOTJPB95A4hud1wdUcHJLmqGGx
	271zcrLIF7LF5IPHkDAuEZnBTmqb6sqwOMJdHaFMVlq27SR1QmsCaGYzPeFXwNBxmRJHm9
	URjtKKMrCvIIesZWTHblcX1Pswcwx/vIidYKZlhl8ty3ONIP/a/Yhmnd1UkgUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792053831;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9YiP1qVYQeDBoZTZit3zFa3XMZYWhDah41Wj/4T30I=;
	b=dPFP0IBPTtztag0ByqxQHxH5izb8RFRb9Na3vYJBZ2aVzHofsnRlTZK8zaQv8MvzBPAwQQ
	UpCU2gkRn4yfjbAw==
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
Message-ID: <179205382991.2666988.7817259869299860508.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     86e390deee76e4a3d8a670ed17cbef32f1f8de5c
Gitweb:        https://git.kernel.org/tip/86e390deee76e4a3d8a670ed17cbef32f1f=
8de5c
Author:        Hemanth Selam <hemanth.selam@gmail.com>
AuthorDate:    Fri, 09 Oct 2026 12:18:07 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 10:38:14 +02:00

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
