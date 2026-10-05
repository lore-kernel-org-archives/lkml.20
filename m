Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAFC4BD79F;
	Mon,  5 Oct 2026 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214105; cv=none; b=f9zgb+9edC+94TEfWarjbdDgUYHMY3FWHB7Z1LPjtlpNDYDwtuGQAAkcL3NWwAsKMYccPfC9zEDiBA6vb2jGkXN9hoF+FqwCKljHjVLIpYkwzVLI8MdK1SN9FDMXhbTIK2/bxLEFdSEWfYM1B4qqljA9nglwx2/i8Bod7Fm58SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214105; c=relaxed/simple;
	bh=bP8wNa41vTF/EzlVvpua1luQ5/51nOxBRkLV8tdWgQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMTk9stlEd22Jq9GekH8z3FoD+kVLdhRZBkxADwgsY912xByVhb5z5Yu52wYqOddEXl5eYmoqJhhyXx8ftN9fMT2WKAy2DyuMxJfSPLFKL4zluVgGP2BgRe1CUs5R7tGB35RIiK8+XKjuxWxfNBXmERLKm1KyKusuq+js8daIEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfAIATsk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfAIATsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B74C1F00893;
	Mon,  5 Oct 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214103;
	bh=Yt2cIxoQIfLnBunLQQhFqDYMawJbVrX8eYhikJaBfJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CfAIATsk3wvGZrddvArgJlaROWSHSJWAqpJ+FVI3dYxKXFIx8PGP/DMcvjkain+c0
	 Ujfnd8VBk7JlEl/017/Y2hkLLy9tSdYiWGFIrU2BvEjNpqSGTyC7E78BnGwc6J+gr3
	 roQC4rZ+14YmSNbzSdu2uM+NE3vRP64GRHzb2CaPC63Q4X0YsG+Zht3P86I1lzuAFp
	 2x44IxEEVy4eqZ1UX1IVmIuRcHjyZCIuadYRAyVFZXX7BiazcwPh9WZlwgbEURg1CN
	 q3wwQlUAyBrowvno6hvAkkb7XWhLyzAWp34xOi1XUGn4KCB70OZ/eiPkCs/ue0SkQq
	 LuuFqiyhVbhnA==
Date: Mon, 5 Oct 2026 17:28:20 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/3] airoha: an7581: USB support
Message-ID: <asPCFDMXyntAV6lx@parshuram>
References: <20261005105535.2472-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005105535.2472-1-ansuelsmth@gmail.com>

On 05-10-26, 12:55, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
> 
> Everything was reducted to the dt-bindings to describe the Serdes line.
> 
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
> 
> Also other unrelated patch are dropped from this series.
> 
> Changes v13:
> - Rebase on top of phy next

Pls fix the chechpatch issues. There is new blank line at EOF, SPDX
format mismatches and many more. Make sure you pass --strict flag to it

-- 
~Vinod
