Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADAE37754C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524729; cv=none; b=IJ6x5EnDsegx02sQNLQmMMcSagvvt4a1veaDBuTLbd5Q3jvxyczEohAuYCWIFwB/OUReTnf3zV6AEXIEIr3bffCjBA4s+QzUVZDzAo7tEREWqKVhenKk7dPQ6vVERxDu0AN5gWWNg9srKgRek3u7qHFOauw3iCvhD/ZvlOppF0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524729; c=relaxed/simple;
	bh=8s3SVqjlw8hID7BZ/oC4A2bJKZyrLaZKlcS1bz51GHA=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=MCmJETt/TjVY2plnpETMzeUx5iJlhuN8MTzRDHasRfkQF/jSfFsjvGHux0Cm7kGiBC0S7u/yhszAxjSWXtWqvdKAUgD6B0fDHUAPygQZ+vQw6SpNgIlQQgMHsx9f1KnwbsHinyymaUhdpiE+MzU7rqPh5wJoMjJSwlKZASMyJQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=rBuaNKyL; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=czaThMSF; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="rBuaNKyL";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="czaThMSF"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788524576; bh=OaCBTGoBVl3jnXkNN020dqv
	JEP5sgbgbDM0zjnwKsJw=; b=rBuaNKyLB2UkcjaoYZPKI1/1TF5qGGoR8dTurP3KsR2MRWb5hu
	zF3/OJ0wiV+MGJdd8OYst0kLtexy2CdfLMCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788524576; bh=OaCBTGoBVl3jnXkNN020dqv
	JEP5sgbgbDM0zjnwKsJw=; b=czaThMSF5tMtiFc6BR5pJrv/aHq0/Ms2tHucEIg7g5UkM2wJzp
	ezhjNFXQbchMrl401nShD9u+Mda8pahXbt5piWkadECCkmXvRTzzEGrfVDQIbaC968gHsLzHzr9
	nrU/hAIoDoNeft6mpJIeQQs1XiLDnXAXdSLcQsWyAW0K1/RD3uCfH+EJzKLR0pmig0lesuAAY7s
	mAaDG+fJVkkJEdBOIIv3Fr5lG7oAGXdhwvgFKKCitnvJVJ0lksVHTi5iHb6vn558HpcNkIYdIVh
	jLRcLnYKVjTOEs0hG3LM3LVtln8lcZJXyddHMbs+dhecmgujtG1QlYx1AEn9xQfb3og==;
From: "Richard Weinberger" <richard@nod.at>
To: "Hemanth Selam" <hemanth.selam@gmail.com>, 
	"David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: AW: [PATCH] jffs2: fix typo "informations" in comments
Message-ID: <mtmxcr3o.ee150fe6-3518-428c-9ca6-a554584ee6c7@nod.at>
In-Reply-To: <20260904112814.6768-1-hemanth.selam@gmail.com>
References: <20260904112814.6768-1-hemanth.selam@gmail.com>
Date: Fri, 4 Sep 2026 12:22:56 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Fri, Sep 4, 2026, 13:28 schrieb Hemanth Selam <hemanth.selam@gmail.com>:

> Correct "informations" to "information", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments=
,
> no code changes.

Ack.

> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

What really creeps me out is that you're using Cursor/Opus for spell-check p=
atches.
Please think about the environment.  Neither electricity nor water is free.

Thanks,
//richard
