Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E42E33F5A9;
	Sat, 29 Aug 2026 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788005717; cv=none; b=Yb5DFntZ/77N1nCZjyVREh1G4MiIzoxlvuUHTlqvbc9XDm0oVez2K7v7Y7RmRARziwFRdwo4T4SpPhhTISC/+OCMWJn41Z9bXc45wmu756+1SYnv8D6dZetU3hNVTd8J8RHU0gM9yIszPGCtUJvqM9n8to1ElRIjvVVxacxxvec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788005717; c=relaxed/simple;
	bh=aK2DYAvsZ6UbjEHeLaVUlcJUcw8z0F28gMH0NEuScX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad1Cj9jIDHgyaAd6RhXsC0Hm7p25V9mcSMi88FjYBARJsaxv9ECUroXByw87klUPutChQdWDcNjazy0rTHKIcGrXxaGuZC/kk/xShg1EIFEQtdXdBF+9EWAXmCJySu0//5QYDqZYpao1syNo3kDTgJ0OZRVb7CrMtNA9RgvASRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K5PhaIYT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K5PhaIYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D641F000E9;
	Sat, 29 Aug 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788005715;
	bh=981+GefxCQlPiwIVXcWM+HkzYNRCF37eIRbg54au9wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5PhaIYT8Hac8imo0X4YmFNYHBTIvK0+zY0mQZtoTAiMTrOMSv0ob7/2fc4TdlOu1
	 WHdhmxNto/FEfd761snCyBKe5pihuI37tZIHNr9Sdmjo0+0wbzuqxwftcone+7VILr
	 mTpd9LotviJrScNRKJLC+wa/Nr/OE66q1Zf67ohQ=
Date: Sat, 29 Aug 2026 14:13:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: williamhutton <williamhutton@disroot.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix checkpatch whitespace and
 indentation errors
Message-ID: <2026082903-october-perm-b7b8@gregkh>
References: <9bf9592cb867ce9ebdca51e426b03080@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bf9592cb867ce9ebdca51e426b03080@disroot.org>

On Thu, Aug 27, 2026 at 04:13:30PM +0100, williamhutton wrote:
> ac17f2cf6f9f0dea36c10f0e039d01f5b48aa31b Mon Sep 17 00:00:00 2001
> From: William Hutton <WilliamHutton@disroot.org>
> Date: Tue, 25 Aug 2026 22:37:02 +0100
> Subject: [PATCH v2] staging: rtl8723bs: fix checkpatch whitespace and
> indentation
>  errors
> 
> Signed-off-by: William Hutton <WilliamHutton@disroot.org>
> ---
>  rtl8723b_hal_init.c | 2825 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 2825 insertions(+)
>  create mode 100644 rtl8723b_hal_init.c

This is still obviously, not a correct patch :(

Again, please read my previous email to you for what to do first.
