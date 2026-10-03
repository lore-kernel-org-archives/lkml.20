Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CA30C637;
	Sat,  3 Oct 2026 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014293; cv=none; b=e3U6NziTB7ZC0GhI+4wsM+AWnP9TF4pbTLnWBfgXZuXlwApyxZ5zJUN69rIH1hFfoxA8viKg673Obr53yimXpZXRM2o6fpPOo4hnqKAiGHp181H2rgOQ/SQXBwylL7nGuPuRtkY3gvyrbYSF5OBeQ6+nGCdaLLTfsNOizJNo/cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014293; c=relaxed/simple;
	bh=puoH+QTT3MaZ8XLgWHQ9NrMdNDxG5dZSsMX2z93D/xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBwY4BkmxiEoP25ZUlN/Yc8fDtA1qPa60b7x1hdi8ggT4+E2dhVk3vEL0NdjO7aIaAZGoZLqc1b10S3ACZLsu8Rh8ldbASRgijzM4/4wHkzWr7Wg7uFcxoSbkjtIm60AuU/+97L76m9eNnZjaB/vo3C/RYSscjzUrMCHj0+Cgts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9sEqvP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9sEqvP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCE31F0089B;
	Sat,  3 Oct 2026 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791014292;
	bh=eExjwPjav3AtBbLKKQwm8S2T96CCl0YaClkxVcB7F64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F9sEqvP6Jt5cYmnf6zgi2P1pLqeEDqD1KaIHH1xYqMfSCoCFh2JrTQ3NygDviKtXi
	 lLtOpTqIoULxDz/2cf9oKPukxkzFs/mhmfM8hUgoygTFF6cLpDRMtxMXvbCJFDZGL8
	 Ip/btnqaKApx1osKrEV1P4eio0Ik66qXW7MJ5IcAB+emYLXhaIel6qjYf3azjr5wRT
	 TdG/jvU2N91CmADcecIrE1D+AT+oLt9sIkJBQLkSb036QRVILif1C5CPmRYqRhWW3w
	 7bFTwHfi8bhrhsJJu8jClCVLBHqT5cpUvdfX06uEFkfDXP91KBcPxF+yAKIHldv26M
	 l6k/IdNiFfgtA==
Date: Sat, 3 Oct 2026 09:58:08 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add SoundWire detach helper
Message-ID: <asC1kM-aOjl0GYYx@parshuram>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
 <20260917105908.GI1605367@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917105908.GI1605367@google.com>

On 17-09-26, 11:59, Lee Jones wrote:
> On Mon, 31 Aug 2026, Charles Keepax wrote:
> 
> > Currently, if a SoundWire driver takes an action that causes the device
> > to detach from the bus it needs to be careful. There will be a period of
> > time until the detach is recognised by the core, if the driver
> > immediately
> > calls sdw_slave_wait_for_init() it is possible for that to complete
> > before the detach has been recognised. Leaving the driver with a device
> > that is potentially not ready for what follows.
> > 
> > To avoid this race add a new helper that drivers can use to inform the
> > core the device will detach. This clears the enumeration completions
> > ensuring that sdw_slave_wait_for_init() can't complete until the device
> > re-attaches.
> > 
> > This is the third part of a longer series of moving these slave
> > attach/deatach operations into the core:
> > 
> > https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
> > https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/
> > 
> > I have based this series off Vinod's soundwire tree as that probably
> > makes sense for which tree to take it through.

...

> I can take the set with a Soundwire Ack.

Looks like there are dependency, you can ack the mfd parts or if it
works pick both :-)

-- 
~Vinod
