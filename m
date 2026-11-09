Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243347;
	b=vRZK2Ry3KVikIfcmBJrInn6fWNx9LbZCX/A9wz78fj6MhAbkpiTnpCuKbXj5GgWmQVAq
	 whbnnkFtsHK4s9+KNcICBhZg+wVKGzgROKte2bEyHuwcmIpuog+EnYTzBPOoAWt//pBcZ
	 YINS1xirFINDhoO7eISGSj11fZ+gWBNZCN/svaeqDo1hgITFS/myQicAtNNpBqgzn9XBE
	 KEaYJrozY2ZmTlPDcvIP80n9GgJojeRSp1q3sISDCFJI+F43I3vVEAeNe4poHjeUZ66Zd
	 vSview5ry7wnJ90rngM3dQre/lJzPoX2FKf7Btkxht7ibWxT1+OMAu3yVuLGONsMXXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243347;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=RbIMwh7QjY9H/ESzpnEDNcnjrWVGiNj/JP6ooq2LdsA=;
	b=JCzVebIoT+QW3JLL+Fmta6gu5fTF8fobTjRNMkFJxYQWmM3mRt8Q/Pu7CksSetlFQcei
	 4PDkDODbXTLFB+662XSpxkrraZKmzeusg5K5YscO0x60zGIPiP7HUN93iFLPBD2Idz/3d
	 it7R86DcCD4GbnjOzUQAKTueDP+aEKaOZUV+K3FVBInadP1cUe+T2QbAgS8bxOoqiJEwi
	 mJUgs9xCqcnCMRDb38jVpqT9YaID+f5y1v4L9gGs70tjQ7PFTWPrh1sSHOqAhqig7TLNt
	 FAMG8p12wnn/nn1hTteU8Qw5dIzoX/tJTgRap2+E4zx1yB4TY4r79SpEOcSeBc2+KHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgiq3tjy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F288A60A3802;
	Mon,  9 Nov 2026 16:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgiq3tjy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0B11F0089F;
	Mon,  9 Nov 2026 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243346;
	bh=RbIMwh7QjY9H/ESzpnEDNcnjrWVGiNj/JP6ooq2LdsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kgiq3tjy33avHVpr9ViD1KQQGgwe0ecSe9vXcA2++Xip00YTMrBRcnwboSnomjYWR
	 1cbWAvM7IcWj0HILEFIHtfjJU2HBkVrReM2B8ZtVqwP4JCNfNA2Cj7Fuw87hzeOw0M
	 FvUjAP8UriXi523B5zkRfmF4muMj3uaGDc8ZYCRU3V2BwfGS2+3u+Z7f28g7QdvrdZ
	 DX8r2Q8p/EXUrGIMWFG+SswCt4dsTusbG0HuAcEDM3/CAd9LJCyy1Xmw5TBqq+BF4Y
	 GPD21Axbh3PPRVZTOyGBUM8a1esvnoHYu9sANWPYUyrAah8wnmI18c3XymTqlQVvkn
	 QffTWqGrWlIkQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185421.883883-1-jernej.skrabec@gmail.com>
References: <20261104185421.883883-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: Add CPU cooling map
Message-Id: <179424334487.1081153.17199236855422635753.b4-ty@kernel.org>
Date: Tue, 10 Nov 2026 00:55:44 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 04 Nov 2026 19:54:21 +0100, Jernej Skrabec wrote:
> The CPU thermal zone has passive trip points, but no cooling map, so
> nothing throttles the CPUs and only the critical trip point ever acts,
> by shutting the system down. Throttle the CPUs above the 70 C trip
> point.
> 
> 

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: h616: Add CPU cooling map
      https://git.kernel.org/sunxi/linux/c/a7f6e476aaed

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

