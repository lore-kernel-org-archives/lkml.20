Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B90839E184;
	Wed,  9 Sep 2026 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981557; cv=none; b=S2EcEVY/nGm/zrFYjZ/MP3qSYBVFdf8nI3BvQJUbDlrznKiDIc8hBbF2ndIZaK0tax8roChuNHy/fBeUxOzkZJONdX7IzYrDDV7djAYWDOSn8OckS+/uCLbXUQmvtfaryX3zGNQzY0WMJya0YN6mSxElGTAOLA8RmsvGp5f8wgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981557; c=relaxed/simple;
	bh=XU4wURfmD7yB2nyvojAw8YPiNGBpe+0TBpaJJ9lnQFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J937pGuEM+Emz806K7ollvlgV2wsXl5g4UjIlT91bpSa8VI++jGvptYXpDZN9dU3IxH88ljyIRVy50bXh5/iPpby6ZQoHeYE2A3lAZTWH3yXFLR+hS0HL08+YXeCg3j5hlGcutqTnwXUT6NW4EjePSkNM1Modsl4+isRLBhwR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=M2S3MVS6; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="M2S3MVS6"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 290D220B62;
	Wed,  9 Sep 2026 21:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788981205;
	bh=VHgUijc5vPlHoNasDHjsFJ3kz5HjmE2t49kAvqhiWGI=; h=From:To:Subject;
	b=M2S3MVS6V9Zk0gJ0Rsy9dth6sRa0veNstdOq5lQXRtTIoUd/3itXFBF0culKlWDlL
	 Fgqa1g+sZTO0CzSWGqZp1S1F5BwaNNZAuaC1PIXtcJZx+NcxsKQ9ISSc9ixWpZVmet
	 O6yAWe0dS7BobfYaLylHFo9zkZol5Ih2LMPZOps0EPgTsB6haCQ2WbWeXDpKKsroj/
	 u/aqarnGajx3VXWN9+tLoukIClg6AWRz/oNFKU2bevVtVs/o8C3HLLj76pI7N4j1kX
	 vX/UGS149sdZuK/yBspL5QbiuCUt6mD6Hi7WC6nXIAIimc1HM7TFYAhr+43WIb4mQW
	 1AhwjhPMngpew==
Date: Wed, 9 Sep 2026 21:13:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: u-kumar1@ti.com, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	leonardo.costa@toradex.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <20260909191321.GA23582@francesco-nb>
References: <20260909181332.1081552-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909181332.1081552-1-leoreis.costa@gmail.com>

On Wed, Sep 09, 2026 at 03:12:09PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>

