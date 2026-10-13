Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453463DB620;
	Tue, 13 Oct 2026 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874876; cv=none; b=JkN53Kb19BvqEVC1uHyHuZf31HzTgSFUrBrqoRwznWhJeG0UhrTfnEN1HzqhIrYtLKP4zpPcdCsLNPBmvuz5xyFYxaQU59UvgUHzZxUlPa3IzvIoIxCd4FTa7DLT5Rt1fsD8MRzQCcp/aOvIVJhzv1rbV2MJsx4RBxAO/J/tnps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874876; c=relaxed/simple;
	bh=dg9qupcEHrhYb1J+oPV/YrQmEv6l8/l0Q0LndazHQ1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkYzqc+Xm1ez79EkTHIcTyMGlgakeoiZDa/16TB0U//qBmTNXCX11SU5iKNGwaSUSID+vXCJ1H0wUExjQZVUI3zR3X17rw4znDvHPvyTNVE5WdLpcmfC9BADb6y+kuQ0R576FocnrEbQr6XV734sLh0YVc+6mCDGBDFkCWSI8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I19Y/ZD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I19Y/ZD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CF81F000FF;
	Tue, 13 Oct 2026 07:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874875;
	bh=LM9iJk4mh3/UxpN7ZEsQZ+FE3MHzMPp3PV2jueTNYck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I19Y/ZD6BA36W8BpvA0CW/zPEgxggpYEPttXAeZTFdsoZ3cERAjcSfXQ0QJaUzsu2
	 ppGejED5fCcY1Unch7HN5bagvna+UcTGfhCB5qC3EW4uOvJbPjLljt/yFeEwIcykX6
	 ArQFMZycYQbSxue0OqbslDPRVZb1gniKJXWf3S9f4PhE3D29mQWhRxB5GU1qEk5xhO
	 KC11WhETcSDs9NCbsDau2y/Qvg763zMZ7fMhWue+UPSfVfLYXtcohXagwrb5kvkNYk
	 scWsSKeD67TKkar4Am0qvELEoE2PlOLOL2bEvX87mCmPpI69LChhZVqylqCabcYUOk
	 S2rUQEIHDTyNQ==
Date: Tue, 13 Oct 2026 09:01:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Message-ID: <20261013-supportive-imported-spider-c6e28d@quoll>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-1-0c1897f21ccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-1-0c1897f21ccf@oss.qualcomm.com>

On Fri, Oct 09, 2026 at 06:42:47PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 can use an external system clock supplied on the SCK input
> pin. Platforms that provide this clock need a way to describe the clock
> connection in Device Tree.
> 
> Document the optional 'clocks' and 'clock-names' properties and define
> the clock name as "sck" to represent the external system clock source.
> 
> This allows boards using an externally supplied SCK clock to accurately
> describe the hardware configuration.
> 
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> index 1f0e6787a..1b3803518 100644
> --- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> @@ -21,6 +21,13 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +    description: System clock (SCK)
> +
> +  clock-names:
> +    const: sck

Drop the names. If they are needed for any reason, then use the same
name other device uses already, so scki.

Best regards,
Krzysztof

