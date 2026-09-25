Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A40175A88
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346558; cv=none; b=fLNRJPwObpC88umMaEx/Gls2gA7zXYwCjMLKkPqi9f6iv/786idcfOKMmP98teoYsqj2PIak4pj5Iq/SR9tMh2zynCX0B33Jvew0A6xsjk5KqmGUPZm4VA5N3lZc46qXgppuXvFX/yJSIeYdKvCysCI4iXumf4sgrgPwpaQBEaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346558; c=relaxed/simple;
	bh=5vzcO8f31bmo6Vu4GDThoVWBQk8dvps7v/tsBz4Pjjw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fyjsqpBzHNFBSY92tWUAkK+e7iAQtPt3nS5oO6qZH4gbn0p9SsxvkNsLiaB9e4HeZtMu4Yz//HNkcbV5rRJElKLhHQURX43v/rl2nLjpzW/3oft5MHtRlTFLItmDcyuCzvw7yV6Lc24IQ3hMxFPSvR2ZRBDbL+3NBKmQFSUox+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JjWHZhg3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JjWHZhg3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BD8371A1024;
	Fri, 25 Sep 2026 14:29:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A1DB6073B;
	Fri, 25 Sep 2026 14:29:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74849102F1E13;
	Fri, 25 Sep 2026 16:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yfCX8H+M35XhP8P+4I5oT/TqJldGzETIWgil3VkSoIU=;
	b=JjWHZhg31ZQVx1/oeHXBS40KM0R+ZGG/MgajUJMgoqzKeA1205BjTPajr3loued6vvyfjU
	Gn1jOil1XfQw5s2gJiMw/0iKqe06+Wq2XSovCu1hHuVaRKjBxXHWJtqYcl8SOJsJMBGvAt
	Js3M73SDAxShSZUt686hkNApdsJoA8DSJ+YD/MbNgNqJndc44WXAAxBb/TZbTOVpXo3mfM
	T10Y40nPysXBbkh9bTpbPg6J/beTW1m2jQQESu/Dg4BtYaLpLIm4IF+KEKyiNovnBWhQuV
	9wRjFMX/XhN0iGDvM/fHzPewpEZ+UDC/Ipz4hSywYSxXwjCscf/4fVGqHkzfZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, 
 Karl Mehltretter <kmehltretter@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Breno Leitao <leitao@debian.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
References: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: use assign_bit() where
 applicable
Message-Id: <179034654691.1166139.13579096219818232472.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:06 +0200
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

On Sat, 19 Sep 2026 21:08:06 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
> 
> 

Applied to mtd/next, thanks!

[1/1] mtd: cfi_cmdset_0001: use assign_bit() where applicable
      commit: 30c70e01f79f04b802821d6de24a6480538e3909

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

