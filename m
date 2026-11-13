Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545573;
	b=KALRxy5xVsNTSzFnfK2J5RAVc4VNTDS4xkTwP1SsFBFqqU4sAsK8EcOb51/eauWStvC+
	 5oiBvqECLDeMEuwnwz8+VDXM/7slc3wrjfaXVhguSB6dyVkyH8PunVwdtoSgl/aW1+LfV
	 5ICAPvcczRv5q7pvA02ghQxWQdcWXDFNqxAqZxsHPzXlvZXqK1ILLufS4vTcaHtGeJTpu
	 gzf2GQKHGQ1ypMzykEkY1+yvYnh0Uh54cliGm52tghRIfN6PUpCS5FixKdf0RMO4Bv6Nf
	 1XwtgHO+EQCr34fLqD7Cxw2VzQuwoX7+O4nTDfgQLV8MAX9kKiP+6n1FCXiySymjxcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545573;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6ILzsQVyl+eB/kNbDbeyLDqHpGWYnEtekkyk3bz+ho8=;
	b=Vf8056qwGUrUR4Od1ijh+wiBTem1bQzL9Xy/qs/UTzfx9eNCyP7YvQP/IouQVgs4TThI
	 wGGaA8JL+hBe6nIKLq8y0rkfDoATqZyeA4CeDVxbeNtgah+wVszAtHEuKvhPgiownsWLY
	 vi6BT0Q+IhHKTrvQ6eozSuQIzHiMN7g4UzlvL20Wb5dfFa2nGs2oKj5xezEgPdJ651TPq
	 GXb5mORGlsuiZLwIJbd0VVPLRAAIqArV9J8d1H07bV3XxY7uiwYpk24KvhOGlOFLuqXgm
	 vVYwgTuJtUWWz+sdrwGvFnEgqHYVU9iAuLpl3Af9NUszPWPq5LATYtGpKKry4G+FNcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=FKhkleG5;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A65606A321;
	Fri, 13 Nov 2026 04:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=FKhkleG5
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E438C40E021A;
	Fri, 13 Nov 2026 04:52:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iWh3k8BWxifn; Fri, 13 Nov 2026 04:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794545567; bh=6ILzsQVyl+eB/kNbDbeyLDqHpGWYnEtekkyk3bz+ho8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKhkleG5KWzwTZhhqtlIT3kagGBUzJTxv3mhPjTy/yF8DBChdB9ImQ3BDZfKi1ph0
	 98UB8HFFyMGjJDN3GWvzvgUmmp050hSDqNL8ZX2JzUJXbdej1rDyUHxUrXbH+tnGs1
	 Hdyn0IMUNJ8/mLjR+wiUQxtWXJNf7ZWA0gEdC45EmMQ3Ha9tEyV3zawBVrx/NZ3Axx
	 gPokMKqz6AOOL4baLBhlsQyxOvrFMhO/sYWR4XkEKoJgxxpdg/48l2JczgMGRMLvdX
	 GWWn9E6JcNRTNvXEewo9g4YCihh/kL68M7jLtYUGKhQ6E9DNXNrrkHiIw6LM+xQptD
	 xveH8GRVqAxx5a0rJMfh/Gw0YaUZIuRb/aRW1AaD3cLE9T8Um5TDe+lZ1icLWFjPGn
	 7lRflrpO3B11TGThMA/8pWiqS9bsRIG0aigH3SH3GU+u2lcPLtC5GUuPqmOhdPS/1f
	 8Y67zNLYQHQD0TA78eKSnpheH52HqUsdlxBdhR2pM2b5+Dwlla8QoywHw2J1T+xC7/
	 gXcljJMqp47ih6nN2bFzOHhfNSZFYcmhAjqgx5yXDBPmZ3b3TYnxB7H4p0LvKNo9Rj
	 dv+pqTbVRWGvPuBhuv86Yv0W2CxDJEe8wfKbdJ7aWFZ12tEcNpkW2YmZxjDJKVY1tX
	 5SHwCrQsG7nJ4xQhJjoqRivc=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 35B6340E015B;
	Fri, 13 Nov 2026 04:52:35 +0000 (UTC)
Date: Thu, 12 Nov 2026 20:52:30 -0800
From: Borislav Petkov <bp@alien8.de>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/7] EDAC/amd64: Stop matching Hygon CPUs
Message-ID: <20261113045230.GCavaXjqKx1l36G9A0@fat_crate.local>
References: <20261029053313.46323-1-wanglin@open-hieco.net>
 <20261029053313.46323-4-wanglin@open-hieco.net>
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
In-Reply-To: <20261029053313.46323-4-wanglin@open-hieco.net>

On Thu, Oct 29, 2026 at 01:33:09PM +0800, Lin Wang wrote:
> amd64_edac gets its node count and DF devices from the AMD northbridge
> cache. Since commit 49b96fc0dddc ("x86/amd_nb: Simplify function 3

This commit is old. Should that patch be in stable?

> search"), the cache finds function 3 only at the fixed PCI slots
> 0x18 + N. Hygon DF devices are not at those slots, so the cache is
> discarded on Hygon and amd64_edac_init() returns -ENODEV at its
> amd_nb_num() check.

Please do not explain the code in the patch commit messages. Only the
non-obvious stuff.

> Remove the Hygon match and the empty Family 0x18 case.

That's what the patch does, no?


> MCE decoding
> in mce_amd.c is separate and unchanged. Hygon memory controller support
> will use the Hygon node interfaces in a separate series.

This is unnecessary.

Please concentrate only on why a patch exists. No meandering, no obvious code
explaining, just to the point.

Check your whole set pls.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
