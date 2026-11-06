Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975730;
	b=jtPCkNQ/EsQR04hfadXKA44Vb4dUm/pFX3YfkrqwO8y5sX+X2Cf/EMs7xUhUEJomyYEW
	 hYsaWRc/xhYfW+64tePAa8RFu2Iv7znB/b+2pyxoanB1ZjwAUpCy4yCQUbSsGdfZqiwL3
	 0R1XIoT/hE/x3CkN/BRVjMHqrXF7ze+CO7oWk2wISJIU5zb5xHBp8yBPtsE8D3cMoYDCo
	 vN2UUXmxH1Vayo4Z975Sqk3Jb1NhNVq5b3DUM5wKj8KukXfNLUPgTkBvMbOaTnzp9hJfR
	 MMViluJ2u04nRroH0ehGu8Dhk6mJ60A8jdgLknmW91i3UNb1P6/34NiocSoOoRaACtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975730;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=j9rl6cAtzkVeL7f251gRSUgdb2HJBPFNGDhwbgmwORA=;
	b=R/BpVIOw61NvNUS6ctUlvdR4SmJrwS3FUN4UIn59TLlnaUyKhdEQT6TUPmLtDTL09gue
	 YarlM2ZFQHRbleEgTud0KDD/3LRBvnMTAEufzEzgk4IXDEqKJdhecsmQ5Ot8j1PepckPV
	 3mzyiQCZKDKtmeVmIJPEIM9EmFIF0NH/wVkKIl757dopOBcBvCMJ34slwncyJpmjgYjrF
	 oPESLFss265ixgGEkvS4ml+jKGvpNphsj5UKhJ18GjFGirG2KC91LKnGb9UBfBwrEBY/2
	 5KMspTqp9NcsJO+IQUpimMkV4aonRyEI0GPPh0KYO8GiDk84yiu0wpymelACq5CDv2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKRxpaRR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F105A606A32D;
	Fri,  6 Nov 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKRxpaRR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325AC1F0089F;
	Fri,  6 Nov 2026 14:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975729;
	bh=j9rl6cAtzkVeL7f251gRSUgdb2HJBPFNGDhwbgmwORA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKRxpaRRKHC7Yqg56ssx9977W/1UnuJOSCAZan8ZJTDdqutnCMvA+7Uwc+YMac2+i
	 9DaDBab5Q0BnxM4X7bteN4fdT630TXZaTRII0SOkHIFLYaVe2XFWrLn5BM24vT/ps1
	 A2kV/QjLXf9o5quG8hpIPSeGyvbuNW6YmxnKT1efJEc/44J3BpExU3wKj/SjkqnAeu
	 /PGbzQDrHEsUDj0+AZjp9LWl5vSWv2o27H2MWRcQRclHQm5j021zZbOqulbYm7P7P8
	 1b5Flm3cSCixeCb/TeoJhGDc7u9Esb7BzvhxacJRbI6W9pQYcI78VUmhVxnDdQIdFf
	 A/7gPSETYnSFw==
Date: Fri, 6 Nov 2026 08:35:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	mfd@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
Message-ID: <179397572507.3191542.9647190975140317297.robh@kernel.org>
References: <20261027114634.79706-1-clamor95@gmail.com>
 <20261027114634.79706-2-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027114634.79706-2-clamor95@gmail.com>


On Tue, 27 Oct 2026 13:46:31 +0200, Svyatoslav Ryhel wrote:
> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/regulator/max8907.txt |  69 -----
>  .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
>  2 files changed, 283 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

