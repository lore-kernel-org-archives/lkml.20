Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EEE372EED;
	Tue,  8 Sep 2026 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857929; cv=none; b=L8t1HhL2GF2510SAG+W9D6dAQ64UL/xipgrwhA0gE7FVKYDPDKfJ+hO6rgNY+gLOAAFbrz7UVDRSowTYNo9D5vwG2AdqCyUpjGDKuHk2QIe4Akw51b++BHA26RvKzncZGWtu76yxCvfYDA8//W3vfhauK/tAN/AAWNDNq9EBSPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857929; c=relaxed/simple;
	bh=opKn2fpMKEDc321rgycwurVdr2GvdFTV286BpXdBLHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ9LAjAtUIS7jySVnamZxcvPfhKjQq3rrcMy3AtJXOH09ZCzQPIwJy4K8w7YGXGRb3ogWFS48CSLAcuUbHqkvpkqIXITbaECP7Tgs+8ox2T2dxw3DnJle38zXxjteITImqzdXqz6Cs+c5aob/gpCopJqFzhnUiIkejMU2hD3SRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajJnaWTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajJnaWTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489BA1F00A3A;
	Tue,  8 Sep 2026 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788857911;
	bh=u2t2292GCZUYzVr38mfmWIcBx/9spVP6gVdlNV372jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ajJnaWTLXTOy4XIh63JXmpNXZ/fg+kYItJ51kpQ1KdSvjRyC2+go74QFYMZy0QVTa
	 7t59uPQuGkIuulnK4ary4D3ENEqhD8V+4DmFowO4oKdGyETzIaUBG7Iy8J3QpikZB3
	 ysg34S2YXSh+qxTIT0WAF7nZk22EbJR7XSTfbxJ5F6K+09yCa2D/Rm9w9HAEpeuD0n
	 ZHg1Qxiry90cJ0R5i5RE8erql7VZ+tG6coi+QwqlEmcD4ZwQOKJewvjFW0nme9jtQ4
	 YEW660ivmyFjl9PblnEv6ENS8fH3VEMsvUEHpLh18tfUAqSohTpquoBwsbzt78HSMD
	 XgvnojZ1ivfHQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x3rev-000000014jO-0See;
	Tue, 08 Sep 2026 10:58:29 +0200
Date: Tue, 8 Sep 2026 10:58:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Ian Lin <ian.lin@jetone.com.tw>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Compal EXC-T1 support
Message-ID: <ap_ONd3X2UY4Mi8Z@hovoldconsulting.com>
References: <20260904080046.56772-1-ian.lin@jetone.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904080046.56772-1-ian.lin@jetone.com.tw>

On Fri, Sep 04, 2026 at 04:00:46PM +0800, Ian Lin wrote:
> The Compal EXC-T1 is a Qualcomm MDM9207-based LTE modem which reports
> "EXC-x1" as its USB product string. It exposes diagnostic, modem, AT,
> and NMEA ports as vendor-specific interfaces with subclass 0x10 and
> protocols 0x01 through 0x04.
> 
> Add exact interface matches for these four ports, leaving the ff/ff/ff
> interface unbound.

> Assisted-by: Codex:GPT-5
> Signed-off-by: Ian Lin <ian.lin@jetone.com.tw>

Applied, thanks.

Johan
