Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924311;
	b=Xv08jH2XY79WKSNyQftLgG5FN31TXOGc+6XlLZlu6gm/yqRhwlZknpkiHFCAZljkXE3u
	 Nxnw59hj8gDYaAOVP2K051TKyzCXK4xdqn3biypV2K65FpRSVocdpK0tCOzSzaiGJMmNI
	 0s93S1A1pMdku6XwAhGF3JZ9R7qfaTRgdx8gw8+ZKdpwTC9sOmsgtRsC1lT10nW94HKm6
	 QeoIALCZjoUaqtAgLLM3wPsZEBK5wllCe1HMITpgnww2EQjI3wTuyvFRGzuCRcyCRg+Zk
	 djqAHUQOYVidCDR+NWULZkx/pbqK0FJofE5VMwT4zSctx1w3RkganpUtT+mVOH1d2Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924311;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tNVVhXe4dHXqs9prx7RbRtYOvhfrplBbNblNuIByhIY=;
	b=tN+besngFGHt5f+Dg4MmGf+y1Cl+EQ9gOOeHiIhSHqU8HEGihOo88myuTLwPEpSJmhvp
	 VIliDpphchyLbNVFpSfplNwLfMnQxsrnbWS85quy2QRsv6O14P644yMR6YVtgrsqEXLHz
	 zDxPtz9JKtBaCSF1pG1ypnOHR4wteAFSGTAEvdWaMMk6TVxklQF/VTQe2CX+PcqdugHAu
	 +eoxl+fy+PKR8CH36T0QZYUgL6k7rv6zJa7JEtPdPSfpwUWTVhhrohG+tP/b9ihbHeojA
	 BbZeZAhPiZ9QxzpDI487EO2reKlZPWVKDOXSnA630oj9biAdGMZmDj9qrAMnSM3ObnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CeZ0fAH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF50606A334;
	Tue, 17 Nov 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CeZ0fAH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CFC1F000C6;
	Tue, 17 Nov 2026 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924311;
	bh=tNVVhXe4dHXqs9prx7RbRtYOvhfrplBbNblNuIByhIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CeZ0fAH6UD1kRvnWvsdXuJqwp66ZYP/NGMl0gxvL3T1mlXpa/ezUSxFVdNgPKhBxy
	 xXTbtGLEmoAM+gEkjikrl1svEywIXW79Nwnw34duGQXJR3XXGr5iWcNMAEATIHA2qN
	 ZQ+GKtkKImRfaCYbnXgT04fWrZ5qj5tnTlXeLMU0f2xdF5WoddylgoRct6QkxsfSU7
	 Bqd5qx8jVim+5OwTmSGlJ3HdyB2SHtTo8XFmxbso6I08z0+PMX/LmjAQ3PHFK2mEmz
	 X9cJOxWg46nolHXDR2jWmuyrIU5n+dY+/js8BXNtyEfMEF0zAEpAGcJnMQBxcvWn2k
	 CWVS3EUFfIebQ==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xTJo5-00000004NHJ-0F7a;
	Tue, 17 Nov 2026 15:05:09 +0100
Date: Tue, 17 Nov 2026 15:05:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Craig Hesling <craig@hesling.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	leStoppe <lestoppe@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking
 VDS1022
Message-ID: <avxfFRBXbdhs66cC@hovoldconsulting.com>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
 <9970fa09ce5e1b468e473bc1e4bbe7d7802808e8.camel@hesling.com>
 <20261103022311.1011677-1-huangwei@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103022311.1011677-1-huangwei@kylinos.cn>

On Tue, Nov 03, 2026 at 10:23:11AM +0800, Huang Wei wrote:
> Hi Craig,
> 
> Thanks for the additional data points - and for the comprehensive
> descriptor table. This changes the picture significantly.
> 
> The VDS1022I reporting (5, 0, 0) - the same tuple as the HDS200 -
> means the full-tuple match in my v2 doesn't actually solve the
> problem it was designed for. It would:
> 
>   - correctly claim the HDS200 (which wants serial)
>   - incorrectly claim the VDS1022I (which needs libusb, same
>     florentbr tooling as the VDS1022)
> 
> So the interface tuple is not a reliable discriminator for this
> VID:PID - OWON reuses the same tuples across device families with
> different userspace needs. That undermines any approach based on
> narrowing the match at the interface level.
> 
> Given this, I think the options are:
> 
>   1. Keep the original broad USB_DEVICE() match, accepting that
>      VDS1022/VDS1022I users need to blacklist the driver (this was
>      the status quo before my patches, and users have workarounds)
> 
>   2. Remove the owon entry entirely and have HDS200 users move to
>      libusb as well (uniform but breaks existing serial users)
> 
>   3. Find a different discriminator (bcdDevice, string descriptors)
>      - but these seem equally unlikely to be reliable given OWON's
>      firmware practices
> 
> Johan - given that the interface-level narrowing doesn't work,
> what's your preference? Should we revert to the original match and
> document the libusb incompatibility, or is there another approach?

As there apparently are now users of the in-kernel driver and libusb has
a mechanism for unbinding kernel drivers when userspace wants to handle
a device itself, my preference is option 1.

I've tried to skim these threads and IIUC the only issue here is that
some java-wrapper around libusb doesn't provide the unbind mechanism?

For the cases where the userspace driver does not unbind the driver
itself, users are currently already using a udev rule to unbind the
driver (or they use module blacklisting). And they probably already have
udev rules to set up permissions.

And there should be nothing preventing a userspace application from
using the tty interface even if a device does not speak SCPI, right?

Johan
