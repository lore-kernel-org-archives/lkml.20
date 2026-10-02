Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744053A16AE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978602; cv=none; b=iH1yGmA9MMRuuXqHbHywDAKJV2BhDTSl/pGIMzkYTxSA3BqTEErcik4O4Kl03eZB70PPFu2+jGmTcU3rxBfA8JtNC/FYU6CQv7yq+vd3p7VKSSw24WEbnPU06TAtNZOOA4Sg44LuUpgUcniEXepnN0vFHF0HIP7MRnSN2GmRoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978602; c=relaxed/simple;
	bh=xvuVGZS+3Or8z4cjkEDNCKTfKJ3MoxdSg/HrBjaJPkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpNLY7Xovi8cwgq6DJsW/FbznUSMCK13CsyQLwRgmoWVmJctazwfBOiiZ5BumkvtGyqVtJvyaJGs/t22sPGaaZPlw05XEfII8hPL4m2meH2qM7zhQsM8FwRTvfY1Kf2aojJlV9k5RT97uYzVHavkErGzMRTPxxDZNKjIhjF2Mwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=EphSt2mc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="EphSt2mc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A40B440E02A8;
	Fri,  2 Oct 2026 22:03:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id B0CVUMO2Y442; Fri,  2 Oct 2026 22:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790978587; bh=hpSfJ99S6gKPsbvq++cNkKIHi297uZ8Oiyydd+zHjdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EphSt2mcqG1qrC3mM2Pat8NaXOI6O+z/vNpiFeKdBiCQHLeiwK2ZzI+7vIMBUAjWb
	 mEkLhxV34Ui9pNSp4w4UAzme6ZRGFW/8P7dmg8G7XKM2MBYPNoJAqYkGYSv4SHYKBr
	 Ig4IhYBzr5pHotY8HK81DW/A3VZ+z2u0gPZpF1LFyPcBlHVoiwMqJ7Z9urSqXUx4ck
	 1lKXqZyhKfARwAcBwTmcQ4A4tvtbcZNuLwrrVuzlYynK/9LeA2worDU/QAPN0I87KJ
	 pXDCsg/ABUDSI+aNc7ay6G5ptecZ9o1QI/Z5bA/+YOsrGBiechkCxeBrqJp8weVADd
	 341Az8bhewh7JIn1ife2W50QBKTVgeQgOq4pOo05L+z+tbZmrrfoubDsrmL0/0Fiz7
	 YOPYPeaR8e9gLPWVJRMrF0jdYh7dNcO7dpqbiJEXxIQCfgLaZfgDMag2pHf89i4YTt
	 z5Xw3NdksJT/Qg3LcpMWk3sCA6O0OQP/plWCUyqhVewrcF3zZzxEmjtFGDKh4D7OAN
	 JwDk1Wj7I8PCDf/tIDsunMFs/9mGfPPmlpq9U3aqutrlB9TEKN7T3qr+1HX35BmA5k
	 xvRMoWl6Eb37T+QSMfyzltmWprqoh3sGUmg6AIiqpbQ/MlbPeYXHahosef5nY+jiqN
	 K/4X69qvOhdFyTbMQvgVDAgE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1C9E840E00B9;
	Fri,  2 Oct 2026 22:02:51 +0000 (UTC)
Date: Fri, 2 Oct 2026 15:02:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	david@kernel.org, Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>, Rik van Riel <riel@surriel.com>,
	Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261002220248.GJasAqCFwxOK4l2TbS@fat_crate.local>
References: <arZHp8hjYFXE8Rkt@gremlin>
 <arde/t0zQNEkWqi5@pcnci.linuxbox.cz>
 <areOeRwZOez0eHm7@gremlin>
 <arotyz5g6LozSjb1@pcnci.linuxbox.cz>
 <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
 <arzRBv9ceJsxJppI@gremlin>
 <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
 <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
 <ar9yRqq6cBxHDWKA@gremlin>
 <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>

On Fri, Oct 02, 2026 at 04:55:39PM +0200, Nikola Ciprich wrote:
> I'll leave it running for few hours, and report back. If I'm able to reproduce,
> I'll try recommended workarounds and report as well.

I'll venture a guess here and say that Matt's reproducer won't trigger on your
machines.

Just to rule out any other issues which got fixed in the meantime, can you try
mainline Linux and see if you can reproduce your observation with it?

If so, you could share your crash core along with debug kernels yadda yadda so
that I can poke at it.

And before you do, make sure you have the latest BIOS and microcode installed on
that machine.

Also, where can I find full dmesg and /proc/cpuinfo from those machines which
trigger this?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
