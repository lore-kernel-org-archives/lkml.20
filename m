Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF42F33A9E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361938; cv=none; b=jb3+BMm3vvcoVyiOnzyWBRED89jlmwXY2Zcp5fMqeTq0MWMdFubWczXkVjsUks/pHLwGCBI7JbdOHeQBY6l8E1JLDEAVGzJVye64+kBDCinSHPcxhpoRa0y2czOQiU/ko7fFrXi+u5AOp5IaoCtrPZMIDH1sYcSZo+X2EZYmf1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361938; c=relaxed/simple;
	bh=ivzW9O1B+kKbfvN7U57mVrtlqcx+Tw/f8WeE3wV4YCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrV6G+PgEG4sgji3DK31hFMulpxWkSYUegBc1g5BKJTWbaUr78Qg8BL+Mo5qN0kOp0udQJJcilDdUwYRUZyZZqrqIHfpBxRIqD9CN3fDOEhtTIDXDcuP/CIO+a5K9SrQUENes2yluyqnCHDk9JtPGdnkxSGtyqfB7eLVAH6TYxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=emOzayVK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="emOzayVK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4E54C40E022C;
	Mon, 14 Sep 2026 04:58:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0czUiISd8Vrj; Mon, 14 Sep 2026 04:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789361924; bh=2WOFjO2fdvMz0OO58EhbrWJxHx9DSBuvepSqrzuGqx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emOzayVK7TRCfEVRncy6y1i+skAq8WrqXrsJaSQRJVglFcgUkMvW0KFBoZNFDKK5A
	 X+q6majh+EgTN87BKHRsBshYNjyFENGRCN3suVHCbaw0D+urnZcBvmAnBIQry1tDk1
	 /j7lBRf9HPdq8HHB4FgGFo7oyKPaaKeaIkbC00tUvPhOBXoN5nwTB2d6B5VFgkBl+C
	 LYQUrupEx6UwgeDx5hM/jAjAB0h7VmkUviQnuWB3CuKKVh2xN8iikhQk47ZgYv8U2W
	 P9bASzIt7ZyWLAEmXAsEckM9LkZibfTjG3LyKDgc+Qk7MtbTvVAo/M+xFi7w9jI4Qo
	 BAz0SUjs+E+3NSz7eHV5FEwERNKRPGWGCYXs7P+iR/67In1i/BEBeadgwNXIb6kUcC
	 dCsXRnf6Zxz7OWB+R5yF97kZSzPYG0F5cGNBXeZZqnYqDLRTb7jHTqeeu93W4YS0xG
	 C89CnoP/NXSM0WGF54N68oKhs9YidGelQmKz3iL/mYc4Et3OZlDLqULyLM+Ld7/i69
	 lJVRcYRaPbJAcrVmbpBOQjgkGmn8YW6m0pnZNOKUe420Kns4T5AGbzEAQTXeJ4xbmg
	 mV7PZl4oPNecPfOBN9eAIOx49PvNj58CXiZiaW16kqfRW1ORhd9XVX4oTTjNi4StkQ
	 CIF+CTdVAEi6jWf5sIWZHMTk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 897AC40E0173;
	Mon, 14 Sep 2026 04:58:26 +0000 (UTC)
Date: Sun, 13 Sep 2026 21:58:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Rik van Riel <riel@surriel.com>, Matt Fleming <matt@readmodwrite.com>,
	Henrik =?utf-8?Q?B=C3=B6ving?= <henrik@lean-fro.org>,
	Dave Hansen <dave.hansen@intel.com>, dave.hansen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, david.kaplan@amd.com,
	Ingo Molnar <mingo@redhat.com>, luto@kernel.org,
	peterz@infradead.org, Sebastian Ullrich <sebastian@lean-fro.org>,
	Joscha Mennicken <joscha@lean-fro.org>, kernel-team@cloudflare.com,
	kernel-team@meta.com, linux-kernel@vger.kernel.org
Subject: Re: PROBLEM: Probabilistic segfault on AMD hardware with INVLPGB
Message-ID: <20260914045823.GFaqd-7yDf6aK4JUQr@fat_crate.local>
References: <CAAuFnRTyva1_3tsF3vrMBL+TLS1YL4EgUPT2c3O9k7A9hWUMnA@mail.gmail.com>
 <20260708112718.13323f59@fangorn>
 <20260708155146.GAak5yEiHU-YM1Wid9@fat_crate.local>
 <20260914022055.1639690-1-tz2294@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914022055.1639690-1-tz2294@columbia.edu>

On Sun, Sep 13, 2026 at 10:20:55PM -0400, Tal Zussman wrote:
> Is there any update on either a fix from AMD or merging Rik's double TLBSYNC
> workaround?

There will be an official thing Soon(tm).

In the meantime, 

"tlbi=ipi"

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
