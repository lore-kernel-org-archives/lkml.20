Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C213F483819
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343344; cv=none; b=dVtlAskZEshnTKGq9WvNuepTGH12zNsoqNT2KH0p7OSBDxevKYAZZcNi1N9knBy9+PfBiRoBtcyi3EV/E+SY68IkhCpaJFdtIiL/XUh/K2fS767IYOz8mnFljaSevBokNDeLK4KQ3XO0AYpUsiosZXbLpTyK6Bhct1wNTdAn/Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343344; c=relaxed/simple;
	bh=hHghBt+ZBftV+/IVmvDQxRKUBfHzFo7ljpRWmkT07jo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DyKQmMaoj0XjnE/CGfMHgttzBvjI8XD8BM/LuQ/ZEpA7/4gLSybCFqIoCUL1ylW7MdIaXEHqCAsB0K/9NjzGqZyX2yZpi5H8gP9/7ZN2Wmdh0gWWiOqOYJRZ9YlSAL2fRth9dAi/9waEkVaVG8C4xN/5xUL+3o0c0BZMPVDLHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bwXnY+VV; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bwXnY+VV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18CE64E4106D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0E826073B;
	Fri, 25 Sep 2026 13:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3C0410328BBC;
	Fri, 25 Sep 2026 15:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xdFjIoG7l4wpkGsWYRN90UCH0YsB2qKFC11fDbb2Fx4=;
	b=bwXnY+VV7prsHmeIRBEEKsVQMCZL5cIjDXHMqnQB/PpPjxn0Rt+sfAyCdn/+dMfvRZQd4Q
	ZUYK+/1LWnVm1BgwP6OCIZW7reXUZ8BSuiVQasvoYHdjrSvVVkXSRglIP3EP5Uc50ulHXj
	cLOaoqjNCsOdvu5Xix3gRrgNWI3mfJZS1WHVtQPgUtcp2JF/WfH03T9BmsqYLErzBdCnFs
	oVw7bqdihhcWiqgYu4wnUbKnAwAWYyMHc+iVagM9HP+SycVq5sOCbE+lSce3z4SRSi7eWY
	1bC9Fy1jf6pNUrTWIl3tLH2G4+6bOMOb3E6MF8QjrOlLCsCVROypZ36vIxQS8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260909223813.69028-1-rosenp@gmail.com>
References: <20260909223813.69028-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: use devm_kasprintf for mtd name
Message-Id: <179034333957.1124555.3178391993877818594.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:39 +0200
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

On Wed, 09 Sep 2026 15:38:13 -0700, Rosen Penev wrote:
> Replace the manual kasprintf() in probe with devm_kasprintf() so the
> name is freed automatically on driver removal, and drop the now
> unnecessary kfree() in fsl_ifc_chip_remove() and its leftover mtd
> local.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: fsl_ifc: use devm_kasprintf for mtd name
      commit: 44c7b273e6b06fad31f2ca166307a41705ef15dd

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

