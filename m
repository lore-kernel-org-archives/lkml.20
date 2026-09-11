Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8A36A033
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147307; cv=none; b=ky4Rn9vmasJ76EHN5W7tAW0gWNpilY/ge1fPsk7IkzRG3p/y+Jt6A7GoB3QEYL3pjQBfNHhVaUn1tkKYkybJ7Zj1pwked5lp1djrTqLIYKP5tSvnNE+wHblOfZ9VH0wRopGhxYz8ZrCemDk/d8yn3NyzHWrQVCdxlCYRfgkOtZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147307; c=relaxed/simple;
	bh=4I1uM8nGxWZmYlPL6SkGhp0JtxGijtKVdld5zOukXwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPQvmb6+8ElbMWi75SxW0hLNZLvSMLvFV0yRVgmQznL7OGze7q7DbYHzex+t6NLNGBc/Uv8H/eXJULyGFyNaV2RpkXsZjZxQuSychlFyT6eM+x2IfpDY/ygNr/5SowjeBLcRNk1r8GudIEGmmka2IQBP1U+ARFwFkqLDat0INf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Na2Wx0aI; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Na2Wx0aI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 54E2040E00E8;
	Fri, 11 Sep 2026 17:21:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7WRZNeZNnJYT; Fri, 11 Sep 2026 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789147291; bh=QJp+ap3TVTLVGfau/kTo1ba0JD+xXmCdnnWaUZ1Q0mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Na2Wx0aIpjjqATNEOalYlApLaieztxXxlyojyPPpW6MVScbb/EkxVISUt+2WO/v8H
	 mrubJdA6EUyCVnCcA5ZYMGmHOUpU//hvhXlqcgTQDGsts9vzZh5wfBmoe2TItBBrqU
	 k/oy8RpvIwWJHlYjD7YbY781GCXaYKOOLGjbemwC487hv4qDHp8Gyof0R6f9dOoGzv
	 d5srun35oTRXipNUh+VZJWKNUPY/6eq4h0M2KROwq3qzb+apMp+eNNVs5fxqyLgNBf
	 CKuM0ILnhQplXzVLVc2e0rCudLC3YVd0dft+Teo4R9gupR5boU5tUfeZycSPx1m50F
	 ZV9lQ+EXxKQUeG7NxWZ/0ukNVbbMmsrQwBb2CZz140HhPUkFWQOGHV/WjfjsPCJ0f/
	 JoNYfdhZio2JFRyrPwGEoWBjsxAnWkJlWA6tXstPLQ0hG61WDk9c5rVZ8z2u/scNAs
	 4HIRwwjUTaSufBaqtKS2fJSEjvwrUwVE0PjZX6h1XYmFbtshYbfPI2wGsV93TWTz/x
	 6YURQ4x5DjbKWH2FHq4/cOO3PkEHpFdPrKMrAAYO+eYBdDLj8+wJC7cwIdw7zwI6/J
	 8G3BsVdcOFCL0Fu6VJRcLR8T7kVFoj53mIv0+bJ1Im2ZCwXO5z7dZAApoGXuUDn3tT
	 TkfGp/DPn6d1icMgf5T7Vpxw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C6C2F40E00B8;
	Fri, 11 Sep 2026 17:21:26 +0000 (UTC)
Date: Fri, 11 Sep 2026 10:21:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: Serge Hallyn <sergeh@kernel.org>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/amd_node: Fix PCI device reference counting in
 amd_smn_init()
Message-ID: <20260911172123.GAaqQ4kzWKJILg-UBE@fat_crate.local>
References: <20260903154325.74343-1-yazen.ghannam@amd.com>
 <apnMZINAYLpwkcS2@shallyn-amd>
 <20260911030303.GCaqNvZ3QRcCLSmzja@fat_crate.local>
 <aqQtdHUN3NVQI9yu@shallyn-amd>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqQtdHUN3NVQI9yu@shallyn-amd>

On Fri, Sep 11, 2026 at 11:33:56AM -0500, Serge Hallyn wrote:
> May not be worth it, but should we also add a num_nodes == 0 or
> ZERO_OR_NULL_PTR(amd_roots) check, in case as code churns we
> end up with another way for amd_num_nodes() to return 0?

Thought about it... then looked at all kzalloc_objs() callers and how they're
not protecting against that. So yeah, before this turns into a whack-a-mole
game I'd say let's remain conservative and see what happens first...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
