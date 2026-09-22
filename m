Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E90354DACC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089395; cv=none; b=XNchTRJqeOQWtB/eL9XmwDqgj29S+/AcwpWp5E3qiVLA1lsDDuIyDfc50ibCsCc5MCCj7+MqtRlCsDb/en3jp1u3apqmn8ZHy8v+7IoVBuzMyfRfg3FaIVTrPQ6lphGig8k9NxKMzSw2jccIraslhWTs1OMIHqJwvYRq2igx9wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089395; c=relaxed/simple;
	bh=isquwl5CLhFLN7ozAphvj+8cMZ5Bb55Yo6KLyJJWJ4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IX5hIwYDOy+S2PuRF+V9wu+inSqzDoEr+6Z59rnWP1lZYOfaMT4Ly/2Cww1Y5OZXkY9cGg6WPI3Ur5sZvkolzUx0yGZ+FJJ6M0INKyxqqL+zYtE07JIiMsEurang66rof3v9G9yt9NSa/gVXnvPLdzEireoywsqQJumpKY5V1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZ3zyDH0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZ3zyDH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803D41F000FF;
	Tue, 22 Sep 2026 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089393;
	bh=jW1+HL8hu28GYqAU+8E261fdvTixUT97QQj1kRHk8do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iZ3zyDH0H9INvJD2n/v0Io2cIJ6At+ZMvQPujniHZQpVLtMhWHTygHzCeEiVTqBBu
	 eMXDwtZSf5XkejQ9/F4gwwFe37E+DdNXT5GbDAz5f1J71zkFegkVEs9IP02yGNoyRL
	 Qap7nRUQYK2s/Cup0YhS9ao417gzT0BLwF5+W0jp0HyXVqEBLP6ks8OASurHFjSvV3
	 Y2sfEdGbW0fvlNJEhYqW3VlQ6FcoeSQEaw9igmpB9OWXLe8uSTDS4OK7/a9z4+wyb3
	 oCz4ujE+do/sxhtuCFdRNAi7biBwy/0CwMuWXGWax7BuHW0u3RFouKtl0zLp3DIWr8
	 mnntkkhJj4Slg==
Date: Tue, 22 Sep 2026 09:03:12 -0600
From: Keith Busch <kbusch@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme: use assign_bit() where applicable
Message-ID: <arKYsPBTYdYBVbpV@kbusch-mbp>
References: <20260919130820.3041544-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919130820.3041544-1-peng.fan@oss.nxp.com>

On Sat, Sep 19, 2026 at 09:08:19PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Thanks, applied to nvme-7.4.
