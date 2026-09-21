Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25371379C27
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973694; cv=none; b=n7ZFIpV70gAKZqmbm31rikKLnW6asJBddF/Q2auftWS2ozdmT8o8xKJJeKbkkZWPZn26kWQ8sYqlz321T1wtOAZXWYCchY7m7jctax22eHG6Wv6v9Pb28IMrDnWLI//ps6vVl90L5pja2qhS6tWKgLdkVMpmXrX4ViAuKSS45VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973694; c=relaxed/simple;
	bh=dHulLgMrCm1n+yYr2WeIIcI77MczloWlrgKYz2s2w0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJ+uEf5GGd1U/qQ8UYfdnqb9yfeD40xx48OolMEN+YpgoGGubYyfwebR29BlED7VqvjbGx2jihbI5/tPOBmX8POOLshbMnow+1G8LQ1LgoQE7hDKoSYY+0SwtDscj+z7kUaB+mUE4GsbkzOCGfNP5algEa9iXDX1lkOnwUNUCpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8AD1F6732A; Mon, 21 Sep 2026 08:54:48 +0200 (CEST)
Date: Mon, 21 Sep 2026 08:54:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Ing. Alfonso Kuen Arroyo" <gerencia@idkmanager.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	mlombard@arkamax.eu
Subject: Re: [PATCH] nvmet-tcp: fix stale comment on NVMET_TCP_MAXH2CDATA
Message-ID: <20260921065448.GA13764@lst.de>
References: <178978695312.43804.1554581215424967584@idkmanager.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178978695312.43804.1554581215424967584@idkmanager.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Sep 18, 2026 at 10:02:33PM -0500, Ing. Alfonso Kuen Arroyo wrote:
>  #define NVMET_TCP_DEF_INLINE_DATA_SIZE	(4 * PAGE_SIZE)
> -#define NVMET_TCP_MAXH2CDATA		0x400000 /* 16M arbitrary limit */
> +#define NVMET_TCP_MAXH2CDATA		0x400000 /* 4M arbitrary limit */

Maybe use SZ_4M instead of having a value and a comment that can get
out of sync?

