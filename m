Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D6503BEA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543492; cv=none; b=osLuJkUxwhCAp0f6BTcKXluF4PyP2vllXehcoRQsoE9HQgB/ZZ53zOfYVC+D3vHRz1nJPSe2ym5bry8OJsYRCcFhvfgJPwC3hs0n1JyBhkCoAh9YTrPFsTQTVnMZH5XkwR976TNtQFBzkKx9I1SjdwHPJxEXiHuJ4luce5NYZ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543492; c=relaxed/simple;
	bh=9kw/Qmj2GZ6wpCG8dQDXab5BCpIAcmauLvvNEYxkvxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nxmHEn1hZdJC4iEpE2xmZiHuJ+DB6YJqasIJ2U4Y9myHeIczhuPZrdQdoO/22gfSl34WSkmfTHL5CaA820JadjkrXagLxigldwnayQu2jkQs1QLE3XF+oRH86d1mZOTWjLPc14Z3PwCLIPgpL6izI/9EDuVWh7mxpJ6Uqu2wBTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=u7nSyM9p; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="u7nSyM9p"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB9484E4151A;
	Fri,  4 Sep 2026 17:38:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FDCF6057F;
	Fri,  4 Sep 2026 17:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E21A11C78767;
	Fri,  4 Sep 2026 19:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543484; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gdFrR/0PYQhuKNVq/5wRD7o+eOPgVPi8iLcq8juRx/s=;
	b=u7nSyM9pPdRhpskIaRn+xHNOXZbIKRglqvcWTAwoEjEtbBtLtkBsgAan11HkQZMR4i1WHp
	RJcPCk4YCfM+XkEWkzqULzOGIK90Uj3pvXQhPqS9WJmdaEZQs5hZsiyqkQa/P1h7fVto6V
	75mwz8q3CXYiY2J5hYd2YW60Ps//e3ESNBNM5E3prrSvUiBDhZQWcU2xtD0dP4N5HTJgRR
	35OstITJFEXeAe4KQfM5FQ01twYDL+CksF2a4jsZ4NUV964L8VFx2MxV1uaXfSAbveGZcq
	IMLxb0GXFbCxkacDxLzakelYYuzIt9IZmQJt5TJ5VBfeAEXVO+Wnu8dYhVYyLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816163058.10099-1-kmehltretter@gmail.com>
References: <20260816163058.10099-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] mtd: core: call _get_device() with the master MTD
Message-Id: <178854348328.1467647.1278963420039416340.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:03 +0200
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

On Sun, 16 Aug 2026 18:30:58 +0200, Karl Mehltretter wrote:
> __get_mtd_device() calls the master's _get_device() callback with mtd,
> which may be a partition. __put_mtd_device() passes the master.
> 
> This breaks gluebi partitions because gluebi_get_device() uses
> container_of() and therefore requires the master MTD. Pass the master
> to _get_device(), matching _put_device().
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: core: call _get_device() with the master MTD
      commit: 12b31d1acd20b3185bb5f0748db0cf6874c8e9d1

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

