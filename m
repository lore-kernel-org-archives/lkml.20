Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FDA30C637;
	Sat,  3 Oct 2026 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014225; cv=none; b=OEkWBRdrQIuPYpwgWM2VPAQRL2RwxwZzb1icHqtfP2DiAQeACfZgNikyexHZOFXt2L/rCrjUBCdrPqruC0/qB7+pZBYdePTEggpJ2HoDY9XaV1tmUFVS9qjx7QcaFNdd8O5fHohiviI1reXAiWsdlxe6xRYz8vsFznVwE3jbIy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014225; c=relaxed/simple;
	bh=mkae5vUVwJiwLlAzjAngDXxuu1DFUlhtfhBA01XKhHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhZ6dPj7x0Ph6SLT4Rj+qi14St4Omyv7yF0msvIpKH53IKKaK1ou6Oxf2hoqOc9muZG1CgR8NZ643swGgMCgNlm9ovrvTurOYgRhVh8R3vy3WEMaNrlyVHfjPFy8wdB57wExWKBg5vku2kULa0HUKNtHhdLUCQHbTw0w0Vz/6ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TajqsWS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TajqsWS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72181F0089B;
	Sat,  3 Oct 2026 07:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791014223;
	bh=Z0WMiMIxCqAL5ti8PvjNtoyMiefDqHFyUEpLj5zAu2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TajqsWS7kXsUEPfCysWqHsNgUWq40sanxL4xpo32MbO+CIKLG7zzaA+Je1K8Y3vST
	 8XXpFEuTc9P34O7MA9+kEdFS6NAO1CtBcmzn+TO+H//+MhPwCzNWyb8Y1HxAa0ksK1
	 8dO88lXFB5o4J/6yrN3I0i3GARA0R/UUmeg5FvfXxvtewThTlRN+200YURckSoX/3V
	 Pb24yu54VHRmjtUsg+f8eRvE6HQ/hg0q41DEeGxYW2Mrcuua2Y6B52i5+JxklHJ8hp
	 2LaxgxqQXxcqjxnI5PFZwRxDA7pn0cmqzE9ADP6Hn+UPssDN6NO7MicF9d43/LYNAK
	 yj3p2UJPeSSoA==
Date: Sat, 3 Oct 2026 09:56:59 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soundwire: Add a helper function to indicate a
 device will detach
Message-ID: <asC1SwHb4DZkJ4Pr@parshuram>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
 <20260831140157.1736905-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831140157.1736905-2-ckeepax@opensource.cirrus.com>

On 31-08-26, 15:01, Charles Keepax wrote:
> SoundWire devices will sometimes need to reset themselves,
> typical times might include when taking over the device to ensure
> a consistent state or after downloading a firmware update to boot
> into the new version. Often such a reset will also result in the
> device detaching from the SoundWire bus, in this case the driver
> has to be careful. Naively calling sdw_slave_wait_for_init()
> after doing the reset could immediately succeed if the bus hasn't
> seen the detach yet, causing the driver to proceed attempting
> to communicate with the device whilst it is detached.
> 
> Add a helper function that a driver can call to indicate it is
> about to initiate an action that will cause the device to detach
> from the bus. This will reinit the completions in the peripheral
> for device attach, ensuring that the next sdw_slave_wait_for_init()
> will not complete before the detach has been seen by the core.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
