Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374DC3BADA3;
	Fri, 11 Sep 2026 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114256; cv=none; b=eekYJPvxEcEnedOSbyqFvNUtkcyGlSVRKfcouwjX/72xD3mGkoS0kgVxidzF6HJOXnaX2BxtjndNuOKR/ZqDU6yCCAaPtmkDODTvtpqzSfqMtCs2LQJQup1jtKm0D89kyco8xeV8WrWPhxMU9K74Ebhpq5/lxxo+ycw3V6EtV/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114256; c=relaxed/simple;
	bh=bAQGHcGihHh3mcO49kQ2lWR4ogC35wE0tYD8hhwl4I8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZLlLOf6xBUNn5pN/xkFFJ0of2OIzlyKYSrWT5C4bOSF4fpPmS0p5w4mmobB6ixxkvhYg57MazjsB8mCVxu4x4OrGznel4UPfIsamEUsonnVWl2AYWUHQtVSIOs5Bl962pBWA2gAeDxdrYEuZvej12XJd/AtiS0GUbq/FsTvJqKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hynYgSV9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hynYgSV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6681F00898;
	Fri, 11 Sep 2026 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789114255;
	bh=r+fxHgNk19zzpwMVsDhNgM4GQi6X/xHP6JSYXbkTTFc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=hynYgSV9Pvj38SBw9aYRQGN7z5RxmwkqKewtNVuUVwI+1UlNhtDJtk6StaDfYfnMb
	 g+Ey0FXDlYAxAj19GznZQQJX4rCO+b3rM04+0j+MmdJqO0R8psQ0ZFtgtfC+IgSYVj
	 TmBZsMkPZJuATOuEU+n03rt8lx8W8asim5U9A/h7ca8sMcslGvyKDSNBFZ6KSbs3rx
	 IuCJ0sLsV3K22TdBzjFsPRJmuGjp1tU6Sbuh0kA5pDnZI4Zb5r0GWydXWRZifxNt+D
	 d1Grm5Vsx2JVIePaAgYg6KKpcEKptU9PZpTMUc7eMduxzWUSm9FsHnuMj459HfvWlP
	 in/GGzFFhxveA==
Message-ID: <28ee58c0-f33d-42ea-bb9e-ad32734a8df1@kernel.org>
Date: Fri, 11 Sep 2026 10:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 08/19] media: rc: Use binary search for adding or
 updating a scancode
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
References: <cover.1788882189.git.sean@mess.org>
 <afefeadfb3f69f8a77294f0194db4ec7f428d0f0.1788882189.git.sean@mess.org>
Content-Language: en-US, nl
In-Reply-To: <afefeadfb3f69f8a77294f0194db4ec7f428d0f0.1788882189.git.sean@mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/09/2026 17:51, Sean Young wrote:
> We can have up to 1024 scancodes entries which are always sorted, so make
> this a little faster.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/rc-main.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 924b13fff753..795ac0fe4858 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -391,7 +391,7 @@ static unsigned int ir_establish_scancode(struct rc_dev *dev,
>  					  struct rc_map *rc_map,
>  					  u64 scancode, bool resize)
>  {
> -	unsigned int i;
> +	unsigned int i, lo, hi;
>  
>  	lockdep_assert_held(&rc_map->lock);
>  
> @@ -406,15 +406,21 @@ static unsigned int ir_establish_scancode(struct rc_dev *dev,
>  	if (dev->scancode_mask)
>  		scancode &= dev->scancode_mask;
>  
> -	/* First check if we already have a mapping for this ir command */
> -	for (i = 0; i < rc_map->len; i++) {
> +	/*
> +	 * Binary search for an existing mapping for this ir command.
> +	 */
> +	lo = 0;
> +	hi = rc_map->len;
> +	while (lo < hi) {
> +		i = lo + (hi - lo) / 2;
>  		if (rc_map->scan[i].scancode == scancode)
>  			return i;
> -
> -		/* Keytable is sorted from lowest to highest scancode */
> -		if (rc_map->scan[i].scancode >= scancode)
> -			break;
> +		if (rc_map->scan[i].scancode < scancode)
> +			lo = i + 1;
> +		else
> +			hi = i;
>  	}
> +	i = lo;

Can you use bsearch() for this? (lib/bsearch.c)

Regards,

	Hans

>  
>  	/* No previous mapping found, we might need to grow the table */
>  	if (rc_map->size == rc_map->len) {

