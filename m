Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0779D3955EA;
	Fri, 25 Sep 2026 04:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310751; cv=none; b=hhcTuAeSIvVB3sYN7ylzJ7EpCGZJjuufbtQF75HDvrU7abCc96BMslfCTPioox1F7/qvPR8zupp39Sg01QnihO/2ssk1dAEzcZ6cDB5vCIzT3UUjUtkvDhhwVshREkCRu0tkMYT3uq4YZkj8+SNnJFUTU+WAToZMlz0TMDaE1jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310751; c=relaxed/simple;
	bh=OWHKwS3XzaFy9lR/g+z7CKm0pRLSq0uQNVCvrhw2Dgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onlbcu12Jhnbrk8x+lL3YAJVtEZo2mx+yDDEhnY9uzp5cFo28QVnLmkiF3Y9UIA3t4RI8DTYha2gRlRnrVyrCIX1SinN+sIelTyTOWXc97g6tHpiRTu4uRHbp155/EDHEx067nUqKp74cYngrAcNMcsguVKT4z6asfvLEP1SCw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=U/1uqBwG; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="U/1uqBwG"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 18E9140E021A;
	Fri, 25 Sep 2026 04:32:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tArC7ubeFXrH; Fri, 25 Sep 2026 04:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790310735; bh=DjhoGNA2O1aRflBp2Dg/Dl55MeMqHjjzEjzOIAUCNfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/1uqBwGiYNXlK+yuYF9FMp/tl/YdJk/u1ZwboDiQDGPfOTwqZrsIz/GWOPK7xcrQ
	 uzXNT46+k9VfaWQ4naQXSUzQYHX9SypuazlE8fHEZgODMs+ecg8v6cj94BmJxWvKH9
	 LPmDz+LugIghOSW7gjvAwe/fKAAOBppPrnt1x4w5haIQJIaWMkigY+tkOupyMwZs/M
	 1WSVV24dYuB+f8F9Pi+92CZrxS+8aFmn3NyHe/+8lV5DiPa0l9UlBNJO94vkJzGrcl
	 GSImmY0hhITr1R5RttnCRHOkpDnf59EOmZQ5UCW/7T9F0kVEFcQ5Z9kr5N3B36LKp2
	 JRmZCNk+D0Nf/Ul8ZsftsjXjLCPm2sde6R89wl5RQJ2WeF3Q1D7Q2Ho+nIg2pVSa2K
	 x6d1bH1LdVqfPJivrY9rXu5lsluKuKX0A8Euiv8aAqfo7FoY+FEOuVTJzLFRcm+b51
	 ohvIN66uBQa9ByDyhQc9f5eshwsSn3gR1j921/+4Olh/D5fwOWBzxFmniZ1RhsGVFb
	 9XviPBW9rZJ33pWNI43avx/wrP1hlNSAky/l9YTrKd6oRj69XXWKHK5GjLkg2UaUV2
	 vMRu4cEpkRMZpNWmVvoUVw+h22aJNVZN4OZpzsap+gEPvIuabK9uybNfKAcyoYG+cF
	 Qcsv2MKIEzfSyIDaVUNcPrz4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A1B2840E00E7;
	Fri, 25 Sep 2026 04:32:09 +0000 (UTC)
Date: Thu, 24 Sep 2026 21:32:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	rounakdas2025@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 0/4] EDAC/altera: Address sashiko reviews part 1(v5)
Message-ID: <20260925043207.GDarX5R3gCCkEjS323@fat_crate.local>
References: <20260911120627.2634225-1-dinguyen@kernel.org>
 <b71909f6-4192-46db-b974-e6b24d097821@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b71909f6-4192-46db-b974-e6b24d097821@kernel.org>

On Thu, Sep 24, 2026 at 09:48:47AM -0500, Dinh Nguyen wrote:
> Ping on this series. Just wondering if there any comments for this series?
> From Boris's comments on V2[1], I thought the series is ready.

They're on the todo list.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
