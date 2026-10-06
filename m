Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC42F84F;
	Tue,  6 Oct 2026 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287151; cv=none; b=G4tEjmlPaGvbeOjZHY8mt7LIoJF/+nWNVMXtSkCMjlDuovobHs023GMNYeWnOTUOOegpiZnsJjCkDnXO6MpJ5+ggpU3jYaUmieRVycU1li89+j7N4gRE9vybAqn9me8lNfEHhScV3xjxDVNHhjEhLKpQGTE/UCcuwdoTQQwlEeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287151; c=relaxed/simple;
	bh=7XY1Vu2jNjoaRkJvi1niK2qRVCbEy6UUgTYddR9QZgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqaq13ItJmaMAboN513T2/WlCRG4EqokWL7qd8PltVrmVMa2IZLJi2AyOzbdLsvflCTyjVuLa6gaWEE2sK4R6XUYxLO14mW0Mr3xE84gobRBxRGwb0SBTwvcyP+bTc3LL9ynSqMSEDprsmMNmCPMpgSOl5M+cI/iGoEGa7Dd/3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7kDSKvA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7kDSKvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D0F1F000FF;
	Tue,  6 Oct 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791287149;
	bh=AHb+aEEMDegJdLzwVyM5oFwWM9z38LtHJ12r7De4yxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7kDSKvALCG2R70YxmgV1qFZe78g22cHn9sQQEur/eiWJmqB47/9RuoQ2iEmQNssL
	 DkFOmEGC3zazj0rtHo9cvEGty0ZaXaU7VtmTDT13JKtqyBS//XYMcQMcNePuR/2j/j
	 R/WPqE9g+zduWIWrsfAqFawskuYwXIJwkSKKInihix7UlbXE7O/lRDUNC6EZuo7FjR
	 6U0sA2ed20WJFXBQJcrcU1v2jGh8G5FE40QZkUEQvMCsFCytOWKql62jqNcUjuCTUj
	 ZdF5lAapzfUvssZqTzsKj/whaPo7AZVCDdzhgrfsDeyAFrq/PIRlcjbFBfdsGiyH4f
	 ZSDSZ1D47fenA==
Date: Tue, 6 Oct 2026 11:45:47 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
Message-ID: <20261006114547-GKC2079@kernel.org>
References: <20261006100000.548264-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006100000.548264-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 18:00 Tue 06 Oct     , Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and RV2 stores the MAC address.
> Assign it to Ethernet, with ethernet1 having a MAC offset of 1.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> Changes in v2:
>   Remove Ethernet alias changes.
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 6 +++++-
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
