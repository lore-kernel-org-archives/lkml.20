Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB74472061
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342115; cv=none; b=oFwFh9aKRDYOS8FYPQ5UNtyHGPxW8wkWSvelNSTD9nM4i7NArWW4juCTBWmf6PmwrHtCWshDfuZqVRtW9JUriQkawOsc0uClDLAYi9JRCxC5wBNN62I05OrNbcgfKod7ZA5J7pBcigWQpEKb2UKi2IT14cqVWT3RhT23jNzw+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342115; c=relaxed/simple;
	bh=MtaIm76iatyPfiF7F9FpPKBCAnF0DdkrKummdNqHOHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CZQQndVp/00sH5c2MPLBclJrNou38zAGetA/foAOpVEibKnKYGvUCKPBYs7zkrUaxqxDCaQoYKJDxCYQ5oxlZBFlKqql0Hl3SHDdY+3ME5q09zVk0xwjE75Vx0GMtvo1EJrP0YVYeFOVmOr6S05UgyCEcD/XWrdNq4DnRipqQQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h/61eCx4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h/61eCx4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E653E1A1020;
	Fri, 25 Sep 2026 13:14:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA6C36073B;
	Fri, 25 Sep 2026 13:14:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64B041032946F;
	Fri, 25 Sep 2026 15:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790342097; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Q1rGLtMVsWM8f/arBMoiZNonTnmmCJHgLO5nSGP5jAk=;
	b=h/61eCx4UX/gJ1xiV9AAL25CGCR8ATemeH4kDdhE2x6xdezgr2RdXkRcYlKZ0RnAp9l9JC
	Wq6ZmCUEOe6Gq1M82lIpg82KsGV1iSGHMM41VdS8MfB6sgReHGDgn15b5ZXHU1tOSfTuA4
	xNdRR6r2Y0wJ+4qxYEm6gCgIPjuZs8N8QTE+a/Yjgv+4r60wh0V9k3lBkILyzrfbNQcPbL
	QIAwmSaOo8mpLrl8JZQqA/CsGse3H9pzlH/6SqlYWyYs3j0WaYO0yK0yfgR/bmjgHpl1Dz
	84B9+Neq7zkTniVDCoyrreNvmpGIoVgkqL03xWcEPtRAOyCmquTW6FeS1fEkZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,  Paul Louvel
 <paul.louvel@bootlin.com>,  Borislav Petkov <bp@alien8.de>,  Tony Luck
 <tony.luck@intel.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  linux-kernel@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org,  linux-edac@vger.kernel.org,
  devicetree@vger.kernel.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence
 DDR EDAC binding
In-Reply-To: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
	(Geert Uytterhoeven's message of "Fri, 25 Sep 2026 14:57:56 +0200")
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
	<20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
	<arZpZolRwdU8zh6O@shikoro> <8733uxlcl1.fsf@bootlin.com>
	<CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 15:14:53 +0200
Message-ID: <87fqyxjwvm.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3


>> >> +    items:
>> >> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
>> >> +      - const: renesas,rzn1-ddr-edac      # RZ/N1
>> >
>> > We don't need a family compatible. Only N1D has a DDR controller.
>>
>> This is true, but from my experience with this platform, Geert used to
>> request both. I'm fine exposing only one of them, but I explicitly asked
>> Paul to put them both to mimic the existing bindings and keep some kind
>> of uniformity. I'm fine either ways, but before we go through that
>> iteration, Geert, would you mind confirming your preferences?
>
> Well, if only RZ/N1D has the DDR controller, there is not much point in
> adding a family-specific compatible value.  According to renesas.com,
> RZ/N1x is obsolete, so no new family members will arrive.

Ack, thanks!
