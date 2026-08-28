Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814343F8B1;
	Fri, 28 Aug 2026 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919181; cv=none; b=XwQgqPOhMdnu5L+tQJxTkuG5qyHgE/+xXZAXccaV6J+CJPdgp9CQQIX6oQGKZZjYsMcFDX5dsD96yqdFXtv+bgX4hCIkVnGQ95IUnfXMaWvRpWCUzVkwv+C0iP37JF6GMA3GT0fqMtw1yoVQ8FE7ZpX6gxuICr+jkEmD1jHvcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919181; c=relaxed/simple;
	bh=6LpUvzzdOpynYPPxOJD3u8ngl/t5/97o2lTN2PuiLsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilrVwWJG3yLvaUD5R65/JzjcClyTH28Tr4SHTtiyhQ+oSdLCtDQtgUq/9kQ/N/W2Eb5XNKqVmadaXvpR/dUmclKCzSbBVS6Bq0aPlJQj4BTUDNasJ9J53TApuRRbUEtnVxr+7UyGBvEak2RfTEcCFjYVK3gbtCXCk0BdRApNR0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G4sfSSTo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G4sfSSTo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F35C1F000E9;
	Fri, 28 Aug 2026 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787919161;
	bh=nJgbnikeJJtN34fYP9Lya3Pd+XPIvf5oNJpcRa/2ggs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G4sfSSToBesswbHvhsknVjxV3m2KjumMVU2d22qmc/mUmyTRumC00KrLEgbdQZJF6
	 viXGrA8jlz0V8Q1dWVUj0TiWUO/aZ+tiiRyocw07JF1OjF5m9TtAHzzyrx/IBfxCWQ
	 JmaaCrRR2kGU3WMkTgI+W9rmvUzAjokWwC96Fh8g=
Date: Fri, 28 Aug 2026 14:10:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Peter Chen <peter.chen@kernel.org>, falemi@asu.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
Message-ID: <2026082846-antihero-unburned-b5f2@gregkh>
References: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
 <2026082817-trough-wasting-29bd@gregkh>
 <CA+0ovChRcs0scwASAKRdeZuTJS6KyA4g3JpoTA_iCEPXZK3c8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovChRcs0scwASAKRdeZuTJS6KyA4g3JpoTA_iCEPXZK3c8w@mail.gmail.com>

On Fri, Aug 28, 2026 at 04:18:32AM -0700, Farhad Alemi wrote:
> Greg,
> 
> We are not sending more emails after receiving your earlier set of
> messages. These are all some classifier backlogs.

Ah, sorry about that, some email systems are slow :)

