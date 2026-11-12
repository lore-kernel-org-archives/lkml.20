Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490369;
	b=30yDl28XBuqgupN29M1Mfw0tIjiD5AxRIf9wuHnk9W5tP8y548B9P39bOFay4EkxKfaF
	 RDLu+OiScTtx7KCk6h8cTNXqwYOxMpn7T5Y4tWxqmKAnsvVc16RwpyDpAfDE+fu6sd6OS
	 RtsHFNU7P+QqB708X5Z6q/YHUXL2xWQPJpuvlhsj3O0FGT3NiMHONJCfjld7eBhBrPiAr
	 uWxQ1bUAn3DvdUxgaSGtUICSF2ms+Y0LKTp0QaCvbZF+1I5uv3juJ2AvcFUvHnQbEr9gb
	 YLXFuPn9aeqbqBaV2mvXa8pNme4A5dcOhGX+wZ4KpBx4/4N2wfFqqIBJbVfmS4EsNxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490369;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iEo2xki5lr0Ld9JYPAmWGvg1Pdjk4kdBgUxL5c/PWWA=;
	b=5YtA9EA5fKNeSMBG70RB9bgCzZIhOGz5MEDiv8+BDnDDSrWdmfIyM6WCAM1CeE4wxtqx
	 ZP9H8m3j+DY83Vxt4IPkKYJvm7yggpfwG3XmZjkwk+X2Ely60AVjkyYXr/Xb7Z6uyKfp1
	 sR5Q4ppM0heIDNqcfCmGxKryolHPr2eUI6MCg/I7BTd2fScjhb9pqZTY6bZlhtnKFUHDT
	 RVu+qH52per+kMcMOjjrJJegDeN4ZnUTGN1LfnnYl/6vLT4AeBVZtVG31YDyStZkoo3s4
	 KEvhcJXdN70R/0l0BOzZ7Ofnx2jMv3hJcwU14TKJl70fAAuA3zx5+fIPB/KHe7oYXjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9lBr7SG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23880606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9lBr7SG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26BD1F00A0C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490369;
	bh=iEo2xki5lr0Ld9JYPAmWGvg1Pdjk4kdBgUxL5c/PWWA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i9lBr7SG/fDtD9bdmi6KD+XPnkRUcprImJzMti7MgTMiG3fCabTEmScJmy6bmre+s
	 TWwEf8neAUTGDJtN0k8m6X59GkHTQJf4TEQLiHRgueZjgJYfb0LcnmyWTfwb87aVJV
	 YUkRzi42wR3lsTyEYM8X+37yqRRgTaZ+quFhMrcyETttLQzAdbUnBhYvoKGAzz4unW
	 zDAjfUJWjFg0Y6n00Fd1f6iL9ntHsHW3NUgccfxUi4z+32EpyxJ03WL0IH5G/kZ8YE
	 e92roH1ccmLjKYcLOfy0zuUspWwBlHAOZVv3bhsRr/11qxAsBYyQVrdsBiPjDdnIWg
	 0z+nhdXPa72zQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae0eb56ba1so25248231fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEVSNTLf971i3YtyoesYZ24jBbaD2q2ofrcW9fACTE2oW7rnfxh4+JN5SOL1OCc3Ml2onw+PJ6w984ztzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z84dZW9Bnb+LodTwJ1kSLUuy9I/91nIoRZTUeDP5YbBCzSZeyJH
	/biS3oa41PjjsDVCr01jIw/g0+HBLdHREmRciKtT7PPnGIqNmBzSeVCi55ga7xc1AsEPgSYx8Qn
	jDmMXBNspmulrv+UUUqT6gSOXZTLbeiM=
X-Received: by 2002:a05:651c:1445:b0:3ac:429f:6da8 with SMTP id
 38308e7fff4ca-3ae12679b99mr12954551fa.10.1794490367466; Thu, 12 Nov 2026
 05:32:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com> <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 22:32:34 +0900
X-Gmail-Original-Message-ID: <CAGb2v67P+9zBpmst9qLBJ+PpPG4ghtiC0UiyTz1PK-wRm2jqVg@mail.gmail.com>
X-Gm-Features: AclHuK_HGkL2v-mrL96AWKEOzFXYn0NCtooN1Z9_WCMxITXSHxeYkq61j0wWgcE
Message-ID: <CAGb2v67P+9zBpmst9qLBJ+PpPG4ghtiC0UiyTz1PK-wRm2jqVg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:41=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The EMAC RX_CTL1 RX_TH field (bits 5:4) encodes 00 =3D 64 bytes and
> 01 =3D 32 bytes (H616 user manual v1.0, 6.5.10; 10 =3D 96 and 11 =3D 128 =
bytes
> as in the driver). The driver has the first two swapped.
>
> The values are only used in RX threshold mode, which stmmac selects only
> when the snps,force_thresh_dma_mode property is set. No Allwinner device
> tree sets it, so no in-tree board is affected.
>
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Checked A64, H3, H6 user manuals as well.

The original chip this came in, the A83T, the manual for it doesn't have
the bits for this register.
