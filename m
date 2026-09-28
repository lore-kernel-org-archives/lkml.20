Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53143C1D5B;
	Mon, 28 Sep 2026 19:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623270; cv=none; b=YB25ROoRX5BmWJtbvEV6kwMWnNt2EfCYIw+/ZAVDXdxKXrNuNxkr+0WJD/xuthS9NTuwmdNFPwYDVRuYbfJYU8vH/J8+Zc7Sp4vP/lEJuJbXQvqS8xsY4+28MRn7I7tIzb6WUgGR/hgkZ+wpXKEax3OZxskvyFDY52dgNgpTe+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623270; c=relaxed/simple;
	bh=QasQxIRx20taz4gWUy574eMahZ48Aax1dCcVCA0xDGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1okAk7VJ9VmFI4at1gqzTax84Dac10dmvEI/LiIHX6jcz2dI8o0JANAnYd6lprJqdCyBfnm0mPOPuczdAOSde5EY7A/PxqUouaHFrWDOeQPNuqnzYqc35XCRofyyjj0khPk9zOz6EHfG0Hf6d2YqkGyv/BPaQ2S5Vi8EF0laC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HZxLkY+g; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HZxLkY+g"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2C32B40E01CD;
	Mon, 28 Sep 2026 19:21:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FSp33QZJmj3t; Mon, 28 Sep 2026 19:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790623255; bh=hWMdcqvL+ZRtnF9HF93VtM3rYEpoQymrFCVBxhuYp6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZxLkY+g3HBVgFsl7x/przJH/+335DfjkQMtV/Oc0EPQVVPBLHk/h1dArKQ0TNnmv
	 VEpRuTfVsg+3hNSC6AgsnYbWiRCSAZtjTC/e7Fy0irzy17LwgHdRpcc19KWmU2SN19
	 yATTITu3W8D/Iy9BYRYs1/Apso/xFcNGsgIVbJuq9CT5dBpoMX4v2juRYQ61rJlV9z
	 nWKhEN6wQLGqS6zntdlZZ8B3/X3Ap7GKK0cPhNqD+6qcrm+io+uB6+LgIZK2c/+bAH
	 GOBJLarB7Eo8Uu7KgG8AbkgwT9t8P1Ud88fCfsOH3kYRqsDuh806Rlq42PZeI9VgiF
	 UOmoejsw5wXYDrVZRkYy/1U3AMLBcwjQUYLxvtmY/jsvyIkojmkx57XcY0iJVE7mF9
	 1QVIZ8VzEWLiff3/UyC8Ewo+JwsepS4gav2K4709gQOvb01L4prZsDjamkp1Y0WeTv
	 4W+Nru8/8x+NvaKEw1bAZwZHsUpWPpaKDnc1vQhNjv43lPlQMNJNr4zgV5EYDdHpHl
	 Ly2U7uT9LP+Ga5d0dQIh6pDps3Vl4Mv2QmTa+YRfKN46QtpbmLBYFpqHEC9E4xJiEa
	 ejHjwqk46KmS8DFtW7n9s04CSuGAjxsdQxPSvtPDVkmT3K6qnGLViWXFa+pqAObgpU
	 7LNj2QAVYPn0LRvuRGXKXpko=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A729140E00E8;
	Mon, 28 Sep 2026 19:20:49 +0000 (UTC)
Date: Mon, 28 Sep 2026 12:20:45 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] EDAC/amd64: Mask UMC chip select to the four
 implemented selects
Message-ID: <20260928192045.GAarq-DbwF6-q79hXC@fat_crate.local>
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
 <20260925172639.97063-3-Vishal.Badole@amd.com>
 <20260925181429.GBara6BXp_J2rnvoOp@fat_crate.local>
 <20260928143821.GB2289128@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928143821.GB2289128@yaz-khff2.amd.com>

On Mon, Sep 28, 2026 at 10:38:21AM -0400, Yazen Ghannam wrote:
> I didn't consider this a necessary fix. But it'd be good to have it to
> avoid noise from reports.

I didn't either but what is Vishal doing to trigger this:

"Since only four csrows are allocated, a syndrome with bit 2 set decodes
to an out-of-range csrow and trips:

  EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)"

Vishal?

From reading the commit message, I still have no clue how that happens and
what are we fixing here.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
