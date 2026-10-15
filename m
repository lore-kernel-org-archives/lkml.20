Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE0503BD1;
	Thu, 15 Oct 2026 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057099; cv=none; b=cKsa9S2s5TKH4K7Ta0FpiPj62jKIZCLXkql4u9GhXR9/qJCgr1XSRdNRHzjz0Z8RORwTWBijBahIInExSCrTR/26CnzU5PGSrMMRAIFvZwp87O8oPPPw/fP1fiRSMBUCEJh7Mi3ZueWpPVeNi4pGTFYNZN0BMeX1RW45aoVjkjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057099; c=relaxed/simple;
	bh=R0HwbNM3yw6MA9qVan+/N/kQ4ionO0KXSDenEGTQ1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMHSigKEHVfXwp0YFj4Dv7qCxEhxL2XXUlpvpLuY8JD306YkblN91LZ5osRkTtIQ6StsLZKwlgLCW4m/XRbwEGtX6mCncqdTqu95ElSdg36TPD6gD7/9esGHzVhDsqf4AoU9EbifX5HLRxPnRlYeyTaoaEHD7tnAYxHJYT/C8dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bey3IJW2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bey3IJW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E7B1F000C4;
	Thu, 15 Oct 2026 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057095;
	bh=Q0PAAtpfqzttWG1f5LYrAr7yktN8nw43MPKHzxwAt4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bey3IJW21QI+yOTzDhxPYg4X/xo1CxAKbgZQTgIXKruGk6Dpoq8i5NTzypRptaK5O
	 J10J+wK3QhkZasz4R+TxIBn3WasznOh/v0qNSpl/B8n0xZkukTaDgRoEIppDRWwqXS
	 jEfQ1O3TxLU+ltJaAKGFbrO7H/X8jmlIeERPDhL9cCeYNZ/TTYns9bC8eicEp23+Vo
	 CjFqVrrpjxSViDsgw6HXUtQqUI+5U2rYu4+cGwuFhSAElXK7GJ6skTQD8HdBzna8Rx
	 TIQj+ZTm3sbOfgiCZeFlQuJs9lzrF5ZPIVmCGWH8q25AuqV/rtTJcxlkT01hPo1pDf
	 99WFHzQYszNZw==
Date: Thu, 15 Oct 2026 11:38:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Message-ID: <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 02:42:52PM +0530, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Document compatibles for the RX, TX and VA macro codecs found in the
> Low Power Audio SubSystem (LPASS) of the Qualcomm Hawi SoC.
> 
> All three macros differ from SM8550, so describe them as standalone
> compatibles with their own clock constraints rather than as SM8550
> fallbacks: the RX macro uses the 'lpr' clock instead of the 'macro'

Why? Are you sure you are not using source clock names?

Best regards,
Krzysztof

