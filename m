Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A63F58C1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910769; cv=none; b=QvVaRmMIOr0ntSJ3+z6LZoFclZ6Ctloetpv6jYlb0uoP7pkXeQd6JtzSBMKEftZDNjFro6rgPQWMt3n19KL2k5318A1016arWzb7u6Px7an/zRdSFSJnHRYXXzLg8grcqZfzodI/aNhjiVEerlA3wTOXFyFQ0576kvYj5e4Ao4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910769; c=relaxed/simple;
	bh=W8cLzdEzZ5Ap4tfq6FxzvSdFoOno9NNgdBoa9KGtiPE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Recbu9f4yK7YrpdIxwuVzUQFchXaBeBVLC43Up2UaViUUWLoAJV72p2X+oVuBR6WK9J2QMPfHuStZXgJ8gdRhfFzEWkS2+UjaZj2hJ04OC2cd4XM7frJSGebbgm5Ve+G6uQlh/0H38UzP57KyoWPrjkRW4hGQ6yDw9YXNAfS9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e7X9a7PR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e7X9a7PR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5953C5CD5C;
	Sun, 20 Sep 2026 13:26:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22BF96033F;
	Sun, 20 Sep 2026 13:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7C7B103286A4;
	Sun, 20 Sep 2026 15:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789910762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eVq1UjiuukNj5t/1x+aogDljrB2G+SQdHnTWKmTTTw4=;
	b=e7X9a7PRFMpJjFeyG3J6ohbQXrp01dQ2yrJ/+trKMZub0zqCBrZ38IhRq9ZbQA4xIFHa/u
	qNmZiqaFqZ/K8b7VT8+l4y7lZe5t+Qj1DVXlOafpTf4ZQHukY2PVryJl85qXE0xQD7y+vX
	wNrsPjtcOocqYQFnu1Gc7qQ6560c7RMc8NENeoG9hMmtpKLpzJA2LR75j9l1NesKnvStSk
	M6nSjx5VfqyT8QpWkJcuk/w8Y0LqgVJ1j7mgdC8vrrRZDP42S6n7m+eIGwgHItGiRDxKxz
	wNvqVwqhUZ4RXfB25dFjBtnp3DNJaBxQL7ItGqUmthBPYNIgI5VFOVUC3suqPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: r852: Prevent card work during removal
In-Reply-To: <20260915144543.3466083-1-lhfff@tju.edu.cn> (Yibo Tan's message
	of "Tue, 15 Sep 2026 22:45:43 +0800")
References: <20260915144543.3466083-1-lhfff@tju.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:25:25 +0200
Message-ID: <87zexc837e.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 15/09/2026 at 22:45:43 +08, Yibo Tan <lhfff@tju.edu.cn> wrote:

> r852_irq() queues card_detect_work when card state changes.  r852_remove()
> currently cancels that work and destroys its private workqueue before it
> disables and frees the IRQ.
>
> A card event in this interval can queue delayed work on the destroyed
> workqueue.  Its timer is part of struct r852_device, which is freed later
> in r852_remove().  KASAN reported a use-after-free in the timer code when
> the card interrupt occurred in this interval.  The same test completed
> without a kernel diagnostic after this change.
>
> Set a removal flag while holding irqlock before cancelling the work.  The
> IRQ handler still acknowledges and disables card events, but does not
> queue more card-detect work during removal.  The lock ensures that work
> queued before the flag is cancelled and later interrupts skip the
> queue.

Why don't you just disable the IRQs? There is a helper for that.

Thanks,
Miqu=C3=A8l
