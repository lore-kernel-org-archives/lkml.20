Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFED50C2BD;
	Wed, 14 Oct 2026 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992726; cv=none; b=WLTvL0Es2Uywqw6SKPXwUjT6VejKDGLP5LEIstFpHW0BpeMUedpDotBV0ICtromdLC/Xjs2ijGosUUASco3r06muFIAwMMO3Wc3wyTzdtZOpH5J+8azB7r3A43NabblUIVcWlq+RY/EgY+iMzNVHE30MsOBv0E5a6MkvuM0kzSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992726; c=relaxed/simple;
	bh=R+ukTzmLbnPFNE5OJ0y8SEeHvT4kuxP/6O5+1VooLwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVCaTcI8Aa/EPIO2dyDLO0NCU24jGGFKPLSmCx9/0QELR007nsVStkVmCmU0P9cyqDk86AcHZ9tMNt9wrSXtkAtMfDhSkZm5XBRY0+jWUzyauQYqXy1tfnysgSBXCHZMSwAKg/Eo8gAEp+q8CJ735mphRo0L2Es7VpF4xb3pD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zGxcBKyA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zGxcBKyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416691F000C4;
	Wed, 14 Oct 2026 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791992724;
	bh=4N3/SfAmFRViFWazATLvErJNHUxEQ8iCvSfoJhR/1Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zGxcBKyAs00jWBadcoxo7r06oEISgiNsC+v6cpHbZIZ8PcJFR1Q+viLDHbIlSPu3o
	 IxSkXcpK1U2IJZvHARm6MiL1FgzTx7OuhtUIFJfbbMUvhY6mXPXSdmeQWbfV9ufKqO
	 CPv1geZ4rfYCjg/T/ZU83VJoVgz7OFG4/AoxHACA=
Date: Wed, 14 Oct 2026 17:45:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rishik Yechuri <epicrishik@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: Re: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header
 macros with generic helpers
Message-ID: <2026101402-spotter-stitch-056b@gregkh>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>

On Tue, Oct 13, 2026 at 03:15:28PM -0500, Rishik Yechuri wrote:
> The rtl8723bs driver has its own set of macros and inline functions in
> wifi.h for working with 802.11 frame headers. They access the header
> through hardcoded byte offsets and pointer casts, and they duplicate
> struct ieee80211_hdr and the helpers in <linux/ieee80211.h> that
> mac80211, cfg80211 and other wireless drivers already use.
> 
> This series switches the driver over to the generic versions and
> deletes the private ones from wifi.h. Each patch converts one group of
> macros and removes their definitions once nothing uses them anymore,
> so the driver builds after every patch.
> 
>   Patches 1 to 3 convert header address access and the Frame Control
>   flag checks and updates.
> 
>   Patches 4 and 5 convert the frame type and subtype checks. Single
>   comparisons use the ieee80211_is_*() helpers, and switch statements
>   mask frame_control with IEEE80211_FCTL_* and use IEEE80211_STYPE_*
>   case labels, the same way mac80211 does.
> 
>   Patch 6 removes an unused struct member. Its initialisers were the
>   last users of a few private subtype constants that have no generic
>   equivalent.
> 
>   Patch 7 converts the frame subtype setter and removes the private
>   WIFI_* frame type enum.
> 
>   Patches 8 and 9 convert the Sequence Control, Duration/ID and QoS
>   Control fields.
> 
>   Patch 10 replaces the driver's destination and source address
>   helpers with ieee80211_get_DA() and ieee80211_get_SA().
> 
> None of this should change behaviour. In the few places where a
> generic helper checks more than the code it replaces, or where the old
> macro kept bits that a plain assignment would overwrite, the commit
> message explains why the result is the same.
> 
> Compile tested with W=1 after each patch, and checked with checkpatch
> and smatch. I don't have a device with this chip, so it has not been
> tested on hardware.

Did you forget the assisted-by tag for this series or did you really do
this "by hand"?

thanks,

greg k-h
