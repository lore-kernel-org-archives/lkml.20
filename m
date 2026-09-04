Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9C3EC807
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545341; cv=none; b=lbagmZq4UpPlWOh1pIKxlrmh+FApNAU+fF7CZQ5tUxP5zcryAtT8xjB1ThWDePXZKPmjcg6QLB3alIfAiX9yBIxaPXlMztzrFHfR5oRetmw7qvTQKIF9o3twFkmFpovKxQI3r+od8LTECfQH8Y3PZ3Sm2OsMSk/t3vHxujjgj3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545341; c=relaxed/simple;
	bh=W0pO2HMmF29750rFT/XWwOgKkIFCy5jFie5QyJXfrO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z84P23NhKcg5xc1J0eknrEoX1krW+ZWtsh7TmHy3q8Lf3Jw9Gb9PimQGZt8jYplNlMqjGb1P5Rc93u0hDxq+h81v13oKwfsQa0oQvx0UNXk5te1oo6ZYgADwwJseLczMqSCqeTrXtMIlwQtqMKIQG/QgoWUoo7lTp5zPYj2JkX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WcUwz29W; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WcUwz29W"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 531B11A19BD;
	Fri,  4 Sep 2026 18:08:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EEC56057F;
	Fri,  4 Sep 2026 18:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37A6E11C79351;
	Fri,  4 Sep 2026 20:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j4WYsjf4Cy8Z2k9MMlIQzTyq2kSGri14XOQgwZrKrZQ=;
	b=WcUwz29W6GBQfVv1sKpHBxJ3tIIHdMpjyltzwMqM7E8uo+QSIjaKSVTxOqCyKAM6qzpthV
	L8oyzWLYxBvTKwOvUJeshQAw+X4dQP+eMXsqcZCjFIlyIBBCXnlA54p+hfqwpLoMat9jnP
	LGecT8NXpUECswH5BOFFZOLV9Y4b3ilzMfCIeUaQMnZQ26xgla33q0Tw5n8qxtCIttmDdB
	WgragRpleqjk3jUFB3crEdEOf0wOqDY8xCB1+T11/pueVo2kH3lpCc4ItuuIHx5AGiSqMd
	H3Inx0tkWmdzzq6looMXuks+zAUfE1dtAfbBS8Qn3+5ugy8XCzI/lJRnNf3tuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260812103728.39291-1-phucduc.bui@gmail.com>
References: <20260812103728.39291-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Propagate errors from optional
 IRQ lookup
Message-Id: <178854533214.1533016.12286448974222706234.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:08:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 12 Aug 2026 17:37:28 +0700, phucduc.bui@gmail.com wrote:
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, in which case the driver falls back
> to using the ctlrdy IRQ. Other errors should be propagated so that the
> caller can handle them appropriately.
> 
> Treat -ENXIO as the only case where the driver falls back to the ctlrdy
> IRQ, and propagate all other errors returned by
> platform_get_irq_optional().
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: brcmnand: Propagate errors from optional IRQ lookup
      commit: c9e20e213bb051d02711155de0dc4759de2faddf

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

