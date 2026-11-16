Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830954;
	b=hJYI6IOFPwnYLlvBk4/MNVmYrz/gcwUKikju4o4uXiIPHUtL4WfDQMr5NYhI9xw8j6Cv
	 M4FVmfNDOOinBI9HJ77nymSsTB2qLL8tIFPk0BpdlTmPINpOfScFxRBam/3ewYXqkd213
	 DZdlDQSr1r4HekVUD1k5vq7ITrS2Hvyq4cGH17crkQR+lVD+TztQv8ytrGb+e8tjAW7ED
	 l9dw6yPH7r0fyck1hGDlXnAvYDX2MdpMGZ4BsqGY/pnyYxzfYy3/8WKXm8U799qtF9e4W
	 +jY6Xk2opFlG5oysfu7NLIRcyLdB7IHIai3i9X66Zr0waObVMdpvk1eXctrTuxGkvpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830954;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DQKq9lPCCId726jGcee566wmkBRqcENP2m1ZlEIDRRI=;
	b=HaRf7yXupmLxwb0PAc/c4/qGhHYjUFUWWLFrSOBk5Al10JSVNKn0i/HE2IHN+pgVsPFK
	 gJn7MXtEVEWdYxR8Ey62QSqzBbQIrgFsaozlXjRBKkJC4ZGL/Eh+lgUlricOF99jWB3VL
	 HoYoNyUioSQ0uBJ07/y6LS2o1Goez1yXccXRupDFxDXoTAR8ufXt0HBr+nRymBwwc+GCe
	 7I8+fll14euaKnDnjaODeMqdZ2/hNEFkrTVtGDlpQy8rHe06mU4pVP6rS4zy9/kPNumHt
	 9fAy18cYPgxQkLkwABvAkaCqIklEbLGx0SBdrEeQmQYArPvLOUkg0PpVZocY03jAUhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LO/lEcBX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B6606A31C;
	Mon, 16 Nov 2026 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LO/lEcBX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EE91F000C5;
	Mon, 16 Nov 2026 12:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830953;
	bh=DQKq9lPCCId726jGcee566wmkBRqcENP2m1ZlEIDRRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LO/lEcBX3lG7Ap1r7tIt8PLK9da8Xr9mc8E0uq8Lc5jzEQ26whxR8ijBIakoLZ1Pe
	 ArInzvClG9kXwFIzsQB4HiqeXguS0HYLw+Hr0dOFE1mfyprfuxdEeOA7zWmP0uu7qB
	 zPliXtw7xnzdpc0egZeA48qFm6b4d1bb72AVlfHqXbTyUG7Qhotdr3RBKw3Rvc1muC
	 LwWQKgEdOD9c2qI5HrRgGnZS4UyuayEkmTrAUKG4nvVpWYXyGgmCrOTRrbj2RvoarZ
	 PG9TXUiGpovcBx2y8nCNfm71gH5dw76EC/sNbPPg7a67FovFtpa/pH2VHqjPC70TlC
	 vm6en5UGMhfeg==
Date: Mon, 16 Nov 2026 13:09:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
Message-ID: <20261116-vegan-amphibian-muskox-3c8a55@quoll>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
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
In-Reply-To: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 01:50:22PM +0530, Nihal Kumar Gupta wrote:
> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
> binding.

... so this was never working? Or was working but you change something?


Best regards,
Krzysztof

