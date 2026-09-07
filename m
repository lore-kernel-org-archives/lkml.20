Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C94483A9;
	Mon,  7 Sep 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774384; cv=none; b=M6XszpAq+Q4/2Mbsutx4pWzx01QqL3F3xGG3SvDTO9gUfmipRQug2D9TqhRg3pOZ18FYqo7rz+TC+Sx5+Ya6eQ5mIwVKFjS3dH24bUipLOX+MH0PvaV3drKW68m6oRRtrEaEsbAq+ZKXPiAhpH5dARGczqUzNIPlxwcThuPy7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774384; c=relaxed/simple;
	bh=nGTvvrUiHp0b1HJJHXA9pXkPc/mOBhA29s3WwxJqep4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXRYNN6LS5mrIfd+Tm5ydKLErWjTjpFJr+w97WHbxVDlyJtWJXWvZRuX7HapG+IocuMLaVJx9usM79/mTSdbgoFcsdTXfHV24ndNjDhH7O4V2qx/bIPzxXQhBdJjc3SKUu7JfNNeAIoxPVMLbhrkL0aCu0TKrUb2c/AAliYRVjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jqBAko16; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jqBAko16"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id A0BBF1FDC8;
	Mon,  7 Sep 2026 11:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788774380;
	bh=2A/Nbd/sgxzMN3+ZeCUQZmfzW3dZ/qRtwKK82swN7eU=; h=From:To:Subject;
	b=jqBAko162TWMJDxFqoY9VWo16uH8wShA8f4jgt5mJsuqzneYMm3R4YrZfC4hUCtgY
	 SRldY8Gfcq/P0tCxwMxvw1lZCT8eV7NqThugNKHoiVrDtenovKJrMIs48PxdRMHHoh
	 1IQo3jz4fzRUqtyj0Pmb3Z705ZAcXvTtJ2FcXibo4g6xaQMl1gj5vpYAo1zg8lkmTl
	 gJXBCbwlenwJgkt5FKPGe3UI4huPN77l9awcwdjpWddUDOYX1WBVc7SO5m9ubQriWV
	 Fy0kHJKHHg2nyhqbQJmpzSV7AYuJSEf7RNnRi2IRDkSL/ABd5SG1FxJ38JuJv73QkB
	 eNrZpnzPOfNHQ==
Date: Mon, 7 Sep 2026 11:46:16 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Message-ID: <20260907094616.GA53628@francesco-nb>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>

On Mon, Sep 07, 2026 at 08:47:19AM +0200, Franz Schnyder wrote:
> Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
> is connected as an SGMII Ethernet interface.
> 
> Enable the reference clock on the modules and enable the PHY connections
> on the supported carrier boards.
> 
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

