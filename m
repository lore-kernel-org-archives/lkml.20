Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBAA47ECDE;
	Tue,  1 Sep 2026 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255448; cv=none; b=fN06f5yAxbTykLIlutaRele5RQM8MwaDhlQSO7LD6IQlcTPUZsAjY+4gY2060zsWWzTl/Y/DvXY2Komek9c3+i53HqX6yzOtVjYobkPa+4lJD8xjG6/voRvF1od2HSMOXvB4KZjquWSmKrT2LR7HOzKmajagcDrNTLcRPO6q8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255448; c=relaxed/simple;
	bh=jjavbadHTf14+LeC1ouaYn5hq7ulL5EH4XUZNT8yWY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jvzi/zXZEO32qPk5Sw9rPwGGjJOJHperL3h4blpoR6VEOVscx6Z4/T+rNtXW3mSEroRj42dXrQWAMvyGMA6TQ3WFz0dzt0eYcswnplgJ4ZOTgDPK12q0Giakdxyv3xViWdok7mi74UCAo0C9ncZSmqMJKj7028GWqJE4BC6G1TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0r14RFPE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0r14RFPE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6C41F000E9;
	Tue,  1 Sep 2026 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255431;
	bh=6c1KQaRanR4WpvgAlQ8rpvONZW8EuIs4jmD5HxHYM0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0r14RFPEEqqpzkDbxXcBzApFtUauguB9Wg7oukydCDC1QHdDdjxfjnBWiLEZGoh7L
	 oyEg4BH+X+aQGDWGjrr+wPKRjl2uXNU8QnPRHGNo/nGZjGCRrmcb92dSozxkon6mGl
	 yyxsfd8UftvuGlpCPEH9VtiOZV3bc+hdBdkGphKU=
Date: Tue, 1 Sep 2026 11:37:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: light: fix leak of cdev->name
Message-ID: <2026090158-uplifting-proving-9fb0@gregkh>
References: <20260802060149.3803224-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802060149.3803224-1-congnt264@gmail.com>

On Sun, Aug 02, 2026 at 01:01:49PM +0700, Cong Nguyen wrote:
> gb_lights_channel_config() builds the LED classdev name with kasprintf()
> and stores it in cdev->name for every channel during the configuration
> phase, which runs before the channel is registered.
> 
> That name was only released by __gb_lights_led_unregister(), i.e. only for
> a normal LED channel that was actually registered. It was therefore leaked
> in two cases:
> 
>   - a channel that is configured but never registered, e.g.
>     channel_attr_groups_set() fails, the flash configuration fails, or a
>     later channel in the same light fails to configure and the whole light
>     is torn down; the release path calls gb_lights_channel_unregister()
>     (which returns early because the channel is not registered) and then
>     gb_lights_channel_free();
> 
>   - a flash, torch or indicator channel, whose unregister path
>     (__gb_lights_flash_led_unregister()) never releases cdev->name at all,
>     so the name leaks even on a successful teardown.
> 
> cdev->name is a configuration-phase allocation, like channel->color_name
> and channel->mode_name. Free it in gb_lights_channel_free() next to
> those, since that runs unconditionally on every teardown path, and drop
> the special case free from __gb_lights_led_unregister().
> gb_lights_channel_unregister() is only ever called from
> gb_lights_channel_release(), immediately followed by
> gb_lights_channel_free(), so the name is still released on the registered
> path and is freed exactly once.
> 
> Commit 04820da21050 ("staging: greybus: light: Release memory obtained by
> kasprintf") fixed the leak for the registered normal-LED path only; this
> covers the remaining cases.
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
> Changes in v2:
> - Add Assisted-by: tag to document AI assistance, per
>   Documentation/process/coding-assistants.rst (Greg KH).
> - No functional change.

Please see https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

sorry,

greg k-h
