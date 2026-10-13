Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0A51FCDD;
	Tue, 13 Oct 2026 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910226; cv=none; b=olFnjCjvvnVRgbKg6EKb4PRFQU34eml9xoe3oq0A43nGh3IBmZcKZyLTHt6Qix2xwqrzvlJlPbQF2S0BOZ8jOjY3QBJzuUjys3WARrrw0aL+lWJBWWM/Xi4ndK+x2F+Nu2gu35XSEwvYN/HaphZFdLIq7YIPhQLuDHmPoQNxKRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910226; c=relaxed/simple;
	bh=/lYplHdq3xWTb81t8/N0Bo8BBdDh5vWAuANi0GAaWz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCL/rW4tjfdc7iRYagkXOpIoo+A/KG8q04wFYJZLxxRanQRuhjS1tPDHQLefFZlsE0BwxyA0e+XSzbzgAX308YfoHCcvob+otw+jC79/82luEc98VmiI7JnZDVrMdrqmhPxe9Bq9029QFF5u4jttoGZs5y9UoAtbMziyTTXY6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ykdjr2IJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ykdjr2IJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69661F000FF;
	Tue, 13 Oct 2026 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910225;
	bh=5tj3tf7AZ1i5KFO69CyARfpXilj9EC0fq+TYKANGurE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ykdjr2IJL2wc+gHvAMfVn8CkXgW60VucB6bBksAy7d+YQzUnclHbOXdwndRyuYIEh
	 //vgZ6c6zTrksUq9aH6qY8jKv0U9xh1HnasTICXvrhmA4YzICzF5r2ta8M2QYfjIyD
	 rREqXkE3kZ1fJmlA0fPJFHeW2TS9Y/L7lrcA7NGgkFBy5U9fGyeBoIRYu/M2/q0/Gh
	 gZT10ij+suCgszEqLocYkbX4yIFFnY0XCd2piqD+7GcBpNk4R5JvY9TKvfG/GXOskr
	 DD6AMX0jMx+e3yRUhDQ+8KCwPktHPZ/91/k3ZOD51GDWJ4EDyIjMzIqE72auvM83GE
	 ITAdPW5Q0tRxg==
Date: Tue, 13 Oct 2026 17:50:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Helge Deller <deller@gmx.de>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the fbdev tree with the mm tree
Message-ID: <as5hGf0IS-LccM0_@gremlin>
References: <as5bwyKpGQaBZ3CO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5bwyKpGQaBZ3CO@sirena.org.uk>

On Tue, Oct 13, 2026 at 05:26:43PM +0100, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the fbdev tree got a conflict in:
>
>   drivers/video/fbdev/ssd1307fb.c
>
> between commit:
>
>   d4488917e79c7 ("fbdev: defio: assert FBINFO_VIRTFB, drop VM_IO, add VM_MIXEDMAP")
>
> from the mm tree and commit:
>
>   81ae1f9a6c850 ("fbdev: ssd1307fb: check for fb_deferred_io_init() error")

Wow a conflict between two of my patches I have literally no excuses here :))

> diff --cc drivers/video/fbdev/ssd1307fb.c
> index db61d710fccb0,8fd96c37ee1ab..0000000000000
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@@ -767,9 -767,11 +767,13 @@@ static int ssd1307fb_probe(struct i2c_c
>   	info->fix.smem_start = __pa(vmem);
>   	info->fix.smem_len = vmem_size;
>
>  +	info->flags = FBINFO_VIRTFB;
>  +
> - 	fb_deferred_io_init(info);
> + 	ret = fb_deferred_io_init(info);
> + 	if (ret) {
> + 		dev_err(dev, "failed to init fb deferred io: %d\n", ret);
> + 		goto fb_defio_error;
> + 	}
>
>   	i2c_set_clientdata(client, info);
>

LGTM thanks :)

--
Cheers, Lorenzo
