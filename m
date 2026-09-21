Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B94A0142;
	Mon, 21 Sep 2026 17:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013183; cv=none; b=HbPZq2XZlcfzH4mCwjJvyQna4ocs3JFPr/95DXjcgN9lgn2WmN0UZql2ZOp+5CvGYtQJDWXgvtQFW+6/f4UFw1vesxodaq+HAe/X3dzu459VerJangm6yhGb2Gc1mAsXs9QcYHzkzdWPs27zKEKSfaKsAq+4se/zH8b6zCy33qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013183; c=relaxed/simple;
	bh=0tIrEQ2vDmaTi2aEsuk+gbiP4u+DOckprgePuyGECz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZBsDGqsvDkvzawgvlx2qUbCxuyejYpbaAgd0RzXTE866ClOqmUdEOhFhGq6rdcqlVn7ny0L38eEACXFVLiSCtrBxwj7IVH2/PCv+EVecPlW0wtCgh7b74/Dl3cweI92PHlJRORkf6UFQq3WLuJebHjQ9srVnrirg4eE7PEQijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eGCV44gi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eGCV44gi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0CF5340E01C9;
	Mon, 21 Sep 2026 17:52:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KbXqeCS2mUog; Mon, 21 Sep 2026 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790013161; bh=AbVo2/QVH386Ku8Bo5oxZmE/QguSBSVy948WSmBgYe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGCV44gimMLgq/X932BDAVBY2sHOjQEglNpc2tXO0jQWmI6Y1QOEGK6zHxzG2C3dN
	 bZ9+r0wlOJO7OARAqJnvjHOrN64H61xAluwjotSlleaKURhs/YE1y05nSS64A+EEBU
	 HdDWU2cJV2v8uwJnkUfiXgsixkQDCAFpMkXzLSCzBCUqhT2yyGsw3xrRDAAY6qQkru
	 EuLONEkGVf+MTmR10LrWLtcpCf1blGE7+LcxykZDGNsmYXhxY8ho4IU7suH7rJ0Vk9
	 02NSIWtxQ0GkmA59tRNNVAS4EeFhaQgmZshO1wnoDZDPf8HxDEMnL8T0gli7bn09rA
	 KexezAOgjDjeStRE1jWLyXm9DC1b0/hkqBLsVLXlBLUlaE9kmC/yzmt7ur2e0RyihL
	 u/0EEyPRQEHuB+t76hPte0AadzNk/bff6l/Hlmp1PyRGtq1yeJSsIYWWvkTYuXwur5
	 nm+WNUji/FAjtZVuuO4wXOda7HAqBbca0EUygKZ439zRMiCTcWkd1b7Va7uzap1otL
	 7t935g9HWOzQaVrxROvwYErB63tkCSpoW+d0JdMTX7E6uyHBHgq0zuWs+WTt+MuHzz
	 BpYIt7usnw4Zn2TM9Jdxc4lQ4rNfUi4whjMBwjrO6+Zm37SznXRRsGFwf/ALUvr+2i
	 yhn+ibYKtTipeaCcb+C3fJPg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A4CDE40E00B9;
	Mon, 21 Sep 2026 17:52:35 +0000 (UTC)
Date: Mon, 21 Sep 2026 10:52:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RAS/AMD/FMPM: use struct_size_t
Message-ID: <20260921175232.GAarFu4BFEb6BLT4wt@fat_crate.local>
References: <20260317031650.93712-1-rosenp@gmail.com>
 <20260319162818.GC1666212@yaz-khff2.amd.com>
 <20260919035457.GCaq4HkXYv5VYfBtoe@fat_crate.local>
 <20260921153640.GA100628@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921153640.GA100628@yaz-khff2.amd.com>

On Mon, Sep 21, 2026 at 11:36:40AM -0400, Yazen Ghannam wrote:
> BTW, how are you triggering Sashiko?

I don't. It reviews everything that lands on LKML.

> I see that Sashiko replies directly on the linux-pci list.
> Ex. https://lore.kernel.org/all/20260918145619.3016889-1-yazen.ghannam@amd.com/
> 
> It's nice to have the email replies rather than just the web interface.

I think that can be configured on a per subsystem basis but I'm not sure.

There were some threads flying by on the subject.

You can always simply search the web interface for reviews. It is pretty quick
with the review, usually.

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
