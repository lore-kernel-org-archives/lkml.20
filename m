Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087E39B944
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666900; cv=none; b=hGfZvR6t21aQ3EFHXB/hwmxMQ9wRCp2j33Sfv8k1Hbxl888KSpOviBP4OPJnE4SmQb/qIZ24+UFeARyCfe0PUnf71C+HBsEFL/AYQxBlk8nwCnKuA+bYKfA0mEKS/Pdd9fOI3QtstuWiX6NZ7XC/5ADNnetCbdnlMtXOQ6Ql0sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666900; c=relaxed/simple;
	bh=98FUG08n/xYMH5ubg65KibGYCuzA8HYmIuEhpH2O6a8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C3/dzxLoKbuJ6vBV7z0NPwaFfdO5H5bKs6ImPnB8cZkYNdv9nT/nlnHoBzWhaMTjR//JM9ySq3wXEHhD2uJku7HA3Kiw1eUUhzeJ5y5Xg8+T6JJiX59FzG9jkTIX3Fyz25UZC6/tVlXF6mQwnXogKySINshUHVeImz2lYWEPHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aU2t4FFQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aU2t4FFQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D116B1A1053;
	Tue, 29 Sep 2026 07:28:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99493601BD;
	Tue, 29 Sep 2026 07:28:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E90A102F1E1D;
	Tue, 29 Sep 2026 09:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790666895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=98FUG08n/xYMH5ubg65KibGYCuzA8HYmIuEhpH2O6a8=;
	b=aU2t4FFQ5paB8PyJ3B9qyR967BcBUTGPkGzNnkvS8+FazZtTLT8ssNuo6v2e0a77xLaT+q
	iShrTaMZf/+xnKIe78GaRMY67vsLpL0ciiPgsL6Y1642E1lQz4nPu1iA2DGXIaguxfdrGW
	w3GOhCS5BQyDnJgz3Nov62KPfyDuOkHgPzuAl3R+b2WtptlQcIzhT4aWMZ73CX54lVIR54
	7shKP5fAH90AejKrkKniVgXVzHGE5PZ/x3KJmbJOICobfhOTpZKG0dh62e7YfSJorIdbgl
	6JF12MHWVhSuhep4S1ACkNnHk574+0FdmgpyqMNj9kosW9tmBCD2eYFGenh/oQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Michael Walle" <mwalle@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Richard Weinberger"
 <richard@nod.at>,  haibo.chen@oss.nxp.com,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org,
  michael@walle.cc,  linux-kernel@vger.kernel.org,  "Haibo Chen"
 <haibo.chen@nxp.com>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
In-Reply-To: <20260929065924.C12141F00898@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 29 Sep 2026 06:59:24
	+0000")
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
	<20260929065924.C12141F00898@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 09:28:10 +0200
Message-ID: <87bj9g7bzp.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 29/09/2026 at 06:59:24 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] mtd: spi-nor: compilation error accessing non-existent opcodes.read_sr2
> - [High] mtd: spi-nor: modifying hallucinated opcode does not skip SR2 reads
> - [Medium] mtd: spi-nor: permanent breakage of SR2 reads due to
> missing state restore

Please ignore these. Sashiko did not apply the patch to the correct tree
(-rcX instead of -next).
