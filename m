Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94855931D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707667; cv=none; b=jNQ87hG2C8KrXr/yObJKMgV8dnNzxrLQG87MSLx7hRqjk32QC3Ns/0M97IpKIED35xa7T+THP4KTsPWl7XD0D4tw0/gqlqWyGpZ5HTkxQZc8InOs9WbdeE1VFZla3bVHSWxH8RDZ36a25QSdw1i/XANTerTvwK4KbsuIOfqb6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707667; c=relaxed/simple;
	bh=xX/iQDiotY61k+xrAV065ovLfFAVz4qgoDMJvGWRdGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EahtEGfYPbPY9LG0Ce4nRoMdqgA8FouUAGQGvttN3vAZ0LeIibn2arVlrnSuSkGBq6ldt5zPOjFqSIFL7CTp5LNPKk7TcDDvIoUTeyo/WcW0zQogZ0LjYE0sgn1H0j1Fgl6rFF0HbV499jRudGWAR12Ly2Q6eTxipINWi2Sc6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Wbmh1R7t; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Wbmh1R7t"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B9C2940E00E8;
	Tue, 29 Sep 2026 18:47:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id P8dDUnADABTy; Tue, 29 Sep 2026 18:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790707651; bh=gGS+i7jl2Hue7f10m1jiYs1TAok1PaRZxQ6UhWE2U70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wbmh1R7tULh9U4GTqpAFdPf97zZyiWfyZUvoqmx8Tx6+vZJly1edadxvFXXALd1iU
	 Tk3GcNi6irRIvCsgom/f6GdqslZ2ZRB4Pl/Iwz4DrtgpcazXts6eYSr3LljsHp8hP/
	 /EOtkKz6yeFrZk9hnsKlODLr3kvwSl7WaUuUgKUXA/HKINDMGeuolBdPufGJ/9zPZW
	 z3sEIMHyPLeu9jaSRvejidlHiTrWFRzN85LBvx62bZI2oF+87rH2xXRCmKmcMexSxo
	 pzgYpgLkZz/NGBmn51wUd43ppKBRz1cQvoqtao15i5fQcRKFO40LoHuaxlrKORwtK6
	 bQYgzHVOWneedm5zYR/2PqI4Rg012FLepAasiMERnRFRNegN9bdvY+OLTBdNMZ60F7
	 TFuPdCWpaq1GNTB5oR4FSQLcb29g5q73SRMKcUmtQv0LPi8++DyL9+xk9JzPCSQlMm
	 GqrXUuX1I0G/eWdVzftD1/U3bkFRuklvMxxnx4U+pDKUIz3klb2g0pd2j0R/d5RiwY
	 hdg3T1ma0V3r+2CA72eWknc8nH6/PgE/ZoE+GEwpdi3vhrolD7PTVOml0M92naFdxh
	 HiDacN1pgRCifAAIxoKgsB7mI9Jeq8jkx+X96xe46uEcu9U+My+9Zk4I6RaLfmZz9B
	 JMAasLVf3cNjk5UqaeVvV9tM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4B24840E01ED;
	Tue, 29 Sep 2026 18:47:24 +0000 (UTC)
Date: Tue, 29 Sep 2026 11:47:20 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, kevin.shu@intel.com
Subject: Re: [PATCH RFC v1 0/8] x86/microcode: Enable uniform feature
Message-ID: <20260929184720.GAarwHuPvasUi-KMaX@fat_crate.local>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
 <20260916004502.GCaqnmjjj7kApOD6_M@fat_crate.local>
 <4e801667-d494-411a-be86-dce4b953a114@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e801667-d494-411a-be86-dce4b953a114@intel.com>

On Wed, Sep 16, 2026 at 11:10:19PM +0000, Chang S. Bae wrote:
> == Introduction ==
> 
> Intel introduces a new microcode loading feature - "uniform". With this
> feature, loading microcode from one logical CPU can update the whole socket
> or the entire system. The hardware implementation works as follows:
> 
> <-- paste the appendix here
> 
> Then, I guess I may say something about its side-effect which in fact is one
> of the motivation to support this feature. Could be combining next two
> sections into a summary before calling out review points.

Yah, the approach should always be:

Introduce the thing to unenlightened readers. Keep it simple.

Talk about it and implications and blabla.

Ok, loading on an arbitrary thread and getting everyone to upload sounds like
a good simplification for software.

But I guess I'll see how "simple" it really turns out after looking at the
rest.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
