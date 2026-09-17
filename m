Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D144A6888
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648953; cv=none; b=iPgasjk3UvlIrbQpm55tV2Ky/cQ4GOrjeSnQFrbWfqB5WiwLigbjtYV+bM4fPWyjqrLg5BrDv695D7ShHtCbtLbMBRgfYJzjnm4J5CKI6L2W+mifFG5xvGdVJmHfQCrBYJlnWXi2GFF85kfPGS2aZa+Up0YiVAN/RG7anYcGkic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648953; c=relaxed/simple;
	bh=PG9s/lQpyWWgyfajfquVuT6dwzIWQ6vycJmpjWt0HLY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g0ppCcOr277bCLDZY58vMUpsadyvMYhJe7cHXmDgllPG7o58psxnkDccsMgxbx5tfcvq6NeqiZSLXt60cypW4c4AVnbm4aSoaBMz0oNdkIVbvH3aO3ioihg7oO6jIGS6CFVO8CFpgB7zL2stl5ZsPbv9KIn/fXq+iBcW+YN0cjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LqJ4BvtD; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LqJ4BvtD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B717EC5CD73;
	Thu, 17 Sep 2026 12:43:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F8F25FAA3;
	Thu, 17 Sep 2026 12:42:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48A9711C7B02B;
	Thu, 17 Sep 2026 14:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789648934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PG9s/lQpyWWgyfajfquVuT6dwzIWQ6vycJmpjWt0HLY=;
	b=LqJ4BvtD8bIdtKDNwHMo0d/OrXqlDOs0fVG1ddICEofuOn1fsTso7l/fYR0gWiq+0Xq9v1
	9x9JRS9AibiILUK+iPiAkQxIzx6mgPYIz5asidtJfQJ5Noot658VFCazbUiwl9bbNVJ0Vs
	J/Bxp9Ky9nc0OPWmGE4hvk0GcjgVlmRCWWPfMiTxL5/aQxQrE+O8TfrdVe4D4iT2hXcphe
	Z5vEXWSSgSQGFlq10qo74xaO1W6ug0OYJUcxeRMu4HJ9zusmJ/0lF+Jdw/JbNc6yNCzJUv
	7hyJRnfvojKeAMvAivZVlCEkDqrgI7CWMMFFCL6LD73R4ZEO50BRnG7rrhohdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Takahiro Kuwano via B4 Relay
 <devnull+takahiro.kuwano.infineon.com@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  takahiro.kuwano@infineon.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Increase SFDP data size limit to 16
 KiB
In-Reply-To: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com> (Takahiro
	Kuwano via's message of "Thu, 17 Sep 2026 14:02:15 +0900")
References: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 17 Sep 2026 14:42:11 +0200
Message-ID: <87jyokjbh8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 17/09/2026 at 14:02:15 +09, Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org> wrote:

> From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>
> The size of SFDP data read and cached is limited to avoid allocating
> too much memory. The current limit is PAGE_SIZE, but the Spansion S25FS256S
> has parameter tables at offsets beyond 4 KiB.
>
> Increase the limit to 16 KiB to support such devices by introducing the
> SFDP_MAX_SIZE macro.
>
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
