Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E363381EAE;
	Fri, 25 Sep 2026 18:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360093; cv=none; b=iUs0Q3eAZWeSXodxhGmSRyMQvNjU/BN7kw8+W2y+caFGUF8KKbeCRSoYBJ6nZZMHEwV9d1O7fHuhV9+c+i4okzISbNlbO46J5O6WPadfK5iUS4tPc41rqP5sVRtFUddD0+Jcm/wQzMdnVpa68FfO4fv7bFScUoxKkEW9i3rzM4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360093; c=relaxed/simple;
	bh=T0/iP3TWRGPOF5W1Py9MRbbF5/cQPhBlndMNBbqX+Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptGZcKW7CtpzmwsycYVv3fyp2KAXxWF8+pXcKYDaIb6DZZU2Nj9Yl7n80d4PdrHoZGlfSCMend8hZSK8v3PLQmRXlZ9mdChprUUlpNn0aARoMrRf8m1uOJLS6bKDTYiZDmIdnWWnA1voz3CwWWGWao9PqNMlCgMmKusmkeYkvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=D3cz1gvz; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="D3cz1gvz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0B79D40E021A;
	Fri, 25 Sep 2026 18:14:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id A1AWTmgNOlZH; Fri, 25 Sep 2026 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790360078; bh=+Kox2StShoiNqUGjWBpeA9X7rNDIsJprYnDSz9puryg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3cz1gvzoqdlwhvGioVwydFmxD1foOUexm0+rGfadvUh4sBRmCNeCv94RCeVo+FNI
	 ihgRMcdwJ2zyT9kCGkk9pTPAP23UEUPkbLcPS9KBLalV8SvjNlcRgYAixZ2r2HuG3Y
	 krJNJ9vbEpD/OQnOtzY/CiUoTh3Lwh4PSccc9kV898XX7xgD6tTZD+zpuwx8M7XZu/
	 izJZ4PFLpZATpqRGCYQM+VF/7kQsKsq1tW5HeTKv2j3SiDG6ZWkIF2bjX6i460wmZp
	 FBcuInXKZhCpVBdz/upQWQcraezetDjk74hl7keiTIZFcNNgRrSqN+4T4qDRMOc62Y
	 4x2qIUhHlwwPxZBWFx4tLwFoZBIOp8I+LCwdG/YSrBjE2QxMXxK89Okz0TEeMnu6Bz
	 U++U+q2fdEcixgQyPBf59WckKeaGzCX+9tgQlj7SjfLU8+aMk8ELAZDhJEN+Pu0J9+
	 HK2JkQ8M431P3ul/XyuY1cLK70EMkFrzTKAisW8FvSjxPbIOy+WJK0ZNo9Wn/lMGcL
	 fX8KX3D3JHEwy8AurIJkdubt/zTnQIcrEnlt4V8o4mIoFQzdj8KfxS/fwkfRKljWpA
	 KJZ8kEWT4WW+sHrVksnmnBS8wGrGC8gnU4PHpAflu1rFxJ2GX7NpWKvp5nNJO0FrpJ
	 1qGqq6QdCr6cHy+EDLiPs0+w=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EC58B40E00E7;
	Fri, 25 Sep 2026 18:14:32 +0000 (UTC)
Date: Fri, 25 Sep 2026 11:14:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] EDAC/amd64: Mask UMC chip select to the four
 implemented selects
Message-ID: <20260925181429.GBara6BXp_J2rnvoOp@fat_crate.local>
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
 <20260925172639.97063-3-Vishal.Badole@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925172639.97063-3-Vishal.Badole@amd.com>

On Fri, Sep 25, 2026 at 10:56:39PM +0530, Vishal Badole wrote:
> umc_get_err_info() masks the Chip Select from MCA_SYND with 0x7, a
> leftover from Zen 1 where the architecture reserved space for up to
> eight chip selects. Only four have ever been implemented, and newer
> products document this as MCA_SYND_UMC[1:0] = Chip Select.
> 
> Since only four csrows are allocated, a syndrome with bit 2 set decodes
> to an out-of-range csrow and trips:
> 
>   EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)
> 
> Mask with 0x3 to match the four implemented chip selects.
> 
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index cab696be4f07..b69c3f51dd37 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -2802,7 +2802,7 @@ static inline void decode_bus_error(int node_id, struct mce *m)
>  static void umc_get_err_info(struct mce *m, struct err_info *err)
>  {
>  	err->channel = (m->ipid & GENMASK(31, 0)) >> 20;
> -	err->csrow = m->synd & 0x7;
> +	err->csrow = m->synd & 0x3;
>  }
>  
>  static void decode_umc_error(int node_id, struct mce *m)
> -- 

Is this ever going to change?

Do we need to track this in the per-model struct, i.e., what your patch 1 is
touching?

Is this a fix that needs to go to stable? If so, Fixes: tag and CC:stable.

If so, patches going to stable go first and need to be minimal for ease of
backporting.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
