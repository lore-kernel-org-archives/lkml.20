Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035344CEE59;
	Thu, 17 Sep 2026 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642763; cv=none; b=lJfRqlAFYrZm2Xiew0q9K+sPPhhVpSppmlKAq1LfoXhTGT6TD5GO6O5hN3VpOpfxk6clMwzPj6YcETl0Iokrf7Pzs2BoFa3JS2HDGn0KvhVABY6xVPbFqUQMWUTOpVSlcG5Nb3x/q60qOg14HD9461SB2fqkr3lWgUsZc21BDTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642763; c=relaxed/simple;
	bh=CHGV4JYlQV7akQZQcx72HkUsV2pU8Q4RRKrijUBPgOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3yeoqscNLL44UyWY0vbvgD/1pi0RJuM1sx43RIPvWlmoJf7ncvdcg7uNJJ9QIv3SxmVeA467HelZHRokb2bgsB7GxR5njKwO7AoGmUyALwZmP6g4rB+teuzlSQCIWMDzmyQaoBmQl4Tfrs0bWUbuIryeFiP+A3+GXbZaQngexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0EEFDum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0EEFDum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C4D1F000FF;
	Thu, 17 Sep 2026 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642753;
	bh=1zF2k/1AehTFbSxmRgz0xYeOXP0/eZLM3SXpAvN1Vqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M0EEFDumKF85IWdtgeR1Dq0CpMU/JhVBYIcgwI2VU2Cekv+gsFXHwlVQefS1+8JnY
	 Z2PiOVLgV1Lj6YSw4pGUbGVMVgZPg/ukXl36tL/HyzdSTZ5HeYCXysL8En8QgQGIL5
	 USBA6IfecTHcgBtLuhg8Af05IopRrnE5mm8NUlVyW3Q6SpLeQdw7ug63swCq4pfnTH
	 r6dJJpJ+kEpNoWaJLDn+vV960wFu6qA//lRFQHnqWVMwPJYHauId4ZTSk6VD43luPa
	 31kbgiPdKizDMFFJ9hhpJtKu/rBvOVKqAHi9XkF0pJfVSYwhuma0dpL5aOf/pD2zBm
	 v2IRCOF8UumyA==
Date: Thu, 17 Sep 2026 11:59:08 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add SoundWire detach helper
Message-ID: <20260917105908.GI1605367@google.com>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>

On Mon, 31 Aug 2026, Charles Keepax wrote:

> Currently, if a SoundWire driver takes an action that causes the device
> to detach from the bus it needs to be careful. There will be a period of
> time until the detach is recognised by the core, if the driver
> immediately
> calls sdw_slave_wait_for_init() it is possible for that to complete
> before the detach has been recognised. Leaving the driver with a device
> that is potentially not ready for what follows.
> 
> To avoid this race add a new helper that drivers can use to inform the
> core the device will detach. This clears the enumeration completions
> ensuring that sdw_slave_wait_for_init() can't complete until the device
> re-attaches.
> 
> This is the third part of a longer series of moving these slave
> attach/deatach operations into the core:
> 
> https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
> https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/
> 
> I have based this series off Vinod's soundwire tree as that probably
> makes sense for which tree to take it through.
> 
> Thanks,
> Charles
> 
> Changes since v1:
>  - Correct kerneldoc
> 
> Charles Keepax (2):
>   soundwire: Add a helper function to indicate a device will detach
>   mfd: cs42l43: Move to core detach helper
> 
>  drivers/mfd/cs42l43-sdw.c     |  2 --
>  drivers/mfd/cs42l43.c         | 15 +--------------
>  drivers/soundwire/bus.h       |  6 ------
>  include/linux/mfd/cs42l43.h   |  1 -
>  include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
>  5 files changed, 27 insertions(+), 23 deletions(-)

I can take the set with a Soundwire Ack.

-- 
Lee Jones
