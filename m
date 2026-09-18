Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1BC514774;
	Fri, 18 Sep 2026 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752456; cv=none; b=nGhxIdCRhhR0xKebPFW00f7n1Pr44FgxtjAAxlG3hY3l0VToGTn1HKp3wRC2Hc2l6k1pLsqtrjIg2ULGl0hgQiuU5WmdckRo7ihboeJ/KOw4dUZp3vQwr4px2pSZ8Rkp1xy+QQ+NYchay8Bse4NsYTbHbNaeQWrmv/xnppBBJs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752456; c=relaxed/simple;
	bh=8QVKSK5kX5l6skryQvsHbwY0LV2dCZNgST+fN6OjcbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd8mr/Xbr2qvhMeTHGvp5C20jrNM5HNzeZyHZlhDVqsN1RaPTPGWBw5tFwFgZbYub+tfm0E3GMrPUr4cpjcUhXUq2J7WWuzsl+PIj6A8M0w7XYj+xT8HPIWnV/igt2vCd0mwUb+wX/qMfXKWya3DlmKLnVVzcjHtAFLLCwhDPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhyzUNrr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhyzUNrr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0ED91F000FF;
	Fri, 18 Sep 2026 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789752450;
	bh=1SUJ6V2P1vGxa0gyL38KN9E1W/4qt3E6TTNzmNpYQKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GhyzUNrr8hwPset88fxTZCoa5Nl7jOSNCwglQzDkZU/hsSvYPpckZ/7wYScxHHkah
	 PmQCqO30m8LCyNl6t8WvGM6OgFo3mfaJrznSKiJ+iTHrQt/ZLPXhrqzBz8GtdiZbWC
	 RGKUfZVNmd/981N2XdL6qAJylcTE/RMitkAQywqUlKPBdfgBz1EkbUvkWZ3/JPOsGh
	 vSCWpk5tMg6m4DIHfhxv4D0bgboWkccsAAkLXVjwWudhGcA/tyBLJ91OPp3Iajv+N+
	 5Atxct8ZNAZVXjdzP2w7PhYV9RUL6oG0lMdFUGk0dwQ6I/qzwQ/zu1sX7bgMb5QAgc
	 nDYsNiDEXozyA==
Date: Fri, 18 Sep 2026 12:27:28 -0500
From: Rob Herring <robh@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Message-ID: <20260918172728.GA701105-robh@kernel.org>
References: <20260918031326.68542-1-karl@asseily.com>
 <20260918031326.68542-2-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918031326.68542-2-karl@asseily.com>

On Fri, Sep 18, 2026 at 06:13:23AM +0300, Karl Asseily wrote:
> Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
> of audio DACs. The prefix follows the company's domain, esstech.com.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Asseily <karl@asseily.com>

Missing Krzysztof's ack...
