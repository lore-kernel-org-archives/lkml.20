Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECF44446EB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789911088; cv=none; b=O1tGwQVNH6IqVTgdixuek1ve4R7WYcuqRn/P7Euw0lhXNF9vivITadvBvz58tciLoEJ3jL7EXpAd1s5aTAPQ7xvg9Zt/eGc1Mz19pigDohEvp0OV/hBYcg0/g9Eu+TgjjquJJIed//nBoIH73gNhfTUq2LN9I5XTSlrrQGEft/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789911088; c=relaxed/simple;
	bh=ho9/kBr5mGqAXjmGooVocBDGGuNMsJ4mtwVDchOaC2M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K5dTl8/ZQ8XafdQ2kb6Sx2XO64MV2kr/neFjjweaptyF5ruI0TIZ/2yR8/qzvOTPP5fvlQNfEZQNNXp51Jr5zsOF6THUcNYmghW2bhuyUjqKcpwpES32E2BQVvj+CAVI6csxu3ZJv+Pydza7rYpGlmDNXBBBsy1YXQTkdYf6cN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PFgPAumR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PFgPAumR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 572F74E40917
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:31:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A0DD6033F;
	Sun, 20 Sep 2026 13:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47A1D103286A4;
	Sun, 20 Sep 2026 15:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789911080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ho9/kBr5mGqAXjmGooVocBDGGuNMsJ4mtwVDchOaC2M=;
	b=PFgPAumRabTL8Iyrnlvve5CL8iMdhTJ0Nx912AK+Zew0jr0pD/+RUw9+V9hLUr22Qyc4ZQ
	0y0Nrxd1sKRSVS/FP2/PYXTBXw8OVVWhC8aCNTGK4MFhzWMw6C8i5RSWjkj6BeSjZCcoKW
	PIg/iQfLPyT7GKA5bm+Fsxqufy6H6g0gZEre5yBqh/vE4e8sgUc0tW6d4HuxJ+lDsKofpY
	xXYgQ/Qzia0mQe3im+Wjyc6nwrbdD5MR900Ax6svSSZQzbQozcjtnSq6vwNwQPYBtv2OeP
	RI5K5c2OfHbhVsTubQ1cIKTt0FWpfjJK8eQpQq8QFcT0+xJVNQNlKpvtfObIbw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Only touch the QE bit on chips that have one
In-Reply-To: <20260910155355.3534491-1-naseefkm@gmail.com> (Ahmed Naseef's
	message of "Thu, 10 Sep 2026 19:53:55 +0400")
References: <20260910155355.3534491-1-naseefkm@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:30:45 +0200
Message-ID: <87tsnk82yi.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Ahmed,

On 10/09/2026 at 19:53:55 +04, Ahmed Naseef <naseefkm@gmail.com> wrote:

> Since commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
> steps in one single function") spinand_init_quad_enable() is called
> unconditionally and clears bit 0 of the configuration register even on
> chips without SPINAND_HAS_QE_BIT. On such chips that bit can have another
> meaning: on the Winbond W25N02KV it is H-DIS (Hold Disable, default 1),
> and clearing it enables the /HOLD function, after which erase and program
> operations silently stop taking effect on MT7986 boards.
>
> Only program the QE bit when the chip declares SPINAND_HAS_QE_BIT, as
> before.

Sorry for the breakage and thanks for the fix, unfortunately it arrived
just after another commit -which I am about to apply now-, therefore I
must take the first patch sent visible there:

https://lore.kernel.org/linux-mtd/010701a08d7e1638-79aaf1ea-cc8c-49e8-ba74-=
cba028aaa183-000000@eu-central-1.amazonses.com/

Is is very close to your proposal.

Thanks,
Miqu=C3=A8l
