Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882433;
	b=NuDGHjbYcJE0weTg4vvDypwvxzDSpnqQh97pk6XAScAGBrdiH1ofFB+WDGMhLCZIBbEw
	 lO3vURuDqC7DqEzZJMWWZoyzSL6KeuyhiZCH27d07G8PBMgkNUAOkpgtTVbuou2i1RY/I
	 i0frjvXsdbdRn+SQWh9o8BeVQ0IOCTjmE1MiezHwP3ilDCqbWcCmAdMOGnKtZKNm6TN2Q
	 L2OppO8jhw/Lx4jx/MrZCS4SuEo7qwyNfN0oGjtKqAfJWFfEVC6NFnkv1EbXfmp5sBSyI
	 0+U4Q4O5XMpn8ag8QoQOHk52DMFDtlILemhhyDlSWkjSu0C5ECUfTymzMRECjwwMv5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882433;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EHcjPl8SLxhy6iADuCeocUb5e1mc5lkkIEwaRQ0cMEs=;
	b=aeNw5yiOZ28E5Dtg9SqMCdawK8XsWBaOCI7EnynJa/+/0FsyTpXZHTyLYuzIqP4vsX2N
	 5jdENsZx/9vpmia8g668TRIKalJ1X2+KN0GsHLKqKVOB6rZvegkyyH5Z3RN/Cr8HbFKzG
	 eU7yKnDV067WsfQ60xsMljNoqcr+vb4RxmmmRg+Moe5bEkTFYv/UoDsmngJ8GBlQKmyn4
	 7Z95qCHG/us0TTluEL/0kwfrW6FGU5PPUeZNn2nS2EjBYBjuSvyKKKa2i+92hgqm5AcM9
	 USFBuOJ/wxQKMOQW02uuAP7N+0lnvoanYs/3icKL1cNnsuCXWGSUWUc6xkwMwVPIJyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNQchzaj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A715606A326;
	Thu,  5 Nov 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNQchzaj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14FE1F000C1;
	Thu,  5 Nov 2026 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793882433;
	bh=EHcjPl8SLxhy6iADuCeocUb5e1mc5lkkIEwaRQ0cMEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oNQchzajsgvnN28o4MzAMbObiWGxBzWjoKzKnxXZOgyyLbAAtbOCLkdnAhoe0ve0B
	 lkZU/zcBo8qwaAdZiybnhOqwSspZ3pOxV0XUWXGjZAITdtwuq1XXIzjhkjND4kzwYh
	 8doUmHMe/TjJvppNzesJXQqaAEe7GsV1gKMcvHTXeba6a+UXXLsOOig2WaFtroq7XW
	 ETGSf74RYZZwi6fwGMmGIYbX9XznhIwqfL7/h6MpGW3NBD5a/TFjwT4nfBdmszgo7E
	 IEoON0L0EjqN/bOC12KUYPMSyQ8VKVjTAzroSOgjWnuB0ppojup3de+MVotemwmYDY
	 1J2ZhE87CEaZw==
Date: Thu, 5 Nov 2026 06:40:30 -0600
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
Message-ID: <20261105124030.GA1449284-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
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
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>

On Wed, Oct 14, 2026 at 04:17:25PM -0700, Abdurrahman Hussain wrote:
> /aliases entries added by a device-tree overlay are stored in the live
> tree but never enter the global aliases_lookup list that of_alias_scan()
> builds at boot. As a result, of_alias_get_id() returns -ENODEV for
> aliases declared inside overlays, and any driver that relies on
> alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
> pinned id and falls back to auto-assignment.
> 
> The gap has been public since 2015 [1] and reproduces trivially: apply
> an overlay that declares e.g. `i2c99 = &foo;`, ask
> of_alias_get_id(foo, "i2c") -> -ENODEV.

[...]

> Overlay aliases colliding with dynamic ids
> ------------------------------------------
> 
> On v7 you raised the question from the 2024 repost of Geert's series
> [2]: an overlay alias can name an id a subsystem has already handed
> out dynamically, because subsystems may pick any number that has no
> alias. I went through what the of_alias_get_id() users do in that
> case, and in every one of them the collision is a loud registration
> failure, never two devices on one number:
> 
>   i2c      i2c_allocate_adapter_id() does idr_alloc(nr, nr + 1), so a
>            taken index gives -EBUSY plus pr_err("adapter '%s': failed
>            to allocate id") and the adapter is not registered.
>   spi      spi_controller_id_alloc(bus_num, bus_num + 1) likewise:
>            WARN() and -EBUSY, controller not registered.
>   serial   serial_port.c sets port->line from the alias;
>            serial_core_add_one_port() returns -EINVAL if that line is
>            already occupied.
> 
> What this series changes is the failure mode for an overlay asking
> for an index a dynamic allocation already took: today the alias is
> ignored and the device quietly gets some other number, which is the
> bug being fixed, since the pinned number was the point of the alias.
> After it, the probe fails and says why. That seems the right
> contract -- an alias is a request for one specific number, and
> refusing it is more useful than pretending it was honored. It is also
> what already happens in the base DT when two aliases name the same
> index, or when a driver calls i2c_add_numbered_adapter() with a taken
> number.

I'd rather have my added device working than refusing to probe because 
some arbitrary device index couldn't be used. There may be some user 
that has a working system today and then this change would break them. 
We can't really have that. I view aliases as a request, not a 
requirement. It's perfectly valid for an OS to just ignore them 
completely. 

I have no issue if we make the failure to use an alias louder, but I 
guess that's not your main issue.

Rob
