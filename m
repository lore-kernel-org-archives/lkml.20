Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE7476699;
	Tue,  1 Sep 2026 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253487; cv=none; b=WkR4wgV1fx0pQWdWlYpmzSwwQAfIZGubaIxwDor9RDZSIWQxYD9fdFxYRQffg5hLHGpfALhOvlFgRchMew4IEqjd0qAiJk1cp7I34x5mRov71VN6OfAEWZ9nXJ5jnoohLf2zJ4uQxgHjnbaBvovERRp0NDfW+n3bdVq9yuDS71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253487; c=relaxed/simple;
	bh=x5HQxmAA8fLOqPWiGcjUafFj8wQkUmhK6xdywAwg13U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ64BponWPHsKrtsYAvNJQOzWZLnR5b9W9/lzpXx0rt91FMqDeWiE0vyjLuQUXrbe+4g3ZW7fKzWzlhO3J5RSVQdhecRQXObatAWXgPNc89l9qbGZg/7dUwZsnH5bJuBwkR8VAnk7GitXTtE8JFb95gB/X/baeChA6Jzjx0R9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8dGP2Bh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8dGP2Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788253485; x=1819789485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5HQxmAA8fLOqPWiGcjUafFj8wQkUmhK6xdywAwg13U=;
  b=W8dGP2BhWv4pDpry8NCEettNgRZrd7H7HIrSEk+375F9LA297p3xNFWe
   q5xFEREYxmCdOMPmJPOQfDxQii74ZJQowYnazOT1uRYUtE7R7mI0NMPW8
   711jssH1IXJwzzlFga2m7Q2AI2ZFXtFv2501CbubVZOQLKFVoM7L4m9LY
   kr3g+o/wSDaxSwPJ+bzSKhRYOOmdTVfn5ZwJGOEruIiYRHI3M1p3AUlE1
   d3ss1l7xovAZs0iZhjoTXIgR8pIQWFkgQ7KHXOp2UMMheBNwRMN9woWlq
   5Kn3g03634Pm1tDUjqWr3bwJamoNj6u4iVrYpS6Ecx9xzs26UjHp9Nu5J
   w==;
X-CSE-ConnectionGUID: EfyTaIW0SIqsyHnGVChlQg==
X-CSE-MsgGUID: b1kVI+HmSjSLIYwtxftUAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88603136"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88603136"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 02:04:44 -0700
X-CSE-ConnectionGUID: IBkMqBNFSIKAR7s3wZDz1w==
X-CSE-MsgGUID: /TPPfTzpR4S/wobxErPGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="264752931"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2026 02:04:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8318899; Tue, 01 Sep 2026 11:04:39 +0200 (CEST)
Date: Tue, 1 Sep 2026 11:04:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 13/19] thunderbolt: Add QUIRK_NO_DMA_PORT
Message-ID: <20260901090439.GD106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-13-44bc9348683c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-13-44bc9348683c@kernel.org>

Hi,

On Sun, Aug 30, 2026 at 10:19:31PM +0200, Sven Peter wrote:
> Apple Silicon machines load and update the host router firmware with a
> separate, proprietary mechanism and have no DMA port. Add a quirk to
> skip its initialization.

DMA port is Intel Thunderbolt 1-3 thing and not expected to found on USB4
routers. The current code should not even be trying to find it, if it does
then that's a bug that should be fixed.

USB4 router firmware upgrades use the standard operations and if those are
not supported then we just don't expose the corresponding NVMem nodes.
