Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97049547043;
	Sat, 19 Sep 2026 03:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789790122; cv=none; b=XvDsqzwQ2A2kBziJprjoyBfi1PQ6Hhz22OsusCx4jgV4fuQQ4Mt8tG73xdc2HyUieXzymVrOSJIwY48yWul1uNxfPCW72HG1I89HjtsLLcFJavE6cc21SQSmzkER8POj8rIpMvRmAZHIDaSEM7roxV18A625UCyDZG8jIQVdhWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789790122; c=relaxed/simple;
	bh=1ll195WckDHrXyPFiLac0cby9lDyHZ3EGH1jDnMXp4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqBh013SeNdxO9B2Dbl6LtJYYQj3yHa7pFsVSGSmFpvKE+9Q7qsOsKuj838WHvHZ0ghJCDqJ7JjVaQZ938Ht+wBQgit65OXWCWGaY8HoVK5nMJ54rd/e2nHAYJaFD96skktrZcHgwWNiaylSE96dlhg2tTXq3HKgMmr1aCTTztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NBudhYfd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NBudhYfd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 801C040E0173;
	Sat, 19 Sep 2026 03:55:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MbMYMLuPhy0y; Sat, 19 Sep 2026 03:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789790106; bh=/oATnop6oW5Rg3jwJOG9cPSskKWFDp8stnrJSw6b3+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBudhYfdSL6HooG/x8KRJbi6NzBbkQPB4unp/N1h24sM9QUtuzQG8BR2743tE3Ghv
	 POuqX1yB/z26Yq2/CKhqjZChchK0+itI60MPW307Szogpthsgw/4RnFeuy99huejMk
	 cF83QmlrNjvZ3ORvGnBqqBIAIll3hpUkAsxDX98TCL8NfArTGUCHOAA2K0DG8kE2vO
	 kf7nG3EGPKZT43QdQv/+kiPlMZHoEkHff0sXcHbY6sZECjmkYUcGimaQOADTly8i52
	 80UvrZjlWIJMruYTkyjmxCHPjztedmS72qQ15GDXUf47oZ34j4seZ7M8+52QPkrPyF
	 iu8xNYa9UGIgDhNH2E1bn8xAoIw24qucKqdCX3OOa8VYNOl2f7hsnu3fIBdD6Wy/Eu
	 Z6xX6LhA+mx9cCPzDul7zlKN+xixpCEXLXPk+RuZo0iDHjghMu5v8+icwqt2NbVwkb
	 KJgMSqfYXDDyOTUCfdiYn8pjH3SYD1l1j68iW7mgAV7Mpqx8nPsGDgsxU4OoamOO4W
	 pZQY7+D+0An0RQjpzDXvoYc+AKfSclny3c/sBotQAYx5XHt7LT4Wqq+JdP3NFPQMhv
	 OEGC+xYgdhsHTy8vd/3ROHQlWXAZGw8WaUQDa6/cakH34EZlGPXxPKE7w82kllLzz8
	 22M3AhhHBkZncqiAYX1LbJ40=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4CDE540E015B;
	Sat, 19 Sep 2026 03:55:01 +0000 (UTC)
Date: Fri, 18 Sep 2026 20:54:57 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RAS/AMD/FMPM: use struct_size_t
Message-ID: <20260919035457.GCaq4HkXYv5VYfBtoe@fat_crate.local>
References: <20260317031650.93712-1-rosenp@gmail.com>
 <20260319162818.GC1666212@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260319162818.GC1666212@yaz-khff2.amd.com>

On Thu, Mar 19, 2026 at 12:28:18PM -0400, Yazen Ghannam wrote:
> On Mon, Mar 16, 2026 at 08:16:50PM -0700, Rosen Penev wrote:
> > Avoids manual size calculation with the proper helper.
> > 
> > Also use kzalloc_flex for the same reason.
> > 
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> 
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

https://sashiko.dev/#/patchset/20260317031650.93712-1-rosenp%40gmail.com

Yazen, there are funnies for you too in there.

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
