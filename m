Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012B3DEAC4;
	Fri,  2 Oct 2026 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921276; cv=none; b=SVul2g089+zLV7uieoQMHxVE3kfi5Li5jGCTcOXC4K0kacL700JtEHlJ3DWQqwEFoAFs4nVhS/ox65ClYkaKs/FZUZD9oJCvcSQenDKNgtfMv6cplBTu/DQKlItM+gyzWtNFTXaiyaKaOwq8JUFcRwka6fURPimTAAYYA/E2DfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921276; c=relaxed/simple;
	bh=6PfaiHEs4HlDFwhDcCFf/f33wQSovpXkgCHYnyjrOIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=outcrb5sJdbA9fFgle9dKzEedZBXzuCyX75wzBjNMCDftu6oco5aN6pdjz3ZVILutsIwRZsaD8RABnGHOL9YFVqwvzGGIeoXzHw0hgVBpo5X7aEcdGrSYPEfcwz8pzIh7Y78HzxsQyP5Po4OWLGRGQz0jMe9zpwJ/wM5jVe4jQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KWoNayJY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KWoNayJY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C42F1F000FF;
	Fri,  2 Oct 2026 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790921271;
	bh=E+jEcTBWVdc0pr9HEOQgGmxayKfqyEMh+cDPpnhsUbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWoNayJYki6Iz4uYBDvGHx2+E8Q+0F0obMlsTDHl9KHNUnsgVyG5TrejZ026xzfmg
	 3ahvrplsUw0ktS7gO3RQLw9EyPnCFguJoq13YBQK4Pvz1b4XWAkCtqtgQU+KBMCzcE
	 UY5LK3EIb9z5pCFWMgI0TBBWeAYTd9AqKTAv7ifU=
Date: Fri, 2 Oct 2026 08:07:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Raiden Horner <raidenhornerdev@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: Fix no terminating newline in
 sysfs emit
Message-ID: <2026100224-drivable-silt-858e@gregkh>
References: <ar7NUjfCOwtHRTuv@arlo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar7NUjfCOwtHRTuv@arlo>

On Thu, Oct 01, 2026 at 11:14:58AM -1000, Raiden Horner wrote:
> Terminating newlines added to adhere kernel coding standards
> and reduce noise when debugging with checkpatch.
> 
> Reported by checkpatch:
> 
> WARNING: SYSFS_EMIT: return sysfs_emit(...) formats should include a terminating newline
> 
> Signed-off-by: Raiden Horner <raidenhornerdev@gmail.com>

Did you read the mailing list archives for what happened when others
sent this patch?

thanks,

greg k-h
