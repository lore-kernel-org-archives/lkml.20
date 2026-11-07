Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048818;
	b=Gxbdq0+T07bnlObX9YLF40nFfNOLvaAqGzlEPRPD8xpmfvrhzTEF3A8jplPrUYxsDpyf
	 m7u9P+aW1RPKzl0SJmea/7C5d7UqYCHCZlz+yZc7Rhiuhs2hy56wBwNrsX/bL2MupES+a
	 /uOUV35TAlFLO/wumhrkZKlBST96I8nex2y2Ge5uc0FOuetskLIcpH9Ht7UNWw9ncc0Jt
	 zGUIBWojW+proiOagvshzt2FbLFXz3yFc3dNIUUvROw5Fs0RTSouHjez/gK2lcjsCA8qW
	 3kRpSJYMOkasEU5vinB6tIric1jiEG7CJ0aP3Csb4zsMF9CR6gJqQoeMvFmne5QZKXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048818;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Y180jtVIl9H2E6DxVOXvPpmcMQTvALtSPs5lwc7SY4A=;
	b=r8gvOc6WyI1NU8+gUlle4n9f3C4/nAhkVw/MruUMnRFtGvN524D2ErgdZiWsGzfPl6T5
	 6T8C+wjiDm0CGEGtlEjdJNMUH1TqBy+ww4zsMFf6SXFMpTJXSCgzGqkTaaFp1j2NeNrFH
	 Jo+3Bwvf1XDym8DEGp9sI3WoW1tgVWlVJ2hwX3RFsP2rAkdMD1a4As9am604Myb+nygcN
	 +CLJO94/0cAVwtoBjD8sEsdte+IwUIHb9ef6aVgA7+gUBDOb+4z6425DPGFmwgx29oE90
	 OTsw+hL6u8OQ0Ko9pqrHupkDWIX7ilmnn8oliRgVG4s2rldSVClw8avHkL8L2h/gTCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dzw2DrLP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B01606D806;
	Sat,  7 Nov 2026 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dzw2DrLP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989CD1F008A1;
	Sat,  7 Nov 2026 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048817;
	bh=Y180jtVIl9H2E6DxVOXvPpmcMQTvALtSPs5lwc7SY4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dzw2DrLPNnFzvATWGALmZmpt8Cou5+f6k3Y/Wds/QZT1d7y9Q0PqGC2A2epOlHiIU
	 rv70BpLUlt+ZUGy+zsJ98IlxGxVwc9UoCo/azTLGr6n2z01d3Qm+O/hrex3iMCcUU8
	 dMprg2UjZGg2Sgwr/G6zZkbqIe20zDFpfEnLXKBRyxzvma3mP3EXrRZLdFhGMxOQ9e
	 TuCaZvhK6eLKZhrY2r43J3VNnSuxxwBcKo3Y9o5bV5slP71BAH4B5hCUIXAchw+TMa
	 r0sn5P9IWJJeqS2x7h71KIMmNEeCzxIgZJsgOS5q0x+nvUqQr9h/cDa/cNp7TZ+ptQ
	 9RU7mhVHVC52w==
Message-ID: <65af581e-caac-430a-88b1-3b7425c5209e@kernel.org>
Date: Sat, 7 Nov 2026 11:53:32 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: cix: add RTS5453 PD controllers to Orion
 O6
To: Gary Yang <gary.yang@cixtech.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-5-gary.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261107011012.3655873-5-gary.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2026 02:10, Gary Yang wrote:
> Describe the two Realtek RTS5453H port controllers on the Orion O6
> I2C1 bus and add the I2C1 pin configuration.
> 
> The controllers route orientation and DisplayPort mode changes
> through the USB/DP combo PHY lane switches, but that PHY support is
> not upstream yet, so the connector graph endpoints are left out for
> now. The Type-C ports are still registered and reported, only the
> lane switching is deferred until the PHY nodes are available.
> 
> Both controllers report through the same level-triggered interrupt
> line, which the driver handles with a shared interrupt. The I2C bus
> runs at 100 kHz because the RTS5453H I2C interface does not support
> higher rates.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 51 +++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

DTS cannot be combined in this patchset and must be split. Don't mix
patches from independent subsystems when you send something explicitly
targeting only one subsystem.
See also: Documentation/devicetree/bindings/submitting-patches.rst


Best regards,
Krzysztof
