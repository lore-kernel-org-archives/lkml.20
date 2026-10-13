Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15B03F20EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899411; cv=none; b=bg9nV/9gzuUqoYuk0EdzPJh2vj8otgDrA8RltCQb0yBC6LHWSnq3Bb8Wsv37w2sKBkAYnN/FHn2qdbf3PlSV3+NN+oKrcjGEB8MZB+7fDosqhJR668Ojlt5buTGD61ZiG0qZ5YLYzDolZ7TGm2kpZQ5Fu4CjCUSr/U/ati/1vBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899411; c=relaxed/simple;
	bh=u2R4FX3sAaS8bNjFmpo/yIP900gduD1Adg8MdK0PCmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSNZUfRau7s86jcFXh4cgZcrxjdENhz5hf6nXV8wjtdfifnCN30M/MFxVoX7dnoXlhUf3W/Dw/vB/Ukyk4Ym2DjY6A04OgKVlvaIv+69LIC1L33gvTpkocIHz/W1jvfDauyy+kzUd9WVj6zKUlZV9z74bPsvJjIoxXaRivJq7js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eGMNFbX4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eGMNFbX4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0BB1F000FF;
	Tue, 13 Oct 2026 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791899410;
	bh=3eVggJ7yHFgpFKsfcgizT1UKfTovdZjYdBw/AnJqqcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eGMNFbX4F3Hbx7SeI/Lx1lm3LWxtHOfC7/QNY5shYjLkTBJ4aIK7N2JriRLB8qo9h
	 o023BXK/IEvuzw/twwVk8q7GaHbf6bgy/z03yvzGsoP46du/0hb153LcSK60YY5HnO
	 Ash1Wlmn7KSaP93ydg7MaDfyy/NJENqiha8FqAfA=
Date: Tue, 13 Oct 2026 15:50:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Zi <2959243019@qq.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] comedi: addi_apci_3xxx: fix subdevice count
 underallocation
Message-ID: <2026101308-unified-catwalk-f818@gregkh>
References: <tencent_BC89ED84AE795F9D75CCF0A65E679B78490A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_BC89ED84AE795F9D75CCF0A65E679B78490A@qq.com>

On Tue, Aug 25, 2026 at 05:07:54PM +0800, Yang Zi wrote:
> In apci3xxx_auto_attach(), the number of subdevices is computed with
> 
>     n_subdevices = (board->ai_n_chan ? 0 : 1) + board->has_ao + ...
> 
> The ternary is inverted: when the board has analog input channels
> (ai_n_chan != 0), it counts 0 instead of 1, so the AI subdevice that is
> actually created is not accounted for. As a result
> comedi_alloc_subdevices() allocates one entry too few, and the later
> subdevice initialization (notably the TTL Digital I/O subdevice, which
> is populated last) writes past the end of the allocated array, causing a
> slab out-of-bounds write.
> 
> Flip the ternary to count 1 when ai_n_chan is non-zero and 0 otherwise,
> matching the subdevice creation order in the function.
> 
> Signed-off-by: Yang Zi <2959243019@qq.com>
> ---
> diff --git a/drivers/comedi/drivers/addi_apci_3xxx.c b/drivers/comedi/drivers/addi_apci_3xxx.c
> index 695cce103177..1dcda82d9503 100644
> --- a/drivers/comedi/drivers/addi_apci_3xxx.c
> +++ b/drivers/comedi/drivers/addi_apci_3xxx.c
> @@ -787,7 +787,7 @@ static int apci3xxx_auto_attach(struct comedi_device *dev,
>              dev->irq = pcidev->irq;
>      }
>  
> -    n_subdevices = (board->ai_n_chan ? 0 : 1) + board->has_ao +
> +    n_subdevices = (board->ai_n_chan ? 1 : 0) + board->has_ao +
>                 board->has_dig_in + board->has_dig_out +
>                 board->has_ttl_io;
>      ret = comedi_alloc_subdevices(dev, n_subdevices);
> 
> 

This is corrupted and can not be applied :(
