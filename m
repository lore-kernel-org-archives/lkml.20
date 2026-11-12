Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472542;
	b=Pas6VEB8WAX4s0XRksUJQNVVPHiowh7YLWE/9XbAkKnL5FNn8umb+xmBGKbNfYohrgU4
	 4ZtnsSRm3CM0HO/ZrTsUsXsR0MxaoVQuGtrE2x/bt+pa2JsC60TPQpz6Egv9epH7aRHpn
	 jBazWFhx/l69BqmhZCk8wc1X8+Y/5DH3bOkQ9G8PJyuNnOlqskx89FR3EbtsQckGA5eMT
	 i1TL7nuRa081WEQW4yvx7hh1XWt9JIoRqZc8ISbjJBStAVr551mrgqwYfNW16bn4lvNwm
	 bHslUqzX98oA0WA6mOs5zi+Lc/l5Da74tKS5g5yfnJ+4ITwNWdUejbUPTHZ4On4V3Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472542;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XNVnoH84ojoblKEsbGjY6MwnVeoD3CB7drWnVXqG69U=;
	b=DV8IpmrXCTnEvnjAVH6q6IalWASmxMSvdF++9LWk0gThTelTPzOG9Y7LijEcBQXX5qzE
	 YD4Baydn0/g+DtZZZDhOFsmnGMLSGQFFFvqxXj8YCT5XhioUeI7JtjLm3J2RL/eBNk+a8
	 WyKXDjoQ7GeS7mgQQOBdNwOCgOiAlv6d4pXXzZBbPAVX4eLs1zNCviJ0IkRH+3jkAl8gS
	 IqLMJ1XWLUH3WWEbsS+YHuEQD2hubG10su2ABYl6tCRlGe83GPojnuYyeEPQ28zn1RIEb
	 5EVkCBgLu6CGrpul0VDuI+KnqtiCZPXU/VlkAA+RpDyPU8iWOqYujF7uwyEs4p+1PNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTSKxyaT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9BB606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTSKxyaT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB671F00A08;
	Thu, 12 Nov 2026 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472541;
	bh=XNVnoH84ojoblKEsbGjY6MwnVeoD3CB7drWnVXqG69U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YTSKxyaTvXPd4CBIQtOqEPtFtoKe3DFraOjqnaIpSc55PG5MCMNYPPZPBQp3ha8A3
	 xTaR7HcnduB7GMIzCPmYD1rSTs7bqQr041Sx+MF9sE4qxKGTUAp/vT+kzcLGaFKOnE
	 1Kwa5cTSFArAky+2kslNA7Rxv/oBDmr+AaNIYZpDXfWT13IJ13eCcWypO7fNUnEUEl
	 qSWl+62KM9xAbHRrh65yi6k+OupB7AWxEMNeusOz9cf1Cfyf7MxHzIBgs3nxeHibvl
	 UT9Jl59RncXMEkoBsmeUidWkXYdi/pulw1w6NwqDeahxc4V+JxSnhsKPVOFYWH+LbO
	 yx1X5f0S7b56A==
Date: Thu, 12 Nov 2026 09:35:36 +0100
From: Gao Xiang <xiang@kernel.org>
To: hudsonZhu <hudson@cyzhu.com>
Cc: Gao Xiang <xiang.gao@docker.com>, linux-erofs@lists.ozlabs.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: erofs: refine the on-disk overview
Message-ID: <avV6WNCWyMxEA8ho@MacBookPro.fritz.box>
Mail-Followup-To: hudsonZhu <hudson@cyzhu.com>,
	Gao Xiang <xiang.gao@docker.com>, linux-erofs@lists.ozlabs.org,
	LKML <linux-kernel@vger.kernel.org>
References: <20261112021905.36269-1-xiang.gao@docker.com>
 <78C49082-EE86-431E-A97E-20CEEF2FB352@cyzhu.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78C49082-EE86-431E-A97E-20CEEF2FB352@cyzhu.com>

On Thu, Nov 12, 2026 at 01:32:22PM +0800, hudsonZhu wrote:
> Hi Xiang,
> 
> > Each inode can be located directly using the following formula:
> >     inode offset = meta_blkaddr  block_size + 32  nid
> 
> Does this formula also apply to inodes stored in the metabox?

Nope, the rule for metabox is slightly different, but this section
is a high-level introduction.

I will adjust this as,
 For inodes not in the metabox, ...

Thanks,
Gao Xiang

> 
> Thanks,
> Chengyu
