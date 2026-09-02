Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838594AA1FB;
	Wed,  2 Sep 2026 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365650; cv=none; b=a2f17rgaKxxcNTWO31E6e7qjsB8xJ7/DUSj1VO8TUi2mhd9KMmGARVtA0SBT/GtqnzXBhG4KiFNJ5b3Sr7MtxY94R3OmsOS82RdGOA6K/cPjEL2dBS2QDM764Uy1G6jVAVO9lyHOCUWJzvE3k8io1eiAKGEii7qmcrvxETo86tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365650; c=relaxed/simple;
	bh=jeZZFxqVUtyDQBa9Grm/LRnr+jvpjvm8tBq47Rdmc6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp9xN4w8YAoXHGz9MmpwqBKRQCqKVJ7oL0oSJLOhPfMzaiSywMqlsRAo52iMJfwR0a+ciACqO/FVKU7okenKaIGe50ZbsLzW4r7e8azSu/9mdPo2qP5UiYAIvmIfOlsYEdg40/feaDMNQ7aSP8bShQ72cEsSc/2b6C6nQEP2AAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Txj/Nh0d; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Txj/Nh0d"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9B2AD40E027F;
	Wed,  2 Sep 2026 16:14:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gRpwkzEokP0X; Wed,  2 Sep 2026 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788365632; bh=psU3q82kzGy+BjUnVNhpSzLZqNL0ZbkYHtyLg0erapE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Txj/Nh0dvtDKjIAUGkClDpMddymlmIny0TWLy5QpmcmnlD52tCwtOW0dIfFU6rJE1
	 DwaCR9vVLukxOPcx1W9D+qFEUh/Jic/y/cu16D31ENveLR2ix1ijtdYyICc1u2Qsb8
	 GtnR2xDSxCLtMNQbd2gzSsX1oNeFyHnnUsyYhw8q/xtiAqMAtxZYio+zTGFoqViPzb
	 VxjP/rLUbr7jlOKAT0tQiLUgsYJNk+s90bQHxE6TFV0AHCFdGNZon8td1fpF2Lkr8P
	 o26fikKjeptQ3kmZZl6Y27gUTBAOy2ohg5Ug4CYQQbaYNONPAfEkB0F/nFfjJAmcXU
	 aqY179xEwjPEEZPsZHIocIgDdxjuW+Q9twz+Jigv2PDqKoVNO1qEMUqwNoPFMGGzw7
	 ekrQOLVy/r6/3Asy53nsPKtkoPshG5m3EoGCPNVqLsEyvwWLf5LvG07a+TyyqdQY4q
	 w+xMcX9mQZeWVGKFKzga0bwBCtV3HHSRGtgdaTpVRcGS1okqz+qvr7C3mNaGVWirqy
	 4ZJcIGH5cFdNwxPV2HlXlSAO/bV09Vq055O6UqlEUxx8kpTklEcTy7ONbI03apNkBs
	 YwVCjOmKnMPEN/3Djcn/bSlZK2yhvuSPbPaCtsIvfEH6Cs6sJWxsPjIVTR0A5Wm+jh
	 o49wOv7AoeMs6KbOimmjrQs0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D276640E024B;
	Wed,  2 Sep 2026 16:13:44 +0000 (UTC)
Date: Wed, 2 Sep 2026 09:13:41 -0700
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-edac@vger.kernel.org, git@amd.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in
 remove_one_mc()
Message-ID: <20260902161341.GDaphLNf5-oebw1SZM@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-3-shubhrajyoti.datta@amd.com>
 <20260802184623.GAam-Qf9-yes1DkNkl@fat_crate.local>
 <CAKfKVtFtFmUKwnWY4xGwcRQG+qJ2UdK6LK+3QX=Ukvr3v4Y7EQ@mail.gmail.com>
 <20260803162920.GAanDB4FyqT3mLMm-U@fat_crate.local>
 <CAKfKVtEOn-jSiqHs9zGc4qNahQUy3XbAuACgtE5joF_ctGxjMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKfKVtEOn-jSiqHs9zGc4qNahQUy3XbAuACgtE5joF_ctGxjMw@mail.gmail.com>

On Tue, Aug 11, 2026 at 06:41:45PM +0530, Shubhrajyoti Datta wrote:
> The driver currently assumes that all 8 controllers are instantiated. However,
> Vivado allows users to enable only a subset of them. For example, if only 4
> controllers are enabled, only indices 0-3 will be populated with valid data
> structures. During rmmod, the driver attempts to remove all 8 controllers,
> including uninitialized entries, which can lead to a crash due to invalid memory
> access.

Yes, that's what I am looking for, thanks!

I would like to read a sane explanation and a use case how something can
happen so that when reading commit messages months and years from now, we all
know why the code was written this way.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
