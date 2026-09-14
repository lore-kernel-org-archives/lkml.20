Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251313E7BA0;
	Mon, 14 Sep 2026 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427152; cv=none; b=fmg2M5HLY71CBEQ8gU/6zjImUkn+IMFYVUhykPQxVKKfOupRE4RmVHqX67+VMHVrmpvZd1SNC6V+lMMWIElJoIQ/0Cbbj/xNlFWUxLjrs3KCg5f8ZGHIausw2FD615X85ZG2qGEu+5rqpwOs7yJTNYCY50RUikZWhJqGRhtOVmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427152; c=relaxed/simple;
	bh=5UJQkTlwYweuJs2+G3l39EcVP0GnQaxCX13R4wZjkuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiU5OFJDXWBx9uTbjjNLWKbrikQ3vy3uDQ1v6OHm9/+2GqjWUQyNdO3bk0dO4Sp/CiT4+FSViKwR20XJZ9vdZ3qr0aXRli8G63SzczvK90yTFdz4vzDMoRk1S1Mjv9+MW9VSP4rh8PyRf2yqB370TM8pmEDjiS4pUZWldOubOCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V/TfHW0N; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V/TfHW0N"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B083140E022C;
	Mon, 14 Sep 2026 23:05:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LveRLX-qDzjw; Mon, 14 Sep 2026 23:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789427133; bh=ZfvxsIBgYWczNXPHi5ckUriEVKAeAMa3O0XTOpqTYmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/TfHW0NjhAdVDqCPn3e4IOBJLzbxhR2KknbnBTTLS4QxwtyTK7E5v9KHP1y8jNHC
	 7st/JYyIKfaZSm8s47Km7KSkJrcpSZokkIfpxrYh5kvDCFcbZPXs9Mi6QwduQbiOIO
	 0FtPyi+o+nuu+r+Y1VbAfYGQFoPLKKLGOvnWW6dL4FxmIr6xdjW1PKTTBWPeOQAKim
	 89WLhA/7Jag4R0KGs23BdCdPMbtHJJtfx3GzVDf+cW/nrO9hhzNx2njWOoJsqHnSOq
	 T0N1A10Qwp/NW42af50li++sOHNc8qzxxfkrN2DxqsJlrVW4m6jn7myOMzv3MOYTsH
	 ut0Fcrcy3/1LBwMbipSh3MycyhDRCambs8k0NGPAwFfLes0cbVLmJ/7wvZ5jz9rlCn
	 yHIMYgnTLmvHi5d+KvvY7SrebWuJAy+567VcZsoo2kTpNI8ACbklIjwuXg87YTOkeT
	 p/5IwHa3vzHjcC8hJ9IJDCKG+uLPyCuXqTr3nbeaV+A+ivRzkENXg4xZ8/dNJJk4Tl
	 iZsfEuPPIS7p2kXvRjHKoLsIksPagMn6NfAHaRrYhVlqsTHC2MqIgI30NuOFGo03ml
	 pwUWKB4ZDKfQXRdQc3hGQtuKSNHAIJwlu6R+BTELpWoy/tXOdHe7oAkwc3aBive7kO
	 4W3W6DuQ0cPB4NLeDVui2pmE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9B41C40E015D;
	Mon, 14 Sep 2026 23:05:16 +0000 (UTC)
Date: Mon, 14 Sep 2026 16:05:13 -0700
From: Borislav Petkov <bp@alien8.de>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tglx@kernel.org, tony.luck@intel.com, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	frederic@kernel.org, marco.crivellari@suse.com, neelx@suse.com,
	sean@ashe.io, chjohnst@gmail.com, mproche@gmail.com,
	nick.lange@gmail.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] x86/mce: Fix timer and storm tracking races, and
 avoid redundant polling
Message-ID: <20260914230513.GBaqh9qULU8xvkZkVf@fat_crate.local>
References: <20260911201206.532113-1-atomlin@atomlin.com>
 <20260914045254.GEaqd9pgnKrXYU4thR@fat_crate.local>
 <th75s2gp7u5s4bsgnulrnasbk4bimjhfv64d3pn7popmnaewb3@k5z2lftcvxab>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <th75s2gp7u5s4bsgnulrnasbk4bimjhfv64d3pn7popmnaewb3@k5z2lftcvxab>

On Mon, Sep 14, 2026 at 05:27:48PM -0400, Aaron Tomlin wrote:
> Would you be happy for me to formalise your diff [1] into a standalone
> patch, provide a complete changelog, and incorporate it into the series
> with your authorship and Signed-off-by?
> 
> [1]: https://lore.kernel.org/all/878q63lrqr.ffs@fw13/

Thomas is fine with it - otherwise I wouldnt've brought it up. Provided his
fix is still needed after your fixes (I haven't looked at them yet...).

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
