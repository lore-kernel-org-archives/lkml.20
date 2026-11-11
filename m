Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408170;
	b=5VVjFPGysqhcogVXAn2kOLVashJ8YM+1gtj+WTgwy99uEHkxsdE1c+Ra7WZoq30QB/7Z
	 XWnECJD5jKwAmeSAEkgx3R+VwZhdPR7bgTX//yIa5cwQi6K7CUxZGxarB7FtVNlomMtIz
	 M/JN9/QWYohcQ+QVEzbk5CqpfrzfFAndnUblon4rLHMmOaVC9CcqGKRMuoOQFMX9aAlbg
	 cofSsTWn6XZlH62G9Cg8No8fXAe1+KEkMnrvOSOh5IFDk/RKuVA1w7Zg80f/lV+Yclg31
	 AFrHMWJQoeox42VorR/ViazW9vc/B98jk0YM3pu0tLBrvS4n0TPTIvqwxRenKcaHLSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408170;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LEUOEvYWNj7E1ZyLE8IW+ae/bA1XEfjmbaEAK8yH2KE=;
	b=MqcjadbOa2ncwjoxnB1RRo1jdXF7ul4aMVmJoqyHt5xiaG1PcNw1azNLh7ZpkJ4lXGGw
	 N0ooLaGJ754PuTEUjxGXCgtVhjHoIdHI39Wm5VsWgC3i5o7sTOflFagi4lh3pEriPqpgH
	 2f7v7WIPsEnhujcOTwX1OgS6Mbg0TrooOo0ESbdyD2hzHBlzmkQH47vo/ODALIV4x/xHI
	 Z/E2xf6UcYtARY6DARqVC3/xoB+bnde8o+3LdMBqAxEgn/iM7kpo7qYJpCCVYEPWibmJ1
	 RYl29oYPS44qwRfaM2BY0G/5cSf4Sqh4lLH9cdkyEyOGGPcYdUlnSlWYwj0mUaHsC5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALziLNVu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8F2606A32A;
	Wed, 11 Nov 2026 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALziLNVu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818BE1F00A06;
	Wed, 11 Nov 2026 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794408169;
	bh=LEUOEvYWNj7E1ZyLE8IW+ae/bA1XEfjmbaEAK8yH2KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ALziLNVu3wa+LaDP9x3ssBcCGzk85Mbmk1r1TzuM4bBYeS+kPKqcDoONyyd+dBSfM
	 IggHjPvsPBRmf2TvrXHxprxWqgdx6k/uuhR5nDg8nI3ZsB7GPz8Ccqk0uX3MLNHorp
	 vjY/opfg/1htNZ7KozoS7mOonllKDA3qdzYmxJQufGISMXZcs+pbjGlJvbXkSVWa6N
	 ozth1YbAa4H7Q/KaLNgp9WSDPRdJNUlLRKMMdjdyvNFytlP378AnB4mdok/5rZsw1H
	 4L7DK9dZhBz7nmkrnQgZYiLggvgZV/neQuQgWJyKeJm74KPO7Ec5EYpi0N5G/xGY5o
	 5MCtT1hioyxWw==
Date: Wed, 11 Nov 2026 08:42:47 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@nabladev.com>,
	Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Subject: Re: [PATCH 0/4] ARM: dts: stm32: adopt hex format for timers
Message-ID: <20261111144247.GA2193350-robh@kernel.org>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
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
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>

On Mon, Nov 09, 2026 at 05:25:02PM +0100, Fabrice Gasnier wrote:
> This series intends to comply with hexadecimal unit addresses for timer
> subnodes as described in  ("dt-bindings: Use hex unit address patterns").
> 
> Also update hexadecimal format for 'reg' property in these nodes. Take
> care to update the boards accordingly. Note there aren't in-tree overlays
> impacted.
> 
> Purpose is to avoid upcoming new dtbs_check logs like:
> make CHECK_DTBS=y st/stm32mp135f-dk.dtb
> ...
> stm32mp135f-dk.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not
> match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
> from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
> ...
> 
> Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
> ---
> Fabrice Gasnier (4):
>       ARM: dts: stm32: Use hex timer addresses on stm32mp13
>       ARM: dts: stm32: Use hex timer addresses on stm32mp15
>       ARM: dts: stm32: use hex reg for timer2 on stm32mp15xx-dhcom-overlay
>       arm64: dts: stm32: Use hex timer addresses on stm32mp251

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
