Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5E47A88D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395544; cv=none; b=fpsidsNr7xQkHJ+iT6jFD8TYNpeU96be/Qj2cOQPc/JzrMLVwT3iAhr8k7VPZC8cb1TPimtBl/FvRyZaDabg6E2+kt0aPhRKCZcAEVOA7VCWDyDvq5mULVtTRjC0pAKfl4XSUK9kUkq0Xj8jIPxlgiATKHQhvHhjcOOFfDJ7Oz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395544; c=relaxed/simple;
	bh=6lFszZpe1MD/RXf6Q+9dSQJDvm5qoH7GC4WytpenaaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LlFJ4xNlrSdcbTxOJR2Do0vb0dH18vbEPFXtjRkr/pRsPtnX5jlQen55zyyLzo2kt+HxP4EtWWNOVSsNG5xvF6+AgeOZKMOuaJRtDRls1LqkqVq18+SVLTQaaXD9au3quVCmZdHcEODbdtBtbv+afDNfKlhtlDUckhiyrSE9Wdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZK34jAF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZK34jAF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C801F000FF;
	Mon, 14 Sep 2026 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395542;
	bh=URkLQJTkU1OWudFW9XfG3Vve/Z8qVfcVe+gmepQKDZ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZZK34jAF+w4QNreVLwQNOzb6QmwS849PujNsfJVlBwa0dVbaDlaXNpQ9RjEeqGWSj
	 cIsp46z356pgiTnu5Iiw8IBU7DhTEE7M8mGA/RvnrxryfGo5i0Hmj8w+CtXA2TAMrz
	 eAsXIeWJpycpq9VU8Wtg7/fNuf9T7BdNHui4C6csfSCKMj/bgrOwW7Q9viM3ISZb1P
	 HEXTdtGaJ23b4dbSlV1otNVbRXVYJoW5RjcELM/4Pl6SCdoIXwCV4h7Gs827nR62n7
	 jTG6DgF8JDl1KoOPTrLYPPdP4vJs0Wd2bo8PKfwJ9gllH2zynhlBt/vqG7lLGpW57V
	 rgkBymFg1tEuQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Steam Lin <STLin2@winbond.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v4-1-5da8a25b9579@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v4-1-5da8a25b9579@bootlin.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
Message-Id: <178939554051.2550426.10852177724656571043.b4-ty@b4>
Date: Mon, 14 Sep 2026 16:19:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 11 Sep 2026 19:22:45 +0200, Miquel Raynal wrote:
> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
> means they do not have an SR2 to read from/write to. The new generic QE
> helper was supposed to accommodate this situation but in the last version
> that got merged, parts of that specific handling has been moved to a
> more contained location, swp.c (which needed most of the extra code),
> yet the Macronix case has been forgotten about in that generic QE
> handling helper. Booting with such flashes will always fail probing.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: Fix quad-enable for flashes with QER bit in SR1
      commit: 90f242c92d3ab241f0d22e2368b57750b8755667

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

