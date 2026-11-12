Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525980;
	b=Lbw23RoHM1Zk8nW017wUOxgtJ3sA883OrdisTZ8VgiO8RJ90IMR1KcwOlkhmqcl2ES6R
	 3bFSA+phq57VCVihai0sYpACjCGKeDEE6+7uNZEz1HAJbO4LGEWiCrCvjpd+MJ/VLQahD
	 YgpXs8grziXRhRtZXBpzsObRZSVLKlXjn3DMV1KBc6yHARVlJHimjfDbnb4c/GYypzR2H
	 nJFGeXxMKZfYlno/zq2sRr3KhWIERYWV0dGQB6AkSNraTMKNYIGRkOMCTLYqXayQKVdms
	 11Iq1c15QjWvd4gL0UjX+m0jFEJaS+IHBW4uvn6QP2bhY/qFvTXitWt9BBRiXnBELWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525980;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J38QC4zGVSApOWHxQZjig0u/JJFe43mjBO118XfzzAo=;
	b=Uu4SLKSNubLgL9h1bvN1wtLnRhZ1HiOlPT4v6WWsfPiYp7fvWJtns03AtFpQq4Vy+nQ8
	 ILmR5nEyBzpvIgcUH4ducZAXBzLAQ5xsSpDdee7A9UBZ0Kp3X3fyeG4v1WLKMj953Jad7
	 XxQjN2EeZsACFw6qjXzxlz/KoT17i8Wdknu4MahjlPRhTSSl+zuio9opA6DTkTR0n1c7s
	 KF42uhyDcpZ7yN171ClswZN+956fcR/SquZ0265rYfPN2So5kfElzZdWdzbzBzjGxXLaJ
	 GZpSPFbR3QlF8HUhh/ioTNwYD+DKKpRX2h/bHLkGc3lxAsJcFl4Z7Vq2DXi5MrlhTQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=arTc5cP9;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B38606A321;
	Thu, 12 Nov 2026 23:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=arTc5cP9
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B759640E015B;
	Thu, 12 Nov 2026 23:26:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ev7x31dU7Kdu; Thu, 12 Nov 2026 23:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794525973; bh=J38QC4zGVSApOWHxQZjig0u/JJFe43mjBO118XfzzAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arTc5cP9scb4LG+BWouiq/NIRHh4gIHtyH8p3oAAJD9LLoGhFRI30iChgzndC4zoe
	 A27aXxLJXQITbh2dYvdph8BjP/AITZdKsrvJg8/SO4poMuOUlqo1+t45AYwOaKeHRf
	 ZSrj2k16PSYaB+h68qmltmRtK2RN1fEeP2G1sCs9JLU0EomgqRosgIENEV1D24WKWw
	 J7RLbUfy+0nun1a52Iba+5YM4VTPJXY6BSE4X9BJGO9G+9vqv0S17702n2XvMiqGDK
	 DyRf//qlLlZ7uACmIXd47roW+rJBx+ihiUSshEKEmWV541PkT7HY3MdewbW98KwLs9
	 VzDOgeMZW+/El6XQr/rzPZbN2TR3w5A9YHGuSJNc0RBivZo/Lro1UbPbfc1hvkyzp9
	 igMUg6LtGt0dlvd2yvDcsPMTt4myYqjzyf6nn4fhLFgt9u9K461wkQoAazb0dNWmzi
	 ty58s6SL1sp50fD9mS1Qtn+6vzigerDaXf0xU22wdTeMNiEGAdv7fvoeP6Zfx4LwUz
	 /lPcTaUn6Em4igTXP1QmhUIo0smvE8/S2PBFeg8GonmYDjIWYi/w4tDxkXU/ZFTOUI
	 K5/oScXHq5KEsSH1yVhhfRVMMjVuFM9MJ3JPQxzE8zswLwgfklbGQ9FAhVFrf8L2Yw
	 2iGJp3v3SOhjZlmJbkip3LgQ=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 02AA840E0231;
	Thu, 12 Nov 2026 23:26:06 +0000 (UTC)
Date: Thu, 12 Nov 2026 15:26:02 -0800
From: Borislav Petkov <bp@alien8.de>
To: Andrew Luebke <andrew.luebke@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] EDAC/i5000: Fix the slot loop and re-enable the
 driver
Message-ID: <20261112232602.GAavZLCp3bZ7oNPR5c@fat_crate.local>
References: <20261112181121.565824-1-andrew.luebke@gmail.com>
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
In-Reply-To: <20261112181121.565824-1-andrew.luebke@gmail.com>

On Thu, Nov 12, 2026 at 10:11:19AM -0800, Andrew Luebke wrote:
> Andrew Luebke (1):
>   Revert "EDAC/i5000: Mark as BROKEN"
> 
> Aristeu Rozanski (1):
>   i5000_edac: fix slot number passed to determine_mtr()
> 
>  MAINTAINERS               | 1 +
>  drivers/edac/Kconfig      | 1 -
>  drivers/edac/i5000_edac.c | 4 +---
>  3 files changed, 2 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
