Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0C345CCA;
	Sat,  3 Oct 2026 01:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990587; cv=none; b=Hcx0oYR7V7fBJCok4aCxkzUUSnypXIOT/ovWzwfA/fNvXxFFhwAMUpfD9MWudMewJGsIDkO3xe70O6KGaMte2nOPz6UEK6o5JvCGlD5Tht0ZW94Mb/d28MMCcPmH0VEM/IujB7kMCNoLmBNvZMymnl8c9tF075m1QobIybspwMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990587; c=relaxed/simple;
	bh=+p9Q6mQytjgcR51QMnlPfb/m1SiAp2HR1DJnwJW47Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl3v5xQJaE7X3rjtQOdgODRUmr+QSTgpKREADVaFEj6J2uq93R3hz0hKhropjYFG29KCDtPU70URqei9kAHkgTB7NH3U5leGLTg/p3jdOdJ8RbZw9c88bTflGs0N+dS0HV94DUGKEeDxn9wpjELgkw1nzKmeQxUB/0p191rCmqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UdFpDKGA; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UdFpDKGA"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 971E040E00E8;
	Sat,  3 Oct 2026 01:22:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wemmgeWI5XtQ; Sat,  3 Oct 2026 01:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790990566; bh=9KzItDV2rAkXWk+SjMhJ3TzfBSBZDu4VgJDrLvcdNsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdFpDKGAeuzTD4HeskeHcGflgavl4XTLm7J8FIA1hOhOm+vi7r3tYAZG811cim1WM
	 eCSXFxH2MhDZC/ncLOj+a/VCoKz9Sp7FXb0rKvWEjjddTIEfFe2IpcouAULmtQIqg9
	 LQRKP+rrrEsDxTQrotepES7nQE5dIpCjzz+Mq+7BoGaM7a9hZCt0+ZnLl5AADGlMvV
	 yYtwJajc7LOblSytV2po6s65hInm1RQ4aKbxgfb+FSX52rJx936R2PetPLWrkqm9IK
	 8L4v9QjfMQsIvEpbr1K4WzV7/McwhORMD7/l9yu77LddemIMoumHwxdotx+KcDs6al
	 QyR2w4xr1r1tJ9PsKTwk48i2R1/ePWHm8uKs8TlMhaWXZ1xDnl3I/Gz6tzrCot/3xN
	 66kQ0pnDNlxVBA75bw8EYNlEZsapSYy+kXoTvFOrCjN8RxWfq5zDH6VGtrvfr9ZSGQ
	 sUW3RmU+fHFTjaOjh7uK3y1ODJbvltMkSavFCi/PW5nQl0RWL031vNxVoDAA3ExY3C
	 6TAVrusjXZ79dzu8V7XnRO0IkYppwz1YTTEYTEsE62NiVanbHsTAyOdw5459PBl1rq
	 7YCgZBbRdgzW94f46DTPPhHSAYU0VoBGe2AYiKCEERzp9PZjZ4fNWkprbh4NK+6ZFU
	 ywT4gwTAa9PvmScaRb2MAfjo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 455B040E02A8;
	Sat,  3 Oct 2026 01:22:41 +0000 (UTC)
Date: Fri, 2 Oct 2026 18:22:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah
 models
Message-ID: <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
 <20261002113204.3358815-3-Vishal.Badole@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261002113204.3358815-3-Vishal.Badole@amd.com>

On Fri, Oct 02, 2026 at 05:02:04PM +0530, Vishal Badole wrote:
> All Family 1Ah models use the v2 register layout. Today zn_regs_v2 is
> set in each model case. This works, but a new model could forget to set
> it and read the UMC registers at the wrong offsets.
> 
> Set zn_regs_v2 once at the Family 1Ah level so it applies to all models
> uniformly, and drop the per-model assignments.
> 
> No functional change intended.
> 
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 0c0d11c72925..708fc1b4a999 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -3887,23 +3887,19 @@ static int per_family_init(struct amd64_pvt *pvt)
>  		break;
>  
>  	case 0x1A:
> +		pvt->flags.zn_regs_v2   = 1;
> +
>  		switch (pvt->model) {
>  		case 0x00 ... 0x1f:
>  			pvt->max_mcs            = 12;
> -			pvt->flags.zn_regs_v2   = 1;
> -			break;
> -		case 0x40 ... 0x4f:
		^^^^^^^^^^^^^^^^^^^

Why?

> -			pvt->flags.zn_regs_v2   = 1;
>  			break;
>  		case 0x50 ... 0x57:
>  		case 0xc0 ... 0xc7:
>  			pvt->max_mcs            = 16;
> -			pvt->flags.zn_regs_v2   = 1;
>  			break;
>  		case 0x90 ... 0x9f:
>  		case 0xa0 ... 0xaf:
>  			pvt->max_mcs            = 8;
> -			pvt->flags.zn_regs_v2   = 1;
>  			break;
>  		}
>  		break;
> -- 
> 2.34.1
> 
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
