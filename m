Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E18330B0E;
	Fri,  4 Sep 2026 07:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505507; cv=none; b=I+TWFNlOTTZEVvT9CMuumf6C/kd/KVBkZl715s2wj0QPHnXF4PS6NoouTT0CIFlOirKUAw7W8b+/9NV2bLJZhinv/r70eZOxaHmXyPBFgdztduyTshS1nYS4m2v1vvU4d/fj2xVyf2MoijSYFK9Cy8q7LbqKVhitGWKVWoytn0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505507; c=relaxed/simple;
	bh=KCXvIyL2cIQbmL9777t9JfBJ+FXnyRKRa+Z3NTsENvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJGfcNGC4PXWI2TRYLiw/vdhMvNbnrwK5n+SFeMlvkE80mNkZNm7Gd0x09haLnlX8gLv/CajhfGMnPUfbV2lkZdHd5/Cne0bHasgsZaw0a/GZ5s1OSQTDeCiygxrLbBWrr5bavPp784fbaceHXnGui8KMhjcfEoxVqKf5T+Pxws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/hjKUtV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/hjKUtV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4639C1F00A3D;
	Fri,  4 Sep 2026 07:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505506;
	bh=rxwKrWR12useymDNTecxMMH388RRO4BSqlP8WPm1/W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U/hjKUtV9RlvTobwGFrtA2YDb8x9hbipPxmIASPGH5c01vVVTSBHkX++14i4K0a7o
	 cU9uCOnACnKKTVCEZxLQg0aKsn9Sa1rdLhoYNlZ4Gx5+wVPRgKQURX4XJK0vKitAhF
	 PXpx2PfJ5aM56Y5Jgmxgh6nGZyyaeKxj/j/Gsm/YTwSRlZjMWrpV7v+MpuP7SUjTUz
	 63+KBeJCTv9/l1072fz5M6+IXZb3P76V+hrRUvtDF0Vo/h8XlSqfcVMnztCO9FqkyV
	 OCw3/5yRqZxKvriVSR5Hu6L9ZZnjILJ0jag/GLGsAG4qGdvX/jzCfh7ZQaMYS6+hiY
	 sOtFMAWvEVMLQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x2Nyx-00000006iB8-47TB;
	Fri, 04 Sep 2026 09:05:03 +0200
Date: Fri, 4 Sep 2026 09:05:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Quectel RG660QB
Message-ID: <apptn2FTjyn1bfmu@hovoldconsulting.com>
References: <20260903180029.6155-1-sebastian.sjoholm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903180029.6155-1-sebastian.sjoholm@gmail.com>

On Thu, Sep 03, 2026 at 08:00:29PM +0200, Sebastian Sjoholm wrote:
> Add support for the Quectel RG660QB 5G module (USB ID 2c7c:013d).
> The interface layout is the same as the RG650V:
> 
>   If 0: DIAG   ff/ff/30, 2 endpoints
>   If 1: NMEA   ff/00/00, 2 endpoints
>   If 2: AT     ff/00/00, 3 endpoints
>   If 3: Modem  ff/00/00, 3 endpoints
>   If 4: QMI    ff/ff/ff, 3 endpoints
> 
> Match the serial interfaces on class/subclass/protocol so that the QMI
> interface is left to qmi_wwan.
> 
>   # lsusb -v -d 2c7c:013d

> Tested with an early sample of the module on a Quectel 5G EVB connected
> over USB 3 to a Raspberry Pi 5.
> 
> Assisted-by: LLM
> Signed-off-by: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>

Applied, thanks.

Johan
