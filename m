Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB747A87A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042875; cv=none; b=bXxIj/Oy/FBitu3ozcUPfiHZOhOBkt7BhS2Y6k2a9D0/MDl6aaaRZG0IgHeD8cQB6wQ8f5xJvjtbo2zaQ/G47m04HQ7Y8RfoTF+KZvmlL6WUK9Md2aaX60bsbRqml90xNWfqBLr6jZKKgmPuTaUjEXe+divPjhY8S6d4H29Elx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042875; c=relaxed/simple;
	bh=iQ+rY8z8Jq/+pnbYzLPnAju9yAlyPMvQ6jBpQUMjw8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WzvQEZM5RYnOn9bpqH03XSFnbT43t/ElTSJyjktwr13orMF+MrZ+qbakLFUiEoMIp2pkr/pNgRqP53ZJ70t0+lWC6+YFLyH1wscJpEa2hSir2NVDhQobkLEONthv4M6FQZNAcH4Mq7zOu3v1ki9gycpPXKS35BAItxg7ruHK/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=pWv5cgMh; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="pWv5cgMh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=1Z/Da8tjBuPmssFnqSACSWOammFp9bJBt4p7tvLDT04=; t=1789042873; x=1790252473; 
	b=pWv5cgMhcgboPCZU/V9ibyNk/XBAWreH+DHnLSAk+bZbilcxD1DNiiKy5hkajMonhQN0cRDVDI/
	Cewx0eTEQY3FDiO0kT1MfKUZzeYAOd9GVubxO8JmNFcef7SstuSFB7qx+BLoABxTOzDiUskrLWWeV
	4XU9OUwTGoKEBlJwmIQSObIARXWlnitJfxpGN9KSAuWIhsx4BkjHnmS5xeoEa+fkR5KVtcUMC1JA5
	aDjhPFnoG2+jmNm10lOig3aCyKK9xIE/kPfNC4pKRvFfFIFLrrfbW0i/YAaldV+jx+ye3QaTxp6kB
	qDSivg5n9sTXXWJKrooW8mme6Btq8mNc9QZg==;
Date: Thu, 10 Sep 2026 14:20:44 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 00/13] drm/bridge: tc358762: Various small fixes
Message-ID: <20260910142044.77495596@kemnade.info>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 14:27:55 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> While trying to get Raspberry Pi display v1.1 working on Beagleboard
> platforms, I noticed various small issues with the tc358762 driver.
> 
> The series also contains a patch to fix the timings in the
> powertip,ph800480t013-idf02 panel. The combination of tc358762 +
> ph800480t013 is used in the Raspberry Pi display module, so it makes
> sense to fix them together.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v4:
> - Rebased on latest upstream, fixing the minor compilation issues that it
>   brought

this sits on v7.2, not v7.3-rc
It does not apply to v7.3-rcX and newer.
Just tried to rebase my stuff for the Epson Moverio BT200 onto this
and found that this does not apply.

Regards,
Andreas
