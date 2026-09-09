Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A73243F8D4;
	Wed,  9 Sep 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942389; cv=none; b=QAgHZ5seKzhEc3W216lBeLIF/7H5s4/8R/5Q0h9DRrwfzxs75QGALOrmrRB4hlg2HVBaBbfIsVqY3n35ouDSqPFTwKyZv/vLTx/4NGajWpZFNbeQE7krB+fBLCTluD/zSqRaphRAaF5o/wmmoAH0CjtqPFpdXUaQeUmIa8GqPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942389; c=relaxed/simple;
	bh=3HL2xlzweF3ntRDobRFAjcOI9mzIS+oicd6CAejua20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1VW+d/ro28+eh40j0MVn8rxXfY/ErgVwtqLitGE6pqz0yQTt6cZxv+0GBQoe0nozSjoJcDnG0GPgJC/qR6Z64jhCyDiVDJPvu4BNJy4ecoQWS3xgD411RYYhGZ2aawcJew41LaCS+IAdbVYsilASey3U3lRi9YyVenbZODmbOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmOQijkz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmOQijkz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A70B1F00A3A;
	Wed,  9 Sep 2026 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942386;
	bh=QIGfvCfOQJAE4icgenOha77EcH8CayIs5qvqBgou88A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lmOQijkzsS43CgNsuhr1NodI2f94LyoS5ZUF/Bbf3EDX4VBK3xK9zPp8xDv+ENd0O
	 01F+pUt/inTAFYA26A/C+htkBXDnZHeZGPqc/pW9SrZo+sm1i0kY/c0JlVBpVhKi3M
	 9Uf4UdMDqI8yYukCElCliPsDrg6AmQf1YVmKUjJmX0zPsT3rQBOs6P1bzrBt7x0t1h
	 TOWogpCVNC7UHvFnPefO/Mu/LAJbcjmTXtsWTtmPoYFpZ1BwklfRq3EmjxY3JJEpXh
	 sqIBl7XWqTivIVlOJkUkTAR5GT/FILAl6vLfmvK9wSthIWXPQxQfSShrtKrdrWzCH6
	 1m8ejAFPBL+rg==
Date: Wed, 9 Sep 2026 10:26:21 +0200
From: Thorsten Blum <blum@kernel.org>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] media: i2c: isl7998x: Inline
 i2c_check_functionality() check
Message-ID: <aqEYLaBDiXIqU9pl@kernel.org>
References: <20260909075032.409159-2-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909075032.409159-2-blum@kernel.org>

On Wed, Sep 09, 2026 at 09:50:33AM +0200, Thorsten Blum wrote:
> Inline the i2c_check_functionality() check, since the function returns a
> boolean status rather than an error code.
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/media/i2c/isl7998x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I just sent this to Wolfram directly as part of a small series [1] for
him to apply. Please ignore this earlier resend from today.

[1] https://lore.kernel.org/r/20260909082053.410739-4-blum@kernel.org/
