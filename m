Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794103973;
	b=YpJkx8f+m+9279eOYXsBCQsFWVZzSGODNYWc8RPzqdAc08plbfPyhfKs1RuqVjKjqBSN
	 r5efXeb6VnBzrsBMnaSBo3+xAq5FLyOeH4HyRjEnqSzcr9um2Fr3eBVuqB+G3997RSpGk
	 EAQxx6Xs/CG4xQbTk4AjQw9Qt1q0ksHP3iOG28e7Q6KRjGQIBfT/BUE4sx7eXINp1EnST
	 XBK6zoh1I9KNesVPHWODj+oWMqjMYDWK1/x+1Y+jLDnWwFnS2pCNKB0oBa3JUJUEgT1EJ
	 +oc+L6UHm5JqWUDLLEUOJrZhaztrNtsA1oyfyNHg8rLTCjvEfkMjeqF5FIYZcvAYSTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103973;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uf1wN3T5LADeJBLEy+5sfNbB1ElO5AgtMXLT9lQ62jE=;
	b=MiUbx10PP0hDG75Jtn8zhivOAGu4Gpc70KeE3RbzDfxsdOZsCuL2NH+WuIIXDIFYf5VW
	 yG+NaoAPxyeje/9MHaAm5M/uBOrtXH/iDT7P5ainZ8J4dHPcUoVLF025knoxaXVw6VUrD
	 +GJvuCY6WCtq2hC9aDHKMtO8QKowm+A1qwSgTdASb/MNg/3S3J1YkANLF+5jl0mFZDuDv
	 G/vZNp0LhAwKFGjIrLMBs94p7nJCDW50SiMrdRBFuKoV/7ZbaFWT2dgBCHZ10buh0LAV8
	 5ogeMpdBPpTVZW+eFz4n5OFpXppimPk+rLCzVAacAgR5nH+50JmGDUKk585L0zUVeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=deYmsiU7;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C82606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C82606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=deYmsiU7
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7B0D040E03BE;
	Sun,  8 Nov 2026 02:12:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tixrzEljs29d; Sun,  8 Nov 2026 02:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794103965; bh=uf1wN3T5LADeJBLEy+5sfNbB1ElO5AgtMXLT9lQ62jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deYmsiU7FucEWM8mO49mM4cxQUhkEhWcFsUSmmatrpbY/T3o5bgth6WNCfJmL2tZ5
	 E5Gs9piXIpzr8kS9Y7mXk7klcnY3lQC64np1MW7D9zNA5h2alekkbYQlvKy0M7j9nJ
	 8Q9yaqP/n4a8Irhw2KJrim0QDg246xvWkJcbmfAoC28XweubyEsLkBhoSQm1/cXROy
	 k0upAgbCU/gQbsr4i5NuY2PZSIEcBfQ+BMOW/bEYYeNUADldT565Js1Eo1YIjoPmch
	 6gsHxCoIhlzRKk05o3kY4YYI0icJdAWWzwQtrLiXxvroQdQEgH/TqPI0XmGuJjWvM5
	 0Tp2rY/ED10gyEKOWKYh0ShPw4esEKxmhWoyNBPFm+1gBy7BOMlDuunbE6Z+qJp+AD
	 i5RyK7claYCJDTj3Hhy1iweE4IMDu5iDk0PC1t1zub4ZcwoYllkqZuy310ThOLBk/2
	 /LNVsgajHZ0KVFVTJiepYmS8MeyfrCqrzYfg2XdLk03KhPmz82AjRXagQwu8oTVwRn
	 3ixKKLgjI/Pg+5JmRTX8LOPaFt6sk0MS2Ol6Hyy9XiIcJrd2g4pg/LnjeQ2oERK3Fi
	 00+eg6Gs/hXt46hybIRAjTAdL5kTe5OanNa/dWSNJgn0jmp094CzlIjSpGZfHbCT7g
	 Or2G1yo4mRt1kpZNRi7N3lIo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 41E1D40E016C;
	Sun,  8 Nov 2026 02:12:40 +0000 (UTC)
Date: Sat, 7 Nov 2026 18:12:37 -0800
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
Subject: Re: [PATCH v6 1/7] x86/sev: Add support for Alternate Injection
Message-ID: <20261108021237.GCau_alfV8je8IybOB@fat_crate.local>
References: <cover.1793926736.git.huibo.wang@amd.com>
 <53a087641c5755da7490f687652af3d07a0fafb8.1793926736.git.huibo.wang@amd.com>
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
In-Reply-To: <53a087641c5755da7490f687652af3d07a0fafb8.1793926736.git.huibo.wang@amd.com>

On Fri, Nov 06, 2026 at 01:25:27AM +0000, Melody Wang wrote:
> The Alternate Injection feature is a method to protect a SNP guest from
> malicious injection attacks. It allows the guest to control the
> interrupt injection.
> 
> When this feature is enabled, interrupts are injected with the help of
> an agent called a Secure VM Service Module (SVSM) which executes in the
> security realm of the guest and uses Restricted Injection as the sole
> method to receive interrupts from the hypervisor.
> 
> Add support for Alternate Injection.

Just commit message touch ups:

    Alternate Injection is a method to protect a SNP guest from malicious injection
    attacks by allowing the guest to control the injection.
    
    When this feature is enabled, interrupts are injected with the help of an agent
    called a Secure VM Service Module (SVSM) which executes in the security realm of
    the guest and uses Restricted Injection as the sole method to receive interrupts
    from the hypervisor.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
