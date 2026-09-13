Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB51361945;
	Sun, 13 Sep 2026 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289196; cv=none; b=uKQRkjBA5fJF60t3ovXfRp8pdnTcgdwhFIbm5l8Bfoa2t0WSZwIv0xacJqgLTozPYQbNMWiP35qgl7lZ55oWTdnVeFf7XO0YfzZ2wLjOP9Hh9WwPSiKc9qSj2nQEKptTtgRFEb6LCYHky+JfJIMqBBZ5S/H8Dc/C53NI2W7Zzus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289196; c=relaxed/simple;
	bh=nsaLAUiP+Kk5XXUdSBv7ofjWEKUqY9SsBE5yWLZG3tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jm8OCX+ji8zTMFknduNRgLKGnTkxhzBtA/uV4tDrgdxudbErcej/nw92mkGm/Q3yA7mUcQkE5Ce1zsUa9CYlpVq57b+Wqz+8aQxJ6YgqM6LvsmHCnUreDbALs4mtQkBr0oazd6g4MzR+nLH0Q94TQXVWNucDGIox9ij6tQG1EBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0eaUeH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0eaUeH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D161F000FF;
	Sun, 13 Sep 2026 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289195;
	bh=S61zqkyGiU6S4DWSNDmAd84/Gw8Pr2V0jZxqB6HPvGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k0eaUeH+IIKrnQUOU2Bw/9c095ZQk4mBbbloAqSxDpaj1vBMu4X0bZKmwXVytE4Z5
	 NwH56RoX1Kq0yshi9wZBeI8y4fOGUMLEfGdy878cIXa/aqOE2lFp9ba/tYGQUflryW
	 PW9LBM1mz347zllFxlxbsqhnR9nrwSs6D6QQIHR3r0/+B/ZpKfkuieCgyqfD/noAPj
	 Ls4/0Q6yZu6aknzkda3WOZ+MmNbShJ/b3fTI7sBC/QvqAbS9gqulecz+QinMRLb/NU
	 DUunUJooznaMfFXN5H/A8I/x7AqKZb0vjbja+47pG6aP/kSLFGSSV4Vv4LfdHDBIi3
	 zGAWg7gFalsGQ==
Date: Sun, 13 Sep 2026 10:46:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] ASoC: qcom: lpass-macro-common: Add LPASS codec
 version 4.1
Message-ID: <20260913-illegal-quartz-raccoon-be0d06@quoll>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-3-fdd2129c696c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-add_shikra_support-v2-3-fdd2129c696c@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 03:16:54PM +0530, Mohammad Rafi Shaik wrote:
> Shikra integrates LPASS codec version 4.1. Add the new version to the
> codec version enum and to the version string helper.
> 
> The enum stays ordered by version so that the existing '>=' comparisons
> on enum lpass_codec_version keep working.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/lpass-macro-common.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 573b2145e..b52665b11 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>  	LPASS_CODEC_VERSION_2_7,
>  	LPASS_CODEC_VERSION_2_8,
>  	LPASS_CODEC_VERSION_2_9,
> +	LPASS_CODEC_VERSION_4_1,
>  };
>  

This commit no sense on its own. You added dead code here. Add this with
an user of that version..

Best regards,
Krzysztof

