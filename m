Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84FC3E123F;
	Fri, 28 Aug 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912310; cv=none; b=ZfN/Yq+IAbYW8/exKxNa8X78cha3metDSd4fuu3PIWIsES6VPi0KcUdErAQ82TdInS1Weiw9+RCM8glqBe2qJZN1CrrUTCU84+ZZQMXO/Ou+LBiJWUb1EaOu5Lt+T1fvvd07BuicfoRCS7eYIfdNz6pXGmA/oEJ/8ZgGcD3d9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912310; c=relaxed/simple;
	bh=IlWqcPh2rtl3tJGOIEOLBwQn/1Kz+C48PzQPxw4Lbpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0MEQQHDpn0LvzZWa6qFjQdzOmaa27vpJYBCFpjBBhzsqhdJCn9Kciy92RZ9YoF2jv3l01ZvhKpeogX3OslnzzO+OXRF9bujyTG8UatnCVfOlnUKJW7BIQdiVxtO/3vjYTPiufpd+d4nthKTuqdWGolod/ARmu3yX0VEClOvCAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UR5RSuxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UR5RSuxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8161F000E9;
	Fri, 28 Aug 2026 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787912309;
	bh=lEP6S/JxOxMJA/V3V7jNP3BYwfDMuoYMs28nDEqPoqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UR5RSuxSA1wl1tLqHPtuDML4qZQrFkzDGIYP2kmD2Dn5pmsrcMslrY+14onUJ4Ujm
	 Xiov+IwofZc4acRa07PF4bT/nqkU93HrFcfpT6pQ15ASVSOJVKhk/5F4swxSUrT2OT
	 qOgoFrIJHKXrMB2oro291+WDPnHFL/Hxf4sWu/Xg2MNV+0x3aw+qRdb45zVuvGeDEH
	 Leve3Y2Pkaqw1MkKLyDFa2XqrrfmGMeHuAPI90JsM2gQPmrdxQv9Dx7ZGIxgDMTGcG
	 ko2lcj9h56LIbD7VybIlFO5Gdq9KEPF0f0D3xQzXdyqnp/EhkpG8C82Y4bYqALV8sT
	 gZbXWup75kA9w==
Date: Fri, 28 Aug 2026 12:18:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Message-ID: <20260828-artichoke-cicada-of-speed-6e0d39@quoll>
References: <20260826072002.14357-1-robertbozik@gmail.com>
 <20260826072002.14357-2-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826072002.14357-2-robertbozik@gmail.com>

On Wed, Aug 26, 2026 at 09:20:00AM +0200, Robert Bozik wrote:
> Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
> sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
> and the standard SCCB command interface.
> 
> The sensor ships in laptops as an under-display camera, where it is
> described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
> the closest relative already in tree.
> 
> Signed-off-by: Robert Bozik <robertbozik@gmail.com>

Please place your tag as the last one.

> Assisted-by: Claude:claude-opus-5 sparse
> Assisted-by: Claude:claude-fable-5 sparse
> ---
>  .../bindings/media/i2c/ovti,ov32c4.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml

Best regards,
Krzysztof

