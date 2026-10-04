Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0274400DFC;
	Sun,  4 Oct 2026 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149114; cv=none; b=QuUyyzSvwYv/2tbFlQsq1Cl8t5h+i/p1I4UdKFPpRhIOor66RRjuc6nzD+PoTGsS3kL1LwRQc8+KzcgLWIgT9/1gM4WBwOzEdtpapyxOrB1sdImD44+E9sRqpTlSDzmEIUOyT9SNY06VP14EcVoqh/oBwDpq4+Y4hUY4iX5V0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149114; c=relaxed/simple;
	bh=3emqJDnLbVrxMhQ6gvY69xZy2sU0IH1VxqwIV0thVJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6JfU7SY6PCcDC1NyHLYS3L59xAa35NTy5bxlT3LIxiSpBZYF6k1o552sMSYxCk8OBiRGogy6hszlnI4w0IJ16wxtN4oTD16fNfbWry/q6pZezuCNoxBjlh12nVtPf7z0n+Sf7zCo2MAmG0cDQoOOQvJPyYS08TOOSUBDiC/eds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZDqGbDM9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZDqGbDM9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=btCphvORn7Yyjc6QJYh3aTW+dRLKuqQVoUZI59S7zOg=; b=ZDqGbDM9Oax/oK7ECksMSNnfQo
	w1rQiT/npPF3JvokNixujHMAGG5uz73gPZ0A56TkwTW4WaBFmLROyOlwRh1uC1gRYH+iLU9nUYVwO
	9DRAjwl2Xrq1Hbzhkd5KvtT3f3uU8+shqIxBeLYm+lf6oEqVS8wzgePkt9z0jzFgTkNU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDThe-008wa0-98; Sun, 04 Oct 2026 23:25:02 +0200
Date: Sun, 4 Oct 2026 23:25:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development
 board
Message-ID: <fb944e1e-2386-4e5e-a2f8-8c0ccf66362f@lunn.ch>
References: <20261003194625.936288-1-2254650260@qq.com>
 <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>

> +&gem3 {
> +	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
> +		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
> +		 <&zynqmp_clk GEM_TSU>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};

No MDIO bus? No phy-handle?

   Andrew
