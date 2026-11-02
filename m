Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648631;
	b=Ix+VkO7MuEt7XKyykhfJcWDHzHoQ34GZV7OCmXYztEl9C/ybsx52ik/nFCSYSaaoxsEh
	 4QiHsSZtD6xqsJNiUKmNAcXODn8rz0D6o16sgHCo83mj0cg6N0OxQi+OehJb7aflO4OgB
	 bPya6ZM9MQNfGuQjySUW5RhEegxiPqvrlCOQmt7OK5q/DgY0BXeSGsRgBmMf8qCQbnn2x
	 ZZlmjDYeeExXG/1eaUZwanw0Ey7xYppWNCIBKs2qf8uSn7HbkeWAuHkTJLP98oGdsG0H5
	 b6y/xrc4oPpcRMV60uoj4OUQW0u4o1dQ1G7esME01d2kNCVK8ud61LoIHz+/UmJiiKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648631;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bNXMc6Fqp3PDxjL/dRqblzNk3YcAk9DQxRLdcWrTbog=;
	b=ab8g4Gwzac5EQSgR55HPHMWQ+kHY7g5PC/Q8K5/I6/6T7YPrnUAPbl7ZtcBIiQUb35Jo
	 v4CYjJaoDJ6Jj3TciHZh/XFPY3gaVbaJqfpxytQhwTUbbTVX7+6oPdej0hSSV73/78Gve
	 HqmKRotrqM+DCVX1xTmW1tzPwnBejbThvAp4te3lGzI1I4WW5Z40bbbwqYRaWRXENcJkz
	 IBPTScMJWwLo4TDjLJ5SkHv6Z6jDyUxcN0oXmBGb3u2dwxIIUFWilpTWW+ZGGeP2msgb5
	 7/lbAArh15rkIc7sboDLENCqC5zs7hKC7Hq3FKMCPa+MxbCfH7O23vIkulHqoKFOU+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNu0g4i1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A89606A327;
	Mon,  2 Nov 2026 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNu0g4i1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC8F1F00A16;
	Mon,  2 Nov 2026 19:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648630;
	bh=bNXMc6Fqp3PDxjL/dRqblzNk3YcAk9DQxRLdcWrTbog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNu0g4i14OLJCP3bifErYOhzW0NxuOhO1LFKwxBqnlctLn49ps/UMYD5U3l1eXnzv
	 Y5bRkfu+5B9i4wyBWeYYq7mU32DQlxlRc3UHOhrAgPnGukF6f73X894GUXOCU6EC+2
	 LgXy8g6Ho6elBM2HtqPHCeIWVISQYXn7tFdTlD0JlkPzpGdV4c+UiMgPHYlaoKpTXw
	 3TjIFE7Uj97v6Oybknj3DK0vLed6wrMRcDeALXsvOkme2DKlJa7qvoHGhCeeUPvFtr
	 /hhIAqqcq+tO2Z+1oxJvGx5ivVcIqWA257941QkxehNOqhVQL78CtbAvaLRCm/tRpw
	 19CCFP1aR+Xyg==
Date: Mon, 2 Nov 2026 19:43:45 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: add the FU740 CLINT
Message-ID: <20261102-battery-patience-0c6d810c33be@spud>
References: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
 <20261101-b4-sifive-fu740-clint-v1-1-b4821199a733@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RC9Cs/46Lsy1/De1"
Content-Disposition: inline
In-Reply-To: <20261101-b4-sifive-fu740-clint-v1-1-b4821199a733@iscas.ac.cn>

--RC9Cs/46Lsy1/De1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--RC9Cs/46Lsy1/De1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujn8QAKCRB4tDGHoIJi
0hLLAP9M24vz8ap4cClkIgkJN4frJuXgVA8Fg5ec95KS4e33/wEApywaPJCZO3Q+
UjQJhFVsS1X96YEbVNVFD1l9MsCfIAA=
=712p
-----END PGP SIGNATURE-----

--RC9Cs/46Lsy1/De1--
