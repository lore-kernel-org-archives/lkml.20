Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619441;
	b=rWoYnvV8Q4qecqL7ujGsjhAe9rkjCoJ+iC0XvTlxd/nMSi6/lUFC38vY/oYgH7jfJ9in
	 b3jHseakPm+C/QF0P53geSkVOojwEcq/UNZ3h7zNOjRLpr4Duwv590RsvtrDCvrIdFthc
	 kQNUHIKYO+W/TTYEv+hCL0i4BHy2/5m+UTxQA6Dg616VG8Mz31Q7BuVQtdRQ7EpO+09ZV
	 erFQxsXkVpAL9q1/hjh7eX0yMWxQ7fxQZh4PRmagB+4xEl1hpmOYFkDTnKpTslzt1sMP1
	 GUHymoYhXxLPjL8Q68l/K7OS3p6PcY/B1Hv/LFrFUu82eKDE66VHGhCXKkyNI0Fk1ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619441;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MNiGsrHToyaVJ/zYmtsH9eEes+/+LeMLhdggw3eFzDs=;
	b=uAzbeAt6WLO3aZ5FwPxcLOcF/LOWIdrbYqVQC+BZMh5EeLXiPlgeXRSHKKoUlB6EPTYJ
	 8Wk5G7xLAjmh4WaRWWbQbe//FXRp8Fk1L1WSz+rgA0Gj4PvC83HKX2DM5AUvZt7clpvr0
	 051Yhzq4f0cyah1mPaCUNBWHZd21zKlxmlTRDQcOaCd+F13baM3nJeD3a7LxnQOXYJ8DZ
	 D7MKhPNQsFUArpoKGSFjnpmznszS/qLYehWzELW9fXiZM6XQECisR7DyD0XAPfBPvUv0A
	 REOeJ8Yb2+WE5GNhawz26ShG3Sfox9zzd717UMC4+uzDweFrcbz4xYIViRAqDt02Xyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHlkzm0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF8606A326;
	Mon,  2 Nov 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHlkzm0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336461F00A16;
	Mon,  2 Nov 2026 11:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619441;
	bh=MNiGsrHToyaVJ/zYmtsH9eEes+/+LeMLhdggw3eFzDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHlkzm0F7/JaL2mUzUGHFgDZVibnUgMdixKA/V3u1vAHt0hY7J218j5xyIr4QCLKA
	 drBt4KuOCz5qWA709Tp4lr9PTBvr7cbHNrRyea7z7zt/BDzMGKOW6s/qxmOWHo7h/m
	 FHP4W3BHeTTxo0bgaR22v3c2+AQn5/0DIho0ZW9K7gKEaLPz86N44smHRLRgJZB4U0
	 ycpJXhkTkX5LeXyeGymvOspy7bXOE9gsiIcVxuSKTqlBw71j1tErStVNOvm8Ne6CXd
	 y9C3g9/80RVbtDLQO05h37sRLGM32WoiupsaxTRVANzaDzQGHhXp9LwFO5+V5VhhEX
	 fORlUS0+J/I/Q==
Date: Mon, 2 Nov 2026 12:37:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: bq25703a: fix input current limit
 default
Message-ID: <20261102-thankful-spiked-agama-fa2deb@quoll>
References: <20261101085754.277830-1-jerrysteve1101@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101085754.277830-1-jerrysteve1101@gmail.com>

On Sun, Nov 01, 2026 at 04:57:52PM +0800, Jun Yan wrote:
> Section 8.6.6.1 "Input Current Registers" of the BQ25703A datasheet
> states that "The default current limit is 3.3 A", while the binding
> documents 3.25 A.
> 
> Use the documented value.  It also matches BQ25703_IINDPM_DEFAULT_UA,
> which the driver falls back to when input-current-limit-microamp is
> absent, so the binding and the driver now agree.
> 
> Fixes: 76bc2203a46e ("dt-bindings: mfd: ti,bq25703a: Add TI BQ25703A Charger")
> Link: https://www.ti.com/lit/ds/symlink/bq25703a.pdf
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

