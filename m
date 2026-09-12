Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1572AD3C;
	Sat, 12 Sep 2026 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192959; cv=none; b=AxnA3NND/3ipnZ3v+Fja9MC4hSxjL+zfvPzlICfOKr6pb09WbfB0d6jG43rQ2NKAB7IAtCxUM+kZDF9kf3Vc1G27rQ6irfYIBMLGFTEcWZ3Po9uD2r475odZ9Svy9Xn5Ix5ce4H9KoK03WUCOnvaxUvrgHiwC05cWr9CF/fVAk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192959; c=relaxed/simple;
	bh=5gLjyyM4G900QAKhjPkQFtRkNeaXWMtmoQI163YSpek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcHBRz5uAOkN0EMGwCTDjhVSlIhgsElMVLOyy+FxKzXHIrgQ0/9HjTaBY2LJhLddrtnj6bns8asWS2F1dBAKa4BcOiimxsG3N/Jit97zKEXWZ9+VTH5ESsvHb98pYc5N0TY8LVWPwdCt/MUtzsC5Ye2I8zSHLGmDgLTSrD0M330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Y4N+D4j1; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Y4N+D4j1"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5DBD540E00E8;
	Sat, 12 Sep 2026 06:02:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JbJRULlAKaRJ; Sat, 12 Sep 2026 06:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789192934; bh=vCcat0/oImBmwSaV0rtau+d25lxPnhEctueRjHdO8d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4N+D4j159xcdGfuYfIfnrSQAtZ79Js2B+F8ucOMjUtY2oTQM1NPZtzCxaFvasgr6
	 upHy024f+YUOGou/NibGnj1U0EvWRDnEX8ujyzHwCwwCboqMU/uYsY34BMmPS8DHv/
	 3084vI37nkmflB95ugxmMuRrJ9z5pySjNotSYGpX+iNUyi6l8iJ2Cw8xKAKZR9rn2o
	 DKVafsUMNULaRnHOcvNkCVo2jkmMtTZ5Z8YZ28jRpBMQHZbMqLWCjnrIWHqKgoE9fS
	 fi00YPLy8V0pIJUCmmism7jqIhUJ2ksy9JoN+Wov49Iis8pEhbxap8Rcfdlk8hzZep
	 vIAcjNWFp+/G4DZXVo2zL2RE1Plqhzorv3fi3OEa8kCuI4ldVIE/4rS3kooRo5qNpp
	 Zg1LBEUsc4OHc72CIOlEMj/32elSbau3F9cGu5hOPbGAsQgLak+yuIVKKBVAjlQ4EM
	 vUF9uttmrceKtoYxSBf1baYzdEw65y7uY7djIUbsRn3O7w71uoL+QybonGIO8uimXk
	 ephKNhWFi95dOujF3IHy6yN1WRcQnh1B2yzbgRwec0p08JTrcNf3AMfhUlXk8hPlqO
	 4DHzaD/BzB/PYaZl4MD2BV1uNMctDMLMaN9a+ONNymCbkSBDowViaVGVgWBYvneJHP
	 rEZpaYAujEGnlBoSa0pql6/c=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 93E5240E00B8;
	Sat, 12 Sep 2026 06:02:06 +0000 (UTC)
Date: Fri, 11 Sep 2026 23:02:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Shravan Kumar Ramani <shravankr@nvidia.com>,
	David Thompson <davthompson@nvidia.com>,
	Tony Luck <tony.luck@intel.com>,
	Zhao Qunqin <zhaoqunqin@loongson.cn>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] edac: use named initializers for acpi_device_id
Message-ID: <20260912060203.GCaqTq2wnz-tV6vPIl@fat_crate.local>
References: <20260904-acpi-edac-v1-1-ef93d60bbda4@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-acpi-edac-v1-1-ef93d60bbda4@thegoodpenguin.co.uk>

On Fri, Sep 04, 2026 at 03:41:43PM +0100, Pawel Zalewski wrote:
> Use a named initializer for the acpi_device_id fields which
> makes the code more readable and consistent with how lists
> are initialized in the rest of the kernel code base. Also
> drop explicitly setting fields to 0 where it is redundant.
> 
> While we are at it - unify the list terminator to have
> a single space between the brackets and no trailing
> comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
> This series is converting lists that contain the acpi_device_id
> struct, which is defined in the include/linux/device-id/acpi.h
> to make use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated
> with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (as most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
> 
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers (this series)
> - actual implementations that make some of the modules use the new driver_data_ptr
> 
> That way the task can be fragmented into manageable and independent
> chunks of work and makes this effort easier to review.
> 
> Tested builds on a64 in Yocto using 7.3-rc1.
> 
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> ---
>  drivers/edac/bluefield_edac.c | 4 ++--
>  drivers/edac/loongson_edac.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
