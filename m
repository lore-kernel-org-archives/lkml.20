Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDFB3AB272;
	Thu, 10 Sep 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077249; cv=none; b=C4bDWfbkS00Mzzaar9I5DR0VstnHaB1vheW3yYHDbvG/yrVpdD5MkHsouLmA64oTSqm0E75HhsT7oe5GejWDT2XQsbifhiqGQIsWzAXW7gLuQRoG0nnIEYv5JCbdZVHy0ZWcKqR7tGxfnPjX4cf3xGcjvAYsa5qXD8NfO4tFDQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077249; c=relaxed/simple;
	bh=scgTMn9cho5tbuQl+yLGplxtAJXjYo4bJI/GKQ5kJ0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APnG6Z4oFq22v6qWZ9VIp+Ivo2XeCjDAgNi7KKbjlPZNg7Cn1xCTIc0jo49tRhjCuWEsu3Jk3NMdgYSGt6b00MYbcUS+NgziCvRWTFmR5XVaIJZ09QwHAtNIfdj4/6hcSz2+xoIgiKQyS4tgGSPViVoR+LYxLMAdkBp/WuczVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jp26CEy7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jp26CEy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18701F000FF;
	Thu, 10 Sep 2026 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789077247;
	bh=nYeAcoA9jFFh9C8PqEV1VOBXg4x7U3Mq9X1SD9tZuNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jp26CEy7TGxzHajIK1zKX5wUVTwsbFkA3dt5KTxF33+g54wVc28gdS/LuruIDC1m0
	 b+3lxKbnzDqChUBuBLe13XTnfOTsQjVIN8swVwzqNCVNOmeh1EpVeN2k5OXWD3g5Oh
	 emF6mG17b29j3xs5F2GqWLBbaBTbsXVxHq8wvDpKfWOLSfSkIrAmeuK080HKGBvqaL
	 aFUuwCHtzc2PbLdv8TINXqhbbvWYwT+1S9XCSYKur2if1Jq+dzk3VCGlFNU8xr4ICE
	 TBki/Mw6Gtjf4Ux1Ot0K9TcaJ3ATQkeQ8K/BXBftySKIUYq+hCQFlBdwzvcdFWzVQZ
	 vTdmnZOn1pkbg==
Date: Thu, 10 Sep 2026 21:54:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for
 OrangePi
Message-ID: <20260910215405-GKF2346@kernel.org>
References: <20260901080010.95040-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901080010.95040-1-amadeus@jmu.edu.cn>

On 16:00 Tue 01 Sep     , Chukun Pan wrote:
> Enable the i2c2 bus and add the connected GT24C02B EEPROM.
> 
> [   6.766] TlvInfo Header:
> [   6.766]    Id String:    TlvInfo
> [   6.769]    Version:      1
> [   6.772]    Total Length: 38
> [   6.775] TLV Name             Code Len Value
> [   6.779] -------------------- ---- --- -----
> [   6.783] Base MAC Address     0x24   6 .....
> [   6.788] MAC Addresses        0x2A   2 2
> [   6.792] Product Name         0x21  15 x1_orangepi-r2s
> [   6.797] Unknown              0x41   1  0x01
> [   6.801] CRC-32               0xFE   4 0xE5A74B18
> [   6.806] Checksum is valid.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> This patch depends on the following to avoid conflicts:
> https://lore.kernel.org/lkml/20260802100101.327815-1-amadeus@jmu.edu.cn/
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 30 ++++++++++++++++++
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 31 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
