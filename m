Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD94334D9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315255; cv=none; b=UlNcFrccKszRSJG7hwYy7ZdLiomi8yRXCHLVW+zowA5Ka8eTIEDM8RDc2f2f0XfZkOa03U1Ndmbc1DDwMAqDC8kPtAO+PmUE1uMz+/ZlyI/TDoZfEgW/g9dSKegvM/doriRcV1jE6jZLXYsSMKwxoLcVc9/5LSUNYBOQ8cqYc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315255; c=relaxed/simple;
	bh=7nQW4xK8HFnJ888YRE6gPMe7EBn5zuOosM1TNeYEStc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEDcUmoECLU6hlfrHDge3L1f3Qi8faT9YKT5xwOv9q0VTeG5vP4aO2FCBFT72FCTQOt7SlhCd7zUOkwn8eJD6rGUyHYJ+UuLXD/MPpEU5L1Rc+ypJ9j0bEvt7USfcQfwNTIwiu+vMT85a30JfZc3xeVq5a8rNsmMnW7TNBzBNIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VezgjDEl; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VezgjDEl"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 36B7940E02DC;
	Fri, 25 Sep 2026 05:47:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1vzU5sjHKZ8z; Fri, 25 Sep 2026 05:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790315240; bh=TxxK9/giWyS2sLY/6eJa5CA9ZINbJrPDKUmkXhzKvbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VezgjDElSTmvKvLEr0rv4UJwlTxc87RAtFZOu9/+WNE+v+gnkxak0BfVYcjj9gmyB
	 S0l7aXjJfh2brMQ2w+BRzZX5WNc+hj6XmBvRuX2DsowiXgMlChUwRl/b4jLYOLDOeX
	 HsQGh4UgHmEq12vvAr72jbMqJkfve+HrELNFzg6M+Ci9xv82uWAaW/kVNMleYgt+jz
	 jcTE4UrtjwHyPH5wP5M9ytvmNCavMuEUZ94E3NKgudmW9JHQJYp9p0clqUDOLrG+R1
	 DVVu5bIrFoAdgTBcTbv19rcvtSxcy41aNPn7tWTtE5WRV/oXjByvFkZUveeemRQf6f
	 F2qkfTAuoKjVlbvL5HTLPdYAHbOaRcVuDi6nqEz8tboj2GE/Dw6JzWFfOQXQX/QcUR
	 lBYogK5zNO9LnZvvTN5xgOQDh4yElFgSO+Fu7v13cNpJJLEqAb63Ae2tQ7lJd93xAj
	 wgxspwa/kEjY5dbD1bPyKQ5IccvJ/paaZU0HWdtdmiizvBvIvvwIFGOpDdOFfVkH2S
	 Ob7WSHKdBgkSzMutkxicYvzwZ10XKjznyohOp+TnVX+OyTZIMWjLFeXM8Uqspiyi3K
	 JvH7bhzzbQ9ULRe8ALBP2XETKxRXEK+wucNzS3TYcxDIH0o7pKgax+klIcF0IhSj2L
	 S1Z9Wca1GkQ/YnWQdWAb7RDI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D835D40E015D;
	Fri, 25 Sep 2026 05:47:14 +0000 (UTC)
Date: Thu, 24 Sep 2026 22:47:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Melody Wang <huibo.wang@amd.com>, x86@kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery
 for SEV-SNP Guests - Guest Support
Message-ID: <20260925054712.GFarYK4Fqch88H1kji@fat_crate.local>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
 <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
 <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>
 <20260925044713.GEarX80eZzKR-DKfzJ@fat_crate.local>
 <e4cb78e0-06fb-4498-a933-e790999a602c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4cb78e0-06fb-4498-a933-e790999a602c@app.fastmail.com>

On Fri, Sep 25, 2026 at 08:44:00AM +0300, Ard Biesheuvel wrote:
> Essentially. It is a layering violation.
> 
> Before ExitBootServices(), the firmware runs with the timer interrupt enabled.
> So poking at MSRs to reconfigure this behind the back of the firmware while
> it thinks it is still in full control is not a great idea.
> 
> Instead, the EFI stub should inform the firmware that it wants alternate
> injection, and the firmware can take care of that at EBS() time.

Ack, makes sense.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
