Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDBC490C1F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058629; cv=none; b=CMfhfpe07+rz0RIXpT9ia/s8G+A//KPVdncq4RtcWRQ+bqo/JXDHFUamYcKcN3XhpuTSXQZXRtwCFq8Uv2oMGWu/5+6F3+q9ouAZHJL4CLZxOdMYRM3ReiJP5xbKZt+pxudxOGTqK68Mxu0x416ULGMFtPWDVSYmQOcOCb3SApo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058629; c=relaxed/simple;
	bh=D3CxsJn/Jj2PPvSS3mvcrxcs87Wgh0gGexSX9GetVaQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IyoKemQNj5ajV+ImsyF5/uAw6wxbMEXuUJgiZEIBaNKM6LZeiFopw3MT26bGdAU2MupnirhmeeBqAAWqwK5xo0dsz7Bpxq7Dlq6KXsdnY5S1bILnjbf1W7TYmh9goTnjDGtzxlEcQRy5Bj/l2NAUN7DUPZT5ctSUld7XTUPj8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VVyaTMfG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VVyaTMfG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C109D4E41247;
	Thu, 15 Oct 2026 10:03:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94E5860360;
	Thu, 15 Oct 2026 10:03:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F1A810328B70;
	Thu, 15 Oct 2026 12:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792058619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=D3CxsJn/Jj2PPvSS3mvcrxcs87Wgh0gGexSX9GetVaQ=;
	b=VVyaTMfGkquhuGj/vK2qMZKH3dkfe/WybRVoW4OQSav3TELqERgffvIAZRqilEREBLneAB
	FDkwZ+J2yp1LJcwXzifafmu/hi6ihUP8wS0C4Oyvj1lMzLk7mSR92scymTzM4LDGJtjsUT
	R8X2AqU2GTtgkJiXyUK0P1MeAAk5459W7TJSKCuyGNNGsaQX4uU60Fc8O5B6Q/FSxRx0vh
	ZTGuOfEUn/zBA7xJEnr3gJ7SdzIzez368cwGx9qezReCZiHnUhU1+66s0tvxazROvdJOlp
	FSY5EaRU5Ey7WoP2bYIJAGyWsdn0MSGXOvIYOy8zYSuW6x8rQygGIe+4OSdIug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: fix missing kernel-doc
In-Reply-To: <20261015084219.887963-1-mwalle@kernel.org> (Michael Walle's
	message of "Thu, 15 Oct 2026 10:42:14 +0200")
References: <20261015084219.887963-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 12:03:36 +0200
Message-ID: <87bj8vwa9z.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 15/10/2026 at 10:42:14 +02, Michael Walle <mwalle@kernel.org> wrote:

> Commit 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into
> sfdp") added the kernel-doc but missed one description for bfpt. Fix it.
>
> While at it, also add documentation for the return value.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610040802.yD5XKM5i-lkp@intel.com/
> Fixes: 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
