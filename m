Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977724D5966
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157248; cv=none; b=JoJ9VZWMZph/SdYgV6eNKIhG8IeqWi2ppNb2IzbPt0llE6k+yeL9MjpegF4ne7zBxAk3g1qAegRVGSj6NQwtbp8aP/fICAEGxcf43EU2yPkDnvKwb2xsEbqxw4uEf5Ao4YzSKLNJ28HgZHDaUalKLnwysD1uAo6iYJOeG7Xu4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157248; c=relaxed/simple;
	bh=SrQ1O54/K0OWERz3C/07cXqHYeivrdX3t73cCad+Aao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQvLNVdbKNnZVw9tAZbYzsc+n23fTq+3N4Zs+hI7G5ixqMvhX+GiIaLI0x0OtIuJAHCyXszj4N1DHhITHalXfpLRABunb/7CnVdhdzsU0rBH9P6bHgQP5ZEk5IXXSY85YfeZj8weQarzPGIrCItZcfRpxWNSA4fjQBgoHfkplLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcQbk9j8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcQbk9j8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5562B1F000C4;
	Fri, 16 Oct 2026 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792157247;
	bh=kAkuDSgoIlUJHZV61jJnIDmNc5oXDAg3p+X4vEgNQLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CcQbk9j8sWQ86KgDtwWfMBITM+p9zxKyfdp3exHsY/pvOXIIpnCwWzBuEkUMjphnt
	 Gb+orU7i5QRzDOwkxwNjB7rSvpnkoqxPMFc5yBl9RQFt5kcK5BT5VgDJ0GbcPrlUEA
	 VpiJV9ZAvfd7QOwDLqD18zGccpNv4DmxvqkMqOZPAapdIPr+UIU47rtGbmJtv5Cz0c
	 /uBV4xRneA912R2qZFxXeO1MPB0BjBaF2y2CBi+Vq2yYZfzO8h/ujcF6EUV3GLweDj
	 HCr/4k59wnDt9X0B9nJj1y/ZLxFUeywc9BbSx/Fs3dh6QEj5CBJdD4uezeUMK/rBNm
	 Oj5MtXVXh/3BQ==
Date: Fri, 16 Oct 2026 08:27:26 -0500
From: Rob Herring <robh@kernel.org>
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel: ethosu: Fix kernel-doc for
 ethosu_gem_cmdstream_create()
Message-ID: <20261016132726.GH5059-robh@kernel.org>
References: <20261016101554.14231-1-sinha.aryan03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016101554.14231-1-sinha.aryan03@gmail.com>

On Fri, Oct 16, 2026 at 03:45:49PM +0530, Aryan Sinha wrote:
> The comment documents an exclusive_vm argument the function never had, and
> leaves out data. Swap the two so the list matches the signature.
> 
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
> ---
>  drivers/accel/ethosu/ethosu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Why are you sending this again after 4 days?

Rob
