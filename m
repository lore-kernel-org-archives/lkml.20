Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786089;
	b=uBC8CgGRV0pxrEo3LNzewHSHe3G0Mz9mN0etn2Ob3Qil17d+iJgp8IISJcvAOKcpDpFN
	 tR3aiS8mp1GZDpbq8vYZ9eDP/gx/MTFajy0xbW5yyx+pcqX8WbEFbcDxMMI0OQHIzLC5H
	 RsxLUJcaEYHsF3wKdpkTjmN0Avwc3LH5xSGTMXSVQhE/6PC42JJBkgdmX8omhEGuP8Qc6
	 ozCbRi1HSrS5eAanFgsQXWcjY7K/kBK+WJ81N7CzmOtBT0jZ+8wq97Ib+hR+0m72Fw8yq
	 rFG7z853K3m8XbaEjq+Jwcukl15fheK5QuNFzlchq5b62goe4a3G+Ax0R+MDVZlbscQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786089;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=Cw/AEA9RUly+lbDRITFDwUsGwTqIHV3epLm2bzHHVIE=;
	b=YyLur5DnNS8HWFzqTZWuVMTYy86/xbfeHQXmu27J6rTorsuzRq4Dyq/pCb4hKAwLTC0o
	 pxlvIAu1/mjONOhbToY9w1kmswOLfop7HKD51B58rhEPN47HkQXqPV/IoRTi9ctY1u6CE
	 SRfO12ZngECo3YGeSiLSUpvwSTfO5TPgxDONwYGRbJtX/C37CI27PWYNpbxczPPAwm8Io
	 lDKzG0Vg3kqJagJ2NfG3FTjj3HqQWCL1/JdIOSgrs5zl4G37cObhQbeBOrP+QVvEqzS9J
	 IgRqbswvM7eJWMDIrMCphHK3xnRCIMUVVwiJPKFiu5vYrst+AWaXPDxupxiKgJmKqPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=l+XOTufO;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D4606A326;
	Wed,  4 Nov 2026 09:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA4D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=l+XOTufO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Cw/AEA9RUly+lbDRITFDwUsGwTqIHV3epLm2bzHHVIE=; b=l+XOTufOEsoX4h44xsZUeQJd9y
	UQVDTH1ZcIwsjWzDG9IAhHZZZROudzxDmWTRe5fqxP9BNQHxaefTD7xe0xXAh4yv6Rl/ylkjgSZxR
	LUFNPOSonghfbKOtC13S7/DdNMQR0ETOrTCFkr+4TT2zDhj2oYeY1GSun7OholDrhGQTOzHa3PgP7
	DqltQo4KF2KUZeQRaOrWsndiEP1eIVultVov0khVdbYyT85U/m1nh9ZInru8Ei8lmOK26bFB8Y6Oh
	AvKNrRTTtZIEUMXouprbvAyoZjJ3pBFNBrvyzgWBn51Muil4I2Ya3HaOC3W3sq6TPM8kVURpOI65E
	0zkY4ZCw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jiaxing Hu <gahing@gahingwoo.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jonas Karlman <jonas@kwiboo.se>, Guangshuo Li <lgs201920130244@gmail.com>,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Subject:
 Re: [PATCH v2 03/11] accel/rocket: search every core slot when looking up a
 scheduler
Date: Wed, 04 Nov 2026 10:54:26 +0100
Message-ID: <3950609.VQhiAETyHQ@diego>
In-Reply-To: <20260922080114.44662-4-royalnet026@gmail.com>
References:
 <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-4-royalnet026@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 22. September 2026, 10:01:06 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Igor Paunovic:
[...]
> Search all the slots that were allocated, the way find_core_for_dev() now
> does. A core that is still bound is then found, and the two callers get
> the pointer they already assume they have.
[...]
> ---
> Unchanged from the standalone posting, which this series supersedes:
> https://lore.kernel.org/r/20260905150432.7477-1-royalnet026@gmail.com

not to self: I had applied the standalone version for 7.3

Heiko


