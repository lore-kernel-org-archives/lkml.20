Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23356511C;
	Tue,  8 Sep 2026 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882214; cv=none; b=IVr8vevbWb6R/GyPMK/XjedT1/kBsOmLGCpQ5LFFdfWOQ8oJzbB4AbQU83FR8pgaKa+kETf33crKCMiiZgThWc9TR+6CBbv+9hYSXpa2tJTpIGWrXj0bgKHWxmz0j+8oUskK17I+EBwG3f1loFpH6m/T9pmq2NjSUnPEnRB4Zg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882214; c=relaxed/simple;
	bh=vIEGeOZUzsykkPDscIatc5dhymUawWaQUcyRFICynD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VirN1uojMJT+XMl6yHbm0yudVKc3KEdgDqDLGP33xPxJ5mW45GndtIP5pagiZdd8VwKisqz5IvjgZUsPT9n9Yw9XHdKNRJZXkN7kkOECPg3i/47U7zLDn/9AdpyzgLDElVzOkQ+bR/QwPrQL58so/xCMa7DSWdNPhddMBT2353U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJTAzR1x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJTAzR1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733DD1F00A3D;
	Tue,  8 Sep 2026 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882213;
	bh=ODv2oVQ+zj8LzCCwIIMj4+ozkkVjMeRgl5H0fCblGLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jJTAzR1xLe2+tbJ9A7apNobRbYhUzmETYEpovrhxNgPp+VwM/urv5SsSEij/GPo8X
	 hYhcyYJ5ROxyn/GqkyRygWjc1d4NxKbY69fxN9GcF3EPiL1Uu0cIZRYxJdsTaKD//A
	 Ypl0uKD3xFFpYr5e3PIliXszCvPgyTdrFw7/BDlDjnws5K3/J5A6RYcMT3SvqyY9j7
	 C0qlrVBnQPbeU016NyiBKn5bP8Fa++AskBwjoRSJ5LIRmvfcMW9aq9x4esrYT+SR5G
	 qHxNOmulL0F6+3BE/AyWcE6A5B7iCT9vuaBfKrkcm0a2hYDE/+/bg4Oa378kjOffIS
	 RXgdTpr2cjzeg==
Date: Tue, 8 Sep 2026 16:43:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Add CAMSS support for Qualcomm Glymur
Message-ID: <8103069c-d774-4303-8366-11059e462d84@sirena.org.uk>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yPw+0TGEn0HbTJ9A"
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
X-Cookie: The world is not octal despite DEC.


--yPw+0TGEn0HbTJ9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 01:43:36PM +0530, Nihal Kumar Gupta wrote:

> Patch 1 depends on the following dt-bindings series:
> [1] https://lore.kernel.org/all/20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org

Qualcomm people, could you *please* stop sending me serieses that can't
be applied.  As previously indicated I am getting far too much of this,
it makes everything unmanagable.  Nihal, this isn't you or this series
specifically, it's been a general problem with how Qualcomm is working
that I've raised before.

Resend this once enough of the dependencies are in that it can at least
be applied.  Reworking the series so that it can be applied without
other in flight serieses would be fine, even if it needs everything to
land in order to actually fully work.

--yPw+0TGEn0HbTJ9A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgLR0ACgkQJNaLcl1U
h9AZAgf+LfTfUWipFC+MxrZIf/omzw5XlxIpLtxDgJRAtx16M+Z1GI7gwQJfJOM7
il61Fwq5Kk1MhBLaaK643iz0rUo/780ML2AxG/kUCElqYqkefzQc73hNPz+aNwyE
ch4qnMU75bdlVFykQ2ZW7zltNG597wHo4PJTQv/2iYQWgwx3BUYKquDn/tEhnTF/
+HCJvCov4TwITSLj0u34BxghM6Tjrp2uFdAVFKpsDboT3s1CGhIGS8l37NTiBvR+
8WP9W/NZ8ngjwl4ctH4V5YjVtplJiOP2nZcDsnrnItZqq0Xs+MxFMBTZBNHr6MT3
DOPZSwbyrcfF5hKDPdvHRIW/Rftk3w==
=Y05L
-----END PGP SIGNATURE-----

--yPw+0TGEn0HbTJ9A--
