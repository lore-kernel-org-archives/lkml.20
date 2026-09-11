Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D804351C11;
	Fri, 11 Sep 2026 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103187; cv=none; b=Kf0wWxIzg6uE0MSg0QrKqqqa7klL7LBSMLOE1MZdW91n5+vBqJVJ23EuJRuPaJ4pP+3Kc0ebD1MkL/DICPP+95cSfVrd72oVJgKbEu02KKGY2om/VP0clH6SDL4xTXqssOqawD8jpoJ8O6j2G/Z1TC7rF1ech8r/v5QFyy0/rK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103187; c=relaxed/simple;
	bh=QVwQJOvopVnEBi8HHPiWiWXdI9UJ3ihun7Qms28PClQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiERPZox7a3J8n02L3qnlscnjWunT2f2eNWeEnDv47Gqe8P6r5x6RqjAzxQa6zR1CkqQU3r71aIYh7iiWenxMm5wzG0TaS1bkpvdBz1N95yKwx5DTxIy0YwOMl50J65DsdscDRCgBhf87xTV3ZZQyG3W89ATpAYCZefUyn8WUp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iZDW4CGw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iZDW4CGw"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4C5E840E00B8;
	Fri, 11 Sep 2026 05:06:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8XT6gdm_47I9; Fri, 11 Sep 2026 05:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789103172; bh=pFWDcLo7aaAOsORJ8pK3IpkqmFvZ5y2tx+BAIwqqmAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZDW4CGwFPkxMYWZrE5mze5AcnqyrtTb/raFWEf6GAdjEmFHm/9dhmLjvpPuyALoY
	 nfSo45Xq1COD2lZQZsiJcS6QeM77ydnHtPn+4I0JsDig2vCno1yazJ08nZ8tHFnuF1
	 EumwL2LK2oOKM8dYGFcqmJFiINWi5K7a8/ijgFRIea042gEeORUQwa+7p5WxZDqTtz
	 ulFcXlJXL/ZbJkD5ex/BktcZ99mGSM8J+Mik8byWXnbPtxh0QD5R1Y70FCeU6cXTsA
	 XWnybA9ViAjHlsP+djurcCT7ZrKZim3qQGvpKf6bC2zFSWdI6/Im2aohZY8ExIUKfI
	 FSVZ4uzXuCqxNvxiwAd5D9uYgfZGAjH8JNVhdeGbUBUI6tOrqdvjHqL3fR1+91USvG
	 ptr+lUZxxt31bdZoHDf2Pi6mYgBqa2H+uVTGthOwnMUNDQpTcnfKf7p7mNyaKbNomc
	 dWlwxh3ubvnODmh1ajIk5dmoJ/2KjVJLCGVcItyMFiTd/2MnSmQ0ioEXUDQ61zv8NQ
	 H5kw94JegLpJ2bGe54I0FMQaxB1GD4ZwSCXaX6lZauClVpKOs9wYIvq+rGf/nXyKna
	 Q9sB8X1V1yXx0ZiSHBWVliJspJENuhy5YOe/xrBy+oyKBEp31sgY7IprnMWhOwOAEr
	 AyjrUc0ASP7lqvsZOt3ioOx8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 39FA240E00B9;
	Fri, 11 Sep 2026 05:06:06 +0000 (UTC)
Date: Thu, 10 Sep 2026 22:06:02 -0700
From: Borislav Petkov <bp@alien8.de>
To: kensanya@163.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, TanZheng <tanzheng@kylinos.cn>
Subject: Re: [PATCH] EDAC/ghes: reset DMI scan state after registration
 failure
Message-ID: <20260911050602.GDaqOMOniLk1fqaW-e@fat_crate.local>
References: <20260909071934.314577-1-kensanya@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909071934.314577-1-kensanya@163.com>

On Wed, Sep 09, 2026 at 03:19:34PM +0800, kensanya@163.com wrote:
> From: TanZheng <tanzheng@kylinos.cn>
> 
> ghes_scan_system() sets system_scanned after the DMI walk. The unlock
> path always kfree()s ghes_hw.dimms but left system_scanned and
> num_dimms set, so a later ghes_edac_register() skipped the scan and
> indexed a NULL dimms array.
> 
> Clear the scan flag (and num_dimms) in that shared unlock path when a
> scan actually ran. The next register() will walk DMI again.
> 
> Signed-off-by: TanZheng <tanzheng@kylinos.cn>
> ---
>  drivers/edac/ghes_edac.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
> index d80c88818691..b0630f1a2815 100644
> --- a/drivers/edac/ghes_edac.c
> +++ b/drivers/edac/ghes_edac.c
> @@ -499,6 +499,10 @@ static int ghes_edac_register(struct device *dev)
>  	/* Not needed anymore */
>  	kfree(ghes_hw.dimms);
>  	ghes_hw.dimms = NULL;
> +	if (system_scanned) {
> +		system_scanned = false;
> +		ghes_hw.num_dimms = 0;
> +	}
>  
>  	mutex_unlock(&ghes_reg_mutex);
>  
> -- 

That's not the right fix. On unlock, it returns an error which the caller
should check and then unwind by calling ghes_edac_unregister() on the already
successfully registered instances.

But I don't have the necessary hardware to test it on and if you don't have it
either, don't bother fixing it. Might as well obsolete this driver too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
