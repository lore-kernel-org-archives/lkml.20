Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316845;
	b=MdrojxiNWTjEdOAYGmt8HxH0s/vgwSh1cqjfn+4Hz8NgHtbAGhKzEQ+W6G1Hx//l6u8K
	 9zNhNEYnhVgMIfyn7Hxqwny3yFi79ljp4mol5bJk8orhqCAkChRUEEpYX3IXezGeLGZi9
	 H3oxnuKKejnipIwZixqQWi7LoL1/EilePT14GgLEyWTey7swZkugdkD/C9kgAOUKckDZb
	 tWugFoDrKGcm0kmuQVl+U23D+e2LILNO90IKGN38PhD66cVbSLdKhL9ITFqFpu06rx/0j
	 dmko0+J7HxfzBFRgDxECdI3WRkle8p1NxZ/6CofnTC7zNVqBrRm+oQD85iiTrosi/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316845;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=/2kwViAXsG35P4DruazMVFfA4bV35CaUqe9OG87AmFs=;
	b=ilHigLmIeN18V7LTyHqlyiKUamDyZAAtgeHnKbN+0PDsD8NOQi9pVEzl9RclpY0MhAcO
	 Dbs6kpIQ2mhBm+2Ks2yp6wwVnGx2G/pYjiK5lx1S8Ktba3et/ih4tBKayBpFDr55fxcoF
	 Fk48rHXvnQ3y0k2fc3mx+GtBO5RyJ6tjRe/AHoFj7rtcNDqB9wY7NCJrcygtFH2DyIbsn
	 dMT84JycBVSiQ/1MkB6ETIEsrEzDjtmdjpm4WIxpKVyiICIZ+Dm88BWNEUX4/x3goHPCN
	 INVF2yKhZZbLK84rv1xxLJalXjeJxxLM6IDINCxV1O64ztjqwDf7yT5RCj+ZnksGf0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1IA0DkP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B760A261C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1IA0DkP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468611F000C1;
	Thu, 29 Oct 2026 23:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793316844;
	bh=/2kwViAXsG35P4DruazMVFfA4bV35CaUqe9OG87AmFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n1IA0DkPhTBlHlayZ9jzBdtajz29At9DPLz8C1/RIv3MUKtRw2oOmP2dUAjA6SbIR
	 nYoOVEDkjJTNgBttdgO8n9oOM5nsINtMG4SWpayIbwDUDT6T9GaxFywale7iysTaUz
	 bTC2BQYG2Ehj3jMbxZw1FuEOidFOZo3cl0mGjJKKhwOieEcUluXw0v7PzqNyClV2WQ
	 7scafVg2JF5GX48rwECB5+YoSL2dLIO8zGcCpgup+SXWse7PAZgLXxpPwKJtwdThsY
	 hPMpZaxO65QvUFwmzG/6aJAKwxobxkzRYILv/B47K9CAumLWHWFtbF204lwriel7XH
	 CKlifpDocxGxg==
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Johan Hovold <johan@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: starfive: socinfo: fix compile test default
Date: Thu, 29 Oct 2026 23:33:47 +0000
Message-ID: <179331680112.2055466.16018965059295726308.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029144525.941746-1-johan@kernel.org>
References: <20261029144525.941746-1-johan@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=456; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ty0746qaeyhLX79CmIfXWQekS8SHAzumFKD0vueO300=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFmPr9+5uejrZhcJo41x5gp1nEoXXXSvHXrMWdhylVHCf IJFi9axjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExk4jlGhrdXjfdsUBUwEOS8 7Pv09eR3EWFi39qnZlocq/mwdb3ISj6G/05d1/cJMtnvWft90S3R41vP3bF12C/LpXvOOPfIWet EFR4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 29 Oct 2026 15:45:25 +0100, Johan Hovold wrote:
> Enabling compile testing should not enable every individual driver (we
> have "allyesconfig" for that).
> 
> Only enable the new starfive socinfo driver by default when
> ARCH_STARFIVE is enabled.
> 
> 
> [...]

Applied but it won't go anywhere until after rc1.

[1/1] soc: starfive: socinfo: fix compile test default
      https://git.kernel.org/conor/c/056695e580d2

Thanks,
Conor.
