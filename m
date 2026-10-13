Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3D37C916;
	Tue, 13 Oct 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876716; cv=none; b=GftAqHDnH/vHpzbiGKK+keeikTFm4p2LEsvoGvQDBymARH0wuEmSTXAXlJJWfKsLrwDG25PO1iemGU8kyS/2tc1DHJnCdth4GA7bEwX1ifdB6Krbiixa0yi4MT2x0XNvo5Tufvfimik8Wh3G4UsviwJMoNLm/yuoV+tMGcA1ubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876716; c=relaxed/simple;
	bh=sPJmlwD84hnd15C4YMmoNdd6ipPIKkFu9xK0krevNxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFuibfb5TflQI3mXAf+sZtS1zOyfR5QoMs9h0qqKULNSsqte9pHFFyf8JoH0W8V2a/BPWqe40amUPS975GsA5qJoJCFr1jny1xSk1vdZ3jmhFpnk74ckUeikE1cME8VD4N5NfJABp2n5xcrMjf968ArtTp3ml77mt6bCCC89Yn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K11zu38P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K11zu38P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA5D1F000FF;
	Tue, 13 Oct 2026 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876714;
	bh=H2cpIlZWVloEX3N2xZMYGarwcqerPETDbCefslbFSUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K11zu38PP1rUCPb3sidr6HojJXbELy5g+Dkr83EHPsIqLA5J4RxSFXrVQm7XpN95h
	 ARVCrckHQxMlEdlYeeqME0etYHJdo8eeFTLyjVVXqJ8yiratV68+YFsa1CIE6BUdXd
	 A/ylDUgd1hHbk0qjob/89w9F1Foe5p5UwhNMnKP4IGUPL5v8KHNcMchfDDmnGIoJ5i
	 MSRTZXnEiWWu1kURvw8lbfcBFoKG8H86NiKxdyJwK0d4jSuRtVZNkG7Bn29KrYfHmB
	 mBcx/5jNcHUGjX3hmhEgUA5YFQyepiv4hK6Zyz1JAxSF+nkq2kBptjtZsvxJfCDap/
	 ZUxbLb+rejtBw==
Date: Tue, 13 Oct 2026 09:31:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 2/4] dt-bindings: arm: fsl: add compatibles for Skov
 i.MX8MP boards
Message-ID: <20261013-tough-lionfish-from-lemuria-1e47ed@quoll>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
 <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-2-0906e57486a3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-2-0906e57486a3@pengutronix.de>

On Mon, Oct 12, 2026 at 08:30:31AM +0200, Steffen Trumtrar wrote:
> Add a compatible for all revC-based Skov boards with a touch panel.
> 
> Also, in preparation for adding a new device tree variant with a
> different 7" panel than the already mainline ones, also describe that DT
> compatible in the binding.

So what skov,imx8mp-skov-revc-touch is? I asked some revisions ago not
to add generic compatibles.

Best regards,
Krzysztof

