Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969198;
	b=oEwjDS+O0tQG9Pei8RtKBPKa5oE2BMe6DuWh4T1mjRxyc1S4MQOt9F+jBrSFSCFm33i2
	 SU9GT0KpRd/e0ofHs6VEEPL6ROki8nbaY8ff8VoEV+SoO7d9E/mLf+ptKBNXeGShZl3yJ
	 77OZPd/Gnj3qpOc2l6OLviz/jR9kkEO9D4dPnIxuROxLNOp5lTHLqF05EM2vK2hC5eyTR
	 XVbvdlmF5lKihGdtlRpP/f7Q6Rc9aagRaZrFNSCfxcTCIgnL++zFOeT1acMWbFxl7EYNj
	 RRORpd7jfc4g9PFbJJunCV1pSNryHlStMhspJhUXsdtjjcW0lh+a0mofPLSt/IlsqUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969198;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SQstb3NAFozC6f5eba1HtcGxM2sdlpH0PEKeCTHX2NY=;
	b=3rzUJjjErz9zWgDp9WXZmKVJakuka72djuMQobw5fg7vwwvfVPTDYq8TMzkaDmaH6ZSr
	 UwzvvHVod9mNre7V/9ndKSrr2J6Nm4ge/XMtHYJw64G8u3xkmExa63TyfGSIyOiRoPMoH
	 c/OmDWufHfHM2cBs8S/QRgKmDihc8R5ZzQdbjrwhYgiwQNBQyqzMnPiTylFzV2P0drY+T
	 67VCw9ILSNV724Oa4quIgXXtyLd7IQYEHO/iZRKAOsWDst7zLfBZEkRFZqugl5h8On0Y5
	 /aDKZnI6iGK/wqjGrHz8yvsAReYWTWzzBzIK01tqZDG7+TRklxlr30WjZXnLiMP7V3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2zmnd5G;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83185606A339;
	Fri,  6 Nov 2026 12:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83185606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2zmnd5G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793969197; x=1825505197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y9Jb6Dw4T0rly+nidk/Mnv8ZptehDZunhuzxL5v2ZKA=;
  b=n2zmnd5Gle41LsisTHpVNBR9TgIdCGssFfoN1HDXqikp2eQYMaNkuQ3v
   ZNQxPqyOYGPNDI4c2PHXDbsbpG3oeTrkNR+A+pmuTslEUwu3J+dxhEw5N
   LQ5s0bsX6QKqyHT00wksWQwvoEp3jwrtkIYPOrrLNGzDkbR4R8xaEmKU9
   JKuZh3J84m24KoZfw1nbP27hCHbQxAadWaByDWkdN6ofzERSDKJoS+B47
   RZw6XY2PZHYTrRMHLv6LsVjyEfIbM3ze/de2u21GqPd3RR0dvHKsLa3XZ
   ZI4gzCy5TCjd5rSVZYVHClnjFs81jHEIhvdQvSecZVhK4kJG/oQ6cKytE
   Q==;
X-CSE-ConnectionGUID: 9XfxC7/MTTupeTG9QtArig==
X-CSE-MsgGUID: 2GcBcFvvT+29ELHkr9Nr6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2657996"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2657996"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:46:37 -0800
X-CSE-ConnectionGUID: BVknK8ovTLWpxtJYr28csA==
X-CSE-MsgGUID: rkEpVAeFTgGVvaHfqyeJug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7435805"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2026 04:46:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5199099; Fri, 06 Nov 2026 13:46:34 +0100 (CET)
Date: Fri, 6 Nov 2026 13:46:34 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Record the partner's Product Type VDOs
Message-ID: <au3MKtjI0920w0Ym@black.igk.intel.com>
References: <20261102-tcpm-product-type-vdo-v1-1-02e90dadbc2d@flipper.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-tcpm-product-type-vdo-v1-1-02e90dadbc2d@flipper.net>

On Mon, Nov 02, 2026 at 06:21:24PM +0400, Alexey Charkov wrote:
> A Discover Identity response can carry up to three Product Type VDOs
> after the Product VDO, describing what the partner is as a UFP, DFP or
> alternate mode adapter. The Type-C class keeps them in the identity and
> shows them as product_type_vdo1-3, but TCPM stores only the ID header,
> Cert Stat and Product VDOs of a partner, so those always read 0. Cable
> identities already get their VDOs.
> 
> Store the Product Type VDOs as received and zero the ones the partner
> does not send, leaving their PD revision specific layout to the reader.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef5210..8fd6b1f842b3 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2064,6 +2064,7 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
>  {
>  	u32 vdo = p[VDO_INDEX_IDH];
>  	u32 product = p[VDO_INDEX_PRODUCT];
> +	int i;
>  
>  	if (cnt <= VDO_INDEX_PRODUCT)
>  		return;
> @@ -2073,6 +2074,10 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
>  	port->partner_ident.id_header = vdo;
>  	port->partner_ident.cert_stat = p[VDO_INDEX_CSTAT];
>  	port->partner_ident.product = product;
> +	/* Product Type VDOs, if any, follow the Product VDO */
> +	for (i = 0; i < ARRAY_SIZE(port->partner_ident.vdo); i++)
> +		port->partner_ident.vdo[i] = VDO_INDEX_PRODUCT + 1 + i < cnt ?
> +					     p[VDO_INDEX_PRODUCT + 1 + i] : 0;
>  
>  	if (port->partner)
>  		typec_partner_set_identity(port->partner);
> 
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-tcpm-product-type-vdo-af873ef1fdf4
> 
> Best regards,
> --  
> Alexey Charkov <alchark@flipper.net>

-- 
heikki
