Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9404F3ED3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718154; cv=none; b=CagDWuHilLEwdCRnuO4gOZe2NoOFuZo/wWNw3Sib7lLA+5FyBNotFPLAbw3hFyDDn5N3WOO7cNAo8Kg+2FhUgPWdiGbxuheLMhdIpKMRJKsM+G328LyqiIgUr+4jRRbJ7S3nAELg7osojYPg0CCM3WlbQG8tz12XSX3jhPrTa80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718154; c=relaxed/simple;
	bh=vAh0olsRx5ABWuvRNHU1s7TXHPVpxAOLHBxwtRzERqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcnaAXemj0YMbKPzaP8z/Ocb2PPBNAMJ0NH6danNsFQKU+09T8iy1ZcYCXZmYXALci85v2k3Xu/gCoqhFnxo7z7Kx2qPI4pCK4Y8KCVtg0tOuKl2kQ26crBATaqPXYYfoF4wH6/o2Ge7PP0xHIzZKf+g63Tt9aTSPFNJpKU9R7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=gvjhd4xc; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="gvjhd4xc"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so15070745ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790718149; x=1791322949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oioSubLVdAHgriYty5R95qbHjT0ztj+ARCI8yRsl/I=;
        b=gvjhd4xcX7qrIGeva7UV9QwYHFqt6DsXJkhy5vepGQ9fqwSD/O0YbjGovlutemqdT7
         AYNG3JdOCzDPhgJPJCFmGrzSpkpFIzykDL6yk+3ySJrBRKd67MR+iZjWwhvgfYdD3EYY
         0XuW4yKAqMSpbqMjUmxXzAnDCO7aVw50HTbpS4sAdKlnwDedPxIdbjYS8E84TDxRXO+R
         pzuEPlmkEU4hvqddVFizKMtPNnMEgaWjF6FNvmrDyyAdU0LnEqXuXJi/Vtj+xOyYkIrZ
         dEyY8UAquwZvrJ42pPq8ifvnXHHQ7Pc/4EJuaFC35TBjUPDRxW3dXOtP7k9bj7YbU59B
         iVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718149; x=1791322949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6oioSubLVdAHgriYty5R95qbHjT0ztj+ARCI8yRsl/I=;
        b=n0cHRgQpWCuSqa7JVn16ddVOdhp0tSCxlVUKGdUhn9beoadiYynK53CmRmjuTLg73/
         B9Kw9BF5sVNZaci9EOubz7q9nX8pUULyZHYRyFag3yr2Xd8wtnhbqmq8r7/Hn9B756Jb
         LRK1ZBOUW4VFzn2TkzuC1mKm/4G9ullcwDTB3IdDfEIQCo3CxZGFMHQ+6KYc53SdLp+e
         O3n6UhKpV7W1YK7ojI8fva4r94XpsFTaIVha44Vc35KJ/lIf0bUUQBDch8GnsJIyO/E5
         KNj2LUfzmkclumLe+kfFaQR1owDXHCIzT+RGmP6cj3/SVGp03GQLRmaHdcFQmOtjVOgc
         QY4g==
X-Forwarded-Encrypted: i=1; AKwUvByyriO89J+q8nAmfBwlTkfIRl0Z/MCysWXxNa13iOHcTC8HViiguXR6Zl2MImAt4taMR8ZVvMLI2v5odYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbF4sCoh67iQZCHIE5ThKRirgSLF7zf4kxH8P+G3pl1pxfQB57
	WpfBuBUDYJlWpvTctYEjn1eQ5gvCfdHmUBPdMP0Fq8AFANFjWIv/mtVN9BY8rM3CQJA=
X-Gm-Gg: AYBFou0pLKoVxRKxCJke//v0rRUVrLB63iq8sG9dNQLOV8GPwrbWQrtVsUefDSIN44P
	OtvIKolyvTnxl1XKM7GhMh41EHcECUMpjvo/Z8e6kZJqEqZV68OoykHabYQrNerWWtfZJkIQkZw
	dLE7DGEmNBR+iAm+5uq34AugM+J2Mx9ztxjcA4nwsCs9sl8ZWFMemowWB7DVd98x1Gx0+9Mvl9O
	eWesM/xGgz0eXVkVwp5uhQmSrbElyV81iVC6lVjEBA5X8FaEQJcuXPYDYbSg6AhpnTM2Ea01EqF
	6O4/GMBtJ6nKi2NwKfnCKJihsaMmjJXRNLaSfIesDCnNls549lygyFsYvjya9dyekcgMpeTTriU
	XA8wSwHZ7mr+/Hq4Gy77ZskmWJ9Gm+wm73WW2BlakfbiwdEm1qUPqV8gIUGfsmJ/WxJXv0tXqvb
	NJbMy2h5W6os/NQaQBqWKbvPdI8jun3Do5x+q0FWKxjfLOzFHtpspqxEvLW+Qf/AZpynMN0wLlI
	XkxBjyNRwQg
X-Received: by 2002:a17:903:8c3:b0:2df:9d04:403b with SMTP id d9443c01a7336-2e2de5447d3mr2955125ad.32.1790718148606;
        Tue, 29 Sep 2026 14:42:28 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dda537f7sm1327195ad.47.2026.09.29.14.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:42:28 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:42:27 -0700
From: Joe Damato <joe@dama.to>
To: Ayush Yaduvanshi <ayush37735@gmail.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] sfc: fix kernel-doc description for
 efx_ptp_timeset
Message-ID: <arwww1y7uMnBmh2B@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ayush Yaduvanshi <ayush37735@gmail.com>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
References: <20260929094211.48125-1-ayush37735@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929094211.48125-1-ayush37735@gmail.com>

On Tue, Sep 29, 2026 at 03:12:11PM +0530, Ayush Yaduvanshi wrote:
> Remove excess @valid struct member description from
> 
> efx_ptp_timeset.
> 
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/sfc/ptp.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Joe Damato <joe@dama.to>
