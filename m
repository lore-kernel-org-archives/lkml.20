Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742516;
	b=OZ7gXKaHJ1CftnTUtLBeOlGhNYzVOO8PI+FBwxuRN59Uaxnwp6qIgPB2gr5GaQHKB0UK
	 QCv654tuC4Q+WEUK7Tr7BIFZw8U6bxTzG94MqlvUsjZyYvOU146m4xffoBWd2FH7x4cHx
	 eivxqas7n5hehg/lL1nPNawCw4z+qxY2Vclq4Xz6WARz6DZpz8KZ+0TDR3xkYZvUbUViM
	 6Kecc4/9aeeaXhlwqmCMmE1VBWHOZu/zH9+Ij/dRDQV3IZrto/Z9sMCoXMmsOXWhCE7kW
	 /3PtZ6IjUW6ewHX3mKc0Cg3eu8n6xy8zDfDdjxvv5OnjBLR4EenxmNxAhZcoRMLn7fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742516;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=FR9H2PaILFPq2g6fs1uHRogd9laRoMATzk7z1WgUqEM=;
	b=36Af69R0R1lOvN5o1SJ1LFSOkmfyc+LZsaEKsQrbJsNiCoS3k+/OiW1sbue8p4UwSWU+
	 D9607LpzUcsPy7Vs9xE54xbFyzeqtZ23AqSeMwaXESaVVz2XV+LK73NVTKLOXJvq+Z9ow
	 emm5S5gSjKYn+fbZQBv/6Pioy/12kVu1pnwgktv5Xaxz+ApX0n89BZBvgljzzHVnUB9DF
	 G625M+Hlyl6av+0nqYKSOCPPesDsvKhddJDWM5xMi3GZEsGfy6+ThkFZvzGCu6EBabfae
	 aLsL5Auuifac/emEDFRllH9rK4nFm7OASqzejCRtL4p1EZk3Nr1kPIz4fybDAgFh+vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iqsthhbg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2937606A31D;
	Sun, 15 Nov 2026 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iqsthhbg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA5D1F000C4;
	Sun, 15 Nov 2026 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742516;
	bh=FR9H2PaILFPq2g6fs1uHRogd9laRoMATzk7z1WgUqEM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IqsthhbgPHxQxH/aiTktpmW3D6Sx7XnQEXI+ao28uV0TDfWAOtkR0xm8UDJWLaliW
	 g9CdXJS78kdgweHhR/XPWsE6AZ1njXBbKmcbpPPzYeoi6tCuhAad4MgKWEtepGl/xb
	 plo2TLTxhDkm2KMl9InzDiX3fbrYJJh+3HHB+Duw5s7QVWSZUX0mVg//VQduUKrDJ4
	 L0wW8FP7Fce5/nNLSkkofnwJ0ado08fq7zxIIE3eN84SNzlz0HLHorI7jw6zJmDgxg
	 6ccWhgZhbBBz1Hy0rFZIahAr2yTj7N6d5JBvvlEGBOk5TJ1bqokO24v1v5FgrDLuHj
	 6VHCksydU3O6A==
From: Chen-Yu Tsai <wens@kernel.org>
To: andrew@lunn.ch, jernej.skrabec@gmail.com, samuel@sholland.org, 
 Roman Riabenko <roman@riabenko.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260822052353.22881-1-roman@riabenko.com>
References: <20260822052353.22881-1-roman@riabenko.com>
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
Message-Id: <179474251421.3095306.4655080143943626806.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 19:35:14 +0800
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

On Sat, 22 Aug 2026 08:23:53 +0300, Roman Riabenko wrote:
> The 'rgmii' mode does not appear to describe the RGMII timing in Olimex
> A64-OlinuXino boards. The PCB layout shows that the clock and data
> traces have roughly the same lengths for both RX and TX and, thus, do
> not appear to implement the 2 ns RGMII delay or introduce any
> significant delay.
> 
> According to the KSZ9031RNX datasheet, the PHY adds a typical 1.2 ns RX
> delay and no TX delay by default. The 'rgmii-id' mode causes the PHY
> driver to enable appropriate internal RGMII delays.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
      https://git.kernel.org/sunxi/linux/c/5f30c467fb36

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

