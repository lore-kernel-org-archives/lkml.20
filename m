Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9551D515961
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738368; cv=none; b=GWvFG7a2pLrI/rCrsfG9oywJuz87aGvWJplU7bV/l/4bJU23rqwcVOG/QeED0kOIAITYD1Tj/1T1mZNyXSgtzPDvX+seTQLaqIQX3UcqF+LjOH2g9ZDDFGiBsmV5bcI4PMN39W7R4zzOWVTdO3On4Agg5+OW/bSgUIOPksSNSRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738368; c=relaxed/simple;
	bh=WSJ+bdK4/BdLAHMYQcg5Te9L8iE/pJ/8C78C74TJtj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QUyB40ILQ19Ow65Rh3NPFeSw2X/2Fx32812rlllvzGIt019R4dd/GNMvSl/1eAFqekvN2ZqfTVzQ7FlcWe/LBEeccxLXHHOeC5rYtBiLAJbm8Uj7p9rRBKexEnLgUD87dkles7l8OOL29YHqkA+yE7jwXFEajKoxAZMHDChX7ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mMPLTtO8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mMPLTtO8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B65B9C58471;
	Fri, 18 Sep 2026 13:33:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D298B60649;
	Fri, 18 Sep 2026 13:32:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 426E510328D6E;
	Fri, 18 Sep 2026 15:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789738357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WSJ+bdK4/BdLAHMYQcg5Te9L8iE/pJ/8C78C74TJtj8=;
	b=mMPLTtO8rEL7c6EAzlTlZPHY1e3E24/TzUiIzZtqAfFNpoxEgSvuwnpL15nIesJaF/5Bct
	0gW4r3HuCdSFe3qDQd4e/d4Z1wlhOWrr6l3YHgaMM9b9i8SUt76UG9+tFQB9RFwoLOaBjC
	jQ7BkZ5BMWLE7Ol5lAi3oOykUGm5hNfWKs8ENHNfo9Xuwp990L2lMwhknBfry7nPIx1Ena
	b12/cCsSkaKWpLk5VdnZlYemrPl9RA08q2hPlFHGKvO0tf6muRBy362DkJ2K5ad8ya/hwg
	DU+pTRjTvyjMvA0IVh0aIYQYgl0uPnHb9dydJNMIfnTTxWN5KVDVys+aycSsIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
In-Reply-To: <DLIEOELQERRM.21J9WHMJHGYEB@kernel.org> (Michael Walle's message
	of "Fri, 18 Sep 2026 13:29:24 +0200")
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
	<DLIEOELQERRM.21J9WHMJHGYEB@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 18 Sep 2026 15:32:33 +0200
Message-ID: <87wlsifzwu.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


> I've just noticed, that neither lore nor my mail server received all
> your mails and there are missing patches.
>
> Could you please send a new v2?
>
> That also means, I've haven't been able to review patches 2, 5, 14,
> 15, 17, 22, 23.

Ah, yes, we've had quota issues recently. These have been (normally)
fixed now. Certain recipients have received everything, but not all. I
will respin a v2 with the comment fixed.

Thanks,
Miqu=C3=A8l
