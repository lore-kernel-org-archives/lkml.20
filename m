Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0620D4FF;
	Fri, 18 Sep 2026 17:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752565; cv=none; b=dxuTrn7ial3Tdk18DtO6SXUFaC3JnowHZb3/xbxyaOR6/zNUCQ8wDA1mkoCaXmX3gsNhpYCZkc/ATEIbKrAScOIRyNw0x62PfaS0CSuosZmIiJqVnj+bAy8hGLvNv+etZYEu1tKKtE3f8uNbuNrNguxfmOqiXZL7aXUzUmtY+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752565; c=relaxed/simple;
	bh=2DjLRojdcHdk42VuWA6gnYvmVnGxECzhGga0XiOvr94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2H3bLaPEgW/IvBDPyOVJMnIghIDsSCerNi00lRiJrZ4jpocNGKf6NRzwLtJ/9pu/r0WNt+PACYt4HK0YWKzEeQ+eJUuVV0nOGg0aWqc2+Tr3d1XyyFMsOcTY74P2F08FFt7pFvKXGUaO55+R6+DpmN9cQ5DHb4bsBTcAxXNUNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9alqsVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9alqsVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F79E1F00898;
	Fri, 18 Sep 2026 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789752557;
	bh=vbrLjDA5I5MA6uyd17uHuE+513dOCY8IUaL9W6yV2gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j9alqsVTZWYl/fk/xWDkI5W/1gYfiPNi3ubr4Q4M51V39TZ+1pjHIlsPND3Crvbhq
	 b1z2uk3OEBEkCGvJNi0RhyVMq82WlW+Cl5xJURg5coC7ga0DbW+tjgKUPa9tPirbCo
	 pq4kn1yax9t05iqZ0Vx+QMBL6Sh4rOUUaZIhpXsRnJgnCJr8ls4iqE6IY8etPia0TT
	 whn35An2mAWIoR6hZU4HEX5O1pgaOnJLlW/rUZ/yOean2hqXsXekyET2sRaAHaLy+O
	 3pU1dtGm9lsVju8OooA1887LoA5N/qEOB83XVOxh2l+Yaar7oAp/HH1E4v2fFJ75n3
	 JbLNkb2yrd+eg==
Date: Fri, 18 Sep 2026 12:29:15 -0500
From: Rob Herring <robh@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Message-ID: <20260918172915.GA713455-robh@kernel.org>
References: <20260918031326.68542-1-karl@asseily.com>
 <20260918031326.68542-3-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918031326.68542-3-karl@asseily.com>

On Fri, Sep 18, 2026 at 06:13:24AM +0300, Karl Asseily wrote:
> Add a binding for the ES9039Q2M, a 32-bit two-channel audio DAC with an
> asynchronous sample rate converter.
> 
> The part selects between two control personalities with its MODE pin:
> hardware mode, strapped by HW0/HW1/HW2 with no control bus at all, and
> software mode over I2C or SPI. This binding describes software mode over
> I2C, which MODE = GND selects.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Asseily <karl@asseily.com>

Missing Krzysztof's R-by, but sashiko is right here. You should be some 
supplies.

Rob
