Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BC39F17F;
	Sat,  3 Oct 2026 23:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791069451; cv=none; b=MMyu4BY77Z+ZYbjWUeziZ6wn8Ffz6xYoUiobqFLyctAj+hR4NwTRKh/AP6gSnHjzn49yYrnLj105uDjpwiR8NePCBidfbupG+2Awbuhn8UqmjKPCAugdjRO7lBl+3t9DoXzTE/49mibCmkfSYftuAUdqcS3oe1lALJ1T+xTU6SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791069451; c=relaxed/simple;
	bh=CWHKXXC5uOb9xIAN4f41S4t5Zw/bnluVTKZw0ImQJQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKvTterX0tlRWkJaJNxS9ROPiHG2EaPWGoRu+8UfIu+veE89RPmCFV6qsGW1OJ9PcQ7cpERNycws4yfi9fo2aSBjUe9CBFAk3BI8xjJETsWC2mXsnjk19VsCzLpYVHK7pScD8ui2o+LBohA4Q2OkdrZt1ksD2bTIjjHfszlRY9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=A5FTc9pm; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="A5FTc9pm"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F1B2040E02A8;
	Sat,  3 Oct 2026 23:17:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bs3J1h_PiT5z; Sat,  3 Oct 2026 23:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791069435; bh=mdkHnY29Sj9s2VkTeuMkQJj722InSALx4gPP9TGUIfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5FTc9pmrS9B6iDTAnay4NYcmOCcUExdeL0ySHr9xS/8lIuIFRGmxEbYm4z14c1ft
	 MGKzZouOFv29mlQk5f81zEu8ZuPL9nR4xMecLbrRA2UWlBCTlB5i9EmTqKqr3lrxMC
	 p0D7q2VQq/P5LaNP0ALMUDmIJv+GVwb1Bar53R9roHOF1pSp9szdWr2jwHLjHMW+9l
	 Q9bikLhg7IefwqYp85TVI2QZUZu5Z8D38ENjANabmZ9RfzjNlF0ERmM7pNuV5vyUn/
	 qfQO2y6v0pwmBj4brSbEdlrPcVpCfZmSv7Uw119NKYpSlCcJIbG/d2wGcQc+i1GKz8
	 qzxZfdhzyYTLEwcThYRKkYROIhPLYoJZsw3heAWeHVCNqIQWOVhTPw1ZTqGyar8VwJ
	 KtBUMP/PIeP5OaudEZhxwLdf9v024lrn18990B71Q2ogRGahq8TEI/BjvhhJCWiXdc
	 30iAJ4avVNZGbC2C26acJLYkJBgXpUEZ/0qeJoQsWDthGXMaU+3iIkRGt9gnBwHXct
	 bJIgUp7i4PKmcNj7+ZHsC5KXC9telK0ynt/FOCHVXL4olqqbOp9NZWQf+NLuaYQ3Yt
	 8GynOlFhxCWs/JdbSb7orW+FQbqzrNq+006xwUgxsvQWs65RLWegTrR1Cs/pS1Cm+W
	 mCplcyrHikZrxgV8pk7T0diA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2393740E021A;
	Sat,  3 Oct 2026 23:17:10 +0000 (UTC)
Date: Sat, 3 Oct 2026 16:17:06 -0700
From: Borislav Petkov <bp@alien8.de>
To: Adrian Schlegel <me@adrianschlegel.com>
Cc: tony.luck@intel.com, x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Message-ID: <20261003231706.GDasGM8vjstliIosnK@fat_crate.local>
References: <20260927151904.30524-1-me@adrianschlegel.com>
 <20261003222012.19685-1-me@adrianschlegel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003222012.19685-1-me@adrianschlegel.com>

On Sun, Oct 04, 2026 at 12:20:12AM +0200, Adrian Schlegel wrote:
> On Intel and Zhaoxin, mce_is_memory_error() returns true not only for memory controller errors but also for cache hierarchy errors (MCACOD 000F 0001 RRRR TTLL) and generic cache hierarchy errors (000F 0000 0000 11LL). The cache hierarchy checks were added in commit fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll") for uncorrected errors. All callers of mce_is_memory_error() expect it to report memory errors only, as its name says.
> 

$ cat /tmp/new | ./scripts/checkpatch.pl 
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
On Intel and Zhaoxin, mce_is_memory_error() returns true not only for memory controller errors but also for cache hierarchy errors (MCACOD 000F 0001 RRRR TTLL) and generic cache hierarchy errors (000F 0000 0000 11LL). The cache hierarchy checks were added in commit fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll") for uncorrected errors. All callers of mce_is_memory_error() expect it to report memory errors only, as its name says.

total: 0 errors, 1 warnings, 23 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

"[PATCH v2] x86/mce: Do not treat cache hierarchy errors as memory" has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


do a

git log arch/x86/kernel/cpu/mce/core.c

to get inspired about how patches should look like.

Also:

https://docs.kernel.org/process/submitting-patches.html

and

https://docs.kernel.org/process/maintainer-tip.html

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
