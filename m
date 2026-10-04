Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3096414420;
	Sun,  4 Oct 2026 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136272; cv=none; b=tZMxBdSdf9JeXwyag/uEo0T1USy+CP0iTwNaVhlGnKnyQeOfT0Yr9VNjQrOD19l5gn2bTdsiVa624Xy/lFpznfQxzjJ0dABrTmJPwGSZl7dfbf4T5jLNYFnOZDwIN2uyca+h9WX5InjWBC8YoifTIa4lkO+GANFflM4U/IFJXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136272; c=relaxed/simple;
	bh=bSRqYSiG8cm8JeD0ZHg1F1jCtgcSQWKx8GuwlwpRUZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnNlnvbpfYQvz8qCZ+bqKv/Rp5BXB0/u+PM+J585PsPpK5FWvyJjjvCUMj+xOlLgIY4r5y4WFzLf9B6Ca7ZKEsDBXpUvesMD+q58iii9QP6OVmDj2/Ibt+C1LGspKLOj0dW21r8ybe/E0N+ukaE3MdeNtMTeGdBAp2aH6dO0FEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Er9z8Dm5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Er9z8Dm5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3C68340E02B3;
	Sun,  4 Oct 2026 17:51:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tmS11KGYzn1e; Sun,  4 Oct 2026 17:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791136257; bh=xpY2VretqJoxHmI7Stssjy7eeYaINM6kjBfxKH+WLC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Er9z8Dm5daaK1OhydqLygbNiC11HjSwdZSVM7DsaTrmEv+8yGzdnaGt+RwTw6RLMc
	 SUw9GrYImiCaICG0KxIjPD0nTZ5U1taS26g/xiPMLqjECIwNeCk87k1JyJEbafh8HS
	 IRpCZ72Pdw6pqMxh6FbGe5t18l3dJHNN9IrFUdq8WDFoyyCe9GSG3TuFVKJuTDQOKm
	 zy6Diw+UCC2EBhnEAtNeW8LEqOfA8S9wWynAqy9mFqJnF8L/qreP5xH9ZaKtXn+Rfi
	 S58qXYSQzpxBGriJ+rh58guiZVg7ihiyggvwJRQwMF19H41G0y1IF4ML+d6p/6p+XR
	 9OY7FoOcdQDegT8E7kq/r1EXalvOaMpJ3+pJqMc0Mwn+WhwgkKHaoMXQc33gnXGiPY
	 L/Z1bQwrl1LPPcLXKqJFVPKdCaTkcHuV8xWWIStgnmLU62XZ6P9Vbf8+Y4KCOx0k5w
	 a/+EiuaabCu/0B46HDGSY8FpUV/yto5N+QIZH0t4EcCpG3RNMEI7E/r8mFMoQFIscy
	 J9WtduxBLlRs/PE8g7C2jBbDjFRM72NlicMZQF2WgmkNZdjII1mQCoSUQEefH4Pdg9
	 od+9X1r9tnaQLW3Fv0DbFxcIRROXxzhKX8DzdK6T9x7PuHBZgGhmgo0p5jEnY5J2AV
	 QFDtLSWevEDOna3zyRh4FcDU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ABA4D40E015B;
	Sun,  4 Oct 2026 17:50:51 +0000 (UTC)
Date: Sun, 4 Oct 2026 10:50:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah
 models
Message-ID: <20261004175048.GBasKR-AA6kPKnbgEa@fat_crate.local>
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
 <20261002113204.3358815-3-Vishal.Badole@amd.com>
 <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
 <20261004151447.GA2673@yaz-khff2.amd.com>
 <20261004160412.GAasJ4_AhYcuacY6ZM@fat_crate.local>
 <20261004170525.GC2673@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004170525.GC2673@yaz-khff2.amd.com>

On Sun, Oct 04, 2026 at 01:05:25PM -0400, Yazen Ghannam wrote:
> I'd rather we load unconditionally for all models with the same base
> behavior using sane defaults. Then we can have model-specific patches
> for variations, if needed.

I'd rather not because I keep getting all those: amd64_edac doesn't load on my
machine reports. Well, after a while it turns out that it should not load
there in the first place.

And then there's the managerial checkbox patch which needs to add support for
their new model just because... does it even make sense to add support? Oh, we
didn't even think of that but it says "Unsupported" so we thought we should
"fix" the error message... 

So I don't want to have that unnecessary waste of everything. And if a f/m/s
would keep my sanity, then I'm perfectly fine with it.

> Essentially, we could avoid a whole class of patches for derivative
> (client, embedded, etc.) products. The module would load with the sane
> defaults. If the test folks find an issue, then we can have a
> model-specific patch.

Only on well-tested and supported configurations. Everything else doesn't
work.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
