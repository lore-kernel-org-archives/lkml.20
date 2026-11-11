Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439807;
	b=bDTvXOX9ZELrSCwRw5gRUoXv9F03c9oTrmu1OxnGq4olMlYuPChn1hQd7VS2aT6Yf2Wy
	 y6X+nUOcFS47SvZFFzLjKt1+At2uPanEKNr5Bon6i2IdAwwQlNJhBaECEFEykEHRSLNbR
	 SUyQM6jvQXqJ/LPnXTdz7RUHn/MH3hB+kvlobdOcRow2xj9PXVSnnbXA9y0/0oRVx3+IN
	 BAe9GM61u+MUnI/9diqlGOU2hMwCAo9O8B01m8JIXwltjIZyzolq4Q6h+iKC5WELPHdfC
	 gXUwmino7hdf2e2FeD+8b2pQvzGV1E7Nq/rHj9njkPv3laU4Ge7dxE1+9QkFqE6JVOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439807;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=4jTQv18d6f1WQDZPy8KbBDvAw2VyV9v3NRrsYhICvJ8=;
	b=xhMwnuTGkA/U36qzqZP/H/7GNgXO7DZ7furDs7MYSdz/SndaQn/hcXZGy4DfrXt2+eoo
	 6qqyLDV5BCi5DRfY246k8H6Tt6Sz/o6XnVWIy4W0ZLAeS7rY/dfSRcfsc1u39wfWp0YTt
	 6C9PxVI36N7k+oxRnPgMqa4f3GBOzGsrJdXgnk9l1ApaCgFaVeLllzJquoqotXQEXZ5xl
	 jgUTJCN2yLifCLxE96FsPPD7iWgn5UOQEW/X6mZYNpB+jOfaA4PrrBY/q572aLYFXpWy2
	 Zix4B8/7LsouCN+m5qjnEcPsKIqzNoGMKeBJN2Ds46feLic0TfnW2uFG+Xg9dyd4XiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KD+N4m3F;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5797606A326;
	Wed, 11 Nov 2026 23:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5797606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KD+N4m3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794439799;
	bh=4jTQv18d6f1WQDZPy8KbBDvAw2VyV9v3NRrsYhICvJ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KD+N4m3FafpulELFLuXVw9qA2sr62kqjZns89QS9ygPOv1uZ3Vt23iID59FR9yobW
	 mXLcnCqeJXqjnuwkx3u5k5yfMVCSahFMzu7cjYe1WBBMdryWAlcIhe6EmViHIozTov
	 jFZ1X7gUWke2ocIFRWQtMBBZChLgvJhg8cqNOLz26uy3ticSXZk2LNWiyavGR2YNg0
	 jXKd4bklxKqKdmWlik5SxLDO5xidJ4pupeTmBrqs+fKBCJkPAo5Kjzb0XNbmkHKr6k
	 Vdb476ZIPgAULgRS/7Jwt1Bzj/sTUfZc3fJUV+LeO2fTr06UqmsMUh1FKQ8nS899if
	 H5eUI0c0Xz1jA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9EE65704C1;
	Thu, 12 Nov 2026 07:29:57 +0800 (AWST)
Message-ID: <42bb0b817905637239c16b94a562254cd0e6a644.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com,
 devicetree@vger.kernel.org, 	linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Date: Thu, 12 Nov 2026 09:59:56 +1030
In-Reply-To: <179438627442.2016371.12057101111349178921@nvidia.com>
References: 
	<91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
	 <179438627442.2016371.12057101111349178921@nvidia.com>
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

On Wed, 2026-11-11 at 17:32 +0800, Jacky Huang wrote:
> Hi Andrew,
>=20
> Thanks for taking the time to review this.
>=20
> > Can you please expand the description of the platform? Why was it
> > designed and built? What's its purpose?
>=20
> The NVIDIA MGX Vera C2 is a Vera CPU-based server platform. I will
> expand the description in v3 to clarify its purpose.

Thanks. Just to make sure we're on the same page, I feel stating that
'NVIDIA MGX Vera C2' is 'Vera-based' doesn't add any new information as
it's already in the name. Describing the purpose would give better
insight.

I'm after a helpful description in the commit message for the purpose
of summarising the content of the branch when I do a pull-request. 'Add
support for more platforms' doesn't really cut it there.

If the platform is described on the web by e.g. marketing material,
please include the link.


Andrew
