Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45548322B8F;
	Thu, 15 Oct 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057875; cv=none; b=FZ7MlFsrhG2mgVU6dzztm0lP5vxpFQTgFzTuftMAS5dYJ13+rms9NjdEBWxzwxnwpoogd8cGhX+nW4LYM4FfT9NmERBTqPAFF/riISs6LERd6vj+U4NFkk2c+GqNSEa9BFtNqCXKEZh3NgB/Xb6lJVIfmJnKhSnTBJkW1wazawo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057875; c=relaxed/simple;
	bh=muwCLVxPr3lu2PYo+nyQS5gG+tKhi8xOCj4xL309a+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs1+Ow3KlmSyhAjHFkDiGOsW4qgUOw0QnhAOM69GgwIMYYaF/nD+NzFqOCdVW9pGg0W25sfbQ6k7HXSsp9tNb9jHEIgiLRvu92jRLXYsedTcxwqYyTRwdeEE7Zvs6MFIfjICqzy4Y2HuGPhzImpugwCX6Jc15MlCiBE/1j1KjcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGuNGhUX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGuNGhUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66E81F000C4;
	Thu, 15 Oct 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057872;
	bh=6EimAlhipM/QvHYdXcrEyjUEVG6Xm+Hd234W5MqbFJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lGuNGhUXYGNT8rfxdEATidMUz1+wRE211/U6+2f0Q9FCk+UCGR13IPaYdSsl8BWpv
	 cSjSfzJKyZ59LL8/iE7bOy5AqaM6KhZTh/mXaT/SSmlmDxRbLw4JiipeApqd9TMJDp
	 7G9SqO/ZoEzo7S79VSNKl3G3hUi9h4fawiLMq6LLatpSI2paosVTNxBlSF4PDfKoWh
	 v1bl0851TyWRlJj7SY6kOHwmRl2f0qTmBrC0jGR4NN9XcrBsyTtRvCZIYjss1x5lI0
	 kw/gUbq8PmoOvMOlOq4UpBhrp6XIudByLSKTOFIg1nPbou/Z6WYnTgJh98tmLT8gJi
	 cQeUB2jvMFSEg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xHI7C-00000006E9X-2a5D;
	Thu, 15 Oct 2026 11:51:10 +0200
Date: Thu, 15 Oct 2026 11:51:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] USB: serial: mxuport: add MUX50U support and
 updates
Message-ID: <atCiDvHBI7F3SCoZ@hovoldconsulting.com>
References: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>

On Tue, Aug 11, 2026 at 02:04:55PM +0800, Crescent Hsieh wrote:
> This series updates the mxuport driver to support MUX50U-based devices
> and fixes device-specific runtime behaviours.
> 
> The first three patches clean up the USB device ID table and firmware
> version handling, and add support for UPort G2 and Platform UART
> devices. The device family is encoded in the USB device ID table so
> that the table provides both the port count and the information needed
> for firmware handling.
> 
> The fourth patch adds optional callbacks to the generic USB-serial
> write path so that drivers can stop write submission based on
> device-specific state and restore that state if URB submission fails.
> 
> The fifth patch uses these callbacks to implement the per-port
> SEND_NEXT transmit flow-control protocol without duplicating the
> generic write implementation.
> 
> The sixth patch adds RS485 mode configuration through the standard
> TIOCSRS485/TIOCGRS485 interface.
> 
> ---
> Changes in v3:
>   - [PATCH v3 1/6]:
>     Rename the existing PID definitions after their corresponding
>     products and introduce a helper to keep each USB device ID table
>     entry on one line.
>   - [PATCH v3 2/6]:
>     Rename the firmware-version composition helper and retain the
>     existing firmware image-size validation.
>   - [PATCH v3 3/6]:
>     Name the new PID definitions after their corresponding products,
>     list all supported products by device family, rename the family
>     definitions to describe device rather than firmware families, and
>     use BIT() for the nonzero family values.
>   - [PATCH v3 4/6] and [PATCH v3 5/6]:
>     Replace the mxuport-specific copies of the generic write path with
>     optional write_ready() and write_rollback() callbacks. Use the
>     callbacks to pause SEND_NEXT writes and restore the per-port state
>     if URB submission fails. Expand the SEND_NEXT commit message to
>     describe the per-port protocol.

Again, sorry about the late feedback on this one.

Now applied for 7.4 with two whitespace amendments.

It was a joy to review, excellent work.

Johan
