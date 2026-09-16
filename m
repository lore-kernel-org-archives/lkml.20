Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F738DC54;
	Wed, 16 Sep 2026 01:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521377; cv=none; b=LJTMbmdtfKOHjgDnwSVGaKfVK5Xg7gkSTGY1odqtHwIgQHO4//z2TOFYSis/ZgQrY3S8/slRgzFaHHuR+TE6mrfc4jagfsSg0v6Uat06s9RPniXXArNIAPmTApZXq1zLI1NC1EFqSru5yqkQsY0JJAxaamNKvt9aRRBEFji+/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521377; c=relaxed/simple;
	bh=eqpBxNU8Ius92kICsQj2YqJMIyVa2WwELJHaC16Kqpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J07njbDwKl2CH9hToeJrVYTrekW/CJku5lvdI9qequ9VZSSMqaolLQkkq0vYPrmq1DijoqTAu/obeKsBfbbS8IQliqJfDh7qVTSA1PY0oH8/NMKc0eNtKxw8LwFUQCwnpPSc9YA5a9NprTsAuMXXqtUZ7erinSTJ6yJLbKPkHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Pj87w/DC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Pj87w/DC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6545640E022C;
	Wed, 16 Sep 2026 01:16:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7XPMAUDEShyi; Wed, 16 Sep 2026 01:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789521363; bh=SsdBHblK5l1oRFqEDyoW0NhT6WrfY63z/0Q4gh7b4a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj87w/DCejhyPRo4P/q7qubCzhkiekN8wqKBTNHnjsfS1HGVN4W9cKj6JOc0YCr9T
	 Q4ZATmp8tPr2SffGPWsA6OW4ytFBVNKZMVE7Fei5OguB3zPESb+MEy/EYxWdJ+FL20
	 c2nciE8HPXHkkhmmK2yDSxmLwm8TwAdgZyQ+Tf3sSxBm2LwjefeFBbBWqjZBWOgkzA
	 UbgwG55RiLTGhVZFn2Jqlpnx1lNG78lgBXffkRg9h5aqGBVBfRsUAqfAgpuso+aV3Q
	 RgQh4R/k5R7lS/Ab8DhEj66U7R4tYj173qDpWvGsu5tcL0VY1NI0p2Va18mfKkqs/P
	 z+ZtAbCnQ+Mbt7fv8kWnJBj5YlU3rAMh16bFrI7jUIa/f2tz0C3yl0Hml+sTxZVwEG
	 NCEaAxv4nxvOycPvKx2uAJfqU22fdv0RzZqjCJVAn9BT6lpUXtQIel/L7FTXMDyRTu
	 +IgLt/44STBEyW7qtq9vTBpwwvhbYSIa2ITf5D/kpBMMDfHnwJTqn7IRmZ2xH/97Lu
	 cR/9dcnvPsosXpW6p8jYAQHh6uYAqhabSNwCAmCJcp20k5mdBsoUvaZub48M9C3FP+
	 rpS8z++9L9YxknuYCCJd8Yw0VYNUfJ/F2OhwogK+qiQJYgMYJeSh11Djsf610aJIjE
	 ShxWPGQER0KbQiX6yWH7QP/Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 061CE40E00B9;
	Wed, 16 Sep 2026 01:15:58 +0000 (UTC)
Date: Tue, 15 Sep 2026 18:15:56 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tony Luck <tony.luck@intel.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] EDAC/i3000: Balance PCI device enablement
Message-ID: <20260916011556.GFaqntzIQ3jyowHNld@fat_crate.local>
References: <20260915015519.83833-1-mhun512@gmail.com>
 <20260915015519.83833-3-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915015519.83833-3-mhun512@gmail.com>

Tony,

I have recently started marking obsolete EDAC drivers as orphaned because,
well, they don't deserve the effort.

How about this one?

On Mon, Sep 14, 2026 at 09:55:18PM -0400, Myeonghun Pak wrote:
> i3000_init_one() leaves the PCI enable reference held when probing fails
> and when the controller is removed. Disable the device on probe failure
> and after removing the EDAC controller. Keep explicit cleanup because
> module initialization can call i3000_init_one() outside PCI driver binding.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
> 
> Fixes: 535c6a53035d ("drivers/edac: new inte 30x0 MC driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/edac/i3000_edac.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/edac/i3000_edac.c b/drivers/edac/i3000_edac.c
> --- a/drivers/edac/i3000_edac.c
> +++ b/drivers/edac/i3000_edac.c
> @@ -461,6 +461,8 @@ static int i3000_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return -EIO;
>  
>  	rc = i3000_probe1(pdev, ent->driver_data);
> +	if (rc)
> +		pci_disable_device(pdev);
>  	if (!mci_pdev)
>  		mci_pdev = pci_dev_get(pdev);
>  
> @@ -480,7 +482,9 @@ static void i3000_remove_one(struct pci_dev *pdev)
>  	if (!mci)
>  		return;
>  
>  	edac_mc_free(mci);
> +
> +	pci_disable_device(pdev);
>  }
>  
>  static const struct pci_device_id i3000_pci_tbl[] = {

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
