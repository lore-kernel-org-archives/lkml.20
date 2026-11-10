Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280748;
	b=DnIQLw/pGXx/YTvcvprCa2J/+egw0ehl/b50RpDbSOYz/j2dBDi6PgwBye3Des2qWu2B
	 HtLoQSYaMjgAqvpNMZe0QXuw0BWBj62dAv7dm8mt0YFnED4faopKPd5Mlu6tk0zJ96fKd
	 Yw6tKM6bidfOnLztQu48MvbRmwufo718V4V+v3K0sPJI5Af1548+CNyNTQbaJKec8AQDv
	 WQ5QlK3Xf00iKyb51mNU5rb/xBucUF7o0YNVnljs/OjiUIkzF9Cmi9UQOQUDDLdMRWwLY
	 UoLPLQVoKtc/aBxgofmnNmPHe51i2IO/5HKOIGkC/yM7O065VRDGI6gVXoNA7hn4WAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280748;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dQOiQuntJxWaMW2wBIgvpIn4O+T9hkeTEpjmncAvH1c=;
	b=ysvWB6s3Q9+BQvMi2+QhSXdvlhUabuY/YnTC6G1Uhm/r9VqHNwjP3fwFCTJ+nZVSFncM
	 4r91SIRmhVEzFGxWWm5kcN0sn/2/9j8qhPDd65YNzkChRlRKR+VFQRfkF440Y7ADHP6YQ
	 IcthXVZOys4oqatZSFEPkSITGi3m/LWTmzqwN19aIse49jL9YxBmq1tBADX29UBzbY/kG
	 3W5leJdPTGZmDbEKsMccDp1iaLDM3BePq9fjZUakdgcUHzWpxq9oOr+wbZw9Tm7y25U+z
	 SY8mHVmsUd38aFlb+9XOlDHoSc9TSMKjWiDn25/VZYgHp2gvt6+jif8MEY0RsIzjLMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="QP81Vl6/";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=QP81Vl6/
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 39A4E40E02A0;
	Tue, 10 Nov 2026 03:19:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id znn-5e1FeLiH; Tue, 10 Nov 2026 03:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794280742; bh=dQOiQuntJxWaMW2wBIgvpIn4O+T9hkeTEpjmncAvH1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QP81Vl6/RglsalDVqM8UvNdIR6HwEvFsa3Y9xf9m0n0GWtc+0VkW422bPLnoqM0p5
	 xs3r0exvfE54n1L8MURY5+Zpps9zl2Zqs5KKlSKEde1GgerQ0WCfVM1bSa5YbSq49G
	 HD4f59jzerD6+SPMb6euxDhD9CNKf3y3x4AxLq5aelwlEDQmv353Jb5XB4SPESrE9V
	 cPFoFkE46NjcX2NkMLaPZoNWH6wWTNAAHidbAstoNs/v1d5xDwsurh8t4k3QNb68ED
	 mP1hgItqCpAn9bcorP1d5SG38Zqd+sT9kUhaCs9Ww07gP+McSZIZZnT96hYjubMDpW
	 +veMcyB9Foo7dbG5XYMyIni1evX6jY4g86EtU0Hgz+EJd7QkRzKCKOXlusgzW9di3A
	 P6tVjbjdL9ieAi2GPoY/D8C/woyRYVyAawKpz/bt/QbaNc8q7RCLP7h99RTAvQV8SL
	 RwccuQPkVRG79nleNGaLucbYbUVnDLsyggThpm2WQ6XJHFnbnc+AKTvRCdqUydtj+E
	 QrB07Jk6BsNTWEGWi65oPUuv8kPhEydNl8rgU9OFW2p3Xki+iZd7TvJQtFzDfgCvGM
	 wjLodFRBFbc53WN8Y6fvO+soMaA3SQXxdW0y7fnWrcMJ1JdpJG63jY6HxooUoAvy55
	 E4aFfhluT+RqUF2kBCGdmNcE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 808E940E015B;
	Tue, 10 Nov 2026 03:18:52 +0000 (UTC)
Date: Mon, 9 Nov 2026 19:18:49 -0800
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, peterz@infradead.org,
	david.kaplan@amd.com
Subject: Re: [PATCH v4 2/9] stop_machine: Add NMI-based execution path
Message-ID: <20261110031849.GHavKNGVVonhk_OaOt@fat_crate.local>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-3-chang.seok.bae@intel.com>
 <20261110024646.GGavKFllskPQiLrNOK@fat_crate.local>
 <35c49d1a-4447-48de-9741-dd6200dfe8a8@intel.com>
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
In-Reply-To: <35c49d1a-4447-48de-9741-dd6200dfe8a8@intel.com>

On Mon, Nov 09, 2026 at 06:58:03PM -0800, Chang S. Bae wrote:
> Here is your previous thought:
> 
>   This one would be hard to fix because that's the
> 
> 	err = msdata->fn(msdata->data);
> 
>   function pointer which objtool can't see through.

That's why I pinged Peter whether he has some way to fix this

  call to {dynamic}()

gunk.

> https://lore.kernel.org/lkml/20260127144947.GKaXjQi8R9cE17WYKM@fat_crate.local

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
