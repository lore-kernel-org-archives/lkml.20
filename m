Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [144.76.133.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0C48165E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783284; cv=none; b=KKhQcHDbyJ1jQ5UMSFAJZbFIKmOVwrtt9BZxvxJuoiipiM+qBo3XijfgPtV1PrKLPTbeD+ZeKkCIcdflUtFR3Tm52AZu5jo/VZOIvHiEBEvRhJ91DKQsU0O82yIpxq6Uw4vH/UKYbJIj2cmNrRzz63YrSohK/YThlTuZXgVzmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783284; c=relaxed/simple;
	bh=G2RbcQY3mVcKP//WDSMMXeI3yLgfO9MISISyGugpnhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQycAmkaR6Sv8yR/yVmJkbkejXAayMbMWkkELS5J56BHiAXfwbLMrt/I8L9aUlR2eOLuIARZVyyE0CC+RkmlUAwlaCR++XI7DofZryAAEUZkI4++Ym4CymoBQ2DqQo6NonmWH1jEgaxbrf57yB8biyMu5fj9LV41Q6GUJxBp2Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=144.76.133.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id B3080D76;
	Mon, 07 Sep 2026 14:14:31 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 6A658601CB35; Mon,  7 Sep 2026 14:14:31 +0200 (CEST)
Date: Mon, 7 Sep 2026 14:14:31 +0200
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
Subject: Re: [PATCH v2] drm/i915/psr: enable PSR on Apple T2 eDP panels
Message-ID: <ap6qp8Ct7aLQJhmx@wunner.de>
References: <20260829161622.11396-1-alexander.fischer@kait2en.org>
 <20260907083753.41393-1-alexander.fischer@kait2en.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907083753.41393-1-alexander.fischer@kait2en.org>

On Mon, Sep 07, 2026 at 10:37:53AM +0200, Alexander Fischer wrote:
> @@ -286,6 +306,14 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
>  		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
>  		.hook = quirk_disable_edp_panel_replay,
>  	},
> +	/* Apple T2 eDP panels */
> +	{
> +		.device = DEVICE_ID_ANY,
> +		.subsystem_vendor = PCI_ANY_ID,
> +		.subsystem_device = PCI_ANY_ID,
> +		.sink_oui = SINK_OUI(0x00, 0x10, 0xfa),
> +		.hook = quirk_apple_psr_handshake,
> +	},
>  };

Looking at lspci output of the MacBookPro16,2 and MacBookPro15,4,
I note that the integrated GPU has Subsystem Vendor 0x106b.
So you could use ".subsystem_vendor = PCI_VENDOR_ID_APPLE,"
to bail out early from the for-loop in intel_init_dpcd_quirks().

Thanks,

Lukas
