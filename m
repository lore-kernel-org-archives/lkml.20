Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72BA501F54;
	Thu, 15 Oct 2026 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061003; cv=none; b=FGtx16dAa/XRlLHpM/l6R90stIX9vlDu/eTrnyQyt5D5M8Hsou4YK9styJGsJdSamHMaaCRqCwxUEV0Fd0wTmIe4G5f3jlWSCSh2Ff1kgkYyGvjeCjnfCsRI36DOTmzB0icIfGypsKb+zIzOMOhF6SCrxNWBr+6PoYD5APWhaXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061003; c=relaxed/simple;
	bh=gNAgCrDXiHcKh3bvU4xI94vQLQYP8n2MwlRexIbGYG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJIWwYA1nPCBZpCY9yDDHUHj9sEKjl5/+XKUTNzM9dkO0sLd3JLXsF6JJATqZeRivdZyFQn53WYnMt1ojpMjhMeCw7OHmcdswDn9Wzu0joyatm99l0LfrvBM7yGuJ4Dn09EqtlonbMpv1Xs/vMdLhPIqRlqUo9pv81eeNEeIAoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWBCCnGE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWBCCnGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB801F000C4;
	Thu, 15 Oct 2026 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061002;
	bh=+6J98jFJTwRMifVHffr7SbGPzFfg736+OUmYg+OQlxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWBCCnGE4T4aMVZveo8xcJT6qdgZ5ESujK+wNPZTGN/cH1V04ycWfJEZzAmJ+c+23
	 AkOvW012lqRyGr1Zow3BR0eLyp4prgOZHVt6/pVbCdqqeqdo2QrGDOzcc+KXF+c7gY
	 u+dM9cRF5AndKOR6s/9RSPeCooOWk8Aslkk8TedUclhs7fsJtdhOcCHk3lTDc4MT5j
	 Y2ds/n5MXwUS4L3121yRQ8yQpjSQ3zkDpdLUoNXDlIfPP5arP5BMtSKghulfKk2I/g
	 TmxbQxzY4yrd7ramXpmbTaVYNYEWVsQ/ds4h46P0IkzIN4xpNVFdFDY2nNAYvXV10B
	 f0iUcmn4qYS/A==
Date: Thu, 15 Oct 2026 12:43:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add SM7250 compatible
Message-ID: <20261015-illegal-elfish-hyena-a3b04c@quoll>
References: <20261015-qfprom-sm7250-v1-1-2401e54253ad@brar.si>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-qfprom-sm7250-v1-1-2401e54253ad@brar.si>

On Thu, Oct 15, 2026 at 11:50:40AM +0530, Ishu Brar wrote:
> Document the qcom,sm7250-qfprom compatible for the fuse block on the
> Qualcomm SM7250 SoC. It holds the GPU speed-bin value that selects the
> Adreno 620 operating points.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

