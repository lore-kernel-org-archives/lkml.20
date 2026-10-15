Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2F050C2BD;
	Thu, 15 Oct 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058094; cv=none; b=DTNRsAcKZWNK44bJ+1mJfQnU1V8J5W9oBzEW/SU+M9g37lj4EfiRqJMcR38vWY+kkbz8glQv6yti1fpft6wf35Cjejv/d9EdqMMoHx3ErLxx8B6XlyWgpT8qWI7jU1mJJOsyh/k9LFwK/o/MLi0oOvn1FsQgzTHoJjFJtjgrLzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058094; c=relaxed/simple;
	bh=hUkPw4fTTBYjdBNqwZbmvWF/pbbSF/g6/+d98nl/icc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=JlhMyaNjqLvIeg1Tn806ll84RndSmTjYuScs5n4ZTJ+yX71gcZjCTIawLWIZN9D7tdWt7qYmG1AR2nEqKu7Oud/eMCu8dBiElYfFQ0p0h3TBvfcahs9RZB+RJEtZszSX5UN0bSqbe2kiRmHXIaw4Hj0YjI25d7EwdR+Yx5KvsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eutcuSLw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5R97E1Er; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eutcuSLw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5R97E1Er"
Date: Thu, 15 Oct 2026 09:54:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058090;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dAE0bXLWb+xumizodfrxuX60coEO4ZQq/4rT/kwDHVg=;
	b=eutcuSLw2PyDKVDANh1uT0iakF+Vp2S+CvBZj3CNz43dJNTQoEAXXvDAnhH64GKRxNXaxg
	5pcgKEp+QBEZ4Bfa/tFUwNrx/B34BgRd3z4g4ZT+QV+FJlAIdaH7GEYpWOxW4nn752Z6SL
	Cds1BSKwxl3lQ7lplRRDZUZn5wF1fwIrMZOmgDUCAjMdfc91QphrQP4R/3pbGCY9ruCe5t
	pcj1aZI8AA/EbOVsTKNxk/OC+fwQZf0/b57fc+A9dGe8+bFFebLLy8qe6ffcBN59DlM2rX
	W1nWV1xTXh35ZFYC37UA+j3sULm1OmcMNhFDmm2/rJBxSGBbohwz4sFBsjOY8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058090;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dAE0bXLWb+xumizodfrxuX60coEO4ZQq/4rT/kwDHVg=;
	b=5R97E1EreZLGbA+zT1/91zJr+Pp+/QIOivSxIDTaPN30p7QUgyXMDNMjFrOTJRALUvZEAl
	bknzmUcy8+spZLAw==
From: "tip-bot2 for Pengpeng Hou" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/mst-intc: Validate the DT interrupt range
Cc: Pengpeng Hou <hppiscas@163.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920034236.16229-1-hppiscas@163.com>
References: <20260920034236.16229-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205808920.2666988.8224235382909309959.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     16f25d326e5d3b9fd51bc5e3916ecbffbca63e7b
Gitweb:        https://git.kernel.org/tip/16f25d326e5d3b9fd51bc5e3916ecbffbca=
63e7b
Author:        Pengpeng Hou <hppiscas@163.com>
AuthorDate:    Sun, 20 Sep 2026 11:42:36 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:47 +02:00

irqchip/mst-intc: Validate the DT interrupt range

The driver takes an inclusive interrupt range from the device tree
without checking its endpoints. A reversed range wraps the unsigned
count calculation, and a range larger than MST_INTC_MAX_IRQS exceeds the
controller capacity used by the driver.

Reject these ranges before calculating nr_irqs or creating the domain.
Check the difference after ordering the endpoints so the validation
itself cannot wrap.

The issue was found by our static-analysis tool.

Fixes: ad4c938c92af ("irqchip/irq-mst: Add MStar interrupt controller support=
")
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: gpt 5
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260920034236.16229-1-hppiscas@163.com
---
 drivers/irqchip/irq-mst-intc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index b5335f6..1070de5 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -263,6 +263,9 @@ static int __init mst_intc_of_init(struct device_node *dn,
 	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
 		return -EINVAL;
=20
+	if (irq_end < irq_start || irq_end - irq_start >=3D MST_INTC_MAX_IRQS)
+		return -EINVAL;
+
 	cd =3D kzalloc_obj(*cd);
 	if (!cd)
 		return -ENOMEM;
