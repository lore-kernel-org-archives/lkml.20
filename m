Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1738F236;
	Thu,  1 Oct 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859736; cv=none; b=j2rGMeCOuhDcZJEcCK22VZLsKvLf+QwCE7/LP6hB6RNcizdgsCprb92TizJd9cucSldCkg/6X7wbCHkGnmTIhnLmvtJtAkev1NBRnXlEFtSsRP7LBw91gkCgLCBTTRvgaDm0ZSJkkNSH2xgg6N6WarCfNCB9ICa72IIS1bJddlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859736; c=relaxed/simple;
	bh=iKrrqFpHfYcTC/oAecNkcl5GnB3EWwTNVsYMgXOj0PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvrE24HoNYApgAuUyz4Y/MzI3qKBjpeeOn5Q9tgCymcjS+KWbKJS6iz3c2/tqn/Yt0xX/rPg+gPNW3HgoKOgB0P1OhjS+xR7/zUg1FtqBTDsn47bPvEU6W6huVkkxW4zBVHz6mCW9F4ECFsopM38Tljlvncx8KdcyhgbXVIGdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Clya+pBX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Clya+pBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499B21F000FF;
	Thu,  1 Oct 2026 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859735;
	bh=Eob7zzZfDEAxmFc2bmXm9vuF8tzUFFiSjg5xt3lkBag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Clya+pBX3URzVI8t53yWg72i2FYQIIHOBZ3IhJWsCAqJKSTT6XQYq1rDt4F3aMBba
	 r2JKUxADyaCLk93dlq93kR0Ii1+XgaR67kog+ODNq8C20K6baDKqRcS643dIssE9ZR
	 wcPO4ra5VnkFcuVlKDOprWFcg4pB6ygHrph7hAViDzf9cCuaTphdCk6Q92wkFdM1R7
	 scjlMHbQa/h3S1rMDhg4j5m11eN+37j5ZLJOGYdsQNX7QZm226rUyWLoPh2RlhOFFy
	 Wn+Z1gDIfYyX8oI1oP8IM4vwK73/Pa18tikQZLGHhjL8E99ls55cfQsPiHS938gO8P
	 GCyHCDCmKW8wg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xCGQP-00000008QoG-0bNQ;
	Thu, 01 Oct 2026 15:02:13 +0200
Date: Thu, 1 Oct 2026 15:02:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx/tve: take i2c adapter module reference
Message-ID: <ar5Z1TjIceCl-EdS@hovoldconsulting.com>
References: <20260716131937.1564892-1-johan@kernel.org>
 <anx_aEJGbFM6Xosx@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anx_aEJGbFM6Xosx@hovoldconsulting.com>

On Wed, Aug 12, 2026 at 04:12:56PM +0200, Johan Hovold wrote:
> On Thu, Jul 16, 2026 at 03:19:37PM +0200, Johan Hovold wrote:
> > The i2c subsystem currently blocks during adapter deregistration
> > whenever there are consumers holding a reference.
> > 
> > Switch to using of_get_i2c_adapter_by_node() which also takes a
> > reference to the adapter module so that an attempt to unload the module
> > while in use fails gracefully instead of blocking uninterruptibly.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Can this one be picked up for 7.3-rc1?

Again, can someone please pick this one up?

Johan
