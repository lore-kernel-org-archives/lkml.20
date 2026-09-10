Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44D3C3BFC;
	Thu, 10 Sep 2026 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030336; cv=none; b=R2DXNorSiMsA3CDTZXyOOllB2VOHiT4WKPo6DWSl0P4Qx2UyjzSDhqNuDgPjkQTvF0vM5yz7iePU8wrumpE/Cj/p+pjlxspG9brGpO5TWiENfdukbR5/ZCZ+A0AJYfwZFr4RDSlcdxOdq+NeWGiw8MtSkSnaDuxxbA0VL/4nuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030336; c=relaxed/simple;
	bh=TQACUngC8v+fi59HY1O1LGZbn6mWCg8WuNHIlEjqqiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXYy2sCXPmyHTAZG/ZFPEXq4siKlp2RPCWwwSCgniwkaEOaH5MOq8uSAmLxaxJcAlAkmz3huJzU3tfE+XC8JVJPKO1+4VZxxS+vV6JU8z09aNEtpWA0wMy3o5BArCkzC6ghjad7j0SD+s5ddWBe3/NsflDT4NfApBOBdhExk7xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi2OEwh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi2OEwh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DF01F000FF;
	Thu, 10 Sep 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030330;
	bh=QSxJWdyReIeiAvKgAQ8G9IsI4hio9q+PYzraL+E27XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bi2OEwh+dBcmM538G9dyx3Oq2alMvJAQ84PyDedBuPZumF1KPQpSkumD8FbPtSJZV
	 2lcjuWN2HGkbtbgqlfFb0ta6UCSFG6kx2ZNSbgQLOhzkQdxqYAo41bzMeZSeA56wT2
	 hd/YITGu4TYavodcJX2qorPYKk+fy+rFLHUaEFiEKQY10WmJ6SaoBzvWpm7EnoNT8A
	 Z+2P4QWdkTMQGZKyTfBTRNE/sMearano2UxuBsq46vI1GQfx4NBjOpWwWzMq2Wu8+H
	 SSzDGS0iZaUrz3pVTodc3B1M69TvGYoMCF9V+IAxIBJ6kVZyMvBmezu3iunITEY7ry
	 qwCBERCmBI8Jg==
Date: Thu, 10 Sep 2026 10:52:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] MAINTAINERS: update Joel Selvaraj's email address
Message-ID: <20260910-premium-pistachio-platypus-e60aa3@quoll>
References: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
 <20260909-update-email-address-v1-2-94a240f9469e@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909-update-email-address-v1-2-94a240f9469e@joelselvaraj.com>

On Wed, Sep 09, 2026 at 01:12:00AM -0700, Joel Selvaraj wrote:
> My jsfamily.in address is no longer active, switch to my current one.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
>  MAINTAINERS | 2 +-

This is the same commit as mailmap update. Not two separate.

Best regards,
Krzysztof

