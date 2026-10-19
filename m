Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843648DB44
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397250; cv=none; b=VODrHUfYxXrtCCKUTDQ0AAizranY+laFm1NekoeQJGERr8cOYS7u7FegQzsStr5OvwgyavvLqfzkRW0HA1mXckc7nA0RONWMR/ThXzFdiac/aCFP/5eH5mCfoI4gR0yJ3HO68Lp49lgo0XyoAz3VP7C8cr/4fg3P9AuFRAIdbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397250; c=relaxed/simple;
	bh=46nXba2/Fw3zNkUlRBKE0LIIzdmdE19umhmwGtSh6js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bntk075i7QOsLCDPrNYhETrZORL5T9D5u2kd8ng9msN4a/EZnmF/uVdIPPwC03UafBZDyyMKggY9zYmUrx0J/k4bCNDU1SNvl7zWF4O0OpbqLKObPGJ5emfslac6DM+WshNtYNSsGNn+xATqSRPb25UHsTQgiR6nthBAmvmvp7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A+n+tbMI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A+n+tbMI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B06D3C5CD5D;
	Mon, 19 Oct 2026 08:08:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B044060582;
	Mon, 19 Oct 2026 08:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 773CC10328429;
	Mon, 19 Oct 2026 10:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792397245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d3/hopPp/eVkECxCWqkP7OqN5b2zcWeLjUMHnlh7neg=;
	b=A+n+tbMIPM96uVCPMtv3oEeslRi7Fnzoqjl6CrZWdXjp+OxbvqOVPPA+rwrHXMh1J//UIl
	V5XmNAJkgBb6J9VTVdBp95Woak0aWgQvP+YC6qN0fKyUMiesX96umeAGppt641H0T7mgKa
	YudJ+qFkzGwyTIYegG3lxVgOHNJWns7JXUlU5qgAXbNAf/cb+gcow1Um8fmv9HfEL1yTDT
	RjaNzSJ88CegPXFSR8/AL8mp+okOM0K/y7BS4jekvQHdr0V64LI7EKG2iGLbRQm330VJ+L
	bkUA/uWZ8apzeq+pbxHZ0QelouPS9QPhuCKvyek4brEuz5AE/COMPleCMEyexg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] mtd: cfi_cmdset_0002: also clamp the write
 buffer of an x16 part strapped to x8
In-Reply-To: <20261019034922.3805782-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Mon, 19 Oct 2026 03:49:22 +0000")
References: <20261019034922.3805782-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 19 Oct 2026 10:07:22 +0200
Message-ID: <875wyy15c5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

> Fixes: cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the write-buffer chunk at=
 256 bytes on an x8 device")
> Assisted-by: LLM
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> RESEND: unchanged v2, which got no reply in a week; it still applies
>     to mtd/next (cfc5ebc9540e is its parent there).

We are maintainers, not chatbots. Please allow us reasonable time.

Thanks,
Miqu=C3=A8l
