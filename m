Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B0A44C64C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792165; cv=none; b=JVkIg3ThW/2IfZA/zoRTVewZ72A9znjlRV2SOHHo2VBycHK8LDtWIKaGu6ESI0NTHvphN2qdWPqwu87/C6OwSr1eqDouzrnhDEsK4ALTOLpKnN61xRrqWuGQAlnCxty5aASPPTSwd2fgPToVX9xWeV9WZ811ozQ0nI4zAcWMB7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792165; c=relaxed/simple;
	bh=cwJlS380bn/S8RqjldQzmzYHlcULXzK6TylrksZVSrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYMBzKK23D0yLJhdXxQASZy7z55/w1ipWjHSJPvl9Tgyeg0fNdNskp9Tc+OQBnVYcpMV0pn3tqe+v+LHMCRS1ovihGGM99O0z2hR5L7kFoGj9dc+Q2u3D4NtMqv1DHM4gJ8Kgk5kpk22m+HEmY3U443FYaZSI/zJesnbLk11AyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mnpOrYKW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mnpOrYKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C23D1F00A3A;
	Mon,  7 Sep 2026 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788792163;
	bh=hdT6u1gNNq87E/Xh1itonhXL5BkgCb8J/RAJ9RiAg6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnpOrYKWnzpUSewfqMNQbrrPQoJkKmSUNfHPj6wFWA1agrpWKktg4cocfkl3GQhLG
	 WcfhhZg//ID6ozRlh9+PZ9zsLR5C6MKiD8gmG3oBiTmHldCQG1oEh83N0LWBM85aoi
	 1tdB8LRQFEm6pRbuGg7PPWAwnLIh88wmIAhTWpLA=
Date: Mon, 7 Sep 2026 16:40:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <2026090737-unicycle-imprudent-dcd2@gregkh>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-4-samagazaryan@google.com>

On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
> +/**
> + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> + * @data: Holds pointer to userspace buffer with transmit data.
> + * @len: Length of data buffer buffers, in bytes.
> + * @rnw: encodes the transfer direction. true for a read, false for a write

You do not describe the "pad" variable.

And why not call "rnw" "direction"?

> + */
> +struct i3c_ioc_priv_xfer {
> +	__u64 data;
> +	__u16 len;
> +	__u8 rnw;
> +	__u8 pad[5];

You do not enforce that pad[5] MUST be set to all 0.

thanks,

greg k-h
