Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542FC390C88
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160760; cv=none; b=j7uKFhRNAS2gM4pRb4htyMEdnV1zss21lE0Dt9vJDBrAOwcX4wGhYjBEMNAvWnn1R1hEfkDyZdAvGY5kF7VG95A7WyoSjlO8zQRyZmFRL2ttvagxLBnhYh9tgo3MlDJpShFu/eq2pYH7Zw2l1/JgNSX7w/Pu92i3UHt7CL8jTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160760; c=relaxed/simple;
	bh=P9RCek/+rc/W22DQFWb8kHJmbH5mI05FZqFadxwm6tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGXsKctGAJqtchruqK6RiO9DFx94afChLBtDvjz4mRLfb++dN9c/qF0bv2i3dV1jtaGWsGkZHcMKzWl7yxGIJeaT4/yLF8NmRAQwtTC4e+2/bKq+yXtOpm7jVvXvS7AQQex3mvdhK7H80B/WJZrKvHbqZL0rIT3LzETbQZ/KJx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 7E43810DD1;
	Mon, 31 Aug 2026 09:19:13 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 6884B60BA873; Mon, 31 Aug 2026 09:19:13 +0200 (CEST)
Date: Mon, 31 Aug 2026 09:19:13 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Alexander Fischer <alexander.fischer@kait2en.org>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	=?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
	=?iso-8859-1?Q?Andr=E9?= Eikmeyer <andre.eikmeyer@kait2en.org>,
	Yossef Osman <yossef.osman@proton.me>
Subject: Re: [PATCH] drm/i915/psr: enable PSR on Apple T2 eDP panels
Message-ID: <apUq8bYCZ3I9bErN@wunner.de>
References: <20260829161622.11396-1-alexander.fischer@kait2en.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829161622.11396-1-alexander.fischer@kait2en.org>

On Sat, Aug 29, 2026 at 06:16:22PM +0200, Alexander Fischer wrote:
> +static void quirk_apple_psr_handshake(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	struct pci_dev *t2;
> +
> +	if (!intel_dp_is_edp(intel_dp))
> +		return;
> +
> +	t2 = pci_get_device(PCI_VENDOR_ID_APPLE,
> +			    PCI_DEVICE_ID_APPLE_T2_BRIDGE, NULL);
> +	if (!t2)
> +		return;
> +
> +	pci_dev_put(t2);

We've got pci_dev_present() for this.
