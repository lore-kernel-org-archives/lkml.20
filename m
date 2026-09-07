Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3C63890EE;
	Mon,  7 Sep 2026 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760068; cv=none; b=JkPXpDukbFgfck5J00gn1bNIRLUjW2b+ZJTsYJsQqrKwZ30UYrUXQKWiQoeUPrSbxKyJM5D+rgG31Phl3P5QCnAmrH76jM6WC+uldAGUMD9/8YQwcaBDnn4jnTFLyB2SzR8SIRleokGeahYQYSxWogxxeg+XaGFFpRkqdoVny0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760068; c=relaxed/simple;
	bh=4ThRzGW7IctlP8T6z3xRy9lRlyo/ONNZS/ibyFk7cj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imTP1eUlxtTawF9qrwFCA4NK1DSh3KCtr/dOWVBsHN7/0oEGYT+uh01913z/LjPIycjhe7YbkgLYiFMNywl6fDFABf10zZfCdhpvB9AVid1DRNXoSJNQ64qZy0k7C47uR5EvPRpL4uZSR6KNfJLwxGdtIPepGmS3un/NW32fS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 852CA68D07; Mon,  7 Sep 2026 07:47:34 +0200 (CEST)
Date: Mon, 7 Sep 2026 07:47:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>,
	Frank Li <Frank.li@oss.nxp.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dma-api: require checking DMA mask setup errors
Message-ID: <20260907054733.GA31481@lst.de>
References: <20260907054400.1088151-1-zhouruizhe@resnics.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907054400.1088151-1-zhouruizhe@resnics.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Sep 07, 2026 at 01:44:00PM +0800, Ruizhe Zhou wrote:
> The DMA HOWTO says dma_set_mask_and_coherent() cannot fail for
> DMA_BIT_MASK(64), and more generally for masks wider than 32 bits. It
> consequently recommends calls to discard the check for return value.
> 
> The generic direct-DMA path does accept every mask of at least 32 bits,
> but that is not an API-wide success guarantee. Backend callbacks can
> reject wider masks: ibmebus_dma_supported() and
> xen_grant_dma_supported() accept only DMA_BIT_MASK(64), so a 40-bit mask
> fails.

Please fix them as they break the very sensible API guarantees
instead of officially sanctioning this behavior.

> 
> Even DMA_BIT_MASK(64) can fail when DMA setup is unavailable or
> inconsistent. For example, dma_dummy_supported() rejects every mask.

So?  Did you actually try to understand this code or is this just dumb
agent work?

