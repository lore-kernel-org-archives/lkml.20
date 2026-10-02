Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450073B14A3;
	Fri,  2 Oct 2026 21:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977258; cv=none; b=mK8oUN8x2g2TMYV2FaFY0nBPGtsM/LEYeo94RMv2padsX4GqWM0Iupvtj4ny9rqzY6IQ46NqWefa+1+TsjxrKuKHnbpIQF4MFcbNqdbTkudxwmDCX2Vd3paAILRER98eYYWZ4K98aZw99lFlcHjFbDribufdrSeefA7Vl+hM3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977258; c=relaxed/simple;
	bh=NAkFTmvg730AgZlNr86bUkFUfLNOFFvtU++kj9V10Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEFRafKdgLT9U3BX4NC5Iu3XTe3+SJBeUBJIX5oMz6wcTUxXG7XiFEafshyWqLirAR0/hcTgYK/sh+RpjyftueIUWR6cKlLgOVoGBnjdcQ+SHkrJSPlgmmawbsOoX849BbHMa55GK1jgttCeMPVP2oHrxnXCMibwwdz9uzAZfzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePxE/Tg+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePxE/Tg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0F41F000FF;
	Fri,  2 Oct 2026 21:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977256;
	bh=u0hCgW0Qhfb91gOeAiXaNjAVp+70LZr8J+/P9EJFUMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ePxE/Tg+Fzuv07ZN6rpry3Zt7vERvAfPUD8I+x3AwCijqQkzZSymhBX9ZZ973ANG4
	 clPT1IPgBxBGlMYTfEMFjKEKHTfJzTqIOxDY7SVc+L0U19bYDgXS/KwjG6R612LRP/
	 3fB/iYMRB1zQZJGsmgvmGFVlGX18EUvW2yV5b8mxn67HE+MYyCacV7vBczY/65hkTq
	 i9IIoPaELau/5J5yKLIrzeuxsNZZivQed5/WhZWpyN2uljD/ONvhPAkLn6vLinLa2r
	 PqPZIMHPwr1C9/Yy0G5U5pQEqj/sh4HZkDw470xBswOBKpQW/bfAbRXouz5F5DOah0
	 t2PLoxDQcVk4Q==
Message-ID: <7b0146ca-956a-4075-8577-10c96f881fe5@kernel.org>
Date: Fri, 2 Oct 2026 16:40:55 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/altera: Refactor exit paths in altr_portb_setup()
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>, Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001171556.57548-1-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261001171556.57548-1-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/1/26 12:15, Rounak Das wrote:
> altr_portb_setup() has a single caller, socfpga_init_sdmmc_ecc(), which
> looks up the same SDMMC ECC node and holds a reference to it across the
> call. Pass that node in instead of looking it up a second time. This makes
> altr_portb_setup() lose its lookup and its of_node_put() calls. The caller
> drops its reference at every path.
> 
> Convert the remaining unwinding to one goto label per resource. Each
> exit path undid its own acquisitions by hand, so commit 7d5a36a5490d
> ("EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup")
> had to add the same of_node_put() calls to four of them.
> 
> While at it, replace the two comments on the PortB IRQ index with one
> that describes the interrupt layout, and select the index with a
> ternary.
> 
> A devres_open_group() failure now also prints the common error
> message. No other functional change intended.
> 
> Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
> Link: https://lore.kernel.org/all/20260926185955.GAargWKzpAwXXC4CQW@fat_crate.local/
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
>   drivers/edac/altera_edac.c | 45 ++++++++++++++------------------------
>   1 file changed, 16 insertions(+), 29 deletions(-)
>
Very nice, this looks good to me!

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
