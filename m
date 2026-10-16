Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C7572671
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171683; cv=none; b=lGkcYxHzkbuBKmwYMe3N/5jc+UnCJgqt4aneyOG7MEHdVjlekUCA1eSoSRAX8vgNpviVt9h1nGmUkYaw9J/4vU+fnHWb3bHForH/PmYlb067Mg8sRR/wmmv+YK1lMNsS+qmkPksdy7c5HXD2FnvmlK/90yogtjGGF1t6gAa5S/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171683; c=relaxed/simple;
	bh=ow5Wa+XriKWTx+xdKDO1WYIXAbNf+XTxzVoxwHVSoRA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0Yk8R4gChUGdKZBl44OPoZx8xooWWmUjhOFZQkzZd0EOt8VL5Uyull0Q77jXco/nNFKulbCkeQtfJ30ACF4CGWvDBEFnpNVIKWuaJBL92mJHfPaRrHtC7uGbk3TfRJU5us8GDhmBmCsS5RQPXzlB1aNH/faYBAPNG+luHRq69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQXGJcFR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQXGJcFR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D6B1F000C5;
	Fri, 16 Oct 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171682;
	bh=7WqrARHI6gITSJlqMvjpdrjAfDThuDj/nJr63cYnjdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IQXGJcFRVXhUEssTT34hpQbvBYbutqaOJG0zIdc/r/0pHoToA6DLxoJlTwu/bQZHR
	 W5TLmnYXJODl/+mHha0ohTFRXDwkDpMivbB+0RXM6aTKey0paDIFlvuff48Tzhr/e3
	 qp5n52HBuu6hEKHxcJwPYBCiFiECfeOOeFZoIJvSWxxOrR8w31skYuLreSZsv7p9uK
	 r/G9q8xqZMELFfyIXteWtqNqKXEqtwxu1RTBMZTNmPUiZIO9q0ajaG7JaOWj4p/7yU
	 05l0B0BfKvWvY3NckaXgIymcbLfDVu1lOTcCSWCV2b1LvEK3HZtFGJRQc4HO9V/0wy
	 epSAGoj+0LGgw==
Date: Fri, 16 Oct 2026 18:27:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Samuel
 Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cache: sifive_ccache: propagate IRQ count errors
Message-ID: <20261016182756.443ebd0f@jic23-hlaptop>
In-Reply-To: <20261015084502.3061706-1-thnkslprpt@gmail.com>
References: <20261015084502.3061706-1-thnkslprpt@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 11:45:02 +0300
Avi Weiss <thnkslprpt@gmail.com> wrote:

> platform_irq_count() returns -EPROBE_DEFER when the
> interrupt provider is not ready, but
> sifive_ccache_probe() only checks for a zero count.
> 
> -EPROBE_DEFER seems to be the only negative return
> code possible here (currently).
> 
> A negative count skips the IRQ registration loop and
> allows the probe to return success without requesting
> a deferred retry.
> 
> Return negative IRQ counts so the driver is reprobed
> when the interrupt provider becomes available.
> 
> Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> Changes in v2:
> - Combine the negative and zero IRQ count checks as suggested by Conor Dooley.
> 
> v1: https://lore.kernel.org/r/20261013095756.1084568-1-thnkslprpt@gmail.com/
> 
>  drivers/cache/sifive_ccache.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 2acb8bdf06d52..f2428f7ea373e 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -262,8 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
>  	quirks = (unsigned long)device_get_match_data(dev);
>  
>  	intr_num = platform_irq_count(pdev);
> -	if (!intr_num)
> -		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
> +	if (intr_num <= 0)
> +		return dev_err_probe(dev, intr_num ?: -ENODEV,
> +					"No interrupts property\n");

Align as (assuming local style isn't very strongly matching what you have)

		return dev_err_probe(dev, intr_num ?: -ENODEV,
				     "No interrupts property\n");

>  
>  	for (int i = 0; i < intr_num; i++) {
>  		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))
> 
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053

