Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB334AB01;
	Tue,  1 Sep 2026 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261482; cv=none; b=eqaKAigZPKFFTCTNvm8ktCRu4CzWoGjdjejOCphixAyhexF/4XctaQ2avfCGnF2pIrJuRdS1MHPMm9+NsyzGz846MeiDCSDQgF6TsLnV39WTrQKcwWq2iAmYEWJ9uxErzq7CklOTYc70SPGT+qZ9tCEovrwBsufyneF1dZGbOZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261482; c=relaxed/simple;
	bh=y+VhXTZNS/cLl0mnyPUvv4HXwIp11IdjGtUY5C+LCgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLK8LmHxyZlQ+VSQVxsL/8YfXsOUZvXiqvs3qs+ycYj5LhDiCTtPln7K9Nd7PM8ltKTgDBanWwwT9CXFq3lymMcgpAvVDbGI7RwN5/pjJIKWij31+eH5IVuFbEWAHFaB1tWeQP+7mt2J/lSYGRU0bz2WdpOgCiZ1wF52xX5s1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVwHwVTL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVwHwVTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788261480; x=1819797480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y+VhXTZNS/cLl0mnyPUvv4HXwIp11IdjGtUY5C+LCgA=;
  b=nVwHwVTLnw1adAT+zGudflOP8i3EIJgm+H0ewAur9S7ENV3Cl4kSd1p4
   zkpHNMk9QWzu0e+jgfb+EyHy7EtiD9g51Kq6qhXh9MNtCBrMV0GpqlZu5
   U3F32FlJenutMjliG7Xy1S9PdqalhLkxZr60LPQJHeb77p03aq624v98D
   Z7xwCO5WhlngwIQ8MbgtvBK2PCxQxqIHHY1uKoRZShZmodEJTeKBZozsQ
   SK815373Lk+35qq7dod44SW8twsTHcWKjsJZm+KyCj4BGDfuK+Vkk1Cy5
   hoeqEpRoZIwfH2vGOK2XDSPaFIjlD/k9tjSZtuUgnNARNLav/v826pT+8
   A==;
X-CSE-ConnectionGUID: uz7rAA5FTvG5t1jMRdwfsA==
X-CSE-MsgGUID: Do/eH8hGQBuwjOrDaejspw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88894033"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88894033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:17:59 -0700
X-CSE-ConnectionGUID: 8ohHxd7nSOyPRgPB6gR8Gw==
X-CSE-MsgGUID: w3j0Q8TGTCum6r0ksljjvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="298958491"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2026 04:17:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E915299; Tue, 01 Sep 2026 13:17:54 +0200 (CEST)
Date: Tue, 1 Sep 2026 13:17:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/19] usb: typec: Add thunderbolt switch
Message-ID: <apa0Ypc4xpaeHTBb@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>

Hi Sven,

On Sun, Aug 30, 2026 at 10:19:20PM +0200, Sven Peter wrote:
> On Apple Silicon the USB4/Thunderbolt host router can only be brought
> up after the Type-C PHY has been configured and requires cable details
> known only to the Type-C port controller.
> 
> The existing orientation switch only forwards the cable orientation.
> The mode switch also forwards most of the required details but
> represents devices which configure or route the Type-C signal path. The
> ACIO host router is a consumer of that path and has additional ordering
> requirements: it has to be started after the PHY has been configured
> and stopped again before the PHY is disabled.
> 
> The mode switch code calls all handlers in the same order both when
> entering and leaving a mode and cannot express this reverse teardown
> order. Treating ACIO as another mode switch could therefore leave the
> NHI active after its PHY has been disabled, which can result in an
> asynchronous SError or a SoC watchdog reset.
> 
> Add a separate Thunderbolt switch which Type-C port drivers can use to
> forward the negotiated Thunderbolt or USB4 cable details and explicitly
> order host router setup and teardown around the mode switch. This is
> similar to a USB role switch: each connection has exactly one host
> router and the callback controls the lifetime of that functional
> controller instead of configuring a signal mux.

You are bypassing and duplicating things that are already supported in
the typec bus.

Your typec port driver probable does not register the partner altmode
that you need, so you just need to fix that. After that you should be
able to get the details you need simply by registering a typec bus
notifier in the thunderbolt driver. We can add a helper for that if
needed - the DRM subsystem will use the same notifier with the DP
altmode soon.

USB4 is meant to be handled as an altmode too, but it looks like it is
not supported yet - I need to check the status with that. This may
still need to be fixed, but that should not be a problem.

Thanks,

-- 
heikki
