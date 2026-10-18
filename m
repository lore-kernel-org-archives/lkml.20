Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FE94AE101;
	Sun, 18 Oct 2026 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330235; cv=none; b=C1rDprMnazT5fxJPPV79WPo5vb8CatYUKTtj5aGx+v2Ni0ChpCISTJBSN3zIcdWKiyK7ItXkB5GCGxWzPYg2N+HSi2SbWOjzCra5J5pMLn9tvXia8bRwqWzOtQiIw9l3UrHHVP58mizyAyYovSc4AhLlfyYaqpxUjSlP0CH/pvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330235; c=relaxed/simple;
	bh=LHfp2/1Vx9e7gHGnMLcPf1qW1mf9LgJgz2ZhvFyZIrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbJ89DyTN8EcVl1Qs/BVy6kPfbENXdNiJuDX+yQKZYz8oijavZ7s/+b3j2RDUO79H7Lm69oXdAzT6Rys2SZNdT8/go2AWGBAlnBgeejsrazz43bEQSMkV4dj5wqXWIA0mLlVpHfPMwXUnsSceMBCNEUsJxzMdh4H9cy6kDjwziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nf8wavoi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nf8wavoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9AE1F000C4;
	Sun, 18 Oct 2026 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792330233;
	bh=Zcx7g051Y9D2bi5AQW9KP/qOf+uXholMlpOHhj0h72o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nf8wavoiT3IzBEf05KkNg7ZESzDJ1OK1EMlvlN7bqoxTwqv7IFOne2TjsIbrOZwUL
	 vbMxV5Hh9lHX2kW6PXOdTPwfXdaULyuHpUczRz1UmKdIVYGcirYh519PhG3xj9uwfU
	 VwZhbel9CyeIt9a3lj+VnCYJnjscD5vEIKa4uH6g=
Date: Sun, 18 Oct 2026 15:30:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visiongravers.com,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match
 open parenthesis
Message-ID: <2026101818-banish-scarf-eb6e@gregkh>
References: <atTFT49xpaBEb7Wn@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atTFT49xpaBEb7Wn@ubuntu>

On Sun, Oct 18, 2026 at 02:10:39PM +0100, Comfort Oyewole wrote:
> Fix the alignment issue in order to adhere to kernel coding style
> 
> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
> ---
>  drivers/comedi/comedi_fops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Why was this sent twice?
