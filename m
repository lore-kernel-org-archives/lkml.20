Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724ED191F94;
	Wed, 16 Sep 2026 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521507; cv=none; b=A2eRnrItS5bbNfPOzSyRCflE/Dmx1O8wZesaiKOXwYiN3Kl1lU0p6XAB298HtTsjfMqpyfRe2ehYtxIg/KLfqfG9ERpy5gT02GmXkGBn9L6RNpZtfeWJs0YWR+3T4MkGPknvUNoISFydK4Xe5OlvlOIWA+5W809+ZBjbkkHO3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521507; c=relaxed/simple;
	bh=zc7RH1zvK7DxsZHRcK819aOpN+r9eYS1QEMHVRbDISE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZU966V3FpDgTonkzanN/kNKHhn5WiF5Xm2LtyaC1B90/tzKJhg8nvCCaf5ug5aeMGkouYuDfOpMoShVYLxqQCp9qP0XqmckCRJok2a5JXBGY/EfJxRvMlMNNVClGNNU0stN94PZTtm0wThxQ0AQy76JIxBRFXG/1mwUV+nTG/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=EMNqwIZl; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="EMNqwIZl"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4D05640E015D;
	Wed, 16 Sep 2026 01:18:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TVCXJmw8wTNw; Wed, 16 Sep 2026 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789521493; bh=W4F5CODcn9HDMZZcJGVf8rHNXA2iuN0v+ulwsKFXy8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMNqwIZl2Vh+YkJlClXpSfyITFUI0KOq0H1wpiAZ1wuh2fjjaRsk0naJrl/oMLZic
	 wb6ZmsCCTJhgG4dXKYsFdwETBL/UuCCdcob89xYPZFtGSVv7JTc2Tj+EVYaCmIDEGd
	 WLhaXh6P1iZCv4JpV0D15dz7tG1S+vvWsB6VP89DBFHq4/Cri/XzPCEZpQQ4Vqn2k5
	 pD3gx7pMfiAGSI93ezLoxxvM+ifoppJG02eGf9sXmMrbG4RmedOgEBSHQGyfb1vopg
	 yUbt5BlGOykMmLm0TxalX9JcTBxWETU0sajbrCtFO3ouOwvbE3Dm6Egwq+Q/fNeIAm
	 KCZKoejzvxHpq18cSpAbo1MEMFKoYycrXZ0uWtObDy1noS4Jubk3wX1b4PeitRH/Uo
	 XuoHf2jhMkgvP+e1pLKPgzDqwDfc/E2wsy0e7KLp+1pvq1i0BERFyeFUbxP3ohjJHa
	 pmy5V9jdASnq0yjINiCmJAuioGyn5zSy4LGMTzAqP55e5VBr0rBC7c88aWiuMMUi9A
	 P1LvCCz4a1VMprgNuh6XC+lYGlfsau9uCq5dgQPQyUSRQqdIrPgYZZ71U3P5mUw4UP
	 7LAesVMagouDS0txSnGD7LJYWFm7JWbIEmXxgazuQz5o0x/D6i6mt0rClg82E65jWf
	 jvVjhBcr3u8uuS1/FaIkVPUU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C4F9F40E00B9;
	Wed, 16 Sep 2026 01:18:08 +0000 (UTC)
Date: Tue, 15 Sep 2026 18:18:05 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tony Luck <tony.luck@intel.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] EDAC/x38: Balance PCI device enablement
Message-ID: <20260916011805.GGaqnuTQRwdIWxkPZd@fat_crate.local>
References: <20260915015519.83833-1-mhun512@gmail.com>
 <20260915015519.83833-4-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915015519.83833-4-mhun512@gmail.com>

This one looks old too.

On Mon, Sep 14, 2026 at 09:55:19PM -0400, Myeonghun Pak wrote:
> x38_init_one() leaves the PCI enable reference held when probing fails
> and when the controller is removed. Disable the device on probe failure
> and after removing the EDAC controller. Keep explicit cleanup because
> module initialization can call x38_init_one() outside PCI driver binding.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
> 
> Fixes: df8bc08c192f ("edac x38: new MC driver module")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/edac/x38_edac.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/edac/x38_edac.c b/drivers/edac/x38_edac.c
> --- a/drivers/edac/x38_edac.c
> +++ b/drivers/edac/x38_edac.c
> @@ -423,6 +423,8 @@ static int x38_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return -EIO;
>  
>  	rc = x38_probe1(pdev, ent->driver_data);
> +	if (rc)
> +		pci_disable_device(pdev);
>  	if (!mci_pdev)
>  		mci_pdev = pci_dev_get(pdev);
>  
> @@ -439,9 +441,11 @@ static void x38_remove_one(struct pci_dev *pdev)
>  	if (!mci)
>  		return;
>  
>  	iounmap(mci->pvt_info);
>  
>  	edac_mc_free(mci);
> +
> +	pci_disable_device(pdev);
>  }
>  
>  static const struct pci_device_id x38_pci_tbl[] = {
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
