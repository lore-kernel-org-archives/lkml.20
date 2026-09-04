Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2D4FC8FF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543486; cv=none; b=CHPowy8DT/CSxAhyvqd1okMY00UQEae04zIe0Tz06iXFck3sCXjX7k6GkQkxLcb5EJW1vtFID8JTDQVfU2Gv5zp8kpWrKCo1EeYVQ2QNBU+b36Nk+x4XgRAZeYrUaSNtaeKIeYevcxGYmhlLM4k6Kov5RvQz2biAJb/LroZWXtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543486; c=relaxed/simple;
	bh=Irv2nhQNuyUIIHkeS6srEQJrmOKbKxDQ+5vbJpI0008=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EmAi+5Nw7To6/ngRvxHJmv3sSILuSeVoN1RIgtcpy9mB54npheFS5AUNJU9oL8T4aZ2qaeGWDTaX0FB7dEJ6I6dAk3zIKL7bOFpUADODOfudLOV+NNK122G/OSDUu2rxVJ/fpR16xqFi7GFW8Ii3LLsP39qHxoJH1c2hPr2LxQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HKakFB9h; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HKakFB9h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE7D64E41519;
	Fri,  4 Sep 2026 17:38:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBF936057F;
	Fri,  4 Sep 2026 17:38:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5610711C78158;
	Fri,  4 Sep 2026 19:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543479; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZjooTiNadwO/Mb5ZZfbkgU4SGUutMkVB6dX1zleuJj0=;
	b=HKakFB9h/tnjLHMrxTOwoVc2VT6PRS1P5BNxVEz8qzeYIlj+hlcvxqq3npUwCZg9D5kYja
	GbG2DqzycNznABKPWK9ruQA7KNcMQZ1RhE+wnKKPZvD1mq5Zo8Nc6Bd3PK5UlHbrmkULJ7
	NjOkp/elAWbQPTYxwYjuvfT6JwvHt6IRL31aVCcLx2FMPNxEUmUqNF1SINv0k6qZHVsXd4
	7KVajPLbDy/Gj8oyigEozkWoT2YwP7X8a9BIMiIxM1WDpKPQRL53BuH++0qFyWu/EQR2CV
	VZKD/RQ50WY76FAreuSOD3UwPdXswuy6SBZeVApJPH41gj5EhiMiLNP/+tDl6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Michael Walle <michael@walle.cc>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Aapo Vienamo <aapo.vienamo@linux.intel.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816163027.10044-1-kmehltretter@gmail.com>
References: <20260816163027.10044-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] mtd: core: avoid double-free of OTP NVMEM device
Message-Id: <178854347703.1467647.15864063750548637195.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:37:57 +0200
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

On Sun, 16 Aug 2026 18:30:27 +0200, Karl Mehltretter wrote:
> If factory OTP setup fails after the user OTP NVMEM device has been
> registered, mtd_otp_nvmem_add() unregisters the user device but leaves
> mtd->otp_user_nvmem set. On an error, the caller unregisters it again.
> For -EOPNOTSUPP, registration continues and normal teardown unregisters
> it again.
> 
> Clear mtd->otp_user_nvmem after unregistering it.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: core: avoid double-free of OTP NVMEM device
      commit: 26300879cd8e4612dce66bb8f6ff7cd35fcf3e59

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

