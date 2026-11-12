Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506453;
	b=0731j4G3lZWn4O48pV50p158TsTeP4NRg0lR0pJyya14iLZEiJm80N/pbHoxF0+2jn9j
	 0EXN5dk/boNrOkTnthBnqXkell/Ri+8WxNf5HUhGXNS4+e2MYO04mdmAJ+k2DGxrrQG/a
	 K58hzn+Ebp2wce9T/fqTopGonVrk2psCd/zftBto23O2Gwg2qsPvwmP/kA0Zcov4pZNfC
	 Je/IUiBC9b92r2JrD4pyihKaONZ6AfmYkiy/DYq2RJDAHdy72n3qRfgZltOI8bv42kty1
	 /fl+4EPuKfyGZDW80dW7gTs8Wq8CqVGRime3HQSiTD4CGkyVXk1MNy7pEk8s4s0Xudw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506453;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SDqSGIDCiZFkIs4FRSal1lqSEO0W03HEcqsvZIfqJeo=;
	b=0r+lOIC1FoAwV8cARM/HmXxsp1DWUyCmTluqk5TBfPppblPV/5YQ6ygJyUfOxbrNYZyG
	 zrq3lNPBBulyetzSyvB0bnz0EB2v8PrGtEyo4ejBIjCAWpqGGh1405k1EDUWRrWMlzwe5
	 cvhDLANXj5gld9RdNDbZdISuYdzBXag9rYKmWvrNh6pv1W8gMo1JXTXWfC60JxSi+CQVs
	 A67xLOdgm8lpkbhUsmiNS6gxSKGC+l2txQaMKBSfAk6IJO6BRYFNrMiRshFhN2zHhRRN5
	 7aZBVYXZn30vg2Tn8YvrTIJIYaPT48EeB6BE26JaKOLvshk+aG4fzhVRa2qMIT8uVIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=lMrVfKyt;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83C606A32D;
	Thu, 12 Nov 2026 18:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D83C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=lMrVfKyt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E01D940E0237;
	Thu, 12 Nov 2026 18:00:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JMAzOU8ZEWHc; Thu, 12 Nov 2026 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794506447; bh=SDqSGIDCiZFkIs4FRSal1lqSEO0W03HEcqsvZIfqJeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMrVfKytnqWScluw5G9YZXtW5IFOQoemEUi2Epxj09mm86dKjCZVENar+jUQn2P/Y
	 roYVi9D0ToOzltj906kkfzuDLZ9sCC04HbqgJ9gsF75hw+Xz/9LD4lR0zEbTKaABPC
	 pi/b4ULbvs3v2HNbe4ll6WazFbySd2MWTorm1GNPQzkpyNKwUzraA4M4bqrzWpll8I
	 V7c35APYYs/6A4gr2OtbrDNAZpNEO7hfU6CgM5ChBvVs1ukaq+GgwLFt+W/KQN1stA
	 s6MAAQfudOrK8ZPOjp1xDCyLkbHE7XAdGMIGe+48pvaHHA1u4Vpo7B9I/bqrR4OCuU
	 1MGuCfgyftyhiNne6P1xqp/3HPU1Gjp00V91uuWWN5hopnlEArstd67IhODyyz7jQc
	 Frp+U1+Vk3DsyYcoHrH7aHGNo2H28xYrQwedp/u7InatWHHmeCQYfjXkaooEavgyGH
	 SvpZ+MuU6Or+5si1L1//AEsbVeqp1pPaq+BxN14EUiLUaajFhkcXhPKF67MjrngEqp
	 7jvz3MR0zakUnYMUTewTsgeXwfmVt6JEi8FuIgtcv5gfYB82Wld3aUVY1HXCI9N6zf
	 GlfmACHpM0k4RfaJGkaCekDS3i7kx371uDnie3ZgTZUBQSQvtb2aa46VBZCnnYsJjF
	 hyZGu261DbNHM/SC8sc3XzCk=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 64A4840E0222;
	Thu, 12 Nov 2026 18:00:41 +0000 (UTC)
Date: Thu, 12 Nov 2026 10:00:38 -0800
From: Borislav Petkov <bp@alien8.de>
To: Andrew Luebke <andrew.luebke@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] EDAC/i5000: Fix the slot loop and re-enable the
 driver
Message-ID: <20261112180038.GCavX-xllGG4Y-PM02@fat_crate.local>
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
 <20261112001752.GCavUFsCwZIRkfLI7T@fat_crate.local>
 <d259e498-5cc6-4e23-a589-cdffce1764e9@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d259e498-5cc6-4e23-a589-cdffce1764e9@gmail.com>

On Thu, Nov 12, 2026 at 08:58:40AM -0800, Andrew Luebke wrote:
> Yes, please do. I have the hardware on the bench, with single- and
> dual-ranked FB-DIMMs, and can test patches on request.

Ok, then extend your patch 2, pls, by adding yourself as a reviewer to
MAINTAINERS in this block:

EDAC-I5000
L:      linux-edac@vger.kernel.org
S:      Maintained
F:      drivers/edac/i5000_edac.c

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
