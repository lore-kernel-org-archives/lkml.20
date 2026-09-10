Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F384A0938;
	Thu, 10 Sep 2026 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052783; cv=none; b=N86/JIksKf5DPtiOxKZozyAQrVrl8KLMMbHEmuYCuzBC84acogC5EvGE71VMVOYJgp5H5a53YUUb80BY5j73hcqIXICVZQJW4QtA8HkL2knEms157P5uM/Xi4HKQcUoIhDhnV0TKb+3PyuQB1V78V+JgpPdMDA7WkvkB2clOtXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052783; c=relaxed/simple;
	bh=YTL/L0Itj+cl9Acg/S9H10KZtg/+4tGA6//3qw0ri4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+UzJicOu5WFyXg8XXjg2Kz4/W2V5ER7+IpxVC34fMuGm1+yjJhFgU2lHSe5o54LYdbegtuHMaCUWNzT4t3Kwswfe6UHDg/XM9f1SFrW+BfkV2qYLMRjUiUQUdSVTQTZITW6C3cCdqncZg/HoX15hub5/bquzd1owH3sJNFMJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IeVnbC7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IeVnbC7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C651F000FF;
	Thu, 10 Sep 2026 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789052777;
	bh=twqHB2sSjyRayKyZEYerIYKyvTil6EVw6/BmOMMck6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IeVnbC7AJwprYTf6t2/ugFBEtKwKViK5asM1yNgZkibHDsCcjQ4vUpcEizaiqPOcD
	 zNxKDjUPQLKlruFwaHTMJAX3laUuP/pPpQgbk5wYU97jawwVdU3fY/m4ytY/R9jXKQ
	 nxNDfXmzOkeAMYtBpODpd6G6jeTtLnjTkNu8zm6I=
Date: Thu, 10 Sep 2026 17:06:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH v6 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Message-ID: <2026091051-gizzard-sandbar-0e24@gregkh>
References: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>

On Wed, Aug 26, 2026 at 12:52:56PM +0200, Sasha Finkelstein wrote:
> Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
> variant that wraps the tps6598x core register set with a SPMI based
> regmap-like protocol, first appearing in Apple M3 devices. This series
> first makes the core parts bus-agnostic, and then adds the new SPMI
> interface as a custom regmap implementation.
> 
> To simplify the merge strategy, the device tree entries will be sent
> in a future patch series.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v6:
> - Fix rebase issues
> - Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Can you please rebase again against the usb-testing branch?  Patch 2/3
doesn't apply :(

thanks,

greg k-h
