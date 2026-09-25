Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C736E4AE8CD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346538; cv=none; b=WcYzbErsSJi82T6Bx9VvietH7bbpQfRBou6bagDu7FKhpTbq6pkNpVrciSAKGj+mqzbOojsH3D04AGPXeEi4fJXyJdXnnQa+Lh/8rUglI7/O5dLR1RGO5+9CmwiR6xgl8mWQZ6TA9MjFFiHGKBhynUXAJ6X46uJmfw4hHhXZqok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346538; c=relaxed/simple;
	bh=peEidNB2RBQEknds0XX1HZpVNQih+6Cc7MyjXwfpH4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a5huvM/GNSEUiuwsnmqyuEB86ivbUYNxZWBDUC0q0Vj0Mem59qGA2KyPPI/S+e/FfC6wZNE6l/M+GDLuakD2xezAZzYuX6eiwXuTXHWTITUcmkvlvnFhPynxJ3ftV9zAph+Azsb01QZeD4F6aPDRizcSOFjcd3A+Wl1QL4IR4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nfFMo+zD; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nfFMo+zD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 144E3C653F9;
	Fri, 25 Sep 2026 14:29:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2682D6073B;
	Fri, 25 Sep 2026 14:28:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7472102F08C8;
	Fri, 25 Sep 2026 16:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M7tarLas7ZMtRvHTrqM/VoWT03+EigFjx6K5ugriU1U=;
	b=nfFMo+zD9Myj169hq1OhA5AeFRbqr0xDeYGbePu9VH8iVKfuSz4K2e4NR2t3m+kqnLikke
	2G1AOve8HXcGCPgr9GBReVYAnk3gLyrZ8+ynyPWE+r2HXlzOVn5SAhaWAcsTV8mcFVQ1JH
	Pixpy0oVdBs0a95tOa3tfibra3eGuS7mlG2lKvV0eyRaVwkPLZfr81V2K4Qrg50Oo5NVIm
	vWK0yg9OSFWeMNJadVcvyxkSnEyLDxKGUdNRERrkUg4J5c9Q7YB5ztY1NEtIR/MGVga7TW
	1Pq/7H6ef7QjzLVfuEyOxFLaJGiFDkchH7/EJK05CD7KQthvdHjkUHI7d2SxeA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, 
 "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, 
 Richard Weinberger <richard@nod.at>
In-Reply-To: <20260917145329.380628-1-rw@kernel.org>
References: <20260917145329.380628-1-rw@kernel.org>
Subject: Re: [PATCH] mtd: Call get_wunit() on the master partition
Message-Id: <179034653329.1166139.18340436218142958229.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:53 +0200
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

On Thu, 17 Sep 2026 16:53:29 +0200, Richard Weinberger (sigma star gmbh) wrote:
> The code checks whether master has get_wunit() but still calls
> it on the child. Fix this.
> 
> 

Applied to mtd/next, thanks!

[1/1] mtd: Call get_wunit() on the master partition
      commit: 904f18430e8cce829cb9130eab7a93020e33fc89

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

