Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E24A92F4;
	Wed,  2 Sep 2026 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369878; cv=none; b=XYuN5A83YvWtPSvgNCjHj01x780TuXgFM8dmmn5UEiMmn2Y8mCPZd4Vb0Moel6NUTqE3BxRiQGI0zfVzZ1hAuJUt7c54/rrXmzCBEYBYYNAo6F95bxXjNkV6Zt3+1uKBRx+crcil9llq9gFDy8kpYDQapxnUUzVUE4yBs0Z4o04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369878; c=relaxed/simple;
	bh=O2HTZ8oMi/55GiW97GxYG2jCA376NJNvFoe5bFDZISQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcuUqqKb4Mj7gna6S4oTud9OEU2tTol83Q0SjMT9D7/G2WDsGlt93K1KklkWvfcgKP/ktkQnrDWKnNDstGQLelXWEVNL2GciLq9UqthCLBDOaWorvPkg6K4Dit8LRa3eVMblbRmQo3wLFMnn6I6LMeY6HlcQTvRuh5f6Pho/4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXiOsd0I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXiOsd0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1164D1F000E9;
	Wed,  2 Sep 2026 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788369877;
	bh=l3/1naZ1RhLgUWY856SAbE6LeQ8PQwzS4dxBvl1l3nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DXiOsd0IOwaWcqNMcESpWf4hFCXAp8Wnr0mmhtnowdnpJUppd8Az9ulZWwyJ2Uu4R
	 wkSOKrsgXyrCbsZ4Ej8dCHAUO3I/4HPgFL476eGN0P/8NbBkNtGVWoaVvzxq629JSE
	 MNyjdmuBfdWD9tp2ye9BdSsE7IZfLQ6ow1ntz6mprCCXuVX0AkCxGb50BYmQW7oBbd
	 MPaDcJNFaSVqAkwRbQfma7hfoYES0jZcC+6XyiyrsPbnOzs3CpqliBh6dejcYwxVGB
	 pQAl1sebDUlr62/dzSyXwzrWVKPVJmhKguUHvxr/r+W7Qs+BOd/D226mZ36jtpIbUb
	 BuzrSWHmpSLjQ==
Date: Wed, 2 Sep 2026 12:24:36 -0500
From: Rob Herring <robh@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <20260902172436.GB1440252-robh@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-3-vdonnefort@google.com>

On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> Keeping last-level mappings is interesting on some architectures as it
> allows mapping/unmapping pages from the kernel direct map without the
> risk of splitting blocks which, under the break-before-make rule, may
> trigger page-faults the kernel can't handle.
> 
> Add an "ll-map" property for reserved-memory regions. When set, it
> splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.

Where is this documented? Any DT property must have a schema.

Though I'm not thrilled about more flag properties. Handling all the 
combinations of properties has proven to be painful. Can this be implied 
from the compatible string instead?

Rob
