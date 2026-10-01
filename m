Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B051A49E158
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856513; cv=none; b=t2tMx1jkYlqj9XYGJo25eJNqS2zG/ZtAUvnptps19ytx3biJqTL01AuO2FQmLQVo/mVjlXt+HcU6yAwoEOoUv/mFGpOdZ3un5DmIQo5AHOPA6H3EV0mSujokQs1pSvYkt+z7bW4z7VtEJ7H+pWAwbYrH1IBXZ8GlWgDTkTkqI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856513; c=relaxed/simple;
	bh=BrGH7rIDnKZt6Y1BGgON0pI2UXD2F4TkSAkhxOWpFqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l++Nmmv/KvGj8fGsaVfqVMmUMfdmb3PosMOosETFI6kNPY5dHUZfKo6OsoXM64S3yoye+Y6Wo6LZJ5DDS4Jr2s4iRmiHqVc77bJMeHvsAnf0yGsoFgCAP2aehFw9QqMaL8yXxaYa4P2UYho3lwpSl4lEB72Z3VWgYZuXJWR0ix4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a9j1X/Cl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a9j1X/Cl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5811F0089B;
	Thu,  1 Oct 2026 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856503;
	bh=1XACw2Nc9lDx8AyNuYRd9faYtqxrW2gPBJHTlSfCjH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9j1X/ClAjVfniR4HNSxS8lnVRvGCwte+cHdo9u0vKvYIK9KpGAWKv94frlh/I1cs
	 ahGs570mfJTRc0/Vgdz557DDJQ9mg6qtXwE4ZjjVCcEXbNEDSOnU3TFxGrcXUyXggg
	 +qtgTEgHHnQ6Duq53t7lVjiEvJ2jSW2f/U7cMsNM=
Date: Thu, 1 Oct 2026 14:03:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manush Prajwal <manushprajwal555@gmail.com>
Cc: arnd@arndb.de, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] misc: eeprom: idt_89hpesx: fix fwnode leak in
 idt_get_fw_data()
Message-ID: <2026100150-plasma-pointing-052b@gregkh>
References: <6a8b286b.c86fb4cb.27e0b8.ee64@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8b286b.c86fb4cb.27e0b8.ee64@mx.google.com>

On Sun, Aug 23, 2026 at 10:35:46PM +0530, Manush Prajwal wrote:
> device_for_each_child_node() takes a reference on each fwnode it
> returns, which the loop body must release before it stops iterating.
> When idt_ee_match_id() finds a matching EEPROM child, the loop breaks
> out immediately without calling fwnode_handle_put() on that fwnode,
> leaking the reference.
> 
> Rework the loop around device_for_each_child_node_scoped() instead of
> adding a manual fwnode_handle_put(), so the reference is released
> automatically on every exit path (the early break as well as normal
> loop completion), per Markus Elfring's review of v1.
> 
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
> v2: Use device_for_each_child_node_scoped() instead of a manual
>     fwnode_handle_put() before the break, and use my full name in
>     Signed-off-by, per Markus Elfring's review.
> 
>  drivers/misc/eeprom/idt_89hpesx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
> index e056d2dea..a1b2c3d4e 100644
> --- a/drivers/misc/eeprom/idt_89hpesx.c
> +++ b/drivers/misc/eeprom/idt_89hpesx.c
> @@ -1080,7 +1080,7 @@ static void idt_get_fw_data(struct idt_89hpesx_dev *pdev)
>  	struct device *dev = &pdev->client->dev;
>  	struct fwnode_handle *fwnode;
> 
> -	device_for_each_child_node(dev, fwnode) {
> +	device_for_each_child_node_scoped(dev, fwnode) {
>  		ee_id = idt_ee_match_id(fwnode);
>  		if (ee_id)
>  			break;
> --
> 2.46.2.windows.1
> 

Breaks the build, please be more careful.
