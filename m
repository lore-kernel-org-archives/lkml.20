Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC27332EBB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343343; cv=none; b=XREzYhfeWdb80MopdTmDpjDUpomFbbUIdxiL/kNBN6T9hxck71mVDDB5SGTLPGJtddIwa1KBsLJn63LjOKQnEhn4Ov0+bK5FfCU7K8lzhtWyDEdWsPe/FzLLUFcaN27eOPMeLJzdcAJm3o+9XYrX8+uLrfeguppzy3CLcC3KoDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343343; c=relaxed/simple;
	bh=bHzxA0lbo4l25hLeoQdhUgY51wIMdl+PHARGJ7zxZsc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BMBcekPXvgaO6ErRBFhThisaWNRuC515BCfGWFrZW3s/fennyHE2OWIFJL7xOmfn6hYFMhbcGEu8OSf4B8WC3r5ZUOItp6Wo9nvUvpBPkD0b+6De5catadDb6dLy6qZJL1Bs+om9vwM1sfQFDpe9pVEQKz5+jEYChuk9iXO9Oxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w4X4ZTsS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w4X4ZTsS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 59F974E4106C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 277EC6073B;
	Fri, 25 Sep 2026 13:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACC08103293B8;
	Fri, 25 Sep 2026 15:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G1Wm7AVF8UyDQXfeTyu7vO3i2xBbH7wOzsVO6JlTT+Q=;
	b=w4X4ZTsSd85qx4uNBVTYxCqQ8+RCkOXnbt2hWgNW5UVkEF+Rbj1UXwmEXJJl1Bv3E2bNcc
	nrWD1etOndyRiphurQB6Yxr6XnM0XKmSuN9KWgfLOijIt79+KMHETc1I4zRZF3xI4SKisW
	2QMywd3EwqpBTE9tpVOexoySwZeT3mIZQPiM4nj+JX8zrt/BSaeEms9anh//+03wFXVl+p
	QLfkppqtkr/MeuWkif4Dhh8zPqs6R4Top8JFUIbuWc/9tU9w6TGT6vv/znDa56grtx3zlC
	+JeVz3WhPyN/ws8nWQL8AvfjJDz/bj1hfbVcZ/9RsKU12xX0Lpqlpk9V7YOMFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260909223521.67572-1-rosenp@gmail.com>
References: <20260909223521.67572-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ndfc: use devm_kasprintf for mtd name
Message-Id: <179034333329.1124555.11164578898027570715.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:33 +0200
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

On Wed, 09 Sep 2026 15:35:21 -0700, Rosen Penev wrote:
> Convert the mtd->name allocation from kasprintf() plus a manual kfree()
> in the error path and in ndfc_remove() to the managed
> devm_kasprintf() helper. The name is now released automatically with
> the device, removing the need for explicit cleanup.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: ndfc: use devm_kasprintf for mtd name
      commit: 5e73728a875a91fb2c7dc527f7391da0205f85b1

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

