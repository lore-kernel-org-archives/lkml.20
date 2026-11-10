Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351056;
	b=qxcSOLS92GyTKDNumqk+Vi1wCzR39yuoU96k+2VP2oY+8mmqq1cqgT6005C/2sgo7u8x
	 Akmacwo7ywvYZ6UmKR1TlxV8FWrigjRzEgBlEeulY4N8La84lDbi/vweA+MOHk+0w4gjo
	 evPAAe/Xd6ElZPoq9k951gzb2rsQ25Sw2mJunUWbrIKgzCJn0IM0Gy3jofi4rTpo/zWYj
	 VQfb5ypeN835T1KIqp5tVMh+ViiCltInwHPeYxIE/oSlvPwdZtMX8k4CF8HAaTR17GwD1
	 LWAFrtwFoQGtA5kUoT0AiG3mjcU1lt4EtxrlyQJSdneGNCdJw6wlfyWCdOdu1QB32ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351056;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=eh/GkHmVLemeAYxVqb0jIsD7IgzOXsSMzWc10IqxN3I=;
	b=ohuaBXSDgFZrZyN2anLpo/H1q2WhehnZt832P3Dk0LwbpAqo3eYkqUl3yXQ+xmOXqJxa
	 AhJg4gN7F9aQo0Tdw7/cJQGdbDrxa0L7rLmL+Ga345mH4Yt8jdpgRVtyV/WeJjAW2eLCv
	 9xZY75dTBmL9/C8oYZ1XRMKMOtyPHB+FlWd3g8hawOXj5bHZOVRv9paecpyYKpO8CulXg
	 ibL5zj5QEUMQ5UWQFh9K/7XH7Qrtgkc7cTrcpekJh/Lff7CJxV2oQ02RLO5wzLc8xB8fP
	 MOf4v6MrOFPDppe+eFjWh9DZVDa0UdhXXELgXyu7KZBExrws4O6quTP+weSYhkTYp8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E+qpiYl1;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD21606A31C;
	Tue, 10 Nov 2026 22:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E+qpiYl1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794351052;
	bh=eh/GkHmVLemeAYxVqb0jIsD7IgzOXsSMzWc10IqxN3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E+qpiYl1HOD2n9wrp4FO84c+BjljBtMQb7NsJBaKScfSXcm2erLdY9zpRR6YavS3n
	 x9kIFzMpd1rTmVNGTYH2TqyRBrr2YjgbM6keWHhJIUKMnyigds97WQ6132sUCPBOqM
	 0wvIkEA1Dvver+LehqYg8TfnwY5hn3KpeellgANrWVOzW2rLbwg0hDKlIsQa0aloXM
	 B5FYwyy8Ut+iTpcSHEARU8Xvx68/Jk1wO0XV0PCtfdTgM+Mny3pgIhE0Yv4y0ql3Gd
	 GvMGTbvpoBaGmhZCMlgGF9c1hGx63RTRPBe42OUK9hEVcVv9IYTgQ63OHGeP0S80mE
	 1agYmbUOrLgbg==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D4F6D70885;
	Wed, 11 Nov 2026 06:50:50 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Zev Weiss <zev@bewilderbeest.net>, Tan Siewert <tan@siewert.io>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
References: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: ASRock Rack X470D4U BMC
 support
Message-Id: <179435104820.1995370.12519686770871849197.b4-ty@b4>
Date: Wed, 11 Nov 2026 09:20:48 +1030
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
X-Mailer: b4 0.16.0

On Sun, 16 Aug 2026 13:05:48 +0200, Tan Siewert wrote:
> This series adds support for the BMC of the ASRock Rack X470D4U mainboard,
> which uses an ASPEED AST2500.
> 
> The mainboard exists in three known flavors, the "normal" X470D4U, the
> X470D4U2-2T (with 2x10G RJ45) and the X470D4U2/1N1 (an ODM version with
> 2x1G RJ45 that is now available in retail). The 1N1 version also has a 64MB
> BMC SPI by default, but they are all swappable.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

