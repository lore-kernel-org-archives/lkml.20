Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7414D4897
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829274; cv=none; b=Hvc8XrRJE9G+yE6nwijycdaXsGMdlGDvfkeTCcq4kv6bjGLxfrvZxuHU48UT/iC/zl+zbKHuFM7DU+RI4+vn/DAXCc+VK3ABiZHWPXvKnIbKicf9Fnv7f36rALGZfKfF1y65Mdv/Bc9yuOIimebZ6nvVdl01Z5jaQdSY2fuPT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829274; c=relaxed/simple;
	bh=3v34PAL4aAKXYV6ohyBSemkgnCN9JMf9FwutRDfmzX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t4byU/tkjPf+mGLjYulN8GS6RKNIDPqaYKoPtsY+E/w6BGZoNp/fXS12nhfrVhIRE7Zwj5nifMYKwfZeZSmMDoCEtpqe6WQbQMOmAP0+KaghQ2ak+KnYqQxZvvMGIYBER5grEZ96flXkljEqjqDC+FLtHXlrR7FDF4A3tkkYP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vWYjixju; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vWYjixju"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CA49D1A11EC;
	Mon, 12 Oct 2026 18:21:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96FA9601A6;
	Mon, 12 Oct 2026 18:21:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7DF311D70C58;
	Mon, 12 Oct 2026 20:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y5HWKSRRQNv9jBuSNGPG575nkQgXJ5PE8wPbsk+wyPY=;
	b=vWYjixju/Xrmw8WRI8ekFc5byXp/EOf820j67ggwGnAWRWq59UWvM+KWpqtGUAEHjeSqRs
	HRji6c2wQujkoVuwoP8BWrlWZBtKqjPnD4f/BWEMrYRmMr88c8lLZB6+W1+thew3RVHbcL
	ButPThJ4XodZPtzJUyIEwjpcqoVCEdw11p6j88EsKJzaU6ccqrey3f2WE1rVPzFU4UeZId
	cU9AKyrnhpSEp4whJF9fBRYUH+B5WHmz7svmgdqpa2eub/aCzZDmemuHsSItZeo0Wf+bID
	6Y3WVEipKtbmMbzvvQtlLL8F047vJK7SPzjczexxUDr/wwFNGdML6RsBWFA2vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kyungmin Park <kyungmin.park@samsung.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Frank Li <Frank.Li@nxp.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: vkoul@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261002201614.245240-1-Frank.Li@oss.nxp.com>
References: <20261002201614.245240-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: nand: use dmaengine_submit() instead of
 ->tx_submit()
Message-Id: <179182926769.590599.14708999784232940162.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:21:07 +0200
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

On Fri, 02 Oct 2026 16:16:07 -0400, Frank.Li@oss.nxp.com wrote:
> Replace direct dma_async_tx_descriptor->tx_submit() calls with the
> proper dmaengine_submit() API wrapper.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: nand: use dmaengine_submit() instead of ->tx_submit()
      commit: 8bef0196a4e21d4415091de2b6c498320e03ada2

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

