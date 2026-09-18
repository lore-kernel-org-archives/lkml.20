Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0EF4F93D1;
	Fri, 18 Sep 2026 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726637; cv=none; b=nTTtNK5tgKR5Kwl1LKDdCvjxv9dOdWxKLbhDo6M2vKHw2731hQzjp6pn1a5BdiqCWWs7GFGrdVSw84lsfiTOSFWkV81Qwin035Zdsgw+9jNzMioUB+LruV9nx9YpEYDXJWCtNEFVZEiv9TdZGmpDwTRqBtQN1P2fIwWOOYwA3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726637; c=relaxed/simple;
	bh=7WGjA4gJlSHK3qsr85o73VSVw/EquT/+tIEId/vHYKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4Lc/H77jub/nh5CnGKVYNdQZjdaLwsard/f5pHQy8l6+21E7B4hCL1ZODoOiIZAy+04a5mi2uqsue3nuNNUakBDz2eErbcR3Cc1IESvmOdpOMVOqjoVJQ1NLGhUqYJiCHgooYdaurPQsLDnQuJuBn9IB2ImmQyCvmJDbW+47Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNXukOiO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNXukOiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EF31F000FF;
	Fri, 18 Sep 2026 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789726630;
	bh=sjD7gXYT9sEFgIeGRllW0SYD6Scu3JJ7NhNsn25KgeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MNXukOiOm3AOxM//9KfJdpEvdWp/wq592XQxYRB/aoFtqzftWn6hJdXRzeYnCD6BS
	 fBTKJmzKkNtBaCwpiXDzYLprD35nN66YWtSPIjhQkILjnnoIZpMFooegwvwiR+U5iY
	 szyMkA7UAZbBzFI+t9WoAbOhe8JrjUhN2SVeZ70Q9FDKZEGbLOret22win++Hz58f9
	 rbpoem0/n/lktLi36DLiUwm/eGiSVqhVpmr9Sj0a0sl7s12/wmoGBF8tFQD0/MrFzk
	 dTKnXRxn/WoWnmnUdLuHgGZsKNvitoALfiBfJr5iuK640r26039ObEVu/u0n6dQChj
	 kyFPSfPVP8P3A==
Date: Fri, 18 Sep 2026 12:17:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	andersson@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tiny: Add RAiO RA8875 display controller driver
Message-ID: <20260918-agile-cormorant-of-admiration-82ae7c@quoll>
References: <20260916175942.3186804-1-azuddinadam@gmail.com>
 <20260916180410.3188922-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916180410.3188922-1-azuddinadam@gmail.com>

On Thu, Sep 17, 2026 at 02:04:10AM +0800, Adam Azuddin wrote:
> +static const struct drm_connector_helper_funcs ra8875_connector_helper_funcs = {
> +	.get_modes = ra8875_connector_get_modes
> +};
> +
> +static const struct of_device_id ra8875_of_match[] = {
> +	{ .compatible = "raio,ra8875" },
> +	{},

Drop ,. Missing space. Please look at other files how this is written,
because it was a cleanup some time ago.

> +};
> +

No blank line.

> +MODULE_DEVICE_TABLE(of, ra8875_of_match);

All ID tables are placed together, just before 'struct xxx_driver'.

> +
> +static int ra8875_write_reg(struct ra8875_device *ra8875, u8 reg, u8 val)
> +{
> +	int ret;
> +	u8 cmd[2] = { 0x80, reg };
> +	u8 data[2] = { 0x00, val };
> +

...

> +
> +static void ra8875_display_off(struct ra8875_device *ra8875)
> +{
> +	drm_atomic_helper_shutdown(&ra8875->drm); /* calls pipe_disable above */
> +}
> +
> +static const u32 ra8875_pipe_formats[] = {
> +	DRM_FORMAT_RGB565,
> +};
> +
> +static const struct drm_simple_display_pipe_funcs ra8875_pipe_funcs = {
> +	.enable = ra8875_pipe_enable,
> +	.disable = ra8875_pipe_disable,
> +	.update = ra8875_pipe_update,
> +	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
> +};
> +
> +static const struct spi_device_id ra8875_id[] = { { "ra8875", 0 }, {} };

This is completely misformatted table. Please open other files.
git grep 'struct spi_device_id'

> +
> +MODULE_DEVICE_TABLE(spi, ra8875_id);

Best regards,
Krzysztof

