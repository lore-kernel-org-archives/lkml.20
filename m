Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971477;
	b=U+aAMJNuLqGLQSfekNXofprwRTsXr9Z3PjbmQirDIdr3UclEgLWPXbU7d2WhOGsxrofa
	 mZ7wRHo+ku2Y47DKdbbBlzsiuVz68DmIKz8deLtk6J26QRWnZOO0a+Y3R+tJMyg1G7z+M
	 LXdgLbe0rulQG1QHCSnrrculWazAvXAU+TNwqWmt/2FminI454FCXMd3PwdK09ibkOXLX
	 F0GyDu5TZmk9GU/4sa14qwyaRN189VE7wFPpjb+v3p0ltfH7eE7Yh1f14cmJW9tZEvyA8
	 AgIJif5NBMNpqH3AMM/wsgX4FxhqMAzBbQpHUDXBTgrFD2QqU9sGinM+PtduF+Ckm6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971477;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/j407pFFl2ICWto2yvFJdFRo1hJLCtsbM0PDUwpDaXo=;
	b=CBv3Tou7QmDrTyebumZhKu0quoMJXoiuhwh17aFkgVxRhKFrAp+Hwc6cS8NKVILNKD1O
	 hSLYPewuGuBATB8bEgUEP6vYm63F5xy/7GS7T3n10cunDhAD0psXLWF+DpIbIOOnmhPxb
	 +BptJRgV3R4mVlQwgSzea7vZFHxdEZRdD0sdv3crrWKJiqIM9omnGP3MzFnPUFbzTJpIE
	 4ni7nUzCl6G215XSiRFAkp4Zc9mWAmhTL+2o7XiXE+VqgHwu5jvqU+KU3mTLgeRxQJN2d
	 usHHWrTTe44ZYqLEO09K27nX5tfCtnNjVNDKxICt1Wwt1IFroYf+NMPr3u2Uurmk/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXQQYmsg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88B4606A32C;
	Fri,  6 Nov 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXQQYmsg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A101F008A1;
	Fri,  6 Nov 2026 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971476;
	bh=/j407pFFl2ICWto2yvFJdFRo1hJLCtsbM0PDUwpDaXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oXQQYmsgnLmStFJTl0HH3An1UWye77GPwtSlmUBxIPEBGdNMjGV93Y3kMfIaBdLuE
	 cx4Qn9d1VpxU+A0sJ9X5BzlEgT1180mRgzhHv507PoR/XkmLfjuG+GVBq577JptJtx
	 mxRikDFTSoYQsFi6M/bFwPoPQT1ggW7OfHU1zgn5DxmRNOurUJuIxCkRiuygJtp35Q
	 MmNHMQybxPxwxRmlyHyNUcod9ZfePBMKeRQI2TWvLiqcXLAHu3GB8zGlEu6GQIUX7/
	 5GSF+s/Q57Lo02/GXZazEvBYT662J4K/ABorg6P1UDU7rDvW+MbeA3taednXuuD6jN
	 JRsE1evm/ZymA==
Date: Fri, 6 Nov 2026 07:24:32 -0600
From: Rob Herring <robh@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	Grant Likely <grant.likely@linaro.org>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	David Daney <david.daney@cavium.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
Message-ID: <20261106132432.GA2551143-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261105124030.GA1449284-robh@kernel.org>
 <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai>
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
In-Reply-To: <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai>

On Thu, Nov 05, 2026 at 06:11:14PM -0800, Abdurrahman Hussain wrote:
> On Thu, Nov 05, 2026 at 06:40:30AM -0600, Rob Herring wrote:
> > I'd rather have my added device working than refusing to probe because
> > some arbitrary device index couldn't be used. There may be some user
> > that has a working system today and then this change would break them.
> > We can't really have that. I view aliases as a request, not a
> > requirement. It's perfectly valid for an OS to just ignore them
> > completely.
> >
> > I have no issue if we make the failure to use an alias louder, but I
> > guess that's not your main issue.
> 
> OK. I'll drop that from overlay-notes.rst.
> 
> Watchdog and rtc already treat an alias as a request: they try the
> aliased id and take a dynamic one if it is in use. The subsystems that
> fail are the ones that keep their dynamic range clear of boot-time aliases,
> which they cannot do for an overlay applied later: i2c, i3c, spi and
> mmc. On x86/ACPI and other systems booting without a base DT there are
> no boot-time aliases at all, so that range is empty and dynamic
> numbering starts at 0, right where overlay aliases would land.
> 
> Would you like v9 to give those four the same fallback, with a warning,
> so the behaviour is consistent across subsystems? For i2c, the alias
> lookup would move into i2c_allocate_adapter_id(), so i2c_add_adapter()
> just sets nr = -1:

What I would like is aliases are not supported in overlays (applied 
after boot).

Don't we already have consistent naming on hotpluggable devices such as 
network adapters? All that is solved in userspace. Why do we need DT to 
solve this here?

Rob
