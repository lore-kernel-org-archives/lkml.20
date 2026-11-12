Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474227;
	b=UaVlmWo7cNNUrsOWRVleetX4SpBlb9ciQpBFjd9tWSLAZqN36eChjG9P0iLMjJuW68ly
	 YGD25RKUxFDr98S2o8ZgE87QRtU3lUjtGliXAda1OJnsohp3bn+WrkZgISVI2zIuuQ6tJ
	 sRVTn/MCTp4FLtUuFu45OKm75+euGzLHjNJyUKcAqXtT2WUdV55eMx7qq514e2UCZ0MoS
	 jWUt3qApmOJNNaMB3usY7tuff8/PldvkmbpIqFy1kpLxnaMUBJQBt83Lx6GQUtNQtgWNY
	 nmbMTUUlErgcGUDiAn+vM917xkbiygusd03ymxvEbSciRywn3Pl2KX2F2yP+whhgC4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474227;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=vXl5m73IC1Qj9DQkgemcl355Soy8bxLPr8ADXHnlPs0=;
	b=Wu3ZD3gq3ycHM+UM+0zLZOClyRD2TC/EJvyGUINfvlp5nFtprDjGDvfR7y5iLi7dT5yT
	 zZA8PV7D69pqZwHtUu3JRzYo4UtOjqtw47AgHrxNPxsQtXA8o9MY/JhyfZVZ+810WdZqW
	 LmzDxedRd+Ea6i0+4E2utQ4SaCNjjBkmnN5fKJPHn13Giab7tFfoAOjG0fGJlDUNRcKfE
	 onlt6M9ODVxRYts8XpBeUGY4UY1bqAHlSdvIBb5JlxCvhS2eGNT5nhJIIiAa6ZHOYi8TX
	 15MjjOtTLR6fnqOOe9SIu1qVBq/TkoViV02SdLjXZFP9F4yPaDKaHuoJwclVZKyEvUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oO/wsfao";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C360A2601
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oO/wsfao
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C271F00A09;
	Thu, 12 Nov 2026 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474226;
	bh=vXl5m73IC1Qj9DQkgemcl355Soy8bxLPr8ADXHnlPs0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oO/wsfaoYIUlyNJL3r5/8ieWCg1w9lIqjxjxPPbrU4kRaY7gEweaXTBdQKwjVsmOt
	 4f2Trpu/65POQguNuQK178OyPiCKuuN2HEf/q0sMfyC9N6nLaKnD4IokeQGbDFvTus
	 lWePLSyaOS8F4M9YUmF7Wzx0J/K9XTCU4sZ6r9gwRfrpogppH5EtVuRJLoeQJCVpSD
	 6BfcN7eyc/KO/JUkr8eMYtTsG9GJ79j1TbeHPK5sMHYwZ4aIEvPrXx5Dc3Quj0ozPq
	 h67r49bx6RQhLOh7SHExZdGhnR4nhxcrWXCPY2B6T7dz1DBQAs+w8sU7UXbeOo57YV
	 LyiCAAWPdGBqA==
From: Vinod Koul <vkoul@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 =?utf-8?q?=C5=A0t=C4=9Bp=C3=A1n_Daleck=C3=BD?= <daleckystepan@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001151939.23658-1-daleckystepan@gmail.com>
References: <20261001151939.23658-1-daleckystepan@gmail.com>
Subject: Re: [PATCH] phy: marvell: a3700-comphy: Guard missing polarity
 argument
Message-Id: <179447422457.428158.9677225220979087471.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:33:44 +0530
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Thu, 01 Oct 2026 17:19:38 +0200, Štěpán Dalecký wrote:
> The Armada 3700 COMPHY binding specifies #phy-cells = <1>, so PHY
> references supply only the port argument. However,
> mvebu_a3700_comphy_xlate() unconditionally reads args[1] to select TX
> and RX polarity inversion. The PHY core does not initialize its
> of_phandle_args structure, and the phandle parser fills only the
> supplied cells, leaving args[1] uninitialized.
> 
> [...]

Applied, thanks!

[1/1] phy: marvell: a3700-comphy: Guard missing polarity argument
      commit: 24314440a82bd2bb66049af4de8f89939a1fd77f

Best regards,
-- 
~Vinod


