Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784586;
	b=RxRhaGkBjV7qUFAu91wISBrcISWYvk3qozUNkzoQSa9JdWu/l//tn4Ua4/MLMKneH9DS
	 gF1epFc21wtwmrVI8h8qEtHfR2ndwGQw0UAHQObY8GO0XkdImxi6v0fSWvQCoy/ozhyIJ
	 25Flr7b6YS65qzywBH+gHHf6h2hRqrMKuxSs2YgKIpbM0gwBWxqrZASoUbw0syE7zsUxM
	 GEIqeSO0JYy8cQZKcvYqmsB63mtaE+Ov4CgD+KDMsmxCWjBhT16wIpQbMkdPK3cMPlcdL
	 seyVYwJ4+G9nZXfbWi43mOxM/mdmdukPQNhzf7OUZsyBZNlP4PacUREqp+FwLX3+mHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784586;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=6fWr66mLdGMUcPCfj2lY5yCay2OcZCA9qUhBwidyWNs=;
	b=2vwv5J4hawCyW9DS5KvKVinYUmJ0i1/3+nUgk4GuCCQ7TcRAr7ywUx5SN6WAVRM37K4W
	 kwXaE0t8RspK+zLkmmK7xOcm1KJ5WxsSbphFoYNDawpuvnl/iTTpF6Hy18VhUOoY7wVW2
	 VfmFWSqMa8PUUQQQaea0utKQZJIftUnu3hRpuuWWjc3CI+76BxVOOevRBofY3l1G2Yd3e
	 RtRKQ6DxsEMLCEtmB/Xt/b1M614P4T9KrOvS0sYMKIrhk7piUYh2FNfyRi86ZhaRJ5uKQ
	 R9XWl182GPpsIxKyhVJymNuEg3v7Z/0BGKx+GRK5Y+ORx3D3dKXcS7GVLKxgSmbDbfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mJ5C3PhF;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A49606A31F;
	Sun, 15 Nov 2026 23:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A49606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mJ5C3PhF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794784577;
	bh=6fWr66mLdGMUcPCfj2lY5yCay2OcZCA9qUhBwidyWNs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mJ5C3PhF3Ubvh+ERFg1RVv+/p8e/beY7R3lbHUreYXp2Ks5lkZG5P2Yqau+Znd1Tc
	 GSloz2NUdiHQmdyFMwVG/C5auPC38/cujdEB+dH9CPMATkceOmGPrMUx8mTxAepKCr
	 aQaHSdgkr+CnoX+jJ6+0JQZbSqGQxjndWCTlZbNT75/H8e93b3xeyk3jrgxBzJaJrJ
	 yRrqRfoMNBh8aljOnF2WLCSZnbap3NrGAzMYCEAM1rwvl+wblKQLPZxAmRhbzgVx1Z
	 YkyvYTb7T4UnCA2yAb3J307fhqKhhAo4KFQtQSQuwljM0rnIRRKIzOumV24fEmxHX5
	 uDu+AuK1fCjiA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 713FC6005F;
	Mon, 16 Nov 2026 07:16:15 +0800 (AWST)
Message-ID: <91dd4caa78cff5961b5617958f4f7985ff55724c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com,
 devicetree@vger.kernel.org, 	linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Date: Mon, 16 Nov 2026 09:46:14 +1030
In-Reply-To: <179455982636.2173009.10261089569510079520@nvidia.com>
References: 
	<91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
	  <179438627442.2016371.12057101111349178921@nvidia.com>
	  <42bb0b817905637239c16b94a562254cd0e6a644.camel@codeconstruct.com.au>
	 <179455982636.2173009.10261089569510079520@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-13 at 16:57 +0800, Jacky Huang wrote:
> Hi Andrew,
>=20
> Thanks for clarifying. My previous description did not explain the
> purpose of the platform. I would like to include the following
> description in the v3 commit message:
>=20
> NVIDIA MGX Vera C2 is a dual-socket, air-cooled 2U server reference
> platform based on NVIDIA Vera CPUs. It provides a reference design
> for partners to build and customize Vera-based servers using the
> MGX modular architecture.
>=20
> I will also include the following public links covering the MGX
> architecture and Vera CPU:
>=20
> https://www.nvidia.com/en-us/data-center/products/mgx/
> https://www.nvidia.com/en-us/data-center/vera-cpu/
>=20
> Hope this can help others better understand the role NVIDIA envisions
> for this platform.

Yes, thanks for the extra details.

Andrew
